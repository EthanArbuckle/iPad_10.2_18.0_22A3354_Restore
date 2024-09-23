@implementation WFTriggerIDsToDisableNotificationUserInfoFromTriggers

id __WFTriggerIDsToDisableNotificationUserInfoFromTriggers_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BB3598]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "workflowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "referenceForWorkflowID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  +[WFWorkflow workflowWithReference:database:error:](WFWorkflow, "workflowWithReference:database:error:", v7, v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    WFTriggerNotificationUserInfoForDisabling(v3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "WFTriggerIDsToDisableNotificationUserInfoFromTriggers_block_invoke";
      v17 = 2112;
      v18 = v3;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get workflow with configuredTrigger: %@ error: %{public}@", buf, 0x20u);
    }

    v11 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v11;
}

@end
