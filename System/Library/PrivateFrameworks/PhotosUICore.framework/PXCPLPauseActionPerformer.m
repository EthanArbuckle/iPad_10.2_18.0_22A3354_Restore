@implementation PXCPLPauseActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  uint8_t v8[16];

  -[PXCPLActionPerformer cplUIStatus](self, "cplUIStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pauseReason");

  PLUserStatusUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Will pause iCloud Photos", v8, 2u);
  }

  if (v4 > 0x12)
    v6 = 0;
  else
    v6 = off_1E5143300[v4];
  v7 = v6;
  _PerformPauseOrResumeBackgroundTask(1, 1, v7, self);

}

@end
