@implementation SBMagnifierUISceneController

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  _QWORD v5[8];
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("class");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v6[2] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("isDaemon");
  v5[3] = CFSTR("jobLabel");
  v6[3] = CFSTR("com.apple.accessibility.MagnifierAngel");
  v6[4] = &unk_1E91CF618;
  v5[4] = CFSTR("hostLevel");
  v5[5] = CFSTR("traitsRole");
  v6[5] = CFSTR("SBTraitsParticipantRoleAXUIServer");
  v6[6] = &unk_1E91CFBE8;
  v5[6] = CFSTR("vendingStrategy");
  v5[7] = CFSTR("workspaceID");
  v6[7] = CFSTR("com.apple.SpringBoard.SceneWorkspace.MagnifierUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
