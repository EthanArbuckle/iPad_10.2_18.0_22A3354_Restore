@implementation SRSVoiceProfileManager

- (SRSVoiceProfileManager)init
{
  SRSVoiceProfileManager *v2;
  uint64_t v3;
  SSRVoiceProfileManager *voiceProfileManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSVoiceProfileManager;
  v2 = -[SRSVoiceProfileManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    voiceProfileManager = v2->_voiceProfileManager;
    v2->_voiceProfileManager = (SSRVoiceProfileManager *)v3;

  }
  return v2;
}

- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 languageCode:(id)a4
{
  return -[SSRVoiceProfileManager isSATEnrolledForSiriProfileId:forLanguageCode:](self->_voiceProfileManager, "isSATEnrolledForSiriProfileId:forLanguageCode:", a3, a4);
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  return -[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:](self->_voiceProfileManager, "hasVoiceProfileIniCloudForLanguageCode:", a3);
}

- (void)markSATEnrollmentSuccessForVoiceProfile:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:](self->_voiceProfileManager, "markSATEnrollmentSuccessForVoiceProfile:", v5);

}

- (void)deleteUserVoiceProfile:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)-[SSRVoiceProfileManager deleteUserVoiceProfile:](self->_voiceProfileManager, "deleteUserVoiceProfile:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
}

@end
