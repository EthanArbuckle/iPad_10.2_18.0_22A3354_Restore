@implementation SMCTVUserProfileManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_manager;
}

void __41__SMCTVUserProfileManager_sharedInstance__block_invoke()
{
  SMCTVUserProfileManager *v0;
  void *v1;

  v0 = objc_alloc_init(SMCTVUserProfileManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

}

- (SMCTVUserProfile)selectedUserProfile
{
  return 0;
}

@end
