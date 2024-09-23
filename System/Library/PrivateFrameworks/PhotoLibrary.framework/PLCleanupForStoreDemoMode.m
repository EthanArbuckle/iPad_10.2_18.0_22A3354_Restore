@implementation PLCleanupForStoreDemoMode

id __PLCleanupForStoreDemoMode_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *Log;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Log = PLStoreDemoModeGetLog();
  v7 = Log;
  if (a2)
  {
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v8 = "Completed cleanupForStoreDemoMode successfully";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1B9897000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
  {
    v13 = 138543362;
    v14 = a3;
    v8 = "Failed to perform cleanupForStoreDemoMode: %{public}@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_6;
  }
  return *(id *)(a1 + 32);
}

@end
