@implementation PXCPLManageCloudExitModeActionPerformer

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
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to iCloud Storage Settings", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PXCPLManageCloudExitModeActionPerformer_performBackgroundTask__block_invoke;
  v4[3] = &unk_1E5148B78;
  v4[4] = self;
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 5, v4);
}

void __64__PXCPLManageCloudExitModeActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "Did navigate to iCloud Storage Settings";
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
    v8 = "Failed to navigate to iCloud Storage Settings: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

@end
