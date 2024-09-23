@implementation PXCPLLearnMoreUpgradeSuggestedActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitCPLActionPerformer photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cplStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "clientFeatureCompatibleVersion");
  v6 = objc_msgSend(v4, "serverFeatureCompatibleVersion");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceFeatureVersion=%lu"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("serverFeatureVersion=%lu#%lu"), v6, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(CFSTR("https://support.apple.com/kb/HT210706"), "stringByAppendingString:", CFSTR("?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("&"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("https://support.apple.com/kb/HT210706");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PLUserStatusUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Will navigate to 'upgrade suggested' KB article with URL: \"%{public}@\", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__PXCPLLearnMoreUpgradeSuggestedActionPerformer_performBackgroundTask__block_invoke;
  v16[3] = &unk_1E5142510;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v15, "openURL:withCompletionHandler:", v13, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

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
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Did navigate to 'upgrade suggested' KB article", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to navigate to 'upgrade suggested' KB article"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to 'upgrade suggested' KB article", v7, 2u);
    }
  }

  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", v3, v6);
}

void __70__PXCPLLearnMoreUpgradeSuggestedActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didOpenURL:", a2);

}

@end
