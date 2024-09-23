@implementation SLDCollaborationHandshakeService

+ (id)remoteObjectProtocol
{
  return &unk_1EE396378;
}

+ (id)sharedService
{
  if (sharedService_onceToken_2 != -1)
    dispatch_once(&sharedService_onceToken_2, &__block_literal_global_8);
  return (id)sharedService_sService_2;
}

void __49__SLDCollaborationHandshakeService_sharedService__block_invoke()
{
  SLDCollaborationHandshakeService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCollaborationHandshakeService);
  v1 = (void *)sharedService_sService_2;
  sharedService_sService_2 = (uint64_t)v0;

}

- (SLDCollaborationHandshakeService)init
{
  SLDCollaborationHandshakeService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateSerialQueue;
  SLDTaskManager *v6;
  SLDTaskManager *taskManager;
  SLSWActionDispatcher *v8;
  SLSWActionDispatcher *actionDispatcher;
  SLPersonIdentityGenerator *v10;
  SLPersonIdentityGenerator *personIdentityGenerator;
  SLDProcessVerifier *v12;
  SLDProcessVerifier *processVerifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SLDCollaborationHandshakeService;
  v2 = -[SLDCollaborationHandshakeService init](&v15, sel_init);
  if (v2)
  {
    SLDGlobalWorkloop();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLDCollaborationHandshakeService", 0, v3);
    privateSerialQueue = v2->_privateSerialQueue;
    v2->_privateSerialQueue = (OS_dispatch_queue *)v4;

    v6 = -[SLDTaskManager initWithSerialQueue:]([SLDTaskManager alloc], "initWithSerialQueue:", v2->_privateSerialQueue);
    taskManager = v2->_taskManager;
    v2->_taskManager = v6;

    v8 = -[SLSWActionDispatcher initWithQueue:]([SLSWActionDispatcher alloc], "initWithQueue:", v2->_privateSerialQueue);
    actionDispatcher = v2->_actionDispatcher;
    v2->_actionDispatcher = v8;

    v10 = -[SLPersonIdentityGenerator initWithQueue:]([SLPersonIdentityGenerator alloc], "initWithQueue:", v2->_privateSerialQueue);
    personIdentityGenerator = v2->_personIdentityGenerator;
    v2->_personIdentityGenerator = v10;

    v12 = objc_alloc_init(SLDProcessVerifier);
    processVerifier = v2->_processVerifier;
    v2->_processVerifier = v12;

  }
  return v2;
}

- (BOOL)allowsConnection:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if ((SLDConnectionIsEntitledForCollaborationHandshake(v3) & 1) != 0
    || (SLDConnectionHasLegacyHighlightsEntitlement(v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService allowsConnection:].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (void)setupInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_removeParticipantIdentities_withMetadata_reply_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply_, 0, 0);

}

- (void)prepareConnectionWithReply:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, void *);
  void *v30;
  SLDCollaborationHandshakeService *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD aBlock[4];
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  _QWORD block[4];
  id v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && (objc_msgSend(v8, "publicKeys"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend(v8, "publicKeys"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v11,
        v13))
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v14 = MEMORY[0x1E0C809B0];
    v41 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2;
    aBlock[3] = &unk_1E3794ED8;
    v39 = v40;
    v38 = v10;
    v35[0] = v14;
    v35[1] = 3221225472;
    v35[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3;
    v35[3] = &unk_1E3794668;
    v15 = _Block_copy(aBlock);
    v36 = v15;
    v16 = _Block_copy(v35);
    v27 = v14;
    v28 = 3221225472;
    v29 = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_37;
    v30 = &unk_1E3794708;
    v31 = self;
    v32 = v8;
    v33 = v9;
    v17 = v15;
    v34 = v17;
    v18 = _Block_copy(&v27);
    -[SLDCollaborationHandshakeService taskManager](self, "taskManager", v27, v28, v29, v30, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startAggregateTask:withTimeout:cancellationHandler:", v18, v16, 15.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v40, 8);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2938];
    v46[0] = CFSTR("Cannot generate proof without an identity or public keys");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke;
    block[3] = &unk_1E37946E0;
    v43 = v23;
    v44 = v10;
    v25 = v23;
    dispatch_async(v24, block);

    v20 = (void *)objc_opt_new();
  }

  return v20;
}

uint64_t __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2(uint64_t result)
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

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "personIdentityGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_38;
  v10[3] = &unk_1E3794F00;
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  v9 = v5;
  objc_msgSend(v6, "generateProofForIdentity:documentIdentifier:completionHandler:", v7, v8, v10);

}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!v5 || v6)
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_38_cold_1();

    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2938];
      v12[0] = CFSTR("generating proof with SLPersonIdentityGenerator");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)verifySourceBundleIdentifierFromMetadata:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SLDCollaborationHandshakeService verifySourceBundleIdentifierFromMetadata:reply:]";
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "sourceProcessData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDProcessVerifier tagDataFromString:](SLDProcessVerifier, "tagDataFromString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SLDCollaborationHandshakeService processVerifier](self, "processVerifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v12, "verifyData:tag:error:", v9, v11, &v39);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v39;

    if (v13)
    {
      -[SLDCollaborationHandshakeService actionDispatcher](self, "actionDispatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v15, "bundleIDForProcess:error:", v13, &v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v35;

      v18 = 0;
      if (!v16)
      {
        if (v17)
        {
          v18 = v17;
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v40 = *MEMORY[0x1E0CB2938];
          v41 = CFSTR("[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v30);
          v18 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke_2;
      v31[3] = &unk_1E3794F28;
      v33 = v18;
      v34 = v7;
      v32 = v16;
      v27 = v18;
      v28 = v16;
      dispatch_async(v26, v31);

      v24 = (void *)objc_opt_new();
      goto LABEL_14;
    }
  }
  else
  {
    v14 = 0;
  }
  SLDaemonLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[SLDCollaborationHandshakeService verifySourceBundleIdentifierFromMetadata:reply:].cold.1((uint64_t)v9, v6, v19);

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB2938];
  v43 = CFSTR("[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke;
  block[3] = &unk_1E37946E0;
  v37 = v22;
  v38 = v7;
  v13 = v22;
  dispatch_async(v23, block);

  v24 = (void *)objc_opt_new();
  v17 = v38;
LABEL_14:

  return v24;
}

uint64_t __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)startCollaborationWithMetadata:(id)a3 participants:(id)a4 reply:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  SLDCollaborationHandshakeService *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[4];
  id v57;
  _BYTE *v58;
  _QWORD block[4];
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  const __CFString *v64;
  _BYTE buf[24];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38 = a4;
  v39 = a5;
  SLDaemonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationHandshakeService startCollaborationWithMetadata:participants:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v66 = v38;
    _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "%s metadata: %@ participants: %@", buf, 0x20u);
  }

  objc_msgSend(v8, "sourceProcessData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDProcessVerifier tagDataFromString:](SLDProcessVerifier, "tagDataFromString:", v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SLDCollaborationHandshakeService processVerifier](self, "processVerifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(v12, "verifyData:tag:error:", v10, v37, &v62);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v62;

    if (v13)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v14 = MEMORY[0x1E0C809B0];
      LOBYTE(v66) = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2;
      aBlock[3] = &unk_1E3794F50;
      v58 = buf;
      v57 = v39;
      v54[0] = v14;
      v54[1] = 3221225472;
      v54[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3;
      v54[3] = &unk_1E3794668;
      v15 = _Block_copy(aBlock);
      v55 = v15;
      v35 = _Block_copy(v54);
      v52[0] = v14;
      v52[1] = 3221225472;
      v52[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_48;
      v52[3] = &unk_1E3794FC8;
      v52[4] = self;
      v16 = v15;
      v53 = v16;
      v17 = _Block_copy(v52);
      v49[0] = v14;
      v49[1] = 3221225472;
      v49[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_53;
      v49[3] = &unk_1E3795040;
      v49[4] = self;
      v18 = v16;
      v50 = v18;
      v19 = v17;
      v51 = v19;
      v20 = _Block_copy(v49);
      v46[0] = v14;
      v46[1] = 3221225472;
      v46[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_60;
      v46[3] = &unk_1E3795090;
      v46[4] = self;
      v47 = v38;
      v21 = v20;
      v48 = v21;
      v22 = _Block_copy(v46);
      v40[0] = v14;
      v40[1] = 3221225472;
      v40[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_65;
      v40[3] = &unk_1E3795108;
      v41 = v8;
      v23 = v22;
      v44 = v23;
      v24 = v18;
      v45 = v24;
      v42 = self;
      v25 = v13;
      v43 = v25;
      v26 = _Block_copy(v40);
      -[SLDCollaborationHandshakeService taskManager](self, "taskManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startAggregateTask:withTimeout:cancellationHandler:", v26, v35, 15.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(buf, 8);
      goto LABEL_10;
    }
  }
  else
  {
    v36 = 0;
  }
  SLDaemonLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[SLDCollaborationHandshakeService startCollaborationWithMetadata:participants:reply:].cold.1((uint64_t)v10, v8, v29);

  v30 = (void *)MEMORY[0x1E0CB35C8];
  v63 = *MEMORY[0x1E0CB2938];
  v64 = CFSTR("[SLDCollaborationHandshakeService] startCollaborationWithMetadata: failed to verify source process.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke;
  block[3] = &unk_1E37946E0;
  v60 = v32;
  v61 = v39;
  v25 = v32;
  dispatch_async(v33, block);

  v28 = (void *)objc_opt_new();
LABEL_10:

  return v28;
}

uint64_t __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2(uint64_t result)
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

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_48(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = *(void **)(a1 + 32);
  v15 = a6;
  v16 = a5;
  objc_msgSend(v14, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_49;
  v22[3] = &unk_1E3794FA0;
  v18 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v13;
  v24 = v11;
  v25 = v12;
  v26 = v18;
  v19 = v12;
  v20 = v11;
  v21 = v13;
  objc_msgSend(v17, "startSubtask:withProgress:timer:", v22, v16, v15);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_49(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  SLDaemonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_50;
  v7[3] = &unk_1E3794F78;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:", v4, v5, MEMORY[0x1E0C9AA60], v7);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_50(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (a2)
  {
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: success. Replying to client with shareURL and updatedMetadata", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateMetadata:withNewIdentities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_53(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = *(void **)(a1 + 32);
  v15 = a6;
  v16 = a5;
  objc_msgSend(v14, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_54;
  v22[3] = &unk_1E3795018;
  v18 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v13;
  v26 = v18;
  v24 = v11;
  v27 = *(id *)(a1 + 48);
  v25 = v12;
  v19 = v12;
  v20 = v11;
  v21 = v13;
  objc_msgSend(v17, "startSubtask:withProgress:timer:", v22, v16, v15);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  SLDaemonLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _localPersonIdentityForDocumentIdentifier", buf, 2u);
  }

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_55;
  v16[3] = &unk_1E3794FF0;
  v22 = v9;
  v17 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 56);
  v20 = v7;
  v21 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v11, "_localPersonIdentityForDocumentIdentifier:completion:", v12, v16);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_55(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && v8 && !v9)
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithMetadata: Generated local identity.", v15, 2u);
    }

    (*(void (**)(void))(a1[9] + 16))();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v8);
    (*(void (**)(void))(a1[11] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
    if (!v10)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2938];
      v17[0] = CFSTR("Could not generate person identities.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_55_cold_1((uint64_t)a1, v14);

    (*(void (**)(void))(a1[10] + 16))();
  }

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_60(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = *(void **)(a1 + 32);
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "taskManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_61;
  v19[3] = &unk_1E3794FA0;
  v15 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = v10;
  v16 = *(id *)(a1 + 48);
  v22 = v9;
  v23 = v16;
  v17 = v9;
  v18 = v10;
  objc_msgSend(v14, "startSubtask:withProgress:timer:", v19, v13, v12);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_61(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_62;
  v16[3] = &unk_1E3795068;
  v21 = v9;
  v22 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  v19 = v7;
  v20 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "_personIdentitiesForHandles:documentIdentifier:completion:", v11, v12, v16);

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: Generated remote identities.", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__9;
  v29[4] = __Block_byref_object_dispose__9;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CD7448], "actionWithMetadata:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_67;
  v22[3] = &unk_1E37950B8;
  v28 = v29;
  v25 = *(id *)(a1 + 56);
  v12 = v7;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  v14 = v9;
  v26 = v14;
  v27 = *(id *)(a1 + 64);
  objc_msgSend(v10, "setResponseHandlerBlock:", v22);
  objc_msgSend(*(id *)(a1 + 40), "actionDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 48);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72;
  v18[3] = &unk_1E37950E0;
  v21 = v29;
  v17 = v14;
  v19 = v17;
  v20 = *(id *)(a1 + 64);
  objc_msgSend(v15, "dispatchAction:withAssertionForProcess:completion:", v10, v16, v18);

  _Block_object_dispose(v29, 8);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_67(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "invalidate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "success")
    && (objc_msgSend(v5, "updatedMetadata"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        objc_msgSend(v5, "url"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: finished start action, moving on to adding participants.", v18, 2u);
    }

    v10 = a1[6];
    objc_msgSend(v5, "url");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatedMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD, _QWORD))(v10 + 16))(v10, v11, v12, a1[4], a1[5]);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    objc_msgSend(v3, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v11 = v13;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2938];
      v20[0] = CFSTR("startCollaborationWithMetadata start action failed.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_67_cold_1();

    (*(void (**)(void))(a1[8] + 16))();
  }

}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  int v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
    (*(void (**)(void))(a1[4] + 16))();
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "isValid");
      v10 = CFSTR("NO");
      if (v9)
        v10 = CFSTR("YES");
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] action dispatcher successfully sent the start collaboration action to the app. Waiting for our response handler to be called. Assertion: %@ isValid: %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (id)startCollaborationWithFileURL:(id)a3 sandboxTokenData:(id)a4 metadata:(id)a5 participants:(id)a6 reply:(id)a7
{
  NSObject *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  SLDCollaborationHandshakeService *v48;
  id v49;
  id v50;
  _QWORD v51[5];
  uint64_t (*v52)(uint64_t, uint64_t);
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD aBlock[5];
  id v64;
  uint64_t *v65;
  _QWORD *v66;
  _QWORD v67[3];
  char v68;
  _QWORD block[4];
  id v70;
  _BYTE *v71;
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  int64_t v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80[5];

  v80[2] = *(id *)MEMORY[0x1E0C80C00];
  v44 = a3;
  v40 = a4;
  v42 = a5;
  v43 = (uint64_t (*)(uint64_t, uint64_t))a6;
  v39 = a7;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationHandshakeService startCollaborationWithFileURL:sandboxTokenData:metadata:part"
                         "icipants:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    v78 = v43;
    _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "%s metadata: %@ participants: %@", buf, 0x20u);
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setTotalUnitCount:", 1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v78 = __Block_byref_object_copy__9;
  v79 = __Block_byref_object_dispose__9;
  v80[0] = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v72 = 0;
  v14 = -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:](self, "_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:", v40, v44, v41, &v72);
  objc_storeStrong(v80, v72);
  v76 = v14;
  if (v74[3] == -1)
  {
    v32 = *(_QWORD *)&buf[8];
    v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v33)
    {
      v34 = v33;
      v35 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 3, 0);
      v36 = objc_claimAutoreleasedReturnValue();
      v35 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;
    }

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v37 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke;
    block[3] = &unk_1E3794D48;
    v70 = v39;
    v71 = buf;
    dispatch_async(v37, block);

  }
  else
  {
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    v68 = 0;
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2;
    aBlock[3] = &unk_1E3795130;
    aBlock[4] = self;
    v65 = &v73;
    v66 = v67;
    v64 = v39;
    v61[0] = v15;
    v61[1] = 3221225472;
    v61[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3;
    v61[3] = &unk_1E3794668;
    v16 = _Block_copy(aBlock);
    v62 = v16;
    v17 = _Block_copy(v61);
    v58[0] = v15;
    v58[1] = 3221225472;
    v58[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_81;
    v58[3] = &unk_1E37951A8;
    v58[4] = self;
    v18 = v44;
    v59 = v18;
    v19 = v16;
    v60 = v19;
    v20 = _Block_copy(v58);
    v55[0] = v15;
    v55[1] = 3221225472;
    v55[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_86;
    v55[3] = &unk_1E3795040;
    v55[4] = self;
    v21 = v19;
    v56 = v21;
    v22 = v20;
    v57 = v22;
    v23 = _Block_copy(v55);
    v51[0] = v15;
    v51[1] = 3221225472;
    v51[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_89;
    v51[3] = &unk_1E3795220;
    v51[4] = self;
    v52 = v43;
    v24 = v21;
    v53 = v24;
    v25 = v23;
    v54 = v25;
    v26 = _Block_copy(v51);
    v45[0] = v15;
    v45[1] = 3221225472;
    v45[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92;
    v45[3] = &unk_1E3795298;
    v46 = v42;
    v47 = v18;
    v48 = self;
    v27 = v26;
    v49 = v27;
    v28 = v24;
    v50 = v28;
    v29 = _Block_copy(v45);
    -[SLDCollaborationHandshakeService taskManager](self, "taskManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startAggregateTask:withTimeout:cancellationHandler:", v29, v17, 15.0);
    v31 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v67, 8);
    v13 = (void *)v31;
  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

uint64_t __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_81(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = *(void **)(a1 + 32);
  v15 = a6;
  v16 = a5;
  objc_msgSend(v14, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_82;
  v23[3] = &unk_1E3795180;
  v18 = *(void **)(a1 + 40);
  v23[4] = *(_QWORD *)(a1 + 32);
  v24 = v18;
  v25 = v13;
  v26 = v11;
  v19 = *(id *)(a1 + 48);
  v27 = v12;
  v28 = v19;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  objc_msgSend(v17, "startSubtask:withProgress:timer:", v23, v16, v15);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_82(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v5 = a4;
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_83;
  v13[3] = &unk_1E3795158;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = v5;
  v13[4] = v11;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 64);
  v12 = v5;
  objc_msgSend(v7, "_sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:", v8, v9, v10, MEMORY[0x1E0C9AA60], v13);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_83(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (a2)
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: success. Replying with shareURL and updatedMetadata", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateMetadata:withNewIdentities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("startCollaborationWithFileURL adding participants failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_83_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = *(void **)(a1 + 32);
  v15 = a6;
  v16 = a5;
  objc_msgSend(v14, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_87;
  v22[3] = &unk_1E3795018;
  v18 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v13;
  v26 = v18;
  v24 = v11;
  v27 = *(id *)(a1 + 48);
  v25 = v12;
  v19 = v12;
  v20 = v11;
  v21 = v13;
  objc_msgSend(v17, "startSubtask:withProgress:timer:", v22, v16, v15);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_87(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  SLDaemonLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _localPersonIdentityForDocumentIdentifier", buf, 2u);
  }

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_88;
  v16[3] = &unk_1E3794FF0;
  v22 = v9;
  v17 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 56);
  v20 = v7;
  v21 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v11, "_localPersonIdentityForDocumentIdentifier:completion:", v12, v16);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_88(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && v8 && !v9)
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated local identity.", v15, 2u);
    }

    (*(void (**)(void))(a1[9] + 16))();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v8);
    (*(void (**)(void))(a1[11] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
    if (!v10)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2938];
      v17[0] = CFSTR("Could not generate person identities.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_88_cold_1((uint64_t)a1, v14);

    (*(void (**)(void))(a1[10] + 16))();
  }

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_89(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = *(void **)(a1 + 32);
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "taskManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_90;
  v18[3] = &unk_1E37951F8;
  v15 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v15;
  v20 = v10;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v21 = v9;
  v16 = v9;
  v17 = v10;
  objc_msgSend(v14, "startSubtask:withProgress:timer:", v18, v13, v12);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_90(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_91;
  v16[3] = &unk_1E37951D0;
  v21 = v9;
  v22 = *(id *)(a1 + 64);
  v23 = *(id *)(a1 + 72);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  v19 = v7;
  v20 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "_personIdentitiesForHandles:documentIdentifier:completion:", v11, v12, v16);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_91(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated remote identities.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(a1[8] + 16))();
    (*(void (**)(void))(a1[10] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2938];
      v14[0] = CFSTR("Could not generate person identities.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL Failed to generate identities. Error: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(a1[9] + 16))();
  }

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD7448], "actionWithMetadata:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(id *)(a1 + 56);
  v10 = v5;
  v12 = *(id *)(a1 + 64);
  v8 = v6;
  v9 = v5;
  SWPerformActionForDocumentURL();

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_93(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "privateSerialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_94;
  block[3] = &unk_1E3795248;
  v7 = v3;
  v10 = a1[7];
  v8 = a1[5];
  v9 = a1[6];
  v11 = a1[8];
  v5 = v3;
  dispatch_async(v4, block);

}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_94(_QWORD *a1)
{
  id *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = *v2;
  else
    v3 = 0;
  v4 = v3;
  if (objc_msgSend(v4, "success")
    && (objc_msgSend(v4, "url"), (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (void *)v5,
        objc_msgSend(v4, "updatedMetadata"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "_SWStartCollaborationAction returned a shareURL and updatedMetadata.", v17, 2u);
    }

    v9 = a1[7];
    objc_msgSend(v4, "url");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD, _QWORD))(v9 + 16))(v9, v10, v11, a1[5], a1[6]);

  }
  else
  {
    objc_msgSend(*v2, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v10 = v12;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("_SWStartCollaborationAction failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_94_cold_1((uint64_t *)v2, (uint64_t)v10, v16);

    (*(void (**)(void))(a1[8] + 16))();
  }

}

- (id)addParticipantHandles:(id)a3 withMetadata:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, void *, void *, void *);
  void *v54;
  SLDCollaborationHandshakeService *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD aBlock[4];
  id v65;
  __int128 *p_buf;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD block[4];
  id v71;
  id v72;
  __int128 buf;
  uint64_t v74;
  char v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SLDaemonLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:]";
    _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "collaborationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      SLDaemonLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);

      v45 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB2938];
      v77 = CFSTR("addParticipantHandles:withMetadata: cannot add participant handles because the metadata did not have a collaboration identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
      v48 = objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_102;
      v67[3] = &unk_1E37946E0;
      v68 = v47;
      v69 = v10;
      v49 = v47;
      dispatch_async(v48, v67);

      v23 = (void *)objc_opt_new();
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v74 = 0x2020000000;
      v14 = MEMORY[0x1E0C809B0];
      v75 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2;
      aBlock[3] = &unk_1E37952C0;
      p_buf = &buf;
      v65 = v10;
      v62[0] = v14;
      v62[1] = 3221225472;
      v62[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3;
      v62[3] = &unk_1E3794668;
      v15 = _Block_copy(aBlock);
      v63 = v15;
      v16 = _Block_copy(v62);
      v60[0] = v14;
      v60[1] = 3221225472;
      v60[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_104;
      v60[3] = &unk_1E3795310;
      v60[4] = self;
      v17 = v15;
      v61 = v17;
      v18 = _Block_copy(v60);
      v51 = v14;
      v52 = 3221225472;
      v53 = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_108;
      v54 = &unk_1E3795298;
      v55 = self;
      v56 = v8;
      v57 = v9;
      v19 = v18;
      v58 = v19;
      v20 = v17;
      v59 = v20;
      v21 = _Block_copy(&v51);
      -[SLDCollaborationHandshakeService taskManager](self, "taskManager", v51, v52, v53, v54, v55);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startAggregateTask:withTimeout:cancellationHandler:", v21, v16, 15.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    SLDaemonLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v78 = *MEMORY[0x1E0CB2938];
    v79[0] = CFSTR("addParticipantHandles:withMetadata: cannot add participant handles because no participants were provided.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke;
    block[3] = &unk_1E37946E0;
    v71 = v34;
    v72 = v10;
    v36 = v34;
    dispatch_async(v35, block);

    v23 = (void *)objc_opt_new();
  }

  return v23;
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2(uint64_t result)
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

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: was cancelled by our client", v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_104(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = *(void **)(a1 + 32);
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "taskManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_105;
  v18[3] = &unk_1E3794708;
  v15 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = v9;
  v21 = v15;
  v16 = v9;
  v17 = v10;
  objc_msgSend(v14, "startSubtask:withProgress:timer:", v18, v13, v12);

}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_105(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  SLDaemonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_106;
  v7[3] = &unk_1E37952E8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:", v4, v5, MEMORY[0x1E0C9AA60], v7);

}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_106(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateMetadata:withNewIdentities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_108(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_109;
  v16[3] = &unk_1E3795338;
  v20 = v9;
  v21 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v18 = v7;
  v19 = v8;
  v22 = *(id *)(a1 + 64);
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "_personIdentitiesForHandles:documentIdentifier:completion:", v11, v12, v16);

}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_109(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: Generated remote identities.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2938];
      v14[0] = CFSTR("Could not generate person identities.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: Failed to generate identities. Error: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(a1[9] + 16))();
  }

}

- (id)addParticipantHandles:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD aBlock[5];
  id v63;
  uint64_t *v64;
  _QWORD *v65;
  _QWORD v66[3];
  char v67;
  _QWORD v68[4];
  id v69;
  _BYTE *v70;
  id obj;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int64_t v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD block[4];
  id v80;
  id v81;
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v50 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setTotalUnitCount:", 1);
  objc_msgSend(v14, "collaborationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18
    || (objc_msgSend(v14, "collaborationIdentifier"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "length") == 0,
        v19,
        v18,
        v20))
  {
    SLDaemonLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:].cold.1();

    v31 = (void *)MEMORY[0x1E0CB35C8];
    v88 = *MEMORY[0x1E0CB2938];
    v89[0] = CFSTR("Missing collaboration identifier on the provided metadata.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke;
    block[3] = &unk_1E37946E0;
    v80 = v33;
    v81 = v15;
    v35 = v33;
    dispatch_async(v34, block);

  }
  else if (objc_msgSend(v12, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v83 = __Block_byref_object_copy__9;
    v84 = __Block_byref_object_dispose__9;
    v85 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    obj = 0;
    v21 = -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:](self, "_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:", v50, v13, v51, &obj);
    objc_storeStrong(&v85, obj);
    v75 = v21;
    if (v73[3] == -1)
    {
      v42 = *(_QWORD *)&buf[8];
      v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v43)
      {
        v44 = v43;
        v45 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = v44;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 3, 0);
        v46 = objc_claimAutoreleasedReturnValue();
        v45 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v46;
      }

      -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
      v47 = objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2;
      v68[3] = &unk_1E3794D48;
      v69 = v15;
      v70 = buf;
      dispatch_async(v47, v68);

    }
    else
    {
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x2020000000;
      v67 = 0;
      v22 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3;
      aBlock[3] = &unk_1E3795360;
      aBlock[4] = self;
      v64 = &v72;
      v65 = v66;
      v63 = v15;
      v60[0] = v22;
      v60[1] = 3221225472;
      v60[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4;
      v60[3] = &unk_1E3794668;
      v23 = _Block_copy(aBlock);
      v61 = v23;
      v49 = _Block_copy(v60);
      v57[0] = v22;
      v57[1] = 3221225472;
      v57[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_115;
      v57[3] = &unk_1E37953B0;
      v57[4] = self;
      v58 = v13;
      v24 = v23;
      v59 = v24;
      v25 = _Block_copy(v57);
      -[SLDCollaborationHandshakeService taskManager](self, "taskManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v22;
      v52[1] = 3221225472;
      v52[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_120;
      v52[3] = &unk_1E3795298;
      v52[4] = self;
      v53 = v12;
      v54 = v14;
      v27 = v25;
      v55 = v27;
      v28 = v24;
      v56 = v28;
      objc_msgSend(v26, "startAggregateTask:withTimeout:cancellationHandler:", v52, v49, 15.0);
      v29 = objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v66, 8);
      v17 = (void *)v29;
    }
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SLDaemonLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:].cold.2();

    v37 = (void *)MEMORY[0x1E0CB35C8];
    v86 = *MEMORY[0x1E0CB2938];
    v87 = CFSTR("There were no provided hashes to remove");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v40 = objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_114;
    v76[3] = &unk_1E37946E0;
    v77 = v39;
    v78 = v15;
    v41 = v39;
    dispatch_async(v40, v76);

  }
  return v17;
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_115(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = *(void **)(a1 + 32);
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "taskManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_116;
  v18[3] = &unk_1E37946B8;
  v15 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v15;
  v20 = v10;
  v21 = v9;
  v22 = *(id *)(a1 + 48);
  v16 = v9;
  v17 = v10;
  objc_msgSend(v14, "startSubtask:withProgress:timer:", v18, v13, v12);

}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_116(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a4;
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_117;
  v13[3] = &unk_1E3795388;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v13[4] = v11;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v12 = v5;
  objc_msgSend(v7, "_sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:", v8, v9, v10, MEMORY[0x1E0C9AA60], v13);

}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_117(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateMetadata:withNewIdentities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addCollaborationParticipants: finished adding participants, and the full initiation flow.", v11, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("addCollaborationParticipants adding participants failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_117_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_120(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "collaborationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_121;
  v16[3] = &unk_1E3795338;
  v20 = v9;
  v21 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v18 = v7;
  v19 = v8;
  v22 = *(id *)(a1 + 64);
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "_personIdentitiesForHandles:documentIdentifier:completion:", v11, v12, v16);

}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_121(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated identities.", v11, 2u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("Could not generate person identities.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_121_cold_1();

    (*(void (**)(void))(a1[9] + 16))();
  }

}

- (id)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD aBlock[4];
  id v55;
  __int128 *p_buf;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD block[4];
  id v61;
  id v62;
  __int128 buf;
  uint64_t v64;
  char v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SLDaemonLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:]";
    _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "collaborationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      SLDaemonLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);

      v42 = (void *)MEMORY[0x1E0CB35C8];
      v66 = *MEMORY[0x1E0CB2938];
      v67 = CFSTR("removeParticipantIdentities:withMetadata: cannot remove participant handles because the metadata did not have a collaboration identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
      v45 = objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_126;
      v57[3] = &unk_1E37946E0;
      v58 = v44;
      v59 = v10;
      v46 = v44;
      dispatch_async(v45, v57);

      v20 = (void *)objc_opt_new();
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v64 = 0x2020000000;
      v14 = MEMORY[0x1E0C809B0];
      v65 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_2;
      aBlock[3] = &unk_1E37952C0;
      p_buf = &buf;
      v55 = v10;
      v52[0] = v14;
      v52[1] = 3221225472;
      v52[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3;
      v52[3] = &unk_1E3794668;
      v15 = _Block_copy(aBlock);
      v53 = v15;
      v16 = _Block_copy(v52);
      v48[0] = v14;
      v48[1] = 3221225472;
      v48[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_127;
      v48[3] = &unk_1E3794708;
      v48[4] = self;
      v49 = v9;
      v50 = v8;
      v17 = v15;
      v51 = v17;
      v18 = _Block_copy(v48);
      -[SLDCollaborationHandshakeService taskManager](self, "taskManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startAggregateTask:withTimeout:cancellationHandler:", v18, v16, 15.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    SLDaemonLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    v29 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2938];
    v69[0] = CFSTR("removeParticipantIdentities:withMetadata: cannot remove participant handles because no participants were provided.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke;
    block[3] = &unk_1E37946E0;
    v61 = v31;
    v62 = v10;
    v33 = v31;
    dispatch_async(v32, block);

    v20 = (void *)objc_opt_new();
  }

  return v20;
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_2(uint64_t result)
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

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5)
      __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (v5)
      __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_127(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  SLDaemonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_128;
  v6[3] = &unk_1E37952E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:", v4, MEMORY[0x1E0C9AA60], v5, v6);

}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_128(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeIdentities:fromMetadata:", v4, *(_QWORD *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (id)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  id v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[5];
  id v57;
  uint64_t *v58;
  _QWORD *v59;
  _QWORD v60[3];
  char v61;
  _QWORD v62[4];
  id v63;
  _BYTE *v64;
  id obj;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  int64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD block[4];
  id v74;
  id v75;
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  _QWORD v83[4];

  v83[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v47 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setTotalUnitCount:", 1);
  objc_msgSend(v14, "collaborationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18
    || (objc_msgSend(v14, "collaborationIdentifier"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "length") == 0,
        v19,
        v18,
        v20))
  {
    SLDaemonLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:].cold.1();

    v29 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2938];
    v83[0] = CFSTR("Missing collaboration identifier on the provided metadata.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke;
    block[3] = &unk_1E37946E0;
    v74 = v31;
    v75 = v15;
    v33 = v31;
    dispatch_async(v32, block);

  }
  else if (objc_msgSend(v12, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v77 = __Block_byref_object_copy__9;
    v78 = __Block_byref_object_dispose__9;
    v79 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    obj = 0;
    v21 = -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:](self, "_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:", v47, v13, v48, &obj);
    objc_storeStrong(&v79, obj);
    v69 = v21;
    if (v67[3] == -1)
    {
      v40 = *(_QWORD *)&buf[8];
      v41 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v41)
      {
        v42 = v41;
        v43 = *(void **)(v40 + 40);
        *(_QWORD *)(v40 + 40) = v42;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 3, 0);
        v44 = objc_claimAutoreleasedReturnValue();
        v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v44;
      }

      -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
      v45 = objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2;
      v62[3] = &unk_1E3794D48;
      v63 = v15;
      v64 = buf;
      dispatch_async(v45, v62);

    }
    else
    {
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      v61 = 0;
      v22 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3;
      aBlock[3] = &unk_1E3795360;
      aBlock[4] = self;
      v58 = &v66;
      v59 = v60;
      v57 = v15;
      v54[0] = v22;
      v54[1] = 3221225472;
      v54[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4;
      v54[3] = &unk_1E3794668;
      v23 = _Block_copy(aBlock);
      v55 = v23;
      v24 = _Block_copy(v54);
      -[SLDCollaborationHandshakeService taskManager](self, "taskManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v22;
      v49[1] = 3221225472;
      v49[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_130;
      v49[3] = &unk_1E37946B8;
      v49[4] = self;
      v50 = v13;
      v51 = v14;
      v52 = v12;
      v26 = v23;
      v53 = v26;
      objc_msgSend(v25, "startAggregateTask:withTimeout:cancellationHandler:", v49, v24, 15.0);
      v27 = objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v60, 8);
      v17 = (void *)v27;
    }
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SLDaemonLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:].cold.2();

    v35 = (void *)MEMORY[0x1E0CB35C8];
    v80 = *MEMORY[0x1E0CB2938];
    v81 = CFSTR("There were no provided hashes to remove");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v38 = objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_129;
    v70[3] = &unk_1E37946E0;
    v71 = v37;
    v72 = v15;
    v39 = v37;
    dispatch_async(v38, v70);

  }
  return v17;
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL was cancelled by our client", v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_130(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a4;
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_131;
  v13[3] = &unk_1E3795388;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v13[4] = v11;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 64);
  v12 = v5;
  objc_msgSend(v7, "_sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:", v8, v9, MEMORY[0x1E0C9AA60], v10, v13);

}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_131(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (a2)
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL: finished removing participants.", v13, 2u);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_removeIdentities:fromMetadata:", v8, *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (!v5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2938];
      v15[0] = CFSTR("removeParticipantIdentities:withFileURL: removing participants failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v11);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_131_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)_sendActionUpdateParticipantsWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentities:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  _QWORD aBlock[4];
  void (**v51)(id, _QWORD, void *);
  _QWORD *v52;
  _QWORD v53[3];
  char v54;
  id v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v41 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(v10, "sourceProcessData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDProcessVerifier tagDataFromString:](SLDProcessVerifier, "tagDataFromString:", v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SLDCollaborationHandshakeService processVerifier](self, "processVerifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v15, "verifyData:tag:error:", v13, v40, &v55);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v55;

    if (v16)
    {
      if (objc_msgSend(v11, "count", v39) || objc_msgSend(v41, "count"))
      {
        if (objc_msgSend(v11, "count")
          && -[SLDCollaborationHandshakeService _doesMetadata:containAnyOf:](self, "_doesMetadata:containAnyOf:", v10, v11))
        {
          SLDaemonLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:].cold.4((uint64_t)v11, v10, v17);

          v18 = (void *)MEMORY[0x1E0CB35C8];
          v58 = *MEMORY[0x1E0CB2938];
          v59 = CFSTR("_sendActionUpdateParticipantsWithMetadata: attempted to add identities which already exist in the metadata identity map.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v12[2](v12, 0, v20);
        }
        else if (objc_msgSend(v41, "count")
               && !-[SLDCollaborationHandshakeService _doesMetadata:containAllOf:](self, "_doesMetadata:containAllOf:", v10, v41))
        {
          SLDaemonLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:].cold.3((uint64_t)v41, v10, v31);

          v32 = (void *)MEMORY[0x1E0CB35C8];
          v56 = *MEMORY[0x1E0CB2938];
          v57 = CFSTR("_sendActionUpdateParticipantsWithMetadata: attempted to remove some identities which do not exist in the metadata identity map.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v12[2](v12, 0, v34);
        }
        else
        {
          v53[0] = 0;
          v53[1] = v53;
          v53[2] = 0x2020000000;
          v24 = MEMORY[0x1E0C809B0];
          v54 = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke;
          aBlock[3] = &unk_1E37953D8;
          v52 = v53;
          v51 = v12;
          v25 = _Block_copy(aBlock);
          v26 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v26, "setHandleToIdentityMap:", MEMORY[0x1E0C9AA70]);
          objc_msgSend(MEMORY[0x1E0CD7458], "actionWithMetadata:addedIdentities:removedIdentites:", v26, v11, v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = 0;
          v48[1] = v48;
          v48[2] = 0x3032000000;
          v48[3] = __Block_byref_object_copy__9;
          v48[4] = __Block_byref_object_dispose__9;
          v49 = 0;
          v45[0] = v24;
          v45[1] = 3221225472;
          v45[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2;
          v45[3] = &unk_1E3795400;
          v47 = v48;
          v28 = v25;
          v46 = v28;
          objc_msgSend(v27, "setResponseHandlerBlock:", v45);
          -[SLDCollaborationHandshakeService actionDispatcher](self, "actionDispatcher");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_145;
          v42[3] = &unk_1E3795428;
          v44 = v48;
          v30 = v28;
          v43 = v30;
          objc_msgSend(v29, "dispatchAction:withAssertionForProcess:completion:", v27, v16, v42);

          _Block_object_dispose(v48, 8);
          _Block_object_dispose(v53, 8);
        }
      }
      else
      {
        SLDaemonLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:].cold.2();

        v36 = (void *)MEMORY[0x1E0CB35C8];
        v60 = *MEMORY[0x1E0CB2938];
        v61 = CFSTR("_sendActionUpdateParticipantsWithMetadata: there were no provided identities to remove/add.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v12[2](v12, 0, v38);
      }
      goto LABEL_23;
    }
  }
  else
  {
    v39 = 0;
  }
  SLDaemonLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:].cold.1((uint64_t)v13, v10, v21);

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v62 = *MEMORY[0x1E0CB2938];
  v63[0] = CFSTR("_sendActionUpdateParticipantsWithMetadata: failed to verify source process.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2](v12, 0, v16);
LABEL_23:

}

uint64_t __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke(uint64_t result)
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

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  if (objc_msgSend(v3, "success"))
  {
    SLDaemonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "_sendActionUpdateParticipantsWithMetadata: successfully added participants", v11, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("_updateParticipantsWithMetadata adding participants failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "_sendActionUpdateParticipantsWithMetadata: action dispatcher successfully sent the update participants action to the app. Waiting for our response handler to be called", v9, 2u);
    }

  }
}

- (void)_sendActionUpdateParticipantsWithFileURL:(id)a3 metadata:(id)a4 addedIdentities:(id)a5 removedIdentities:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void (**v27)(id, _QWORD, void *);
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  if (!objc_msgSend(v14, "count") && !objc_msgSend(v15, "count"))
  {
    SLDaemonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:].cold.1();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2938];
    v33[0] = CFSTR("_sendActionUpdateParticipantsWithFileURL: there were no provided identities to remove/add.");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (const __CFString **)v33;
    v21 = &v32;
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "count")
    && -[SLDCollaborationHandshakeService _doesMetadata:containAnyOf:](self, "_doesMetadata:containAnyOf:", v13, v14))
  {
    SLDaemonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:].cold.3((uint64_t)v14, v13, v17);

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2938];
    v31 = CFSTR("_sendActionUpdateParticipantsWithFileURL: attempted to add identities which already exist in the metadata identity map.");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v31;
    v21 = &v30;
LABEL_17:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v16[2](v16, 0, v23);
    goto LABEL_18;
  }
  if (objc_msgSend(v15, "count")
    && -[SLDCollaborationHandshakeService _doesMetadata:containAllOf:](self, "_doesMetadata:containAllOf:", v13, v15))
  {
    SLDaemonLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:].cold.2((uint64_t)v15, v13, v22);

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    v29 = CFSTR("_sendActionUpdateParticipantsWithFileURL: attempted to remove some identities which do not exist in the metadata identity map.");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v29;
    v21 = &v28;
    goto LABEL_17;
  }
  v23 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v23, "setHandleToIdentityMap:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(MEMORY[0x1E0CD7458], "actionWithMetadata:addedIdentities:removedIdentites:", v23, v14, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v16;
  SWPerformActionForDocumentURL();

LABEL_18:
}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "privateSerialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2;
  v6[3] = &unk_1E3794DE8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "success"))
  {
    SLDaemonLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "_SWUpdateCollaborationParticipantsAction with a fileURL returned success.", v9, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2938];
      v11[0] = CFSTR("_SWUpdateCollaborationParticipantsAction (with a fileURL) response was not successful.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v7);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)_updateMetadata:(id)a3 withNewIdentities:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "handleToIdentityMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "addEntriesFromDictionary:", v5);
  v12 = (void *)objc_msgSend(v6, "copy");

  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "setHandleToIdentityMap:", v13);

  return v12;
}

- (id)_removeIdentities:(id)a3 fromMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v6, "handleToIdentityMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "allKeysForObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
          objc_msgSend(v9, "removeObjectsForKeys:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setHandleToIdentityMap:", v16);

  return v7;
}

- (BOOL)_doesMetadata:(id)a3 containAllOf:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "handleToIdentityMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_doesMetadata:(id)a3 containAnyOf:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "handleToIdentityMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_localPersonIdentityForDocumentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[SLDCollaborationHandshakeService personIdentityGenerator](self, "personIdentityGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke_2;
    v16[3] = &unk_1E3795478;
    v17 = v7;
    v9 = v7;
    objc_msgSend(v8, "generateLocalIdentityForDocumentIdentifier:completionHandler:", v6, v16);

    v10 = v17;
  }
  else
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _localPersonIdentityForDocumentIdentifier:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2938];
    v22[0] = CFSTR("Missing collaboration identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke;
    block[3] = &unk_1E37946E0;
    v19 = v14;
    v20 = v7;
    v10 = v7;
    v9 = v14;
    dispatch_async(v15, block);

  }
}

uint64_t __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v12, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v12, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v10 + 16))(v10, v11, v9, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_personIdentitiesForHandles:(id)a3 documentIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SLPersonIdentityGenerator *v12;
  void *v13;
  SLPersonIdentityGenerator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SLDCollaborationHandshakeService *v23;
  id v24;
  _QWORD *v25;
  uint8_t buf[8];
  _QWORD v27[5];
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__9;
    v27[4] = __Block_byref_object_dispose__9;
    v28 = (id)MEMORY[0x1E0C9AA70];
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "_personIdentitiesForHandles invoking SLPersonIdentityGenerator to generate identity hashes", buf, 2u);
    }

    v12 = [SLPersonIdentityGenerator alloc];
    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SLPersonIdentityGenerator initWithQueue:](v12, "initWithQueue:", v13);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_156;
    v21[3] = &unk_1E37954A0;
    v25 = v27;
    v22 = v8;
    v23 = self;
    v24 = v10;
    -[SLPersonIdentityGenerator generatePersonIdentitiesForHandles:documentIdentifier:completionHandler:](v14, "generatePersonIdentitiesForHandles:documentIdentifier:completionHandler:", v22, v9, v21);

    _Block_object_dispose(v27, 8);
  }
  else
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _personIdentitiesForHandles:documentIdentifier:completion:].cold.1();

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2938];
    v33[0] = CFSTR("Missing collaboration identifier on the provided metadata.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SLDCollaborationHandshakeService privateSerialQueue](self, "privateSerialQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke;
    block[3] = &unk_1E37946E0;
    v30 = v18;
    v31 = v10;
    v20 = v18;
    dispatch_async(v19, block);

  }
}

uint64_t __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 32));
}

void __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[16];

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4 != objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_156_cold_1(v3, (id *)(a1 + 32), v5);

  }
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "_personIdentitiesForHandles received hashes from SLPersonIdentityGenerator", buf, 2u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  objc_msgSend(*(id *)(a1 + 40), "privateSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_157;
  v13[3] = &unk_1E3794D48;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v14 = v11;
  v15 = v12;
  dispatch_async(v10, v13);

}

uint64_t __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  uint64_t v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  SLDCollaborationHandshakeService *v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v10, "length"))
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.2();
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v10, "getBytes:range:", buf, objc_msgSend(v10, "length") - 1, 1);
  if (buf[0])
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.3();
LABEL_7:

LABEL_8:
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.1();

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 3, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_12:
    v15 = -1;
    goto LABEL_13;
  }
  objc_msgSend(objc_retainAutorelease(v10), "bytes");
  v17 = sandbox_extension_consume();
  if (v17 == -1)
    goto LABEL_8;
  v15 = v17;
  if (!-[SLDCollaborationHandshakeService _connection:hasPermissionForFileURL:](self, "_connection:hasPermissionForFileURL:", v12, v11))
  {
    SLDaemonLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = (int64_t)v11;
      v28 = 2112;
      v29 = v12;
      _os_log_error_impl(&dword_199EFF000, v22, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but the xpc connection (%@) does not have permission to access the file. Releasing sandbox handle.", buf, 0x20u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 6, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SLDCollaborationHandshakeService _releaseSandboxHandle:](self, "_releaseSandboxHandle:", v15);
    goto LABEL_12;
  }
  v23 = 0;
  v18 = -[SLDCollaborationHandshakeService _fileURLHasFileProvider:error:](self, "_fileURLHasFileProvider:error:", v11, &v23);
  v19 = v23;
  SLDaemonLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = (int64_t)v11;
      v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_199EFF000, v21, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but could not find a valid FPItem for that file. This file might not be managed by a FileProvider. Releasing sandbox handle. FileProvider error: %@", buf, 0x20u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 4, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SLDCollaborationHandshakeService _releaseSandboxHandle:](self, "_releaseSandboxHandle:", v15);

    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = self;
    v26 = 2048;
    v27 = v15;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_199EFF000, v21, OS_LOG_TYPE_DEFAULT, "[%p] _acquireSandboxHandleData: acquired a new handle: %llu for file: %@", buf, 0x20u);
  }

LABEL_13:
  return v15;
}

- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CAAC80];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend(v5, "auditToken"), objc_msgSend(v6, "isFileURL"))
    && (objc_msgSend(v6, "path"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    objc_msgSend(v5, "auditToken");
    objc_msgSend(v6, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "fileSystemRepresentation");
    v10 = sandbox_check_by_audit_token() == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_releaseSandboxHandle:(int64_t)a3
{
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  SLDCollaborationHandshakeService *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = sandbox_extension_release();
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationHandshakeService _releaseSandboxHandle:].cold.1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[%p] _releaseSandboxHandle: released handle: %lld", (uint8_t *)&v8, 0x16u);
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

- (SLDProcessVerifier)processVerifier
{
  return self->_processVerifier;
}

- (void)setProcessVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_processVerifier, a3);
}

- (SLSWActionDispatcher)actionDispatcher
{
  return self->_actionDispatcher;
}

- (void)setActionDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_actionDispatcher, a3);
}

- (SLPersonIdentityGenerator)personIdentityGenerator
{
  return self->_personIdentityGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentityGenerator, 0);
  objc_storeStrong((id *)&self->_actionDispatcher, 0);
  objc_storeStrong((id *)&self->_processVerifier, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_privateSerialQueue, 0);
}

- (void)allowsConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] connection does not have the proper entitlement and will not be allowed to access the service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: was cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_38_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: error generating proof with SLPersonIdentityGenerator. proof: %@ error: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)verifySourceBundleIdentifierFromMetadata:(NSObject *)a3 reply:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v6, "[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

- (void)startCollaborationWithMetadata:(uint64_t)a1 participants:(void *)a2 reply:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v6, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] performStartCollaborationActionWithMetadata timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] performStartCollaborationActionWithMetadata was cancelled by our client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_55_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collaborationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "[SLDCollaborationHandshakeService] _startCollaborationWithMetadata Failed to generate local identity for documentIdentifier %@.", v5);

  OUTLINED_FUNCTION_6();
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL was cancelled by our client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "startCollaborationWithFileURL adding participants failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_88_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collaborationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Failed to generate local identity for documentIdentifier %@.", v5);

  OUTLINED_FUNCTION_6();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_94_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, (uint64_t)a3, "_SWStartCollaborationAction failed with response: %@. Error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)addParticipantHandles:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s cannot add participant handles because no participants were provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)addParticipantHandles:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s cannot add participant handles because the metadata did not have a collaboration identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "removeCollaborationParticipantHashes:withFileURL: cannot update participants without a collaboration identifier on the target metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "removeCollaborationParticipantHashes:withFileURL: unable to create SWPersonIdentities from provided hashes, or there were no provided hashes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] removeCollaborationParticipantHashes:withFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] removeCollaborationParticipantHashes:withFileURL was cancelled by our client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_117_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "addCollaborationParticipants adding participants failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_121_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL Failed to generate identities. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeParticipantIdentities:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s cannot remove participants because no identities were provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)removeParticipantIdentities:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s cannot remove participant handles because the metadata did not have a collaboration identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: was cancelled by our client.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "removeParticipantIdentities:withFileURL: cannot update participants without a collaboration identifier on the target metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "removeParticipantIdentities:withFileURL: cannot remove participants because no participants were provided.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_131_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "removeParticipantIdentities:withFileURL: removing participants failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_sendActionUpdateParticipantsWithMetadata:(NSObject *)a3 addedIdentities:removedIdentities:completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v6, "_sendActionUpdateParticipantsWithMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

- (void)_sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "_sendActionUpdateParticipantsWithMetadata: attempted to add/remove identities without any identities.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendActionUpdateParticipantsWithMetadata:(NSObject *)a3 addedIdentities:removedIdentities:completion:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "handleToIdentityMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v7, "_sendActionUpdateParticipantsWithMetadata: attempted to remove some identities which do not exist in the metadata identity map. removedIdentities: %@ metadata identities: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_9();
}

- (void)_sendActionUpdateParticipantsWithMetadata:(NSObject *)a3 addedIdentities:removedIdentities:completion:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "handleToIdentityMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v7, "_sendActionUpdateParticipantsWithMetadata: attempted to add identities which already exist in the metadata identity map. addedIdentities: %@ metadata identities: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_9();
}

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "_sendActionUpdateParticipantsWithMetadata: adding participants failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "_sendActionUpdateParticipantsWithFileURL: attempted to add/remove identities without any identities.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendActionUpdateParticipantsWithFileURL:(NSObject *)a3 metadata:addedIdentities:removedIdentities:completion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "handleToIdentityMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v7, "_sendActionUpdateParticipantsWithFileURL: attempted to remove some identities which do not exist in the metadata identity map. removedIdentities: %@ metadata identities: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_9();
}

- (void)_sendActionUpdateParticipantsWithFileURL:(NSObject *)a3 metadata:addedIdentities:removedIdentities:completion:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "handleToIdentityMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v7, "_sendActionUpdateParticipantsWithFileURL: attempted to add identities which already exist in the metadata identity map. addedIdentities: %@ metadata identities: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_9();
}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "_SWUpdateCollaborationParticipantsAction with a fileURL failed. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_localPersonIdentityForDocumentIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "_localPersonIdentityForDocumentIdentifier: cannot generate local identity without a document identifier. DocID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_personIdentitiesForHandles:documentIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "_personIdentitiesForHandles: cannot generate identities without a document identifier or handles. DocID: %@ handles: %@", v1);
  OUTLINED_FUNCTION_5();
}

void __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_156_cold_1(void *a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(*a2, "count");
  v8 = 134218240;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v7, "Received a different number of identities than expected. This may mean some recipients are on older software versions that do not support collaboration. Expected: %lu Actual: %lu", (uint8_t *)&v8);
  OUTLINED_FUNCTION_9();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%p] _acquireSandboxHandleData: failed to consume sandbox token for file: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%p] _acquireSandboxHandleData: tokenData for file (%@) was empty.", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%p] _acquireSandboxHandleData: sandbox token for file (%@) was not null-terminated.", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_releaseSandboxHandle:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_15(&dword_199EFF000, v1, (uint64_t)v1, "[%p] _releaseSandboxHandle: unable to release sandbox extension handle: %lld. Sandbox extensions are a limited resource and this should be investigated!", v2);
  OUTLINED_FUNCTION_5();
}

@end
