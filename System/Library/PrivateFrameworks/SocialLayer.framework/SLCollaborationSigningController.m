@implementation SLCollaborationSigningController

- (SLCollaborationSigningController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  SLCollaborationSigningController *v9;
  NSObject *v10;
  const __CFString *v11;
  SLRemoteTaskManager *v12;
  SLRemoteTaskManager *taskManager;
  objc_super v15;
  uint8_t buf[4];
  SLCollaborationSigningController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)SLCollaborationSigningController;
  v9 = -[SLDServiceProxy initWithServiceClass:targetSerialQueue:delegate:](&v15, sel_initWithServiceClass_targetSerialQueue_delegate_, v8, v7, 0);
  if (v9)
  {
    SLFrameworkLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v17 = v9;
      v18 = 2112;
      if (v4)
        v11 = CFSTR("YES");
      v19 = v7;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_INFO, "[%p] initWithTargetSerialQueue: %@ synchronous: %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v9->_targetSerialQueue, a3);
    v9->_synchronous = v4;
    v12 = -[SLRemoteTaskManager initWithDelegate:targetSerialQueue:synchronous:]([SLRemoteTaskManager alloc], "initWithDelegate:targetSerialQueue:synchronous:", v9, v9->_targetSerialQueue, v4);
    taskManager = v9->_taskManager;
    v9->_taskManager = v12;

    -[SLDServiceProxy connect](v9, "connect");
  }

  return v9;
}

- (void)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 timeout:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  SLCollaborationSigningController *v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v37[5];
    *(_DWORD *)buf = 136315650;
    v43 = "-[SLCollaborationSigningController signData:forCollaborationIdentifier:trackingPreventionSalt:timeout:completion:]";
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v17;
    _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_INFO, "%s: identifier: %@ uuid: %@", buf, 0x20u);
  }

  -[SLCollaborationSigningController taskManager](self, "taskManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke;
  v29[3] = &unk_1E3794C38;
  v20 = v12;
  v30 = v20;
  v21 = v13;
  v31 = v21;
  v22 = v14;
  v32 = v22;
  v33 = self;
  v35 = &v36;
  v34 = v15;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_8;
  v26[3] = &unk_1E37948C8;
  v28 = &v36;
  v27 = v34;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_12;
  v24[3] = &unk_1E3794828;
  v23 = v27;
  v25 = v23;
  objc_msgSend(v18, "startTask:withTimeout:timeoutHandler:errorHandler:", v29, v26, v24, a6);

  _Block_object_dispose(&v36, 8);
}

id __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_2;
  v14[3] = &unk_1E3794C10;
  v8 = *(_QWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 64);
  v14[4] = *(_QWORD *)(a1 + 56);
  v15 = v5;
  v9 = (id)v13;
  v16 = v13;
  v10 = v5;
  objc_msgSend(a2, "signData:forCollaborationIdentifier:trackingPreventionSalt:reply:", v6, v7, v8, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_3;
  block[3] = &unk_1E3794878;
  v13 = *(id *)(a1 + 40);
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 48);
  v8 = (id)v11;
  v16 = v11;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "suppress");
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationSigningController] signData:forCollaborationIdentifier: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_8_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationSigningController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signSourceProcessWithMetadata:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  SLCollaborationSigningController *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28[5];
    *(_DWORD *)buf = 136315650;
    v34 = "-[SLCollaborationSigningController signSourceProcessWithMetadata:timeout:completion:]";
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_INFO, "%s: metadata local identifier: %@ uuid: %@", buf, 0x20u);

  }
  -[SLCollaborationSigningController taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke;
  v22[3] = &unk_1E3794CB0;
  v15 = v8;
  v23 = v15;
  v24 = self;
  v26 = &v27;
  v25 = v9;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_14;
  v19[3] = &unk_1E37948C8;
  v21 = &v27;
  v20 = v25;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_15;
  v17[3] = &unk_1E3794828;
  v16 = v20;
  v18 = v16;
  objc_msgSend(v13, "startTask:withTimeout:timeoutHandler:errorHandler:", v22, v19, v17, a4);

  _Block_object_dispose(&v27, 8);
}

id __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_2;
  v10[3] = &unk_1E3794C88;
  v14 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v7 = v5;
  objc_msgSend(a2, "signSourceProcessWithMetadata:reply:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3;
  v10[3] = &unk_1E3794C60;
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v16 = *(_QWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "suppress");
    v3 = *(_QWORD *)(a1 + 40);
    SLFrameworkLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v7 = *(_QWORD *)(a1 + 56);
        v8 = 138412546;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "[SLCollaborationSigningController] signSourceProcessWithMetadata: received response for request UUID: %@, error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3_cold_1(a1, v5);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  return result;
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_14_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationSigningController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)taskServiceWithErrorHandler:(id)a3
{
  void *v3;

  -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:](self, "synchronousRemoteServiceWithErrorHandler:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE38BD90) & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (OS_dispatch_queue)targetSerialQueue
{
  return self->_targetSerialQueue;
}

- (void)setTargetSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetSerialQueue, a3);
}

- (SLRemoteTaskManager)taskManager
{
  return self->_taskManager;
}

- (void)setTaskManager:(id)a3
{
  objc_storeStrong((id *)&self->_taskManager, a3);
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_targetSerialQueue, 0);
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationSigningController] signData:forCollaborationIdentifier: request with UUID timed out: %@", v2, v3, v4, v5, 2u);
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 48), "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLCollaborationSigningController] signSourceProcessWithMetadata: returned nil for request UUID: %@. This will prevent verification of the source process for collaboration identifier: %@, error: %@", (uint8_t *)&v7, 0x20u);

}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationSigningController] signSourceProcessWithMetadata: request with UUID timed out: %@", v2, v3, v4, v5, 2u);
}

@end
