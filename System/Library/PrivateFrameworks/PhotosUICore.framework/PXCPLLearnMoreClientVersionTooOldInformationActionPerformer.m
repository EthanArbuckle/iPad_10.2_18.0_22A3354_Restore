@implementation PXCPLLearnMoreClientVersionTooOldInformationActionPerformer

- (void)performBackgroundTask
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  PLUserStatusUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to 'client version too old' KB article", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht212139?cid=mc-ols-icloudphotos-article_ht212139-ios_ui-01212021"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__PXCPLLearnMoreClientVersionTooOldInformationActionPerformer_performBackgroundTask__block_invoke;
  v6[3] = &unk_1E5142510;
  objc_copyWeak(&v7, buf);
  objc_msgSend(v5, "openURL:withCompletionHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_didOpenURL:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a3;
  if (a3)
  {
    PLUserStatusUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Did navigate to 'client version too old' KB article", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to navigate to 'client version too old' KB article"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to 'client version too old' KB article", v7, 2u);
    }
  }

  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", v3, v6);
}

void __84__PXCPLLearnMoreClientVersionTooOldInformationActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didOpenURL:", a2);

}

@end
