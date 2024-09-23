@implementation SSRVoiceProfileXPCServiceProxy

- (BOOL)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSATEnrolledForSiriProfileId:forLanguageCode:", v6, v5);

  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1620);
  return (id)sharedInstance__sharedInstance;
}

void __48__SSRVoiceProfileXPCServiceProxy_sharedInstance__block_invoke()
{
  SSRVoiceProfileXPCServiceProxy *v0;
  void *v1;

  v0 = objc_alloc_init(SSRVoiceProfileXPCServiceProxy);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
