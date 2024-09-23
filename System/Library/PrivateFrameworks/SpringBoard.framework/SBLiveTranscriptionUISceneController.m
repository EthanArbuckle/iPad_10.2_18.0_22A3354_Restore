@implementation SBLiveTranscriptionUISceneController

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("class");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v7[2] = CFSTR("com.apple.livetranscriptionui");
  v6[2] = CFSTR("jobLabel");
  v6[3] = CFSTR("traitsRole");
  v7[3] = CFSTR("SBTraitsParticipantRoleLiveTranscriptionUI");
  v7[4] = CFSTR("com.apple.SpringBoard.SceneWorkspace.LiveTranscriptionUI");
  v6[4] = CFSTR("workspaceID");
  v6[5] = CFSTR("hostLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBB98] + 5.0 + -0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
