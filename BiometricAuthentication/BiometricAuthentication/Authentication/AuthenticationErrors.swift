//
//  AuthenticationErrors.swift
//  BiometricAuthentication
//
// 07/09/2020 Lautarobuson


import Foundation
import LocalAuthentication

/// Authentication Errors
public enum AuthenticationError: Error {
    
    case failed, canceledByUser, fallback, canceledBySystem, passcodeNotSet, biometryNotAvailable, biometryNotEnrolled, biometryLockedout, other
    
    public static func initWithError(_ error: LAError) -> AuthenticationError {
        switch Int32(error.errorCode) {
            
        case kLAErrorAuthenticationFailed:
            return failed
        case kLAErrorUserCancel:
            return canceledByUser
        case kLAErrorUserFallback:
            return fallback
        case kLAErrorSystemCancel:
            return canceledBySystem
        case kLAErrorPasscodeNotSet:
            return passcodeNotSet
        case kLAErrorBiometryNotAvailable:
            return biometryNotAvailable
        case kLAErrorBiometryNotEnrolled:
            return biometryNotEnrolled
        case kLAErrorBiometryLockout:
            return biometryLockedout
        default:
           return other
        }
    }
    
    // get error message based on type
    public func message() -> String {
        let isFaceIdDevice = BioMetricAuthenticator.shared.isFaceIdDevice()
        
        switch self {
        case .canceledByUser, .fallback, .canceledBySystem:
            return ""
        case .passcodeNotSet:
            return isFaceIdDevice ? kSetPasscodeToUseFaceID : kSetPasscodeToUseTouchID
        case .biometryNotAvailable:
            return kBiometryNotAvailableReason
        case .biometryNotEnrolled:
            return isFaceIdDevice ? kNoFaceIdentityEnrolled : kNoFingerprintEnrolled
        case .biometryLockedout:
            return isFaceIdDevice ? kFaceIdPasscodeAuthenticationReason : kTouchIdPasscodeAuthenticationReason
        default:
            return isFaceIdDevice ? kDefaultFaceIDAuthenticationFailedReason : kDefaultTouchIDAuthenticationFailedReason
        }
    }
}
