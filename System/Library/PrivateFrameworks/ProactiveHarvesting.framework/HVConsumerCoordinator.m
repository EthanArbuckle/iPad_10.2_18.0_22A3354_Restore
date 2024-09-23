@implementation HVConsumerCoordinator

void __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _DWORD **v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int, _BYTE *);
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v4 = *(_DWORD *)(a1 + 48);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke_2;
  v18 = &unk_24DD7E440;
  v19 = *(_QWORD *)(a1 + 32);
  v5 = (_DWORD **)v3;
  v6 = *(_QWORD *)(a1 + 40);
  v21 = &v23;
  v22 = v6;
  v20 = v5;
  HVDataSourceRunBlockPerSetBit(v4, &v15);
  if (*((_BYTE *)v24 + 24))
  {
    +[HVScheduledTasks delayedBudgetedContentAvailable](HVScheduledTasks, "delayedBudgetedContentAvailable", v15, v16, v17, v18, v19);
    v7 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v5[1], *(_DWORD *)(a1 + 48), 2);
    hv_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HVDataSourceDescription(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v9;
      _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: sources after applying budget: %{public}@", buf, 0xCu);

    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v10, v7, 2, 1, v5, 0, 0);
  }
  v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v5[1], *(_DWORD *)(a1 + 48), 3);
  hv_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v13;
    _os_log_impl(&dword_21AA1D000, v12, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: sources after applying budget: %{public}@", buf, 0xCu);

  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v14, v11, 3, 0, v5, 0, 0);

  _Block_object_dispose(&v23, 8);
}

void __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  id *v12;
  id *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int8x16_t v18;
  _QWORD v19[2];
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  int8x16_t v22;
  id v23;
  uint64_t *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[8];
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t v40;
  id *v41;
  int v42;
  char v43;
  _QWORD v44[4];
  id *v45;
  char v46;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v6 = *(unsigned __int8 *)(a1 + 84);
  v7 = *(unsigned __int8 *)(a1 + 85);
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v20 = __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke_2;
  v21 = &unk_24DD7E4E0;
  v9 = *(_DWORD *)(a1 + 80);
  v30 = v6;
  v24 = &v32;
  v28 = v9;
  v29 = a2;
  v31 = *(_BYTE *)(a1 + 86);
  v18 = *(int8x16_t *)(a1 + 32);
  v10 = *(_QWORD *)(v18.i64[0] + 8);
  v11 = (id)v18.i64[0];
  v22 = vextq_s8(v18, v18, 8uLL);
  v23 = *(id *)(a1 + 48);
  v25 = *(_OWORD *)(a1 + 56);
  v26 = *(_QWORD *)(a1 + 72);
  v27 = a3;
  v12 = v19;
  v13 = v12;
  if (v10)
  {
    if ((*(_DWORD *)(v10 + 8) & a2) != 0)
    {
      v20((uint64_t)v12, v6);
    }
    else if (!v7
           || -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:]((_DWORD *)v10, a2, v6) == a2)
    {
      v14 = *(unsigned __int8 *)(v10 + 40);
      v15 = (void *)MEMORY[0x22074FDF0]();
      if (v14)
      {
        v20((uint64_t)v13, v6);
      }
      else
      {
        +[HVPowerBudget defaultBudget](HVPowerBudget, "defaultBudget");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v8;
        v44[1] = 3221225472;
        v44[2] = __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke;
        v44[3] = &unk_24DD7F2B8;
        v45 = v13;
        v46 = v6;
        *(_QWORD *)buf = v8;
        v37 = 3221225472;
        v38 = __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke_2;
        v39 = &unk_24DD7F2E0;
        v40 = v10;
        v42 = a2;
        v41 = v45;
        v43 = v6;
        objc_msgSend(v16, "doDiscretionaryWork:orElse:", v44, buf);

      }
      objc_autoreleasePoolPop(v15);
    }
  }

  if (!*((_BYTE *)v33 + 24))
  {
    hv_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeAllContentFromAllDataSources: Did not perform work", buf, 2u);
    }

  }
  _Block_object_dispose(&v32, 8);
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__HVConsumerCoordinator_deleteContentWithRequest_error___block_invoke;
  v9[3] = &unk_24DD7E558;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

  return 1;
}

void __56__HVConsumerCoordinator_deleteContentWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
    goto LABEL_21;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
    {
      v6 = 3;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
    {
      v6 = 4;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
    {
      v6 = 5;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.parsecd")) & 1) != 0)
    {
      v6 = 6;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    {
      v6 = 7;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
    {
      v6 = 8;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    {
      v6 = 9;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
    {
      v6 = 10;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    {
      v6 = 11;
      goto LABEL_23;
    }
LABEL_21:
    v7 = 0;
    goto LABEL_24;
  }
  v6 = 2;
LABEL_23:
  v7 = v3[v6];
LABEL_24:

  hv_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218243;
    v59 = v9;
    v60 = 2113;
    v61 = v10;
    _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: deleteContentWithRequest: consumer count: %tu request: %{private}@", buf, 0x16u);
  }

  v41 = v7;
  if (v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count", v7));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x22074FDF0]();
          v19 = (id)objc_msgSend(v17, "deleteDataDerivedFromContentMatchingRequest:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v17, "consumerName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = 0;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = v3;
  v21 = v3[12];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v26, "consumerName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v11, "containsObject:", v28);

        if ((v29 & 1) == 0)
          v30 = (id)objc_msgSend(v26, "deleteDataDerivedFromContentMatchingRequest:", *(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v23);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v31 = v42[13];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        v37 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v36, "consumerName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v11, "containsObject:", v38);

        if ((v39 & 1) == 0)
          v40 = (id)objc_msgSend(v36, "deleteDataDerivedFromContentMatchingRequest:", *(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v37);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v33);
  }

}

- (void)contentAvailableFromSources:(unsigned int)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  _PASLock *lock;
  _QWORD v10[6];
  unsigned int v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)os_transaction_create();
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: contentAvailableFromSources: %{public}@", buf, 0xCu);

  }
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke;
  v10[3] = &unk_24DD7E468;
  v11 = a3;
  v10[4] = self;
  v10[5] = a2;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

}

- (BOOL)_consumeContentFromAllDataSources:(int)a3 minimumLevelOfService:(char)a4 inMemoryItemsOnly:(void *)a5 guardedData:(void *)a6 shouldContinueBlock:(_QWORD *)a7 error:
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  _BOOL8 v26;
  NSObject *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t *v36;
  int v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t v49[4];
  id v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a6;
  hv_default_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl(&dword_21AA1D000, v15, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeContentFromDataSources: %{public}@ with minimum LoS %hhu", buf, 0x12u);

  }
  v17 = a3 != 1 || v14 == 0;
  v45 = 0;
  v46 = &v45;
  v18 = v17;
  v47 = 0x2020000000;
  v48 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__657;
  v53 = __Block_byref_object_dispose__658;
  v54 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke;
  v30[3] = &unk_24DD7E508;
  v38 = a3;
  v39 = v18;
  v19 = v13;
  v37 = a2;
  v31 = v19;
  v32 = a1;
  v40 = a4;
  v20 = v14;
  v33 = v20;
  v34 = &v41;
  v35 = buf;
  v36 = &v45;
  HVDataSourceRunBlockPerSetBit(a2, v30);
  if (a7)
  {
    v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v21)
      *a7 = objc_retainAutorelease(v21);
  }
  v22 = *(void **)(a1 + 24);
  v23 = *((unsigned int *)v42 + 6);
  v29 = 0;
  v24 = objc_msgSend(v22, "dequeuedContentConsumedForDataSources:withError:", v23, &v29);
  v25 = v29;
  if ((v24 & 1) != 0)
  {
    v26 = *((_BYTE *)v46 + 24) != 0;
  }
  else
  {
    hv_default_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v49 = 138412290;
      v50 = v25;
      _os_log_fault_impl(&dword_21AA1D000, v27, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeContentWithGuardedData: consumptionCompletedWithError: %@", v49, 0xCu);
    }

    v26 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v25);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v45, 8);
  return v26;
}

void __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke_2(uint64_t a1, int a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HVConsumerCoordinator _consumersForOneDataSource:guardedData:](*(id *)(a1 + 32), a2, *(void **)(a1 + 40));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x22074FDF0]();
        objc_msgSend(v5, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v14 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HVConsumerCoordinator.m"), 221, CFSTR("Consumer %@ is missing state"), v14);

        }
        if (objc_msgSend(v12, "levelOfService") == 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a3 = 1;

          objc_autoreleasePoolPop(v11);
          goto LABEL_13;
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)_consumersForOneDataSource:(void *)a3 guardedData:
{
  char *v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  v6 = v5;
  if (!a1)
    goto LABEL_35;
  a1 = 0;
  if (a2 > 255)
  {
    if (a2 > 4095)
    {
      if (a2 >= 0x4000)
      {
        if (a2 != 0x4000 && a2 != 0x8000)
          goto LABEL_35;
        v7 = 112;
      }
      else
      {
        if (a2 != 4096 && a2 != 0x2000)
          goto LABEL_35;
        v7 = 104;
      }
    }
    else if (a2 > 1023)
    {
      if (a2 == 1024)
      {
        v7 = 88;
      }
      else
      {
        if (a2 != 2048)
          goto LABEL_35;
        v7 = 96;
      }
    }
    else if (a2 == 256)
    {
      v7 = 72;
    }
    else
    {
      if (a2 != 512)
        goto LABEL_35;
      v7 = 80;
    }
    goto LABEL_34;
  }
  if (a2 > 15)
  {
    if (a2 <= 63)
    {
      if (a2 == 16)
      {
        v7 = 48;
        goto LABEL_34;
      }
      if (a2 != 32)
        goto LABEL_35;
      goto LABEL_28;
    }
    if (a2 == 64)
    {
LABEL_28:
      v7 = 56;
      goto LABEL_34;
    }
    if (a2 != 128)
      goto LABEL_35;
    v7 = 64;
LABEL_34:
    a1 = *(id *)&v5[v7];
    goto LABEL_35;
  }
  v7 = 16;
  switch(a2)
  {
    case 1:
      goto LABEL_34;
    case 2:
      v7 = 24;
      goto LABEL_34;
    case 4:
      v7 = 32;
      goto LABEL_34;
    case 8:
      v7 = 40;
      goto LABEL_34;
    default:
      break;
  }
LABEL_35:

  return a1;
}

void __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char **v13;
  id v14;
  HVDataSourceContentState *v15;
  uint64_t (**v16)(_QWORD);
  void *v17;
  char v18;
  id v19;
  HVConsumptionContext *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HVMutableContentState *v26;
  NSObject *v27;
  _QWORD *v28;
  id v29;
  int v30;
  NSObject *v31;
  id v32;
  HVMutableContentState *v33;
  void *v34;
  HVMutableContentState *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  HVMutableContentState *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  int v57;
  char v58;
  void *v59;
  id v60;
  NSObject *v61;
  int v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void (*v72)(id, char *, HVConsumptionContext *);
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint8_t v87;
  int v88;
  id v89;
  int v90;
  _QWORD *v91;
  NSObject *v92;
  _DWORD *v93;
  int v94;
  NSObject *v95;
  int v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned __int8 v101;
  uint64_t i;
  void *v103;
  unsigned int v104;
  NSObject *v105;
  id v106;
  id v107;
  NSObject *v108;
  id v109;
  int v110;
  int v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  BOOL v115;
  id v116;
  NSObject *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  NSObject *v121;
  uint64_t v122;
  HVDataSourceContentState *v123;
  void *v124;
  int v125;
  void *v126;
  char *v127;
  void *v128;
  void *v129;
  char v130;
  uint64_t (**v131)(_QWORD);
  _QWORD *v132;
  void *v133;
  id v134;
  id v135;
  HVDataSourceContentState *v136;
  _QWORD *v137;
  char v138;
  unsigned int v139;
  unsigned int v140;
  void *v141;
  HVMutableContentState *v142;
  char v143;
  HVConsumptionContext *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  void *v148;
  void *context;
  void *v150;
  int v151;
  HVConsumptionContext *v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  id v162;
  id v163;
  void *v164;
  id v165;
  uint8_t v166[128];
  uint8_t buf[4];
  _BYTE v168[20];
  id v169;
  uint8_t v170[4];
  id v171;
  __int16 v172;
  _BYTE v173[10];
  uint64_t v174;

  v174 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(*(_DWORD *)(a1 + 96));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 104);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v168 = a2;
    *(_WORD *)&v168[4] = 2114;
    *(_QWORD *)&v168[6] = v5;
    *(_WORD *)&v168[14] = 1024;
    *(_DWORD *)&v168[16] = v6;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeContentFromDataSources: effective LoS %hhu for %{public}@ with minimum LoS %hhu", buf, 0x18u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v7 = *(unsigned int *)(a1 + 100);
  v125 = *(unsigned __int8 *)(a1 + 105);
  v8 = *(_QWORD **)(a1 + 32);
  v9 = *(void **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = v11;
  if (!v8)
  {

    v106 = 0;
LABEL_142:
    v107 = v106;
LABEL_165:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v107);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    goto LABEL_166;
  }
  -[HVConsumerCoordinator _consumersForOneDataSource:guardedData:](v8, v7, v10);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v7 > 255)
  {
    if ((int)v7 > 4095)
    {
      if ((int)v7 >= 0x4000)
      {
        if ((_DWORD)v7 == 0x4000)
        {
          v13 = &selRef_consumeNotificationsWithContext_;
        }
        else
        {
          if ((_DWORD)v7 != 0x8000)
            goto LABEL_139;
          v13 = &selRef_consumeNotificationStackWithContext_;
        }
      }
      else if ((_DWORD)v7 == 4096)
      {
        v13 = &selRef_consumeUserActivityMetadataWithContext_;
      }
      else
      {
        if ((_DWORD)v7 != 0x2000)
          goto LABEL_139;
        v13 = &selRef_consumeSearchableUserActivityWithContext_;
      }
    }
    else if ((int)v7 > 1023)
    {
      if ((_DWORD)v7 == 1024)
      {
        v13 = &selRef_consumeThirdPartyAppContentWithContext_;
      }
      else
      {
        if ((_DWORD)v7 != 2048)
          goto LABEL_139;
        v13 = &selRef_consumeInteractionWithContext_;
      }
    }
    else
    {
      if ((_DWORD)v7 != 256)
      {
        if ((_DWORD)v7 == 512)
        {
          v13 = &selRef_consumeSiriQueriesWithContext_;
          goto LABEL_38;
        }
        goto LABEL_139;
      }
      v13 = &selRef_consumeSafariContentWithContext_;
    }
  }
  else
  {
    if ((int)v7 <= 15)
    {
      v13 = &selRef_consumeMailContentWithContext_;
      switch((int)v7)
      {
        case 1:
          goto LABEL_38;
        case 2:
          v13 = &selRef_consumeMessagesContentWithContext_;
          goto LABEL_38;
        case 4:
          v13 = &selRef_consumeNewsArticleViewsWithContext_;
          goto LABEL_38;
        case 8:
          v13 = &selRef_consumeNotesContentWithContext_;
          goto LABEL_38;
        default:
          goto LABEL_139;
      }
    }
    if ((int)v7 > 63)
    {
      if ((_DWORD)v7 == 64)
      {
        v13 = &selRef_consumePhotosKnowledgeGraphWithContext_;
      }
      else
      {
        if ((_DWORD)v7 != 128)
          goto LABEL_139;
        v13 = &selRef_consumeRemindersContentWithContext_;
      }
    }
    else
    {
      if ((_DWORD)v7 != 16)
      {
        if ((_DWORD)v7 == 32)
        {
          v13 = &selRef_consumePhotosPhotoViewsWithContext_;
          goto LABEL_38;
        }
LABEL_139:
        hv_default_log_handle();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v168 = v7;
          _os_log_fault_impl(&dword_21AA1D000, v105, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: unknown datasource value: %u", buf, 8u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HVErrorDomain"), 11, 0);
        v106 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_142;
      }
      v13 = &selRef_consumeParsecSearchesWithContext_;
    }
  }
LABEL_38:
  v127 = *v13;
  if (!*v13)
    goto LABEL_139;
  v131 = (uint64_t (**)(_QWORD))v12;
  v122 = a1;
  v123 = -[HVDataSourceContentState initWithDataSource:basePath:]([HVDataSourceContentState alloc], "initWithDataSource:basePath:", v7, v8[4]);
  v14 = 0;
  v130 = 1;
  v139 = v7;
  v140 = a2;
  v137 = v8;
  v132 = v10;
  do
  {
    v129 = (void *)MEMORY[0x22074FDF0]();
    v15 = v123;
    v134 = v10;
    v16 = v131;
    v135 = v126;
    v136 = v15;
    v163 = 0;
    v164 = 0;
    v17 = (void *)v8[3];
    v162 = 0;
    v18 = objc_msgSend(v17, "dequeueContent:contentProtection:dataSource:dataSourceContentState:minimumLevelOfService:inMemoryItemsOnly:error:", &v164, &v163, v7, v15, a2, v125 != 0, &v162);
    v19 = v162;
    v133 = v16;
    v128 = v14;
    if ((v18 & 1) == 0)
    {
      hv_default_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v168 = v19;
        _os_log_error_impl(&dword_21AA1D000, v27, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: dequeueContent error: %@", buf, 0xCu);
      }
      v28 = v8;

      v29 = objc_retainAutorelease(v19);
      v151 = 0;
      v170[0] = 0;
      v30 = 1;
      v19 = v29;
      goto LABEL_113;
    }
    if (!v164)
    {
      hv_default_log_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA1D000, v31, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: no content available", buf, 2u);
      }
      v28 = v8;

      v151 = 0;
      v29 = 0;
      v30 = 1;
      v170[0] = 1;
      goto LABEL_113;
    }
    v20 = [HVConsumptionContext alloc];
    v144 = -[HVConsumptionContext initWithContent:contentProtection:scheduledTaskShouldContinueBlock:](v20, "initWithContent:contentProtection:scheduledTaskShouldContinueBlock:", v164, v163, v16);
    HVDataSourceContentStateKey(v7, v164);
    v21 = objc_claimAutoreleasedReturnValue();
    -[HVDataSourceContentState deferredContentStates](v15, "deferredContentStates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (void *)v21;
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v32 = v19;
      v33 = [HVMutableContentState alloc];
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v33;
      v19 = v32;
      v26 = -[HVMutableContentState initWithConsumers:levelOfService:](v35, "initWithConsumers:levelOfService:", v34, a2);

    }
    v36 = -[HVContentState levelOfService](v26, "levelOfService");
    if (v36 >= a2)
      v37 = a2;
    else
      v37 = v36;
    -[HVMutableContentState setLevelOfService:](v26, "setLevelOfService:", v37);
    -[HVDataSourceContentState deferredContentStates](v136, "deferredContentStates");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", 0, v124);

    hv_default_log_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v168 = v144;
      *(_WORD *)&v168[8] = 2112;
      *(_QWORD *)&v168[10] = v126;
      _os_log_impl(&dword_21AA1D000, v39, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: context: %@ consumers: %@", buf, 0x16u);
    }

    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v40 = v135;
    v146 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
    if (!v146)
    {

      v29 = 0;
      v87 = 1;
      goto LABEL_112;
    }
    v138 = 0;
    v145 = *(_QWORD *)v159;
    v143 = 1;
    v141 = v40;
    v142 = v26;
LABEL_58:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v159 != v145)
        objc_enumerationMutation(v40);
      v42 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v41);
      v43 = (void *)MEMORY[0x22074FDF0]();
      objc_msgSend(v40, "objectForKey:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", sel__consumeOneContentFromOneDataSource_minimumLevelOfService_inMemoryItemsOnly_dataSourceContentState_guardedData_shouldContinueBlock_contentWasAvailable_consumers_consumerSelector_error_, v137, CFSTR("HVConsumerCoordinator.m"), 681, CFSTR("Consumer %@ is missing state"), v42);

      }
      if (!objc_msgSend(v44, "levelOfService"))
      {
        hv_default_log_handle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v170 = 138412290;
          v171 = v42;
          _os_log_impl(&dword_21AA1D000, v61, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: ignoring consumer %@ registered for No Service.", v170, 0xCu);
        }

        goto LABEL_90;
      }
      context = v43;
      v147 = v19;
      v45 = v164;
      v46 = v42;
      v47 = v44;
      v48 = v26;
      v152 = v144;
      v49 = v45;
      objc_msgSend(v46, "consumerName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HVContentState consumers](v48, "consumers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "containsObject:", v50);

      v150 = v47;
      v148 = v49;
      if (v52)
      {
        hv_default_log_handle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v49, "uniqueId");
          v54 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v170 = 138412546;
          v171 = v50;
          v172 = 2112;
          *(_QWORD *)v173 = v54;
          v55 = v53;
          v56 = "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: consumer %@ has already seen content %@";
          goto LABEL_67;
        }
        goto LABEL_69;
      }
      if (objc_msgSend(v47, "levelOfService") >= a2)
      {
        v72 = (void (*)(id, char *, HVConsumptionContext *))objc_msgSend(v46, "methodForSelector:", v127);
        if (!v72)
        {
          hv_default_log_handle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v170 = 138412290;
            v171 = v46;
            _os_log_fault_impl(&dword_21AA1D000, v53, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: methodForSelector on %@ failed", v170, 0xCu);
          }
          goto LABEL_69;
        }
        v72(v46, v127, v152);
        v53 = objc_claimAutoreleasedReturnValue();
        -[NSObject contentWasProcessed](v53, "contentWasProcessed");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "BOOLValue");

        if (v74)
        {
          objc_msgSend(v47, "setDocumentsConsumed:", objc_msgSend(v47, "documentsConsumed") + 1);
          -[NSObject numberOfExtractions](v53, "numberOfExtractions");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            -[NSObject numberOfExtractions](v53, "numberOfExtractions");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setNumberOfExtractions:", objc_msgSend(v47, "numberOfExtractions") + objc_msgSend(v76, "intValue"));

          }
        }
        else
        {
          objc_msgSend(v47, "setDocumentsIgnored:", objc_msgSend(v47, "documentsIgnored") + 1);
        }
        if ((-[NSObject success](v53, "success") & 1) != 0
          || (objc_msgSend(v47, "setErrorsReported:", objc_msgSend(v47, "errorsReported") + 1),
              -[NSObject error](v53, "error"),
              v77 = (void *)objc_claimAutoreleasedReturnValue(),
              v78 = objc_msgSend(v77, "code"),
              v77,
              v78 != 1))
        {
          v80 = (void *)MEMORY[0x22074FDF0]();
          -[HVContentState consumers](v48, "consumers");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setByAddingObject:", v50);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v80);
          -[HVMutableContentState setConsumers:](v48, "setConsumers:", v82);

          hv_default_log_handle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v170 = 138412546;
            v171 = v46;
            v172 = 2112;
            *(_QWORD *)v173 = v47;
            v55 = v54;
            v56 = "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: %@ consumed content: new state = %@";
LABEL_67:
            _os_log_impl(&dword_21AA1D000, v55, OS_LOG_TYPE_DEFAULT, v56, v170, 0x16u);
          }

LABEL_69:
          v57 = 0;
          v58 = 1;
          v59 = v147;
          v60 = v147;
          v143 = 1;
          goto LABEL_77;
        }
        hv_default_log_handle();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v170 = 138412290;
          v171 = v46;
          _os_log_impl(&dword_21AA1D000, v79, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: %@ reported being interrupted so exiting early and leaving content in queue", v170, 0xCu);
        }

        objc_msgSend(v47, "setNumberOfInterruptions:", objc_msgSend(v47, "numberOfInterruptions") + 1);
        -[NSObject error](v53, "error");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        v143 = 0;
        v57 = 1;
        v59 = v147;
      }
      else
      {
        hv_default_log_handle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v62 = objc_msgSend(v47, "levelOfService");
          *(_DWORD *)v170 = 138412802;
          v171 = v50;
          v172 = 1024;
          *(_DWORD *)v173 = v62;
          *(_WORD *)&v173[4] = 1024;
          *(_DWORD *)&v173[6] = a2;
          _os_log_impl(&dword_21AA1D000, v53, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: consumer %@ registered at LoS %hhu which is below minimum LoS %hhu.", v170, 0x18u);
        }
        v57 = 0;
        v58 = 0;
        v143 = 1;
        v59 = v147;
        v60 = v147;
      }
LABEL_77:

      v63 = v60;
      v40 = v141;
      if ((v58 & 1) != 0)
        goto LABEL_88;
      v64 = v164;
      objc_msgSend(v64, "uniqueId");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)v137[3];
      v165 = 0;
      v67 = objc_msgSend(v66, "dequeuedContentNotConsumed:dataSource:error:", v64, v139, &v165);

      v68 = v165;
      hv_default_log_handle();
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v69;
      if ((v67 & 1) == 0)
      {
        if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          goto LABEL_87;
        HVDataSourceDescription(v139);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v170 = 138412546;
        v171 = v65;
        v172 = 2114;
        *(_QWORD *)v173 = v71;
        _os_log_error_impl(&dword_21AA1D000, v70, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _reportDeferralWithContent: failed to reenqueue %@ to %{public}@", v170, 0x16u);
        goto LABEL_81;
      }
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        HVDataSourceDescription(v139);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v170 = 138412546;
        v171 = v65;
        v172 = 2114;
        *(_QWORD *)v173 = v71;
        _os_log_impl(&dword_21AA1D000, v70, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _reportDeferralWithContent: reenqueued %@ to %{public}@", v170, 0x16u);
LABEL_81:

      }
LABEL_87:

      v138 = 1;
LABEL_88:
      if (v57)
        break;
      v19 = v63;
      a2 = v140;
      v26 = v142;
      v43 = context;
LABEL_90:

      objc_autoreleasePoolPop(v43);
      if (v146 == ++v41)
      {
        v84 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
        v146 = v84;
        if (!v84)
        {

          v63 = v19;
          goto LABEL_106;
        }
        goto LABEL_58;
      }
    }

    objc_autoreleasePoolPop(context);
    a2 = v140;
    v26 = v142;
LABEL_106:
    if ((v138 & 1) != 0)
    {
      v85 = (void *)-[HVMutableContentState copy](v26, "copy");
      -[HVDataSourceContentState deferredContentStates](v136, "deferredContentStates");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v85, v124);

    }
    v7 = v139;
    v8 = v137;
    if ((v143 & 1) != 0)
    {
      v29 = 0;
      v87 = 1;
      v19 = v63;
    }
    else
    {
      v29 = objc_retainAutorelease(v63);
      v87 = 0;
      v19 = v29;
    }
LABEL_112:
    v28 = v8;
    v170[0] = v87;

    v30 = 0;
    v151 = 1;
LABEL_113:

    v88 = v170[0];
    v89 = v29;

    if (v131 == 0 || (v130 & 1) == 0)
    {
      if ((v130 & 1) == 0)
        goto LABEL_117;
LABEL_115:
      v90 = 1;
      v91 = v132;
      v8 = v28;
    }
    else
    {
      if ((((uint64_t (**)(void *))v131)[2](v133) & 1) != 0)
        goto LABEL_115;
LABEL_117:
      hv_default_log_handle();
      v92 = objc_claimAutoreleasedReturnValue();
      v8 = v28;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA1D000, v92, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: shouldContinueBlock returned NO.", buf, 2u);
      }

      v90 = 0;
      v91 = v132;
    }
    v93 = (_DWORD *)v91[1];
    if (v93
      && -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v93, v7, a2) == (_DWORD)v7)
    {
      v94 = 1;
    }
    else
    {
      hv_default_log_handle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA1D000, v95, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: consumed budget while processing", buf, 2u);
      }

      v94 = 0;
    }

    objc_autoreleasePoolPop(v129);
    v130 = v90;
    v96 = v90 & v94;
    v14 = v89;
    v10 = v132;
  }
  while ((v30 | v88 & v96 ^ 1) != 1);
  if ((v88 & 1) != 0)
  {
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v97 = v135;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v155;
      v101 = 4;
      do
      {
        for (i = 0; i != v99; ++i)
        {
          if (*(_QWORD *)v155 != v100)
            objc_enumerationMutation(v97);
          objc_msgSend(v97, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * i));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v103, "levelOfService"))
          {
            v104 = objc_msgSend(v103, "levelOfService");
            if (v104 < v101)
              v101 = v104;
          }

        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
      }
      while (v99);
    }
    else
    {
      v101 = 4;
    }

    if (objc_msgSend(v97, "count"))
    {
      v111 = v151;
      if (v140 > v101)
        v111 = 1;
      if (((v111 | v96 ^ 1) & 1) != 0)
      {
        -[HVDataSourceContentState saveStateWithError:](v136, "saveStateWithError:", 0);
        v109 = 0;
        v110 = 1;
        goto LABEL_152;
      }
    }
    if (!objc_msgSend(v97, "count"))
    {
      hv_default_log_handle();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        HVDataSourceDescription(v139);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v168 = v113;
        _os_log_impl(&dword_21AA1D000, v112, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator<%{public}@>: no consumers found for data source!", buf, 0xCu);

      }
    }
    v114 = v137[4];
    v153 = 0;
    v115 = +[HVDataSourceContentState deleteStateForDataSource:basePath:error:](HVDataSourceContentState, "deleteStateForDataSource:basePath:error:", v139, v114, &v153);
    v116 = v153;
    a1 = v122;
    if (!v115)
    {
      hv_default_log_handle();
      v117 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        v118 = v137[4];
        HVDataSourceDescription(v139);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v168 = v118;
        *(_WORD *)&v168[8] = 2112;
        *(_QWORD *)&v168[10] = v119;
        *(_WORD *)&v168[18] = 2112;
        v169 = v116;
        _os_log_impl(&dword_21AA1D000, v117, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource<%{public}@>: failed to delete state file at %@: %@", buf, 0x20u);

      }
    }

    v109 = 0;
    v110 = 2;
  }
  else
  {
    hv_default_log_handle();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v168 = v89;
      _os_log_error_impl(&dword_21AA1D000, v108, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: error: %@", buf, 0xCu);
    }

    v109 = objc_retainAutorelease(v89);
    v110 = 0;
LABEL_152:
    a1 = v122;
  }

  v107 = v109;
  if (!v110)
    goto LABEL_165;
  if (v110 == 2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= *(_DWORD *)(a1 + 100);
LABEL_166:
  v120 = *(_QWORD *)(a1 + 48);
  if (v120 && ((*(uint64_t (**)(void))(v120 + 16))() & 1) == 0)
  {
    hv_default_log_handle();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v121, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeAllContentFromAllDataSources: shouldContinueBlock returned NO.", buf, 2u);
    }

    **(_BYTE **)(a1 + 88) = 1;
  }

}

- (HVConsumerCoordinator)init
{
  void *v3;
  void *v4;
  HVConsumerCoordinator *v5;

  +[HVQueues defaultQueues](HVQueues, "defaultQueues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVPaths topDirectoryCreateIfNeeded:](HVPaths, "topDirectoryCreateIfNeeded:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HVConsumerCoordinator initWithQueues:path:](self, "initWithQueues:path:", v3, v4);

  return v5;
}

- (HVConsumerCoordinator)initWithQueues:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  HVConsumerCoordinator *v9;
  dispatch_group_t v10;
  OS_dispatch_group *waitingForLock;
  uint64_t v12;
  NSString *path;
  id v14;
  void *v15;
  NSString *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _PASLock *lock;
  uint64_t v24;
  OS_dispatch_queue *serialQueue;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HVConsumerCoordinator;
  v9 = -[HVConsumerCoordinator init](&v28, sel_init);
  if (v9)
  {
    v10 = dispatch_group_create();
    waitingForLock = v9->_waitingForLock;
    v9->_waitingForLock = (OS_dispatch_group *)v10;

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("ConsumerCoordinator"));
    v12 = objc_claimAutoreleasedReturnValue();
    path = v9->_path;
    v9->_path = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9->_path;
    v27 = 0;
    v17 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v27);
    v18 = v27;

    if ((v17 & 1) == 0)
    {
      hv_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_fault_impl(&dword_21AA1D000, v19, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: failed to create ConsumerCoordinator subdirectory: %@", buf, 0xCu);
      }

    }
    objc_sync_exit(v14);

    v20 = objc_alloc(MEMORY[0x24BE7A610]);
    v21 = (void *)objc_opt_new();
    v22 = objc_msgSend(v20, "initWithGuardedData:", v21);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v22;

    objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.proactive.ProactiveHarvesting.HVConsumerCoordinator.serialQueue", 9);
    v24 = objc_claimAutoreleasedReturnValue();
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v9->_queues, a3);
    -[HVQueues registerQueueObserver:dispatchQueue:](v9->_queues, "registerQueueObserver:dispatchQueue:", v9, v9->_serialQueue);

  }
  return v9;
}

- (BOOL)harvestContentWithMinimumLevelOfService:(unsigned __int8)a3 ignoringDiscretionaryPowerBudget:(BOOL)a4 error:(id *)a5 shouldContinueBlock:(id)a6
{
  int v7;
  uint64_t (**v9)(_QWORD);
  NSObject *v10;
  uint64_t (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  NSObject *waitingForLock;
  dispatch_time_t v15;
  BOOL v16;
  _PASLock *lock;
  BOOL v18;
  int v19;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint8_t *v25;
  BOOL v26;
  char v27;
  uint8_t v28[16];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v7 = a3;
  v51 = *MEMORY[0x24BDAC8D0];
  v9 = (uint64_t (**)(_QWORD))a6;
  hv_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService: %u", buf, 8u);
  }

  if (v9[2](v9))
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke;
    v33[3] = &unk_24DD7E490;
    v35 = &v41;
    v36 = &v37;
    v11 = v9;
    v33[4] = self;
    v34 = v11;
    v12 = (void *)MEMORY[0x22074FF64](v33);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 1;
    *(_QWORD *)buf = 0;
    v46 = buf;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__657;
    v49 = __Block_byref_object_dispose__658;
    v50 = 0;
    do
    {
      while (!*((_BYTE *)v38 + 24))
      {
        if (!*((_BYTE *)v42 + 24))
        {
          *((_BYTE *)v38 + 24) = 0;
          lock = self->_lock;
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke_97;
          v22[3] = &unk_24DD7E4B8;
          v26 = a4;
          v27 = v7;
          v24 = &v29;
          v22[4] = self;
          v23 = v12;
          v25 = buf;
          -[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v22, v23);

          if (!*((_BYTE *)v42 + 24))
          {
            if (*((_BYTE *)v38 + 24))
              continue;
          }
        }
        goto LABEL_15;
      }
      hv_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEBUG, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService waiting for lock contention to subside...", v28, 2u);
      }

      waitingForLock = self->_waitingForLock;
      v15 = dispatch_time(0, 1000000000);
      v16 = dispatch_group_wait(waitingForLock, v15) != 0;
      *((_BYTE *)v38 + 24) = v16;
    }
    while ((v9[2](v11) & 1) != 0);
    *((_BYTE *)v42 + 24) = 1;
LABEL_15:
    v19 = *((unsigned __int8 *)v30 + 24);
    if (a5 && !*((_BYTE *)v30 + 24))
    {
      *a5 = objc_retainAutorelease(*((id *)v46 + 5));
      v19 = *((unsigned __int8 *)v30 + 24);
    }
    v18 = v19 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)enableConsumptionOfDataSources:(unsigned int)a3
{
  _PASLock *lock;
  _QWORD v6[5];
  unsigned int v7;

  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__HVConsumerCoordinator_enableConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_24DD7E530;
  v6[4] = self;
  v7 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
}

- (void)disableConsumptionOfDataSources:(unsigned int)a3
{
  _PASLock *lock;
  _QWORD v6[5];
  unsigned int v7;

  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__HVConsumerCoordinator_disableConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_24DD7E530;
  v6[4] = self;
  v7 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
}

- (void)restoreConsumptionOfDataSources:(unsigned int)a3
{
  _PASLock *lock;
  _QWORD v6[5];
  unsigned int v7;

  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__HVConsumerCoordinator_restoreConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_24DD7E530;
  v6[4] = self;
  v7 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
}

- (BOOL)registerMailConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerMailConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerMessagesConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__HVConsumerCoordinator_registerMessagesConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerNewsConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerNewsConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerNotesConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HVConsumerCoordinator_registerNotesConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerParsecConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerParsecConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerPhotosConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerPhotosConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerRemindersConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__HVConsumerCoordinator_registerRemindersConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerSafariConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerSafariConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerSiriConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerSiriConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerThirdPartyAppConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__HVConsumerCoordinator_registerThirdPartyAppConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerInteractionConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__HVConsumerCoordinator_registerInteractionConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerUserActivityConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HVConsumerCoordinator_registerUserActivityConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (BOOL)registerNotificationsConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned __int8 v12;

  v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  lock = self->_lock;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__HVConsumerCoordinator_registerNotificationsConsumer_levelOfService___block_invoke;
  v10[3] = &unk_24DD7E580;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

  return 1;
}

- (id)statsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = (void *)objc_opt_new();
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  v5 = MEMORY[0x24BDAC760];
  lock = self->_lock;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke;
  v15[3] = &unk_24DD7E558;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Deferrals"));

  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke_2;
  v13[3] = &unk_24DD7E5A8;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  HVDataSourceRunBlockPerSetBit(-1, v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForLock, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queues, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __40__HVConsumerCoordinator_statsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[12];
  _QWORD v33[12];
  _QWORD v34[8];
  _QWORD v35[10];

  v35[8] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  v4 = (_DWORD *)*((_QWORD *)v3 + 1);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    +[HVPowerBudget defaultBudget](HVPowerBudget, "defaultBudget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "throttlingState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PowerBudget"));

    v34[0] = CFSTR("Allowed & Registered");
    v8 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v4, -1, 1);
    HVDataSourceDescription(v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    v34[1] = CFSTR("Always Allow Override");
    HVDataSourceDescription(v4[2]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    v34[2] = CFSTR("Always Deny Override");
    HVDataSourceDescription(v4[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v9;
    v34[3] = CFSTR("Realtime");
    HVDataSourceDescription(v4[8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v10;
    v34[4] = CFSTR("Periodic Background");
    HVDataSourceDescription(v4[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v11;
    v34[5] = CFSTR("Budgeted");
    HVDataSourceDescription(v4[7]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v12;
    v34[6] = CFSTR("Delayed Budgeted");
    HVDataSourceDescription(v4[6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[6] = v13;
    v34[7] = CFSTR("No Service");
    HVDataSourceDescription(v4[4]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[7] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("Sources"));

  }
  else
  {
    v31 = 0;
  }
  if (v31)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v31, CFSTR("Budget"));
  v32[0] = CFSTR("Mail");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 2));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  v32[1] = CFSTR("Messages");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 3));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v28;
  v32[2] = CFSTR("News");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 4));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v26;
  v32[3] = CFSTR("Notes");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 5));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v25;
  v32[4] = CFSTR("Parsec");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 6));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v24;
  v32[5] = CFSTR("Photos");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 7));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v16;
  v32[6] = CFSTR("Reminders");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v17;
  v32[7] = CFSTR("Safari");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 9));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v18;
  v32[8] = CFSTR("Siri");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 10));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v19;
  v32[9] = CFSTR("ThirdPartyApp");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 11));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v20;
  v32[10] = CFSTR("Interactions");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 12));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v21;
  v32[11] = CFSTR("UserActivities");
  -[HVConsumerCoordinator _statsForConsumers:](*(_QWORD *)(a1 + 32), *((void **)v3 + 13));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, CFSTR("Consumers"));

}

void __40__HVConsumerCoordinator_statsWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HVDataSourceContentState *v9;
  _QWORD v10[4];
  id v11;

  v4 = (void *)objc_opt_new();
  v9 = -[HVDataSourceContentState initWithDataSource:basePath:]([HVDataSourceContentState alloc], "initWithDataSource:basePath:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  -[HVDataSourceContentState deferredContentStates](v9, "deferredContentStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke_3;
  v10[3] = &unk_24DD7F488;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Deferrals"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HVDataSourceDescription(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

void __40__HVConsumerCoordinator_statsWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("Level of Service");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedChar:", objc_msgSend(v6, "levelOfService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("Consumers");
  v13[0] = v8;
  objc_msgSend(v6, "consumers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

}

- (id)_statsForConsumers:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[6];
  __int128 buf;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v20 = v3;
  if (a1)
  {
    v4 = v3;
    v21 = (id)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = v4;
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v24)
    {
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v8, "consumerName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v8);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (unsigned int *)v10;
          if (v8)
            v12 = v10 == 0;
          else
            v12 = 1;
          if (v12)
          {
            hv_default_log_handle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v8;
              _os_log_error_impl(&dword_21AA1D000, v18, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _statsForConsumers failed for %@", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v30[0] = CFSTR("Level of Service");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 8));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf = v22;
            v30[1] = CFSTR("Documents Consumed");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11[3]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *((_QWORD *)&buf + 1) = v13;
            v30[2] = CFSTR("Documents Ignored");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11[4]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v14;
            v30[3] = CFSTR("Number of Extractions");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11[5]);
            v23 = v9;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v15;
            v30[4] = CFSTR("Number of Interruptions");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11[6]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v16;
            v30[5] = CFSTR("Errors Reported");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11[7]);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v17;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v30, 6);
            v18 = objc_claimAutoreleasedReturnValue();

            v9 = v23;
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v23);
          }

        }
        v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v24);
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __70__HVConsumerCoordinator_registerNotificationsConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 14);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 0x4000);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 0x8000);
}

- (void)_registerConsumer:(uint64_t)a3 levelOfService:(id *)a4 consumerMapTableOut:
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  if (a1)
  {
    v12 = v7;
    if (!a4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerConsumer_levelOfService_consumerMapTableOut_, a1, CFSTR("HVConsumerCoordinator.m"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("consumerMapTableOut"));

    }
    if (!*a4)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *a4;
      *a4 = (id)v8;

    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setLevelOfService:", a3);
    objc_msgSend(*a4, "setObject:forKey:", v10, v12);

    v7 = v12;
  }

}

void __69__HVConsumerCoordinator_registerUserActivityConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 13);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 4096);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 0x2000);
}

void __68__HVConsumerCoordinator_registerInteractionConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 12);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 2048);
}

void __70__HVConsumerCoordinator_registerThirdPartyAppConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 11);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 1024);
}

void __61__HVConsumerCoordinator_registerSiriConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 10);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 512);
}

void __63__HVConsumerCoordinator_registerSafariConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 9);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 256);
}

void __66__HVConsumerCoordinator_registerRemindersConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 8);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 128);
}

void __63__HVConsumerCoordinator_registerPhotosConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 7);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 32);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 64);
}

void __63__HVConsumerCoordinator_registerParsecConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 6);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 16);
}

void __62__HVConsumerCoordinator_registerNotesConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 5);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 8);
}

void __61__HVConsumerCoordinator_registerNewsConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 4);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 4);
}

void __65__HVConsumerCoordinator_registerMessagesConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 3);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 2);
}

void __61__HVConsumerCoordinator_registerMailConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  int8x16_t *v5;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 2);
  v5 = (int8x16_t *)*((_QWORD *)v4 + 1);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, *(unsigned __int8 *)(a1 + 48), 1);
}

void __57__HVConsumerCoordinator_restoreConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  int8x8_t *v7;
  NSObject *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: restoreConsumptionOfDataSources: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  v7 = (int8x8_t *)v4[1];

  if (v7)
  {
    v7[1] = vand_s8(v7[1], (int8x8_t)vdup_n_s32(~*(_DWORD *)(a1 + 40)));
    hv_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      HVDataSourceDescription(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

void __57__HVConsumerCoordinator_disableConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: disableConsumptionOfDataSources: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v7 = (_DWORD *)v4[1];

  if (v7)
  {
    v8 = *(_DWORD *)(a1 + 40);
    v9 = v7[2] & ~v8;
    v10 = v7[3] | v8;
    v7[2] = v9;
    v7[3] = v10;
    hv_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      HVDataSourceDescription(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

void __56__HVConsumerCoordinator_enableConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  _DWORD *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: enableConsumptionOfDataSources: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  v7 = (_DWORD *)v4[1];

  if (v7)
  {
    v8 = *(_DWORD *)(a1 + 40);
    v9 = v7[3] & ~v8;
    v7[2] |= v8;
    v7[3] = v9;
    hv_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      HVDataSourceDescription(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v13, 0xCu);

    }
  }
}

uint64_t __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = a1 + 6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v3 = a1 + 7;
    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) != 0)
      {
        if (!dispatch_group_wait(*(dispatch_group_t *)(a1[4] + 40), 0))
          return 1;
        hv_default_log_handle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService interruptedByLockContention, will unlock to let other threads use the lock for a bit", v6, 2u);
        }
        v1 = v3;
      }
      else
      {
        hv_default_log_handle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService shouldContinueBlock returned NO", buf, 2u);
        }
      }

      result = 0;
      *(_BYTE *)(*(_QWORD *)(*v1 + 8) + 24) = 1;
      return result;
    }
  }
  return 0;
}

void __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke_97(uint64_t a1, void *a2)
{
  _DWORD **v3;
  _DWORD **v4;
  _DWORD *v5;
  int v6;
  NSObject *v7;
  unsigned int v8;
  _DWORD *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id *v18;
  void *v19;
  BOOL v20;
  _DWORD *v21;
  id obj;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_4;
  v5 = v3[1];
  if (v5)
  {
    if (*((_BYTE *)v5 + 40))
    {
LABEL_4:
      v6 = 0;
      goto LABEL_6;
    }
    v6 = 1;
    *((_BYTE *)v5 + 40) = 1;
  }
  else
  {
    v6 = 1;
  }
LABEL_6:
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEBUG, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService acquired lock", buf, 2u);
  }

  v8 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v4[1], -1, *(unsigned __int8 *)(a1 + 65));
  if (*(_BYTE *)(a1 + 65) == 1)
  {
    v9 = v4[1];
    if (v9)
      v10 = ~v9[3];
    else
      v10 = 0;
  }
  else
  {
    v10 = v8;
  }
  hv_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HVDataSourceDescription(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService: sources after applying budget: %{public}@", buf, 0xCu);

  }
  v13 = *(unsigned __int8 *)(a1 + 65);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v16 + 40);
  v18 = (id *)(v16 + 40);
  v17 = v19;
  obj = v19;
  if (v14)
  {
    v20 = -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v14, v10, v13, 0, v4, v15, &obj);
    v17 = obj;
  }
  else
  {
    v20 = 0;
  }
  objc_storeStrong(v18, v17);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;
  if (v6)
  {
    v21 = v4[1];
    if (v21)
      *((_BYTE *)v21 + 40) = 0;
  }

}

+ (id)defaultCoordinator
{
  if (defaultCoordinator__pasOnceToken2 != -1)
    dispatch_once(&defaultCoordinator__pasOnceToken2, &__block_literal_global_694);
  return (id)defaultCoordinator__pasExprOnceResult;
}

void __43__HVConsumerCoordinator_defaultCoordinator__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)defaultCoordinator__pasExprOnceResult;
  defaultCoordinator__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
