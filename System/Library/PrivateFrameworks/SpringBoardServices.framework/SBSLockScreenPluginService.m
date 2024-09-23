@implementation SBSLockScreenPluginService

- (id)_serializedDataForContext:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enableLockScreenBundle:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  mach_error_t v12;
  mach_error_t v13;
  NSObject *v14;
  int v15;
  SBSLockScreenPluginService *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBSLockScreenPluginService _serializedDataForContext:](self, "_serializedDataForContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBSSpringBoardServerPort();
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v7);
  v12 = SBEnableLockScreenBundle(v8, 1, v10, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  if (v12)
  {
    v13 = v12;
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = self;
      v17 = 2114;
      v18 = v9;
      v19 = 2082;
      v20 = mach_error_string(v13);
      _os_log_error_impl(&dword_18EB52000, v14, OS_LOG_TYPE_ERROR, "%@: Unable to enable bundle name %{public}@: %{public}s", (uint8_t *)&v15, 0x20u);
    }

  }
}

- (void)disableLockScreenBundle:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  mach_error_t v12;
  mach_error_t v13;
  NSObject *v14;
  int v15;
  SBSLockScreenPluginService *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBSLockScreenPluginService _serializedDataForContext:](self, "_serializedDataForContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBSSpringBoardServerPort();
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v7);
  v12 = SBEnableLockScreenBundle(v8, 0, v10, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  if (v12)
  {
    v13 = v12;
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = self;
      v17 = 2114;
      v18 = v9;
      v19 = 2082;
      v20 = mach_error_string(v13);
      _os_log_error_impl(&dword_18EB52000, v14, OS_LOG_TYPE_ERROR, "%@ Unable to disable bundle name %{public}@: %{public}s", (uint8_t *)&v15, 0x20u);
    }

  }
}

@end
