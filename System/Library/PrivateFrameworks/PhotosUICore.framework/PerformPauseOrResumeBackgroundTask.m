@implementation PerformPauseOrResumeBackgroundTask

void ___PerformPauseOrResumeBackgroundTask_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUserStatusUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      v9 = "Did %{public}@ system budgets for iCloud Photos";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v21 = v13;
    v22 = 2112;
    v23 = v5;
    v9 = "Failed to %{public}@ system budgets for iCloud Photos with error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___PerformPauseOrResumeBackgroundTask_block_invoke_81;
  block[3] = &unk_1E51473C0;
  v14 = *(id *)(a1 + 40);
  v19 = a2;
  v17 = v14;
  v18 = v5;
  v15 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t ___PerformPauseOrResumeBackgroundTask_block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
