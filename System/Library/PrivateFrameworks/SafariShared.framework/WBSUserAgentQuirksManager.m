@implementation WBSUserAgentQuirksManager

- (WBSUserAgentQuirksManager)init
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  WBSUserAgentQuirksManager *v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("DebugUserAgentQuirksConfigurationUpdateInterval"));
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("UserAgentQuirks"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_settingsDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 86400.0;
  if (v5 != 0.0)
    v10 = v5;
  v11 = -[WBSUserAgentQuirksManager initWithBuiltInQuirkListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:](self, "initWithBuiltInQuirkListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v7, v9, CFSTR("UserAgentQuirks"), CFSTR("1"), CFSTR("UserAgentQuirksConfigurationUpdateDate"), v10);

  return v11;
}

- (WBSUserAgentQuirksManager)initWithBuiltInQuirkListURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSUserAgentQuirksManager *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSUserAgentQuirksManager *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSUserAgentQuirksManager;
  v19 = -[WBSUserAgentQuirksManager init](&v26, sel_init);
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

- (void)getQuirksForURLString:(id)a3 withDefaultUserAgent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__WBSUserAgentQuirksManager_getQuirksForURLString_withDefaultUserAgent_completionHandler___block_invoke;
  v15[3] = &unk_1E4B40658;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v15);

}

void __90__WBSUserAgentQuirksManager_getQuirksForURLString_withDefaultUserAgent_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  objc_msgSend(a2, "quirkTypeForURLString:withDefaultUserAgent:", a1[4], a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

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
