@implementation PXCPLResumeActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXCPLActionPerformer cplUIStatus](self, "cplUIStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pauseReason");

  PLUserStatusUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 0x12)
      v6 = 0;
    else
      v6 = off_1E5143300[v4];
    v7 = v6;
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Will resume iCloud Photos for: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (v4 > 0x12)
    v8 = 0;
  else
    v8 = off_1E5143300[v4];
  v9 = v8;
  _PerformPauseOrResumeBackgroundTask(0, v4 == 1, v9, self);

}

@end
