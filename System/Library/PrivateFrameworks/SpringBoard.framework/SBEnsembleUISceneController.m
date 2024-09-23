@implementation SBEnsembleUISceneController

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("class");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v6[2] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("isDaemon");
  v5[3] = CFSTR("jobLabel");
  v6[3] = CFSTR("com.apple.ensemble");
  v6[4] = CFSTR("SBTraitsParticipantRoleEnsembleUI");
  v5[4] = CFSTR("traitsRole");
  v5[5] = CFSTR("workspaceID");
  v6[5] = CFSTR("com.apple.SpringBoard.SceneWorkspace.Ensemble");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
