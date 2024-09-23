@implementation SBSnapshotTestRecipe

- (id)title
{
  return CFSTR("Snapshot Testing");
}

- (void)handleVolumeIncrease
{
  -[SBSnapshotTestRecipe _sendRequestWithType:](self, "_sendRequestWithType:", 1);
}

- (void)handleVolumeDecrease
{
  -[SBSnapshotTestRecipe _sendRequestWithType:](self, "_sendRequestWithType:", 2);
}

- (void)_sendRequestWithType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStatePrimaryElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sceneIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "settings");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D23228];
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextWithSceneID:settings:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setName:", CFSTR("SBSnapshotTestRecipe"));
    -[NSObject displayConfiguration](v11, "displayConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pointScale");
    objc_msgSend(v15, "setScale:");

    -[NSObject bounds](v11, "bounds");
    objc_msgSend(v15, "setFrame:");
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("invalidate");
      if (a3 == 1)
        v18 = CFSTR("perform");
      v20 = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[SBSnapshotTestRecipe] Sending %@ request with %@", (uint8_t *)&v20, 0x16u);
    }

    if (a3 == 2)
    {
      objc_msgSend(v8, "application");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deleteSnapshotForContext:", v15);
    }
    else
    {
      if (a3 != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v8, "application");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveSnapshotForSceneHandle:context:completion:", v8, v15, 0);
    }

    goto LABEL_13;
  }
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[SBSnapshotTestRecipe] No active app main scene. Ignoring.", (uint8_t *)&v20, 2u);
  }
LABEL_14:

}

@end
