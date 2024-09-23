@implementation SCWDatabase

- (void)addObserver:(id)a3 forZone:(id)a4
{
  id v6;
  os_unfair_lock_s *p_observersLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[SCWDatabase observersByZoneName](self, "observersByZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    -[SCWDatabase observersByZoneName](self, "observersByZoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_msgSend(v9, "addObject:", v11);
  os_unfair_lock_unlock(p_observersLock);

}

void __47__SCWDatabase__reloadSnapshotOfZone_fromStore___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "zoneName", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "database:didChangeZone:from:to:", v8, v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[6];

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2;
  v5[3] = &unk_1E5AF2148;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  objc_msgSend(v3, "enqueueBlock:", v5);

}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2_30(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_3;
  v5[3] = &unk_1E5AF1E38;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "readZone:withAccessor:", v4, v5);

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_zonesNeedingFetch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_10;
    v4[3] = &unk_1E5AF1F00;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "enqueueBlock:", v4);

  }
}

- (SCWAsyncSerialQueue)ckSyncQueue
{
  return self->_ckSyncQueue;
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[6];
  _QWORD aBlock[5];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3;
  aBlock[3] = &unk_1E5AF20D0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_49;
    v9[3] = &unk_1E5AF2120;
    v8 = v6;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = v3;
    objc_msgSend(v7, "accountInfoWithCompletionHandler:", v9);

  }
  else
  {
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_48;
    v12[3] = &unk_1E5AF20F8;
    v12[4] = v5;
    v12[5] = v3;
    __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_48((uint64_t)v12);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_15(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_17;
    v6[3] = &unk_1E5AF1ED8;
    v7 = v3;
    objc_msgSend(v5, "_saveZonesToContainer:allowRecoveryAttempt:completion:", v4, 1, v6);

  }
  else
  {
    v3[2](v3);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_zonesNeedingSave");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_15;
    v4[3] = &unk_1E5AF1F00;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "enqueueBlock:", v4);

  }
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_10(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_12;
    v6[3] = &unk_1E5AF1ED8;
    v7 = v3;
    objc_msgSend(v5, "_fetchZoneChangesForZones:completion:", v4, v6);

  }
  else
  {
    v3[2](v3);
  }

}

- (int64_t)status
{
  return self->_status;
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SCWDatabaseLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("disabled");
    if (a2)
      v5 = CFSTR("enabled");
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "finished database startup with syncing %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (a2)
    v6 = 1;
  else
    v6 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", v6);
  objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "underlyingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCloudBackupEnabled:", a2 ^ 1u);

}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (id)_zonesNeedingSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SCWDatabase schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[SCWDatabase storeCoordinator](self, "storeCoordinator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __32__SCWDatabase__zonesNeedingSave__block_invoke;
        v15[3] = &unk_1E5AF2598;
        v16 = v3;
        v17 = v11;
        objc_msgSend(v12, "readZone:withAccessor:", v11, v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_zonesNeedingFetch
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v15[6];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SCWDatabase schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
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
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[SCWDatabase storeCoordinator](self, "storeCoordinator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __33__SCWDatabase__zonesNeedingFetch__block_invoke;
        v15[3] = &unk_1E5AF1EB0;
        v15[4] = self;
        v15[5] = v11;
        v16 = v3;
        objc_msgSend(v12, "readZone:withAccessor:", v11, v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_enqueueStartupSequenceWithFeatures:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];

  -[SCWDatabase startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke;
  v19[3] = &unk_1E5AF2148;
  v19[4] = self;
  v19[5] = a3;
  objc_msgSend(v5, "enqueueStartupBlock:", v19);

  -[SCWDatabase startupQueue](self, "startupQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_51;
  v18[3] = &unk_1E5AF20A8;
  v18[4] = self;
  objc_msgSend(v7, "enqueueStartupBlock:", v18);

  if ((a3 & 4) != 0)
  {
    -[SCWDatabase startupQueue](self, "startupQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53;
    v17[3] = &unk_1E5AF20A8;
    v17[4] = self;
    objc_msgSend(v8, "enqueueStartupBlock:", v17);

  }
  -[SCWDatabase startupQueue](self, "startupQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3_55;
  v16[3] = &unk_1E5AF20A8;
  v16[4] = self;
  objc_msgSend(v9, "enqueueStartupBlock:", v16);

  -[SCWDatabase startupQueue](self, "startupQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_8;
  v15[3] = &unk_1E5AF1E88;
  v15[4] = self;
  objc_msgSend(v10, "executeAfterStartup:", v15);

  -[SCWDatabase startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_13;
  v14[3] = &unk_1E5AF1E88;
  v14[4] = self;
  objc_msgSend(v11, "executeAfterStartup:", v14);

  if ((a3 & 2) != 0)
  {
    -[SCWDatabase startupQueue](self, "startupQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_18;
    v13[3] = &unk_1E5AF1E88;
    v13[4] = self;
    objc_msgSend(v12, "executeAfterStartup:", v13);

  }
}

- (SCWStartupQueue)startupQueue
{
  return self->_startupQueue;
}

- (void)readContentsOfZone:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  dispatch_block_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];

  v6 = a3;
  v7 = a4;
  -[SCWDatabase schema](self, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schemaForZoneName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy_;
    v22[4] = __Block_byref_object_dispose_;
    v23 = 0;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_29;
    block[3] = &unk_1E5AF1E10;
    v20 = v7;
    v21 = v22;
    v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    -[SCWDatabase startupQueue](self, "startupQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2_30;
    v14[3] = &unk_1E5AF1E60;
    v14[4] = self;
    v15 = v9;
    v18 = v22;
    v16 = v6;
    v13 = v11;
    v17 = v13;
    objc_msgSend(v12, "executeAfterStartup:", v14);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke;
    v24[3] = &unk_1E5AF1DE8;
    v24[4] = self;
    v24[5] = v7;
    __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke((uint64_t)v24);
  }

}

- (SCWDatabaseSchema)schema
{
  return self->_schema;
}

- (id)_emptyZonesNeedingFirstSync
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v15[6];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SCWDatabase schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
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
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[SCWDatabase storeCoordinator](self, "storeCoordinator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __42__SCWDatabase__emptyZonesNeedingFirstSync__block_invoke;
        v15[3] = &unk_1E5AF1EB0;
        v15[4] = self;
        v15[5] = v11;
        v16 = v3;
        objc_msgSend(v12, "readZone:withAccessor:", v11, v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (SCWDatabaseStoreCoordinator)storeCoordinator
{
  return self->_storeCoordinator;
}

uint64_t __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "zoneSnapshotsByZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, *(dispatch_block_t *)(a1 + 48));

}

void __42__SCWDatabase__emptyZonesNeedingFirstSync__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_zoneWithSchema:zoneStore:", *(_QWORD *)(a1 + 40), a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "needsFirstSync"))
  {
    objc_msgSend(v5, "clientRecords");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

void __33__SCWDatabase__zonesNeedingFetch__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_zoneWithSchema:zoneStore:", *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDirty"))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));

}

void __32__SCWDatabase__zonesNeedingSave__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "pendingCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_reloadSnapshotOfZone:(id)a3 fromStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SCWZoneSnapshot *v12;
  void *v13;
  SCWZoneSnapshot *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v27;
  SCWDatabase *v28;
  id v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  -[SCWDatabase zoneSnapshotsByZoneName](self, "zoneSnapshotsByZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCWDatabase _zoneWithSchema:zoneStore:](self, "_zoneWithSchema:zoneStore:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [SCWZoneSnapshot alloc];
  objc_msgSend(v11, "clientRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SCWZoneSnapshot initWithZoneSchema:records:](v12, "initWithZoneSchema:records:", v6, v13);
  -[SCWDatabase zoneSnapshotsByZoneName](self, "zoneSnapshotsByZoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  -[SCWDatabase zoneSnapshotsByZoneName](self, "zoneSnapshotsByZoneName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToSnapshot:", v19) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[SCWDatabase observersByZoneName](self, "observersByZoneName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    os_unfair_lock_unlock(&self->_observersLock);
    -[SCWDatabase callbackQueue](self, "callbackQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SCWDatabase__reloadSnapshotOfZone_fromStore___block_invoke;
    block[3] = &unk_1E5AF2688;
    v27 = v23;
    v28 = self;
    v29 = v6;
    v30 = v10;
    v31 = v19;
    v25 = v23;
    dispatch_async(v24, block);

  }
}

- (NSMutableDictionary)zoneSnapshotsByZoneName
{
  return self->_zoneSnapshotsByZoneName;
}

- (id)_zoneWithSchema:(id)a3 zoneStore:(id)a4
{
  id v5;
  id v6;
  SCWZone *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SCWZone initWithSchema:store:]([SCWZone alloc], "initWithSchema:store:", v6, v5);

  return v7;
}

- (NSMutableDictionary)observersByZoneName
{
  return self->_observersByZoneName;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 mergeHandlers:(id)a6 containerProxy:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SCWDatabase *v17;
  SCWDatabase *v18;
  uint64_t v19;
  NSArray *mergeHandlers;
  SCWStartupQueue *v21;
  SCWStartupQueue *startupQueue;
  SCWAsyncSerialQueue *v23;
  SCWAsyncSerialQueue *ckSyncQueue;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *callbackQueue;
  NSMutableDictionary *v28;
  NSMutableDictionary *observersByZoneName;
  NSMutableDictionary *v30;
  NSMutableDictionary *zoneSnapshotsByZoneName;
  SCWFauxDatabaseStoreCoordinator *v32;
  SCWDatabaseStoreCoordinator *storeCoordinator;
  SCWContainerProxying *v34;
  void *container;
  id v36;
  uint64_t v37;
  SCWContainerProxying *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  SCWZoneSnapshot *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v58.receiver = self;
  v58.super_class = (Class)SCWDatabase;
  v17 = -[SCWDatabase init](&v58, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_schema, a3);
    v19 = objc_msgSend(v15, "copy");
    mergeHandlers = v18->_mergeHandlers;
    v18->_mergeHandlers = (NSArray *)v19;

    v21 = -[SCWStartupQueue initWithDeferredStartup:]([SCWStartupQueue alloc], "initWithDeferredStartup:", 1);
    startupQueue = v18->_startupQueue;
    v18->_startupQueue = v21;

    v23 = -[SCWAsyncSerialQueue initWithQualityOfService:]([SCWAsyncSerialQueue alloc], "initWithQualityOfService:", 17);
    ckSyncQueue = v18->_ckSyncQueue;
    v18->_ckSyncQueue = v23;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("SCWDatabase.callback", v25);
    callbackQueue = v18->_callbackQueue;
    v18->_callbackQueue = (OS_dispatch_queue *)v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByZoneName = v18->_observersByZoneName;
    v18->_observersByZoneName = v28;

    v18->_observersLock._os_unfair_lock_opaque = 0;
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    zoneSnapshotsByZoneName = v18->_zoneSnapshotsByZoneName;
    v18->_zoneSnapshotsByZoneName = v30;

    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEC607A8))
      v32 = (SCWFauxDatabaseStoreCoordinator *)v14;
    else
      v32 = -[SCWFauxDatabaseStoreCoordinator initWithDatabaseStore:]([SCWFauxDatabaseStoreCoordinator alloc], "initWithDatabaseStore:", v14);
    storeCoordinator = v18->_storeCoordinator;
    v18->_storeCoordinator = (SCWDatabaseStoreCoordinator *)v32;

    v52 = v15;
    v53 = v14;
    v51 = v16;
    if (v16)
    {
      v34 = (SCWContainerProxying *)v16;
      container = v18->_container;
      v18->_container = v34;
    }
    else
    {
      objc_msgSend(v13, "containerID");
      container = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc_init(MEMORY[0x1E0C94C50]);
      objc_msgSend(v36, "setCaptureResponseHTTPHeaders:", 1);
      objc_msgSend(v36, "setUseZoneWidePCS:", 1);
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", container, v36);
      v38 = v18->_container;
      v18->_container = (SCWContainerProxying *)v37;

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v39 = v13;
    objc_msgSend(v13, "zoneSchemas");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v55 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v46 = -[SCWZoneSnapshot initWithZoneSchema:records:]([SCWZoneSnapshot alloc], "initWithZoneSchema:records:", v45, 0);
          -[SCWDatabase zoneSnapshotsByZoneName](v18, "zoneSnapshotsByZoneName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "zoneName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v48);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v42);
    }

    -[SCWDatabase storeCoordinator](v18, "storeCoordinator");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObserver:", v18);

    -[SCWDatabase _enqueueStartupSequenceWithFeatures:](v18, "_enqueueStartupSequenceWithFeatures:", a5);
    v13 = v39;
    v15 = v52;
    v14 = v53;
    v16 = v51;
  }

  return v18;
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 features:(int64_t)a5 containerProxy:(id)a6
{
  return -[SCWDatabase initWithSchema:store:features:mergeHandlers:containerProxy:](self, "initWithSchema:store:features:mergeHandlers:containerProxy:", a3, a4, a5, MEMORY[0x1E0C9AA60], a6);
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 containerProxy:(id)a6
{
  return -[SCWDatabase initWithSchema:store:features:mergeHandlers:containerProxy:](self, "initWithSchema:store:features:mergeHandlers:containerProxy:", a3, a4, 0, MEMORY[0x1E0C9AA60], a6);
}

- (SCWDatabase)initWithSchema:(id)a3 store:(id)a4 migrationPlan:(id)a5 features:(int64_t)a6 containerProxy:(id)a7
{
  return -[SCWDatabase initWithSchema:store:features:mergeHandlers:containerProxy:](self, "initWithSchema:store:features:mergeHandlers:containerProxy:", a3, a4, 0, MEMORY[0x1E0C9AA60], a7);
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v4 = *(id *)(a1 + 40);
    dispatch_async(v2, block);

  }
}

void __44__SCWDatabase_readContentsOfZone_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SCWErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)modifyContentsOfZone:(id)a3 withCommand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  -[SCWDatabase schema](self, "schema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schemaForZoneName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SCWDatabase startupQueue](self, "startupQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_32;
    v11[3] = &unk_1E5AF1F28;
    v11[4] = self;
    v12 = v9;
    v13 = v7;
    objc_msgSend(v10, "executeAfterStartup:", v11);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke;
    v14[3] = &unk_1E5AF1E88;
    v14[4] = v6;
    __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke((uint64_t)v14);
  }

}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_32(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_2;
  v12[3] = &unk_1E5AF1EB0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v2, "writeZone:withAccessor:", v4, v12);

  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_3;
  v10[3] = &unk_1E5AF1F00;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  objc_msgSend(v8, "enqueueBlock:", v10);

}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPendingCommands:", v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "_reloadSnapshotOfZone:fromStore:", *(_QWORD *)(a1 + 48), v4);
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_3(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_5;
    v6[3] = &unk_1E5AF1ED8;
    v7 = v3;
    objc_msgSend(v5, "_saveZoneToContainer:allowRecoveryAttempt:completion:", v4, 1, v6);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeObserver:(id)a3 forZone:(id)a4
{
  os_unfair_lock_s *p_observersLock;
  id v7;
  id v8;
  void *v9;
  id v10;

  p_observersLock = &self->_observersLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[SCWDatabase observersByZoneName](self, "observersByZoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeObject:", v8);
  os_unfair_lock_unlock(p_observersLock);

}

- (void)handleRemoteNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SCWDatabase startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke;
  v11[3] = &unk_1E5AF2008;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "executeAfterStartup:", v11);

}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  objc_msgSend(a1[4], "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_2;
  v3[3] = &unk_1E5AF1FE0;
  v3[4] = a1[4];
  v5 = a1[6];
  v4 = a1[5];
  objc_msgSend(v2, "enqueueBlock:", v3);

}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[7];
  _QWORD v19[7];

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "notificationType") == 4
      && (objc_msgSend(v4, "subscriptionID"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DatabaseSubscription")),
          v5,
          (v6 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeWithAccessor:", &__block_literal_global_39);

      v8 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_8;
      v15[3] = &unk_1E5AF1FB8;
      v16 = v3;
      v9 = *(id *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 32);
      v17 = v9;
      v15[4] = v10;
      objc_msgSend(v8, "_fetchDatabaseAndZoneChangesWithCompletion:", v15);

      v11 = v16;
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5;
      v18[3] = &unk_1E5AF1F50;
      v13 = *(void **)(a1 + 48);
      v18[5] = v3;
      v18[6] = v13;
      v18[4] = *(_QWORD *)(a1 + 32);
      v14 = v13;
      v11 = v3;
      __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5((uint64_t)v18);

    }
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3;
    v19[3] = &unk_1E5AF1F50;
    v12 = *(void **)(a1 + 48);
    v19[5] = v3;
    v19[6] = v12;
    v19[4] = *(_QWORD *)(a1 + 32);
    v11 = v12;
    v4 = v3;
    __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3((uint64_t)v19);
  }

}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_4;
    block[3] = &unk_1E5AF1DC0;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);

  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_6;
    block[3] = &unk_1E5AF1DC0;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);

  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastDirtyDate:", v4);

}

void __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_9;
    v5[3] = &unk_1E5AF1DE8;
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __51__SCWDatabase_handleRemoteNotification_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)pollForChangesWithCondition:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SCWDatabase startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke;
  v11[3] = &unk_1E5AF2008;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "executeAfterStartup:", v11);

}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  objc_msgSend(a1[4], "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_2;
  v3[3] = &unk_1E5AF1FE0;
  v3[4] = a1[4];
  v5 = a1[6];
  v4 = a1[5];
  objc_msgSend(v2, "enqueueBlock:", v3);

}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_2(id *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  NSObject *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  _QWORD block[4];
  id v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[7];

  v3 = a2;
  if (objc_msgSend(a1[4], "status") == 1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    objc_msgSend(a1[4], "storeCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_5;
    v19[3] = &unk_1E5AF2030;
    v20 = a1[5];
    v21 = &v22;
    objc_msgSend(v4, "readWithAccessor:", v19);

    if (*((_BYTE *)v23 + 24))
    {
      v6 = a1[4];
      v16[0] = v5;
      v16[1] = 3221225472;
      v16[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_6;
      v16[3] = &unk_1E5AF1FB8;
      v17 = v3;
      v7 = a1[6];
      v8 = a1[4];
      v18 = v7;
      v16[4] = v8;
      objc_msgSend(v6, "_fetchDatabaseAndZoneChangesWithCompletion:", v16);
      v9 = (id *)&v17;
      v10 = v18;
    }
    else
    {
      v3[2](v3);
      if (!a1[6])
      {
LABEL_8:

        _Block_object_dispose(&v22, 8);
        goto LABEL_9;
      }
      objc_msgSend(a1[4], "callbackQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_8;
      block[3] = &unk_1E5AF1DC0;
      v9 = &v15;
      v15 = a1[6];
      dispatch_async(v10, block);
    }

    goto LABEL_8;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3;
  v26[3] = &unk_1E5AF1F50;
  v11 = a1[6];
  v26[5] = v3;
  v26[6] = v11;
  v26[4] = a1[4];
  v12 = v11;
  v13 = v3;
  __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3((uint64_t)v26);

LABEL_9:
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_4;
    block[3] = &unk_1E5AF1DC0;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);

  }
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "lastSyncDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastSyncDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "minIntervalSinceLastSync");
  v10 = v9;

  if (v8 >= v10)
LABEL_3:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_7;
    v5[3] = &unk_1E5AF1DE8;
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __54__SCWDatabase_pollForChangesWithCondition_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkSyncingEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWDatabase startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF1D28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5AF1D50;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enqueueBlock:", v4);

}

void __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_3;
    v5[3] = &unk_1E5AF1DE8;
    v4 = *(id *)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

uint64_t __49__SCWDatabase_checkSyncingEnabledWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status") == 1);
}

- (void)savePendingChangesToServerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWDatabase startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF1D28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5AF2058;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enqueueBlock:", v4);

}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[7];

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "schema");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneSchemas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_5;
    v13[3] = &unk_1E5AF1FB8;
    v14 = v3;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v15 = v7;
    v13[4] = v8;
    objc_msgSend(v4, "_saveZonesToContainer:allowRecoveryAttempt:completion:", v6, 1, v13);

    v9 = v14;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3;
    v16[3] = &unk_1E5AF1F50;
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v16[5] = v3;
    v16[6] = v10;
    v16[4] = v11;
    v12 = v10;
    v9 = v3;
    __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3((uint64_t)v16);

  }
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_4;
    block[3] = &unk_1E5AF1DC0;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, block);

  }
}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SCWErrorDomain"), 3, MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_6;
    v5[3] = &unk_1E5AF1DE8;
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __56__SCWDatabase_savePendingChangesToServerWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)synchronize
{
  void *v3;
  _QWORD v4[5];

  -[SCWDatabase storeCoordinator](self, "storeCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__SCWDatabase_synchronize__block_invoke;
  v4[3] = &unk_1E5AF2080;
  v4[4] = self;
  objc_msgSend(v3, "reloadWithAccessor:", v4);

}

void __26__SCWDatabase_synchronize__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "schema", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneSchemas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v5, "zoneStoreForSchema:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_reloadSnapshotOfZone:fromStore:", v12, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)t_flushChangesWithTimeout:(double)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v10[5];
  dispatch_semaphore_t v11;

  v5 = dispatch_semaphore_create(0);
  -[SCWDatabase startupQueue](self, "startupQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke;
  v10[3] = &unk_1E5AF1C90;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "executeAfterStartup:", v10);

  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  LOBYTE(v5) = dispatch_semaphore_wait(v7, v8) == 0;

  return (char)v5;
}

void __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke_2;
  v3[3] = &unk_1E5AF20A8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enqueueBlock:", v3);

}

void __41__SCWDatabase_t_flushChangesWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void (**v3)(void);

  v2 = *(NSObject **)(a1 + 32);
  v3 = a2;
  dispatch_semaphore_signal(v2);
  v3[2]();

}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "database does not have syncing feature enabled", v4, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SCWDatabaseLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_49_cold_1();

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "schema");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "requiresDeviceToDeviceEncryption");

    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_msgSend(v5, "accountStatus");
    if (v9)
    {
      if (v11 == 1)
        v12 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
      else
        v12 = 0;
    }
    else
    {
      v12 = v11 == 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_52;
  v6[3] = &unk_1E5AF2170;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "readWithAccessor:", v6);

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id obj;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v25 = *(_QWORD *)v31;
    v26 = v3;
    v24 = a1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v3, "zoneStoreForSchema:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_reloadSnapshotOfZone:fromStore:", v10, v12);

        objc_msgSend(v3, "zoneStoreForSchema:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zoneSnapshotsByZoneName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        SCWDatabaseLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "zoneName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "serverRecords");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v29, "count");
          objc_msgSend(v16, "allRecords");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v7;
          v21 = objc_msgSend(v19, "count");
          objc_msgSend(v13, "pendingCommands");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "descriptionOfContents");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v35 = v18;
          v36 = 2048;
          v37 = v28;
          v38 = 2048;
          v39 = v21;
          v7 = v20;
          v40 = 2114;
          v41 = v22;
          v42 = 2114;
          v43 = v23;
          _os_log_impl(&dword_1ABCEF000, v17, OS_LOG_TYPE_DEFAULT, "loaded zone %{public}@ from disk with %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);

          a1 = v24;
          v3 = v26;

          v8 = v25;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_53(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "storeCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_54;
  v6[3] = &unk_1E5AF2198;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "writeWithAccessor:", v6);

  v4[2](v4);
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_2_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "schema", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v3, "zoneStoreForSchema:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_squashZoneForMerge:zoneStore:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_3_55(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  void (**v8)(_QWORD);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_emptyZonesNeedingFirstSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_5;
    v6[3] = &unk_1E5AF1FE0;
    v6[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v7 = v4;
    objc_msgSend(v5, "enqueueBlock:", v6);

  }
  else
  {
    v3[2](v3);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(void);
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_7;
    v10[3] = &unk_1E5AF21C0;
    v11 = v3;
    v12 = *(id *)(a1 + 48);
    v6 = v3;
    objc_msgSend(v4, "_fetchZoneChangesForZones:completion:", v5, v10);

    v7 = v11;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void (*)(void))v3[2];
    v7 = v3;
    v9();
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }

}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_18(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "ckSyncQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_19;
  v3[3] = &unk_1E5AF20A8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enqueueBlock:", v3);

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_19(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C94F50]);
    objc_msgSend(v4, "setShouldSendContentAvailable:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94CB8]), "initWithSubscriptionID:", CFSTR("DatabaseSubscription"));
    objc_msgSend(v5, "setNotificationInfo:", v4);
    v6 = objc_alloc_init(MEMORY[0x1E0C94F28]);
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubscriptionsToSave:", v7);

    objc_msgSend(v6, "setModifySubscriptionsCompletionBlock:", &__block_literal_global_62);
    objc_msgSend(*(id *)(a1 + 32), "_runCKOperation:", v6);
    v3[2](v3);

  }
  else
  {
    v3[2](v3);
  }

}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  NSObject *v5;

  v4 = a4;
  if (v4)
  {
    SCWDatabaseLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21_cold_1();

  }
}

- (void)_fetchDatabaseAndZoneChangesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke;
  v6[3] = &unk_1E5AF2208;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SCWDatabase _fetchDatabaseChangesWithCompletion:](self, "_fetchDatabaseChangesWithCompletion:", v6);

}

void __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD);

  if (a2)
  {
    v4 = (void (**)(id, _QWORD))*(id *)(a1 + 40);
    v4[2](v4, a2);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_zonesNeedingFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5AF1ED8;
    v8 = (void (**)(id, _QWORD))*(id *)(a1 + 40);
    objc_msgSend(v5, "_fetchZoneChangesForZones:completion:", v6, v7);

    v4 = v8;
  }

}

uint64_t __58__SCWDatabase__fetchDatabaseAndZoneChangesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchDatabaseChangesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  SCWDatabaseLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABCEF000, v5, OS_LOG_TYPE_DEFAULT, "will fetch database changes", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  -[SCWDatabase storeCoordinator](self, "storeCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke;
  v18[3] = &unk_1E5AF2230;
  v18[4] = buf;
  objc_msgSend(v6, "readWithAccessor:", v18);

  v8 = objc_alloc_init(MEMORY[0x1E0C94DB0]);
  objc_msgSend(v8, "setPreviousServerChangeToken:", *((_QWORD *)v20 + 5));
  objc_msgSend(v8, "setFetchAllChanges:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2;
  v16[3] = &unk_1E5AF2258;
  v16[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(v8, "setRecordZoneWithIDChangedBlock:", v16);
  objc_msgSend(v8, "setRecordZoneWithIDWasPurgedBlock:", &__block_literal_global_68);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_69;
  v12[3] = &unk_1E5AF2310;
  v12[4] = self;
  v15 = buf;
  v10 = v9;
  v13 = v10;
  v11 = v4;
  v14 = v11;
  objc_msgSend(v8, "setFetchDatabaseChangesCompletionBlock:", v12);
  -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v8);

  _Block_object_dispose(buf, 8);
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "serverChangeToken");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SCWDatabaseLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "fetching database changes reported a change to zone %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schemaForZoneName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_65;
    v9[3] = &unk_1E5AF1E88;
    v9[4] = v3;
    __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_65((uint64_t)v9);
  }

}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "ignoring change to unknown zone: %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_69(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint8_t buf[16];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a2;
  v7 = a4;
  v8 = v7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (v7)
  {
    v9 = objc_msgSend(v7, "sc_hasUnderlyingErrorCode:", 21);
    SCWDatabaseLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABCEF000, v11, OS_LOG_TYPE_DEFAULT, "encountered expired change token for database", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
      v11 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_72;
      v14[3] = &unk_1E5AF22E8;
      v14[4] = *(_QWORD *)(a1 + 56);
      v14[5] = &v21;
      -[NSObject writeWithAccessor:](v11, "writeWithAccessor:", v14);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_69_cold_1();
    }
  }
  else
  {
    SCWDatabaseLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABCEF000, v12, OS_LOG_TYPE_DEFAULT, "successfully fetched database changes", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "storeCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_70;
    v15[3] = &unk_1E5AF22C0;
    v18 = *(_QWORD *)(a1 + 56);
    v16 = v6;
    v17 = *(id *)(a1 + 40);
    v19 = &v21;
    objc_msgSend(v13, "writeWithAccessor:", v15);

    v11 = v16;
  }

  if (*((_BYTE *)v22 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_fetchDatabaseChangesWithCompletion:", *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(&v21, 8);

}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v3, "serverChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "scw_object:isEqualToObject:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastSyncDate:", v6);

    objc_msgSend(v3, "setServerChangeToken:", *(_QWORD *)(a1 + 32));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "zoneStoreForSchema:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setLastDirtyDate:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DE7910];
  v6 = v3;
  objc_msgSend(v3, "serverChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "scw_object:isEqualToObject:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  if ((_DWORD)v4)
  {
    objc_msgSend(v6, "setServerChangeToken:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)_fetchZoneChangesForZones:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  SCWDatabase *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  SCWDatabase *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCWDatabase storeCoordinator](self, "storeCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2;
    v46[3] = &unk_1E5AF2338;
    v29 = v6;
    v47 = v6;
    v48 = v8;
    v12 = v9;
    v49 = v12;
    v13 = v10;
    v50 = v13;
    v14 = v8;
    objc_msgSend(v11, "readWithAccessor:", v46);

    SCWDatabaseLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v12;
      _os_log_impl(&dword_1ABCEF000, v15, OS_LOG_TYPE_DEFAULT, "will fetch changes for zones: %{public}@", buf, 0xCu);
    }

    v16 = objc_alloc_init(MEMORY[0x1E0C94DE8]);
    objc_msgSend(v16, "setRecordZoneIDs:", v14);
    objc_msgSend(v16, "setConfigurationsByRecordZoneID:", v13);
    objc_msgSend(v16, "setFetchAllChanges:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_76;
    v44[3] = &unk_1E5AF2360;
    v19 = v17;
    v45 = v19;
    objc_msgSend(v16, "setRecordWasChangedBlock:", v44);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42[0] = v18;
    v42[1] = 3221225472;
    v42[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2_78;
    v42[3] = &unk_1E5AF2388;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    objc_msgSend(v16, "setRecordWithIDWasDeletedBlock:", v42);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_3;
    v35[3] = &unk_1E5AF2400;
    v36 = v19;
    v37 = v20;
    v38 = self;
    v39 = v13;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v21;
    v28 = v14;
    v22 = v7;
    v41 = v22;
    v23 = v19;
    v24 = v20;
    v25 = v13;
    objc_msgSend(v16, "setRecordZoneFetchCompletionBlock:", v35);
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_86;
    v30[3] = &unk_1E5AF2428;
    v31 = v21;
    v32 = self;
    v33 = v12;
    v34 = v22;
    v26 = v21;
    v27 = v12;
    objc_msgSend(v16, "setFetchRecordZoneChangesCompletionBlock:", v30);
    -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v16);

    v6 = v29;
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "zoneStoreForSchema:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v8, "zoneID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        v12 = *(void **)(a1 + 48);
        objc_msgSend(v8, "zoneName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        v14 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
        objc_msgSend(v9, "serverChangeToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPreviousServerChangeToken:", v15);

        objc_msgSend(v8, "allRecordFieldNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDesiredKeys:", v16);

        v17 = *(void **)(a1 + 56);
        objc_msgSend(v8, "zoneID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v18);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_76(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v17 = v4;
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v17, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

    if (!v8)
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v17, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    v4 = v17;
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_2_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v13, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  if (!v6)
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v13, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SCWZoneDiff *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SCWZoneDiff *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  SCWZoneDiff *v48;
  uint64_t v49;
  id v50;
  id v51;
  _QWORD v52[5];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v37 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "sc_hasUnderlyingErrorCode:", 26))
  {
    if (objc_msgSend(v13, "sc_hasUnderlyingErrorCode:", 21))
    {
      SCWDatabaseLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "zoneName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = (uint64_t)v29;
        _os_log_impl(&dword_1ABCEF000, v28, OS_LOG_TYPE_DEFAULT, "encountered expired change token for zone %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "schema");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "zoneName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "schemaForZoneName:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(*(id *)(a1 + 48), "storeCoordinator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_84;
        v38[3] = &unk_1E5AF23D8;
        v39 = *(id *)(a1 + 56);
        v40 = v10;
        v41 = *(id *)(a1 + 64);
        v42 = v32;
        objc_msgSend(v33, "writeZone:withAccessor:", v42, v38);

      }
      else
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_83;
        v43[3] = &unk_1E5AF1E88;
        v43[4] = v10;
        __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_83((uint64_t)v43);
      }
      v25 = v37;

    }
    else
    {
      v25 = v37;
      if (objc_msgSend(v13, "sc_hasUnderlyingErrorCode:", 112))
      {
        SCWDatabaseLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "zoneName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = (uint64_t)v35;
          _os_log_impl(&dword_1ABCEF000, v34, OS_LOG_TYPE_DEFAULT, "encountered missing identity error fetching changes for zone %{public}@, so attempting to recover", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 48), "_recoverFromIdentityLossWithCompletion:", *(_QWORD *)(a1 + 72));
      }
    }
  }
  else
  {
    v36 = v11;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SCWZoneDiff initWithModifiedRecords:deletedRecordIDs:]([SCWZoneDiff alloc], "initWithModifiedRecords:deletedRecordIDs:", v14, v15);
    SCWDatabaseLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v14, "count");
      v19 = objc_msgSend(v15, "count");
      objc_msgSend(v10, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v54 = v18;
      v55 = 2048;
      v56 = v19;
      v57 = 2114;
      v58 = v20;
      _os_log_impl(&dword_1ABCEF000, v17, OS_LOG_TYPE_DEFAULT, "fetched %lu changed records and %lu deleted records for zone %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "schema");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "schemaForZoneName:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 48), "storeCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_82;
      v44[3] = &unk_1E5AF23B0;
      v45 = *(id *)(a1 + 56);
      v46 = v10;
      v25 = v37;
      v47 = v37;
      v26 = v16;
      v27 = *(_QWORD *)(a1 + 48);
      v48 = v26;
      v49 = v27;
      v50 = v23;
      v51 = *(id *)(a1 + 64);
      objc_msgSend(v24, "writeZone:withAccessor:", v50, v44);

    }
    else
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_81;
      v52[3] = &unk_1E5AF1E88;
      v52[4] = v10;
      __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_81((uint64_t)v52);
      v25 = v37;
    }

    v11 = v36;
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_81(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "ignoring changes to unknown zone %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousServerChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v3, "serverChangeToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "scw_object:isEqualToObject:", v7, v5);

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastSyncDate:", v8);

    objc_msgSend(v3, "setServerChangeToken:", *(_QWORD *)(a1 + 48));
    if ((objc_msgSend(*(id *)(a1 + 56), "isEmpty") & 1) != 0)
    {
      SCWDatabaseLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "zoneName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "no changes to process for zone %{public}@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v3, "applyServerRecordsDiff:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 64), "_reloadSnapshotOfZone:fromStore:", *(_QWORD *)(a1 + 72), v3);
      objc_msgSend(*(id *)(a1 + 64), "zoneSnapshotsByZoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "zoneName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v9 = objc_claimAutoreleasedReturnValue();

      SCWDatabaseLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 72), "zoneName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "serverRecords");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v20, "count");
        -[NSObject allRecords](v9, "allRecords");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(v3, "pendingCommands");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject descriptionOfContents](v9, "descriptionOfContents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v22 = v14;
        v23 = 2048;
        v24 = v15;
        v25 = 2048;
        v26 = v17;
        v27 = 2114;
        v28 = v18;
        v29 = 2114;
        v30 = v19;
        _os_log_impl(&dword_1ABCEF000, v13, OS_LOG_TYPE_DEFAULT, "fetched changes for zone %{public}@ from server resulting in %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "addObject:", *(_QWORD *)(a1 + 72));
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_83(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "ignoring expired change token for unknown zone %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_84(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousServerChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v7, "serverChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "scw_object:isEqualToObject:", v6, v4);

  if ((_DWORD)v5)
  {
    objc_msgSend(v7, "setServerChangeToken:", 0);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
  }

}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    SCWDatabaseLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "retrying fetch changes for zones: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_fetchZoneChangesForZones:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_87;
    v11[3] = &unk_1E5AF1C18;
    v6 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    v13 = v3;
    v14 = v6;
    v7 = v3;
    v8 = v12;
    __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_87((uint64_t)v11);

  }
  else
  {
    SCWDatabaseLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "successfully fetched changes for zones: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_87(uint64_t a1)
{
  NSObject *v2;

  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_87_cold_1(a1, v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_saveZoneToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  SCWDatabase *v24;
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  -[SCWDatabase storeCoordinator](self, "storeCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke;
  v29[3] = &unk_1E5AF2490;
  v29[4] = self;
  v12 = v8;
  v30 = v12;
  v31 = &v39;
  v32 = v38;
  v33 = &v34;
  objc_msgSend(v10, "readZone:withAccessor:", v12, v29);

  if (*((_BYTE *)v35 + 24) && !objc_msgSend((id)v40[5], "isEmpty"))
  {
    SCWDatabaseLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v15;
      _os_log_impl(&dword_1ABCEF000, v14, OS_LOG_TYPE_DEFAULT, "will save zone %{public}@", buf, 0xCu);

    }
    v13 = objc_alloc_init(MEMORY[0x1E0C94F10]);
    objc_msgSend(v13, "setSavePolicy:", 0);
    objc_msgSend(v13, "setAtomic:", objc_msgSend(v12, "isAtomic"));
    objc_msgSend((id)v40[5], "applyToModifyRecordsOperation:", v13);
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_93;
    v22[3] = &unk_1E5AF25C0;
    v28 = a4;
    v25 = v9;
    v16 = v12;
    v23 = v16;
    v24 = self;
    v26 = &v39;
    v27 = v38;
    objc_msgSend(v13, "setModifyRecordsCompletionBlock:", v22);
    v17 = v11;
    v18 = 3221225472;
    v19 = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_105;
    v20 = &unk_1E5AF25E8;
    v21 = v16;
    objc_msgSend(v13, "setRequestCompletedBlock:", &v17);
    -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v13, v17, v18, v19, v20);

  }
  else
  {
    v13 = v9;
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);

}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "_zoneWithSchema:zoneStore:", v4, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientDiff");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "pendingCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v9, "count");

  objc_msgSend(v5, "pendingCommands");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v10, "scw_containsObjectPassingTest:", &__block_literal_global_89);
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldDeferUpload") ^ 1;
  else
    v3 = 1;

  return v3;
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int8x16_t v37;
  int8x16_t v38;
  _QWORD v39[4];
  int8x16_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  __int128 *p_buf;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  id v50;
  _QWORD v51[4];
  int8x16_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      if (objc_msgSend(v9, "sc_hasUnderlyingErrorCode:", 26))
      {
        SCWDatabaseLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "zoneName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1ABCEF000, v11, OS_LOG_TYPE_DEFAULT, "failed to save zone %{public}@ because the zone does not exist, so creating it before trying again", (uint8_t *)&buf, 0xCu);

        }
        v13 = *(void **)(a1 + 32);
        v14 = *(void **)(a1 + 40);
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_96;
        v47[3] = &unk_1E5AF24E0;
        v48 = v13;
        v15 = *(id *)(a1 + 48);
        v49 = *(_QWORD *)(a1 + 40);
        v50 = v15;
        objc_msgSend(v14, "_createZoneInContainerWithSchema:completion:", v48, v47);

      }
      else if (objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 14))
      {
        SCWDatabaseLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "zoneName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v23;
          _os_log_impl(&dword_1ABCEF000, v22, OS_LOG_TYPE_DEFAULT, "encountered merge conflicts saving zone %{public}@, so fetching server changes before trying again", (uint8_t *)&buf, 0xCu);

        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v59 = 0x3032000000;
        v60 = __Block_byref_object_copy_;
        v61 = __Block_byref_object_dispose_;
        v62 = 0;
        objc_msgSend(*(id *)(a1 + 40), "storeCoordinator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = MEMORY[0x1E0C809B0];
        v26 = *(_QWORD *)(a1 + 32);
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_98;
        v46[3] = &unk_1E5AF2508;
        v46[4] = &buf;
        objc_msgSend(v24, "readZone:withAccessor:", v26, v46);

        v27 = *(void **)(a1 + 40);
        v57 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v25;
        v41[1] = 3221225472;
        v41[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_99;
        v41[3] = &unk_1E5AF2570;
        v42 = *(id *)(a1 + 32);
        v29 = *(id *)(a1 + 48);
        v43 = *(_QWORD *)(a1 + 40);
        v44 = v29;
        p_buf = &buf;
        objc_msgSend(v27, "_fetchZoneChangesForZones:completion:", v28, v41);

        _Block_object_dispose(&buf, 8);
      }
      else if (objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 11))
      {
        SCWDatabaseLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "zoneName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_1ABCEF000, v30, OS_LOG_TYPE_DEFAULT, "encountered unknown item saving zone %{public}@, so staging the zone for merge before trying again", (uint8_t *)&buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 40), "storeCoordinator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(int8x16_t *)(a1 + 32);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_104;
        v39[3] = &unk_1E5AF2598;
        v40 = vextq_s8(v38, v38, 8uLL);
        objc_msgSend(v32, "writeZone:withAccessor:", (id)v38.i64[0], v39);

        objc_msgSend(*(id *)(a1 + 40), "_saveZoneToContainer:allowRecoveryAttempt:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 48));
      }
      else
      {
        v33 = objc_msgSend(v10, "sc_hasUnderlyingErrorCode:", 112);
        SCWDatabaseLog();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v33)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "zoneName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v36;
            _os_log_impl(&dword_1ABCEF000, v35, OS_LOG_TYPE_DEFAULT, "encountered missing identity error saving zone %{public}@, so attempting to recover", (uint8_t *)&buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 40), "_recoverFromIdentityLossWithCompletion:", *(_QWORD *)(a1 + 48));
        }
        else
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_93_cold_1(a1);

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    SCWDatabaseLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1ABCEF000, v16, OS_LOG_TYPE_DEFAULT, "successfully saved zone %{public}@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "storeCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_95;
    v51[3] = &unk_1E5AF24B8;
    v37 = *(int8x16_t *)(a1 + 32);
    v19 = (id)v37.i64[0];
    v52 = vextq_s8(v37, v37, 8uLL);
    v55 = *(_QWORD *)(a1 + 56);
    v53 = v7;
    v20 = v8;
    v21 = *(_QWORD *)(a1 + 64);
    v54 = v20;
    v56 = v21;
    objc_msgSend(v18, "writeZone:withAccessor:", v19, v51);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SCWZoneDiff *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_zoneWithSchema:zoneStore:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasSameBaseAsDiff:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
  {
    v6 = -[SCWZoneDiff initWithModifiedRecords:deletedRecordIDs:]([SCWZoneDiff alloc], "initWithModifiedRecords:deletedRecordIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(v3, "applyServerRecordsDiff:", v6);
    objc_msgSend(v3, "clearPendingCommandsUpToCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  }
  else
  {
    SCWDatabaseLog();
    v6 = (SCWZoneDiff *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "zoneName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1ABCEF000, &v6->super, OS_LOG_TYPE_DEFAULT, "not committing save for zone %{public}@ because it was modified in the interim", (uint8_t *)&v8, 0xCu);

    }
  }

}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_97;
    v6[3] = &unk_1E5AF1C18;
    v7 = *(id *)(a1 + 32);
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 48);
    v4 = v7;
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_97((uint64_t)v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_saveZoneToContainer:allowRecoveryAttempt:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 48), 0);
  }

}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_97(uint64_t a1)
{
  NSObject *v2;

  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_97_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "serverChangeToken");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_100;
    v18[3] = &unk_1E5AF1C18;
    v19 = *(id *)(a1 + 32);
    v20 = v3;
    v21 = *(_QWORD *)(a1 + 48);
    v5 = v19;
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_100((uint64_t)v18);

  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    objc_msgSend(*(id *)(a1 + 40), "storeCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_101;
    v11[3] = &unk_1E5AF2508;
    v11[4] = &v12;
    objc_msgSend(v6, "readZone:withAccessor:", v7, v11);

    if (objc_msgSend((id)v13[5], "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
    {
      SCWDatabaseLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "zoneName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        _os_log_impl(&dword_1ABCEF000, v8, OS_LOG_TYPE_DEFAULT, "resetting change token for zone %{public}@ because it's missing server changes but didn't get any when fetching", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "storeCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeZone:withAccessor:", *(_QWORD *)(a1 + 32), &__block_literal_global_103);

    }
    objc_msgSend(*(id *)(a1 + 40), "_saveZoneToContainer:allowRecoveryAttempt:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 48));
    _Block_object_dispose(&v12, 8);

  }
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_100(uint64_t a1)
{
  NSObject *v2;

  SCWDatabaseLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_100_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "serverChangeToken");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_102(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setServerChangeToken:", 0);
}

uint64_t __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_104(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_squashZoneForMerge:zoneStore:", *(_QWORD *)(a1 + 40), a2);
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SCWDatabaseLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "issued request for zone %{public}@ with UUID %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_saveZonesToContainer:(id)a3 allowRecoveryAttempt:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  SCWDatabase *v13;
  id v14;
  BOOL v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_2;
    v11[3] = &unk_1E5AF2610;
    v14 = v9;
    v12 = v8;
    v13 = self;
    v15 = v6;
    -[SCWDatabase _saveZoneToContainer:allowRecoveryAttempt:completion:](self, "_saveZoneToContainer:allowRecoveryAttempt:completion:", v10, v6, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __69__SCWDatabase__saveZonesToContainer_allowRecoveryAttempt_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_saveZonesToContainer:allowRecoveryAttempt:completion:", v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
}

- (void)_squashZoneForMerge:(id)a3 zoneStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  SCWDatabase *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  -[SCWDatabase _reloadSnapshotOfZone:fromStore:](self, "_reloadSnapshotOfZone:fromStore:", v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  -[SCWDatabase zoneSnapshotsByZoneName](self, "zoneSnapshotsByZoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v6;
  objc_msgSend(v6, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = v10;
  objc_msgSend(v10, "allRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        -[SCWDatabase mergeHandlers](v38, "mergeHandlers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v41 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "commandsToMergeRecordWithServer:", v15);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObjectsFromArray:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
          }
          while (v18);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
    }
    while (v12);
  }

  v22 = v35;
  objc_msgSend(v35, "setServerRecords:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v35, "setServerChangeToken:", 0);
  objc_msgSend(v35, "setLastSyncDate:", 0);
  objc_msgSend(v35, "setLastDirtyDate:", 0);
  objc_msgSend(v35, "setPendingCommands:", v7);
  v23 = v36;
  -[SCWDatabase _reloadSnapshotOfZone:fromStore:](v38, "_reloadSnapshotOfZone:fromStore:", v36, v35);
  -[SCWDatabase zoneSnapshotsByZoneName](v38, "zoneSnapshotsByZoneName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "zoneName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  SCWDatabaseLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v36, "zoneName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "serverRecords");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v39, "count");
    objc_msgSend(v26, "allRecords");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    objc_msgSend(v35, "pendingCommands");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptionOfContents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v49 = v28;
    v50 = 2048;
    v51 = v29;
    v52 = 2048;
    v53 = v31;
    v54 = 2114;
    v55 = v32;
    v56 = 2114;
    v57 = v33;
    _os_log_impl(&dword_1ABCEF000, v27, OS_LOG_TYPE_DEFAULT, "finished staging zone %{public}@ for merge resulting in %lu server records, %lu client records, pending commands: %{public}@, and client contents: %{public}@", buf, 0x34u);

    v23 = v36;
    v22 = v35;

  }
}

- (void)_createZoneInContainerWithSchema:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C95088];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(v8, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithZoneName:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRecordZonesToSave:", v13);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__SCWDatabase__createZoneInContainerWithSchema_completion___block_invoke;
  v15[3] = &unk_1E5AF2638;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v12, "setModifyRecordZonesCompletionBlock:", v15);
  -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v12);

}

uint64_t __59__SCWDatabase__createZoneInContainerWithSchema_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_deleteAndRecreateAllZonesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  SCWDatabase *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  -[SCWDatabase schema](self, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordZoneIDsToDelete:", v7);

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke;
  v12 = &unk_1E5AF2660;
  v13 = self;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v5, "setModifyRecordZonesCompletionBlock:", &v9);
  -[SCWDatabase _runCKOperation:](self, "_runCKOperation:", v5, v9, v10, v11, v12, v13);

}

void __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "sc_hasUnderlyingErrorCode:", 26) & 1) == 0)
  {
    v11 = (void (**)(id, void *))*(id *)(a1 + 40);
    v11[2](v11, v10);
  }
  else
  {
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "schema");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneSchemas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = objc_alloc(MEMORY[0x1E0C95088]);
          objc_msgSend(v18, "zoneName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithZoneName:", v20);

          objc_msgSend(v11, "addObject:", v21);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v22 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
    objc_msgSend(v22, "setRecordZonesToSave:", v11);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_3;
    v24[3] = &unk_1E5AF2638;
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v22, "setModifyRecordZonesCompletionBlock:", v24);
    objc_msgSend(*(id *)(a1 + 32), "_runCKOperation:", v22);

    v8 = v23;
  }

}

uint64_t __56__SCWDatabase__deleteAndRecreateAllZonesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_recoverFromIdentityLossWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  -[SCWDatabase storeCoordinator](self, "storeCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke;
  v10[3] = &unk_1E5AF2198;
  v10[4] = self;
  objc_msgSend(v5, "writeWithAccessor:", v10);

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_2;
  v8[3] = &unk_1E5AF2208;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SCWDatabase _deleteAndRecreateAllZonesWithCompletion:](self, "_deleteAndRecreateAllZonesWithCompletion:", v8);

}

void __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "schema", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneSchemas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v3, "zoneStoreForSchema:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_squashZoneForMerge:zoneStore:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(id, _QWORD);

  if (a2)
  {
    v4 = (void (**)(id, _QWORD))*(id *)(a1 + 40);
    v4[2](v4, a2);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "schema");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneSchemas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_4;
    v8[3] = &unk_1E5AF1ED8;
    v9 = (void (**)(id, _QWORD))*(id *)(a1 + 40);
    objc_msgSend(v5, "_saveZonesToContainer:allowRecoveryAttempt:completion:", v7, 0, v8);

    v4 = v9;
  }

}

uint64_t __54__SCWDatabase__recoverFromIdentityLossWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_runCKOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v10 = v8;

  objc_msgSend(v10, "setAutomaticallyRetryNetworkFailures:", 0);
  objc_msgSend(v10, "setDiscretionaryNetworkBehavior:", 0);
  objc_msgSend(v4, "setConfiguration:", v10);
  -[SCWDatabase container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDatabaseOperation:", v4);

}

- (id)_sanitizeErrorForClients:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SCWErrorDomain"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void)setStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_storeCoordinator, a3);
}

- (SCWContainerProxying)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSArray)mergeHandlers
{
  return self->_mergeHandlers;
}

- (void)setMergeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_mergeHandlers, a3);
}

- (void)setStartupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupQueue, a3);
}

- (void)setCkSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ckSyncQueue, a3);
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setObserversByZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_observersByZoneName, a3);
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (void)setZoneSnapshotsByZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSnapshotsByZoneName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSnapshotsByZoneName, 0);
  objc_storeStrong((id *)&self->_observersByZoneName, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ckSyncQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_mergeHandlers, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_storeCoordinator, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

void __48__SCWDatabase_modifyContentsOfZone_withCommand___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1ABCEF000, a2, a3, "rejecting attempt to modify an unknown zone: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_49_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1ABCEF000, v0, v1, "failed to fetch account info with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__SCWDatabase__enqueueStartupSequenceWithFeatures___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1ABCEF000, v0, v1, "failed to save database subscription with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__SCWDatabase__fetchDatabaseChangesWithCompletion___block_invoke_2_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1ABCEF000, v0, v1, "failed to fetch database changes with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__SCWDatabase__fetchZoneChangesForZones_completion___block_invoke_87_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1ABCEF000, a2, OS_LOG_TYPE_ERROR, "failed to fetch changes for zones: %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_93_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1ABCEF000, v2, v3, "failed to save zone %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_2_97_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1ABCEF000, v2, v3, "failed to create zone %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __68__SCWDatabase__saveZoneToContainer_allowRecoveryAttempt_completion___block_invoke_3_100_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1ABCEF000, v2, v3, "failed to save zone %{public}@ because we couldn't fetch changes due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
