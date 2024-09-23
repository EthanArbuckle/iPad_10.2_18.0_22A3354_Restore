@implementation WBSDomainAllowListManager

- (WBSDomainAllowListManager)init
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  WBSDomainAllowListManager *v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("DebugAutoplayWhitelistConfigurationUpdateInterval"));
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("SitesAllowedToAutoplay"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_settingsDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 86400.0;
  if (v5 != 0.0)
    v10 = v5;
  v11 = -[WBSDomainAllowListManager initWithBuiltInAllowListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:](self, "initWithBuiltInAllowListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v7, v9, CFSTR("SitesAllowedToAutoplay"), CFSTR("1"), CFSTR("AutoplayPolicyWhitelistConfigurationUpdateDate"), v10);

  return v11;
}

- (WBSDomainAllowListManager)initWithBuiltInAllowListURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSDomainAllowListManager *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSDomainAllowListManager *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSDomainAllowListManager;
  v19 = -[WBSDomainAllowListManager init](&v26, sel_init);
  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0D89CB8]);
    v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 0, v14, v15, v16, v17, v18, a8, v21, objc_opt_class());
    remotelyUpdatableDataController = v19->_remotelyUpdatableDataController;
    v19->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v22;

    if (a8 != 0.0)
      -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v19->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
    v24 = v19;
  }

  return v19;
}

- (void)isDomainAllowed:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__WBSDomainAllowListManager_isDomainAllowed_completionHandler___block_invoke;
  v11[3] = &unk_1E4B38F20;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v11);

}

uint64_t __63__WBSDomainAllowListManager_isDomainAllowed_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(a2, "isDomainAllowed:", *(_QWORD *)(a1 + 32)));
}

- (void)prepareForTermination
{
  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

@end
