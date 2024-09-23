@implementation SBDisplayCalibratorUISceneController

+ (id)_setupInfo
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("class");
  v4[0] = objc_opt_class();
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[1] = CFSTR("enabled");
  v3[2] = CFSTR("traitsRole");
  v3[3] = CFSTR("presentationStyle");
  v4[2] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v4[3] = &unk_1E91CFF90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
