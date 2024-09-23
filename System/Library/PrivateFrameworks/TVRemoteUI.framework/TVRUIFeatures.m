@implementation TVRUIFeatures

+ (BOOL)isWakeToRemoteOnLockScreenDisabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__TVRUIFeatures_isWakeToRemoteOnLockScreenDisabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __51__TVRUIFeatures_isWakeToRemoteOnLockScreenDisabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteWakeToRemoteOnLockScreenDisabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)isTapToRadarEnabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__TVRUIFeatures_isTapToRadarEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __36__TVRUIFeatures_isTapToRadarEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteTTRDisabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue") ^ 1;

  return v2;
}

+ (BOOL)_isInternalInstall
{
  if (_isInternalInstall_onceToken != -1)
    dispatch_once(&_isInternalInstall_onceToken, &__block_literal_global_10);
  return _isInternalInstall__isInternal;
}

uint64_t __35__TVRUIFeatures__isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _isInternalInstall__isInternal = result;
  return result;
}

+ (BOOL)corianderEnabled
{
  return objc_msgSend(MEMORY[0x24BEB4088], "corianderEnabled");
}

+ (BOOL)persistHintsUIEnabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__TVRUIFeatures_persistHintsUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __38__TVRUIFeatures_persistHintsUIEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemotePersistHintsUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)isHintsDebugUIEnabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__TVRUIFeatures_isHintsDebugUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __38__TVRUIFeatures_isHintsDebugUIEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteHintsDebugUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)isCorianderDebugUIEnabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__TVRUIFeatures_isCorianderDebugUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __42__TVRUIFeatures_isCorianderDebugUIEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteCorianderDebugUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)swapBackPlayPauseButtonsEnabled
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__TVRUIFeatures_swapBackPlayPauseButtonsEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __48__TVRUIFeatures_swapBackPlayPauseButtonsEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteSwapBackPlayPauseButtons"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)showExperimentalCastTab
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__TVRUIFeatures_showExperimentalCastTab__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __40__TVRUIFeatures_showExperimentalCastTab__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteShowCastTab"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)replaceMuteButtonWithContextMenu
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__TVRUIFeatures_replaceMuteButtonWithContextMenu__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __49__TVRUIFeatures_replaceMuteButtonWithContextMenu__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteReplaceMuteButtonWithContextMenu"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)includeRTReviewInInfoPanel
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__TVRUIFeatures_includeRTReviewInInfoPanel__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return objc_msgSend(a1, "_valueForInternalInstallWithBlock:", v3);
}

uint64_t __43__TVRUIFeatures_includeRTReviewInInfoPanel__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_globalPrefForKey:", CFSTR("TVRemoteIncludeRTInInfoPanel"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (BOOL)_valueForInternalInstallWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  char v5;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (objc_msgSend(a1, "_isInternalInstall"))
    v5 = v4[2](v4);
  else
    v5 = 0;

  return v5;
}

+ (id)_globalPrefForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
