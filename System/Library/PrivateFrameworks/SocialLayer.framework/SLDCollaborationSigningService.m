@implementation SLDCollaborationSigningService

+ (id)remoteObjectProtocol
{
  return &unk_1EE38BD90;
}

+ (id)sharedService
{
  if (sharedService_onceToken_0 != -1)
    dispatch_once(&sharedService_onceToken_0, &__block_literal_global_1);
  return (id)sharedService_sService_0;
}

void __47__SLDCollaborationSigningService_sharedService__block_invoke()
{
  SLDCollaborationSigningService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCollaborationSigningService);
  v1 = (void *)sharedService_sService_0;
  sharedService_sService_0 = (uint64_t)v0;

}

- (SLDCollaborationSigningService)init
{
  SLDCollaborationSigningService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateSerialQueue;
  SLDTaskManager *v6;
  SLDTaskManager *taskManager;
  SLPersonIdentityGenerator *v8;
  SLPersonIdentityGenerator *personIdentityGenerator;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SLDCollaborationSigningService;
  v2 = -[SLDCollaborationSigningService init](&v11, sel_init);
  if (v2)
  {
    SLDGlobalWorkloop();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLDCollaborationSigningService", 0, v3);
    privateSerialQueue = v2->_privateSerialQueue;
    v2->_privateSerialQueue = (OS_dispatch_queue *)v4;

    v6 = -[SLDTaskManager initWithSerialQueue:]([SLDTaskManager alloc], "initWithSerialQueue:", v2->_privateSerialQueue);
    taskManager = v2->_taskManager;
    v2->_taskManager = v6;

    v8 = -[SLPersonIdentityGenerator initWithQueue:]([SLPersonIdentityGenerator alloc], "initWithQueue:", v2->_privateSerialQueue);
    personIdentityGenerator = v2->_personIdentityGenerator;
    v2->_personIdentityGenerator = v8;

  }
  return v2;
}

- (BOOL)allowsConnection:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if ((SLDConnectionIsEntitledForCollaborationHandshake(v3) & 1) != 0
    || (SLDConnectionHasPublicEntitlement(v3) & 1) != 0
    || (SLDConnectionHasLegacyHighlightsEntitlement(v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationSigningService allowsConnection:].cold.1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }

  return v4;
}

- (id)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, void *);
  void *v30;
  SLDCollaborationSigningService *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  id v39;
  _BYTE *v40;
  _BYTE buf[24];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  SLDaemonLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationSigningService signData:forCollaborationIdentifier:trackingPreventionSalt:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_199EFF000, v14, OS_LOG_TYPE_DEFAULT, "%s collaborationIdentifier: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v42 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke;
  aBlock[3] = &unk_1E3794640;
  v40 = buf;
  v16 = v13;
  v39 = v16;
  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2;
  v36[3] = &unk_1E3794668;
  v17 = _Block_copy(aBlock);
  v37 = v17;
  v18 = _Block_copy(v36);
  v27 = v15;
  v28 = 3221225472;
  v29 = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_13;
  v30 = &unk_1E37946B8;
  v31 = self;
  v19 = v10;
  v32 = v19;
  v20 = v11;
  v33 = v20;
  v21 = v12;
  v34 = v21;
  v22 = v17;
  v35 = v22;
  v23 = _Block_copy(&v27);
  -[SLDCollaborationSigningService taskManager](self, "taskManager", v27, v28, v29, v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startAggregateTask:withTimeout:cancellationHandler:", v23, v18, 15.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v25;
}

uint64_t __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_2(v4, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "personIdentityGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14;
  v11[3] = &unk_1E3794690;
  v12 = v5;
  v9 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v10 = v5;
  objc_msgSend(v6, "signData:documentIdentifier:trackingPreventionSalt:completionHandler:", v7, v8, v9, v11);

}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!v5 || v6)
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("Error signing data with SLPersonIdentityGenerator");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)signSourceProcessWithMetadata:(id)a3 reply:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SLDProcessVerifier *v34;
  SLDProcessVerifier *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  SLDProcessVerifier *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD aBlock[4];
  id v63;
  _BYTE *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _BYTE v68[32];
  _BYTE v69[40];
  _QWORD block[4];
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  _BYTE buf[24];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v54, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v79 = v8;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "%s connection: %@, metadata identifier: %@", buf, 0x20u);

  }
  v9 = (void *)MEMORY[0x1E0D87D68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(v9, "handleForIdentifier:error:", v10, &v73);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v73;

  objc_msgSend(v11, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && !v12)
  {
    if (v6)
    {
      objc_msgSend(v6, "auditToken");
      if (v11)
      {
LABEL_7:
        objc_msgSend(v11, "auditToken");
        goto LABEL_13;
      }
    }
    else
    {
      memset(v69, 0, 32);
      if (v11)
        goto LABEL_7;
    }
    memset(v68, 0, sizeof(v68));
LABEL_13:
    if (SLDAuditTokensAreEqual((uint64_t)v69, (uint64_t)v68))
    {
      objc_msgSend(v54, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (v22)
      {
        SLDaemonLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v31 = MEMORY[0x1E0C809B0];
      LOBYTE(v79) = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_28;
      aBlock[3] = &unk_1E3794640;
      v64 = buf;
      v63 = v53;
      v60[0] = v31;
      v60[1] = 3221225472;
      v60[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2;
      v60[3] = &unk_1E3794668;
      v32 = _Block_copy(aBlock);
      v61 = v32;
      v33 = _Block_copy(v60);
      v34 = objc_alloc_init(SLDProcessVerifier);
      v55[0] = v31;
      v55[1] = 3221225472;
      v55[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30;
      v55[3] = &unk_1E3794708;
      v56 = v54;
      v35 = v34;
      v57 = v35;
      v58 = v13;
      v36 = v32;
      v59 = v36;
      v37 = _Block_copy(v55);
      -[SLDCollaborationSigningService taskManager](self, "taskManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "startAggregateTask:withTimeout:cancellationHandler:", v37, v33, 15.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(buf, 8);
    }
    else
    {
      SLDaemonLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:].cold.3(v39, v40, v41, v42, v43, v44, v45, v46);

      v47 = (void *)MEMORY[0x1E0CB35C8];
      v74 = *MEMORY[0x1E0CB2938];
      v75 = CFSTR("signSourceProcessForMetadata: the audit token of the xpc connection does not match the audit token of the created process handle. Failing to sign the source process.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[SLDCollaborationSigningService privateSerialQueue](self, "privateSerialQueue");
      v50 = objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_27;
      v65[3] = &unk_1E37946E0;
      v66 = v49;
      v67 = v53;
      v51 = v49;
      dispatch_async(v50, v65);

      v20 = (void *)objc_opt_new();
    }
    goto LABEL_22;
  }
  SLDaemonLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:].cold.1((uint64_t)v12, v14);

  v15 = (void *)MEMORY[0x1E0CB35C8];
  v76 = *MEMORY[0x1E0CB2938];
  v77 = CFSTR("signSourceProcessForMetadata could not retrieve an RBSProcessHandle for NSXPCConnection");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationSigningService privateSerialQueue](self, "privateSerialQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke;
  block[3] = &unk_1E37946E0;
  v71 = v17;
  v72 = v53;
  v19 = v17;
  dispatch_async(v18, block);

  v20 = (void *)objc_opt_new();
LABEL_22:

  return v20;
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_28(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_2(v4, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDProcessVerifier tagDataFromString:](SLDProcessVerifier, "tagDataFromString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v22 = 0;
  objc_msgSend(v4, "signProcess:tag:error:", v5, v3, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v6 == 0;
  if (v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30_cold_1((uint64_t)v7, v9, v11, v12, v13, v14, v15, v16);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2938];
    v26[0] = CFSTR("Error signing source process with SLDProcessVerifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationSigningService"), 2, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationSigningService] signSourceProcessForMetadata: successfully signed source process with collaboration local identifier: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (OS_dispatch_queue)privateSerialQueue
{
  return self->_privateSerialQueue;
}

- (SLDTaskManager)taskManager
{
  return self->_taskManager;
}

- (void)setTaskManager:(id)a3
{
  objc_storeStrong((id *)&self->_taskManager, a3);
}

- (SLPersonIdentityGenerator)personIdentityGenerator
{
  return self->_personIdentityGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentityGenerator, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_privateSerialQueue, 0);
}

- (void)allowsConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLDCollaborationSigningService] connection does not have the proper entitlement and will not be allowed to access the service: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "[SLDCollaborationSigningService] signData:forCollaborationIdentifier: timeout timer fired after %f seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_199EFF000, a1, a3, "[SLDCollaborationSigningService] signData:forCollaborationIdentifier: was cancelled", a5, a6, a7, a8, 0);
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLDCollaborationSigningService] signData:forCollaborationIdentifier: error signing data with SLPersonIdentityGenerator %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)signSourceProcessWithMetadata:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "%s cannot sign source process, because RBSProcessIdentity could not be created. error: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)signSourceProcessWithMetadata:(uint64_t)a3 reply:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s SWCollaborationMetadata's localIdentifier was nil. We can still sign the source process, but without a tag, which decreases uniqueness.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)signSourceProcessWithMetadata:(uint64_t)a3 reply:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s The audit token of the xpc connection does not match the audit token of the created process handle. Failing to sign the source process.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "[SLDCollaborationSigningService] signSourceProcessForMetadata: timeout timer fired after %f seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_199EFF000, a1, a3, "[SLDCollaborationSigningService] signSourceProcessForMetadata: was cancelled", a5, a6, a7, a8, 0);
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "[SLDCollaborationSigningService] signSourceProcessForMetadata: error signing source process: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
