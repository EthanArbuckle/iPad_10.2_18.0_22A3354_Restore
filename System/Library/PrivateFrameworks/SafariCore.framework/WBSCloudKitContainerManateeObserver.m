@implementation WBSCloudKitContainerManateeObserver

- (WBSCloudKitContainerManateeObserver)initWithContainerIdentifier:(id)a3 appleAccountInformationProvider:(id)a4
{
  id v6;
  id v7;
  WBSCloudKitContainerManateeObserver *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSString *containerIdentifier;
  uint64_t v17;
  NSMutableArray *stateDeterminationCompletionBlocks;
  uint64_t v19;
  CKContainer *container;
  void *v21;
  WBSCloudKitContainerManateeObserver *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WBSCloudKitContainerManateeObserver;
  v8 = -[WBSCloudKitContainerManateeObserver init](&v24, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v11, v8);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v6, "copy");
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    stateDeterminationCompletionBlocks = v8->_stateDeterminationCompletionBlocks;
    v8->_stateDeterminationCompletionBlocks = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v8->_appleAccountInformationProvider, a4);
    if (NSClassFromString(CFSTR("CKContainer")))
    {
      objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", v8->_containerIdentifier);
      v19 = objc_claimAutoreleasedReturnValue();
      container = v8->_container;
      v8->_container = (CKContainer *)v19;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__accountChanged_, *MEMORY[0x1E0C94690], 0);

    }
    v22 = v8;
  }

  return v8;
}

- (void)setStateChangeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__WBSCloudKitContainerManateeObserver_setStateChangeObserver___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__WBSCloudKitContainerManateeObserver_setStateChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (id)stateChangeObserver
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__WBSCloudKitContainerManateeObserver_stateChangeObserver__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__WBSCloudKitContainerManateeObserver_stateChangeObserver__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_accountChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke(uint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(_OWORD **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke_2;
  v4[3] = &unk_1E649BA38;
  v2 = v1[2];
  v4[4] = v1;
  v5 = v2;
  return objc_msgSend(v1, "_determineAccountStateWithCompletion:", v4);
}

uint64_t __55__WBSCloudKitContainerManateeObserver__accountChanged___block_invoke_2(uint64_t result)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(result + 32);
  if (*(_QWORD *)(result + 40) != v1[4] || *(_QWORD *)(result + 48) != v1[5])
  {
    result = v1[6];
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_determineAccountStateWithCompletion:(id)a3
{
  NSMutableArray *stateDeterminationCompletionBlocks;
  void *v5;
  CKContainer *container;
  _QWORD v7[5];

  stateDeterminationCompletionBlocks = self->_stateDeterminationCompletionBlocks;
  v5 = _Block_copy(a3);
  -[NSMutableArray addObject:](stateDeterminationCompletionBlocks, "addObject:", v5);

  if (!self->_determiningManateeState)
  {
    self->_determiningManateeState = 1;
    container = self->_container;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke;
    v7[3] = &unk_1E649BAB0;
    v7[4] = self;
    -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v7);
  }
}

void __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _QWORD aBlock[5];
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E649BA60;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v19 = v8;
  v9 = _Block_copy(aBlock);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_3;
  block[3] = &unk_1E649BA88;
  v16 = v5;
  v17 = v9;
  v15 = v8;
  v11 = v5;
  v12 = v9;
  v13 = v8;
  dispatch_async(v10, block);

}

void __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = a3;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

uint64_t __76__WBSCloudKitContainerManateeObserver__determineAccountStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, _QWORD);
  uint64_t v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16);
    v4 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "supportsDeviceToDeviceEncryption"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16);
    v4 = 2;
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "deviceToDeviceEncryptionAvailability") & 2) != 0)
      v4 = 2;
    else
      v4 = 1;
    v3 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16);
    v2 = *(_QWORD *)(a1 + 48);
  }
  return v3(v2, v4, 0);
}

- (void)determineAccountStateWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSCloudKitContainerManateeObserver_determineAccountStateWithCompletion___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __75__WBSCloudKitContainerManateeObserver_determineAccountStateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineAccountStateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_appleAccountInformationProvider, 0);
  objc_storeStrong((id *)&self->_stateDeterminationCompletionBlocks, 0);
  objc_storeStrong(&self->_stateChangeObserver, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
