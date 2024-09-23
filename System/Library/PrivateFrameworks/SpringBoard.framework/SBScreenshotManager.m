@implementation SBScreenshotManager

- (SBScreenshotManager)initWithDataSource:(id)a3
{
  id v4;
  _SBScreenshotPersistenceCoordinator *v5;
  void *v6;
  SBScreenshotManager *v7;

  v4 = a3;
  v5 = objc_alloc_init(_SBScreenshotPersistenceCoordinator);
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBScreenshotManager _initWithDataSource:persistenceCoordinator:sceneManagerCoordinator:](self, "_initWithDataSource:persistenceCoordinator:sceneManagerCoordinator:", v4, v5, v6);

  return v7;
}

- (id)_initWithDataSource:(id)a3 persistenceCoordinator:(id)a4 sceneManagerCoordinator:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBScreenshotManager *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBScreenshotManager;
  v12 = -[SBScreenshotManager init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 1, a5);
  }

  return p_isa;
}

- (void)saveScreenshots
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBScreenshotManager saveScreenshots]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBScreenshotManager.m"), 62, CFSTR("this call must be made on the main thread"));

  }
  -[SBScreenshotManager saveScreenshotsWithCompletion:](self, "saveScreenshotsWithCompletion:", 0);
}

- (void)saveScreenshotsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  SBScreenshotManager *v34;
  void (**v35)(id, _QWORD);
  uint64_t v36;
  id obj;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBScreenshotManager saveScreenshotsWithCompletion:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("SBScreenshotManager.m"), 68, CFSTR("this call must be made on the main thread"));

  }
  if (!-[_SBScreenshotPersistenceCoordinator isSaving](self->_persistenceCoordinator, "isSaving"))
  {
    -[SBScreenshotManager _fetchEligibleScreenshotProvidersForSnapshotting](self, "_fetchEligibleScreenshotProvidersForSnapshotting");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v7)
    {
      v8 = v7;
      v38 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v50;
      v34 = self;
      v35 = v4;
      v33 = *(_QWORD *)v50;
      do
      {
        v11 = 0;
        v36 = v8;
        do
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
          objc_msgSend(v12, "captureScreenshot", v33, v34, v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "screen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "displayIdentity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            v16 = v15 == 0;
          else
            v16 = 1;
          if (!v16)
          {
            v44 = v15;
            objc_msgSend(v12, "flasher");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "flashWhiteWithCompletion:", 0);

            if ((v9 & 1) == 0)
              v9 = 1;
            v43 = v9;
            v42 = v11;
            v40 = v14;
            if (v4)
            {
              v18 = v38;
              if (!v38)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v38 = v18;
              v19 = v44;
              objc_msgSend(v18, "setObject:forKey:", v13, v44);
            }
            else
            {
              v19 = v44;
            }
            v41 = v13;
            -[_SBScreenshotPersistenceCoordinator saveScreenshot:withCompletion:](self->_persistenceCoordinator, "saveScreenshot:withCompletion:", v13, 0);
            -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self->_sceneManagerCoordinator, "sceneManagerForDisplayIdentity:", v19);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "externalForegroundApplicationSceneHandles");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v46 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  objc_msgSend(v25, "sceneIfExists");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    v27 = objc_alloc_init(MEMORY[0x1E0CEA520]);
                    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    SBLogCommon();
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v54 = v25;
                      _os_log_error_impl(&dword_1D0540000, v29, OS_LOG_TYPE_ERROR, "sending screenshot action to scene: %{public}@", buf, 0xCu);
                    }

                    objc_msgSend(v26, "sendActions:", v28);
                  }

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
              }
              while (v22);
            }

            self = v34;
            v4 = v35;
            v9 = v43;
            v10 = v33;
            v8 = v36;
            v13 = v41;
            v11 = v42;
            v14 = v40;
            v15 = v44;
          }

          ++v11;
        }
        while (v11 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v8);
      if ((v9 & 1) != 0)
        AudioServicesPlaySystemSoundWithCompletion(0x454u, 0);
      if (!v4)
        goto LABEL_46;
      if (v38)
      {
        ((void (**)(id, void *))v4)[2](v4, v38);
LABEL_46:

        v6 = v38;
        goto LABEL_47;
      }
    }
    else if (!v4)
    {
LABEL_45:
      v38 = 0;
      goto LABEL_46;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v30);

    goto LABEL_45;
  }
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SBScreenshotManager saveScreenshotsWithCompletion:].cold.1(v5);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v6);
LABEL_47:

  }
}

- (id)_fetchEligibleScreenshotProvidersForSnapshotting
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBScreenshotManagerDataSource screenshotManagerScreensToScreenshot:](self->_dataSource, "screenshotManagerScreensToScreenshot:", self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[SBScreenshotManager _providerForScreen:](self, "_providerForScreen:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_providerForScreen:(id)a3
{
  id v3;
  id v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = off_1E8E99E68;
  if (v4 != v3)
    v5 = off_1E8E99CA0;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithScreen:", v3);

  return v6;
}

- (SBScreenshotManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (SBSceneManagerCoordinator)_sceneManagerCoordinator
{
  return self->_sceneManagerCoordinator;
}

- (void)_setSceneManagerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManagerCoordinator, a3);
}

- (_SBScreenshotPersistenceCoordinator)_persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (void)_setPersistenceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneManagerCoordinator, 0);
}

- (void)saveScreenshotsWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Previous screenshot(s) are still being written", v1, 2u);
}

@end
