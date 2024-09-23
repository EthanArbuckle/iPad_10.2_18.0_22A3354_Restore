@implementation SiriAnalyticsLargeMessageStorage

- (SiriAnalyticsLargeMessageStorage)initWithApplicationIdentifier:(id)a3 processor:(id)a4 runtimeQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SiriAnalyticsLargeMessageStorage *v12;
  SiriAnalyticsLargeMessageStorage *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SiriAnalyticsLargeMessageStorage;
  v12 = -[SiriAnalyticsLargeMessageStorage init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applicationIdentifier, a3);
    objc_storeStrong((id *)&v13->_processor, a4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.siri.analytics.storage.blob", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_runtimeQueue, a5);
  }

  return v13;
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 messageWrapper:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *runtimeQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke;
  aBlock[3] = &unk_1E4357AB8;
  v23 = v10;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  runtimeQueue = self->_runtimeQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_2;
  block[3] = &unk_1E4357B88;
  block[4] = self;
  v19 = v9;
  v20 = v8;
  v21 = v13;
  v15 = v8;
  v16 = v13;
  v17 = v9;
  dispatch_async(runtimeQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_runtimeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

void __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "processWithUploadEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "determinationMade") & 1) != 0)
  {
    if (!objc_msgSend(v2, "suppressed"))
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_3;
      v10[3] = &unk_1E4357B88;
      v11 = *(id *)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      v8 = *(id *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 32);
      v12 = v8;
      v13 = v9;
      dispatch_async(v7, v10);

      goto LABEL_7;
    }
    v3 = *(_QWORD *)(a1 + 56);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 3;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 4;
  }
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.analytics"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

LABEL_7:
}

void __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v26 = 0;
  objc_msgSend(v2, "readDataUpToLength:error:", 0x8000, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  v6 = v5 != 0;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v10 = v4;
    while (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v3, "appendData:", v10);
      v26 = 0;
      objc_msgSend(v2, "readDataUpToLength:error:", 0x8000, &v26);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v26;

      v6 = v8 != 0;
      if (v4)
      {
        v10 = v4;
        if (!v8)
          continue;
      }
      goto LABEL_6;
    }
    objc_msgSend(v2, "closeFile");
    v8 = 0;
    v4 = v10;
    goto LABEL_18;
  }
  v8 = v5;
LABEL_6:
  objc_msgSend(v2, "closeFile");
  if (!v6)
  {
LABEL_18:
    v11 = *(void **)(a1 + 40);
    v12 = objc_alloc_init(MEMORY[0x1E0D995F0]);
    objc_msgSend(v11, "setContent:", v12);

    objc_msgSend(*(id *)(a1 + 40), "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v13, "setDataPayload:", v14);

    objc_msgSend(*(id *)(a1 + 40), "wrapAsAnyEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D21020], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_6;
    v22[3] = &unk_1E4357AE8;
    v18 = *(id *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(void **)(a1 + 56);
    v23 = v18;
    v24 = v19;
    v25 = v20;
    objc_msgSend(v16, "reportDataUploadEvent:application:completion:", v15, v17, v22);

    goto LABEL_19;
  }
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextStorage;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v28 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:completion:]_block_invoke_3";
    v29 = 2112;
    v30 = v21;
    v31 = 2112;
    v32 = v8;
    _os_log_error_impl(&dword_1A025F000, v9, OS_LOG_TYPE_ERROR, "%s Error while reading file from path %@ : %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_19:

}

void __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v4 = SiriAnalyticsLogContextStorage;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      *(_DWORD *)buf = 136315650;
      v14 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:completion:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_1A025F000, v4, OS_LOG_TYPE_ERROR, "%s Error while writing file at path: %@ to FBF with error: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_INFO))
  {
    v6 = a1[4];
    *(_DWORD *)buf = 136315394;
    v14 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:completion:]_block_invoke";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1A025F000, v4, OS_LOG_TYPE_INFO, "%s Successfully wrote file to FBF at path: %@", buf, 0x16u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_7;
  v10[3] = &unk_1E4357C98;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __96__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
