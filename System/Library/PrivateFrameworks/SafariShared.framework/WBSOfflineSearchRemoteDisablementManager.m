@implementation WBSOfflineSearchRemoteDisablementManager

- (void)areOfflineSearchSuggestionsDisabled:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  char v6;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  void (**v8)(id, _QWORD);
  _QWORD v9[4];
  id v10;

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D89D08], "sharedObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGoogleEnabledSearchEngine");

  if ((v6 & 1) == 0)
    v4[2](v4, 0);
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__WBSOfflineSearchRemoteDisablementManager_areOfflineSearchSuggestionsDisabled___block_invoke;
  v9[3] = &unk_1E4B3D2A8;
  v10 = v4;
  v8 = v4;
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v9);

}

+ (WBSOfflineSearchRemoteDisablementManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_74);
  return (WBSOfflineSearchRemoteDisablementManager *)(id)sharedManager_sharedManager_1;
}

void __80__WBSOfflineSearchRemoteDisablementManager_areOfflineSearchSuggestionsDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D89D08];
  v4 = a2;
  objc_msgSend(v3, "sharedObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSearchEngineShortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "areOfflineSearchSuggestionsDisabledRemotelyForSearchProvider:", v5);

  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v6);
}

void __57__WBSOfflineSearchRemoteDisablementManager_sharedManager__block_invoke()
{
  WBSOfflineSearchRemoteDisablementManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSOfflineSearchRemoteDisablementManager);
  v1 = (void *)sharedManager_sharedManager_1;
  sharedManager_sharedManager_1 = (uint64_t)v0;

}

- (WBSOfflineSearchRemoteDisablementManager)init
{
  WBSOfflineSearchRemoteDisablementManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSOfflineSearchRemoteDisablementManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSOfflineSearchRemoteDisablementManager;
  v2 = -[WBSOfflineSearchRemoteDisablementManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("WBSOfflineSearchRemoteDisablementDefaultConfig"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_settingsDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0D89CB8]);
    v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 0, v4, v6, CFSTR("OfflineSearchRemoteDisablement"), CFSTR("1"), CFSTR("WBSOfflineSearchDisablementKey"), 86400.0, v8, objc_opt_class());
    remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
    v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v9;

    -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v2->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
    v11 = v2;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

@end
