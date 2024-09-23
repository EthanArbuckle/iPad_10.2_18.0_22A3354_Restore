@implementation PKSharingIDSManager

- (void)addDelegate:(id)a3
{
  NSHashTable *delegates;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  delegates = self->_delegates;
  if (!delegates)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  -[NSHashTable addObject:](delegates, "addObject:", v7);
  os_unfair_lock_unlock(&self->_delegatesLock);

}

- (PKSharingIDSManager)init
{
  PKIDSService *v3;
  PKSharingIDSManager *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = -[PKIDSService initWithServiceName:]([PKIDSService alloc], "initWithServiceName:", CFSTR("com.apple.private.alloy.applepay.sharing"));
  v4 = -[PKSharingIDSManager initWithIDSService:](self, "initWithIDSService:", v3);
  if (v4)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Initializing IDS Sharing manager", v7, 2u);
    }

  }
  return v4;
}

- (PKSharingIDSManager)initWithTargetQueue:(id)a3
{
  NSObject *v4;
  PKSharingIDSManager *v5;
  PKSharingIDSManager *v6;

  v4 = a3;
  v5 = -[PKSharingIDSManager init](self, "init");
  v6 = v5;
  if (v5)
  {
    dispatch_set_target_queue((dispatch_object_t)v5->_internalQueue, v4);
    dispatch_set_target_queue((dispatch_object_t)v6->_callbackQueue, v4);
  }

  return v6;
}

- (PKSharingIDSManager)initWithIDSService:(id)a3
{
  id v5;
  PKSharingIDSManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *completionHandlers;
  NSMutableDictionary *v13;
  NSMutableDictionary *sharingDestinations;
  NSMutableDictionary *v15;
  NSMutableDictionary *completionTimers;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKSharingIDSManager;
  v6 = -[PKSharingIDSManager init](&v18, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.passd.idssharingmanager.internal", 0);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.passd.idssharingmanager.callback", 0);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_service, a3);
    v6->_delegatesLock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharingDestinations = v6->_sharingDestinations;
    v6->_sharingDestinations = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionTimers = v6->_completionTimers;
    v6->_completionTimers = v15;

    -[PKSharingIDSManager _registerListeners](v6, "_registerListeners");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PKIDSService removeDelegate:](self->_service, "removeDelegate:", self);
  -[PKIDSService unregisterListenersForTarget:](self->_service, "unregisterListenersForTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKSharingIDSManager;
  -[PKSharingIDSManager dealloc](&v3, sel_dealloc);
}

- (void)sendCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 invitationError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke;
  block[3] = &unk_1E2AC5630;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_async(internalQueue, block);

}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(a1[4], "_handlerConfigurationForInvitation:forHandle:", a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5608;
  v5[4] = a1[4];
  v10 = v3;
  v9 = a1[8];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v2, v5);

}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 72);
  v29 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v29);
  v10 = v29;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_4;
    v19[3] = &unk_1E2AC55E0;
    v13 = &v20;
    v20 = *(id *)(a1 + 40);
    v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 32);
    v25 = v15;
    v21[1] = v16;
    v22 = *(id *)(a1 + 56);
    v23 = v5;
    v24 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 64);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA18;
    v13 = &v28;
    v28 = v17;
    v14 = &v27;
    v27 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKCloudStoreZoneInvitationRequest *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKCloudStoreZoneInvitationRequest *v14;
  id v15;
  _QWORD block[4];
  PKCloudStoreZoneInvitationRequest *v17;
  id v18;
  uint8_t buf[4];
  PKCloudStoreZoneInvitationRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      -[PKCloudStoreZoneInvitationRequest setInvitation:](v5, "setInvitation:", *(_QWORD *)(a1 + 32));
      -[PKCloudStoreZoneInvitationRequest setDestination:](v5, "setDestination:", v4);
      -[PKCloudStoreZoneInvitationRequest setInvitationError:](v5, "setInvitationError:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 48), "_sendCloudStoreInvitationRequest:handleUserDetails:currentUserDetails:type:completion:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 10, *(_QWORD *)(a1 + 80));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 80);
    if (v11)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_25;
      v13[3] = &unk_1E2ABDA18;
      v15 = v11;
      v14 = v5;
      dispatch_async(v12, v13);

      v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No invitation defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 80);
    if (v7)
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_20;
      block[3] = &unk_1E2ABDA18;
      v18 = v7;
      v17 = v5;
      dispatch_async(v8, block);

      v9 = v18;
LABEL_12:

    }
  }
LABEL_13:

}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_20(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_25(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)removeCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke;
  v15[3] = &unk_1E2ABE1E8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a1[4], "_handlerConfigurationForInvitation:forHandle:", a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5680;
  v5[4] = a1[4];
  v9 = v3;
  v8 = a1[7];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v2, v5);

}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v28 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v28);
  v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E2AC5658;
    v13 = &v20;
    v20 = *(id *)(a1 + 40);
    v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v24 = v15;
    v21[1] = v16;
    v22 = v5;
    v23 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA18;
    v13 = &v27;
    v27 = v17;
    v14 = &v26;
    v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKCloudStoreZoneInvitationRequest *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKCloudStoreZoneInvitationRequest *v14;
  id v15;
  _QWORD block[4];
  PKCloudStoreZoneInvitationRequest *v17;
  id v18;
  uint8_t buf[4];
  PKCloudStoreZoneInvitationRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      -[PKCloudStoreZoneInvitationRequest setInvitation:](v5, "setInvitation:", *(_QWORD *)(a1 + 32));
      -[PKCloudStoreZoneInvitationRequest setDestination:](v5, "setDestination:", v4);
      objc_msgSend(*(id *)(a1 + 48), "_sendCloudStoreInvitationRequest:handleUserDetails:currentUserDetails:type:completion:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 11, *(_QWORD *)(a1 + 72));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 72);
    if (v11)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_30;
      v13[3] = &unk_1E2ABDA18;
      v15 = v11;
      v14 = v5;
      dispatch_async(v12, v13);

      v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No invitation defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_29;
      block[3] = &unk_1E2ABDA18;
      v18 = v7;
      v17 = v5;
      dispatch_async(v8, block);

      v9 = v18;
LABEL_12:

    }
  }
LABEL_13:

}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_29(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_30(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)sendCloudStoreZoneInvitationResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id WeakRetained;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "protobuf");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D34E08]);
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithProtobufData:type:isResponse:", v10, 10, 1);

  objc_msgSend(v7, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "idsDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invitation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _handlerConfigurationForInvitation:forHandle:](self, "_handlerConfigurationForInvitation:forHandle:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke;
  v22[3] = &unk_1E2AC5680;
  v25 = v6;
  v26 = v17;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  v19 = v12;
  v20 = v11;
  v21 = v6;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v16, v22);

}

void __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v26 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v26);
  v10 = v26;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(v11 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_3;
    block[3] = &unk_1E2ABE238;
    block[4] = v11;
    v18 = v12;
    v19 = *(id *)(a1 + 48);
    v20 = v5;
    v21 = v6;
    v22 = *(id *)(a1 + 56);
    dispatch_async(v13, block);

    v14 = v18;
LABEL_6:

    goto LABEL_7;
  }
  v15 = *(void **)(a1 + 56);
  if (v15)
  {
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_2;
    v23[3] = &unk_1E2ABDA18;
    v25 = v15;
    v24 = v10;
    dispatch_async(v16, v23);

    v14 = v25;
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)requestCloudStoreZoneInvitationData:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke;
  v15[3] = &unk_1E2ABE1E8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a1[4], "_handlerConfigurationForInvitation:forHandle:", a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5680;
  v5[4] = a1[4];
  v9 = v3;
  v8 = a1[7];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v2, v5);

}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v28 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v28);
  v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E2AC5658;
    v13 = &v20;
    v20 = *(id *)(a1 + 40);
    v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v24 = v15;
    v21[1] = v16;
    v22 = v5;
    v23 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA18;
    v13 = &v27;
    v27 = v17;
    v14 = &v26;
    v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKCloudStoreZoneInvitationRequest *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKCloudStoreZoneInvitationRequest *v14;
  id v15;
  _QWORD block[4];
  PKCloudStoreZoneInvitationRequest *v17;
  id v18;
  uint8_t buf[4];
  PKCloudStoreZoneInvitationRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      -[PKCloudStoreZoneInvitationRequest setInvitation:](v5, "setInvitation:", *(_QWORD *)(a1 + 32));
      -[PKCloudStoreZoneInvitationRequest setDestination:](v5, "setDestination:", v4);
      objc_msgSend(*(id *)(a1 + 48), "_sendCloudStoreInvitationRequest:handleUserDetails:currentUserDetails:type:completion:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 12, *(_QWORD *)(a1 + 72));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 72);
    if (v11)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_33;
      v13[3] = &unk_1E2ABDA18;
      v15 = v11;
      v14 = v5;
      dispatch_async(v12, v13);

      v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No invitation defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (PKCloudStoreZoneInvitationRequest *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_32;
      block[3] = &unk_1E2ABDA18;
      v18 = v7;
      v17 = v5;
      dispatch_async(v8, block);

      v9 = v18;
LABEL_12:

    }
  }
LABEL_13:

}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_32(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_33(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)_sendCloudStoreInvitationRequest:(id)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 type:(unsigned __int16)a6 completion:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "protobuf");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D34E08]);
  objc_msgSend(v20, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithProtobufData:type:isResponse:", v17, v7, 0);

  objc_msgSend(v15, "destination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:](self, "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", v18, v19, v14, v13, v12);
}

- (void)sendRemoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PKSharingIDSManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke;
  v15[3] = &unk_1E2AC4A20;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(internalQueue, v15);

}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke(uint64_t a1)
{
  PKSharingIDSManagerHandlerConfiguration *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v2 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v2, "setHandle:", *(_QWORD *)(a1 + 32));
  v3 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v2, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5680;
  v5[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v2, v5);

}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v28 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v28);
  v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E2AC5658;
    v13 = &v20;
    v20 = *(id *)(a1 + 40);
    v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v24 = v15;
    v21[1] = v16;
    v22 = v5;
    v23 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA18;
    v13 = &v27;
    v27 = v17;
    v14 = &v26;
    v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(v4, "protobuf");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x1E0D34E08]);
      objc_msgSend(v5, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithProtobufData:type:isResponse:", v7, 13, 0);

      objc_msgSend(*(id *)(a1 + 48), "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", v8, v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 72);
    if (v14)
    {
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_36;
      v16[3] = &unk_1E2ABDA18;
      v18 = v14;
      v17 = v5;
      dispatch_async(v15, v16);

      v12 = v18;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No invitation defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 72);
    if (v10)
    {
      v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_35;
      block[3] = &unk_1E2ABDA18;
      v21 = v10;
      v20 = v5;
      dispatch_async(v11, block);

      v12 = v21;
LABEL_12:

    }
  }
LABEL_13:

}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_35(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_36(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)sendRemoteRegistrationRequestResult:(unint64_t)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PKSharingIDSManager *v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke;
  v13[3] = &unk_1E2ABE080;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke(uint64_t a1)
{
  PKSharingIDSManagerHandlerConfiguration *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v2 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v2, "setHandle:", *(_QWORD *)(a1 + 32));
  v3 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v2, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_2;
  v8[3] = &unk_1E2AC56D0;
  v5 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v10 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v12 = v7;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v2, v8);

}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  _QWORD v20[2];
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD block[4];
  id v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v27 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v27);
  v10 = v27;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E2AC56A8;
    v13 = (id *)v20;
    v20[0] = *(id *)(a1 + 40);
    v14 = (id *)v23;
    v15 = *(id *)(a1 + 48);
    v20[1] = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 64);
    v23[0] = v15;
    v23[1] = v16;
    v21 = v5;
    v22 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA18;
    v13 = &v26;
    v26 = v17;
    v14 = &v25;
    v25 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  PKProtobufRemoteRegistrationRequestResult *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  PKProtobufRemoteRegistrationRequestResult *v12;
  id v13;
  uint8_t buf[4];
  PKProtobufRemoteRegistrationRequestResult *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(PKProtobufRemoteRegistrationRequestResult);
    -[PKProtobufRemoteRegistrationRequestResult setResult:](v4, "setResult:", *(unsigned int *)(a1 + 72));
    v5 = objc_alloc(MEMORY[0x1E0D34E08]);
    -[PKProtobufRemoteRegistrationRequestResult data](v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithProtobufData:type:isResponse:", v6, 13, 1);

    objc_msgSend(*(id *)(a1 + 40), "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", v7, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 32));
    v4 = (PKProtobufRemoteRegistrationRequestResult *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 64);
    if (v9)
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_37;
      block[3] = &unk_1E2ABDA18;
      v13 = v9;
      v12 = v4;
      dispatch_async(v10, block);

    }
  }

}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_37(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKSharingIDSManagerHandlerConfiguration *v8;
  uint64_t v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
      -[PKSharingIDSManagerHandlerConfiguration setHandle:](v8, "setHandle:", v6);
      v9 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v8, "sharingGroup");
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke;
      v12[3] = &unk_1E2AC5798;
      v12[4] = self;
      v15 = v9;
      v14 = v7;
      v13 = v6;
      objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v8, v12);

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[PKSharingIDSManager sendDeviceSharingCapabilitiesRequestForHandle:completion:]";
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error: cannot check apple cash capability for a nil receipient handle %s", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  _QWORD v20[2];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v27 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v27);
  v10 = v27;
  if (!v10 && (v9 & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3;
    v19[3] = &unk_1E2AC5770;
    v13 = (id *)v20;
    v20[0] = *(id *)(a1 + 40);
    v14 = &v23;
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 32);
    v23 = v15;
    v20[1] = v16;
    v21 = v5;
    v22 = v6;
    objc_msgSend(v11, "_sharingDestinationForHandles:completion:", v12, v19);

LABEL_6:
    goto LABEL_7;
  }
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2;
    block[3] = &unk_1E2ABDA18;
    v13 = &v26;
    v26 = v17;
    v14 = &v25;
    v25 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  __int128 *v24;
  _QWORD v25[4];
  NSObject *v26;
  __int128 *p_buf;
  _QWORD v28[4];
  id v29;
  id v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  id v35;
  id v36;
  void *v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "idsDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__15;
    v41 = __Block_byref_object_dispose__15;
    v42 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_42;
    v28[3] = &unk_1E2AC56F8;
    v29 = v5;
    v32 = v33;
    v30 = *(id *)(a1 + 48);
    v10 = v6;
    v31 = v10;
    objc_msgSend(v7, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v8, CFSTR("com.apple.private.alloy.applepay.sharing"), CFSTR("com.apple.private.alloy.applepay.sharing"), v9, v28);

    dispatch_group_enter(v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34E08]), "initWithProtobufData:type:isResponse:", 0, 14, 0);
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_44;
    v25[3] = &unk_1E2AC5720;
    p_buf = &buf;
    v15 = v10;
    v26 = v15;
    objc_msgSend(v12, "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", v11, v3, v13, v14, v25);
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2_46;
    block[3] = &unk_1E2AC5748;
    v22 = *(id *)(a1 + 64);
    v23 = v33;
    v24 = &buf;
    dispatch_group_notify(v15, v16, block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No IDS destination defined for handle %@. Cannot send message."), *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }

    v19 = *(void **)(a1 + 64);
    if (v19)
    {
      v20 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_39;
      v34[3] = &unk_1E2ABDA18;
      v36 = v19;
      v35 = v17;
      dispatch_async(v20, v34);

    }
  }

}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_39(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v5);

}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "count");
  PKLogFacilityTypeGetObject(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v7 = 138412546;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Family member %@ has %ld possible devices", (uint8_t *)&v7, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2_46(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_cloudStoreZoneShareInvitationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufCloudStoreZoneInvitationRequest *v11;
  void *v12;
  PKProtobufCloudStoreZoneInvitationRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26;

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufCloudStoreZoneInvitationRequest initWithData:](v11, "initWithData:", v12);
  -[PKProtobufCloudStoreZoneInvitationRequest invitation](v13, "invitation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:](PKCloudStoreZoneInvitation, "cloudStoreZoneInvitationWithProtobuf:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKCloudStoreZoneInvitationRequest invitationErrorWithProtobuf:](PKCloudStoreZoneInvitationRequest, "invitationErrorWithProtobuf:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _handlerConfigurationForInvitation:forHandle:](self, "_handlerConfigurationForInvitation:forHandle:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke;
  v23[3] = &unk_1E2AC57C0;
  v23[4] = self;
  v24 = v15;
  v25 = v16;
  v26 = v19;
  v21 = v16;
  v22 = v15;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v18, v23);

}

void __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v17 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v17);
  v9 = v17;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_49;
    block[3] = &unk_1E2AC0F90;
    block[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

  }
}

void __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_49(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    v24 = v4;
    v25 = 2112;
    v26 = v2;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud zone invitiation: %@, from destination %@, with error %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_50;
        v14[3] = &unk_1E2AC0F90;
        v14[4] = v12;
        v15 = *(id *)(a1 + 48);
        v16 = *(id *)(a1 + 56);
        v17 = v2;
        dispatch_async(v13, v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

uint64_t __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveCloudStoreZoneInvitation:invitationError:fromDestination:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)_cloudStoreZoneShareInvitationRequestRemoved:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufCloudStoreZoneInvitationRequest *v11;
  void *v12;
  PKProtobufCloudStoreZoneInvitationRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufCloudStoreZoneInvitationRequest initWithData:](v11, "initWithData:", v12);
  -[PKProtobufCloudStoreZoneInvitationRequest invitation](v13, "invitation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:](PKCloudStoreZoneInvitation, "cloudStoreZoneInvitationWithProtobuf:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _handlerConfigurationForInvitation:forHandle:](self, "_handlerConfigurationForInvitation:forHandle:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E2AC57E8;
  v22 = v15;
  v23 = v18;
  v21[4] = self;
  v20 = v15;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v17, v21);

}

void __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v16 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v16);
  v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_53;
    v13[3] = &unk_1E2ABE0F8;
    v13[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);

  }
}

void __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_53(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removed from cloud zone share: %@, from destination %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_54;
        block[3] = &unk_1E2ABE0F8;
        block[4] = v11;
        v14 = *(id *)(a1 + 48);
        v15 = v2;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "removedFromCloudStoreZoneInvitation:fromDestination:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_cloudStoreZoneShareInvitationResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufCloudStoreZoneInvitationResponse *v11;
  void *v12;
  PKProtobufCloudStoreZoneInvitationResponse *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufCloudStoreZoneInvitationResponse alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufCloudStoreZoneInvitationResponse initWithData:](v11, "initWithData:", v12);
  +[PKCloudStoreZoneInvitationResponse cloudStoreZoneInvitationResponseWithProtobuf:](PKCloudStoreZoneInvitationResponse, "cloudStoreZoneInvitationResponseWithProtobuf:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "invitation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingIDSManager _handlerConfigurationForInvitation:forHandle:](self, "_handlerConfigurationForInvitation:forHandle:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E2AC57E8;
  v22 = v14;
  v23 = v18;
  v21[4] = self;
  v20 = v14;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v17, v21);

}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v16 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v16);
  v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_59;
    v13[3] = &unk_1E2ABE0F8;
    v13[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);

  }
}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_59(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Cloud zone invitation response received: %@, from destination %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_60;
        block[3] = &unk_1E2ABE0F8;
        block[4] = v11;
        v14 = *(id *)(a1 + 48);
        v15 = v2;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_60(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = objc_msgSend(*(id *)(a1 + 40), "status");
    objc_msgSend(*(id *)(a1 + 40), "invitation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didReceiveCloudStoreZoneInvitationStatus:forInvitation:fromDestination:", v3, v4, *(_QWORD *)(a1 + 48));

  }
}

- (void)_cloudStoreZoneShareInvitationRequestInvitationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufCloudStoreZoneInvitationRequest *v11;
  void *v12;
  PKProtobufCloudStoreZoneInvitationRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufCloudStoreZoneInvitationRequest initWithData:](v11, "initWithData:", v12);
  -[PKProtobufCloudStoreZoneInvitationRequest invitation](v13, "invitation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:](PKCloudStoreZoneInvitation, "cloudStoreZoneInvitationWithProtobuf:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingIDSManager _handlerConfigurationForInvitation:forHandle:](self, "_handlerConfigurationForInvitation:forHandle:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E2AC57E8;
  v22 = v15;
  v23 = v18;
  v21[4] = self;
  v20 = v15;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v17, v21);

}

void __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v16 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v16);
  v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_63;
    v13[3] = &unk_1E2ABE0F8;
    v13[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);

  }
}

void __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_63(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Received request to share invitation data: %@, from destination %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_64;
        block[3] = &unk_1E2ABE0F8;
        block[4] = v11;
        v14 = *(id *)(a1 + 48);
        v15 = v2;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_64(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didRequestCloudStoreZoneInvitationData:fromDestination:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_remoteRegistrationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufRemoteRegistrationRequest *v11;
  void *v12;
  PKProtobufRemoteRegistrationRequest *v13;
  void *v14;
  void *v15;
  PKSharingIDSManagerHandlerConfiguration *v16;
  uint64_t v17;
  id WeakRetained;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufRemoteRegistrationRequest alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufRemoteRegistrationRequest initWithData:](v11, "initWithData:", v12);
  +[PKRemoteRegistrationRequest remoteRegistrationRequestWithProtobuf:](PKRemoteRegistrationRequest, "remoteRegistrationRequestWithProtobuf:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v16, "setHandle:", v15);
  v17 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v16, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke;
  v20[3] = &unk_1E2AC57E8;
  v21 = v14;
  v22 = v17;
  v20[4] = self;
  v19 = v14;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v16, v20);

}

void __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v16 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v16);
  v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_69;
    v13[3] = &unk_1E2ABE0F8;
    v13[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);

  }
}

void __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_69(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Received request to register: %@, from destination %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_70;
        block[3] = &unk_1E2ABE0F8;
        block[4] = v11;
        v14 = *(id *)(a1 + 48);
        v15 = v2;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didRequestToRegister:fromDestination:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_remoteRegistrationRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  PKProtobufRemoteRegistrationRequestResult *v11;
  void *v12;
  PKProtobufRemoteRegistrationRequestResult *v13;
  uint64_t v14;
  void *v15;
  PKSharingIDSManagerHandlerConfiguration *v16;
  uint64_t v17;
  id WeakRetained;
  _QWORD v19[7];

  v9 = a6;
  v10 = a3;
  v11 = [PKProtobufRemoteRegistrationRequestResult alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKProtobufRemoteRegistrationRequestResult initWithData:](v11, "initWithData:", v12);
  v14 = -[PKProtobufRemoteRegistrationRequestResult result](v13, "result");
  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v16, "setHandle:", v15);
  v17 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v16, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke;
  v19[3] = &unk_1E2AC5838;
  v19[4] = self;
  v19[5] = v17;
  v19[6] = v14;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v16, v19);

}

void __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v18 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v18);
  v9 = v18;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = a1[4];
    v11 = *(NSObject **)(v10 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_73;
    v15[3] = &unk_1E2AC5810;
    v15[4] = v10;
    v12 = v5;
    v13 = a1[6];
    v16 = v12;
    v17 = v13;
    dispatch_async(v11, v15);

  }
}

void __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_73(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    PKDeviceRegistrationResultToString(*(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v4;
    v24 = 2112;
    v25 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Remote registration request result received: %@, from destination %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_74;
        block[3] = &unk_1E2AC5810;
        v13 = *(_QWORD *)(a1 + 48);
        block[4] = v11;
        v16 = v13;
        v15 = v2;
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

uint64_t __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_74(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveRemoteRegistationResult:fromDestination:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_deviceSharingCapabiltiesRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v8;
  PKSharingIDSManagerHandlerConfiguration *v9;
  uint64_t v10;
  id WeakRetained;
  _QWORD v12[6];

  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", a6, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v9, "setHandle:", v8);
  v10 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v9, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke;
  v12[3] = &unk_1E2AC5888;
  v12[4] = self;
  v12[5] = v10;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v9, v12);

}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  v9 = objc_msgSend(v7, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v8, v5, v6, &v21);
  v10 = v21;
  PKLogFacilityTypeGetObject(9uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 || (v9 & 1) == 0)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Received request to provided apple cash sharing capabilities from destination %@", buf, 0xCu);
    }

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allHandles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_77;
    v17[3] = &unk_1E2AC5860;
    v15 = v6;
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    v20 = v5;
    objc_msgSend(v13, "_sharingDestinationForHandles:completion:", v14, v17);

    v11 = v18;
  }

}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  PKDeviceSharingCapabilities *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  PKDeviceSharingCapabilities *v15;
  _QWORD block[4];
  PKDeviceSharingCapabilities *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  PKDeviceSharingCapabilities *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(PKDeviceSharingCapabilities);
  objc_msgSend(*(id *)(a1 + 32), "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setHandle:](v4, "setHandle:", v6);

  objc_msgSend(v5, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setAltDSID:](v4, "setAltDSID:", v7);

  -[PKDeviceSharingCapabilities setSupportsManatee:](v4, "setSupportsManatee:", PKSupportsManateeForAppleCashForIDS());
  PKCurrentRegion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setDeviceRegion:](v4, "setDeviceRegion:", v8);

  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeviceSharingCapabilities setFromDeviceVersion:](v4, "setFromDeviceVersion:", v9);

  PKLogFacilityTypeGetObject(9uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Sending apple cash sharing capabilities %@", buf, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_80;
  block[3] = &unk_1E2AC0F68;
  block[1] = 3221225472;
  v17 = v4;
  v18 = v11;
  v19 = v3;
  v20 = v12;
  v21 = *(id *)(a1 + 32);
  v14 = v3;
  v15 = v4;
  dispatch_async(v13, block);

}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_80(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D34E08]);
  objc_msgSend(v5, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProtobufData:type:isResponse:", v3, 14, 1);

  objc_msgSend(*(id *)(a1 + 40), "_sendMessageWithProtobuf:destination:handleUserDetails:currentUserDetails:completion:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);
}

- (void)_deviceSharingCapabilitiesRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  PKProtobufDeviceSharingCapabilities *v11;
  void *v12;
  void *v13;
  PKSharingIDSManagerHandlerConfiguration *v14;
  uint64_t v15;
  id WeakRetained;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;

  v9 = a6;
  objc_msgSend(a3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[PKProtobufDeviceSharingCapabilities initWithData:]([PKProtobufDeviceSharingCapabilities alloc], "initWithData:", v10);
    +[PKDeviceSharingCapabilities deviceSharingCapbilitesRequestWithProtobuf:](PKDeviceSharingCapabilities, "deviceSharingCapbilitesRequestWithProtobuf:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", 1);
  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v14, "setHandle:", v13);
  v15 = -[PKSharingIDSManagerHandlerConfiguration sharingGroup](v14, "sharingGroup");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke;
  v19[3] = &unk_1E2AC57C0;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v22 = v15;
  v17 = v13;
  v18 = v12;
  objc_msgSend(WeakRetained, "handlerDetailsForConfiguration:completion:", v14, v19);

}

void __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v17 = 0;
  v8 = objc_msgSend(v6, "_canPerformIDSMessageForSharingGroup:handleUserDetails:currentUserDetails:error:", v7, v5, a3, &v17);
  v9 = v17;
  if (v9 || (v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_82;
    block[3] = &unk_1E2AC0F90;
    block[4] = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

  }
}

void __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_82(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDSharingDestination:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Device sharing capabilities received: %@, from destination %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_83;
        block[3] = &unk_1E2ABE0F8;
        block[4] = v11;
        v14 = *(id *)(a1 + 48);
        v15 = *(id *)(a1 + 56);
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didReceiveDeviceSharingCapabilities:forHandle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (NSArray)delegates
{
  os_unfair_lock_s *p_delegatesLock;
  void *v4;
  void *v5;

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_delegatesLock);
  return (NSArray *)v5;
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  p_delegatesLock = &self->_delegatesLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_unlock(p_delegatesLock);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  PKLogFacilityTypeGetObject(9uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = a6;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "IDS Service has delivered message: %@, context: %@", (uint8_t *)&v10, 0x16u);
  }

  -[PKSharingIDSManager _queue_callCompletionHandlerForIdentifier:withError:](self, "_queue_callCompletionHandlerForIdentifier:withError:", v8, 0);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(9uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136316418;
    v14 = "-[PKSharingIDSManager service:account:incomingUnhandledProtobuf:fromID:context:]";
    v15 = 2112;
    v16 = a3;
    v17 = 2112;
    v18 = a4;
    v19 = 2112;
    v20 = a5;
    v21 = 2112;
    v22 = a6;
    v23 = 2112;
    v24 = a7;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %@ %@", (uint8_t *)&v13, 0x3Eu);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  char *v14;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (char *)a5;
  v15 = a7;
  PKLogFacilityTypeGetObject(9uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136316418;
    v18 = "-[PKSharingIDSManager service:account:identifier:didSendWithSuccess:error:]";
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 1024;
    v26 = v8;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %d %@", (uint8_t *)&v17, 0x3Au);
  }

  if (!v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to send with success: %@", (uint8_t *)&v17, 0xCu);
    }

    -[PKSharingIDSManager _queue_callCompletionHandlerForIdentifier:withError:](self, "_queue_callCompletionHandlerForIdentifier:withError:", v14, v15);
  }

}

- (id)_handlerConfigurationForInvitation:(id)a3 forHandle:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PKSharingIDSManagerHandlerConfiguration *v12;
  id v14;
  id v15;
  uint64_t v16;

  v16 = 0;
  v5 = a4;
  objc_msgSend(a3, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:](PKCloudStoreZone, "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:", v6, &v16, &v15, &v14);
  v7 = v15;
  v8 = v14;

  v9 = 0;
  v10 = 0;
  v11 = v16 - 2;
  if ((unint64_t)(v16 - 2) <= 4)
  {
    v9 = qword_190453D78[v11];
    v10 = qword_190453DA0[v11];
  }
  v12 = -[PKSharingIDSManagerHandlerConfiguration initWithSharingGroup:]([PKSharingIDSManagerHandlerConfiguration alloc], "initWithSharingGroup:", v10);
  -[PKSharingIDSManagerHandlerConfiguration setAccountIdentifier:](v12, "setAccountIdentifier:", v7);

  -[PKSharingIDSManagerHandlerConfiguration setHandle:](v12, "setHandle:", v5);
  -[PKSharingIDSManagerHandlerConfiguration setAccessLevel:](v12, "setAccessLevel:", v9);

  return v12;
}

- (BOOL)_canPerformIDSMessageForSharingGroup:(unint64_t)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = CFSTR("Error: cannot send IDS message because for an unknown account type");
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    objc_msgSend(v9, "accountUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: cannot send IDS message because %@ does not have an account user defined"), v9);
      goto LABEL_16;
    }
    objc_msgSend(v10, "accountUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_10:
      v17 = 0;
      v18 = 1;
      goto LABEL_19;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    v23 = v10;
    v14 = CFSTR("Error: cannot send IDS message because the current user %@ does not have an account user defined");
LABEL_15:
    objc_msgSend(v13, "stringWithFormat:", v14, v23);
    goto LABEL_16;
  }
  if (a3 != 1)
  {
    v18 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v9, "familyMember");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: cannot send IDS message because %@ is not in the family circle"), v9);
    goto LABEL_16;
  }
  objc_msgSend(v10, "familyMember");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: cannot send IDS message because the current user %@ is not in the family circle"), v10);
LABEL_16:
  v19 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v19;
  v18 = 0;
  if (a6 && v19)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)_sendMessageWithProtobuf:(id)a3 destination:(id)a4 handleUserDetails:(id)a5 currentUserDetails:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[PKIDSService underlyingService](self->_service, "underlyingService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iCloudAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isActive") & 1) != 0)
  {
    v43 = v14;
    v17 = v12;
    v18 = v11;
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v16, "registeredURIs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke;
    v47[3] = &unk_1E2AC58B0;
    v47[4] = self;
    objc_msgSend(v21, "pk_setByApplyingBlock:", v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "primaryAppleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v23;
    if (objc_msgSend(v22, "count") && !objc_msgSend(v22, "containsObject:", v23)
      || (v24 = v23) == 0)
    {
      objc_msgSend(v13, "aliases");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");
      objc_msgSend(v26, "intersectSet:", v22);
      PKLogFacilityTypeGetObject(9uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v51 = v25;
        v52 = 2112;
        v53 = v22;
        v54 = 2112;
        v55 = v26;
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "The family member appleID is not in the list of registeredURIs with IDS. Checking the family members aliases %@ against the IDS registeredURIs %@. The overlapping appleIDs are %@", buf, 0x20u);
      }

      objc_msgSend(v26, "anyObject");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    v41 = v22;
    -[PKSharingIDSManager _idsIDForHandle:](self, "_idsIDForHandle:", v24);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v44 = v13;
    v42 = v16;
    if (v28)
    {
      v48 = *MEMORY[0x1E0D34178];
      v49 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(9uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v29;
        v52 = 2112;
        v53 = v11;
        _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Using IDS fromID as %@ for request protobuf %@", buf, 0x16u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(9uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = 0;
        v52 = 2112;
        v53 = v11;
        _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Not defining IDS fromID as %@ for request protobuf %@", buf, 0x16u);
      }
      v30 = 0;
    }

    -[PKIDSService underlyingService](self->_service, "underlyingService");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0C99E60];
    v12 = v17;
    objc_msgSend(v17, "idsDestination");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithObject:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_102;
    v45[3] = &unk_1E2ABE828;
    v14 = v43;
    v45[4] = self;
    v46 = v43;
    PKProtobufSendWithOptions(v36, v18, v39, 300, 0, 0, 1, v45, v30);

    v11 = v18;
    v13 = v44;
    v16 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: cannot sent IDS message since the Apple Account is not active %@"), v16);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(9uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v24;
      _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v14)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      v57[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v14 + 2))(v14, v35);

    }
  }

}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sanitizedHandleWithFromID:", a2);
}

void __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_source_t v9;
  dispatch_time_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD handler[4];
  id v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  NSObject *v29;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_2;
      block[3] = &unk_1E2ABDA18;
      v29 = v7;
      v28 = v6;
      dispatch_async(v8, block);

      v9 = v29;
LABEL_7:

      goto LABEL_8;
    }
  }
  if (v5 && *(_QWORD *)(a1 + 40))
  {
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
    v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v11 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_3;
    handler[3] = &unk_1E2ABE0D0;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v25 = v12;
    v26 = v13;
    dispatch_source_set_event_handler(v9, handler);
    v18 = v11;
    v19 = 3221225472;
    v20 = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_103;
    v21 = &unk_1E2ABE0D0;
    v22 = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v23 = v14;
    dispatch_source_set_cancel_handler(v9, &v18);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy", v18, v19, v20, v21, v22);
    v17 = _Block_copy(v16);
    objc_msgSend(v15, "setObject:forKey:", v17, v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v9, v14);
    dispatch_resume(v9);

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKSharingIDSManager request timer has fired for %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = a1 + 32;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v6 + 8);
  objc_msgSend(v5, "_timeoutErrorForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_queue_callCompletionHandlerForIdentifier:withError:", v4, v7);

}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_103(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_callCompletionHandlerForIdentifier:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to call completion block for %@ with error %@", buf, 0x16u);
    }

    -[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_completionTimers, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      dispatch_source_cancel(v10);
      -[NSMutableDictionary removeObjectForKey:](self->_completionTimers, "removeObjectForKey:", v6);
    }
    if (v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v6);
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PKSharingIDSManager__queue_callCompletionHandlerForIdentifier_withError___block_invoke;
      block[3] = &unk_1E2ABE030;
      v14 = v6;
      v15 = v7;
      v16 = v9;
      dispatch_async(callbackQueue, block);

    }
  }

}

uint64_t __75__PKSharingIDSManager__queue_callCompletionHandlerForIdentifier_withError___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(9uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Calling completion block for %@ with error %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_timeoutErrorForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDS request timed out for identifier %@"), a3, *MEMORY[0x1E0CB2D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -8000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_registerListeners
{
  -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:](self->_service, "setProtobufAction:target:forIncomingRequestsOfType:queue:", sel__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context_, self, 10, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:](self->_service, "setProtobufAction:target:forIncomingRequestsOfType:queue:", sel__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context_, self, 11, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:](self->_service, "setProtobufAction:target:forIncomingRequestsOfType:queue:", sel__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context_, self, 12, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:](self->_service, "setProtobufAction:target:forIncomingRequestsOfType:queue:", sel__remoteRegistrationRequestReceived_service_account_fromID_context_, self, 13, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:](self->_service, "setProtobufAction:target:forIncomingRequestsOfType:queue:", sel__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context_, self, 14, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingResponsesOfType:queue:](self->_service, "setProtobufAction:target:forIncomingResponsesOfType:queue:", sel__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context_, self, 10, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingResponsesOfType:queue:](self->_service, "setProtobufAction:target:forIncomingResponsesOfType:queue:", sel__remoteRegistrationRequestResultReceived_service_account_fromID_context_, self, 13, self->_internalQueue);
  -[PKIDSService setProtobufAction:target:forIncomingResponsesOfType:queue:](self->_service, "setProtobufAction:target:forIncomingResponsesOfType:queue:", sel__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context_, self, 14, self->_internalQueue);
}

- (id)_sanitizedHandleWithFromID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)IDSCopyAddressDestinationForDestination();
  -[PKSharingIDSManager _sanitizedHande:](self, "_sanitizedHande:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sanitizedHande:(id)a3
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = CFSTR("mailto:");
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("mailto:")) & 1) != 0
    || (v4 = CFSTR("tel:"), objc_msgSend(v3, "hasPrefix:", CFSTR("tel:"))))
  {
    v5 = objc_msgSend(v3, "rangeOfString:", v4);
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v4, &stru_1E2ADF4C0, 0, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  return v3;
}

- (id)_idsIDForHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "_appearsToBeEmail"))
  {
    v4 = _IDSCopyIDForEmailAddress();
  }
  else
  {
    if (!objc_msgSend(v3, "_appearsToBePhoneNumber"))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = _IDSCopyIDForPhoneNumberWithOptions();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (id)_primaryAppleIDSharingDestination:(id)a3
{
  void *v4;
  void *v5;
  PKSharingDestination *v6;

  objc_msgSend(a3, "primaryAppleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKSharingIDSManager _idsIDForHandle:](self, "_idsIDForHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[PKSharingDestination initWithDestinationIdentifier:]([PKSharingDestination alloc], "initWithDestinationIdentifier:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_sharingDestinationForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKSharingIDSManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke;
  block[3] = &unk_1E2ABDA68;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  PKAsyncUnaryOperationComposer *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[5];
  id v21;
  uint8_t *v22;
  _QWORD v23[6];
  id v24;
  uint8_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      PKLogFacilityTypeGetObject(9uLL);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Cannot get sharing handle for undefined handles", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_126;
    v40[3] = &unk_1E2AC58B0;
    v3 = *(void **)(a1 + 32);
    v40[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "pk_arrayByApplyingBlock:", v40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v37 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(a1 + 40), "_idsIDForHandle:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          v8 = (PKAsyncUnaryOperationComposer *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            v10 = obj;
            goto LABEL_23;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__15;
    v34 = __Block_byref_object_dispose__15;
    v35 = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = obj;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2;
          v23[3] = &unk_1E2AC5900;
          v23[4] = *(_QWORD *)(a1 + 40);
          v23[5] = v15;
          v24 = v10;
          v25 = buf;
          -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v23);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_132;
    v20[3] = &unk_1E2AC5950;
    v17 = *(void **)(a1 + 48);
    v20[4] = *(_QWORD *)(a1 + 40);
    v22 = buf;
    v21 = v17;
    v18 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v16, v20);

    _Block_object_dispose(buf, 8);
LABEL_23:

  }
}

uint64_t __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_126(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sanitizedHande:", a2);
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_idsIDForHandle:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(9uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Checking IDS status for %@", buf, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_128;
  v17[3] = &unk_1E2AC58D8;
  v13 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v20 = v7;
  v21 = v12;
  v17[4] = v10;
  v18 = v8;
  v19 = v6;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  objc_msgSend(v13, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v16, CFSTR("com.apple.private.alloy.applepay.sharing"), CFSTR("com.apple.private.alloy.applepay.sharing"), v11, v17);

}

uint64_t __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_128(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v2 = result;
  v12 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(v2 + 32);
      v10 = 138412290;
      v11 = v7;
      v8 = "IDS status for %@ is unknown";
LABEL_11:
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
LABEL_12:

    v5 = *(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 16);
    return v5();
  }
  if (a2 == 2)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(v2 + 32);
      v10 = 138412290;
      v11 = v9;
      v8 = "IDS status for %@ is invalid";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a2 != 1)
    return result;
  PKLogFacilityTypeGetObject(9uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(v2 + 32);
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "IDS status for %@ is valid", (uint8_t *)&v10, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 40), *(id *)(v2 + 40));
  v5 = *(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 16);
  return v5();
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_132(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2_133;
  block[3] = &unk_1E2AC5928;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2_133(_QWORD *a1)
{
  NSObject *v2;
  PKSharingDestination *v3;
  uint8_t buf[16];

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v3 = -[PKSharingDestination initWithDestinationIdentifier:]([PKSharingDestination alloc], "initWithDestinationIdentifier:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKey:", v3, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    PKLogFacilityTypeGetObject(9uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "There is no handle registered with IDS to send a message", buf, 2u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (PKSharingIDSManagerDataSource)dataSource
{
  return (PKSharingIDSManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_completionTimers, 0);
  objc_storeStrong((id *)&self->_sharingDestinations, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
