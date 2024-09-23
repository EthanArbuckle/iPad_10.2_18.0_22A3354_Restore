@implementation ICMusicSubscriptionFairPlayController

- (id)_init
{
  ICMusicSubscriptionFairPlayController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *fairPlaySerialQueue;
  uint64_t v7;
  NSMutableDictionary *subscriptionKeyBagStatusCache;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionFairPlayController;
  v2 = -[ICMusicSubscriptionFairPlayController init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionFairPlayController.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionFairPlayController.fairPlaySerialQueue", 0);
    fairPlaySerialQueue = v2->_fairPlaySerialQueue;
    v2->_fairPlaySerialQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    subscriptionKeyBagStatusCache = v2->_subscriptionKeyBagStatusCache;
    v2->_subscriptionKeyBagStatusCache = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification_, CFSTR("com.apple.itunescloud.ICMusicSubscriptionFairPlayKeyStatusDidChangeNotification"), 0);

    -[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:](v2, "getKeyStatusListWithCompletionHandler:", &__block_literal_global_11_34644);
  }
  return v2;
}

- (id)getKeyStatusForAccountUniqueIdentifier:(unint64_t)a3 error:(id *)a4
{
  NSObject *fairPlaySerialQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__34635;
  v14[4] = __Block_byref_object_dispose__34636;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__34635;
  v12 = __Block_byref_object_dispose__34636;
  v13 = 0;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ICMusicSubscriptionFairPlayController_getKeyStatusForAccountUniqueIdentifier_error___block_invoke;
  block[3] = &unk_1E4390E30;
  block[5] = &v8;
  block[6] = a3;
  block[4] = v14;
  dispatch_sync(fairPlaySerialQueue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  return v5;
}

- (void)getKeyStatusListWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *fairPlaySerialQueue;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4390EF8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(fairPlaySerialQueue, v7);

}

- (void)importSubscriptionKeyBagData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *fairPlaySerialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(fairPlaySerialQueue, block);

}

- (void)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *fairPlaySerialQueue;
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
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(fairPlaySerialQueue, v15);

}

- (void)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *fairPlaySerialQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  ICMusicSubscriptionFairPlayController *v17;
  id v18;
  unint64_t v19;
  unsigned int v20;

  v10 = a5;
  v11 = a6;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke;
  block[3] = &unk_1E4390E80;
  v20 = a4;
  v18 = v11;
  v19 = a3;
  v16 = v10;
  v17 = self;
  v13 = v11;
  v14 = v10;
  dispatch_async(fairPlaySerialQueue, block);

}

- (void)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *fairPlaySerialQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  ICMusicSubscriptionFairPlayController *v22;
  id v23;
  unint64_t v24;
  unsigned int v25;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke;
  v19[3] = &unk_1E4390ED0;
  v23 = v14;
  v24 = a3;
  v25 = a4;
  v20 = v12;
  v21 = v13;
  v22 = self;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(fairPlaySerialQueue, v19);

}

- (void)stopSubscriptionLeaseWithCompletion:(id)a3
{
  id v4;
  NSObject *fairPlaySerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fairPlaySerialQueue = self->_fairPlaySerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fairPlaySerialQueue, v7);

}

- (void)_handleSubscriptionFairPlayKeyStatusChangedDistributedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __108__ICMusicSubscriptionFairPlayController__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification___block_invoke;
  v3[3] = &unk_1E4390F20;
  v3[4] = self;
  -[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:](self, "getKeyStatusListWithCompletionHandler:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionKeyBagStatusCache, 0);
  objc_storeStrong((id *)&self->_fairPlaySerialQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __108__ICMusicSubscriptionFairPlayController__handleSubscriptionFairPlayKeyStatusChangedDistributedNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICMusicSubscriptionFairPlayKeyStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  int v13;

  v13 = 0;
  v12 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v13, &v12);
  v3 = v12;
  v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    Hbz0lOyjnO0();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke_2;
    v9[3] = &unk_1E4390EF8;
    v11 = v7;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

uint64_t __77__ICMusicSubscriptionFairPlayController_stopSubscriptionLeaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  unsigned int v21;

  v21 = 0;
  v20 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v21, &v20);
  v3 = v20;
  v4 = v3;
  if (!ContextIdentifierForFolderPath)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = 0;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v19 = 0;
  v18 = 0;
  v17 = 0;
  v16 = 0;
  PhUojZmspd(v21, *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v19, (uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = 0;
    v8 = 0;
    v4 = (void *)v6;
    goto LABEL_8;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!v18)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = *(void **)(a1 + 56);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390EA8;
    v15 = v9;
    v12 = v8;
    v13 = v7;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

uint64_t __155__ICMusicSubscriptionFairPlayController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  id v16;
  unsigned int v17;

  v17 = 0;
  v16 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v17, &v16);
  v3 = v16;
  v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    v15 = 0;
    v14 = 0;
    V3lNO(v17, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), (uint64_t)&v15, (uint64_t)&v14);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v4 = (void *)v6;
      goto LABEL_9;
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 0;
LABEL_9:
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke_2;
    block[3] = &unk_1E4390E58;
    v13 = v8;
    v11 = v7;
    v12 = v4;
    dispatch_async(v9, block);

  }
}

uint64_t __147__ICMusicSubscriptionFairPlayController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  NSObject *v18;
  id v19;
  int v20;
  uint64_t v21;
  id v22;
  int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v22 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v23, &v22);
  v3 = v22;
  v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    v21 = 0;
    v20 = 0;
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      v26 = 1024;
      v27 = v23;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:leaseInfoData:completionHandler: - Calling FairPlayImportSubscriptionResponse() - contextID: %u", buf, 0x12u);
    }

    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
    objc_msgSend(*(id *)(a1 + 48), "length");
    NY6eB6();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v7, 0);
      v8 = v4;
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[ICMusicSubscriptionFairPlayController importSubscriptionKeyBagData:leaseInfoData:completionHandler:]_block_invoke";
        v26 = 1024;
        v27 = v23;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "[Lease] - %s - FairPlayImportSubscriptionResponse() - Success - contextID: %u", buf, 0x12u);
      }

      v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v25 = v11;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData", buf, 0xCu);
      }

      v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 24);
        *(_DWORD *)buf = 138544130;
        v25 = (const char *)v12;
        v26 = 1024;
        v27 = v23;
        v28 = 1024;
        v29 = 0;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:leaseInfoData:completionHandler: - Retrieved FairPlayImportSubscriptionResponse() - contextID: %u - keyBagStatusChanged: %{BOOL}u, _subscriptionKeyBagStatusCache: %@", buf, 0x22u);
      }
    }

  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke_18;
    block[3] = &unk_1E4390E58;
    v19 = v14;
    v17 = 0;
    v18 = v4;
    dispatch_async(v15, block);

  }
}

uint64_t __102__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_leaseInfoData_completionHandler___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  uint64_t v18;
  id v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v19 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v20, &v19);
  v3 = v19;
  v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    v18 = 0;
    v17 = 0;
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v22 = v6;
      v23 = 1024;
      v24 = v20;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:completionHandler: - Calling FairPlayImportSubscriptionBag() - contextID: %u", buf, 0x12u);
    }

    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    jr3lMuU8uaAR();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v7, 0);
      v8 = v4;
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(v9 + 24);
        *(_DWORD *)buf = 138544130;
        v22 = v9;
        v23 = 1024;
        v24 = v20;
        v25 = 1024;
        v26 = 0;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - %{public}@ - importSubscriptionKeyBagData:completionHandler: - Retrieved FairPlayImportSubscriptionBag() - contextID: %u - keyBagStatusChanged: %{BOOL}u, _subscriptionKeyBagStatusCache: %@", buf, 0x22u);
      }
    }

  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke_17;
    block[3] = &unk_1E4390E58;
    v16 = v11;
    v14 = 0;
    v15 = v4;
    dispatch_async(v12, block);

  }
}

uint64_t __88__ICMusicSubscriptionFairPlayController_importSubscriptionKeyBagData_completionHandler___block_invoke_17(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke(uint64_t a1)
{
  int ContextIdentifierForFolderPath;
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_block_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  id v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v20 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v21, &v20);
  v3 = v20;
  v4 = v3;
  if (ContextIdentifierForFolderPath)
  {
    v19 = 0;
    v18 = 0;
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus() - Calling", buf, 0xCu);
    }

    NjiEJ7prRY3();
    v7 = v6;
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%s - FairPlayGetSubscriptionStatus() - Error", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v7, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[ICMusicSubscriptionFairPlayController getKeyStatusListWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus() - Success", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
    }
  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke_16;
    block[3] = &unk_1E4390E58;
    v17 = v11;
    v15 = 0;
    v16 = v4;
    v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v12, v13);

  }
}

uint64_t __79__ICMusicSubscriptionFairPlayController_getKeyStatusListWithCompletionHandler___block_invoke_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __86__ICMusicSubscriptionFairPlayController_getKeyStatusForAccountUniqueIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int ContextIdentifierForFolderPath;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;
  int v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v9, &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  if (ContextIdentifierForFolderPath)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[ICMusicSubscriptionFairPlayController getKeyStatusForAccountUniqueIdentifier:error:]_block_invoke";
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%s - FairPlayGetSubscriptionStatus()", buf, 0xCu);
    }

    NjiEJ7prRY3();
  }
  else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

+ (ICMusicSubscriptionFairPlayController)sharedController
{
  if (sharedController_sOnceToken_34650 != -1)
    dispatch_once(&sharedController_sOnceToken_34650, &__block_literal_global_34651);
  return (ICMusicSubscriptionFairPlayController *)(id)sharedController_sSharedController_34652;
}

void __57__ICMusicSubscriptionFairPlayController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICMusicSubscriptionFairPlayController _init]([ICMusicSubscriptionFairPlayController alloc], "_init");
  v1 = (void *)sharedController_sSharedController_34652;
  sharedController_sSharedController_34652 = (uint64_t)v0;

}

@end
