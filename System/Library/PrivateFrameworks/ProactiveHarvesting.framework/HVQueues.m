@implementation HVQueues

void __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (void *)WeakRetained[1];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke_2;
    v5[3] = &unk_24DD7EC28;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "runWithLockAcquired:", v5);
    WeakRetained = v4;
  }

}

void __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVQueues: informing observers and posting content available notification.", (uint8_t *)v11, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = (void *)os_transaction_create();
    v7 = *(void **)(v5 + 8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__HVQueues_informObserversThatContentIsAvailable__block_invoke;
    v11[3] = &unk_24DD7EC28;
    v12 = v6;
    v8 = v6;
    objc_msgSend(v7, "runWithLockAcquired:", v11);

  }
  v9 = objc_opt_self();
  +[HVNotifications _postNotificationWithName:](v9, "com.apple.proactive.ProactiveHarvesting.queue.contentAdded");
  v10 = (void *)v3[3];
  v3[3] = 0;

}

void __49__HVQueues_informObserversThatContentIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id obj;
  _QWORD block[5];
  id v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3[1];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v3[1], "objectForKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *((_DWORD *)v3 + 8);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __49__HVQueues_informObserversThatContentIsAvailable__block_invoke_2;
        block[3] = &unk_24DD7EC00;
        block[4] = v8;
        v15 = v11;
        v14 = *(id *)(a1 + 32);
        dispatch_async(v10, block);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

id __47__HVQueues_informObserversToDeleteWithRequest___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteContentWithRequest:error:", *(_QWORD *)(a1 + 40), 0);
  return (id)objc_opt_self();
}

void __32__HVQueues__queueForDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  HVQueue *v14;
  int8x8_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;

  v21 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[2], "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = *(_DWORD *)(a1 + 56);
    if (v7 <= 255)
    {
      if (v7 <= 15)
      {
        v8 = 16;
        switch(v7)
        {
          case 1:
          case 8:
            goto LABEL_36;
          case 2:
            v8 = 256;
            goto LABEL_36;
          case 4:
            v8 = 4;
            goto LABEL_36;
          default:
            goto LABEL_39;
        }
      }
      if (v7 > 63)
      {
        if (v7 == 64)
        {
          v8 = 16;
          goto LABEL_36;
        }
        if (v7 == 128)
        {
          v8 = 16;
          goto LABEL_36;
        }
      }
      else
      {
        if (v7 == 16)
        {
          v8 = 16;
          goto LABEL_36;
        }
        if (v7 == 32)
        {
          v8 = 16;
          goto LABEL_36;
        }
      }
      goto LABEL_39;
    }
    if (v7 > 4095)
    {
      if (v7 >= 0x4000)
      {
        if (v7 == 0x4000)
        {
          v8 = 256;
          goto LABEL_36;
        }
        if (v7 == 0x8000)
        {
          v8 = 256;
          goto LABEL_36;
        }
        goto LABEL_39;
      }
      if (v7 == 4096)
      {
        v9 = 0;
        v8 = 256;
        v10 = CFSTR("UserActivityMetadata");
      }
      else
      {
        if (v7 != 0x2000)
          goto LABEL_39;
        v9 = 0;
        v8 = 256;
        v10 = CFSTR("SearchableUserActivities");
      }
    }
    else
    {
      if (v7 <= 1023)
      {
        if (v7 == 256)
        {
          v8 = 4;
          goto LABEL_36;
        }
        if (v7 == 512)
        {
          v8 = 16;
LABEL_36:
          v11 = (void *)objc_opt_new();
          v9 = v11;
          if (v11)
          {
            objc_msgSend(v11, "identifier");
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v10)
              goto LABEL_41;
          }
          goto LABEL_40;
        }
LABEL_39:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HVQueues.m"), 259, CFSTR("HVQueue initWithDataSource given unexpected data source value: %u"), *(unsigned int *)(a1 + 56));

        v9 = 0;
        v8 = 0;
LABEL_40:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HVQueues.m"), 265, CFSTR("HVQueues failed to determine queue identifier: %u"), *(unsigned int *)(a1 + 56));

        v10 = 0;
        goto LABEL_41;
      }
      if (v7 == 1024)
      {
        v8 = 16;
        goto LABEL_36;
      }
      if (v7 != 2048)
        goto LABEL_39;
      v9 = 0;
      v8 = 256;
      v10 = CFSTR("Interactions");
    }
LABEL_41:
    v14 = [HVQueue alloc];
    HVDataSourceFileProtection(*(unsigned int *)(a1 + 56), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v17) = *(_DWORD *)(a1 + 56);
    LODWORD(v17) = HIDWORD(v17) - 1024;
    v18 = -[HVQueue initWithIdentifier:biomeStream:memoryLimit:contentProtection:contentExpectedFromMultipleApps:](v14, "initWithIdentifier:biomeStream:memoryLimit:contentProtection:contentExpectedFromMultipleApps:", v10, v9, v8, v16, ((v17 >> 10) < 8) & (0x8Bu >> (v17 >> 10)));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    objc_msgSend(v21[2], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }

}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int8x8_t v13;
  void *v14;
  int8x8_t v15;
  void *v16;
  void *v17;
  void *v18;
  int8x8_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  _PASLock *lock;
  id v36;
  id *v38;
  HVQueues *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  __int128 buf;
  void (*v47)(uint64_t, void *);
  void *v48;
  id v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueues: deleteContentWithRequest: %{private}@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HVDataSourceForBundleIdentifier(v9);

  v11 = (void *)MEMORY[0x22074FDF0]();
  v12 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[HVQueues _queueForDataSource:](self, 0x2000, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HVQueues _queueForDataSource:](self, 2048, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithObjects:", v14, v16, 0);

  objc_autoreleasePoolPop(v11);
  v38 = a4;
  if ((_DWORD)v10)
  {
    v18 = (void *)MEMORY[0x22074FDF0]();
    -[HVQueues _queueForDataSource:](self, v10, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setByAddingObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v18);
    v17 = (void *)v21;
  }
  v39 = self;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v42;
    v27 = 1;
    do
    {
      v28 = 0;
      v29 = v25;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v22);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v28);
        v31 = (void *)MEMORY[0x22074FDF0]();
        v40 = v29;
        v32 = objc_msgSend(v30, "deleteContentWithRequest:error:", v6, &v40);
        v25 = v40;

        v27 &= v32;
        objc_autoreleasePoolPop(v31);
        ++v28;
        v29 = v25;
      }
      while (v24 != v28);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v24);
  }
  else
  {
    v25 = 0;
    v27 = 1;
  }

  if (v38)
    *v38 = objc_retainAutorelease(v25);
  v33 = v6;
  if (v39)
  {
    v34 = (void *)os_transaction_create();
    lock = v39->_lock;
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v47 = __47__HVQueues_informObserversToDeleteWithRequest___block_invoke;
    v48 = &unk_24DD7EBD8;
    v49 = v33;
    v50 = v34;
    v36 = v34;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &buf);

  }
  return v27;
}

- (_QWORD)_queueForDataSource:(int8x8_t)a3
{
  _QWORD *v3;
  int v4;
  void *v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a1;
  if (a1)
  {
    v4 = a2;
    HVDataSourceAssertSingleSource(a2, a3);
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__1032;
    v13 = __Block_byref_object_dispose__1033;
    v14 = 0;
    v5 = (void *)v3[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__HVQueues__queueForDataSource___block_invoke;
    v7[3] = &unk_24DD7ECC8;
    v8 = v4;
    v7[5] = &v9;
    v7[6] = sel__queueForDataSource_;
    v7[4] = v3;
    objc_msgSend(v5, "runWithLockAcquired:", v7);
    v3 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return v3;
}

id __49__HVQueues_informObserversThatContentIsAvailable__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "contentAvailableFromSources:", *(unsigned int *)(a1 + 48));
  return (id)objc_opt_self();
}

- (BOOL)dequeueContent:(id *)a3 contentProtection:(id *)a4 dataSource:(unsigned int)a5 dataSourceContentState:(id)a6 minimumLevelOfService:(unsigned __int8)a7 inMemoryItemsOnly:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  id v16;
  int8x8_t v17;
  void *v18;
  int v19;
  unsigned int v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _PASLock *lock;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  int v33;

  v9 = a8;
  v10 = a7;
  v11 = *(_QWORD *)&a5;
  v16 = a6;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVQueues.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  if (objc_msgSend(v16, "dataSource") != (_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVQueues.m"), 307, CFSTR("Mismatched dataSource(%u) and dataSourceContentState(%u) parameters."), v11, objc_msgSend(v16, "dataSource"));

  }
  -[HVQueues _queueForDataSource:](self, v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "dequeueContent:dataSourceContentState:minimumLevelOfService:inMemoryItemsOnly:error:", a3, v16, v10, v9, a9);
  if (v19)
  {
    if (*a3)
    {
      if (a4)
      {
        HIDWORD(v21) = v11;
        LODWORD(v21) = v11 - 1024;
        v20 = v21 >> 10;
        if (v20 <= 7 && ((0x8Bu >> v20) & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = *a3;
            objc_msgSend(v22, "searchableItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "protection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *a4;
            *a4 = v24;

          }
          else
          {
            objc_storeStrong(a4, (id)*MEMORY[0x24BDD0CE0]);
          }
        }
        else
        {
          objc_msgSend(v18, "contentProtection");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *a4;
          *a4 = v27;

        }
      }
    }
    else if (!v9)
    {
      lock = self->_lock;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __125__HVQueues_dequeueContent_contentProtection_dataSource_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke;
      v32[3] = &__block_descriptor_36_e29_v16__0__HVQueuesGuardedData_8l;
      v33 = v11;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v32);
    }
  }

  return v19;
}

void __47__HVQueues_informObserversToDeleteWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3[1];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v3[1], "objectForKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __47__HVQueues_informObserversToDeleteWithRequest___block_invoke_2;
        block[3] = &unk_24DD7EC50;
        block[4] = v8;
        v13 = *(id *)(a1 + 32);
        v14 = *(id *)(a1 + 40);
        dispatch_async(v10, block);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

void __51__HVQueues_enqueueContent_contentProtection_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  int8x8_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_DEFAULT, "HVQueues: enqueueContent: %@", (uint8_t *)&v10, 0xCu);

  }
  v4 = objc_opt_class();
  HVDataSourceForContentClass(v4);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  -[HVQueues _queueForDataSource:](*(_QWORD **)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (BOOL)enqueueContent:(id)a3 contentProtection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _PASLock *lock;
  uint64_t v11;
  id v12;
  unsigned int v13;
  unint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  int v18;
  void *v19;
  char v20;
  _PASLock *v21;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  HVQueues *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1032;
  v37 = __Block_byref_object_dispose__1033;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  lock = self->_lock;
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __51__HVQueues_enqueueContent_contentProtection_error___block_invoke;
  v24[3] = &unk_24DD7EC78;
  v12 = v8;
  v27 = &v29;
  v28 = &v33;
  v25 = v12;
  v26 = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v24);
  HIDWORD(v14) = *((_DWORD *)v30 + 6);
  LODWORD(v14) = HIDWORD(v14) - 1024;
  v13 = v14 >> 10;
  if (v13 > 7 || ((0x8Bu >> v13) & 1) == 0)
  {
    objc_msgSend((id)v34[5], "contentProtection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      hv_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *((_DWORD *)v30 + 6);
        objc_msgSend((id)v34[5], "contentProtection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        v40 = v18;
        v41 = 2112;
        v42 = v19;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_DEFAULT, "HVQueues: enqueueContent: contentProtection for dataSource %u is %@ but caller passed in %@", buf, 0x1Cu);

      }
    }
  }
  v20 = objc_msgSend((id)v34[5], "enqueueContent:error:", v12, a5);
  if ((v20 & 1) != 0)
  {
    v21 = self->_lock;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __51__HVQueues_enqueueContent_contentProtection_error___block_invoke_22;
    v23[3] = &unk_24DD7ECA0;
    v23[4] = self;
    v23[5] = &v29;
    -[_PASLock runWithLockAcquired:](v21, "runWithLockAcquired:", v23);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (HVQueues)init
{
  HVQueues *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  uint64_t v7;
  OS_dispatch_queue *notificationSerialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HVQueues;
  v2 = -[HVQueues init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE7A610]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "HVQueues.notificationSerialQueue", 9);
    v7 = objc_claimAutoreleasedReturnValue();
    notificationSerialQueue = v2->_notificationSerialQueue;
    v2->_notificationSerialQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (BOOL)registerQueueObserver:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HVQueues_registerQueueObserver_dispatchQueue___block_invoke;
  v12[3] = &unk_24DD7EBD8;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);

  return 1;
}

- (BOOL)dequeuedContentConsumedWithError:(id *)a3
{
  return -[HVQueues dequeuedContentConsumedForDataSources:withError:](self, "dequeuedContentConsumedForDataSources:withError:", 0xFFFFFFFFLL, a3);
}

- (BOOL)dequeuedContentConsumedForDataSources:(unsigned int)a3 withError:(id *)a4
{
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVQueues: dequeuedContentConsumedForDataSources:%{public}@", (uint8_t *)&buf, 0xCu);

  }
  v9 = 1;
  if (a3)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1032;
    v20 = __Block_byref_object_dispose__1033;
    v21 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke;
    v12[3] = &unk_24DD7ED60;
    v12[4] = self;
    v12[5] = &buf;
    v12[6] = &v13;
    HVDataSourceRunBlockPerSetBit(a3, v12);
    v10 = *((unsigned __int8 *)v14 + 24);
    if (a4 && !*((_BYTE *)v14 + 24))
    {
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v10 = *((unsigned __int8 *)v14 + 24);
    }
    v9 = v10 != 0;
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&buf, 8);

  }
  return v9;
}

- (BOOL)dequeuedContentNotConsumed:(id)a3 dataSource:(unsigned int)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  _PASLock *lock;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  id v18;
  _QWORD v19[5];
  unsigned int v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  hv_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uniqueId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "HVQueues: dequeuedContentNotConsumedWithUniqueIdentifier: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1032;
  v24 = __Block_byref_object_dispose__1033;
  v25 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__HVQueues_dequeuedContentNotConsumed_dataSource_error___block_invoke;
  v19[3] = &unk_24DD7ED38;
  v19[4] = &buf;
  v20 = a4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);
  v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v12)
  {
    v18 = 0;
    v13 = objc_msgSend(v12, "dequeuedContentNotConsumed:error:", v8, &v18);
    v14 = v18;
    v15 = v14;
    if (a5)
      v16 = v13;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
      *a5 = objc_retainAutorelease(v14);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 12, 0);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&buf, 8);

  return v13;
}

- (id)statsWithError:(id *)a3
{
  void *v4;
  _PASLock *lock;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1032;
  v51 = __Block_byref_object_dispose__1033;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1032;
  v45 = __Block_byref_object_dispose__1033;
  v46 = 0;
  lock = self->_lock;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __27__HVQueues_statsWithError___block_invoke;
  v37[3] = &unk_24DD7ED88;
  v39 = &v47;
  v40 = &v41;
  v6 = v4;
  v38 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v37);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("Observers"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)v48[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Observers"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("Queues"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = (id)v42[5];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend((id)v42[5], "objectForKeyedSubscript:", v21, (_QWORD)v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "statsWithError:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Queues"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HVDataSourceDescription(objc_msgSend(v21, "intValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v53, 16);
    }
    while (v18);
  }

  v26 = v38;
  v27 = v6;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1032;
  v23 = __Block_byref_object_dispose__1033;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__HVQueues_cleanupWithError_shouldContinueBlock___block_invoke;
  v11[3] = &unk_24DD7EDB0;
  v7 = v6;
  v11[4] = self;
  v12 = v7;
  v13 = &v15;
  v14 = &v19;
  HVDataSourceRunBlockPerSetBit(-1, v11);
  v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v20[5]);
    v8 = *((unsigned __int8 *)v16 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSerialQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __49__HVQueues_cleanupWithError_shouldContinueBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int8x8_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  id obj;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    -[HVQueues _queueForDataSource:](*(_QWORD **)(a1 + 32), a2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = objc_msgSend(v7, "cleanupWithError:shouldContinueBlock:", &obj, *(_QWORD *)(a1 + 40));
    objc_storeStrong((id *)(v8 + 40), obj);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v10 + 24))
      v11 = v9;
    else
      v11 = 0;
    *(_BYTE *)(v10 + 24) = v11;

  }
  else
  {
    *a3 = 1;
  }
}

void __27__HVQueues_statsWithError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = (void *)a2[1];
  v4 = a2;
  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend((id)v4[2], "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  HVDataSourceDescription(*((_DWORD *)v4 + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("DataSources with available content"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = v4[3];

  objc_msgSend(v12, "numberWithInt:", v13 != 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("Content available notification in progress"));

}

void __56__HVQueues_dequeuedContentNotConsumed_dataSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a2 + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1032;
  v15 = __Block_byref_object_dispose__1033;
  v16 = 0;
  v3 = *(void **)(a1[4] + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke_2;
  v9[3] = &unk_24DD7ED38;
  v9[4] = &v11;
  v10 = a2;
  objc_msgSend(v3, "runWithLockAcquired:", v9);
  v4 = (void *)v12[5];
  if (v4)
  {
    v8 = 0;
    v5 = objc_msgSend(v4, "dequeuedContentConsumedWithError:", &v8);
    v6 = v8;
    v7 = v8;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v6);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }

  }
  _Block_object_dispose(&v11, 8);

}

void __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a2 + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __125__HVQueues_dequeueContent_contentProtection_dataSource_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 32) &= ~*(_DWORD *)(result + 32);
  return result;
}

void __51__HVQueues_enqueueContent_contentProtection_error___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  *(_DWORD *)(a2 + 32) |= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!*(_QWORD *)(a2 + 24))
  {
    v9 = (id)a2;
    v4 = os_transaction_create();
    v5 = *(void **)(a2 + 24);
    *(_QWORD *)(a2 + 24) = v4;

    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
    {
      location = 0;
      objc_initWeak(&location, v6);
      v7 = (void *)MEMORY[0x24BE7A5D8];
      v8 = v6[2];
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke;
      v10[3] = &unk_24DD7ECF0;
      objc_copyWeak(&v11, &location);
      v10[4] = v6;
      objc_msgSend(v7, "runAsyncOnQueue:afterDelaySeconds:block:", v8, v10, 0.1, v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

uint64_t __48__HVQueues_registerQueueObserver_dispatchQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)defaultQueues
{
  if (defaultQueues__pasOnceToken2 != -1)
    dispatch_once(&defaultQueues__pasOnceToken2, &__block_literal_global_1076);
  return (id)defaultQueues__pasExprOnceResult;
}

void __25__HVQueues_defaultQueues__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)defaultQueues__pasExprOnceResult;
  defaultQueues__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)setQueue:(id)a3 forDataSource:(unsigned int)a4
{
  id v4;

  v4 = a3;
  __break(1u);
}

- (unsigned)waitForObserversWithTimeout:(double)a3
{
  void *v5;
  uint64_t v6;
  _PASLock *lock;
  void *v8;
  double v9;
  BOOL v10;
  void *v11;
  _PASLock *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  dispatch_time_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  unsigned __int8 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v6 = MEMORY[0x24BDAC760];
  do
  {
    lock = self->_lock;
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke;
    v31[3] = &unk_24DD7EDD8;
    v31[4] = &v32;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v31);
    if (!*((_BYTE *)v33 + 24))
      break;
    usleep(0x1E84u);
    if (!*((_BYTE *)v33 + 24))
      break;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v5);
    v10 = v9 < a3;

  }
  while (v10);
  v11 = (void *)objc_opt_new();
  v12 = self->_lock;
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke_2;
  v29[3] = &unk_24DD7EC28;
  v13 = v11;
  v30 = v13;
  -[_PASLock runWithLockAcquired:](v12, "runWithLockAcquired:", v29);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v5);
  v16 = v15;

  v17 = fmax(v16, 0.0);
  if (v17 <= 0.0)
  {
    v18 = 0;
  }
  else if (v17 <= 9223372040.0)
  {
    v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  }
  else
  {
    v18 = -1;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        if (dispatch_block_wait(*(dispatch_block_t *)(*((_QWORD *)&v25 + 1) + 8 * i), v18))
        {
          v23 = 1;
          goto LABEL_20;
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      if (v20)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_20:

  _Block_object_dispose(&v32, 8);
  return v23;
}

uint64_t __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 24) != 0;
  return result;
}

void __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  dispatch_block_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3[1];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v3[1], "objectForKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_100);
        dispatch_barrier_async(v10, v11);
        v12 = *(void **)(a1 + 32);
        v13 = (void *)MEMORY[0x22074FF64](v11);
        objc_msgSend(v12, "addObject:", v13);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

@end
