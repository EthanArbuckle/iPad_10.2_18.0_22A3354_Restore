@implementation SBRestartManagerWorkspaceDataSource

- (void)terminateAllApplicationsForReason:(int64_t)a3 description:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManagerWorkspaceDataSource.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__SBRestartManagerWorkspaceDataSource_terminateAllApplicationsForReason_description_completion___block_invoke;
  v13[3] = &unk_1E8E9F1C0;
  v14 = v10;
  v11 = v10;
  SBWorkspaceTerminateAllApps(a3, 0, v9, v13);

}

uint64_t __96__SBRestartManagerWorkspaceDataSource_terminateAllApplicationsForReason_description_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)activePrimaryApplicationBundleID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStatePrimaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isUILocked
{
  void *v2;
  char v3;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUILocked");

  return v3;
}

@end
