@implementation PXAssetEditOperationManager

- (PXAssetEditOperationManager)init
{
  PXAssetEditOperationManager *v2;
  PXAssetEditOperationManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *operationStatusByAsset;
  NSMutableDictionary *v6;
  NSMutableDictionary *pendingPerformersByAsset;
  uint64_t v8;
  NSMapTable *observersWithContexts;
  NSMutableArray *v10;
  NSMutableArray *predicateRecords;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXAssetEditOperationManager;
  v2 = -[PXAssetEditOperationManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_predicateRecordsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    operationStatusByAsset = v3->_operationStatusByAsset;
    v3->_operationStatusByAsset = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingPerformersByAsset = v3->_pendingPerformersByAsset;
    v3->_pendingPerformersByAsset = v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observersWithContexts = v3->_observersWithContexts;
    v3->_observersWithContexts = (NSMapTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    predicateRecords = v3->_predicateRecords;
    v3->_predicateRecords = v10;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PXAssetEditOperationManager registerAdditionalPerformers](v3, "registerAdditionalPerformers");
  }
  return v3;
}

- (BOOL)canPerformEditOperationWithType:(id)a3 onAsset:(id)a4
{
  return -[PXAssetEditOperationManager _performerClassForEditOperationWithType:onAsset:](self, "_performerClassForEditOperationWithType:onAsset:", a3, a4) != 0;
}

- (void)_enumeratePredicateRecordsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  os_unfair_lock_s *p_predicateRecordsLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  p_predicateRecordsLock = &self->_predicateRecordsLock;
  os_unfair_lock_lock(&self->_predicateRecordsLock);
  v6 = (void *)-[NSMutableArray copy](self->_predicateRecords, "copy");
  os_unfair_lock_unlock(p_predicateRecordsLock);
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), &v16);
      if (v16)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  return -[PXAssetEditOperationManager performEditOperationWithType:asset:undoManager:delay:completionHandler:](self, "performEditOperationWithType:asset:undoManager:delay:completionHandler:", a3, a4, a5, a6, 0.0);
}

- (id)performEditOperationWithType:(id)a3 asset:(id)a4 undoManager:(id)a5 delay:(double)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38[2];
  id from;
  _BYTE location[12];
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (-[PXAssetEditOperationManager canPerformEditOperationWithType:onAsset:](self, "canPerformEditOperationWithType:onAsset:", v12, v13)&& (-[PXAssetEditOperationManager _performerForEditOperationWithType:onAsset:](self, "_performerForEditOperationWithType:onAsset:", v12, v13), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PXAssetEditOperationManager _addPendingPerformer:](self, "_addPendingPerformer:", v16);
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v16);
    v17 = v12;
    v18 = v13;
    objc_msgSend(v17, "hash");
    kdebug_trace();

    -[PXAssetEditOperationManager _updateOperationStatusForAsset:](self, "_updateOperationStatusForAsset:", v18);
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5143968;
    v20 = v16;
    v34 = v20;
    v35 = v14;
    v38[1] = v16;
    objc_copyWeak(&v37, (id *)location);
    objc_copyWeak(v38, &from);
    v36 = v15;
    v21 = _Block_copy(aBlock);
    v22 = v21;
    if (a6 <= 0.0)
    {
      (*((void (**)(void *))v21 + 2))(v21);
    }
    else
    {
      v23 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
      v28 = v19;
      v29 = 3221225472;
      v30 = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_3;
      v31 = &unk_1E5148A40;
      v32 = v22;
      dispatch_after(v23, MEMORY[0x1E0C80D38], &v28);

    }
    objc_destroyWeak(v38);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  else
  {
    PLUIGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v12;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "no performer found for edit operation with type %@ on asset %@", location, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photosuicore.PXAssetEditOperationManager"), 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v25);

    v20 = 0;
  }
  objc_msgSend(v20, "progress", v28, v29, v30, v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)registerPerformerClass:(Class)a3 withPredicate:(id)a4
{
  id v6;
  _PXAssetEditOperationPredicateRecord *v7;

  v6 = a4;
  v7 = -[_PXAssetEditOperationPredicateRecord initWithPerformerClass:predicate:]([_PXAssetEditOperationPredicateRecord alloc], "initWithPerformerClass:predicate:", a3, v6);

  os_unfair_lock_lock(&self->_predicateRecordsLock);
  -[NSMutableArray addObject:](self->_predicateRecords, "addObject:", v7);
  os_unfair_lock_unlock(&self->_predicateRecordsLock);

}

- (int64_t)editOperationStatusForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXAssetEditOperationManager operationStatusByAsset](self, "operationStatusByAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (id)_performerForEditOperationWithType:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(-[PXAssetEditOperationManager _performerClassForEditOperationWithType:onAsset:](self, "_performerClassForEditOperationWithType:onAsset:", v7, v6)), "initWithEditOperationType:asset:", v7, v6);

  return v8;
}

- (Class)_performerClassForEditOperationWithType:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PXAssetEditOperationManager__performerClassForEditOperationWithType_onAsset___block_invoke;
  v12[3] = &unk_1E5143990;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  -[PXAssetEditOperationManager _enumeratePredicateRecordsWithBlock:](self, "_enumeratePredicateRecordsWithBlock:", v12);
  v10 = (id)v17[3];

  _Block_object_dispose(&v16, 8);
  return (Class)v10;
}

- (void)enumerateEditOperationsPerformedOnAsset:(id)a3 usingBlock:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetEditOperationManager.m"), 221, CFSTR("%s must be called on the main thread"), "-[PXAssetEditOperationManager enumerateEditOperationsPerformedOnAsset:usingBlock:]");

  }
  if (v11)
  {
    -[PXAssetEditOperationManager pendingPerformersByAsset](self, "pendingPerformersByAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__PXAssetEditOperationManager_enumerateEditOperationsPerformedOnAsset_usingBlock___block_invoke;
    v12[3] = &unk_1E51439B8;
    v13 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
}

- (void)registerObserver:(id)a3 context:(void *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetEditOperationManager.m"), 233, CFSTR("%s must be called on the main thread"), "-[PXAssetEditOperationManager registerObserver:context:]");

  }
  -[PXAssetEditOperationManager observersWithContexts](self, "observersWithContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 256);
    objc_msgSend(v7, "setObject:forKey:", v9, v11);
  }
  objc_msgSend(v9, "addPointer:", a4);

}

- (void)unregisterObserver:(id)a3 context:(void *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetEditOperationManager.m"), 244, CFSTR("%s must be called on the main thread"), "-[PXAssetEditOperationManager unregisterObserver:context:]");

  }
  -[PXAssetEditOperationManager observersWithContexts](self, "observersWithContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while ((void *)objc_msgSend(v8, "pointerAtIndex:", v11) != a4)
    {
      if (v10 == ++v11)
        goto LABEL_9;
    }
    objc_msgSend(v8, "removePointerAtIndex:", v11);
  }
LABEL_9:
  if (v8 && !objc_msgSend(v8, "count"))
    objc_msgSend(v7, "removeObjectForKey:", v13);

}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  unsigned __int8 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, unsigned __int8 *))a3;
  -[PXAssetEditOperationManager observersWithContexts](self, "observersWithContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          v13 = 0;
          while (1)
          {
            v4[2](v4, v11, objc_msgSend(v12, "pointerAtIndex:", v13), &v19);
            if (v19)
              break;
            if (++v13 >= (unint64_t)objc_msgSend(v12, "count"))
              goto LABEL_10;
          }

          goto LABEL_15;
        }
LABEL_10:
        v14 = v19;

        if (v14)
          goto LABEL_15;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)_addPendingPerformer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetEditOperationManager pendingPerformersByAsset](self, "pendingPerformersByAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXAssetEditOperationManager pendingPerformersByAsset](self, "pendingPerformersByAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  }
  objc_msgSend(v6, "addObject:", v8);
  -[PXAssetEditOperationManager _signalPendingPerformersChangeForAsset:](self, "_signalPendingPerformersChangeForAsset:", v4);

}

- (void)_removePendingPerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetEditOperationManager pendingPerformersByAsset](self, "pendingPerformersByAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v4);
  if (!objc_msgSend(v6, "count"))
  {
    -[PXAssetEditOperationManager pendingPerformersByAsset](self, "pendingPerformersByAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  -[PXAssetEditOperationManager _signalPendingPerformersChangeForAsset:](self, "_signalPendingPerformersChangeForAsset:", v8);

}

- (void)_updateOperationStatusForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PXAssetEditOperationManager__updateOperationStatusForAsset___block_invoke;
  v10[3] = &unk_1E51439E0;
  v10[4] = &v11;
  -[PXAssetEditOperationManager enumerateEditOperationsPerformedOnAsset:usingBlock:](self, "enumerateEditOperationsPerformedOnAsset:usingBlock:", v4, v10);
  -[PXAssetEditOperationManager operationStatusByAsset](self, "operationStatusByAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v12[3];
  if (v7 != objc_msgSend(v6, "integerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetEditOperationManager operationStatusByAsset](self, "operationStatusByAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

    -[PXAssetEditOperationManager _signalStatusChangeForAsset:](self, "_signalStatusChangeForAsset:", v4);
  }

  _Block_object_dispose(&v11, 8);
}

- (void)_signalStatusChangeForAsset:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXAssetEditOperationManager__signalStatusChangeForAsset___block_invoke;
  v6[3] = &unk_1E5143A08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXAssetEditOperationManager _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v6);

}

- (void)_signalPendingPerformersChangeForAsset:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXAssetEditOperationManager__signalPendingPerformersChangeForAsset___block_invoke;
  v6[3] = &unk_1E5143A08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXAssetEditOperationManager _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v6);

}

- (void)_handleCompletionOfPerformer:(id)a3 withSuccess:(BOOL)a4 error:(id)a5 externalCompletionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v14 = a6;
  v13 = v9;
  v10 = v9;
  v11 = v14;
  v12 = v8;
  px_dispatch_on_main_queue();

}

- (NSMutableDictionary)pendingPerformersByAsset
{
  return self->_pendingPerformersByAsset;
}

- (NSMutableDictionary)operationStatusByAsset
{
  return self->_operationStatusByAsset;
}

- (NSMapTable)observersWithContexts
{
  return self->_observersWithContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersWithContexts, 0);
  objc_storeStrong((id *)&self->_operationStatusByAsset, 0);
  objc_storeStrong((id *)&self->_pendingPerformersByAsset, 0);
  objc_storeStrong((id *)&self->_predicateRecords, 0);
}

uint64_t __104__PXAssetEditOperationManager__handleCompletionOfPerformer_withSuccess_error_externalCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateOperationStatusForAsset:", v4);

    objc_msgSend(*(id *)(a1 + 40), "_removePendingPerformer:", *(_QWORD *)(a1 + 32));
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  return result;
}

void __70__PXAssetEditOperationManager__signalPendingPerformersChangeForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "assetEditOperationManager:didChangeEditOperationsPerformedOnAsset:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);

}

void __59__PXAssetEditOperationManager__signalStatusChangeForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "assetEditOperationManager:didChangeEditOperationStatusForAsset:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);

}

void __62__PXAssetEditOperationManager__updateOperationStatusForAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "completedUnitCount");
  if (v4 >= objc_msgSend(v8, "totalUnitCount"))
  {
    v6 = 2;
  }
  else
  {
    v5 = objc_msgSend(v8, "isCancelled");
    v6 = 3;
    if (v5)
      v6 = 1;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v7 + 24) > v6)
    v6 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v6;

}

void __82__PXAssetEditOperationManager_enumerateEditOperationsPerformedOnAsset_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "editOperationType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, uint64_t))(v5 + 16))(v5, v8, v7, a4);
}

void __79__PXAssetEditOperationManager__performerClassForEditOperationWithType_onAsset___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "predicate");
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = v5[2](v5, a1[4], a1[5]);

  if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v7, "performerClass");
    *a3 = 1;
  }

}

void __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5143940;
  v7[1] = *(id *)(a1 + 72);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_copyWeak(v7, (id *)(a1 + 64));
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "executeWithUndoManager:completionHandler:", v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

uint64_t __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__PXAssetEditOperationManager_performEditOperationWithType_asset_undoManager_delay_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;

  v5 = a3;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleCompletionOfPerformer:withSuccess:error:externalCompletionHandler:", v6, a2, v5, *(_QWORD *)(a1 + 32));

}

+ (PXAssetEditOperationManager)sharedManager
{
  if (sharedManager_onceToken_273013 != -1)
    dispatch_once(&sharedManager_onceToken_273013, &__block_literal_global_145_273014);
  return (PXAssetEditOperationManager *)(id)sharedManager_sharedManager_273015;
}

void __44__PXAssetEditOperationManager_sharedManager__block_invoke()
{
  PXAssetEditOperationManager *v0;
  void *v1;

  v0 = objc_alloc_init(PXAssetEditOperationManager);
  v1 = (void *)sharedManager_sharedManager_273015;
  sharedManager_sharedManager_273015 = (uint64_t)v0;

}

@end
