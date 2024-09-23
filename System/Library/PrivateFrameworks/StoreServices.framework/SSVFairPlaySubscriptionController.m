@implementation SSVFairPlaySubscriptionController

- (SSVFairPlaySubscriptionController)init
{
  SSVFairPlaySubscriptionController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  NSObject *v5;
  uint32_t v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSVFairPlaySubscriptionController;
  v2 = -[SSVFairPlaySubscriptionController init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySubscriptionController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__SSVFairPlaySubscriptionController_init__block_invoke;
    v8[3] = &unk_1E47B9768;
    objc_copyWeak(&v9, &location);
    v6 = notify_register_dispatch("com.apple.StoreServices.SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification", &v2->_subscriptionStatusDidChangeNotifyToken, v5, v8);

    if (!v6)
      v2->_hasValidSubscriptionStatusDidChangeNotifyToken = 1;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__SSVFairPlaySubscriptionController_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      v4 = state64;
      if (v4 != getpid())
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification"), WeakRetained);

      }
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasValidSubscriptionStatusDidChangeNotifyToken)
    notify_cancel(self->_subscriptionStatusDidChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVFairPlaySubscriptionController;
  -[SSVFairPlaySubscriptionController dealloc](&v3, sel_dealloc);
}

- (void)enumerateAccountSubscriptionStatusUsingBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__SSVFairPlaySubscriptionController_enumerateAccountSubscriptionStatusUsingBlock___block_invoke;
    v6[3] = &unk_1E47BFA18;
    v6[4] = self;
    v7 = v4;
    -[SSVFairPlaySubscriptionController _enumerateSubscriptionInfoUsingBlock:](self, "_enumerateSubscriptionInfoUsingBlock:", v6);

  }
}

void __82__SSVFairPlaySubscriptionController_enumerateAccountSubscriptionStatusUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_subscriptionStatusForFPSubscriptionInfo:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = v5;
  }

}

- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__SSVFairPlaySubscriptionController_subscriptionStatusForAccountUniqueIdentifier___block_invoke;
  v5[3] = &unk_1E47BFA40;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[SSVFairPlaySubscriptionController _enumerateSubscriptionInfoUsingBlock:](self, "_enumerateSubscriptionInfoUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __82__SSVFairPlaySubscriptionController_subscriptionStatusForAccountUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2 == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_subscriptionStatusForFPSubscriptionInfo:", a2, a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (BOOL)generateSubscriptionBagRequestWithAccountUniqueIdentifier:(unint64_t)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  id v20;
  unsigned int v21;
  uint64_t v22;

  v9 = *(_QWORD *)&a4;
  v22 = 0;
  v21 = 0;
  v11 = a5;
  v12 = SSVFairPlayContextIdentifier();
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  V3lNO(v12, a3, v9, v14, v15, (uint64_t)&v22, (uint64_t)&v21);
  if (v16)
  {
    SSError((uint64_t)CFSTR("SSVFairPlayErrorDomain"), v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!a6)
      goto LABEL_4;
  }
  else
  {
    if (v21)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99D50]);
      v18 = (void *)objc_msgSend(v20, "initWithBytesNoCopy:length:deallocator:", v22, v21, &__block_literal_global_33);
    }
    else
    {
      v18 = 0;
    }
    v17 = 0;
    if (!a6)
      goto LABEL_4;
  }
  *a6 = objc_retainAutorelease(v18);
LABEL_4:
  if (a7)
    *a7 = objc_retainAutorelease(v17);

  return v17 == 0;
}

void __160__SSVFairPlaySubscriptionController_generateSubscriptionBagRequestWithAccountUniqueIdentifier_transactionType_machineIDData_returningSubscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

- (BOOL)generateSubscriptionLeaseRequestWithAccountUniqueID:(unint64_t)a3 transactionType:(unsigned int)a4 certificateData:(id)a5 assetIDData:(id)a6 returningLeaseData:(id *)a7 subscriptionBagData:(id *)a8 error:(id *)a9
{
  uint64_t v12;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;

  v12 = *(_QWORD *)&a4;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v30 = 0;
  v14 = a6;
  v15 = a5;
  v16 = SSVFairPlayContextIdentifier();
  v17 = objc_retainAutorelease(v15);
  v18 = objc_msgSend(v17, "bytes");
  v19 = objc_msgSend(v17, "length");

  v20 = objc_retainAutorelease(v14);
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_msgSend(v20, "length");

  PhUojZmspd(v16, a3, v12, v18, v19, v21, v22, (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31, (uint64_t)&v30);
  if (v23)
  {
    SSError((uint64_t)CFSTR("SSVFairPlayErrorDomain"), v23, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
  }
  else
  {
    if (v30)
    {
      v27 = objc_alloc(MEMORY[0x1E0C99D50]);
      v25 = (void *)objc_msgSend(v27, "initWithBytesNoCopy:length:deallocator:", v31, v30, &__block_literal_global_8_1);
    }
    else
    {
      v25 = 0;
    }
    if (v32)
    {
      v28 = objc_alloc(MEMORY[0x1E0C99D50]);
      v26 = (void *)objc_msgSend(v28, "initWithBytesNoCopy:length:deallocator:", v33, v32, &__block_literal_global_9);
    }
    else
    {
      v26 = 0;
    }
    v24 = 0;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v25);
  if (a7)
    *a7 = objc_retainAutorelease(v26);
  if (a9)
    *a9 = objc_retainAutorelease(v24);

  return v24 == 0;
}

void __178__SSVFairPlaySubscriptionController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_returningLeaseData_subscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

void __178__SSVFairPlaySubscriptionController_generateSubscriptionLeaseRequestWithAccountUniqueID_transactionType_certificateData_assetIDData_returningLeaseData_subscriptionBagData_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

- (BOOL)importSubscriptionKeyBagData:(id)a3 returningError:(id *)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  BOOL v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__67;
  v18 = __Block_byref_object_dispose__67;
  v19 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_returningError___block_invoke;
  block[3] = &unk_1E47BA650;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  dispatch_barrier_sync(accessQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __81__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_returningError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
  objc_msgSend(*(id *)(a1 + 32), "_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:subscriptionInfoListLength:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SSVFairPlayContextIdentifier();
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  objc_msgSend(*(id *)(a1 + 40), "length");
  jr3lMuU8uaAR();
  if (v3)
  {
    SSError((uint64_t)CFSTR("SSVFairPlayErrorDomain"), v3, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    SSVFairPlayContextIdentifier();
    NjiEJ7prRY3();
    objc_msgSend(*(id *)(a1 + 32), "_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:subscriptionInfoListLength:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 != v7 && (objc_msgSend(v2, "isEqualToDictionary:", v7) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_notifySubscriptionStatusDidChange");

  }
}

- (BOOL)importSubscriptionKeyBagData:(id)a3 leaseInfoData:(id)a4 returningError:(id *)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__67;
  v23 = __Block_byref_object_dispose__67;
  v24 = 0;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_leaseInfoData_returningError___block_invoke;
  v15[3] = &unk_1E47BFA88;
  v15[4] = self;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v18 = &v19;
  dispatch_barrier_sync(accessQueue, v15);
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v13 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __95__SSVFairPlaySubscriptionController_importSubscriptionKeyBagData_leaseInfoData_returningError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
  objc_msgSend(*(id *)(a1 + 32), "_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:subscriptionInfoListLength:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SSVFairPlayContextIdentifier();
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  objc_msgSend(*(id *)(a1 + 40), "length");
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
  objc_msgSend(*(id *)(a1 + 48), "length");
  NY6eB6();
  if (v3)
  {
    SSError((uint64_t)CFSTR("SSVFairPlayErrorDomain"), v3, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    SSVFairPlayContextIdentifier();
    NjiEJ7prRY3();
    objc_msgSend(*(id *)(a1 + 32), "_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:subscriptionInfoListLength:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 != v7 && (objc_msgSend(v2, "isEqualToDictionary:", v7) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_notifySubscriptionStatusDidChange");

  }
}

- (BOOL)stopSubscriptionLease:(id *)a3
{
  NSObject *accessQueue;
  int v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__67;
  v13 = __Block_byref_object_dispose__67;
  v14 = 0;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SSVFairPlaySubscriptionController_stopSubscriptionLease___block_invoke;
  v8[3] = &unk_1E47BFAB0;
  v8[4] = &v15;
  v8[5] = &v9;
  dispatch_barrier_sync(accessQueue, v8);
  v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v5 = *((unsigned __int8 *)v16 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __59__SSVFairPlaySubscriptionController_stopSubscriptionLease___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  SSVFairPlayContextIdentifier();
  YMQGEcsGvUj();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)_accountUniqueIdentifierToSubscriptionStatusWithFPSubscriptionInfoList:(FPSubscriptionInfo_ *)a3 subscriptionInfoListLength:(unsigned int)a4
{
  void *v5;
  int *p_var1;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v5 = 0;
    p_var1 = &a3->var1;
    v7 = a4;
    do
    {
      v8 = *((_QWORD *)p_var1 - 1);
      -[SSVFairPlaySubscriptionController _subscriptionStatusForFPSubscriptionInfo:](self, "_subscriptionStatusForFPSubscriptionInfo:", v8, *(_QWORD *)p_var1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (!v5)
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v9, v10);

      }
      p_var1 += 4;

      --v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_enumerateSubscriptionInfoUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  NSObject *accessQueue;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if (v4)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SSVFairPlaySubscriptionController__enumerateSubscriptionInfoUsingBlock___block_invoke;
    block[3] = &unk_1E47BFAB0;
    block[4] = &v18;
    block[5] = &v14;
    dispatch_sync(accessQueue, block);
    if (*((_DWORD *)v15 + 6))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = (uint64_t *)(v19[3] + v6);
        v9 = *v8;
        v10 = v8[1];
        v12 = 0;
        v4[2](v4, v9, v10, &v12);
        if (v12)
          break;
        ++v7;
        v6 += 16;
      }
      while (v7 < *((unsigned int *)v15 + 6));
    }
    v11 = v19[3];
    if (v11)
      jEHf8Xzsv8K(v11);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

}

void __74__SSVFairPlaySubscriptionController__enumerateSubscriptionInfoUsingBlock___block_invoke()
{
  SSVFairPlayContextIdentifier();
  NjiEJ7prRY3();
}

- (void)_notifySubscriptionStatusDidChange
{
  NSObject *v3;
  int subscriptionStatusDidChangeNotifyToken;
  pid_t v5;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SSVFairPlaySubscriptionController__notifySubscriptionStatusDidChange__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(v3, block);

  if (self->_hasValidSubscriptionStatusDidChangeNotifyToken)
  {
    subscriptionStatusDidChangeNotifyToken = self->_subscriptionStatusDidChangeNotifyToken;
    v5 = getpid();
    notify_set_state(subscriptionStatusDidChangeNotifyToken, v5);
  }
  notify_post("com.apple.StoreServices.SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification");
}

void __71__SSVFairPlaySubscriptionController__notifySubscriptionStatusDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVFairPlaySubscriptionControllerSubscriptionStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (id)_subscriptionStatusForFPSubscriptionInfo:(FPSubscriptionInfo_)a3
{
  _BOOL8 v3;
  _BOOL8 v4;
  SSVFairPlaySubscriptionStatus *v5;

  if ((a3.var1 - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = (a3.var1 & 0xFFFFFFFD) == 1;
    v4 = (a3.var1 & 0xFFFFFFFE) == 2;
    v5 = objc_alloc_init(SSVFairPlaySubscriptionStatus);
    -[SSVFairPlaySubscriptionStatus setHasSubscriptionLease:](v5, "setHasSubscriptionLease:", v3);
    -[SSVFairPlaySubscriptionStatus setHasSubscriptionSlot:](v5, "setHasSubscriptionSlot:", v4);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
