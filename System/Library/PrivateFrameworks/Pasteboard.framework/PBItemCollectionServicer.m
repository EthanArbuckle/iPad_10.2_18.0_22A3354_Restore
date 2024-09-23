@implementation PBItemCollectionServicer

+ (id)newServicerForConnection:(id)a3 itemCollection:(id)a4
{
  id v5;
  id v6;
  PBItemCollectionServicer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PBItemCollectionServicer initWithConnection:itemCollection:]([PBItemCollectionServicer alloc], "initWithConnection:itemCollection:", v6, v5);

  return v7;
}

- (PBItemCollectionServicer)initWithConnection:(id)a3 itemCollection:(id)a4
{
  id v6;
  id v7;
  PBItemCollectionServicer *v8;
  PBItemCollectionServicer *v9;
  uint64_t v10;
  NSMutableDictionary *cleanupQueue_cleanupHandlerByUUID;
  void *v12;
  _QWORD v14[4];
  PBItemCollectionServicer *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBItemCollectionServicer;
  v8 = -[PBItemCollectionServicer init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemCollection, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    cleanupQueue_cleanupHandlerByUUID = v9->_cleanupQueue_cleanupHandlerByUUID;
    v9->_cleanupQueue_cleanupHandlerByUUID = (NSMutableDictionary *)v10;

    objc_msgSend(v6, "setExportedObject:", v9);
    PBNewDataProviderXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v12);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke;
    v14[3] = &unk_1E2430DF0;
    v15 = v9;
    objc_msgSend(v6, "setInvalidationHandler:", v14);

  }
  return v9;
}

void __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[128];
  uint8_t v24[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _PBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C53A000, v2, OS_LOG_TYPE_INFO, "PBItemCollectionServicer connection disconnected.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setItemCollection:", 0);
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  _cleanupQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke_2;
  block[3] = &unk_1E24314F0;
  v16 = buf;
  v15 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);

  if (objc_msgSend(*((id *)v18 + 5), "count"))
  {
    _PBLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(*((id *)v18 + 5), "count");
      *(_DWORD *)v24 = 134217984;
      v25 = v9;
      _os_log_debug_impl(&dword_18C53A000, v4, OS_LOG_TYPE_DEBUG, "Calling %lu cleanup handlers because connection disconnected.", v24, 0xCu);
    }

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = *((id *)v18 + 5);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
      }
      while (v6);
    }

  }
  _Block_object_dispose(buf, 8);

}

uint64_t __62__PBItemCollectionServicer_initWithConnection_itemCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

- (void)helloCompletionBlock:(id)a3
{
  PBDispatchAsyncCallback(a3);
}

- (void)loadRepresentationForItemAtIndex:(unint64_t)a3 type:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  int v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PBItemCollectionServicer *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBItemCollectionServicer itemCollection](self, "itemCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 > a3)
  {
    -[PBItemCollectionServicer itemCollection](self, "itemCollection");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_9:

      goto LABEL_10;
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__2;
    v38 = __Block_byref_object_dispose__2;
    v39 = 0;
    -[PBItemCollectionServicer itemCollection](self, "itemCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isGeneralPasteboard");

    if (v16)
    {
      v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
      v18 = (void *)v35[5];
      v35[5] = (uint64_t)v17;

      dispatch_source_set_event_handler((dispatch_source_t)v35[5], &__block_literal_global_4);
      v19 = v35[5];
      v20 = dispatch_time(0, 500000000);
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_activate((dispatch_object_t)v35[5]);
    }
    objc_msgSend(v14, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "representationConformingToType:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_4;
    v28[3] = &unk_1E24319A0;
    v33 = &v34;
    v24 = v22;
    v29 = v24;
    v30 = v8;
    v31 = self;
    v32 = v9;
    objc_msgSend(v23, "loadWithCompletionHandler:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChild:withPendingUnitCount:", v25, 100);

    _Block_object_dispose(&v34, 8);
    v26 = v39;
LABEL_8:

    goto LABEL_9;
  }
  if (v9)
  {
    PBIndexOutOfRangeError(a3, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke;
    v40[3] = &unk_1E24315B8;
    v41 = v27;
    v42 = v9;
    v14 = v27;
    PBDispatchAsyncCallback(v40);

    v26 = v42;
    goto LABEL_8;
  }
LABEL_10:

}

uint64_t __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32), 0);
}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  _PBLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_18C53A000, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF PASTEBOARD: This application has failed to return data it promised for a pasteboard copy in a timely fashion and is now hanging other processes waiting to access the pasteboard.", v1, 2u);
  }

}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  PBSecurityScopedURLWrapper *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  PBSecurityScopedURLWrapper *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  _QWORD block[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v13)
  {
    dispatch_source_cancel(v13);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
  v16 = (void *)MEMORY[0x18D782EA4](v12);
  if ((unint64_t)objc_msgSend(v9, "length") > 0x100000)
  {
    CPTemporaryFileWithUniqueName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v9, "writeToURL:atomically:", v17, 0);
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.Pasteboard.suggestedName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(void **)(a1 + 40);
      v49 = 0;
      v50[0] = 0;
      v36 = v19;
      PBCloneURLToTemporaryFolder(v17, (uint64_t)CFSTR("com.apple.Pasteboard"), v20, v19, v50, &v49);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v50[0];
      v23 = v49;
      if (v23)
      {
        PBCannotCreateTemporaryFile(0, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v11;
        v35 = (id)v24;
      }
      else
      {
        v35 = v11;
        v26 = -[PBSecurityScopedURLWrapper initWithURL:readonly:]([PBSecurityScopedURLWrapper alloc], "initWithURL:readonly:", v21, 1);

        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2_6;
        v46[3] = &unk_1E24314A0;
        v47 = v22;
        v48 = v12;
        v27 = MEMORY[0x18D782EA4](v46);

        v25 = v47;
        v16 = (void *)v27;
        v10 = v26;
      }
      v28 = v22;
      v29 = (void *)v21;

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeItemAtURL:error:", v17, 0);

      v11 = v35;
    }

    v9 = 0;
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__2;
  v44 = __Block_byref_object_dispose__2;
  v45 = 0;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v41[5];
    v41[5] = v31;

    _cleanupQueue();
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_3;
    block[3] = &unk_1E2430D78;
    block[4] = *(_QWORD *)(a1 + 48);
    v39 = &v40;
    v38 = v16;
    dispatch_sync(v33, block);

  }
  v34 = *(_QWORD *)(a1 + 56);
  if (v34)
    (*(void (**)(uint64_t, id, PBSecurityScopedURLWrapper *, id, uint64_t))(v34 + 16))(v34, v9, v10, v11, v41[5]);
  _Block_object_dispose(&v40, 8);

}

uint64_t __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_2_6(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__PBItemCollectionServicer_loadRepresentationForItemAtIndex_type_completionBlock___block_invoke_3(_QWORD *a1)
{
  id v2;

  v2 = (id)MEMORY[0x18D782EA4](a1[5]);
  objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

- (void)callCleanupBlockWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__11;
  v15 = 0;
  if (v4)
  {
    _cleanupQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PBItemCollectionServicer_callCleanupBlockWithUUID___block_invoke;
    block[3] = &unk_1E2431810;
    v9 = &v10;
    block[4] = self;
    v8 = v4;
    dispatch_sync(v5, block);

    v6 = v11[5];
    if (v6)
      (*(void (**)(void))(v6 + 16))();

  }
  _Block_object_dispose(&v10, 8);

}

uint64_t __53__PBItemCollectionServicer_callCleanupBlockWithUUID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    _PBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = a1[5];
      v8 = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_18C53A000, v5, OS_LOG_TYPE_DEBUG, "Cleaup handler UUID %@ is not found.", (uint8_t *)&v8, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
}

- (void)waitForItemRequestsDeliveryCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_itemCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_cleanupQueue_cleanupHandlerByUUID, 0);
}

@end
