@implementation SLCollaborationHandshakeController

- (SLCollaborationHandshakeController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  SLCollaborationHandshakeController *v9;
  NSObject *v10;
  const __CFString *v11;
  SLRemoteTaskManager *v12;
  SLRemoteTaskManager *taskManager;
  objc_super v15;
  uint8_t buf[4];
  SLCollaborationHandshakeController *v17;
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
  v15.super_class = (Class)SLCollaborationHandshakeController;
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

- (void)startCollaborationWithMetadata:(id)a3 participants:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SLCollaborationHandshakeController *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v31[5];
    *(_DWORD *)buf = 136315906;
    v37 = "-[SLCollaborationHandshakeController startCollaborationWithMetadata:participants:timeout:completion:]";
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v11;
    v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, Participants: %@, requestUUID: %@", buf, 0x2Au);
  }

  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke;
  v24[3] = &unk_1E37947D8;
  v17 = v10;
  v25 = v17;
  v18 = v11;
  v26 = v18;
  v27 = self;
  v29 = &v30;
  v28 = v12;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_8;
  v22[3] = &unk_1E3794800;
  v23 = v28;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2_12;
  v20[3] = &unk_1E3794828;
  v19 = v23;
  v21 = v19;
  objc_msgSend(v15, "startTask:withTimeout:timeoutHandler:errorHandler:", v24, v22, v20, a5);

  _Block_object_dispose(&v30, 8);
}

id __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E37947B0;
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v12 = *(_OWORD *)(a1 + 56);
  v8 = (id)v12;
  v15 = v12;
  v9 = v5;
  objc_msgSend(a2, "startCollaborationWithMetadata:participants:reply:", v6, v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_3;
  block[3] = &unk_1E3794788;
  v17 = *(id *)(a1 + 40);
  v18 = v9;
  v15 = *(_OWORD *)(a1 + 48);
  v11 = (id)v15;
  v21 = v15;
  v19 = v7;
  v20 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_async(v10, block);

}

uint64_t __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_3(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] startCollaborationWithMetadata received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  return result;
}

void __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startCollaborationWithFileURL:(id)a3 metadata:(id)a4 participants:(id)a5 timeout:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  char *v33;
  SLCollaborationHandshakeController *v34;
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  _OWORD v38[2];
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE buf[24];
  const char *v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (char *)a5;
  v25 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v43[5];
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SLCollaborationHandshakeController startCollaborationWithFileURL:metadata:participants:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v49 = v14;
    LOWORD(v50) = 2112;
    *(_QWORD *)((char *)&v50 + 2) = v16;
    _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_INFO, "%s: Metadata: %@, Participants: %@, requestUUID: %@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4010000000;
  v49 = "";
  v50 = 0u;
  v51 = 0u;
  -[SLCollaborationHandshakeController _handshakeService](self, "_handshakeService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke;
  v41[3] = &unk_1E3794510;
  v41[4] = buf;
  objc_msgSend(v17, "prepareConnectionWithReply:", v41);

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  v19 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
  v38[0] = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
  v38[1] = v19;
  -[SLCollaborationHandshakeController _sandboxExtensionIssueFileURL:withAuditToken:](self, "_sandboxExtensionIssueFileURL:withAuditToken:", v12, v38);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2;
  v30[3] = &unk_1E3794850;
  v21 = v12;
  v31 = v21;
  v36 = v39;
  v22 = v13;
  v32 = v22;
  v23 = v14;
  v33 = v23;
  v34 = self;
  v37 = &v42;
  v35 = v25;
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_15;
  v28[3] = &unk_1E3794800;
  v29 = v35;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2_16;
  v26[3] = &unk_1E3794828;
  v24 = v29;
  v27 = v24;
  objc_msgSend(v20, "startTask:withTimeout:timeoutHandler:errorHandler:", v30, v28, v26, a6);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v42, 8);

}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

id __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a3;
  v6 = (void *)a1[8];
  v7 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  v8 = a1[4];
  v9 = a1[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E37947B0;
  v10 = a1[6];
  v14[4] = a1[7];
  v15 = v5;
  v17 = a1[10];
  v16 = v6;
  v11 = v5;
  objc_msgSend(a2, "startCollaborationWithFileURL:sandboxTokenData:metadata:participants:reply:", v8, v7, v9, v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_4;
  block[3] = &unk_1E3794788;
  v17 = *(id *)(a1 + 40);
  v18 = v9;
  v15 = *(_OWORD *)(a1 + 48);
  v11 = (id)v15;
  v21 = v15;
  v19 = v7;
  v20 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_async(v10, block);

}

uint64_t __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_4(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] startCollaborationWithFileURL Received response for requestUUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  return result;
}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addParticipantHandles:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SLCollaborationHandshakeController *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v32[5];
    *(_DWORD *)buf = 136315650;
    v38 = "-[SLCollaborationHandshakeController addParticipantHandles:withMetadata:timeout:completion:]";
    v39 = 2112;
    v40 = v11;
    v41 = 2112;
    v42 = v14;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke;
  v25[3] = &unk_1E37947D8;
  v17 = v10;
  v26 = v17;
  v18 = v11;
  v27 = v18;
  v28 = self;
  v30 = &v31;
  v29 = v12;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_18;
  v22[3] = &unk_1E37948C8;
  v24 = &v31;
  v23 = v29;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_19;
  v20[3] = &unk_1E3794828;
  v19 = v23;
  v21 = v19;
  objc_msgSend(v15, "startTask:withTimeout:timeoutHandler:errorHandler:", v25, v22, v20, a5);

  _Block_object_dispose(&v31, 8);
}

id __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E37948A0;
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v12 = *(_OWORD *)(a1 + 56);
  v8 = (id)v12;
  v15 = v12;
  v9 = v5;
  objc_msgSend(a2, "addParticipantHandles:withMetadata:reply:", v6, v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_3;
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

uint64_t __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_3(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] addParticipantHandles received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_18_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addParticipantHandles:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  SLCollaborationHandshakeController *v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  _OWORD v39[2];
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE buf[24];
  const char *v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (const char *)v44[5];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLCollaborationHandshakeController addParticipantHandles:withFileURL:metadata:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v50 = v17;
    _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4010000000;
  v50 = "";
  v51 = 0u;
  v52 = 0u;
  -[SLCollaborationHandshakeController _handshakeService](self, "_handshakeService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke;
  v42[3] = &unk_1E3794510;
  v42[4] = buf;
  objc_msgSend(v18, "prepareConnectionWithReply:", v42);

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  v20 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
  v39[0] = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
  v39[1] = v20;
  -[SLCollaborationHandshakeController _sandboxExtensionIssueFileURL:withAuditToken:](self, "_sandboxExtensionIssueFileURL:withAuditToken:", v13, v39);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_2;
  v31[3] = &unk_1E37948F0;
  v22 = v12;
  v32 = v22;
  v23 = v13;
  v33 = v23;
  v37 = v40;
  v24 = v14;
  v34 = v24;
  v35 = self;
  v38 = &v43;
  v36 = v15;
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_21;
  v28[3] = &unk_1E37948C8;
  v30 = &v43;
  v29 = v36;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_22;
  v26[3] = &unk_1E3794828;
  v25 = v29;
  v27 = v25;
  objc_msgSend(v21, "startTask:withTimeout:timeoutHandler:errorHandler:", v31, v28, v26, a6);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);

}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

id __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a3;
  v6 = a1[4];
  v7 = a1[5];
  v8 = (void *)a1[8];
  v9 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E37948A0;
  v10 = a1[6];
  v14[4] = a1[7];
  v15 = v5;
  v17 = a1[10];
  v16 = v8;
  v11 = v5;
  objc_msgSend(a2, "addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:", v6, v7, v9, v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  block[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_4;
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

uint64_t __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_4(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] addParticipantHandles:withFileURL: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_21_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SLCollaborationHandshakeController *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v32[5];
    *(_DWORD *)buf = 136315650;
    v38 = "-[SLCollaborationHandshakeController removeParticipantIdentities:withMetadata:timeout:completion:]";
    v39 = 2112;
    v40 = v11;
    v41 = 2112;
    v42 = v14;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke;
  v25[3] = &unk_1E37947D8;
  v17 = v10;
  v26 = v17;
  v18 = v11;
  v27 = v18;
  v28 = self;
  v30 = &v31;
  v29 = v12;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_23;
  v22[3] = &unk_1E37948C8;
  v24 = &v31;
  v23 = v29;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_24;
  v20[3] = &unk_1E3794828;
  v19 = v23;
  v21 = v19;
  objc_msgSend(v15, "startTask:withTimeout:timeoutHandler:errorHandler:", v25, v22, v20, a5);

  _Block_object_dispose(&v31, 8);
}

id __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E37948A0;
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v12 = *(_OWORD *)(a1 + 56);
  v8 = (id)v12;
  v15 = v12;
  v9 = v5;
  objc_msgSend(a2, "removeParticipantIdentities:withMetadata:reply:", v6, v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_3;
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

uint64_t __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_3(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] removeParticipantIdentities received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_23_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  SLCollaborationHandshakeController *v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  _OWORD v39[2];
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE buf[24];
  const char *v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (const char *)v44[5];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLCollaborationHandshakeController removeParticipantIdentities:withFileURL:metadata:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v50 = v17;
    _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4010000000;
  v50 = "";
  v51 = 0u;
  v52 = 0u;
  -[SLCollaborationHandshakeController _handshakeService](self, "_handshakeService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke;
  v42[3] = &unk_1E3794510;
  v42[4] = buf;
  objc_msgSend(v18, "prepareConnectionWithReply:", v42);

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  v20 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
  v39[0] = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
  v39[1] = v20;
  -[SLCollaborationHandshakeController _sandboxExtensionIssueFileURL:withAuditToken:](self, "_sandboxExtensionIssueFileURL:withAuditToken:", v13, v39);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_2;
  v31[3] = &unk_1E37948F0;
  v22 = v12;
  v32 = v22;
  v23 = v13;
  v33 = v23;
  v37 = v40;
  v24 = v14;
  v34 = v24;
  v35 = self;
  v38 = &v43;
  v36 = v15;
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_26;
  v28[3] = &unk_1E37948C8;
  v30 = &v43;
  v29 = v36;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_27;
  v26[3] = &unk_1E3794828;
  v25 = v29;
  v27 = v25;
  objc_msgSend(v21, "startTask:withTimeout:timeoutHandler:errorHandler:", v31, v28, v26, a6);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);

}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;

}

id __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a3;
  v6 = a1[4];
  v7 = a1[5];
  v8 = (void *)a1[8];
  v9 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E37948A0;
  v10 = a1[6];
  v14[4] = a1[7];
  v15 = v5;
  v17 = a1[10];
  v16 = v8;
  v11 = v5;
  objc_msgSend(a2, "removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:", v6, v7, v9, v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  block[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_4;
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

uint64_t __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_4(uint64_t a1)
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
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] removeParticipantIdentities:withFileURL: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_26_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SLCollaborationHandshakeController *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v32[5];
    *(_DWORD *)buf = 136315906;
    v38 = "-[SLCollaborationHandshakeController generateProofForIdentity:collaborationIdentifier:timeout:completion:]";
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v14;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_INFO, "%s: identity: %@ documentIdentifier: %@ uuid: %@", buf, 0x2Au);
  }

  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke;
  v25[3] = &unk_1E37947D8;
  v17 = v10;
  v26 = v17;
  v18 = v11;
  v27 = v18;
  v28 = self;
  v30 = &v31;
  v29 = v12;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_29;
  v22[3] = &unk_1E37948C8;
  v24 = &v31;
  v23 = v29;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_30;
  v20[3] = &unk_1E3794828;
  v19 = v23;
  v21 = v19;
  objc_msgSend(v15, "startTask:withTimeout:timeoutHandler:errorHandler:", v25, v22, v20, a5);

  _Block_object_dispose(&v31, 8);
}

id __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E3794918;
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v12 = *(_OWORD *)(a1 + 56);
  v8 = (id)v12;
  v15 = v12;
  v9 = v5;
  objc_msgSend(a2, "generateProofForIdentity:collaborationIdentifier:reply:", v6, v7, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_3;
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

uint64_t __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_3(uint64_t a1)
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
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationHandshakeController] generateProofForIdentity:collaborationIdentifier: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_29_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifySourceBundleIdentifierFromMetadata:(id)a3 timeout:(double)a4 completion:(id)a5
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
  SLCollaborationHandshakeController *v24;
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
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
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
    v34 = "-[SLCollaborationHandshakeController verifySourceBundleIdentifierFromMetadata:timeout:completion:]";
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_INFO, "%s: local identifier: %@ uuid: %@", buf, 0x20u);

  }
  -[SLCollaborationHandshakeController taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke;
  v22[3] = &unk_1E3794968;
  v15 = v8;
  v23 = v15;
  v24 = self;
  v26 = &v27;
  v25 = v9;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_32;
  v19[3] = &unk_1E37948C8;
  v21 = &v27;
  v20 = v25;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_33;
  v17[3] = &unk_1E3794828;
  v16 = v20;
  v18 = v16;
  objc_msgSend(v13, "startTask:withTimeout:timeoutHandler:errorHandler:", v22, v19, v17, a4);

  _Block_object_dispose(&v27, 8);
}

id __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  __int128 v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;

  v5 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_2;
  v12[3] = &unk_1E3794940;
  v6 = *(_QWORD *)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v11 = *(_OWORD *)(a1 + 48);
  v7 = (id)v11;
  v14 = v11;
  v8 = v5;
  objc_msgSend(a2, "verifySourceBundleIdentifierFromMetadata:reply:", v6, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_3;
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

uint64_t __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_3(uint64_t a1)
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
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationHandshakeController] verifySourceBundleIdentifierFromMetadata: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_32_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLCollaborationHandshakeController"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)taskServiceWithErrorHandler:(id)a3
{
  void *v3;

  -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:](self, "synchronousRemoteServiceWithErrorHandler:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE396378) & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (id)_handshakeService
{
  void *v2;

  -[SLDServiceProxy synchronousRemoteService](self, "synchronousRemoteService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EE396378) & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasDirectoryPath");

  if (v7)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("/"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "fileSystemRepresentation");
  v13 = *(_OWORD *)a4->var0;
  v14 = *(_OWORD *)&a4->var0[4];
  v10 = (const char *)sandbox_extension_issue_file_to_process();
  v11 = (void *)v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1, v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
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

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] addParticipantHandles request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] addParticipantHandles:withFileURL: request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] removeParticipantIdentities request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] removeParticipantIdentities:withFileURL: request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] generateProofForIdentity:collaborationIdentifier: request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLCollaborationHandshakeController] verifySourceBundleIdentifierFromMetadata: request with UUID timed out: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
