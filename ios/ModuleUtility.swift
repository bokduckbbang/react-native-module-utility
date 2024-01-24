import AppTrackingTransparency

typealias Resolve = RCTPromiseResolveBlock
typealias Reject = RCTPromiseRejectBlock

@objc(ModuleUtility)
class ModuleUtility: NSObject {
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
      return true
    }

    @objc
    func exitApp() {
        exit(0)
    }

    @objc 
    func feedback() {
         FeedbackUtil.shared.selectionFeedback()
    }

    @objc(beginBackgroundTask:withRejecter:)
    func beginBackgroundTask(_ resolve: Resolve, reject: Reject) -> Void {
        var identifier: UIBackgroundTaskIdentifier = .invalid
        identifier = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            UIApplication.shared.endBackgroundTask(identifier)
        })
        resolve(identifier)
    }

    @objc(endBackgroundTask:withResolver:withRejecter:)
    func endBackgroundTask(_ identifier: Int, resolve: Resolve, reject: Reject) -> Void  {
        UIApplication.shared.endBackgroundTask(UIBackgroundTaskIdentifier(rawValue: identifier))
        resolve(nil)
    }


    @objc(version:withRejecter:)
    func version(_ resolve: Resolve, reject: Reject) -> Void  {
        guard let dictionary = Bundle.main.infoDictionary,
            let version = dictionary["CFBundleShortVersionString"] as? String else {
            resolve("")
            return
        }
        resolve(version)
    }
    
    @objc(getDeviceId:withRejecter:)
    func getDeviceId(_ resolve: Resolve, reject: Reject) -> Void  {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        resolve(deviceId)
    }
    
    @objc(getModelId:withRejecter:)
    func getModelId(_ resolve: Resolve, reject: Reject) -> Void  {
        let modelID = UIDevice.current.model
        resolve(modelID)
    }
    
    @objc(getOs:withRejecter:)
    func getOs(_ resolve: Resolve, reject: Reject) -> Void  {
        let getOs = UIDevice.current.systemVersion
        resolve(getOs)
    }
    
    @objc
    func requestTrackingPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { (status) in
                switch status {
                case .authorized:
                    print("authorized")
                case .denied:
                    print("denied")
                case .notDetermined:
                    print("notDetermined")
                case .restricted:
                    print("restricted")
                default:
                    print("default")
                }
            }
        }
    }
}
