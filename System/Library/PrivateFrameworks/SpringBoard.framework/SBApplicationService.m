@implementation SBApplicationService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_56);
  return (id)sharedInstance___sharedInstance_4;
}

void __38__SBApplicationService_sharedInstance__block_invoke()
{
  SBApplicationService *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBApplicationService alloc];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBApplicationService _initWithApplicationController:](v0, "_initWithApplicationController:", v3);
  v2 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = v1;

}

- (id)_initWithApplicationController:(id)a3
{
  id v5;
  SBApplicationService *v6;
  SBApplicationService *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationService;
  v6 = -[SBApplicationService init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationController, a3);
    +[SBApplicationServer sharedInstance](SBApplicationServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMiscDelegate:", v7);

  }
  return v7;
}

- (void)applicationServer:(id)a3 client:(id)a4 deleteSnapshotsForApplicationIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.frontboard.delete-application-snapshots")) & 1) != 0
    || objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.springboard.delete-application-snapshots")))
  {
    -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      -[NSObject deleteAllSnapshots](v10, "deleteAllSnapshots");
      -[NSObject _clearSceneTitles](v11, "_clearSceneTitles");
    }
  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBApplicationService applicationServer:client:deleteSnapshotsForApplicationIdentifier:].cold.1((uint64_t)v8, (uint64_t)v7, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationController, 0);
}

- (void)applicationServer:(uint64_t)a1 client:(uint64_t)a2 deleteSnapshotsForApplicationIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unable to delete snapshots for bundle identifier: %{public}@ because client: %{public}@ does not have the proper authorization permissions required.", (uint8_t *)&v3, 0x16u);
}

@end
