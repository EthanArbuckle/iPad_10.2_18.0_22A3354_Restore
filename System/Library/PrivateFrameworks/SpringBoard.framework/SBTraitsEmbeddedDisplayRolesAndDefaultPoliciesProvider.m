@implementation SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider

- (id)defaultKeyboardFocusDrivenRoles
{
  if (defaultKeyboardFocusDrivenRoles_onceToken != -1)
    dispatch_once(&defaultKeyboardFocusDrivenRoles_onceToken, &__block_literal_global_8);
  return (id)defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles;
}

- (id)defaultOtherParticipantDrivenRoles
{
  if (defaultOtherParticipantDrivenRoles_onceToken != -1)
    dispatch_once(&defaultOtherParticipantDrivenRoles_onceToken, &__block_literal_global_3_0);
  return (id)defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles;
}

- (id)defaultDeviceOrientationDrivenRoles
{
  if (defaultDeviceOrientationDrivenRoles_onceToken != -1)
    dispatch_once(&defaultDeviceOrientationDrivenRoles_onceToken, &__block_literal_global_1);
  return (id)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles;
}

- (id)defaultActiveOrientationBelowDrivenRoles
{
  if (defaultActiveOrientationBelowDrivenRoles_onceToken != -1)
    dispatch_once(&defaultActiveOrientationBelowDrivenRoles_onceToken, &__block_literal_global_63);
  return (id)defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles;
}

void __98__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultActiveOrientationBelowDrivenRoles__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[50];

  v5[49] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("SBTraitsParticipantRoleAlert");
  v5[1] = CFSTR("SBTraitsParticipantRoleAmbient");
  v5[2] = CFSTR("SBTraitsParticipantRoleAssistant");
  v5[3] = CFSTR("SBTraitsParticipantRoleAXAssistiveTouchUI");
  v5[4] = CFSTR("SBTraitsParticipantRoleAXFullKeyboardUI");
  v5[5] = CFSTR("SBTraitsParticipantRoleAXVoiceControlUI");
  v5[6] = CFSTR("SBTraitsParticipantRoleAXUIServer");
  v5[7] = CFSTR("SBTraitsParticipantRoleBanner");
  v5[8] = CFSTR("SBTraitsParticipantRoleBiometricMonitorUI");
  v5[9] = CFSTR("SBTraitsParticipantRoleCommandTab");
  v5[10] = CFSTR("SBTraitsParticipantRoleControlCenter");
  v5[11] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v5[12] = CFSTR("SBTraitsParticipantRoleEnsembleUI");
  v5[13] = CFSTR("SBTraitsParticipantRoleEyedropperUI");
  v5[14] = CFSTR("SBTraitsParticipantRoleFloatingDock");
  v5[15] = CFSTR("SBTraitsParticipantRoleHUD");
  v5[16] = CFSTR("SBTraitsParticipantRoleInteractiveScreenshotGesture");
  v5[17] = CFSTR("SBTraitsParticipantRoleInternalPerfPowerHUD");
  v5[18] = CFSTR("SBTraitsParticipantRoleLiveTranscriptionUI");
  v5[19] = CFSTR("SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation");
  v5[20] = CFSTR("SBTraitsParticipantRoleLogWindowRecipe");
  v5[21] = CFSTR("SBTraitsParticipantRoleMedusaDrag");
  v5[22] = CFSTR("SBTraitsParticipantRoleModifierTimeline");
  v5[23] = CFSTR("SBTraitsParticipantRoleMomentsUI");
  v5[24] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  v5[25] = CFSTR("SBTraitsParticipantRolePerfPowerHUD");
  v5[26] = CFSTR("SBTraitsParticipantRolePictureInPicture");
  v5[27] = CFSTR("SBTraitsParticipantRolePipelineManager");
  v5[28] = CFSTR("SBTraitsParticipantRoleReachability");
  v5[29] = CFSTR("SBTraitsParticipantRoleRecordingIndicator");
  v5[30] = CFSTR("SBTraitsParticipantRoleRenderOverlayRecipe");
  v5[31] = CFSTR("SBTraitsParticipantRoleScreenFlash");
  v5[32] = CFSTR("SBTraitsParticipantRoleStartupFadeAnimation");
  v5[33] = CFSTR("SBTraitsParticipantRoleStatusBar");
  v5[34] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v5[35] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v5[36] = CFSTR("SBTraitsParticipantRoleTransientOverlay");
  v5[37] = CFSTR("SBTraitsParticipantRoleTransientOverlayBackground");
  v5[38] = CFSTR("SBTraitsParticipantRoleWindowedAccessory");
  v5[39] = CFSTR("SBTraitsParticipantRoleSystemAperture");
  v5[40] = CFSTR("SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinator");
  v5[41] = CFSTR("SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinatorHinting");
  v0 = *MEMORY[0x1E0CEC360];
  v5[42] = *MEMORY[0x1E0CEC358];
  v5[43] = v0;
  v1 = *MEMORY[0x1E0CEC378];
  v5[44] = *MEMORY[0x1E0CEC368];
  v5[45] = v1;
  v2 = *MEMORY[0x1E0CEC380];
  v5[46] = *MEMORY[0x1E0CEC370];
  v5[47] = v2;
  v5[48] = *MEMORY[0x1E0CEC388];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 49);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles;
  defaultActiveOrientationBelowDrivenRoles__defaultActiveOrientationBelowRoles = v3;

}

void __93__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultDeviceOrientationDrivenRoles__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5[0] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v5[1] = CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay");
  v5[2] = CFSTR("SBTraitsParticipantRoleCoverSheetCamera");
  v5[3] = CFSTR("SBTraitsParticipantRoleSecureApp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithArray:", v1);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles;
  defaultDeviceOrientationDrivenRoles__defaultDeviceOrientationDrivenRoles = v3;

}

void __92__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultOtherParticipantDrivenRoles__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E08]);
  v7[0] = CFSTR("SBTraitsParticipantRoleWallpaperExternal");
  v7[1] = CFSTR("SBTraitsParticipantRoleHomeScreenDimming");
  v8[0] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v8[1] = CFSTR("SBTraitsParticipantRoleHomeScreen");
  v7[2] = CFSTR("SBTraitsParticipantRoleCoverSheetHomeScreenOverlay");
  v7[3] = CFSTR("SBTraitsParticipantRoleCoverSheetPosterSwitcher");
  v8[2] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v8[3] = CFSTR("SBTraitsParticipantRoleCoverSheet");
  v7[4] = CFSTR("SBTraitsParticipantRoleSwitcherPublisher");
  v7[5] = CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI");
  v8[4] = CFSTR("SBTraitsParticipantRoleSwitcherRaw");
  v8[5] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithDictionary:", v1);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    objc_msgSend(v2, "setObject:forKey:", CFSTR("SBTraitsParticipantRoleHomeScreen"), CFSTR("SBTraitsParticipantRoleWallpaper"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles;
  defaultOtherParticipantDrivenRoles__defaultOtherParticipantDrivenRoles = v5;

}

void __89__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_defaultKeyboardFocusDrivenRoles__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SBTraitsParticipantRoleFloatingKeyboard");
  v2[1] = CFSTR("SBTraitsParticipantRoleInputUI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles;
  defaultKeyboardFocusDrivenRoles___defaultKeyboardDrivenRoles = v0;

}

- (id)defaultIsolationDrivenRoles
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SBTraitsParticipantRoleAssistantAccessory");
  v3[1] = CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay");
  v3[2] = CFSTR("SBTraitsParticipantRoleDruid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)orientationStageRoles
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (orientationStageRoles_onceToken != -1)
    dispatch_once(&orientationStageRoles_onceToken, block);
  return (id)orientationStageRoles_orientationStageRoles;
}

void __79__SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider_orientationStageRoles__block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(a1 + 32), "defaultDeviceOrientationDrivenRoles");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultActiveOrientationBelowDrivenRoles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultKeyboardFocusDrivenRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultIsolationDrivenRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultOtherParticipantDrivenRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count")+ objc_msgSend(v10, "count")+ objc_msgSend(v3, "count")+ objc_msgSend(v4, "count")+ objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v10);
  objc_msgSend(v7, "addObjectsFromArray:", v2);
  objc_msgSend(v7, "addObjectsFromArray:", v3);
  objc_msgSend(v7, "addObjectsFromArray:", v4);
  objc_msgSend(v7, "addObjectsFromArray:", v6);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)orientationStageRoles_orientationStageRoles;
  orientationStageRoles_orientationStageRoles = v8;

}

@end
