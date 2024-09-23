@implementation WFRemoteQuarantinePolicyManager

uint64_t __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v23 = 0;
  objc_msgSend(v7, "databaseWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (__CFString *)v23;
  if (!v8)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
      v26 = 2114;
      v27 = v9;
      v12 = "%s Failed to initialize database, not updating quarantine bundles: %{public}@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v13, v14, v12, buf, v15);
    }
LABEL_7:

    v6[2](v6);
    goto LABEL_12;
  }
  objc_msgSend(v8, "sortedVisibleWorkflowsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "allConfiguredTriggers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      goto LABEL_9;
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
      v12 = "%s Not updating the remote quarantine bundle because there are no shortcuts present";
      v13 = v11;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 12;
      goto LABEL_6;
    }
    goto LABEL_7;
  }

LABEL_9:
  getWFGeneralLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]_block_invoke";
    v26 = 2112;
    v27 = CFSTR("com.apple.siriactionsd.RemoteQuarantineUpdate");
    _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_INFO, "%s Remote quarantine bundle update activity invoked: (%@)", buf, 0x16u);
  }

  v19 = *(void **)(a1 + 40);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke_105;
  v21[3] = &unk_1E7AA6CE0;
  v22 = v6;
  objc_msgSend(v19, "updatePolicyWithXPCActivity:completionHandler:", v5, v21);

LABEL_12:
  return 0;
}

uint64_t __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
