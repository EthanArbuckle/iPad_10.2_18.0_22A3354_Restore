@implementation PUIPosterSnapshotController

- (PUIPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUIPosterSnapshotController *v12;
  uint64_t v13;
  BSAtomicFlag *invalidationFlag;
  uint64_t v15;
  PFPosterExtensionProvider *extensionProvider;
  uint64_t v17;
  NSMapTable *lock_providerToSnapshotterMap;
  uint64_t v19;
  NSMapTable *lock_snapshotIdentifierToSnapshotRequestMap;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_dispatch_queue *completionBlockQueue;
  PUIPosterSnapshotCache *cache;
  char v26;
  id v27;
  void *v28;
  PUIPosterSnapshotController *v29;
  PUIPosterSnapshotController *result;
  NSObject *v31;
  void *v32;
  id v33;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v10;
  if (!v10 || (objc_msgSend(v10, "conformsToProtocol:", &unk_25739A750) & 1) != 0)
  {

    v34.receiver = self;
    v34.super_class = (Class)PUIPosterSnapshotController;
    v12 = -[PUIPosterSnapshotController init](&v34, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
      invalidationFlag = v12->_invalidationFlag;
      v12->_invalidationFlag = (BSAtomicFlag *)v13;

      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE74D18]), "initWithDefaultInstanceIdentifier:", v9);
      extensionProvider = v12->_extensionProvider;
      v12->_extensionProvider = (PFPosterExtensionProvider *)v15;

      -[PFPosterExtensionProvider start](v12->_extensionProvider, "start");
      objc_storeStrong((id *)&v12->_cache, a3);
      v12->_lock._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v17 = objc_claimAutoreleasedReturnValue();
      lock_providerToSnapshotterMap = v12->_lock_providerToSnapshotterMap;
      v12->_lock_providerToSnapshotterMap = (NSMapTable *)v17;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v19 = objc_claimAutoreleasedReturnValue();
      lock_snapshotIdentifierToSnapshotRequestMap = v12->_lock_snapshotIdentifierToSnapshotRequestMap;
      v12->_lock_snapshotIdentifierToSnapshotRequestMap = (NSMapTable *)v19;

      objc_msgSend(MEMORY[0x24BE0BE18], "concurrent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "autoreleaseFrequency:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = BSDispatchQueueCreate();
      completionBlockQueue = v12->_completionBlockQueue;
      v12->_completionBlockQueue = (OS_dispatch_queue *)v23;

      cache = v12->_cache;
      if (cache)
      {
        v33 = 0;
        v26 = -[PUIPosterSnapshotCache checkCacheIsReachable:](cache, "checkCacheIsReachable:", &v33);
        v27 = v33;
        v28 = v27;
        if ((v26 & 1) == 0)
        {
          PUILogSnapshotting();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            -[PUIPosterSnapshotController initWithCache:instanceIdentifier:].cold.1((uint64_t)v28, v31);

          v29 = 0;
          goto LABEL_8;
        }

      }
    }
    v29 = v12;
LABEL_8:

    return v29;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PUIPosterSnapshotCache)]"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PUIPosterSnapshotController initWithCache:instanceIdentifier:].cold.2(a2);
  objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
  result = (PUIPosterSnapshotController *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  NSMapTable *lock_providerToSnapshotterMap;
  NSMapTable *lock_snapshotIdentifierToSnapshotRequestMap;
  objc_super v5;

  -[PUIPosterSnapshotController invalidate](self, "invalidate");
  lock_providerToSnapshotterMap = self->_lock_providerToSnapshotterMap;
  self->_lock_providerToSnapshotterMap = 0;

  lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
  self->_lock_snapshotIdentifierToSnapshotRequestMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)PUIPosterSnapshotController;
  -[PUIPosterSnapshotController dealloc](&v5, sel_dealloc);
}

+ (unint64_t)defaultRequestOutput
{
  return 1;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PUIPosterSnapshotter *v16;
  PUIPosterSnapshotter *v17;
  PUIPosterSnapshotter *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMapTable *lock_snapshotIdentifierToSnapshotRequestMap;
  void *v24;
  RBSAssertion *lock_runtimeAssertion;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  RBSAssertion *v49;
  RBSAssertion *v50;
  void *v51;
  id v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v54;
  _QWORD v55[4];
  id v56;
  void (**v57)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v58;
  id location;
  id v60;
  _QWORD v61[4];
  id v62;
  void (**v63)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotController executeSnapshotRequest:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24467938CLL);
  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, void *))v9)[2](v9, v7, 0, v10);

  }
  else
  {
    v11 = (void *)objc_opt_new();
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
    v61[3] = &unk_25154C450;
    v52 = v11;
    v62 = v52;
    v63 = v9;
    v53 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2495151FC](v61);
    objc_msgSend(v7, "path");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "serverIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSMapTable objectForKey:](self->_lock_providerToSnapshotterMap, "objectForKey:", v13);
      v16 = (PUIPosterSnapshotter *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && -[PUIPosterSnapshotter isValid](v16, "isValid"))
      {
        v18 = v17;
      }
      else
      {
        -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionProvider, "extensionForIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PFPosterExtensionProvider instanceProvider](self->_extensionProvider, "instanceProvider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "acquireInstanceForExtension:reason:error:", v20, CFSTR("snapshots"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = -[PUIPosterSnapshotter initWithExtensionInstance:]([PUIPosterSnapshotter alloc], "initWithExtensionInstance:", v22);
        -[NSMapTable setObject:forKey:](self->_lock_providerToSnapshotterMap, "setObject:forKey:", v18, v13);

      }
      lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
      objc_msgSend(v7, "uniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](lock_snapshotIdentifierToSnapshotRequestMap, "setObject:forKey:", v7, v24);

      lock_runtimeAssertion = self->_lock_runtimeAssertion;
      ++self->_lock_runningSnapshotters;
      if (lock_runtimeAssertion)
      {
        PUILogSnapshotting();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PUIPosterSnapshotController executeSnapshotRequest:completion:].cold.4(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      else
      {
        v37 = (void *)MEMORY[0x24BE80B10];
        objc_msgSend(MEMORY[0x24BE80D38], "currentProcess");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pf_prewarmRuntimeAssertionForTarget:explanation:", v38, CFSTR("Snapshotting assertion"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = 0;
        LOBYTE(v37) = objc_msgSend(v39, "acquireWithError:", &v60);
        v26 = v60;
        PUILogSnapshotting();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if ((v37 & 1) != 0)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[PUIPosterSnapshotController executeSnapshotRequest:completion:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);

          v49 = v39;
        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[PUIPosterSnapshotController executeSnapshotRequest:completion:].cold.3((uint64_t)v26, v41);

          v49 = 0;
        }
        v50 = self->_lock_runtimeAssertion;
        self->_lock_runtimeAssertion = v49;

      }
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak(&location, self);
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_93;
      v55[3] = &unk_25154C478;
      objc_copyWeak(&v58, &location);
      v57 = v53;
      v56 = v7;
      -[PUIPosterSnapshotter enqueueSnapshotRequest:completion:](v18, "enqueueSnapshotRequest:completion:", v56, v55);

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
    }
    else
    {
      v34 = (void *)MEMORY[0x24BDD1540];
      v64 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Extension '%@' was not found"), v13);
      v18 = (PUIPosterSnapshotter *)objc_claimAutoreleasedReturnValue();
      v65[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "pui_errorWithCode:userInfo:", 3, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD, void *))v53)[2](v53, v7, 0, v36);

    }
  }

}

void __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__PUIPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_snapshotRequestDidFinishWithResult:error:request:completion:", v5, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v11 = a1 + 32;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v11 + 8);
    v12 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FD8];
    v16[0] = CFSTR("Snapshot controller was deallocated before snapshot could be completed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pui_errorWithCode:userInfo:", 3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v10 + 16))(v10, v9, 0, v14);

  }
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  return (id)-[PUIPosterSnapshotCache latestSnapshotBundleForRequest:error:](self->_cache, "latestSnapshotBundleForRequest:error:", a3, a4);
}

- (void)_snapshotRequestDidFinishWithResult:(id)a3 error:(id)a4 request:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  OS_dispatch_queue *v16;
  NSMapTable *lock_snapshotIdentifierToSnapshotRequestMap;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  RBSAssertion *lock_runtimeAssertion;
  id v26;
  PUIPosterSnapshotResult *v27;
  PUIPosterSnapshotResult *v28;
  void *v29;
  void *v30;
  OS_dispatch_queue *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  OS_dispatch_queue *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  PUIPosterSnapshotResult *v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotController _snapshotRequestDidFinishWithResult:error:request:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446799CCLL);
  }
  v15 = v14;
  v16 = self->_completionBlockQueue;
  os_unfair_lock_lock(&self->_lock);
  --self->_lock_runningSnapshotters;
  lock_snapshotIdentifierToSnapshotRequestMap = self->_lock_snapshotIdentifierToSnapshotRequestMap;
  objc_msgSend(v11, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](lock_snapshotIdentifierToSnapshotRequestMap, "removeObjectForKey:", v19);

  if (!self->_lock_runningSnapshotters)
  {
    v31 = v16;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[NSMapTable objectEnumerator](self->_lock_providerToSnapshotterMap, "objectEnumerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v50;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v50 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v24++), "invalidate");
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v22);
    }

    -[NSMapTable removeAllObjects](self->_lock_providerToSnapshotterMap, "removeAllObjects");
    -[RBSAssertion invalidate](self->_lock_runtimeAssertion, "invalidate");
    lock_runtimeAssertion = self->_lock_runtimeAssertion;
    self->_lock_runtimeAssertion = 0;

    v16 = v31;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke;
    block[3] = &unk_25154BD20;
    v48 = v15;
    v46 = v13;
    v47 = v12;
    dispatch_async((dispatch_queue_t)v16, block);

    v26 = v48;
  }
  else if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    objc_msgSend(v11, "invalidate");
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2_101;
    v32[3] = &unk_25154C4F0;
    v34 = v15;
    v33 = v13;
    dispatch_async((dispatch_queue_t)v16, v32);

    v26 = v34;
  }
  else
  {
    if (objc_msgSend(v13, "output") != 2)
    {
      v27 = -[PUIPosterSnapshotResult initWithSnapshotterResult:]([PUIPosterSnapshotResult alloc], "initWithSnapshotterResult:", v11);
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2;
      v41[3] = &unk_25154BD20;
      v44 = v15;
      v42 = v13;
      v43 = v27;
      v28 = v27;
      dispatch_async((dispatch_queue_t)v16, v41);

    }
    -[PUIPosterSnapshotController cache](self, "cache");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v11, "snapshotBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3;
      v35[3] = &unk_25154C4C8;
      v36 = v13;
      v26 = v26;
      v37 = v26;
      v38 = v16;
      v40 = v15;
      v39 = v11;
      objc_msgSend(v26, "cacheSnapshotBundle:forRequest:completion:", v29, v36, v35);

    }
  }

}

uint64_t __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PUILogSnapshotting();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "finished caching result for request %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "output") == 2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v23 = 0;
    objc_msgSend(v7, "latestSnapshotBundleForRequest:error:", v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;
    v11 = *(NSObject **)(a1 + 48);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_99;
    v17 = &unk_25154C4A0;
    v22 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 32);
    v19 = v9;
    v20 = *(id *)(a1 + 56);
    v21 = v10;
    v12 = v10;
    v13 = v9;
    dispatch_async(v11, &v14);

  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate", v14, v15, v16, v17);

}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_99(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  PUIPosterSnapshotResult *v4;
  uint64_t v5;
  uint64_t v6;
  PUIPosterSnapshotResult *v7;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = [PUIPosterSnapshotResult alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "executionTime");
  v7 = -[PUIPosterSnapshotResult initWithRequest:snapshotBundle:executeTime:](v4, "initWithRequest:snapshotBundle:executeTime:", v5, v6);
  (*(void (**)(uint64_t, uint64_t, PUIPosterSnapshotResult *, _QWORD))(v2 + 16))(v2, v3, v7, *(_QWORD *)(a1 + 56));

}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_2_101(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v1 + 16))(v1, v2, 0, v3);

}

- (void)invalidate
{
  void *v3;
  void *v4;
  NSMapTable *lock_providerToSnapshotterMap;
  RBSAssertion *v6;
  RBSAssertion *lock_runtimeAssertion;
  PFPosterExtensionProvider *extensionProvider;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable objectEnumerator](self->_lock_providerToSnapshotterMap, "objectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    lock_providerToSnapshotterMap = self->_lock_providerToSnapshotterMap;
    self->_lock_providerToSnapshotterMap = 0;

    v6 = self->_lock_runtimeAssertion;
    lock_runtimeAssertion = self->_lock_runtimeAssertion;
    self->_lock_runtimeAssertion = 0;

    os_unfair_lock_unlock(&self->_lock);
    -[PFPosterExtensionProvider cancel](self->_extensionProvider, "cancel");
    extensionProvider = self->_extensionProvider;
    self->_extensionProvider = 0;

  }
  else
  {
    v6 = 0;
    v4 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "invalidate", (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (v6)
    -[RBSAssertion invalidate](v6, "invalidate");

}

- (PUIPosterSnapshotCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_lock_snapshotIdentifierToSnapshotRequestMap, 0);
  objc_storeStrong((id *)&self->_lock_providerToSnapshotterMap, 0);
  objc_storeStrong((id *)&self->_lock_runtimeAssertion, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithCache:(uint64_t)a1 instanceIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_24464E000, a2, OS_LOG_TYPE_FAULT, "Unable to setup cache: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCache:(const char *)a1 instanceIdentifier:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)executeSnapshotRequest:(const char *)a1 completion:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)executeSnapshotRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24464E000, a1, a3, "acquired runtime assertion", a5, a6, a7, a8, 0);
}

- (void)executeSnapshotRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24464E000, a2, OS_LOG_TYPE_ERROR, "Error acquiring runtime assertion:'%@'", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)executeSnapshotRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24464E000, a1, a3, "runtime assertion already acquired", a5, a6, a7, a8, 0);
}

- (void)_snapshotRequestDidFinishWithResult:(const char *)a1 error:request:completion:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __92__PUIPosterSnapshotController__snapshotRequestDidFinishWithResult_error_request_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_24464E000, log, OS_LOG_TYPE_ERROR, "failed caching result for request %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_6();
}

@end
