@implementation SBContinuityScreenshotManager

- (void)noteCapturedScreenshot
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBContinuityScreenshotManager noteCapturedScreenshot]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBContinuityScreenshotManager.m"), 17, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManagerProvider);
  objc_msgSend(WeakRetained, "sceneManagerforContinuityScreenshotManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "externalForegroundApplicationSceneHandles");
    v5 = objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v6)
    {
      v7 = v6;
      v17 = v4;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "sceneIfExists");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0CEA520]);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            SBLogContinuitySession();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v10;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBContinuityScreenshotManager - sending continuity screenshot action to scene: %{public}@", buf, 0xCu);
            }

            objc_msgSend(v11, "sendActions:", v13);
          }

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v7);
      v4 = v17;
    }
  }
  else
  {
    SBLogContinuitySession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBContinuityScreenshotManager - no scene manager provided so we aren't notifying anyone about the screenshot", buf, 2u);
    }
  }

}

- (SBContinuityScreenshotManagerSceneManagerProvider)sceneManagerProvider
{
  return (SBContinuityScreenshotManagerSceneManagerProvider *)objc_loadWeakRetained((id *)&self->_sceneManagerProvider);
}

- (void)setSceneManagerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sceneManagerProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneManagerProvider);
}

@end
