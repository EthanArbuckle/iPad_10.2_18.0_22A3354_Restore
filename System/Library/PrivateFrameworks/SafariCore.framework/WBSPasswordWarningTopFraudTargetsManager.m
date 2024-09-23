@implementation WBSPasswordWarningTopFraudTargetsManager

- (WBSPasswordWarningTopFraudTargetsManager)init
{
  void *v3;
  void *v4;
  WBSPasswordWarningTopFraudTargetsManager *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("WBSPasswordWarningTopFraudTargets"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[WBSPasswordWarningTopFraudTargetsManager _initWithBuiltinListURL:shouldAttemptToUpdateConfiguration:](self, "_initWithBuiltinListURL:shouldAttemptToUpdateConfiguration:", v4, 1);
  return v5;
}

- (id)_initWithBuiltinListURL:(id)a3 shouldAttemptToUpdateConfiguration:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WBSPasswordWarningTopFraudTargetsManager *v7;
  void *v8;
  void *v9;
  WBSRemotelyUpdatableDataController *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSPasswordWarningTopFraudTargetsManager *v15;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSPasswordWarningTopFraudTargetsManager;
  v7 = -[WBSPasswordWarningTopFraudTargetsManager init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_settingsDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [WBSRemotelyUpdatableDataController alloc];
    if (v4)
      v11 = v9;
    else
      v11 = 0;
    v12 = objc_opt_class();
    v13 = -[WBSRemotelyUpdatableDataController initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:](v10, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 0, v6, v11, CFSTR("PasswordBreachAwarenessTopFraudTargets"), CFSTR("1"), CFSTR("WBSPasswordWarningTopFraudTargetsLastUpdate"), 86400.0, v12, objc_opt_class());
    remotelyUpdatableDataController = v7->_remotelyUpdatableDataController;
    v7->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v13;

    -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v7->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", v4);
    v15 = v7;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordWarningTopFraudTargetsManager;
  -[WBSPasswordWarningTopFraudTargetsManager dealloc](&v3, sel_dealloc);
}

- (void)getTopFraudTargetsWithCompletionHandler:(id)a3
{
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](self->_remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

@end
