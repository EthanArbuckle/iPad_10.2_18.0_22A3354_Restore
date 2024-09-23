@implementation SBMomentsUISceneController

+ (id)_setupInfo
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C9AAB0];
  v3[0] = CFSTR("enabled");
  v3[1] = CFSTR("class");
  v4[1] = objc_opt_class();
  v4[2] = CFSTR("com.apple.MomentsUIService");
  v3[2] = CFSTR("jobLabel");
  v3[3] = CFSTR("workspaceID");
  v4[3] = CFSTR("com.apple.SpringBoard.SceneWorkspace.Moments");
  v4[4] = CFSTR("SBTraitsParticipantRoleMomentsUI");
  v3[4] = CFSTR("traitsRole");
  v3[5] = CFSTR("vendingStrategy");
  v4[5] = &unk_1E91D0AA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
