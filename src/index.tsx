import { NativeModules } from 'react-native';

type ModuleUtilityType = {
  exitApp(): void;
  feedback(): void;
  requestTrackingPermission(): void;
  beginBackgroundTask(): Promise<number>;
  endBackgroundTask(backgroundTask: number): Promise<void>;
  version(): Promise<string>
  activate(): Promise<boolean>
  deactivate(): Promise<boolean>
  getDeviceId(): Promise<string>
  getModelId(): Promise<string>
  getOs(): Promise<string>
  secureActivate(): void;
  secureDeactivate(): void;
}

const { ModuleUtility } = NativeModules

export default ModuleUtility as ModuleUtilityType