@implementation SBSecureAppPolicy

+ (BOOL)shouldAlwaysShowSecureSceneForApp:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = shouldAlwaysShowSecureSceneForApp__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldAlwaysShowSecureSceneForApp__onceToken, &__block_literal_global_126);
  v5 = (void *)shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __55__SBSecureAppPolicy_shouldAlwaysShowSecureSceneForApp___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("com.apple.Maps");
  v4[1] = CFSTR("com.apple.purplebuddy");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[2] = CFSTR("com.apple.VirtualDisplayTest");
  v4[3] = CFSTR("com.apple.mobilenotes");
  v4[4] = CFSTR("com.apple.VoiceMemos");
  v4[5] = CFSTR("com.apple.TVRemoteUIService");
  v4[6] = CFSTR("com.apple.ContinuityCaptureShieldUI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene;
  shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene = v2;

}

@end
