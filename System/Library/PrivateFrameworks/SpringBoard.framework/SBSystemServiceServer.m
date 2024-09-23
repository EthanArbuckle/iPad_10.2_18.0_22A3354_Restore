@implementation SBSystemServiceServer

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 0:
      -[SBSystemServiceServer _handleRequestAppSwitcherAppearanceForHiddenApp:fromClient:](self, "_handleRequestAppSwitcherAppearanceForHiddenApp:fromClient:", v8, v9);
      break;
    case 1:
      -[SBSystemServiceServer _handleBiometricsFetchUnlockCredentialSetMessage:fromClient:](self, "_handleBiometricsFetchUnlockCredentialSetMessage:fromClient:", v8, v9);
      break;
    case 2:
      -[SBSystemServiceServer _handleHardwareButtonAcquireAssertionMessage:fromClient:](self, "_handleHardwareButtonAcquireAssertionMessage:fromClient:", v8, v9);
      break;
    case 3:
      -[SBSystemServiceServer _handleHardwareButtonSetPressEventMask:fromClient:](self, "_handleHardwareButtonSetPressEventMask:fromClient:", v8, v9);
      break;
    case 4:
      -[SBSystemServiceServer _handleHardwareButtonSetRequestsHIDEvents:fromClient:](self, "_handleHardwareButtonSetRequestsHIDEvents:fromClient:", v8, v9);
      break;
    case 5:
      -[SBSystemServiceServer _handleHardwareButtonGetToggleButtonState:fromClient:](self, "_handleHardwareButtonGetToggleButtonState:fromClient:", v8, v9);
      break;
    case 6:
      -[SBSystemServiceServer _handleHardwareButtonSetHapticType:fromClient:](self, "_handleHardwareButtonSetHapticType:fromClient:", v8, v9);
      break;
    case 7:
      -[SBSystemServiceServer _handleHardwareButtonGetHapticType:fromClient:](self, "_handleHardwareButtonGetHapticType:fromClient:", v8, v9);
      break;
    case 8:
      -[SBSystemServiceServer _handleHardwareButtonGetHintViewsSupported:fromClient:](self, "_handleHardwareButtonGetHintViewsSupported:fromClient:", v8, v9);
      break;
    case 9:
      -[SBSystemServiceServer _handleHardwareButtonRegisterAssociatedHintView:fromClient:](self, "_handleHardwareButtonRegisterAssociatedHintView:fromClient:", v8, v9);
      break;
    case 10:
      -[SBSystemServiceServer _handleHardwareButtonUpdateHintContentVisibility:fromClient:](self, "_handleHardwareButtonUpdateHintContentVisibility:fromClient:", v8, v9);
      break;
    case 11:
      -[SBSystemServiceServer _handleHardwareButtonRequestSystemGlowEffect:fromClient:](self, "_handleHardwareButtonRequestSystemGlowEffect:fromClient:", v8, v9);
      break;
    case 12:
      -[SBSystemServiceServer _handleHardwareButtonUpdateSystemGlowStyle:fromClient:](self, "_handleHardwareButtonUpdateSystemGlowStyle:fromClient:", v8, v9);
      break;
    case 13:
      -[SBSystemServiceServer _handleSoftwareUpdateSetPasscodePolicy:fromClient:](self, "_handleSoftwareUpdateSetPasscodePolicy:fromClient:", v8, v9);
      break;
    case 14:
      -[SBSystemServiceServer _handleSoftwareUpdateGetPasscodePolicy:fromClient:](self, "_handleSoftwareUpdateGetPasscodePolicy:fromClient:", v8, v9);
      break;
    case 15:
      -[SBSystemServiceServer _handleTestAutomationSuspendAllDisplays:fromClient:](self, "_handleTestAutomationSuspendAllDisplays:fromClient:", v8, v9);
      break;
    case 16:
      -[SBSystemServiceServer _handleTestAutomationClearAllUserNotifications:fromClient:](self, "_handleTestAutomationClearAllUserNotifications:fromClient:", v8, v9);
      break;
    case 17:
      -[SBSystemServiceServer _handleTestAutomationSetAlertState:fromClient:](self, "_handleTestAutomationSetAlertState:fromClient:", v8, v9);
      break;
    case 18:
      -[SBSystemServiceServer _handleTestAutomationSetHiddenFeatureState:fromClient:](self, "_handleTestAutomationSetHiddenFeatureState:fromClient:", v8, v9);
      break;
    case 19:
      -[SBSystemServiceServer _handleTestAutomationSetIdleTimerState:fromClient:](self, "_handleTestAutomationSetIdleTimerState:fromClient:", v8, v9);
      break;
    case 20:
      -[SBSystemServiceServer _handleTestAutomationSetOrientationLockState:fromClient:](self, "_handleTestAutomationSetOrientationLockState:fromClient:", v8, v9);
      break;
    case 21:
      -[SBSystemServiceServer _handleTestAutomationSetMallocStackLoggingState:fromClient:](self, "_handleTestAutomationSetMallocStackLoggingState:fromClient:", v8, v9);
      break;
    case 22:
      -[SBSystemServiceServer _handleTestAutomationSetReachabilityActiveState:fromClient:](self, "_handleTestAutomationSetReachabilityActiveState:fromClient:", v8, v9);
      break;
    case 23:
      -[SBSystemServiceServer _handleTestAutomationRequestReachabilityEnabledAssertion:fromClient:](self, "_handleTestAutomationRequestReachabilityEnabledAssertion:fromClient:", v8, v9);
      break;
    case 24:
      -[SBSystemServiceServer _handleTestAutomationSetAmbientPresentationState:fromClient:](self, "_handleTestAutomationSetAmbientPresentationState:fromClient:", v8, v9);
      break;
    case 25:
      -[SBSystemServiceServer _handleTestAutomationResetToHomeScreen:fromClient:](self, "_handleTestAutomationResetToHomeScreen:fromClient:", v8, v9);
      break;
    case 26:
      -[SBSystemServiceServer _handleTestAutomationSetAccessoryAttachedState:fromClient:](self, "_handleTestAutomationSetAccessoryAttachedState:fromClient:", v8, v9);
      break;
    case 27:
      -[SBSystemServiceServer _handleTestAutomationRequestHUDHiddenAssertion:fromClient:](self, "_handleTestAutomationRequestHUDHiddenAssertion:fromClient:", v8, v9);
      break;
    case 28:
      -[SBSystemServiceServer _handleTestAutomationBlockApplicationForScreenTime:fromClient:](self, "_handleTestAutomationBlockApplicationForScreenTime:fromClient:", v8, v9);
      break;
    case 29:
      -[SBSystemServiceServer _handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:fromClient:](self, "_handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:fromClient:", v8, v9);
      break;
    case 31:
      -[SBSystemServiceServer _handleStashSwitcherModelToPath:fromClient:](self, "_handleStashSwitcherModelToPath:fromClient:", v8, v9);
      break;
    case 32:
      -[SBSystemServiceServer _handleLoadStashedSwitcherModelFromPath:fromClient:](self, "_handleLoadStashedSwitcherModelFromPath:fromClient:", v8, v9);
      break;
    case 33:
      -[SBSystemServiceServer _handleTestAutomationAddWidgetsToEachPage:fromClient:](self, "_handleTestAutomationAddWidgetsToEachPage:fromClient:", v8, v9);
      break;
    case 34:
      -[SBSystemServiceServer _handleTestAutomationAddSpecificWidgetToPageWithSize:fromClient:](self, "_handleTestAutomationAddSpecificWidgetToPageWithSize:fromClient:", v8, v9);
      break;
    case 35:
      -[SBSystemServiceServer _handleTestAutomationAddSpecificWidgetStackToPageWithSize:fromClient:](self, "_handleTestAutomationAddSpecificWidgetStackToPageWithSize:fromClient:", v8, v9);
      break;
    case 36:
      -[SBSystemServiceServer _handleTestAutomationEnterLostMode:fromClient:](self, "_handleTestAutomationEnterLostMode:fromClient:", v8, v9);
      break;
    case 37:
      -[SBSystemServiceServer _handleTestAutomationExitLostMode:fromClient:](self, "_handleTestAutomationExitLostMode:fromClient:", v8, v9);
      break;
    case 38:
      -[SBSystemServiceServer _handleTestAutomationGetChamoisWindowingUIEnabled:fromClient:](self, "_handleTestAutomationGetChamoisWindowingUIEnabled:fromClient:", v8, v9);
      break;
    case 39:
      -[SBSystemServiceServer _handleTestAutomationSetChamoisWindowingUIEnabled:fromClient:](self, "_handleTestAutomationSetChamoisWindowingUIEnabled:fromClient:", v8, v9);
      break;
    case 40:
      -[SBSystemServiceServer _handleTestAutomationGetChamoisPrefersDockHidden:fromClient:](self, "_handleTestAutomationGetChamoisPrefersDockHidden:fromClient:", v8, v9);
      break;
    case 41:
      -[SBSystemServiceServer _handleTestAutomationSetChamoisPrefersDockHidden:fromClient:](self, "_handleTestAutomationSetChamoisPrefersDockHidden:fromClient:", v8, v9);
      break;
    case 42:
      -[SBSystemServiceServer _handleTestAutomationGetChamoisPrefersStripHidden:fromClient:](self, "_handleTestAutomationGetChamoisPrefersStripHidden:fromClient:", v8, v9);
      break;
    case 43:
      -[SBSystemServiceServer _handleTestAutomationSetChamoisPrefersStripHidden:fromClient:](self, "_handleTestAutomationSetChamoisPrefersStripHidden:fromClient:", v8, v9);
      break;
    case 44:
      -[SBSystemServiceServer _handleTestAutomationSetUserPresenceDetectedSinceWake:fromClient:](self, "_handleTestAutomationSetUserPresenceDetectedSinceWake:fromClient:", v8, v9);
      break;
    case 45:
      -[SBSystemServiceServer _handleTestAutomationGetDeviceSupportsSystemAperture:fromClient:](self, "_handleTestAutomationGetDeviceSupportsSystemAperture:fromClient:", v8, v9);
      break;
    case 46:
      -[SBSystemServiceServer _handleTestAutomationGetSystemApertureStateDump:fromClient:](self, "_handleTestAutomationGetSystemApertureStateDump:fromClient:", v8, v9);
      break;
    case 47:
      -[SBSystemServiceServer _handleTestAutomationGetWidgetControllerStateDump:fromClient:](self, "_handleTestAutomationGetWidgetControllerStateDump:fromClient:", v8, v9);
      break;
    case 48:
      -[SBSystemServiceServer _handleTestAutomationSetSpringBoardAnimationFrameRecording:fromClient:](self, "_handleTestAutomationSetSpringBoardAnimationFrameRecording:fromClient:", v8, v9);
      break;
    case 49:
      -[SBSystemServiceServer _handleTestAutomationGetSpringBoardFrameRecording:fromClient:](self, "_handleTestAutomationGetSpringBoardFrameRecording:fromClient:", v8, v9);
      break;
    case 50:
      -[SBSystemServiceServer _handleTestAutomationSetSystemApertureUnderAutomationTesting:fromClient:](self, "_handleTestAutomationSetSystemApertureUnderAutomationTesting:fromClient:", v8, v9);
      break;
    case 51:
      -[SBSystemServiceServer _handleTestAutomationGetSystemApertureModelStateDump:fromClient:](self, "_handleTestAutomationGetSystemApertureModelStateDump:fromClient:", v8, v9);
      break;
    case 52:
      -[SBSystemServiceServer _handleSystemApertureRequestToWriteStateDumpToFile:fromClient:](self, "_handleSystemApertureRequestToWriteStateDumpToFile:fromClient:", v8, v9);
      break;
    case 53:
      -[SBSystemServiceServer _handleSystemApertureRequestStateDump:fromClient:](self, "_handleSystemApertureRequestStateDump:fromClient:", v8, v9);
      break;
    case 54:
      -[SBSystemServiceServer _handleStateDumpServiceClientMessageTypeStateDump:fromClient:](self, "_handleStateDumpServiceClientMessageTypeStateDump:fromClient:", v8, v9);
      break;
    case 55:
      -[SBSystemServiceServer _handleStateDumpServiceClientMessageTypeStateDumpToFile:fromClient:](self, "_handleStateDumpServiceClientMessageTypeStateDumpToFile:fromClient:", v8, v9);
      break;
    case 56:
      -[SBSystemServiceServer _handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:fromClient:](self, "_handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:fromClient:", v8, v9);
      break;
    case 57:
      -[SBSystemServiceServer _handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:fromClient:](self, "_handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:fromClient:", v8, v9);
      break;
    default:
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "processHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client process [%@] sent a message with an unknown format. Ignoring request.", (uint8_t *)&v14, 0x16u);

      }
      break;
  }

}

- (void)_handleHardwareButtonSetPressEventMask:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t uint64;
  int64_t int64;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E0DABFF8]);
      int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC030]);
      objc_msgSend(v8, "systemServiceServer:client:setEventMask:buttonKind:priority:", self, v11, uint64, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DABFE8]), int64);
    }

  }
}

- (SBSystemServiceServerHardwareButtonDelegate)hardwareButtonDelegate
{
  return (SBSystemServiceServerHardwareButtonDelegate *)objc_loadWeakRetained((id *)&self->_hardwareButtonDelegate);
}

+ (SBSystemServiceServer)sharedInstance
{
  if (sharedInstance_onceToken_38 != -1)
    dispatch_once(&sharedInstance_onceToken_38, &__block_literal_global_252);
  return (SBSystemServiceServer *)(id)sharedInstance___sharedInstance_19;
}

void __39__SBSystemServiceServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBSystemServiceServer _init]([SBSystemServiceServer alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_19;
  sharedInstance___sharedInstance_19 = (uint64_t)v0;

}

- (id)_init
{
  void *v3;
  void *Serial;
  void *v5;
  uint64_t v6;
  SBSystemServiceServer *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0D23258];
  Serial = (void *)BSDispatchQueueCreateSerial();
  objc_msgSend(v3, "queueWithDispatchQueue:", Serial);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DAB9C8];
  v9.receiver = self;
  v9.super_class = (Class)SBSystemServiceServer;
  v7 = -[FBSServiceFacility initWithIdentifier:queue:](&v9, sel_initWithIdentifier_queue_, v6, v5);

  return v7;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemServiceServer.m"), 50, CFSTR("you can't deallocate the server"));

  v5.receiver = self;
  v5.super_class = (Class)SBSystemServiceServer;
  -[FBSServiceFacility dealloc](&v5, sel_dealloc);
}

- (void)noteClientDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBSystemServiceServer noteClientDidDisconnect:].cold.1((uint64_t)v4, v5);

  -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "systemServiceServer:clientDidDisconnect:", self, v4);

}

- (void)_handleRequestAppSwitcherAppearanceForHiddenApp:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__onceToken != -1)
    dispatch_once(&_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__onceToken, &__block_literal_global_10_3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appSwitcherDelegate);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_2;
  v14[3] = &unk_1E8E9E980;
  v15 = v6;
  v13 = v6;
  objc_msgSend(WeakRetained, "systemServiceServer:requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:", self, v9, v11, v7, v14);

}

void __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D01798]);
  v1 = (void *)_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort;
  _handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort = (uint64_t)v0;

}

uint64_t __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_3;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0DAB518], *(_BYTE *)(a1 + 32));
  if (*(_BYTE *)(a1 + 32)
    && objc_msgSend((id)_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort, "isUsable"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D017A0]);
    v4 = (void *)objc_msgSend(v3, "initFromReceiveRight:", _handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort);
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

  }
}

- (void)_handleBiometricsFetchUnlockCredentialSetMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke;
  v12[3] = &unk_1E8EB6420;
  v13 = v6;
  v8 = v6;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v12);
  -[SBSystemServiceServer biometricsDelegate](self, "biometricsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "systemServiceServer:client:fetchUnlockCredentialSet:", self, v7, v9);
  else
    v9[2](v9, 0);

}

void __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

uint64_t __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke_2()
{
  return BSSerializeDataToXPCDictionaryWithKey();
}

- (void)_handleHardwareButtonAcquireAssertionMessage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t uint64;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke;
  v15[3] = &unk_1E8EB6448;
  v8 = v6;
  v16 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v15);
  objc_msgSend(v8, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && object_getClass(v10) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      uint64 = xpc_dictionary_get_uint64(v11, (const char *)*MEMORY[0x1E0DAC0D0]);
      BSDeserializeStringFromXPCDictionaryWithKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemServiceServer:client:acquireAssertionOfType:forReason:withCompletion:", self, v7, uint64, v14, v9);

    }
    else
    {
      v9[2](v9, 0);
    }

  }
  else
  {
    v9[2](v9, 0);
  }

}

void __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E8EA7108;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendReplyMessageWithPacker:", v6);

}

uint64_t __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke_2()
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)_handleHardwareButtonGetToggleButtonState:(id)a3 fromClient:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && object_getClass(v4) == (Class)MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E0DABFE8]) == 6)
      v6 = &__block_literal_global_17_2;
    else
      v6 = &__block_literal_global_18_2;
    objc_msgSend(v7, "sendReplyMessageWithPacker:", v6);
  }

}

void __78__SBSystemServiceServer__handleHardwareButtonGetToggleButtonState_fromClient___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2;
  xpc_object_t xdict;

  xdict = a2;
  if (SBUIHasHIDRingerSwitch())
    v2 = objc_msgSend((id)SBApp, "ringerSwitchState") != 0;
  else
    v2 = -1;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC060], v2);

}

void __78__SBSystemServiceServer__handleHardwareButtonGetToggleButtonState_fromClient___block_invoke_2(int a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC060], -1);
}

- (void)_handleHardwareButtonSetRequestsHIDEvents:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  int64_t int64;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC008]);
      int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DABFE8]);
      objc_opt_class();
      BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemServiceServer:client:requestsHIDEvents:token:forButtonKind:", self, v12, v9, v11, int64);

    }
  }

}

- (void)_handleHardwareButtonSetHapticType:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t int64;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC010]);
      objc_msgSend(v8, "systemServiceServer:client:setHapticType:buttonKind:", self, v10, int64, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DABFE8]));
    }

  }
}

- (void)_handleHardwareButtonGetHapticType:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  int64_t int64;
  _QWORD v14[4];
  void (**v15)(_QWORD, _QWORD);
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke;
  v16[3] = &unk_1E8EA2880;
  v10 = v6;
  v17 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v16);
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0DABFE8]);
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_3;
      v14[3] = &unk_1E8EB09C0;
      v15 = v11;
      objc_msgSend(v12, "systemServiceServer:client:fetchHapticTypeForButtonKind:completion:", self, v7, int64, v14);

    }
    else
    {
      v11[2](v11, 0);
    }

  }
  else
  {
    v11[2](v11, 0);
  }

}

uint64_t __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC010], *(_QWORD *)(a1 + 32));
}

uint64_t __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleHardwareButtonGetHintViewsSupported:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  _QWORD v13[4];
  char v14;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "systemServiceServer:getHintViewsSupportedForClient:", self, v6);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __79__SBSystemServiceServer__handleHardwareButtonGetHintViewsSupported_fromClient___block_invoke;
      v13[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      v14 = v11;
      objc_msgSend(v12, "sendReplyMessageWithPacker:", v13);
    }

  }
}

void __79__SBSystemServiceServer__handleHardwareButtonGetHintViewsSupported_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DABFE0], *(_BYTE *)(a1 + 32));
}

- (void)_handleHardwareButtonRegisterAssociatedHintView:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t uint64;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t int64;
  void *v17;
  char v18;
  id v19;
  _QWORD v20[4];
  char v21;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64 = xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E0DAC038]);
      v11 = xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E0DAC040]);
      BSDeserializeCGSizeFromXPCDictionaryWithKey();
      v13 = v12;
      v15 = v14;
      int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0DABFE8]);
      BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "systemServiceServer:client:registerAssociatedHintViewContextId:renderId:size:buttonKind:clientPort:", self, v6, uint64, v11, int64, v17, v13, v15);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__SBSystemServiceServer__handleHardwareButtonRegisterAssociatedHintView_fromClient___block_invoke;
      v20[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      v21 = v18;
      objc_msgSend(v19, "sendReplyMessageWithPacker:", v20);

    }
  }

}

void __84__SBSystemServiceServer__handleHardwareButtonRegisterAssociatedHintView_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC050], *(_BYTE *)(a1 + 32));
}

- (void)_handleHardwareButtonUpdateHintContentVisibility:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t int64;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC020]);
      v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DABFE8]);
      BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemServiceServer:client:updateHintContentVisibility:forButton:animationSettings:", self, v12, int64, v10, v11);

    }
  }

}

- (void)_handleHardwareButtonRequestSystemGlowEffect:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t int64;
  void *v11;
  char v12;
  id v13;
  _QWORD v14[4];
  char v15;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0DAC058]);
      BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "systemServiceServer:client:requestSystemGlowEffectWithInitialStyle:clientPort:", self, v6, int64, v11);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__SBSystemServiceServer__handleHardwareButtonRequestSystemGlowEffect_fromClient___block_invoke;
      v14[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      v15 = v12;
      objc_msgSend(v13, "sendReplyMessageWithPacker:", v14);

    }
  }

}

void __81__SBSystemServiceServer__handleHardwareButtonRequestSystemGlowEffect_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC050], *(_BYTE *)(a1 + 32));
}

- (void)_handleHardwareButtonUpdateSystemGlowStyle:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer hardwareButtonDelegate](self, "hardwareButtonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "systemServiceServer:client:updateSystemGlowStyle:", self, v9, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC058]));

  }
}

- (void)_handleSoftwareUpdateSetPasscodePolicy:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    -[SBSystemServiceServer softwareUpdateDelegate](self, "softwareUpdateDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "systemServiceServer:client:setPasscodePolicy:", self, v9, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC078]));

  }
}

- (void)_handleSoftwareUpdateGetPasscodePolicy:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke;
  v14[3] = &unk_1E8EA2880;
  v9 = v6;
  v15 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v14);
  -[SBSystemServiceServer softwareUpdateDelegate](self, "softwareUpdateDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_3;
    v12[3] = &unk_1E8EB09C0;
    v13 = v10;
    objc_msgSend(v11, "systemServiceServer:client:passcodePolicy:", self, v7, v12);

  }
  else
  {
    v10[2](v10, 0);
  }

}

uint64_t __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC078], *(_QWORD *)(a1 + 32));
}

uint64_t __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleTestAutomationGetSystemApertureModelStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:getSystemApertureModelStateDumpForClient:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__SBSystemServiceServer__handleTestAutomationGetSystemApertureModelStateDump_fromClient___block_invoke;
    v10[3] = &unk_1E8EA7108;
    v11 = v8;
    objc_msgSend(v9, "sendReplyMessageWithPacker:", v10);

  }
}

void __89__SBSystemServiceServer__handleTestAutomationGetSystemApertureModelStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeDataToXPCDictionaryWithKey();

}

- (void)_handleTestAutomationSetSpringBoardAnimationFrameRecording:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  uint64_t uint64;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E0DAC120]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setSpringBoardAnimationFrameRecordingForUpdateTypes:", self, v10, uint64);

  }
}

- (void)_handleTestAutomationGetSpringBoardFrameRecording:(id)a3 fromClient:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:getAnimationFrameRecordingsForClient:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetSpringBoardFrameRecording_fromClient___block_invoke;
    v10[3] = &unk_1E8EA7108;
    v11 = v8;
    objc_msgSend(v9, "sendReplyMessageWithPacker:", v10);

  }
}

void __86__SBSystemServiceServer__handleTestAutomationGetSpringBoardFrameRecording_fromClient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB36F8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeDataToXPCDictionaryWithKey();

}

- (void)_handleTestAutomationSetSystemApertureUnderAutomationTesting:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setSystemApertureUnderAutomationTesting:", self, v10, v8);

  }
}

- (void)_handleSystemApertureRequestStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E0C812F8])
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureStateDumpDelegate);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke;
    v11[3] = &unk_1E8EB64F8;
    v12 = v6;
    objc_msgSend(WeakRetained, "systemServiceServer:client:requestSystemApertureStateDumpWithCompletion:", self, v7, v11);

  }
}

void __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke_2;
  v10[3] = &unk_1E8EB64D0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "sendReplyMessageWithPacker:", v10);

}

void __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = (const char *)*MEMORY[0x1E0DAC0B8];
  v5 = *(void **)(a1 + 32);
  xdict = v3;
  if (v5)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v3 = xdict;
    v7 = (const char *)v6;
  }
  else
  {
    v7 = "";
  }
  xpc_dictionary_set_string(v3, v4, v7);
  v8 = *(void **)(a1 + 40);
  if (v8)
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0DAC0B0], (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));

}

- (void)_handleSystemApertureRequestToWriteStateDumpToFile:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E0C812F8])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__SBSystemServiceServer__handleSystemApertureRequestToWriteStateDumpToFile_fromClient___block_invoke;
    v10[3] = &unk_1E8EB64D0;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "sendReplyMessageWithPacker:", v10);

  }
}

void __87__SBSystemServiceServer__handleSystemApertureRequestToWriteStateDumpToFile_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  id WeakRetained;
  id v5;

  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0DAC090]);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(WeakRetained, "systemServiceServer:client:requestToWriteSystemApertureStateDumpToFile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);

}

- (void)_handleTestAutomationSuspendAllDisplays:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:suspendAllDisplaysForClient:", self, v6);

}

- (void)_handleTestAutomationClearAllUserNotifications:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:clearAllUserNotificationsForClient:", self, v6);

}

- (void)_handleTestAutomationSetUserPresenceDetectedSinceWake:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:setUserPresenceDetectedSinceWakeForClient:", self, v6);

}

- (void)_handleTestAutomationSetAlertState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setAlertsEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetHiddenFeatureState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setHiddenFeaturesEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetIdleTimerState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setIdleTimerEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetOrientationLockState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setOrientationLockEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetMallocStackLoggingState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setMallocStackLoggingEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetReachabilityActiveState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setReachabilityActive:", self, v10, v8);

  }
}

- (void)_handleTestAutomationRequestReachabilityEnabledAssertion:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:port:acquireAssertionForReachabilityEnabled:", self, v11, v9, v8);

  }
}

- (void)_handleTestAutomationSetAmbientPresentationState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  int64_t int64;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC0E8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setAmbientPresentationState:", self, v10, int64);

  }
}

- (void)_handleTestAutomationResetToHomeScreen:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC0F0]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:resetToHomeScreenAnimated:", self, v10, v8);

  }
}

- (void)_handleTestAutomationSetAccessoryAttachedState:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  int64_t int64;
  _BOOL8 v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC0E0]);
    v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setAccessoryType:attached:", self, v11, int64, v9);

  }
}

- (void)_handleTestAutomationBlockApplicationForScreenTime:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC0F8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setApplicationBundleIdentifier:blockedForScreenTime:", self, v11, v8, v9);

  }
}

- (void)_handleTestAutomationRequestHUDHiddenAssertion:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:port:acquireHUDHiddenAssertionForIdentifier:", self, v11, v9, v8);

  }
}

- (void)_handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setTestRunnerRecoveryApplicationBundleIdentifier:", self, v10, v8);

  }
}

- (void)_handleTestAutomationGetScencesForBundleIdentifier:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke;
    v12[3] = &unk_1E8E9EBA8;
    v13 = v6;
    objc_msgSend(WeakRetained, "systemServiceServer:client:countScenesForBundleIdentifier:withCompletion:", self, v7, v10, v12);

  }
}

uint64_t __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v4[4];
  int v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC140], *(int *)(a1 + 32));
}

- (void)_handleStashSwitcherModelToPath:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:client:stashSwitcherModelToPath:", self, v6, v9);

}

- (void)_handleLoadStashedSwitcherModelFromPath:(id)a3 fromClient:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:client:loadStashedSwitcherModelFromPath:", self, v6, v9);

}

- (void)_handleTestAutomationAddWidgetsToEachPage:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:addWidgetsToEachPageForClient:", self, v6);

}

- (void)_handleTestAutomationAddSpecificWidgetToPageWithSize:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t int64;
  int64_t v10;
  id WeakRetained;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC130]);
    v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC148]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:addWidgetWithIdentifier:toPage:withSizing:", self, v12, v8, int64, v10);

  }
}

- (void)_handleTestAutomationAddSpecificWidgetStackToPageWithSize:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t int64;
  int64_t v10;
  id WeakRetained;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = (void *)BSCreateDeserializedArrayFromXPCDictionaryWithKey();
    int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC130]);
    v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E0DAC148]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:addWidgetStackWithIdentifiers:toPage:withSizing:", self, v12, v8, int64, v10);

  }
}

id __94__SBSystemServiceServer__handleTestAutomationAddSpecificWidgetStackToPageWithSize_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = v2;
  if (v2 && object_getClass(v2) == (Class)MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_handleTestAutomationEnterLostMode:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:enterLostModeForClient:", self, v6);

}

- (void)_handleTestAutomationExitLostMode:(id)a3 fromClient:(id)a4
{
  SBSystemServiceServerTestAutomationDelegate **p_testAutomationDelegate;
  id v6;
  id WeakRetained;

  p_testAutomationDelegate = &self->_testAutomationDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:exitLostModeForClient:", self, v6);

}

- (void)_handleTestAutomationGetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke;
  v10[3] = &unk_1E8E9E980;
  v11 = v6;
  v9 = v6;
  objc_msgSend(WeakRetained, "systemServiceServer:client:getIsChamoisWindowingUIEnabledWithCompletion:", self, v7, v10);

}

uint64_t __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC118], *(_BYTE *)(a1 + 32));
}

- (void)_handleTestAutomationSetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setChamoisWindowingUIEnabled:", self, v10, v8);

  }
}

- (void)_handleTestAutomationGetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke;
  v10[3] = &unk_1E8E9E980;
  v11 = v6;
  v9 = v6;
  objc_msgSend(WeakRetained, "systemServiceServer:client:getChamoisPrefersDockHiddenWithCompletion:", self, v7, v10);

}

uint64_t __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC118], *(_BYTE *)(a1 + 32));
}

- (void)_handleTestAutomationSetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setChamoisPrefersDockHidden:", self, v10, v8);

  }
}

- (void)_handleTestAutomationGetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke;
  v10[3] = &unk_1E8E9E980;
  v11 = v6;
  v9 = v6;
  objc_msgSend(WeakRetained, "systemServiceServer:client:getChamoisPrefersStripHiddenWithCompletion:", self, v7, v10);

}

uint64_t __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC118], *(_BYTE *)(a1 + 32));
}

- (void)_handleTestAutomationSetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E0DAC118]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:setChamoisPrefersStripHidden:", self, v10, v8);

  }
}

- (void)_handleTestAutomationGetDeviceSupportsSystemAperture:(id)a3 fromClient:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke;
  v15[3] = &unk_1E8E9E980;
  v16 = v6;
  v8 = v6;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17E5550](v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_3;
  v13[3] = &unk_1E8E9F1C0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(WeakRetained, "systemServiceServer:client:getDeviceSupportsSystemAperture:", self, v9, v13);

}

uint64_t __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0DAC110], *(_BYTE *)(a1 + 32));
}

uint64_t __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleTestAutomationGetSystemApertureStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:getSystemApertureStateDumpForClient:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E8EB64D0;
    v13 = v8;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v11, "sendReplyMessageWithPacker:", v12);

  }
}

void __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  xpc_object_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = xpc_dictionary_create(0, 0, 0);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v9, "valueForKey:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
              BSSerializeStringToXPCDictionaryWithKey();

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

        objc_msgSend(*(id *)(v18 + 40), "addObject:", v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  BSSerializeArrayToXPCDictionaryWithKey();
}

id __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (void)_handleTestAutomationGetWidgetControllerStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  objc_msgSend(WeakRetained, "systemServiceServer:getWidgetControllerStateDump:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetWidgetControllerStateDump_fromClient___block_invoke;
    v10[3] = &unk_1E8EA7108;
    v11 = v8;
    objc_msgSend(v9, "sendReplyMessageWithPacker:", v10);

  }
}

void __86__SBSystemServiceServer__handleTestAutomationGetWidgetControllerStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeDataToXPCDictionaryWithKey();

}

- (void)_handleStateDumpServiceClientMessageTypeStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t uint64;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v9, (const char *)*MEMORY[0x1E0DAC098]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E8EA2530;
    v13 = v6;
    objc_msgSend(WeakRetained, "systemServiceServer:client:requestStateDump:withCompletion:", self, v7, uint64, v12);

  }
}

void __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke_2;
  v12[3] = &unk_1E8EB65C0;
  v15 = a2;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "sendReplyMessageWithPacker:", v12);

}

void __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  char v4;
  const char *v5;
  void *v6;
  const char *v7;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0DAC0A0];
  v4 = *(_BYTE *)(a1 + 48);
  xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  v5 = (const char *)*MEMORY[0x1E0DAC088];
  v6 = *(void **)(a1 + 32);
  if (v6)
    v7 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v7 = "";
  xpc_dictionary_set_string(xdict, v5, v7);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0DAC0A8], (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));

}

- (void)_handleStateDumpServiceClientMessageTypeStateDumpToFile:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  uint64_t uint64;
  const char *string;
  void *v10;
  id WeakRetained;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E0DAC098]);
    string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1E0DAC090]);
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    objc_msgSend(WeakRetained, "systemServiceServer:client:requestStateDump:toTextFileAtPath:", self, v12, uint64, v10);

  }
}

- (void)_handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t int64;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E0C812F8])
  {
    int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E0DAC080]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E8EB6610;
    v13 = v6;
    objc_msgSend(WeakRetained, "systemServiceServer:client:enableRemoteStateDumpWithTimeout:completion:", self, v7, int64, v12);

  }
}

void __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke_2;
  v8[3] = &unk_1E8EB65E8;
  v10 = a2;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "sendReplyMessageWithPacker:", v8);

}

void __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  char v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0DAC0A0];
  v4 = *(_BYTE *)(a1 + 40);
  xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0DAC0A8], (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));

}

- (void)_handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke;
  v10[3] = &unk_1E8EB6610;
  v11 = v6;
  v9 = v6;
  objc_msgSend(WeakRetained, "systemServiceServer:client:disableRemoteStateDumpWithCompletion:", self, v7, v10);

}

void __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke_2;
  v8[3] = &unk_1E8EB65E8;
  v10 = a2;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "sendReplyMessageWithPacker:", v8);

}

void __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  char v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0DAC0A0];
  v4 = *(_BYTE *)(a1 + 40);
  xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0DAC0A8], (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));

}

- (SBSystemServiceServerAppSwitcherDelegate)appSwitcherDelegate
{
  return (SBSystemServiceServerAppSwitcherDelegate *)objc_loadWeakRetained((id *)&self->_appSwitcherDelegate);
}

- (void)setAppSwitcherDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appSwitcherDelegate, a3);
}

- (SBSystemServiceServerBiometricsDelegate)biometricsDelegate
{
  return (SBSystemServiceServerBiometricsDelegate *)objc_loadWeakRetained((id *)&self->_biometricsDelegate);
}

- (void)setBiometricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricsDelegate, a3);
}

- (void)setHardwareButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hardwareButtonDelegate, a3);
}

- (SBSystemServiceServerSoftwareUpdateDelegate)softwareUpdateDelegate
{
  return (SBSystemServiceServerSoftwareUpdateDelegate *)objc_loadWeakRetained((id *)&self->_softwareUpdateDelegate);
}

- (void)setSoftwareUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_softwareUpdateDelegate, a3);
}

- (SBSystemServiceServerTestAutomationDelegate)testAutomationDelegate
{
  return (SBSystemServiceServerTestAutomationDelegate *)objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
}

- (void)setTestAutomationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testAutomationDelegate, a3);
}

- (SBSystemServiceServerStateDumpDelegate)stateDumpDelegate
{
  return (SBSystemServiceServerStateDumpDelegate *)objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
}

- (void)setStateDumpDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateDumpDelegate, a3);
}

- (SBSystemServiceServerSystemApertureStateDumpDelegate)systemApertureStateDumpDelegate
{
  return (SBSystemServiceServerSystemApertureStateDumpDelegate *)objc_loadWeakRetained((id *)&self->_systemApertureStateDumpDelegate);
}

- (void)setSystemApertureStateDumpDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemApertureStateDumpDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemApertureStateDumpDelegate);
  objc_destroyWeak((id *)&self->_stateDumpDelegate);
  objc_destroyWeak((id *)&self->_testAutomationDelegate);
  objc_destroyWeak((id *)&self->_softwareUpdateDelegate);
  objc_destroyWeak((id *)&self->_hardwareButtonDelegate);
  objc_destroyWeak((id *)&self->_biometricsDelegate);
  objc_destroyWeak((id *)&self->_appSwitcherDelegate);
}

- (void)noteClientDidDisconnect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "client did disconnect:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
