@implementation SBScreenshotManagerDataSource

- (id)screenshotManagerScreensToScreenshot:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "allowsCapability:explanation:", 18, &v10);
  v6 = v10;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBScreenshotManagerDataSource screenshotManagerScreensToScreenshot:].cold.1((uint64_t)v6, v7);
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)screenshotManagerScreensToScreenshot:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unable to snapshot screens for reason: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
