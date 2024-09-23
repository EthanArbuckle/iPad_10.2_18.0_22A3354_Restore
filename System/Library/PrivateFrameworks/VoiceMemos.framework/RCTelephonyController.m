@implementation RCTelephonyController

+ (id)sharedTelephonyController
{
  void *v2;
  RCTelephonyController *v3;
  void *v4;

  v2 = (void *)sharedTelephonyController___sharedTelephonyController;
  if (!sharedTelephonyController___sharedTelephonyController)
  {
    v3 = objc_alloc_init(RCTelephonyController);
    v4 = (void *)sharedTelephonyController___sharedTelephonyController;
    sharedTelephonyController___sharedTelephonyController = (uint64_t)v3;

    v2 = (void *)sharedTelephonyController___sharedTelephonyController;
  }
  return v2;
}

- (BOOL)isCallPresent
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentAudioAndVideoCallCount") != 0;

  return v3;
}

@end
