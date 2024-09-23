@implementation SBDruidUISceneController

+ (id)_setupInfo
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("class");
  v4[0] = objc_opt_class();
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[1] = CFSTR("enabled");
  v3[2] = CFSTR("isDaemon");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("com.apple.DragUI.druid");
  v3[3] = CFSTR("jobLabel");
  v3[4] = CFSTR("traitsRole");
  v3[5] = CFSTR("workspaceID");
  v4[4] = CFSTR("SBTraitsParticipantRoleDruid");
  v4[5] = CFSTR("com.apple.SpringBoard.SceneWorkspace.DruidUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
