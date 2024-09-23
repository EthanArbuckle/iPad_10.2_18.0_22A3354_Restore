@implementation WBSPasswordBreachConfigurationBagLoader

- (WBSPasswordBreachConfigurationBagLoader)init
{
  WBSPasswordBreachConfigurationBagLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSPasswordBreachConfigurationBagLoader *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordBreachConfigurationBagLoader;
  v2 = -[WBSPasswordBreachConfigurationBagLoader init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("WBSPasswordBreachConfigurationBag"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_settingsDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0D89CB8]);
    v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 0, v4, v6, CFSTR("PasswordBreachAwarenessConfigurationBag"), CFSTR("1"), CFSTR("WBSPasswordBreachConfigurationBagLastUpdate"), 86400.0, v8, objc_opt_class());
    remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
    v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v9;

    -[WBSRemotelyUpdatableDataController setDelegate:](v2->_remotelyUpdatableDataController, "setDelegate:", v2);
    -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v2->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
    v11 = v2;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachConfigurationBagLoader;
  -[WBSPasswordBreachConfigurationBagLoader dealloc](&v3, sel_dealloc);
}

+ (WBSPasswordBreachConfigurationBagLoader)sharedLoader
{
  if (sharedLoader_onceToken != -1)
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_79);
  return (WBSPasswordBreachConfigurationBagLoader *)(id)sharedLoader_loader;
}

void __55__WBSPasswordBreachConfigurationBagLoader_sharedLoader__block_invoke()
{
  WBSPasswordBreachConfigurationBagLoader *v0;
  void *v1;

  v0 = objc_alloc_init(WBSPasswordBreachConfigurationBagLoader);
  v1 = (void *)sharedLoader_loader;
  sharedLoader_loader = (uint64_t)v0;

}

- (void)getConfigurationBagWithCompletionHandler:(id)a3
{
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](self->_remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

@end
