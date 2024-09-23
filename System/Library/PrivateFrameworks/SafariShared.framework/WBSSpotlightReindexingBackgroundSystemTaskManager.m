@implementation WBSSpotlightReindexingBackgroundSystemTaskManager

- (WBSSpotlightReindexingBackgroundSystemTaskManager)init
{
  WBSSpotlightReindexingBackgroundSystemTaskManager *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  WBSSpotlightReindexingBackgroundSystemTaskManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSSpotlightReindexingBackgroundSystemTaskManager;
  v2 = -[WBSSpotlightReindexingBackgroundSystemTaskManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)registerAndSubmitRequestForTask:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[8];
  _QWORD v27[4];
  id v28;

  v4 = a3;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke;
  v27[3] = &unk_1E4B3DB28;
  v5 = v4;
  v28 = v5;
  v6 = (void *)MEMORY[0x1A8599ED0](v27);
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.SafariShared.SpotlightReindexing"), self->_internalQueue, v6);

  v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Successfully registered background system task to reindex all items to Spotlight.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "taskRequestForIdentifier:", CFSTR("com.apple.SafariShared.SpotlightReindexing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Not submitting background system task to reindex all items to Spotlight due to an exsiting pending task request.", buf, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00E40]), "initWithIdentifier:", CFSTR("com.apple.SafariShared.SpotlightReindexing"));
      objc_msgSend(v12, "setPriority:", 2);
      objc_msgSend(v12, "setRequiresExternalPower:", 1);
      objc_msgSend(v12, "setResourceIntensive:", 1);
      objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v15 = objc_msgSend(v14, "submitTaskRequest:error:", v12, &v25);
      v16 = v25;

      v17 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      v18 = v17;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_INFO, "Submitted background system task request to reindex all items to Spotlight.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[WBSSpotlightReindexingBackgroundSystemTaskManager registerAndSubmitRequestForTask:].cold.1((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);
      }

    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Failed to register background system task to reindex all items to Spotlight.", buf, 2u);
  }

}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_2;
  v16[3] = &unk_1E4B2A210;
  v16[4] = &v17;
  objc_msgSend(v3, "setExpirationHandler:", v16);
  if (*((_BYTE *)v18 + 40))
  {
    v15 = 0;
    v4 = objc_msgSend(v3, "setTaskExpiredWithRetryAfter:error:", &v15, 0.0);
    v5 = v15;
    if ((v4 & 1) == 0)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      objc_msgSend(v3, "setTaskCompleted");
    }

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Background system task to reindex all items to Spotlight is running.", v14, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v3, "setTaskCompleted");
  }
  _Block_object_dispose(&v17, 8);

}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Background system task to reindex all items to Spotlight is expiring.", v3, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)registerAndSubmitRequestForTask:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Failed to submit background system task to reindex all items to Spotlight with error: %@", a5, a6, a7, a8, 2u);
}

void __85__WBSSpotlightReindexingBackgroundSystemTaskManager_registerAndSubmitRequestForTask___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Failed to expire background system task to reindex all items to Spotlight with error: %@", a5, a6, a7, a8, 2u);
}

@end
