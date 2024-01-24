//
//  FeedbackUtil.swift
//  ModuleUtilityExample
//
//  Created by gigas on 2021/12/27.
//

import UIKit

class FeedbackUtil {
    static let shared = { FeedbackUtil() }()
    
    //
    func notificationFeedback(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    /**
     
     - parameters:
        - style: 피드백 스타일
     */
    func impactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    /**
     짧은 설명
     
     긴 설명
     
     **마크다운** 문법이 적용됩니다.
     
    ## 사용하기
     ```
    let feedbackUtil = FeedbackUtil.shared
    feedbackUtil.selectionFeedback()
     ```
     
     ## 코멘트에 대한 상세
     [바로가기](https://developer.apple.com/documentation/uikit/uiselectionfeedbackgenerator)
     */
    func selectionFeedback() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
