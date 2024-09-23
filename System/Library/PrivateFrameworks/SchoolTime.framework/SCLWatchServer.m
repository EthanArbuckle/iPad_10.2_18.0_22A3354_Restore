@implementation SCLWatchServer

+ (id)sharedWatchServer
{
  if (sharedWatchServer_onceToken != -1)
    dispatch_once(&sharedWatchServer_onceToken, &__block_literal_global_8);
  return (id)sharedWatchServer___sharedWatchServer;
}

void __35__SCLWatchServer_sharedWatchServer__block_invoke()
{
  SCLWatchServer *v0;
  void *v1;

  v0 = objc_alloc_init(SCLWatchServer);
  v1 = (void *)sharedWatchServer___sharedWatchServer;
  sharedWatchServer___sharedWatchServer = (uint64_t)v0;

}

- (void)run
{
  void *v3;
  void *v4;
  dispatch_workloop_t v5;
  SCLSchoolModeManager *v6;
  SCLSchoolModeManager *schoolModeManager;
  SCLSchoolModeManagerConfiguration *v8;

  v8 = objc_alloc_init(SCLSchoolModeManagerConfiguration);
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeManagerConfiguration setDeviceRegistry:](v8, "setDeviceRegistry:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.tinker.school"));
  -[SCLSchoolModeManagerConfiguration setService:](v8, "setService:", v4);
  -[SCLSchoolModeManagerConfiguration setManagesSchoolTimeSession:](v8, "setManagesSchoolTimeSession:", 1);
  -[SCLSchoolModeManagerConfiguration setAllowsNonTinkerPairing:](v8, "setAllowsNonTinkerPairing:", 1);
  v5 = dispatch_workloop_create("com.apple.schooltime");
  -[SCLSchoolModeManagerConfiguration setWorkloop:](v8, "setWorkloop:", v5);
  v6 = -[SCLSchoolModeManager initWithConfiguration:]([SCLSchoolModeManager alloc], "initWithConfiguration:", v8);
  schoolModeManager = self->_schoolModeManager;
  self->_schoolModeManager = v6;

  -[SCLSchoolModeManager start](self->_schoolModeManager, "start");
}

- (SCLSchoolModeManager)schoolModeManager
{
  return self->_schoolModeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schoolModeManager, 0);
}

@end
