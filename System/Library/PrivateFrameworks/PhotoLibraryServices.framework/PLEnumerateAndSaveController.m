@implementation PLEnumerateAndSaveController

- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PLEnumerateAndSaveController *v24;
  void *v26;

  v11 = a8;
  v12 = a7;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processResultBlock"));

  }
  v24 = -[PLEnumerateAndSaveController _initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:processResultsBlock:](self, "_initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:processResultsBlock:", v17, v18, v19, v20, v12, v11, v21, v22, v23, 0);

  return v24;
}

- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultsBlock:(id)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PLEnumerateAndSaveController *v24;
  void *v26;

  v11 = a8;
  v12 = a7;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processResultsBlock"));

  }
  v24 = -[PLEnumerateAndSaveController _initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:processResultsBlock:](self, "_initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:processResultsBlock:", v17, v18, v19, v20, v12, v11, v21, v22, 0, v23);

  return v24;
}

- (id)_initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11 processResultsBlock:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  PLEnumerateAndSaveController *v27;
  PLEnumerateAndSaveController *v28;
  uint64_t v29;
  id processResultBlock;
  uint64_t v31;
  id processResultsBlock;
  uint64_t v33;
  id generateContextBlock;
  uint64_t v35;
  id didFetchObjectIDsBlock;
  NSError *firstError;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id v48;
  void *v49;
  objc_super v51;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v18 = a5;
  v48 = a6;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v49 = v16;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

LABEL_3:
  v24 = v21;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v25 = v22;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v26 = v23;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("generateContextBlock"));

  }
  v51.receiver = self;
  v51.super_class = (Class)PLEnumerateAndSaveController;
  v27 = -[PLEnumerateAndSaveController init](&v51, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_concurrent = a7;
    v27->_refreshesAllAfterSave = a8;
    objc_storeStrong((id *)&v27->_operationName, a3);
    objc_storeStrong((id *)&v28->_originalContext, a5);
    objc_storeStrong((id *)&v28->_originalFetchRequest, obj);
    objc_storeStrong((id *)&v28->_pathManager, v48);
    v29 = MEMORY[0x19AEC174C](v25);
    processResultBlock = v28->_processResultBlock;
    v28->_processResultBlock = (id)v29;

    v31 = MEMORY[0x19AEC174C](v26);
    processResultsBlock = v28->_processResultsBlock;
    v28->_processResultsBlock = (id)v31;

    v33 = MEMORY[0x19AEC174C](v20);
    generateContextBlock = v28->_generateContextBlock;
    v28->_generateContextBlock = (id)v33;

    v35 = MEMORY[0x19AEC174C](v24);
    didFetchObjectIDsBlock = v28->_didFetchObjectIDsBlock;
    v28->_didFetchObjectIDsBlock = (id)v35;

    v28->_succeeded = 1;
    firstError = v28->_firstError;
    v28->_firstError = 0;

    v28->_itemsPerBatch = 200;
  }

  return v28;
}

- (void)_inq_runOperationWithObjectIDs:(id)a3 onContext:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  PLEnumerateAndSaveController *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  PLEnumerateAndSaveController *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEnumerateAndSaveController.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  -[PLEnumerateAndSaveController originalFetchRequest](self, "originalFetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v36 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v36;
  if (v11)
  {
    -[PLEnumerateAndSaveController processResultsBlock](self, "processResultsBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      buf[0] = 0;
      -[PLEnumerateAndSaveController processResultsBlock](self, "processResultsBlock");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *, uint8_t *))v13)[2](v13, v7, v11, buf);

      if (buf[0])
        atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v11;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            buf[0] = 0;
            -[PLEnumerateAndSaveController processResultBlock](self, "processResultBlock");
            v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id, uint64_t, uint8_t *))v22)[2](v22, v7, v21, buf);

            if (buf[0])
            {
              atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
              goto LABEL_22;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_22:

    }
    if (objc_msgSend(v7, "hasChanges"))
    {
      v31 = 0;
      v23 = objc_msgSend(v7, "save:", &v31);
      v24 = v31;
      if ((v23 & 1) == 0)
      {
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          -[PLEnumerateAndSaveController operationName](self, "operationName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v26;
          v39 = 2112;
          v40 = v24;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "PLMigrationEnumerateAndSave (%@) error saving changes from batch: %@, cancelling remaining operations.", buf, 0x16u);

        }
        v27 = self;
        objc_sync_enter(v27);
        if (-[PLEnumerateAndSaveController succeeded](v27, "succeeded"))
        {
          -[PLEnumerateAndSaveController setSucceeded:](v27, "setSucceeded:", 0);
          -[PLEnumerateAndSaveController setFirstError:](v27, "setFirstError:", v24);
        }
        objc_sync_exit(v27);

        atomic_store(1u, (unsigned __int8 *)&v27->_cancelled);
      }
      if (-[PLEnumerateAndSaveController refreshesAllAfterSave](self, "refreshesAllAfterSave"))
        objc_msgSend(v7, "refreshAllObjects");

    }
  }
  else
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PLEnumerateAndSaveController operationName](self, "operationName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v15;
      v39 = 2112;
      v40 = v29;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "PLMigrationEnumerateAndSave (%@) error fetching batch: %@, cancelling remaining operations.", buf, 0x16u);

    }
    v16 = self;
    objc_sync_enter(v16);
    if (-[PLEnumerateAndSaveController succeeded](v16, "succeeded"))
    {
      -[PLEnumerateAndSaveController setSucceeded:](v16, "setSucceeded:", 0);
      -[PLEnumerateAndSaveController setFirstError:](v16, "setFirstError:", v29);
    }
    objc_sync_exit(v16);

    atomic_store(1u, (unsigned __int8 *)&v16->_cancelled);
  }

}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (BOOL)processObjectsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  int64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  const char *v28;
  NSObject *v29;
  size_t v30;
  id v31;
  BOOL v32;
  int v34;
  _QWORD block[5];
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  atomic_store(0, (unsigned __int8 *)&self->_cancelled);
  -[PLEnumerateAndSaveController originalFetchRequest](self, "originalFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setResultType:", 1);
  objc_msgSend(v6, "setIncludesPropertyValues:", 0);
  objc_msgSend(v6, "setIncludesPendingChanges:", 0);
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__86627;
  v61 = __Block_byref_object_dispose__86628;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__86627;
  v55 = __Block_byref_object_dispose__86628;
  v56 = 0;
  -[PLEnumerateAndSaveController originalContext](self, "originalContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend((id)objc_opt_class(), "_concurrencyLimiterEnabledForContext:", v7);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke;
  v46[3] = &unk_1E3676348;
  v49 = &v57;
  v8 = v7;
  v47 = v8;
  v9 = v6;
  v48 = v9;
  v50 = &v51;
  v10 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v46);
  v11 = objc_msgSend(v8, "concurrencyType");
  if (*MEMORY[0x1E0C97C38] == v11 || !v11)
  {
    v10[2](v10);
  }
  else
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_2;
    v43[3] = &unk_1E3675C58;
    v12 = v8;
    v44 = v12;
    v13 = v10;
    v45 = v13;
    v14 = MEMORY[0x19AEC174C](v43);
    v15 = (void *)v14;
    if (v34)
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sync:identifyingBlock:library:", v15, v13, v17);

    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }

  }
  if (!v58[5])
  {
    -[PLEnumerateAndSaveController setSucceeded:](self, "setSucceeded:", 0);
    -[PLEnumerateAndSaveController setFirstError:](self, "setFirstError:", v52[5]);
    if (!a3)
      goto LABEL_18;
    goto LABEL_17;
  }
  -[PLEnumerateAndSaveController didFetchObjectIDsBlock](self, "didFetchObjectIDsBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PLEnumerateAndSaveController didFetchObjectIDsBlock](self, "didFetchObjectIDsBlock");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v19[2](v19, v58[5]);

  }
  v20 = -[PLEnumerateAndSaveController itemsPerBatch](self, "itemsPerBatch");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = (void *)v58[5];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_3;
  v38[3] = &unk_1E3673AC8;
  v24 = v21;
  v39 = v24;
  v41 = &v57;
  v42 = v20;
  v25 = v22;
  v40 = v25;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v38);
  if (self->_concurrent)
  {
    v26 = 0;
  }
  else
  {
    -[PLEnumerateAndSaveController operationName](self, "operationName");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create(v28, v29);

  }
  v30 = objc_msgSend(v25, "count");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_4;
  block[3] = &unk_1E3673AF0;
  block[4] = self;
  v36 = v25;
  v37 = v34;
  v31 = v25;
  dispatch_apply(v30, v26, block);

  if (a3)
  {
LABEL_17:
    -[PLEnumerateAndSaveController firstError](self, "firstError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  v32 = -[PLEnumerateAndSaveController succeeded](self, "succeeded");

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v32;
}

- (int64_t)itemsPerBatch
{
  return self->_itemsPerBatch;
}

- (void)setItemsPerBatch:(int64_t)a3
{
  self->_itemsPerBatch = a3;
}

- (BOOL)concurrent
{
  return self->_concurrent;
}

- (void)setConcurrent:(BOOL)a3
{
  self->_concurrent = a3;
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
  objc_storeStrong((id *)&self->_operationName, a3);
}

- (NSManagedObjectContext)originalContext
{
  return self->_originalContext;
}

- (void)setOriginalContext:(id)a3
{
  objc_storeStrong((id *)&self->_originalContext, a3);
}

- (NSFetchRequest)originalFetchRequest
{
  return self->_originalFetchRequest;
}

- (void)setOriginalFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_originalFetchRequest, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setPathManager:(id)a3
{
  objc_storeStrong((id *)&self->_pathManager, a3);
}

- (BOOL)refreshesAllAfterSave
{
  return self->_refreshesAllAfterSave;
}

- (void)setRefreshesAllAfterSave:(BOOL)a3
{
  self->_refreshesAllAfterSave = a3;
}

- (id)processResultBlock
{
  return self->_processResultBlock;
}

- (void)setProcessResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)processResultsBlock
{
  return self->_processResultsBlock;
}

- (void)setProcessResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)generateContextBlock
{
  return self->_generateContextBlock;
}

- (void)setGenerateContextBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)didFetchObjectIDsBlock
{
  return self->_didFetchObjectIDsBlock;
}

- (void)setDidFetchObjectIDsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (NSError)firstError
{
  return self->_firstError;
}

- (void)setFirstError:(id)a3
{
  objc_storeStrong((id *)&self->_firstError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong(&self->_didFetchObjectIDsBlock, 0);
  objc_storeStrong(&self->_generateContextBlock, 0);
  objc_storeStrong(&self->_processResultsBlock, 0);
  objc_storeStrong(&self->_processResultBlock, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_originalFetchRequest, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);
  objc_storeStrong((id *)&self->_operationName, 0);
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBlockAndWait:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == *(_QWORD *)(a1 + 56) || v5 - 1 == a3)
  {
    v8 = *(void **)(a1 + 40);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v8, "addObject:", v9);

    return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }
  return result;
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  if ((v2 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "generateContextBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_5;
    v19[3] = &unk_1E3677530;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v20 = v10;
    v21 = v11;
    v12 = v6;
    v22 = v12;
    v13 = MEMORY[0x19AEC174C](v19);
    v14 = (void *)v13;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) || !*(_BYTE *)(a1 + 48))
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      objc_msgSend(v10, "photoLibrary", v9, 3221225472, __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_8, &unk_1E3676CD8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sync:identifyingBlock:library:", &v17, 0, v16);

    }
    objc_autoreleasePoolPop(v5);
  }
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_6;
  v5[3] = &unk_1E3677530;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v5);

}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_7;
  v3[3] = &unk_1E3677530;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "pl_performBlockAndWait:", v3);

}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inq_runOperationWithObjectIDs:onContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)disableConcurrencyLimiterForContext:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PLEnumerateAndSaveController_disableConcurrencyLimiterForContext___block_invoke;
  v5[3] = &unk_1E3677AA0;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "pl_performBlockAndWait:", v5);

}

+ (BOOL)_concurrencyLimiterEnabledForContext:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PLEnumerateAndSaveController__concurrencyLimiterEnabledForContext___block_invoke;
  v7[3] = &unk_1E3677C68;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v4, "pl_performBlockAndWait:", v7);
  v5 = *((_BYTE *)v11 + 24) == 0;

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __69__PLEnumerateAndSaveController__concurrencyLimiterEnabledForContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLEnumerateAndSaveControllerDisableConcurrencyLimiter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

void __68__PLEnumerateAndSaveController_disableConcurrencyLimiterForContext___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PLEnumerateAndSaveControllerDisableConcurrencyLimiter"));

}

@end
