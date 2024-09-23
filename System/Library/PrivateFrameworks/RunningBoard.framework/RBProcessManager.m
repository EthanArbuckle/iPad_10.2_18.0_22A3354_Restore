@implementation RBProcessManager

- (id)processForIdentity:(id)a3
{
  return -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", a3);
}

uint64_t __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_executeLifecycleEventForIdentity:sync:withBlock:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), 1, &__block_literal_global_106, (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  +[RBProcess processStateApplicationQueue](RBProcess, "processStateApplicationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async_and_wait(v7, &__block_literal_global_107);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)didUpdateProcessStates:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_block_t block;
  id obj;
  _QWORD v20[4];
  NSObject *v21;
  RBProcessManager *v22;
  id v23;
  _QWORD v24[6];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  block = a4;
  objc_msgSend(v6, "processIdentities");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v6, "processStateChangeForIdentity:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updatedState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[RBProcessMap setValue:forIdentity:](self->_processState, "setValue:forIdentity:", v12, v10);
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy__5;
        v31 = __Block_byref_object_dispose__5;
        -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v10);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (!v28[5] && objc_msgSend(v12, "guaranteedRunning"))
          -[RBProcessManager _enqueueGuaranteedRunningLaunchForIdentity:atTime:](self, "_enqueueGuaranteedRunningLaunchForIdentity:atTime:", v10, 0.0);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke;
        v24[3] = &unk_24DD47380;
        v26 = &v27;
        v24[4] = self;
        v24[5] = v10;
        v14 = v12;
        v25 = v14;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:](self, "_executeLifecycleEventForIdentity:sync:withBlock:", v10, 0, v24);

        _Block_object_dispose(&v27, 8);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  if (block)
  {
    objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBProcessManager stateApplicationQueue](RBProcessManager, "stateApplicationQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2;
      v20[3] = &unk_24DD46480;
      v21 = obj;
      v22 = self;
      v23 = block;
      objc_msgSend(v15, "handoffToQueue:block:", v17, v20);

      v17 = v21;
    }
    else
    {
      dispatch_async(v16, block);
    }

  }
}

- (void)_executeLifecycleEventForIdentity:(id)a3 sync:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_block_t v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1093, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  -[RBProcessManager _getLifecycleQueueForIdentity:](self, "_getLifecycleQueueForIdentity:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    dispatch_async_and_wait(v11, v10);
    -[RBProcessManager _releaseLifecycleQueueForIdentity:](self, "_releaseLifecycleQueueForIdentity:", v9);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke;
    block[3] = &unk_24DD473E8;
    v17 = v10;
    block[4] = self;
    v16 = v9;
    v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v12, v13);

  }
}

- (id)_getLifecycleQueueForIdentity:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_identityToProcessLifecycleQueue, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (-[NSCountedSet countForObject:](self->_lifecycleQueuesInUse, "countForObject:", v5))
      -[RBProcessManager _getLifecycleQueueForIdentity:].cold.1();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.runningboard.process-manager.%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v9);
    v6 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
    dispatch_set_qos_class_fallback();
    -[NSMutableDictionary setObject:forKey:](self->_identityToProcessLifecycleQueue, "setObject:forKey:", v6, v5);
    dispatch_activate(v6);

  }
  -[NSCountedSet addObject:](self->_lifecycleQueuesInUse, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1133, CFSTR("must return a queue"));

  }
  return v6;
}

+ (id)stateApplicationQueue
{
  if (stateApplicationQueue_onceToken != -1)
    dispatch_once(&stateApplicationQueue_onceToken, &__block_literal_global_43);
  return (id)stateApplicationQueue_queue;
}

- (id)processForIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE80C90], "identifierForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:](self, "_processForIdentifier:withAuditToken:forceStartTracking:", v4, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_processForIdentifier:(id)a3 withAuditToken:(id)a4 forceStartTracking:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uid_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  RBJetsamPropertyManaging *jetsamPropertytManager;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  uid_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  id v48;
  audit_token_t v49;
  audit_token_t v50;
  audit_token_t v51;
  audit_token_t atoken;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[24];
  uint64_t v64;

  v5 = a5;
  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5;
  v57 = __Block_byref_object_dispose__5;
  -[RBProcessManager _processForIdentifier:](self, "_processForIdentifier:", v8);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v54[5];
  if (!v10)
  {
    v48 = 0;
    -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:](self, "_resolveProcessWithIdentifier:auditToken:properties:", v8, v9, &v48);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v48;
    objc_msgSend(v17, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (v5)
      {
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke;
        v43[3] = &unk_24DD472E8;
        v47 = &v53;
        v43[4] = self;
        v44 = v8;
        v45 = v17;
        v46 = v18;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:](self, "_executeLifecycleEventForIdentity:sync:withBlock:", v19, 1, v43);

LABEL_15:
        v30 = (id)v54[5];
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x24BE80C10], "taskNameForPID:", objc_msgSend(v17, "rbs_pid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "auditToken");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v20 && v21)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v18, "hostPid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessManager processForIdentifierWithoutStartingTracking:](self, "processForIdentifierWithoutStartingTracking:", v23);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](self->_bundlePropertiesManager, "propertiesForIdentity:identifier:", v19, v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        jetsamPropertytManager = self->_jetsamPropertytManager;
        v26 = objc_msgSend(v8, "rbs_pid");
        objc_msgSend(v22, "realToken");
        -[RBJetsamPropertyManaging jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:](jetsamPropertytManager, "jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:", v26, v19, v24, RBSAuditTokenRepresentsPlatformBinary());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[RBProcess _initThinWithInstance:auditToken:bundleProperties:jetsamProperties:hostProcess:properties:]([RBProcess alloc], "_initThinWithInstance:auditToken:bundleProperties:jetsamProperties:hostProcess:properties:", v17, v22, v24, v27, v42, v18);
        v29 = (void *)v54[5];
        v54[5] = (uint64_t)v28;

        goto LABEL_15;
      }
      rbs_process_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:].cold.1();

    }
    v30 = 0;
    goto LABEL_34;
  }
  if (v9)
  {
    objc_msgSend(v10, "auditToken");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if ((id)v11 == v9)
    {

    }
    else if (!v11 || (v13 = objc_msgSend(v9, "isEqual:", v11), v12, (v13 & 1) == 0))
    {
      objc_msgSend(v9, "realToken");
      v14 = audit_token_to_auid(&atoken);
      objc_msgSend((id)v54[5], "auditToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "realToken");
      else
        memset(&v51, 0, sizeof(v51));
      v31 = v14 == audit_token_to_auid(&v51);

      if (!v31)
      {
        rbs_process_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend((id)v54[5], "auditToken");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:].cold.2(v33, (uint64_t)v9, (uint64_t)v63, v32);
        }

      }
      objc_msgSend(v9, "realToken");
      v34 = audit_token_to_euid(&v50);
      objc_msgSend((id)v54[5], "auditToken");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
        objc_msgSend(v35, "realToken");
      else
        memset(&v49, 0, sizeof(v49));
      v37 = v34 == audit_token_to_euid(&v49);

      if (!v37)
      {
        rbs_process_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)v54[5], "auditToken");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v39;
          v61 = 2114;
          v62 = v9;
          _os_log_impl(&dword_21A8B4000, v38, OS_LOG_TYPE_DEFAULT, "EUID of process has changed from %{public}@ to %{public}@", buf, 0x16u);

        }
      }
      objc_msgSend((id)v54[5], "setAuditToken:", v9);
      -[RBEntitlementManaging purgeEntitlementsForProcess:](self->_entitlementManager, "purgeEntitlementsForProcess:", v54[5]);
    }
  }
  v30 = (id)v54[5];
LABEL_35:
  _Block_object_dispose(&v53, 8);

  return v30;
}

- (id)_processForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[RBProcessIndex processForIdentifier:](self->_processGraveyard, "processForIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)processForInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if ((v8 & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (void)_releaseLifecycleQueueForIdentity:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  os_unfair_lock_lock_with_options();
  v5 = -[NSCountedSet countForObject:](self->_lifecycleQueuesInUse, "countForObject:", v8);
  if (!v5)
    -[RBProcessManager _releaseLifecycleQueueForIdentity:].cold.1();
  v6 = v5;
  -[NSCountedSet removeObject:](self->_lifecycleQueuesInUse, "removeObject:", v8);
  if (v6 == 1)
    -[NSMutableDictionary removeObjectForKey:](self->_identityToProcessLifecycleQueue, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)processesMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "processIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v30 = v5;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          -[RBProcessManager processForIdentifierWithoutStartingTracking:](self, "processForIdentifierWithoutStartingTracking:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "handle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v4, "matchesProcess:", v14);

            if (v15)
              objc_msgSend(v6, "addObject:", v13);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
LABEL_29:
      v5 = v30;
    }
  }
  else
  {
    objc_msgSend(v4, "processIdentity");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v26, "handle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v4, "matchesProcess:", v27);

            if (v28)
              objc_msgSend(v6, "addObject:", v26);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v23);
      }

      goto LABEL_29;
    }
    -[RBProcessManager processForIdentity:](self, "processForIdentity:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16
      && (objc_msgSend(v16, "handle"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v4, "matchesProcess:", v18),
          v18,
          v19))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v20;

  }
  return v6;
}

uint64_t __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_releaseLifecycleQueueForIdentity:", *(_QWORD *)(a1 + 40));
}

void *__54__RBProcessManager_didUpdateProcessStates_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *result;

  objc_msgSend(*(id *)(a1[4] + 88), "processForIdentity:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
    return (void *)objc_msgSend(result, "_applyState:", a1[6]);
  return result;
}

- (id)processForIdentifierWithoutStartingTracking:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE80C90], "identifierForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:](self, "_processForIdentifier:withAuditToken:forceStartTracking:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "entitlementsForProcess:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isActiveProcess:(id)a3
{
  return -[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", a3);
}

- (id)_resolveProcessWithIdentifier:(id)a3 auditToken:(id)a4 properties:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uid_t v18;
  uid_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uid_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  const __CFString *v36;
  int v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  audit_token_t v45;
  audit_token_t buf[2];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = objc_msgSend(a3, "rbs_pid");
  if ((int)v9 >= 1)
  {
    v10 = v9;
    +[RBLaunchdProperties propertiesForPid:](RBLaunchdProperties, "propertiesForPid:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    memset(&buf[1], 0, sizeof(audit_token_t));
    if (v8)
    {
      objc_msgSend(v8, "realToken");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE80C10], "taskNameForPID:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "auditToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "realToken");
      else
        memset(buf, 0, 32);
      buf[1] = buf[0];

    }
    if (objc_msgSend(v12, "hasVariableEUID"))
    {
      rbs_process_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        buf[0].val[0] = 67109120;
        buf[0].val[1] = v10;
        _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_DEFAULT, "Process %d has variable EUID - just use AUID/EUID 0", (uint8_t *)buf, 8u);
      }
    }
    else
    {
      buf[0] = buf[1];
      if (RBSRealAuditTokenValid())
      {
        buf[0] = buf[1];
        v18 = audit_token_to_euid(buf);
        buf[0] = buf[1];
        v19 = audit_token_to_auid(buf);
        if (v19 + 1 >= 2)
          v20 = v19;
        else
          v20 = v18;
        rbs_process_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          buf[0].val[0] = 67109632;
          buf[0].val[1] = v10;
          LOWORD(buf[0].val[2]) = 1024;
          *(unsigned int *)((char *)&buf[0].val[2] + 2) = v18;
          HIWORD(buf[0].val[3]) = 1024;
          buf[0].val[4] = v20;
          _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_DEFAULT, "_resolveProcessWithIdentifier pid %d euid %d auid %d", (uint8_t *)buf, 0x14u);
        }
LABEL_23:

        objc_msgSend(v12, "specifiedIdentity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v12, "specifiedIdentity");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
            goto LABEL_49;
        }
        else if (objc_msgSend(v12, "isXPCService"))
        {
          v23 = objc_msgSend(v12, "hostPid");
          if ((int)v23 < 1)
          {
            v25 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v25, "auditToken");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            memset(buf, 0, 32);
            objc_msgSend(v27, "realToken");
            v45 = buf[0];
            LODWORD(v20) = audit_token_to_euid(&v45);
            v45 = buf[0];
            v29 = audit_token_to_auid(&v45);
            if (v29 + 1 >= 2)
              v20 = v29;
            else
              v20 = v20;
            rbs_process_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v45.val[0] = 67109376;
              v45.val[1] = v10;
              LOWORD(v45.val[2]) = 1024;
              *(unsigned int *)((char *)&v45.val[2] + 2) = v20;
              _os_log_impl(&dword_21A8B4000, v30, OS_LOG_TYPE_DEFAULT, "_resolveProcessWithIdentifier pid %d host is auid %d", (uint8_t *)&v45, 0xEu);
            }

          }
          v31 = (void *)MEMORY[0x24BE80C98];
          objc_msgSend(v12, "executablePath");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "instance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "identityForXPCServiceExecutablePath:pid:auid:host:UUID:", v32, v10, v20, v33, v34);
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22)
            goto LABEL_49;
        }
        else
        {
          objc_msgSend(v12, "resolvedIdentityWithPid:auid:", v10, v20);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
            goto LABEL_49;
          rbs_process_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            buf[0].val[0] = 67109120;
            buf[0].val[1] = v10;
            _os_log_impl(&dword_21A8B4000, v26, OS_LOG_TYPE_DEFAULT, "Unable to obtain process properties from launchd for pid=%d", (uint8_t *)buf, 8u);
          }

        }
        if (RBSPIDExists())
        {
          RBSExecutablePathForPID();
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v35)
            goto LABEL_48;
          v37 = RBSPIDExists();
          rbs_process_log();
          v22 = objc_claimAutoreleasedReturnValue();
          v38 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v37)
          {
            if (v38)
            {
              buf[0].val[0] = 67109120;
              buf[0].val[1] = v10;
              _os_log_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_DEFAULT, "RBSExecutablePathForPID couldn't get exec path for pid that exists, %d", (uint8_t *)buf, 8u);
            }

            v36 = CFSTR("no-exec-path");
LABEL_48:
            objc_msgSend(MEMORY[0x24BE80C98], "identityForExecutablePath:pid:auid:", v36, v10, v20);
            v22 = objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              rbs_process_log();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:].cold.1(v10, v41);
              v22 = 0;
              v13 = 0;
              goto LABEL_51;
            }
LABEL_49:
            v39 = (void *)MEMORY[0x24BE80CB0];
            objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v10);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "instanceWithIdentifier:identity:", v40, v22);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            rbs_process_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject shortDescription](v22, "shortDescription");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              buf[0].val[0] = 67109634;
              buf[0].val[1] = v10;
              LOWORD(buf[0].val[2]) = 2114;
              *(_QWORD *)((char *)&buf[0].val[2] + 2) = v42;
              HIWORD(buf[0].val[4]) = 1024;
              buf[0].val[5] = v10;
              _os_log_impl(&dword_21A8B4000, v41, OS_LOG_TYPE_DEFAULT, "Resolved pid %d to [%{public}@:%d]", (uint8_t *)buf, 0x18u);

            }
LABEL_51:

LABEL_56:
            goto LABEL_57;
          }
          if (v38)
          {
            buf[0].val[0] = 67109120;
            buf[0].val[1] = v10;
            v43 = "Can't lookup pid %d because it does not exist anymore";
            goto LABEL_54;
          }
        }
        else
        {
          rbs_process_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            buf[0].val[0] = 67109120;
            buf[0].val[1] = v10;
            v43 = "Can't lookup pid %d because it does not exist";
LABEL_54:
            _os_log_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_DEFAULT, v43, (uint8_t *)buf, 8u);
          }
        }
        v13 = 0;
        goto LABEL_56;
      }
      rbs_process_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:].cold.2((uint64_t)v8, v10, v17);
    }
    v20 = 0;
    goto LABEL_23;
  }
  v13 = 0;
LABEL_57:

  return v13;
}

- (id)_lifecycleQueue_addProcessWithInstance:(id)a3 properties:(id)a4
{
  id v7;
  uint64_t v8;
  RBProcessIndex *processIndex;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  RBProcessIndex *v25;
  void *v26;
  RBJetsamPropertyManaging *jetsamPropertytManager;
  uint64_t v28;
  uint64_t v29;
  RBProcess *v30;
  NSObject *v31;
  RBProcessIndex *v32;
  NSObject *v33;
  NSMutableDictionary *identityToPendingExitBlock;
  void *v35;
  void (**v36)(_QWORD);
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  id v41;
  dispatch_block_t v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void (**v57)(void);
  void *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  _BYTE *v62;
  uint64_t *v63;
  _QWORD block[5];
  id v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE buf[24];
  char v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v59 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instance"));

  }
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__5;
  v71 = __Block_byref_object_dispose__5;
  objc_msgSend(v7, "identity");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68[5])
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  if (!v58)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 1158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if ((objc_msgSend(v59, "isDaemon") & 1) != 0)
  {
    v8 = 2;
  }
  else
  {
    if (!objc_msgSend(v59, "isAngel"))
      goto LABEL_12;
    v8 = 3;
  }
  objc_msgSend((id)v68[5], "setOsServiceType:", v8);
LABEL_12:
  os_unfair_lock_lock(&self->_pendingExitBlockLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_identityToPendingExitBlock, "objectForKeyedSubscript:", v68[5]);
  v57 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_pendingExitBlockLock);
  processIndex = self->_processIndex;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessIndex processForIdentifier:](processIndex, "processForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  rbs_ttl_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEFAULT, "existingInstance is: %{public}@", buf, 0xCu);
  }

  if (v11
    && (objc_msgSend(v11, "identity"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isExtension"),
        v13,
        v14))
  {
    rbs_process_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.4((uint64_t)v11, buf, objc_msgSend(v11, "rbs_pid"), v15);

    v16 = v11;
  }
  else
  {
    -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v68[5]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      if (v56)
      {
        objc_msgSend(v56, "handle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pid");
        v18 = RBSPIDExists();

        if (v18)
        {
          rbs_process_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.3();

        }
      }
      rbs_process_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v68[5];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v56;
        _os_log_impl(&dword_21A8B4000, v20, OS_LOG_TYPE_DEFAULT, "New process with identity (%{public}@) detected with pending exit from a prior process (%{public}@).  Forcing cleanup of the prior instance immediately.", buf, 0x16u);
      }

      v57[2]();
    }
    objc_msgSend(MEMORY[0x24BE80C10], "taskNameForPID:", objc_msgSend(v7, "rbs_pid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "auditToken");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22 && v23)
    {
      v25 = self->_processIndex;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v59, "hostPid"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcessIndex processForIdentifier:](v25, "processForIdentifier:", v26);
      v55 = objc_claimAutoreleasedReturnValue();

      -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v68[5]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](self->_bundlePropertiesManager, "propertiesForIdentity:identifier:", v68[5], v58);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      jetsamPropertytManager = self->_jetsamPropertytManager;
      v28 = objc_msgSend(v58, "rbs_pid");
      v29 = v68[5];
      objc_msgSend(v24, "realToken");
      -[RBJetsamPropertyManaging jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:](jetsamPropertytManager, "jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:", v28, v29, v54, RBSAuditTokenRepresentsPlatformBinary());
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = [RBProcess alloc];
      LOBYTE(v49) = self->_systemPreventsIdleSleep;
      v16 = -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:](v30, "_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:", v7, v24, v54, v51, v53, v55, v59, v49);
      if (v16)
      {
        rbs_ttl_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl(&dword_21A8B4000, v31, OS_LOG_TYPE_DEFAULT, "Now tracking process: %{public}@", buf, 0xCu);
        }

        v32 = self->_processIndex;
        v66 = 0;
        -[RBProcessIndex addProcess:existingProcess:](v32, "addProcess:existingProcess:", v16, &v66);
        v52 = v66;
        rbs_ttl_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v52;
          _os_log_impl(&dword_21A8B4000, v33, OS_LOG_TYPE_DEFAULT, "existingProcess in RBProcessManager is: %{public}@", buf, 0xCu);
        }

        -[RBHistoricalStatisticsMaintaining notifyProcessCount:](self->_historicalStatistics, "notifyProcessCount:", -[RBProcessIndex count](self->_processIndex, "count"));
        if (v52)
        {
          os_unfair_lock_lock(&self->_pendingExitBlockLock);
          identityToPendingExitBlock = self->_identityToPendingExitBlock;
          -[NSObject identity](v52, "identity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](identityToPendingExitBlock, "objectForKeyedSubscript:", v35);
          v36 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

          os_unfair_lock_unlock(&self->_pendingExitBlockLock);
          if (v36)
          {
            rbs_process_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v52;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v16;
              _os_log_impl(&dword_21A8B4000, v37, OS_LOG_TYPE_DEFAULT, "Cleaning up (%{public}@) which was exec'ed into (%{public}@)", buf, 0x16u);
            }

            v36[2](v36);
          }

        }
        -[RBProcessManager _getLifecycleQueueForIdentity:](self, "_getLifecycleQueueForIdentity:", v68[5]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
        v39 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke;
        block[3] = &unk_24DD45FF0;
        block[4] = self;
        v40 = v16;
        v65 = v40;
        dispatch_async(v38, block);

        -[RBProcessManagerDelegate processManager:didAddProcess:withState:](self->_delegate, "processManager:didAddProcess:withState:", self, v40, v53);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v74 = 0;
        v60[0] = v39;
        v60[1] = 3221225472;
        v60[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2;
        v60[3] = &unk_24DD47410;
        v62 = buf;
        v60[4] = self;
        v63 = &v67;
        v41 = v40;
        v61 = v41;
        v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v60);
        os_unfair_lock_lock(&self->_pendingExitBlockLock);
        v43 = (void *)MEMORY[0x22074BF04](v42);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identityToPendingExitBlock, "setObject:forKeyedSubscript:", v43, v68[5]);

        os_unfair_lock_unlock(&self->_pendingExitBlockLock);
        -[RBLaunchdJobManager invokeOnProcessDeath:handler:onQueue:](self->_jobManager, "invokeOnProcessDeath:handler:onQueue:", v41, v42, v50);
        v44 = v41;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        rbs_process_log();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.2();
      }

    }
    else
    {
      rbs_process_log();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.1();
      v16 = 0;
    }

  }
  _Block_object_dispose(&v67, 8);

  return v16;
}

- (void)executeLaunchRequest:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v32 = 0;
  -[RBProcessManager _executeLaunchRequest:withError:](self, "_executeLaunchRequest:withError:", v7, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  v11 = v10;
  if (v9)
  {
    v25 = v10;
    v26 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v7;
    objc_msgSend(v7, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedEndpointLaunchIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v9, "managedEndpointByLaunchIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            if (v16)
            {
              objc_msgSend(v16, "setObject:forKey:", v21, v19);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v21, v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v9, "handle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v16, "copy");
    v11 = v25;
    v8 = v26;
    (*((void (**)(id, void *, void *, id))v26 + 2))(v26, v22, v23, v25);

    v7 = v27;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v8 + 2))(v8, 0, 0, v10);
  }

}

- (id)_executeLaunchRequest:(id)a3 withError:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  RBSystemState *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id v43;
  id v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    rbs_process_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "explanation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Executing launch request for %{public}@ (%{public}@)", buf, 0x16u);

    }
    objc_msgSend(v8, "requiredExistingProcess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_8;
    os_unfair_lock_lock(&self->_lock);
    v15 = self->_systemState;
    os_unfair_lock_unlock(&self->_lock);
    v44 = 0;
    v24 = objc_msgSend(v8, "_launchAllowedBySystemState:error:", v15, &v44);
    v25 = v44;
    v26 = v25;
    if (v24)
    {
      v43 = v25;
      v27 = objc_msgSend(v8, "_passesRegulatoryChecksWithError:", &v43);
      v28 = v43;

      if ((v27 & 1) != 0)
      {

LABEL_8:
        -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v10);
        v15 = (RBSystemState *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "initialRole");
        if (v16 < -[RBSystemState role](v15, "role"))
          objc_msgSend(v8, "setInitialRole:", -[RBSystemState role](v15, "role"));
        v17 = objc_msgSend(v8, "hostPid");
        if ((int)v17 >= 1)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setHostProcess:", v19);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v46 = __Block_byref_object_copy__5;
        v47 = __Block_byref_object_dispose__5;
        v48 = 0;
        v37 = 0;
        v38 = &v37;
        v39 = 0x3032000000;
        v40 = __Block_byref_object_copy__5;
        v41 = __Block_byref_object_dispose__5;
        v42 = 0;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __52__RBProcessManager__executeLaunchRequest_withError___block_invoke;
        v31[3] = &unk_24DD47330;
        v31[4] = self;
        v32 = v10;
        v33 = v14;
        v35 = buf;
        v36 = &v37;
        v34 = v8;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:](self, "_executeLifecycleEventForIdentity:sync:withBlock:", v32, 1, v31);
        if (a4)
          *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        v20 = (id)v38[5];

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(buf, 8);

LABEL_25:
        goto LABEL_26;
      }
      v26 = v28;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v26);

    v20 = 0;
    goto LABEL_25;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE80E48];
    objc_msgSend(v21, "setObject:forKey:", CFSTR("Launch prevented due to invalid parameters"), *MEMORY[0x24BDD0FD8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v22, 1, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    *a4 = v23;
  }
  else
  {
    v20 = 0;
  }
LABEL_26:

  return v20;
}

void __52__RBProcessManager__executeLaunchRequest_withError___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 88), "processForIdentity:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1[6])
  {
    if (v2
      && (objc_msgSend(v2, "identifier"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqual:", a1[6]),
          v4,
          v5))
    {
      rbs_process_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = a1[5];
        *(_DWORD *)buf = 138543618;
        v33 = v7;
        v34 = 2114;
        v35 = v3;
        _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@ which matches the requiredExistingProcess", buf, 0x16u);
      }

      v8 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", CFSTR("The process was already running as expected."), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v8, 2, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = *(_QWORD *)(a1[8] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(_QWORD *)(a1[9] + 8);
      v14 = v3;
      v15 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v14;
    }
    else
    {
      rbs_process_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = a1[5];
        v18 = a1[6];
        *(_DWORD *)buf = 138543874;
        v33 = v17;
        v34 = 2114;
        v35 = v3;
        v36 = 2112;
        v37 = v18;
        _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@ which doesn't match requiredExistingProcess of %@", buf, 0x20u);
      }

      v19 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", CFSTR("The running process did not match the expected."), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v19, 3, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = *(_QWORD *)(a1[8] + 8);
      v15 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;
    }
  }
  else
  {
    v23 = a1[5];
    v24 = *(void **)(a1[4] + 56);
    v25 = a1[7];
    v31 = 0;
    objc_msgSend(v24, "executeLaunchRequest:existingProcess:requestIdentity:withError:", v25, v3, v23, &v31);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v31;
    v28 = *(_QWORD *)(a1[9] + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v26;

    v30 = *(_QWORD *)(a1[8] + 8);
    v15 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v27;
  }

}

- (id)processForAuditToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", objc_msgSend(v4, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:](self, "_processForIdentifier:withAuditToken:forceStartTracking:", v5, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "valueForIdentity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 76));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 76));
    objc_msgSend(*(id *)(a1 + 32), "_removeProcess:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_releaseLifecycleQueueForIdentity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (objc_msgSend(v3, "guaranteedRunning"))
    {
      rbs_process_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "Exiting process %@ is GuaranteedRunning", (uint8_t *)&v6, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_enqueueGuaranteedRunningLaunchForIdentity:atTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0.0);
    }

  }
}

- (void)_removeProcess:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  RBLaunchdJobManager *jobManager;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  RBPrewarmManager *prewarmManager;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  rbs_process_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Removing process: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v4, "invalidate");
  -[RBProcessIndex addProcess:](self->_processGraveyard, "addProcess:", v4);
  -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", v4);
  -[RBHistoricalStatisticsMaintaining notifyProcessCount:](self->_historicalStatistics, "notifyProcessCount:", -[RBProcessIndex count](self->_processIndex, "count"));
  v6 = (id)objc_msgSend(v4, "lastExitContext");
  jobManager = self->_jobManager;
  objc_msgSend(v4, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = -[RBLaunchdJobManager removeJobWithInstance:error:](jobManager, "removeJobWithInstance:error:", v8, &v15);
  v10 = v15;

  if (!v9)
  {
    rbs_process_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Error deleting launchd job: <%{public}@>", buf, 0x16u);

    }
  }
  -[RBProcessManagerDelegate processManager:didRemoveProcess:](self->_delegate, "processManager:didRemoveProcess:", self, v4);
  -[RBBundlePropertiesManaging removeProcess:](self->_bundlePropertiesManager, "removeProcess:", v4);
  prewarmManager = self->_prewarmManager;
  objc_msgSend(v4, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBPrewarmManager identityDidTerminate:](prewarmManager, "identityDidTerminate:", v14);

}

void __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_processForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_lifecycleQueue_addProcessWithInstance:properties:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (void)removeStateForProcessIdentity:(id)a3
{
  -[RBProcessMap removeIdentity:](self->_processState, "removeIdentity:", a3);
}

void __41__RBProcessManager_stateApplicationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x24BE80D58], "createSyncingQueue:", CFSTR("RBProcessManagerStateApplicator"));
  v1 = (void *)stateApplicationQueue_queue;
  stateApplicationQueue_queue = v0;

}

- (RBProcessManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 345, CFSTR("-init is not allowed on RBProcessManager"));

  return 0;
}

- (RBProcessManager)initWithBundlePropertiesManager:(id)a3 entitlementManager:(id)a4 jetsamPropertytManager:(id)a5 timeProvider:(id)a6 historialStatistics:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RBProcessManager *v19;
  RBProcessManager *v20;
  RBPersonaManager *v21;
  RBContainerManager *v22;
  RBPrewarmManager *v23;
  RBPrewarmManager *prewarmManager;
  RBLaunchdJobManager *v25;
  void *v26;
  uint64_t v27;
  RBLaunchdJobManager *jobManager;
  RBLaunchManager *v29;
  RBLaunchManager *launchManager;
  uint64_t v31;
  RBProcessIndex *processIndex;
  uint64_t v33;
  RBProcessIndex *processGraveyard;
  RBProcessMap *v35;
  RBProcessMap *processState;
  uint64_t v37;
  NSMutableDictionary *identityToPendingExitBlock;
  uint64_t v39;
  NSMutableDictionary *identityToProcessLifecycleQueue;
  uint64_t v41;
  NSCountedSet *lifecycleQueuesInUse;
  id v44;
  id v45;
  objc_super v46;

  v15 = a3;
  v45 = a4;
  v44 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v46.receiver = self;
  v46.super_class = (Class)RBProcessManager;
  v19 = -[RBProcessManager init](&v46, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bundlePropertiesManager, a3);
    objc_storeStrong((id *)&v20->_entitlementManager, a4);
    objc_storeStrong((id *)&v20->_delegate, a8);
    v20->_pendingExitBlockLock._os_unfair_lock_opaque = 0;
    v20->_lock._os_unfair_lock_opaque = 0;
    v21 = objc_alloc_init(RBPersonaManager);
    v22 = -[RBContainerManager initWithPersonaManager:]([RBContainerManager alloc], "initWithPersonaManager:", v21, v44, v45);
    objc_storeStrong((id *)&v20->_jetsamPropertytManager, a5);
    objc_storeStrong((id *)&v20->_historicalStatistics, a7);
    v23 = -[RBPrewarmManager initWithDelegate:timeProvider:]([RBPrewarmManager alloc], "initWithDelegate:timeProvider:", v20, v16);
    prewarmManager = v20->_prewarmManager;
    v20->_prewarmManager = v23;

    v25 = [RBLaunchdJobManager alloc];
    +[RBLaunchdInterface interface](RBLaunchdInterface, "interface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[RBLaunchdJobManager initWithLaunchdInterface:personaManager:containerManager:bundlePropertiesManager:](v25, "initWithLaunchdInterface:personaManager:containerManager:bundlePropertiesManager:", v26, v21, v22, v15);
    jobManager = v20->_jobManager;
    v20->_jobManager = (RBLaunchdJobManager *)v27;

    v29 = -[RBLaunchManager initWithJobManager:timeProvider:delegate:]([RBLaunchManager alloc], "initWithJobManager:timeProvider:delegate:", v20->_jobManager, v16, v20);
    launchManager = v20->_launchManager;
    v20->_launchManager = v29;

    +[RBProcessIndex index](RBProcessIndex, "index");
    v31 = objc_claimAutoreleasedReturnValue();
    processIndex = v20->_processIndex;
    v20->_processIndex = (RBProcessIndex *)v31;

    +[RBProcessIndex indexWithCapacity:](RBProcessIndex, "indexWithCapacity:", 32);
    v33 = objc_claimAutoreleasedReturnValue();
    processGraveyard = v20->_processGraveyard;
    v20->_processGraveyard = (RBProcessIndex *)v33;

    v35 = objc_alloc_init(RBProcessMap);
    processState = v20->_processState;
    v20->_processState = v35;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v37 = objc_claimAutoreleasedReturnValue();
    identityToPendingExitBlock = v20->_identityToPendingExitBlock;
    v20->_identityToPendingExitBlock = (NSMutableDictionary *)v37;

    os_unfair_lock_lock(&v20->_lock);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v39 = objc_claimAutoreleasedReturnValue();
    identityToProcessLifecycleQueue = v20->_identityToProcessLifecycleQueue;
    v20->_identityToProcessLifecycleQueue = (NSMutableDictionary *)v39;

    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v41 = objc_claimAutoreleasedReturnValue();
    lifecycleQueuesInUse = v20->_lifecycleQueuesInUse;
    v20->_lifecycleQueuesInUse = (NSCountedSet *)v41;

    os_unfair_lock_unlock(&v20->_lock);
  }

  return v20;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  RBSystemState *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_systemState;
  os_unfair_lock_unlock(p_lock);
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessMap dictionary](self->_processState, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entriesToStringWithIndent:debug:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(",\n\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@| system state:%@ process states:{\n%@\t} processes:[%@\n\t]>"), v6, v4, v8, v10);

  return (NSString *)v11;
}

- (void)start
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __25__RBProcessManager_start__block_invoke;
  activity_block[3] = &unk_24DD46160;
  activity_block[4] = self;
  _os_activity_initiate(&dword_21A8B4000, "state recovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __25__RBProcessManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "synchronizeJobs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        rbs_process_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v7;
          _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "Reestablishing with %{public}@...", buf, 0xCu);
        }

        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RBLaunchdProperties propertiesForPid:](RBLaunchdProperties, "propertiesForPid:", objc_msgSend(v9, "pid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "_lifecycleQueue_addProcessWithInstance:properties:", v7, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeJobWithInstance:error:", v7, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v4);
  }

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  v14 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(v12 + 88), "allProcesses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processManager:didReconnectProcesses:", v12, v16);

}

- (void)systemPreventIdleSleepStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  RBProcessIndex *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_systemPreventsIdleSleep = v3;
  os_unfair_lock_unlock(p_lock);
  if (!v3)
  {
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_DEFAULT, "Shutdown sockets for all suspended processes", buf, 2u);
    }

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_processIndex;
  v8 = -[RBProcessIndex countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "identity", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:](self, "_executeLifecycleEventForIdentity:sync:withBlock:", v13, 1, &__block_literal_global_73);

        objc_msgSend(v12, "_systemPreventIdleSleepStateDidChange:", v3);
      }
      v9 = -[RBProcessIndex countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (BOOL)_canTerminateProcess:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "maximumTerminationResistance");
  if (v12 && objc_msgSend(v11, "terminationResistance") > v12)
  {
    if (a5)
    {
      v13 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", CFSTR("Target process has a higher termination resistance than the termination context"), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v13, 4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      *a5 = v15;
    }
    rbs_process_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v23 = 138543362;
    v24 = v8;
    v17 = "Termination request for %{public}@ failed due to termination resistance";
    goto LABEL_14;
  }
  if (!objc_msgSend(v9, "preventIfBeingDebugged")
    || (objc_msgSend(v8, "isBeingPtraced") & 1) == 0 && !objc_msgSend(v11, "isBeingDebugged"))
  {
    v21 = 1;
    goto LABEL_17;
  }
  if (a5)
  {
    v18 = *MEMORY[0x24BE80E48];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", CFSTR("Target process is being debugged and termination context forbids request"), *MEMORY[0x24BDD0FD8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v18, 4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    *a5 = v20;
  }
  rbs_process_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = v8;
    v17 = "Termination request for %{public}@ failed due to target being debugged";
LABEL_14:
    _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, 0xCu);
  }
LABEL_15:

  v21 = 0;
LABEL_17:

  return v21;
}

- (void)executeTerminateRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  int v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t k;
  void *v53;
  _BOOL4 v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  __CFString *v62;
  void (**v63)(id, _QWORD, void *);
  void (**v64)(id, _QWORD, void *);
  uint64_t v65;
  uint64_t v66;
  int v67;
  char v68;
  void *v69;
  unsigned int v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessManager.m"), 692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v6, "context");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "targetsAllManagedProcesses");
  objc_msgSend(v6, "predicate");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  rbs_process_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("all-managed");
    if (!v8)
      v11 = v9;
    *(_DWORD *)buf = 138543362;
    v92 = (uint64_t)v11;
    _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Executing termination request for: %{public}@", buf, 0xCu);
  }

  if (v9)
    v12 = 1;
  else
    v12 = v8;
  if (!v69 || (v12 & 1) == 0)
  {
    rbs_process_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[RBProcessManager executeTerminateRequest:completion:].cold.3();

    if (v7)
    {
      v22 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", CFSTR("Invalid termination context"), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v22, 1, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v13);
      goto LABEL_82;
    }
    goto LABEL_83;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v13;
  if (v8)
  {
    v89 = 0uLL;
    v90 = 0uLL;
    v87 = 0uLL;
    v88 = 0uLL;
    -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v15)
    {
      v16 = v15;
      v67 = v8;
      v17 = v9;
      v18 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v88 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          if (objc_msgSend(v20, "isReported"))
            objc_msgSend(v13, "addObject:", v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v16);
LABEL_37:
      v9 = v17;
      v8 = v67;
    }
  }
  else
  {
    v85 = 0uLL;
    v86 = 0uLL;
    v83 = 0uLL;
    v84 = 0uLL;
    -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v24)
    {
      v25 = v24;
      v67 = 0;
      v17 = v9;
      v63 = v7;
      v26 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v84 != v26)
            objc_enumerationMutation(v14);
          v28 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_msgSend(v28, "handle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[__CFString matchesProcess:](v17, "matchesProcess:", v29);

          v13 = v72;
          if (v30)
            objc_msgSend(v72, "addObject:", v28);
        }
        v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
      }
      while (v25);
      v7 = v63;
      goto LABEL_37;
    }
  }

  rbs_process_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134217984;
    v92 = v32;
    _os_log_impl(&dword_21A8B4000, v31, OS_LOG_TYPE_DEFAULT, "Found %lu processes to terminate", buf, 0xCu);
  }

  if (!objc_msgSend(v13, "count"))
  {
    rbs_process_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      -[RBProcessManager executeTerminateRequest:completion:].cold.1();

    if (v7)
    {
      v43 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", CFSTR("No such process found"), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v43, 3, v44);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0, v33);
      goto LABEL_81;
    }
    goto LABEL_82;
  }
  if (objc_msgSend(v69, "reportType") == 2 || objc_msgSend(v69, "reportType") == 3)
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "anyObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      v34 = -[RBProcessManager _canTerminateProcess:withContext:error:](self, "_canTerminateProcess:withContext:error:", v33, v69, &v82);
      v35 = v82;
      if (v34)
      {
        v36 = objc_msgSend(v69, "reportType");
        objc_msgSend(v69, "explanation");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v69, "exceptionDomain");
        v38 = objc_msgSend(v69, "exceptionCode");
        objc_msgSend(v69, "additionalPayload");
        v39 = v7;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __55__RBProcessManager_executeTerminateRequest_completion___block_invoke;
        v78[3] = &unk_24DD47358;
        v79 = v69;
        v80 = v33;
        v81 = v39;
        v41 = v38;
        v13 = v72;
        objc_msgSend(v80, "collectDiagnostic:description:domain:code:additionalPayload:completion:", v36, v37, v71, v41, v40, v78);

        v7 = (void (**)(id, _QWORD, void *))v39;
      }
      else if (v7)
      {
        v7[2](v7, 0, v35);
      }

      goto LABEL_81;
    }
    rbs_process_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[RBProcessManager executeTerminateRequest:completion:].cold.2();

    objc_msgSend(v69, "setReportType:", 1);
  }
  v62 = v9;
  v64 = v7;
  v61 = v6;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v46 = v13;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
  if (!v47)
  {
    v33 = 0;
    v68 = 1;
    goto LABEL_75;
  }
  v48 = v47;
  v49 = v8;
  v33 = 0;
  v50 = *(_QWORD *)v75;
  v65 = *MEMORY[0x24BDD0FD8];
  v66 = *MEMORY[0x24BE80E48];
  v68 = 1;
  v51 = v69;
  do
  {
    for (k = 0; k != v48; ++k)
    {
      if (*(_QWORD *)v75 != v50)
        objc_enumerationMutation(v46);
      v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
      v73 = 0;
      v54 = -[RBProcessManager _canTerminateProcess:withContext:error:](self, "_canTerminateProcess:withContext:error:", v53, v51, &v73);
      v55 = v73;

      if (v54)
      {
        if ((objc_msgSend(v53, "terminateWithContext:", v51) & 1) != 0)
          goto LABEL_63;
        rbs_process_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = (uint64_t)v53;
          _os_log_error_impl(&dword_21A8B4000, v56, OS_LOG_TYPE_ERROR, "failed to terminate %{public}@", buf, 0xCu);
        }

        if ((v49 & 1) != 0)
        {
LABEL_63:
          v33 = v55;
          continue;
        }
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKey:", CFSTR("Termination failed"), v65);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v66, 5, v59);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = 0;
      }
      else
      {
        rbs_process_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v55, "localizedFailureReason");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v92 = (uint64_t)v53;
          v93 = 2114;
          v94 = v58;
          _os_log_impl(&dword_21A8B4000, v57, OS_LOG_TYPE_INFO, "skipping %{public}@ for reason : %{public}@", buf, 0x16u);

        }
        if (!v49)
        {
          v68 = 0;
          v33 = v55;
          v51 = v69;
          continue;
        }
        v33 = 0;
        v51 = v69;
      }

    }
    v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
  }
  while (v48);
LABEL_75:

  v7 = v64;
  if (v64)
    v64[2](v64, v68 & 1, v33);
  v6 = v61;
  v9 = v62;
  v13 = v72;
LABEL_81:

LABEL_82:
LABEL_83:

}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x24BE80E48];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Diagnostic collection failed"), *MEMORY[0x24BDD0FD8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setReportType:", 1);
    v5 = (id)v8;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "terminateWithContext:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
  else
  {
    rbs_process_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);

    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
    {
      v18 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", CFSTR("Termination failed"), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v18, 5, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v20);
    }
  }

}

- (id)busyExtensionInstancesFromSet:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  rbs_process_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_INFO, "matching extension instances: %{public}@", buf, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isSuspended") & 1) == 0)
        {
          objc_msgSend(v12, "identity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "xpcServiceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && objc_msgSend(v4, "containsObject:", v14))
            objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_enqueueGuaranteedRunningLaunchForIdentity:(id)a3 atTime:(double)a4
{
  id v6;
  double v7;
  double v8;
  dispatch_time_t v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  dispatch_time_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  RBProcessManager *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  RBSMachAbsoluteTime();
  v8 = v7;
  v9 = dispatch_time(0, 0);
  v10 = fmax(a4 - v8, 0.0);
  rbs_process_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2048;
    v25 = v10;
    _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing GuaranteedRunning launch for %@ in %0.2fs", buf, 0x16u);
  }

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke;
  v19 = &unk_24DD45FF0;
  v20 = self;
  v12 = v6;
  v21 = v12;
  v13 = (void *)MEMORY[0x22074BF04](&v16);
  if (fabs(v10) >= 2.22044605e-16)
  {
    v15 = dispatch_time(v9, (uint64_t)(v10 * 1000000000.0));
    +[RBProcessManager stateApplicationQueue](RBProcessManager, "stateApplicationQueue", v16, v17, v18, v19, v20);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v15, v14, v13);
  }
  else
  {
    +[RBProcessManager stateApplicationQueue](RBProcessManager, "stateApplicationQueue", v16, v17, v18, v19, v20);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, v13);
  }

}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "valueForIdentity:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "guaranteedRunning"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "processForIdentity:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_10:
      rbs_process_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v2;
        *(_DWORD *)buf = 138412290;
        v34 = v14;
        _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "Applying state after GuaranteedRunning launch of %@", buf, 0xCu);
      }

      v16 = *(void **)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_103;
      v29[3] = &unk_24DD45E60;
      v29[4] = v16;
      v30 = v15;
      v31 = v4;
      objc_msgSend(v16, "_executeLifecycleEventForIdentity:sync:withBlock:", v30, 0, v29);

      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v8);
    v10 = *(void **)(a1 + 32);
    v32 = 0;
    objc_msgSend(v10, "_executeLaunchRequest:withError:", v9, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    if (v11)
    {

      goto LABEL_10;
    }
    rbs_process_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v18)
        __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3(v2);

      if (objc_msgSend(v12, "code") != 6)
        goto LABEL_26;
      objc_msgSend(v12, "userInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v17, "objectForKey:", *MEMORY[0x24BE80E60]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        rbs_general_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2();

      }
      v28 = *(void **)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v25, "doubleValue");
      objc_msgSend(v28, "_enqueueGuaranteedRunningLaunchForIdentity:atTime:", v27);

    }
    else if (v18)
    {
      __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1((uint64_t)v2, v17, v19, v20, v21, v22, v23, v24);
    }

LABEL_26:
    goto LABEL_13;
  }
  rbs_process_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *v2;
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_DEFAULT, "Bailing previously enqueued GuaranteedRunning launch of %@ because it is now out-of-state", buf, 0xCu);
  }

LABEL_13:
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_103(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 88), "processForIdentity:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "_applyState:", a1[6]);
    v2 = v3;
  }

}

- (void)applySystemState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  RBPrewarmManager *prewarmManager;
  RBSystemState *v9;
  RBSystemState *systemState;
  id v11;

  v11 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v11, "prewarmConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSystemState prewarmConfiguration](self->_systemState, "prewarmConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    if (v4 && v5)
    {
      v7 = objc_msgSend(v4, "isEqual:", v5);

      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    prewarmManager = self->_prewarmManager;
    objc_msgSend(v11, "prewarmConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBPrewarmManager prewarmingConfigurationDidChange:](prewarmManager, "prewarmingConfigurationDidChange:", v4);
  }

LABEL_10:
  v9 = (RBSystemState *)objc_msgSend(v11, "copy");
  systemState = self->_systemState;
  self->_systemState = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_processForInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessManager _processForIdentifier:](self, "_processForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if ((v8 & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleQueuesInUse, 0);
  objc_storeStrong((id *)&self->_identityToProcessLifecycleQueue, 0);
  objc_storeStrong((id *)&self->_identityToPendingExitBlock, 0);
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_processGraveyard, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_launchManager, 0);
  objc_storeStrong((id *)&self->_prewarmManager, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_jetsamPropertytManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_jobManager, 0);
}

- (void)_processForIdentifier:withAuditToken:forceStartTracking:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ queried in _processForIdentifier but is already dead!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_processForIdentifier:(uint64_t)a3 withAuditToken:(NSObject *)a4 forceStartTracking:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13(&dword_21A8B4000, a4, a3, "AUID of process has changed from %{public}@ to %{public}@", (uint8_t *)a3);

}

- (void)executeTerminateRequest:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_DEBUG, "no process found to terminate : %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)executeTerminateRequest:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Terminate request attempted with multiple stackshots : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)executeTerminateRequest:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "invalid terminate request : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "failed to terminate %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "Failed GuaranteedRunning launch of %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13(&dword_21A8B4000, v0, (uint64_t)v0, "Backoff triggered without backoff time %{public}@ : %{public}@", v1);
  OUTLINED_FUNCTION_1_1();
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v1, v2, "Failed GuaranteedRunning launch of %@ because of %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveProcessWithIdentifier:(int)a1 auditToken:(NSObject *)a2 properties:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "failed to determine identity for pid=%d", (uint8_t *)v2, 8u);
}

- (void)_resolveProcessWithIdentifier:(uint64_t)a1 auditToken:(int)a2 properties:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_fault_impl(&dword_21A8B4000, log, OS_LOG_TYPE_FAULT, "_resolveProcessWithIdentifier could not get auid/euid for pid %d auditToken %{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_getLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn("-[RBProcessManager _getLifecycleQueueForIdentity:]", "RBProcessManager.m", 1121, "[_lifecycleQueuesInUse countForObject:identity] == 0");
}

- (void)_releaseLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn("-[RBProcessManager _releaseLifecycleQueueForIdentity:]", "RBProcessManager.m", 1143, "countBefore != 0");
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ Cannot track instance that is already dead!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Failed to create process object for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Prior process for %@ is reporting a pid when we're not expecting it to (should be dead).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lifecycleQueue_addProcessWithInstance:(int)a3 properties:(os_log_t)log .cold.4(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "We already have an extension %@ with this pid: %d, were two launches for the same extension executed? Returning the existing instance.", buf, 0x12u);
}

@end
