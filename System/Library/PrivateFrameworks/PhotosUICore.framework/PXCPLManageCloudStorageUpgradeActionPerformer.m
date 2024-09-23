@implementation PXCPLManageCloudStorageUpgradeActionPerformer

- (void)performBackgroundTask
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  PLUserStatusUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to iCloud Storage Upgrade", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PXCPLManageCloudStorageUpgradeActionPerformer_performBackgroundTask__block_invoke_43;
  v4[3] = &unk_1E5148B78;
  v4[4] = self;
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 11, v4);
}

- (void)_handleFetchedMessage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  PXCPLManageCloudStorageUpgradeActionPerformer *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    objc_msgSend(v6, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PLUserStatusUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138544130;
        v15 = objc_opt_class();
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = v9;
        v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Perform action: %{public}@, for message: %{public}@", (uint8_t *)&v14, 0x2Au);
      }

      objc_msgSend(v9, "performAction");
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543874;
        v15 = objc_opt_class();
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = v6;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "<%{public}@:%p> No action available for message: %{public}@", (uint8_t *)&v14, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No action available for ICQInAppMessage"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v13);

    }
  }
  else
  {
    PLUserStatusUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543874;
      v15 = objc_opt_class();
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Failed to fetch message, error: %@", (uint8_t *)&v14, 0x20u);
    }

    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v7);
  }

}

void __70__PXCPLManageCloudStorageUpgradeActionPerformer_performBackgroundTask__block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUserStatusUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "Did navigate to iCloud Storage Upgrade";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v5;
    v8 = "Failed to navigate to iCloud Storage Upgrade: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

@end
