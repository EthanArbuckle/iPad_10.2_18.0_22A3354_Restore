@implementation SBPerfPowerHUDSceneController

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("class");
  v6[0] = objc_opt_class();
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[1] = CFSTR("enabled");
  v5[2] = CFSTR("jobLabel");
  v6[2] = CFSTR("com.apple.PerfPowerHUD");
  v6[3] = CFSTR("SBTraitsParticipantRolePerfPowerHUD");
  v5[3] = CFSTR("traitsRole");
  v5[4] = CFSTR("hostLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBE28] + 5.0 + -1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[5] = CFSTR("workspaceID");
  v6[4] = v2;
  v6[5] = CFSTR("com.apple.SpringBoard.SceneWorkspace.PerfPowerHUD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
