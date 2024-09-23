@implementation SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider

- (id)defaultDeviceOrientationDrivenRoles
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (defaultDeviceOrientationDrivenRoles_onceToken_0 != -1)
    dispatch_once(&defaultDeviceOrientationDrivenRoles_onceToken_0, block);
  return (id)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0;
}

void __93__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "orientationStageRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "defaultIsolationDrivenRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsInArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "defaultOtherParticipantDrivenRoles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsInArray:", v7);

  v8 = objc_msgSend(v10, "copy");
  v9 = (void *)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0;
  defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles_0 = v8;

}

- (id)defaultActiveOrientationBelowDrivenRoles
{
  return 0;
}

- (id)defaultOtherParticipantDrivenRoles
{
  if (defaultOtherParticipantDrivenRoles_onceToken_0 != -1)
    dispatch_once(&defaultOtherParticipantDrivenRoles_onceToken_0, &__block_literal_global_318);
  return 0;
}

void __92__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_defaultOtherParticipantDrivenRoles__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E08]);
  v5[0] = CFSTR("SBTraitsParticipantRoleWallpaperExternal");
  v5[1] = CFSTR("SBTraitsParticipantRoleHomeScreenDimming");
  v6[0] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v6[1] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v5[2] = CFSTR("SBTraitsParticipantRoleCoverSheetHomeScreenOverlay");
  v5[3] = CFSTR("SBTraitsParticipantRoleCoverSheetPosterSwitcher");
  v6[2] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v6[3] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v5[4] = CFSTR("SBTraitsParticipantRoleSwitcherPublisher");
  v5[5] = CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI");
  v6[4] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v6[5] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithDictionary:", v1);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    objc_msgSend(v2, "setObject:forKey:", CFSTR("SBTraitsParticipantRoleHomeScreen"), CFSTR("SBTraitsParticipantRoleWallpaper"));

}

- (id)defaultKeyboardFocusDrivenRoles
{
  return 0;
}

- (id)defaultIsolationDrivenRoles
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SBTraitsParticipantRoleAssistantAccessory");
  v3[1] = CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)orientationStageRoles
{
  if (orientationStageRoles_onceToken_0 != -1)
    dispatch_once(&orientationStageRoles_onceToken_0, &__block_literal_global_6_8);
  return (id)orientationStageRoles_orientationStageRoles_0;
}

void __79__SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[63];

  v8[62] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = CFSTR("SBTraitsParticipantRoleAlert");
  v8[1] = CFSTR("SBTraitsParticipantRoleAmbient");
  v8[2] = CFSTR("SBTraitsParticipantRoleAssistant");
  v8[3] = CFSTR("SBTraitsParticipantRoleAssistantAccessory");
  v8[4] = CFSTR("SBTraitsParticipantRoleAXAssistiveTouchUI");
  v8[5] = CFSTR("SBTraitsParticipantRoleAXFullKeyboardUI");
  v8[6] = CFSTR("SBTraitsParticipantRoleAXUIServer");
  v8[7] = CFSTR("SBTraitsParticipantRoleAXVoiceControlUI");
  v8[8] = CFSTR("SBTraitsParticipantRoleBanner");
  v8[9] = CFSTR("SBTraitsParticipantRoleBiometricMonitorUI");
  v8[10] = CFSTR("SBTraitsParticipantRoleCommandTab");
  v8[11] = CFSTR("SBTraitsParticipantRoleControlCenter");
  v8[12] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v8[13] = CFSTR("SBTraitsParticipantRoleCoverSheetCamera");
  v8[14] = CFSTR("SBTraitsParticipantRoleCoverSheetHomeScreenOverlay");
  v8[15] = CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay");
  v8[16] = CFSTR("SBTraitsParticipantRoleDruid");
  v8[17] = CFSTR("SBTraitsParticipantRoleEnsembleUI");
  v8[18] = CFSTR("SBTraitsParticipantRoleEyedropperUI");
  v8[19] = CFSTR("SBTraitsParticipantRoleFloatingDock");
  v8[20] = CFSTR("SBTraitsParticipantRoleFloatingKeyboard");
  v8[21] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v8[22] = CFSTR("SBTraitsParticipantRoleHomeScreenDimming");
  v8[23] = CFSTR("SBTraitsParticipantRoleHUD");
  v8[24] = CFSTR("SBTraitsParticipantRoleInputUI");
  v8[25] = CFSTR("SBTraitsParticipantRoleInteractiveScreenshotGesture");
  v8[26] = CFSTR("SBTraitsParticipantRoleInternalPerfPowerHUD");
  v8[27] = CFSTR("SBTraitsParticipantRoleLiveTranscriptionUI");
  v8[28] = CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation");
  v8[29] = CFSTR("SBTraitsParticipantRoleLogWindowRecipe");
  v8[30] = CFSTR("SBTraitsParticipantRoleMedusaDrag");
  v8[31] = CFSTR("SBTraitsParticipantRoleModifierTimeline");
  v8[32] = CFSTR("SBTraitsParticipantRoleMomentsUI");
  v8[33] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  v8[34] = CFSTR("SBTraitsParticipantRolePerfPowerHUD");
  v8[35] = CFSTR("SBTraitsParticipantRolePictureInPicture");
  v8[36] = CFSTR("SBTraitsParticipantRolePipelineManager");
  v8[37] = CFSTR("SBTraitsParticipantRoleReachability");
  v8[38] = CFSTR("SBTraitsParticipantRoleRecordingIndicator");
  v8[39] = CFSTR("SBTraitsParticipantRoleRenderOverlayRecipe");
  v8[40] = CFSTR("SBTraitsParticipantRoleScreenFlash");
  v8[41] = CFSTR("SBTraitsParticipantRoleSecureApp");
  v8[42] = CFSTR("SBTraitsParticipantRoleStartupFadeAnimation");
  v8[43] = CFSTR("SBTraitsParticipantRoleStatusBar");
  v8[44] = CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI");
  v8[45] = CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay");
  v8[46] = CFSTR("SBTraitsParticipantRoleSwitcherPublisher");
  v8[47] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v8[48] = CFSTR("SBTraitsParticipantRoleSystemAperture");
  v8[49] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v8[50] = CFSTR("SBTraitsParticipantRoleTransientOverlay");
  v8[51] = CFSTR("SBTraitsParticipantRoleTransientOverlayBackground");
  v8[52] = CFSTR("SBTraitsParticipantRoleWallpaper");
  v8[53] = CFSTR("SBTraitsParticipantRoleWallpaperExternal");
  v1 = *MEMORY[0x1E0CEC358];
  v8[54] = CFSTR("SBTraitsParticipantRoleWindowedAccessory");
  v8[55] = v1;
  v2 = *MEMORY[0x1E0CEC368];
  v8[56] = *MEMORY[0x1E0CEC360];
  v8[57] = v2;
  v3 = *MEMORY[0x1E0CEC370];
  v8[58] = *MEMORY[0x1E0CEC378];
  v8[59] = v3;
  v4 = *MEMORY[0x1E0CEC388];
  v8[60] = *MEMORY[0x1E0CEC380];
  v8[61] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 62);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)orientationStageRoles_orientationStageRoles_0;
  orientationStageRoles_orientationStageRoles_0 = v6;

}

@end
