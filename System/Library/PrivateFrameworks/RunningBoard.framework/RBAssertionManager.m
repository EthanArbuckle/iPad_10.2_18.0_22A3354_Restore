@implementation RBAssertionManager

- (id)popPluginHoldForAssertion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_pluginHoldsForAssertions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_pluginHoldsForAssertions, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

uint64_t __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didEndTrackingInFightUpdatesForProcessIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didBeginTrackingInFightUpdatesForProcessIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_lock_assertionCreationAttributeContextForTargetIdentity:(id)a3 originator:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  RBAttributeContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v9 = objc_alloc_init(RBAttributeContext);
  -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeContext setEntitlementManager:](v9, "setEntitlementManager:", v10);

  -[RBDaemonContextProviding domainAttributeManager](self->_daemonContext, "domainAttributeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeContext setDomainAttributeManager:](v9, "setDomainAttributeManager:", v11);

  -[RBAttributeContext setBundlePropertiesManager:](v9, "setBundlePropertiesManager:", self->_bundlePropertiesManager);
  -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAttributeContext setInitialProcessState:](v9, "setInitialProcessState:", v12);
  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAttributeContext setSavedEndowments:](v9, "setSavedEndowments:", v13);
  -[RBAttributeContext setSystemState:](v9, "setSystemState:", self->_systemState);
  return v9;
}

- (id)_lock_savedEndowmentsForProcess:(id)a3
{
  return -[NSMapTable objectForKey:](self->_savedEndowments, "objectForKey:", a3);
}

- (double)_remainingRuntimeForProcessIdentity:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  unsigned int v25;
  void *v27;
  BOOL v28;
  double v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  v6 = v5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v31 = v4;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v33;
    v13 = 0.0;
    v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v16, "isActive"))
        {
          objc_msgSend(v16, "invalidationDuration");
          if (v17 <= 0.0)
          {
            objc_msgSend(v16, "processState");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "role") > 1;

            v11 |= v28;
          }
          else
          {
            v18 = v17;
            -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v16);
            v20 = v19;
            v21 = objc_msgSend(v16, "endPolicy");
            v22 = v18 + v20 - v6;
            if (v14 >= v22)
              v23 = v22;
            else
              v23 = v14;
            if (v21 == 2)
              v14 = v23;
            v10 |= v21 == 2;
            objc_msgSend(v16, "processState");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "role");

            if (v13 < v22 && v25 > 1)
              v13 = v22;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);

    os_unfair_lock_unlock(&self->_lock);
    if ((v11 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        v13 = v14;
      else
        v13 = *MEMORY[0x24BE80E38];
      v4 = v31;
    }
    else
    {
      v4 = v31;
      if ((v10 & 1) != 0)
      {
        if (v14 >= v13)
          v29 = v13;
        else
          v29 = v14;
        if (v13 > 0.0)
          v13 = v29;
        else
          v13 = 0.0;
      }
    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
    v13 = 0.0;
  }

  return v13;
}

- (double)_lock_startTimeForAssertion:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  RBTimeProviding *timeProvider;
  void *v15;
  void *v16;
  double v17;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v4, "creationTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "startPolicy");
  if (v7 > 100)
  {
    if (v7 == 101)
    {
      -[RBAssertionManager _lock_relativeStartTimeForAssertion:](self, "_lock_relativeStartTimeForAssertion:", v4);
    }
    else
    {
      if (v7 != 102)
      {
        if (v7 == 103)
        {
          -[RBAssertionManager _lock_delayedStartTimeForAssertion:](self, "_lock_delayedStartTimeForAssertion:", v4);
          v6 = v8;
          objc_msgSend(v4, "creationTime");
          if (v6 < v9)
            v6 = v9;
        }
        goto LABEL_14;
      }
      -[RBAssertionManager _lock_delayedStartTimeForAssertion:](self, "_lock_delayedStartTimeForAssertion:", v4);
    }
LABEL_13:
    v6 = v10;
    goto LABEL_14;
  }
  if (v7 != 2)
  {
    if (v7 != 3)
      goto LABEL_14;
    -[RBAssertionManager _lock_originatorExitTimeForAssertion:](self, "_lock_originatorExitTimeForAssertion:", v4);
    goto LABEL_13;
  }
  objc_msgSend(v4, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "process");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    timeProvider = self->_timeProvider;
    objc_msgSend(v4, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "process");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBTimeProviding startTimeForProcess:](timeProvider, "startTimeForProcess:", v16);
    v6 = v17;

  }
LABEL_14:

  return v6;
}

- (void)commitBatchWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  void *v43;
  void *v44;
  void *v45;
  NSObject *workloop;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  os_unfair_lock_t lock;
  void *v54;
  void (**v55)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v56;
  void *v57;
  uint64_t v58;
  RBAssertionManager *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id obj;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void (**v81)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  _QWORD v88[5];
  id v89;
  id v90;
  _QWORD *v91;
  SEL v92;
  _QWORD v93[3];
  char v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  id v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workloop);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_calloutQueue);
  v59 = self;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionManager.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchContext"));

  }
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v94 = 0;
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke;
  v88[3] = &unk_24DD46220;
  v91 = v93;
  v92 = a2;
  v88[4] = self;
  v60 = v7;
  v89 = v60;
  v52 = v8;
  v90 = v52;
  v55 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22074BF04](v88);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v60, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v60, "acquisitionPolicy");
  if (v11 == 1)
  {
    v12 = 1;
  }
  else if (-[RBAssertionManager _lock_batchContextInvalidatesSynchronously:](self, "_lock_batchContextInvalidatesSynchronously:", v60))
  {
    v12 = 1;
  }
  else
  {
    v12 = v11;
  }
  v58 = v12;
  objc_msgSend(v60, "descriptorsToAcquire");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v10;
  v14 = objc_msgSend(v13, "count") == 0;

  if (v14)
  {
    v51 = 0;
  }
  else
  {
    v87 = 0;
    v15 = -[RBAssertionManager _lock_enforceAssertionLimitIfNecessaryForBatchContext:originatorProcess:error:](self, "_lock_enforceAssertionLimitIfNecessaryForBatchContext:originatorProcess:error:", v60, v57, &v87);
    v16 = v87;
    if (v15)
    {
      os_unfair_lock_unlock(lock);
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v55)[2](v55, 0, 0, v16);
      goto LABEL_39;
    }
    -[RBProcessMap valueForIdentity:](v59->_stateMap, "valueForIdentity:", v54);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v49 = objc_claimAutoreleasedReturnValue();
    v48 = v16;

    -[RBAssertionManager _lock_createAssertionsForBatchContext:originatorState:errorsByIndex:](v59, "_lock_createAssertionsForBatchContext:originatorState:errorsByIndex:", v60, v50, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
    {
      v58 = -[RBAssertionManager _lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:completionPolicy:](v59, "_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:completionPolicy:", v51, v58);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      obj = v51;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
      if (v17)
      {
        v62 = *(_QWORD *)v84;
        do
        {
          v64 = v17;
          for (i = 0; i != v64; ++i)
          {
            if (*(_QWORD *)v84 != v62)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
            objc_msgSend(obj, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v21, v19);
            objc_msgSend(v20, "target");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              objc_msgSend(v61, "addObject:", v23);
            objc_msgSend(v20, "target");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "process");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            rbs_sp_assertion_log();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = os_signpost_id_make_with_pointer(v26, (const void *)objc_msgSend(v21, "hash"));

            rbs_sp_assertion_log();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
            {
              objc_msgSend(v20, "explanation");
              v30 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "shortDescription");
              v31 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "description");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v96 = v30;
              v97 = 2114;
              v98 = v31;
              v99 = 2114;
              v100 = v32;
              _os_signpost_emit_with_name_impl(&dword_21A8B4000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "ClientAssertion", "explanation=%{public}@;target=%{public}@;identifier=%{public}@",
                buf,
                0x20u);

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
        }
        while (v17);
      }

    }
    v9 = (id)v49;
  }
  os_unfair_lock_unlock(lock);
  dispatch_sync((dispatch_queue_t)v59->_calloutQueue, &__block_literal_global_41);
  objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "connection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAssertionManager _increaseInFlightOperationsForTargetIdentities:](v59, "_increaseInFlightOperationsForTargetIdentities:", v61);
  if (v34
    && -[RBAssertionManager _increaseInFlightOperationsForOriginator:andSuspendIfNeeded:](v59, "_increaseInFlightOperationsForOriginator:andSuspendIfNeeded:", v56, v34))
  {
    rbs_process_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[RBAssertionManager commitBatchWithContext:completion:].cold.1();

  }
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_43;
  v73[3] = &unk_24DD46268;
  v73[4] = v59;
  v74 = v61;
  v36 = v51;
  v75 = v36;
  v37 = v34;
  v76 = v37;
  v77 = v56;
  v38 = v57;
  v78 = v38;
  v82 = v58;
  v81 = v55;
  v79 = v63;
  v39 = v9;
  v80 = v39;
  v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v73, "copy");
  v40[2](v40, 0, 0);
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_46;
  v66[3] = &unk_24DD46290;
  v66[4] = v59;
  v41 = v36;
  v67 = v41;
  v68 = v60;
  v69 = v38;
  v72 = v58;
  v9 = v39;
  v70 = v9;
  v42 = v40;
  v71 = v42;
  v43 = (void *)MEMORY[0x22074BF04](v66);
  objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v58 == 1 && v44)
  {
    objc_msgSend(v44, "handoffToQueue:block:", v59->_workloop, v43);
  }
  else
  {
    workloop = v59->_workloop;
    if (v58 == 1)
      dispatch_async_and_wait(workloop, v43);
    else
      dispatch_async(workloop, v43);
  }

  v16 = v41;
LABEL_39:

  _Block_object_dispose(v93, 8);
}

- (void)_decreaseInFlightOperationsForTargetIdentities:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *calloutQueue;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSCountedSet removeObject:](self->_inFlightAssertionTargets, "removeObject:", v11);
          if (!-[NSCountedSet countForObject:](self->_inFlightAssertionTargets, "countForObject:", v11))
          {
            calloutQueue = self->_calloutQueue;
            block[0] = v9;
            block[1] = 3221225472;
            block[2] = __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_24DD45FF0;
            block[4] = self;
            block[5] = v11;
            dispatch_async(calloutQueue, block);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }

}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("RBAssertionManager.m"), 249, CFSTR("called completion more than once"));

    v10 = *(_QWORD *)(a1[7] + 8);
  }
  *(_BYTE *)(v10 + 24) = 1;
  if (v9)
  {
    rbs_assertion_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v9, v11);

  }
  v12 = a1[6];
  if (v12)
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);

}

- (void)_increaseInFlightOperationsForTargetIdentities:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *calloutQueue;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSCountedSet addObject:](self->_inFlightAssertionTargets, "addObject:", v11);
          if (-[NSCountedSet countForObject:](self->_inFlightAssertionTargets, "countForObject:", v11) == 1)
          {
            calloutQueue = self->_calloutQueue;
            block[0] = v9;
            block[1] = 3221225472;
            block[2] = __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_24DD45FF0;
            block[4] = self;
            block[5] = v11;
            dispatch_async(calloutQueue, block);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }

}

void __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    (*(void (**)(_QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), a4);
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", &unk_24DD5EFF0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (BOOL)_lock_enforceAssertionLimitIfNecessaryForBatchContext:(id)a3 originatorProcess:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RBAssertionManager _lock_incomingAssertionCountForBatchContext:originatorIdentifier:](self, "_lock_incomingAssertionCountForBatchContext:originatorIdentifier:", v9, v10);

  v12 = -[RBAssertionManager _lock_willExceedAssertionLimitForOriginatorProcess:withIncomingCount:](self, "_lock_willExceedAssertionLimitForOriginatorProcess:withIncomingCount:", v8, v11);
  if (v12)
  {
    -[RBAssertionManager _lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:](self, "_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:", v8);
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE80D88];
      v17 = *MEMORY[0x24BDD0FD8];
      v18[0] = CFSTR("Originator is holding too many assertions");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 2, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (BOOL)_lock_willExceedAssertionLimitForOriginatorProcess:(id)a3 withIncomingCount:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t maxAssertionsPerOriginator;
  BOOL v9;
  unint64_t v10;
  RBAssertionCollection *assertions;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  char v16;
  char v17;

  v6 = a3;
  v7 = v6;
  maxAssertionsPerOriginator = self->_maxAssertionsPerOriginator;
  v9 = maxAssertionsPerOriginator >= a4;
  v10 = maxAssertionsPerOriginator - a4;
  if (v10 != 0 && v9)
  {
    assertions = self->_assertions;
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[RBAssertionCollection hasAssertionsForOriginator:exceedingCount:](assertions, "hasAssertionsForOriginator:exceedingCount:", v12, v10);

    if (v13)
    {
      -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entitlementsForProcess:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.runningboard.performancetest"));

      v17 = v16 ^ 1;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (unint64_t)_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:(id)a3 completionPolicy:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  RBAssertionManager *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v32;
  void *v33;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v35 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v37 = v6;
  if (v7)
  {
    v8 = v7;
    v41 = 0;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v35);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "target");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "process");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identity");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
          v16 = 1;
        else
          v16 = v14 == 0;
        if (!v16)
        {
          v17 = self;
          -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18 && objc_msgSend(v11, "isActive") && (objc_msgSend(v11, "isPersistent") & 1) == 0)
          {
            objc_msgSend(v11, "originator");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBAssertionManager _lock_assertionCreationAttributeContextForTargetIdentity:originator:](v17, "_lock_assertionCreationAttributeContextForTargetIdentity:originator:", v15, v39);
            v19 = objc_claimAutoreleasedReturnValue();

            v40 = (void *)v19;
            objc_msgSend(v11, "updateProcessStateWithAttributeContext:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v38 = v20;
              objc_msgSend(v36, "objectForKeyedSubscript:", v15);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = v21;
                objc_msgSend(v21, "unionState:", v38);
              }
              else
              {
                v22 = (void *)objc_msgSend(v38, "mutableCopy");
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v22, v15);
              }

              v20 = v38;
            }
            ++v41;

            v6 = v37;
          }

          self = v17;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }
  else
  {
    v41 = 0;
  }

  if (objc_msgSend(v36, "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = v36;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v23, "objectForKeyedSubscript:", v28, v35);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionManager _lock_setState:forProcessIdentity:](self, "_lock_setState:forProcessIdentity:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v25);
    }

    v30 = v35;
    if (v41 == objc_msgSend(v37, "count") && v35 == 1)
      v30 = 0;
    v32 = (void *)MEMORY[0x24BE80D68];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke;
    v42[3] = &unk_24DD45FF0;
    v42[4] = self;
    v43 = v23;
    v33 = v32;
    v6 = v37;
    objc_msgSend(v33, "runWithoutContext:", v42);

  }
  else
  {
    v30 = v35;
  }

  return v30;
}

- (double)_lock_delayedStartTimeForAssertion:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  v6 = v5;
  objc_msgSend(v4, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v4, "isActive") & 1) != 0
      || !-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v8))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "doubleValue");
        v6 = v11;
      }

    }
    else
    {
      v6 = 1.79769313e308;
    }
  }

  return v6;
}

- (double)_lock_originatorExitTimeForAssertion:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  v6 = v5;
  objc_msgSend(v4, "originator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v4, "isActive"))
    {
      -[NSMapTable objectForKey:](self->_originatorExitTimesByAssertion, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v10 = (void *)MEMORY[0x24BDD16E0];
        -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
        objc_msgSend(v10, "numberWithDouble:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_originatorExitTimesByAssertion, "setObject:forKey:", v9, v4);
        if (!v9)
          -[RBAssertionManager _lock_originatorExitTimeForAssertion:].cold.1();
      }
      objc_msgSend(v9, "doubleValue");
      v6 = v11;

    }
    else
    {
      v6 = 1.79769313e308;
    }
  }

  return v6;
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject valueForKey:](v5, "valueForKey:", CFSTR("IgnoreOnReconnect"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_assertion_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v12 = 138543874;
        v13 = v9;
        v14 = 2114;
        v15 = v10;
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1(a1, (uint64_t)v4, v8);
    }

  }
  else
  {
    rbs_assertion_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully acquired underlying assertion for %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "startPolicy") == 103 || objc_msgSend(v3, "startPolicy") == 102)
    && objc_msgSend(v3, "isActive")
    && !objc_msgSend(v3, "invalidationReason"))
  {
    rbs_ttl_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating delayed assertion %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "deactivate");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (id)_lock_createAssertionWithAcquisitionContext:(id)a3 attributeContext:(id)a4 concreteTarget:(id)a5 targetIdentity:(id)a6 originator:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  const char *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  NSMutableDictionary *pluginHoldsForAssertions;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a4;
  objc_msgSend(v14, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  +[RBAssertion assertionWithDescriptor:target:originator:context:creationTime:](RBAssertion, "assertionWithDescriptor:target:originator:context:creationTime:", v19, v15, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "startPolicy");
  if (v21 <= 100)
  {
    if ((unint64_t)v21 >= 3)
    {
      if (v21 != 3)
        goto LABEL_22;
      v22 = -[RBAssertionManager _lock_originatorHasExited:](self, "_lock_originatorHasExited:", v20);
      rbs_ttl_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138543362;
          v50 = v20;
          v25 = "Assertion %{public}@ will be created as active as originator process has exited";
LABEL_14:
          _os_log_impl(&dword_21A8B4000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if (v24)
      {
        *(_DWORD *)buf = 138543362;
        v50 = v20;
        v28 = "Assertion %{public}@ will be created as inactive as originator process has not exited";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
LABEL_12:
    rbs_ttl_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v20;
      v25 = "Assertion %{public}@ will be created as active";
      goto LABEL_14;
    }
LABEL_15:

    objc_msgSend(v20, "activate");
    goto LABEL_22;
  }
  if ((unint64_t)(v21 - 102) >= 2)
  {
    if (v21 != 101)
      goto LABEL_22;
    goto LABEL_12;
  }
  v26 = -[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v16);
  rbs_ttl_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (!v26)
  {
    if (!v27)
      goto LABEL_15;
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    v25 = "Assertion %{public}@ will be created as active as no start-time-defining assertions exist";
    goto LABEL_14;
  }
  if (v27)
  {
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    v28 = "Assertion %{public}@ will be created as inactive as start-time-defining assertions exist";
LABEL_20:
    _os_log_impl(&dword_21A8B4000, v23, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
  }
LABEL_21:

  objc_msgSend(v20, "deactivate");
LABEL_22:
  objc_msgSend(v15, "identity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "startPolicy") == 103
     || objc_msgSend(v20, "startPolicy") == 101
     || objc_msgSend(v20, "startPolicy") == 102)
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "objectForKeyedSubscript:", v29), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, !v30))
  {
    v32 = (void *)MEMORY[0x24BDD16E0];
    -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "setObject:forKeyedSubscript:", v33, v29);

    v31 = 1;
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v20, "invalidationDuration");
  v35 = v34;
  -[RBAssertionManager _lock_invalidationTimeForAssertion:](self, "_lock_invalidationTimeForAssertion:", v20);
  if (v35 == 0.0 || (v37 = v36, -[RBTimeProviding currentTime](self->_timeProvider, "currentTime"), v37 > v38))
  {
    objc_msgSend(v14, "holdToken");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      pluginHoldsForAssertions = self->_pluginHoldsForAssertions;
      objc_msgSend(v14, "holdToken");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pluginHoldsForAssertions, "setObject:forKey:", v41, v42);

    }
    a8 = v20;
  }
  else
  {
    if (v31)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "setObject:forKeyedSubscript:", 0, v29);
    if (a8)
    {
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BE80D88];
      v47[0] = *MEMORY[0x24BDD0FD8];
      v47[1] = CFSTR("IgnoreOnReconnect");
      v48[0] = CFSTR("Assertion's invalidation time is in the past");
      v48[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 2, v45);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
  }

  return a8;
}

- (double)_lock_invalidationTimeForAssertion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v4);
  v6 = v5;
  objc_msgSend(v4, "invalidationDuration");
  v8 = v6 + v7;
  v9 = objc_msgSend(v4, "startPolicy");
  if (((unint64_t)(v9 - 102) < 2 || v9 == 3) && !objc_msgSend(v4, "isActive"))
    v8 = 1.79769313e308;

  return v8;
}

- (void)acquireAssertionWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBAssertionBatchContext contextForProcess:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:](RBAssertionBatchContext, "contextForProcess:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:", v8, v10, MEMORY[0x24BDBD1A8], self->_daemonContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setUnitTesting:", objc_msgSend(v7, "unitTesting"));
  objc_msgSend(v7, "holdToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHoldToken:", v12);

  objc_msgSend(v11, "setAllowAbstractTarget:", objc_msgSend(v7, "allowAbstractTarget"));
  v13 = objc_msgSend(v7, "acquisitionPolicy");

  objc_msgSend(v11, "setAcquisitionPolicy:", v13);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke;
  v15[3] = &unk_24DD462B8;
  v16 = v6;
  v14 = v6;
  -[RBAssertionManager commitBatchWithContext:completion:](self, "commitBatchWithContext:completion:", v11, v15);

}

- (id)_lock_createAssertionForDescriptor:(id)a3 originatorState:(id)a4 acquisitionContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  BOOL v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  NSObject *loga;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "process");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionManager _concreteTargetForTarget:allowAbstractTarget:](self, "_concreteTargetForTarget:allowAbstractTarget:", v12, objc_msgSend(v11, "allowAbstractTarget"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "allowAbstractTarget"))
  {
    -[RBAssertionManager _concreteTargetForTarget:allowAbstractTarget:](self, "_concreteTargetForTarget:allowAbstractTarget:", v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "process");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  rbs_ttl_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v48 = v16;
  v49 = v13;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend(v12, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v19;
    v55 = 2114;
    v56 = v49;
    v57 = 2114;
    v58 = v20;
    _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_DEFAULT, "Acquiring assertion targeting %{public}@ from originator %{public}@ with description %{public}@", buf, 0x20u);
    if (!v18)

    v16 = v48;
    v13 = v49;
  }

  if (v14)
  {
    v44 = v12;
    objc_msgSend(v14, "identity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "process");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v47 = v10;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v21);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v24;

    objc_msgSend(v29, "identifier");
    v30 = objc_claimAutoreleasedReturnValue();
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v43 = (void *)v30;
    v32 = v9;
    v33 = -[RBAssertionManager _lock_validateDescriptor:originatorProcess:originatorState:concreteTarget:targetProcess:targetIdentity:targetIdentifier:targetState:acquisitionContext:error:](self, "_lock_validateDescriptor:originatorProcess:originatorState:concreteTarget:targetProcess:targetIdentity:targetIdentifier:targetState:acquisitionContext:error:", v9, v13, v47, v14, v29, v21, v30, v31, v11, &v50);
    v34 = v13;
    v35 = v33;
    v36 = v50;
    v37 = v36;
    if (v35)
    {
      -[RBAssertionManager _lock_assertionCreationAttributeContextForTargetIdentity:originator:](self, "_lock_assertionCreationAttributeContextForTargetIdentity:originator:", v21, v34);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBAssertionManager _lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:](self, "_lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;

      if (v28)
      {
        v9 = v32;
        v16 = v48;
        if (objc_msgSend(v11, "allowAbstractTarget") && v48)
        {
          rbs_ttl_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "debugDescription");
            loga = v38;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v39;
            v55 = 2114;
            v56 = v48;
            _os_log_impl(&dword_21A8B4000, loga, OS_LOG_TYPE_DEFAULT, "setting abstract target for %{public}@ to %{public}@", buf, 0x16u);

            v38 = loga;
          }

          objc_msgSend(v28, "setTargetProcessForAbstract:", v48);
        }
        v40 = v28;
      }
      else
      {
        v9 = v32;
        v16 = v48;
        if (a6)
          *a6 = objc_retainAutorelease(v27);
      }

    }
    else
    {
      if (a6)
      {
        v27 = objc_retainAutorelease(v36);
        v28 = 0;
        *a6 = v27;
      }
      else
      {
        v28 = 0;
        v27 = v36;
      }
      v9 = v32;
      v16 = v48;
    }

    v10 = v47;
    v12 = v44;
    goto LABEL_33;
  }
  if (a6)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BE80D88];
    v51 = *MEMORY[0x24BDD0FD8];
    v52 = CFSTR("Specified target process does not exist");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 2, v27);
    v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

    v13 = v49;
    goto LABEL_34;
  }
  v28 = 0;
LABEL_34:

  return v28;
}

- (BOOL)_lock_validateDescriptor:(id)a3 originatorProcess:(id)a4 originatorState:(id)a5 concreteTarget:(id)a6 targetProcess:(id)a7 targetIdentity:(id)a8 targetIdentifier:(id)a9 targetState:(id)a10 acquisitionContext:(id)a11 error:(id *)a12
{
  os_unfair_lock_s *p_lock;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  RBAssertionDescriptorValidating *descriptorValidator;
  char v31;
  id v32;
  void *v33;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;

  p_lock = &self->_lock;
  v39 = a11;
  v38 = a10;
  v37 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  os_unfair_lock_assert_owner(p_lock);
  +[RBAssertionDescriptorValidatorContext context](RBAssertionDescriptorValidatorContext, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAssertionDescriptor:", v25);

  objc_msgSend(v26, "setOriginatorProcess:", v24);
  objc_msgSend(v26, "setOriginatorState:", v23);

  objc_msgSend(v26, "setTarget:", v22);
  objc_msgSend(v26, "setTargetProcess:", v21);

  objc_msgSend(v26, "setTargetIdentity:", v20);
  objc_msgSend(v26, "setTargetIdentifier:", v37);

  objc_msgSend(v26, "setTargetState:", v38);
  objc_msgSend(v26, "setAcquisitionContext:", v39);

  -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEntitlementManager:", v27);

  objc_msgSend(v26, "setBundlePropertiesManager:", self->_bundlePropertiesManager);
  -[RBDaemonContextProviding domainAttributeManager](self->_daemonContext, "domainAttributeManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDomainAttributeManager:", v28);

  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setSavedEndowments:", v29);
  objc_msgSend(v26, "setSystemState:", self->_systemState);
  descriptorValidator = self->_descriptorValidator;
  v40 = 0;
  v31 = -[RBAssertionDescriptorValidating isAssertionValidForContext:error:](descriptorValidator, "isAssertionValidForContext:error:", v26, &v40);
  v32 = v40;
  v33 = v32;
  if ((v31 & 1) == 0)
  {
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionManager.m"), 1758, CFSTR("assertion validator failed to return error. this is required."));

      if (!a12)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (a12)
LABEL_4:
      *a12 = objc_retainAutorelease(v33);
  }
LABEL_5:

  return v31;
}

- (BOOL)_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4;
  RBAssertionCollection *assertions;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  assertions = self->_assertions;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v7[3] = &unk_24DD46408;
  v7[4] = &v8;
  -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v4, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (id)_concreteTargetForTarget:(id)a3 allowAbstractTarget:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  RBProcessIndex *processIndex;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionManager.m"), 903, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  }
  if (!objc_msgSend(v7, "isSystem"))
  {
    objc_msgSend(v7, "processIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    processIndex = self->_processIndex;
    if (v9)
    {
      -[RBProcessIndex processForIdentity:](processIndex, "processForIdentity:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "processIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcessIndex processForIdentifier:](processIndex, "processForIdentifier:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v11, "isTerminating"))
    {
      rbs_assertion_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v11;
        _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "ignoring %{public}@ as candidate for concrete target as it is terminating", buf, 0xCu);
      }

      v11 = 0;
      v8 = 0;
      if (!v4)
        goto LABEL_21;
    }
    else if (!v4)
    {
      if (v11)
      {
        objc_msgSend(v7, "environment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[RBConcreteTarget targetWithProcess:environment:](RBConcreteTarget, "targetWithProcess:environment:", v11, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    if (v9)
    {
      v14 = v9;
LABEL_19:
      objc_msgSend(v7, "environment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBConcreteTarget targetWithIdentity:environment:](RBConcreteTarget, "targetWithIdentity:environment:", v14, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    objc_msgSend(v11, "identity");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_19;
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  +[RBConcreteTarget systemTarget](RBConcreteTarget, "systemTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v8;
}

- (BOOL)_lock_originatorHasExited:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "originator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isTerminating");
  else
    v5 = 1;

  return v5;
}

- (void)_acquireAssertions:(id)a3 invalidateIdentifiers:(id)a4 forOriginatorProcess:(id)a5 completionPolicy:(unint64_t)a6 acquisitionErrorsByIndex:(id)a7 completeStage:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  RBProcessMap *stateMap;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  uint32_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  os_unfair_lock_s *p_lock;
  __int128 v75;
  id v76;
  id v77;
  os_unfair_lock_t lock;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  _BOOL4 v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id obj;
  id v99;
  _QWORD v100[5];
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;
  const __CFString *v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  id v121;
  uint64_t v122;
  const __CFString *v123;
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v79 = a4;
  v14 = a5;
  v82 = a7;
  v15 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v13;
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
  v87 = v16;
  if (v86)
  {
    v88 = *(_QWORD *)v112;
    v80 = *MEMORY[0x24BDD0FD8];
    v81 = *MEMORY[0x24BE80D88];
    *(_QWORD *)&v17 = 138543362;
    v75 = v17;
    v85 = v14;
    v76 = v15;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v112 != v88)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v18);
        objc_msgSend(obj, "objectForKeyedSubscript:", v19, v75);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "target");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "process");
        v23 = objc_claimAutoreleasedReturnValue();
        v95 = (void *)v23;
        v96 = v18;
        v93 = v22;
        v94 = (void *)v21;
        v89 = v19;
        v92 = -[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v21);
        if (!v23)
        {
          v24 = 1;
          goto LABEL_10;
        }
        if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v23))
        {
          v24 = -[NSMutableSet containsObject:](self->_inFlightTerminations, "containsObject:", v23) ^ 1;
LABEL_10:
          v90 = v24;
          goto LABEL_12;
        }
        v90 = 0;
LABEL_12:
        v91 = -[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v14);
        v99 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        -[RBSystemState conditions](self->_systemState, "conditions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allKeys");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v108;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v108 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
              objc_msgSend(v20, "intransientState");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "invalidatesOnConditions");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKey:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                -[RBSystemState conditions](self->_systemState, "conditions");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKey:", v31);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v36)
                  -[RBAssertionManager _acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:].cold.1();
                v37 = objc_msgSend(v36, "integerValue");
                if (v37 > objc_msgSend(v34, "integerValue"))
                  objc_msgSend(v99, "addObject:", v31);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
          }
          while (v28);
        }

        if (objc_msgSend(v20, "suspendsOnOriginatorSuspension"))
        {
          v14 = v85;
          v16 = v87;
          v39 = v93;
          v38 = v94;
          if (objc_msgSend(v85, "isLifecycleManaged"))
          {
            stateMap = self->_stateMap;
            objc_msgSend(v85, "identity");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBProcessMap valueForIdentity:](stateMap, "valueForIdentity:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "role") == 1;

          }
          else
          {
            v43 = 0;
          }
        }
        else
        {
          v43 = 0;
          v14 = v85;
          v16 = v87;
          v39 = v93;
          v38 = v94;
        }
        -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v38);
        if (objc_msgSend(v99, "count"))
        {
          if (a6 != 1)
          {
            objc_msgSend(v83, "addObject:", v20);
            rbs_assertion_log();
            v49 = objc_claimAutoreleasedReturnValue();
            v48 = v96;
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              goto LABEL_40;
            *(_DWORD *)buf = 138543618;
            v119 = v20;
            v120 = 2114;
            v121 = v99;
            v50 = v49;
            v51 = "Invalidating assertion <%{public}@> on acquisition for unmet conditions: %{public}@";
            v52 = 22;
            goto LABEL_39;
          }
          v44 = (void *)MEMORY[0x24BDD1540];
          v122 = v80;
          v123 = CFSTR("Conditions do not allow this assertion");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "errorWithDomain:code:userInfo:", v81, 5, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v82, "setObject:forKeyedSubscript:", v46, v89);
          goto LABEL_42;
        }
        if (((v92 & v91 & v90 ^ 1 | v43) & 1) == 0)
        {
          -[RBAssertionManager _lock_addAssertion:](self, "_lock_addAssertion:", v20);
          objc_msgSend(v16, "addObject:", v20);
LABEL_42:
          v48 = v96;
          goto LABEL_43;
        }
        if ((v92 & v91 & v90 & v43) != 1)
        {
          if (((v92 & v91 ^ 1 | v90) & 1) != 0)
          {
            rbs_ttl_log();
            v49 = objc_claimAutoreleasedReturnValue();
            v48 = v96;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v75;
              v119 = v20;
              v50 = v49;
              v51 = "Silently discarding acquired but invalid %{public}@";
              goto LABEL_52;
            }
LABEL_40:

            goto LABEL_43;
          }
          v48 = v96;
          if (a6 == 1)
          {
            v53 = (void *)MEMORY[0x24BDD1540];
            v116 = v80;
            v117 = CFSTR("Specified target process does not exist");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "errorWithDomain:code:userInfo:", v81, 2, v54);
            v49 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v82, "setObject:forKeyedSubscript:", v49, v89);
            goto LABEL_40;
          }
          objc_msgSend(v83, "addObject:", v20);
          rbs_assertion_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            goto LABEL_40;
          *(_DWORD *)buf = v75;
          v119 = v20;
          v50 = v49;
          v51 = "Silently discarding assertion acquired after target exited: %{public}@";
LABEL_52:
          v52 = 12;
LABEL_39:
          _os_log_impl(&dword_21A8B4000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, v52);
          goto LABEL_40;
        }
        rbs_assertion_log();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v96;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v75;
          v119 = v20;
          _os_log_impl(&dword_21A8B4000, v47, OS_LOG_TYPE_DEFAULT, "Suspended assertion %{public}@ on acquisition", buf, 0xCu);
        }

        objc_msgSend(v20, "suspend");
        -[RBAssertionManager _lock_addAssertion:](self, "_lock_addAssertion:", v20);
LABEL_43:

        v18 = v48 + 1;
      }
      while (v18 != v86);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
      v15 = v76;
      v86 = v55;
    }
    while (v55);
  }

  -[RBAssertionManager _lock_deactivateExistingAssertionsDelayedByIncomingAssertions:](self, "_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:", v16);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unionSet:");
  v56 = v79;
  if (objc_msgSend(v79, "count"))
  {
    v77 = v15;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v58 = v79;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v104 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
          if (-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v63))
          {
            -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v63);
            rbs_assertion_log();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl(&dword_21A8B4000, v64, OS_LOG_TYPE_DEFAULT, "Dropping unacquired identifier %{public}@", buf, 0xCu);
            }
          }
          else
          {
            -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v63);
            v64 = objc_claimAutoreleasedReturnValue();
            rbs_assertion_log();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl(&dword_21A8B4000, v65, OS_LOG_TYPE_DEFAULT, "Invalidating identifier %{public}@", buf, 0xCu);
            }

            if (v64)
            {
              -[NSObject setInvalidationReason:](v64, "setInvalidationReason:", 3);
              objc_msgSend(v57, "addObject:", v64);
            }
            else
            {
              rbs_assertion_log();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v119 = v63;
                _os_log_error_impl(&dword_21A8B4000, v66, OS_LOG_TYPE_ERROR, "Cannot invalidate unknown identifier %{public}@", buf, 0xCu);
              }

            }
          }

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
      }
      while (v60);
    }

    -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v57);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v87;
    objc_msgSend(v87, "unionSet:", v67);
    objc_msgSend(v83, "unionSet:", v57);

    v56 = v79;
    v15 = v77;
  }
  if (objc_msgSend(v16, "count"))
  {
    v68 = v83;
    -[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:](self, "_lock_updateStatesDueToChangingAssertions:invalidatedAssertions:", v16, v83);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = 0;
    v68 = v83;
  }
  if (objc_msgSend(v68, "count"))
  {
    -[RBAssertionManager _lock_finalizeRemovingAssertions:](self, "_lock_finalizeRemovingAssertions:", v68);
    -[RBAssertionManager _lock_notifyDelegateOfInvalidatedAssertions:](self, "_lock_notifyDelegateOfInvalidatedAssertions:", v68);
  }
  if (objc_msgSend(v69, "hasChanges"))
  {
    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke;
    v100[3] = &unk_24DD46480;
    v100[4] = self;
    v101 = v69;
    v70 = v15;
    v102 = v15;
    v71 = (void *)MEMORY[0x22074BF04](v100);
    objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (a6 == 1 && v72)
    {
      objc_msgSend(v72, "handoffToQueue:block:", self->_calloutQueue, v71);
      os_unfair_lock_unlock(lock);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_calloutQueue, v71);
      os_unfair_lock_unlock(lock);
      if (a6 == 1)
        dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_105);
    }

    v15 = v70;
    p_lock = &self->_lock;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_unlock(lock);
    (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
  }
  os_unfair_lock_assert_not_owner(p_lock);

}

- (id)_lock_updateStatesDueToChangingAssertions:(id)a3 invalidatedAssertions:(id)a4
{
  id v6;
  id v7;
  RBProcessStateChangeSet *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  RBAssertionManager *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  RBProcessStateChangeSet *v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v8 = [RBProcessStateChangeSet alloc];
  v23 = -[RBProcessStateChangeSet initWithChanges:](v8, "initWithChanges:", MEMORY[0x24BDBD1A8]);
  os_unfair_lock_assert_owner(&self->_lock);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke;
  v13[3] = &unk_24DD463B8;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_21A8B4000, "state update", OS_ACTIVITY_FLAG_DEFAULT, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v45 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "conditions");
  v3 = 0;
  v4 = 0;
  v43 = a1 + 56;
  v44 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 176);
    if (v4)
    {
      objc_msgSend(v4, "systemState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSystemState:", v7);

    }
    else
    {
      objc_msgSend(*(id *)(v5 + 176), "setSystemState:", *(_QWORD *)(v5 + 224), v43);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "resolveForAssertions:", v2, v43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v8, "changeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyChanges:", v10);

    v11 = *(void **)(a1 + 40);
    objc_msgSend(v8, "gainedStartTimeDefining");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_lock_deactivateDelayedAssertionsForTargets:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 40);
    objc_msgSend(v8, "lostStartTimeDefining");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_lock_activateDelayedAssertionsForTargets:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v16;
    objc_msgSend(v16, "setByAddingObjectsFromSet:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      v18 = *(void **)(a1 + 40);
      objc_msgSend(v8, "systemState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "conditions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      objc_msgSend(v18, "_lock_invalidateAssertionByConditions:changedAssertions:", v20, &v53);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v53;

      if (objc_msgSend(v21, "count"))
      {
        if (!v22)
          __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3();
        objc_msgSend(*(id *)(a1 + 48), "unionSet:", v21);
        objc_msgSend(v17, "setByAddingObjectsFromSet:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v23;
      }
      else if (v22)
      {
        __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2();
      }
      objc_msgSend(v8, "systemState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "conditions");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v44 == v25)
      {

      }
      else
      {
        if (v44 && v25)
        {
          v26 = objc_msgSend(v44, "isEqual:", v25);

          if ((v26 & 1) != 0)
            goto LABEL_19;
        }
        else
        {

        }
        objc_msgSend(v8, "systemState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "conditions");
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allAssertions");
        v24 = v17;
        v44 = (id)v28;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

LABEL_19:
    }
    v2 = v17;
    if (v3 == 50)
      break;
    v46 = v17;
    v47 = v13;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v8, "changeSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v35 = *(void **)(a1 + 40);
          objc_msgSend(v34, "updatedState");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "identity");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_lock_setState:forProcessIdentity:", v36, v37);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v31);
    }
    ++v3;

    objc_msgSend(v8, "touchedAssertions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "unionSet:", v38);

    v2 = v46;
    objc_msgSend(v46, "anyObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (!v39)
      goto LABEL_33;
  }
  rbs_assertion_log();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1((uint64_t)v17, v43, v40);

LABEL_33:
  v41 = *(void **)(a1 + 40);
  objc_msgSend(v8, "systemState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_lock_setSystemState:", v42);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "updateEventsForAssertions:", v45);
}

- (id)_lock_deactivateDelayedAssertionsForTargets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  RBAssertionCollection *assertions;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v11))
        {
          assertions = self->_assertions;
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 3221225472;
          v14[2] = __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke;
          v14[3] = &unk_24DD463E0;
          v15 = v5;
          -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v11, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_activateDelayedAssertionsForTargets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  RBAssertionCollection *assertions;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x24BDD16E0];
          -[RBTimeProviding currentTime](self->_timeProvider, "currentTime", v16);
          objc_msgSend(v12, "numberWithDouble:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "setObject:forKeyedSubscript:", v13, v11);

          if (!-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v11))
          {
            assertions = self->_assertions;
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke;
            v17[3] = &unk_24DD463E0;
            v18 = v5;
            -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v11, v17);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v4 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_lock_setSystemState:(id)a3
{
  id v4;
  void *v5;
  NSObject *calloutQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend(v4, "isEqual:", self->_systemState) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_storeStrong((id *)&self->_systemState, v5);
    calloutQueue = self->_calloutQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__RBAssertionManager__lock_setSystemState___block_invoke;
    v8[3] = &unk_24DD45FF0;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    dispatch_async(calloutQueue, v8);

  }
}

- (id)_lock_invalidateAssertionByConditions:(id)a3 changedAssertions:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  RBAssertionCollection *assertions;
  id v15;
  _QWORD v18[6];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        assertions = self->_assertions;
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke;
        v18[3] = &unk_24DD46390;
        v18[4] = self;
        v18[5] = v12;
        v19 = v13;
        v20 = v6;
        v15 = v13;
        -[RBAssertionCollection enumerateAssertionsWithBlock:](assertions, "enumerateAssertionsWithBlock:", v18);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v6);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_lock_deactivateAssertions:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  SEL v31;
  void *context;
  id v33;
  RBAssertionManager *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  rbs_assertion_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v47 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_INFO, "Removing %{public}lu assertions", buf, 0xCu);
  }

  if (objc_msgSend(v5, "count"))
  {
    v31 = a2;
    context = (void *)MEMORY[0x22074BD78]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (!objc_msgSend(v13, "invalidationReason"))
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("RBAssertionManager.m"), 1091, CFSTR("Must have an invalidation reason before we remove an assertion"));

          }
          objc_msgSend(v13, "target");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15
            && objc_msgSend(v13, "definesRelativeStartTime")
            && objc_msgSend(v13, "isActive"))
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = v16;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") - 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[RBAssertionManager _lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:", v15)- 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v15);
            if (!objc_msgSend(v18, "unsignedIntegerValue"))
            {
              rbs_assertion_log();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v47 = (uint64_t)v15;
                _os_log_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_DEFAULT, "Removed last relative-start-date-defining assertion for process %{public}@", buf, 0xCu);
              }

              objc_msgSend(v35, "addObject:", v15);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v10);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = v8;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "deactivate");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v23);
    }

    -[RBAssertionManager _lock_activateDelayedAssertionsForTargets:](v34, "_lock_activateDelayedAssertionsForTargets:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_targetIdentitiesInAssertions:](v34, "_lock_targetIdentitiesInAssertions:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_clearStartTimesForUnbusyTargets:](v34, "_lock_clearStartTimesForUnbusyTargets:", v27);
    if (v26)
    {
      objc_msgSend(v21, "setByAddingObjectsFromSet:", v26);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = v21;
    }
    v29 = v28;
    v5 = v33;

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "target", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "definesRelativeStartTime"))
          v14 = v13 == 0;
        else
          v14 = 1;
        if (!v14 && (objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
          objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[RBAssertionManager _lock_deactivateDelayedAssertionsForTargets:](self, "_lock_deactivateDelayedAssertionsForTargets:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "definesRelativeStartTime") && objc_msgSend(v5, "isActive"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (BOOL)_increaseInFlightOperationsForOriginator:(id)a3 andSuspendIfNeeded:(id)a4
{
  _xpc_connection_s *v6;
  os_unfair_lock_s *p_inFlightOperationsLock;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t maxOperationsInFlight;

  v6 = (_xpc_connection_s *)a4;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  v8 = a3;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_originatorToInFlightOperationsCountMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue") + 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originatorToInFlightOperationsCountMap, "setObject:forKeyedSubscript:", v11, v8);

  maxOperationsInFlight = self->_maxOperationsInFlight;
  if (v10 == maxOperationsInFlight)
    xpc_connection_suspend(v6);
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v10 == maxOperationsInFlight;
}

- (BOOL)_decreaseInFlightOperationsForOriginator:(id)a3
{
  id v4;
  os_unfair_lock_s *p_inFlightOperationsLock;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_originatorToInFlightOperationsCountMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    v9 = v8 - 1;
    if (v8 == 1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originatorToInFlightOperationsCountMap, "setObject:forKeyedSubscript:", 0, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originatorToInFlightOperationsCountMap, "setObject:forKeyedSubscript:", v10, v4);

    }
  }
  else
  {
    v9 = 0;
  }
  v11 = v9 == self->_maxOperationsInFlight - 1;
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v11;
}

- (void)_lock_clearStartTimesForUnbusyTargets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  RBAssertionCollection *assertions;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v19;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (!-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v10, v12))
          {
            v14 = 0;
            v15 = &v14;
            v16 = 0x2020000000;
            v17 = 0;
            assertions = self->_assertions;
            v13[0] = v8;
            v13[1] = 3221225472;
            v13[2] = __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke;
            v13[3] = &unk_24DD46408;
            v13[4] = &v14;
            -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v10, v13);
            if (!*((_BYTE *)v15 + 24))
              -[NSMutableDictionary removeObjectForKey:](self->_relativeStartTimesByTargetIdentity, "removeObjectForKey:", v10);
            _Block_object_dispose(&v14, 8);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v4 = v12;
  }

}

void __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "definesRelativeStartTime") && objc_msgSend(v3, "isActive"))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)(objc_msgSend(v3, "startPolicy") - 101) <= 2
    && objc_msgSend(v3, "isActive")
    && objc_msgSend(v3, "isValid"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "startPolicy") & 0xFFFFFFFFFFFFFFFELL) == 0x66
    && (objc_msgSend(v3, "isActive") & 1) == 0
    && objc_msgSend(v3, "isValid"))
  {
    rbs_ttl_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "Activating delayed assertion %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "activate");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (unint64_t)_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4;
  RBAssertionCollection *assertions;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  assertions = self->_assertions;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v8[3] = &unk_24DD46408;
  v8[4] = &v9;
  -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v4, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didInvalidateAssertions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (double)eventQueue:(id)a3 remainingRuntimeForProcessIdentity:(id)a4
{
  double result;

  -[RBAssertionManager _remainingRuntimeForProcessIdentity:](self, "_remainingRuntimeForProcessIdentity:", a4);
  return result;
}

- (double)eventQueue:(id)a3 startTimeForAssertion:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  double v7;
  double v8;

  p_lock = &self->_lock;
  v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v6);
  v8 = v7;

  os_unfair_lock_unlock(p_lock);
  return v8;
}

uint64_t __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeInvalidAssertions");
}

- (void)_lock_removeAssertion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionCollection removeAssertion:](self->_assertions, "removeAssertion:", v11);
  -[RBDaemonContextProviding historicalStatistics](self->_daemonContext, "historicalStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  -[RBDaemonContextProviding stateCaptureManager](self->_daemonContext, "stateCaptureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItem:", v11);

  objc_msgSend(v11, "originator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[RBAssertionCollection hasAssertionsForOriginator:](self->_assertions, "hasAssertionsForOriginator:", v7))
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isReported"))
      -[RBAssertionOriginatorPidPersisting removePid:](self->_originatorPidStore, "removePid:", objc_msgSend(v7, "pid"));

  }
  objc_msgSend(v11, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    RBPowerlogEvent(2, v10, -[RBAssertionCollection assertionCountForTargetProcessIdentity:](self->_assertions, "assertionCountForTargetProcessIdentity:", v10), 0xFFFFFFFFLL);

}

- (void)_lock_addAssertion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  RBAssertionManager *v17;

  v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  block = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __41__RBAssertionManager__lock_addAssertion___block_invoke;
  v16 = &unk_24DD46160;
  v17 = self;
  if (_lock_addAssertion__onceToken != -1)
    dispatch_once(&_lock_addAssertion__onceToken, &block);
  objc_msgSend(v11, "originator", v11, block, v14, v15, v16, v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[RBAssertionCollection hasAssertionsForOriginator:](self->_assertions, "hasAssertionsForOriginator:", v5))
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isReported"))
      -[RBAssertionOriginatorPidPersisting addPid:](self->_originatorPidStore, "addPid:", objc_msgSend(v5, "pid"));

  }
  -[RBAssertionCollection addAssertion:](self->_assertions, "addAssertion:", v12);
  -[RBDaemonContextProviding historicalStatistics](self->_daemonContext, "historicalStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  -[RBDaemonContextProviding stateCaptureManager](self->_daemonContext, "stateCaptureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItem:", v12);

  objc_msgSend(v12, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    RBPowerlogEvent(1, v10, -[RBAssertionCollection assertionCountForTargetProcessIdentity:](self->_assertions, "assertionCountForTargetProcessIdentity:", v10), 0xFFFFFFFFLL);

}

- (BOOL)_lock_batchContextInvalidatesSynchronously:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "identifiersToInvalidate", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "invalidatesSynchronously");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)_lock_incomingAssertionCountForBatchContext:(id)a3 originatorIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "descriptorsToAcquire");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = v6;
  objc_msgSend(v6, "identifiersToInvalidate");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "originator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v7);

        v9 -= v17;
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v9;
}

- (id)_lock_createAssertionsForBatchContext:(id)a3 originatorState:(id)a4 errorsByIndex:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableSet *acquiringAssertionIdentifiers;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v23 = a4;
  v21 = a5;
  objc_msgSend(v8, "descriptorsToAcquire");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v8, "descriptorsToAcquire");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "acquisitionContextForDescriptor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[RBAssertionManager _lock_createAssertionForDescriptor:originatorState:acquisitionContext:error:](self, "_lock_createAssertionForDescriptor:originatorState:acquisitionContext:error:", v13, v23, v14, &v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v24;
      if (v15)
      {
        acquiringAssertionIdentifiers = self->_acquiringAssertionIdentifiers;
        objc_msgSend(v15, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](acquiringAssertionIdentifiers, "addObject:", v18);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, v19);

      }
    }
  }

  return v22;
}

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didUpdateProcessStates:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)invalidateAssertionFromOriginator:(id)a3 sync:(BOOL)a4 withIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v7))
  {
    -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v7);
    os_unfair_lock_unlock(&self->_lock);
    if (!v8)
    {
      v9 = 1;
      goto LABEL_9;
    }
LABEL_5:
    v9 = -[RBAssertionManager _invalidateAssertion:sync:](self, "_invalidateAssertion:sync:", v8, v5);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
    goto LABEL_5;
  rbs_assertion_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring invalidation request for %{public}@ because it doesn't exist", (uint8_t *)&v12, 0xCu);
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)_invalidateAssertion:(id)a3 sync:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_invalidateAssertions:forceSync:](self, "_lock_invalidateAssertions:forceSync:", v7, v4);

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    rbs_assertion_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RBAssertionManager _invalidateAssertion:sync:].cold.1(v8);

  }
  return v6 != 0;
}

- (void)_lock_invalidateAssertions:(id)a3 forceSync:(BOOL)a4
{
  int v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        rbs_ttl_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "originator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          v24 = 2114;
          v25 = v14;
          _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating assertion %{public}@ from originator %{public}@", buf, 0x16u);

        }
        objc_msgSend(v12, "setInvalidationReason:", 3);
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v15) & 1) != 0)
        {
          -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v16);

          v4 |= objc_msgSend(v12, "invalidatesSynchronously");
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

  if ((v4 & 1) != 0)
  {
    rbs_assertion_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_INFO, "Invalidating assertions synchronously", buf, 2u);
    }

    -[RBAssertionManager _lock_removeInvalidAssertions](self, "_lock_removeInvalidAssertions");
  }

}

- (void)_lock_enqueueAssertionsForRemoval:(id)a3
{
  id v4;
  uint64_t v5;
  RBTimeProviding *timeProvider;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[NSMutableSet count](self->_invalidAssertions, "count"))
  {
    -[NSMutableSet unionSet:](self->_invalidAssertions, "unionSet:", v4);
  }
  else
  {
    v5 = objc_msgSend(v4, "count");
    -[NSMutableSet unionSet:](self->_invalidAssertions, "unionSet:", v4);
    if (v5)
    {
      timeProvider = self->_timeProvider;
      v7 = (void *)objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke;
      v8[3] = &unk_24DD46160;
      v8[4] = self;
      -[RBTimeProviding executeAfter:onQueue:block:](timeProvider, "executeAfter:onQueue:block:", v7, v8, 0.1);

    }
  }

}

uint64_t __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didBeginTrackingStateForProcessIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  RBProcessStateChange *v8;
  RBProcessStateChangeSet *v9;
  void *v10;
  RBProcessStateChangeSet *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  RBProcessStateChange *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]([RBProcessStateChange alloc], "initWithIdentity:originalState:updatedState:", v6, 0, v7);
        v9 = [RBProcessStateChangeSet alloc];
        v17 = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[RBProcessStateChangeSet initWithChanges:](v9, "initWithChanges:", v10);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "assertionManager:didUpdateProcessStates:completion:", *(_QWORD *)(a1 + 40), v11, 0);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v3);
  }

}

void __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2;
  v5[3] = &unk_24DD46458;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "assertionManager:didUpdateProcessStates:completion:", v2, v3, v5);

}

uint64_t __39__RBAssertionManager_processDidLaunch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didAddProcess:withState:");
}

void __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 24));
  if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(v2 + 16);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2;
    v5[3] = &unk_24DD45FF0;
    v5[4] = v2;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

- (void)processDidLaunch:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  RBProcessState *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *calloutQueue;
  id v17;
  void *v18;
  void *v19;
  os_unfair_lock_s *v20;
  void *v21;
  RBAssertionManager *v22;
  _QWORD block[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex addProcess:](self->_processIndex, "addProcess:", v4))
  {
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v6);
    v7 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = -[RBProcessState initWithIdentity:]([RBProcessState alloc], "initWithIdentity:", v6);
      -[RBAssertionManager _lock_setState:forProcessIdentity:](self, "_lock_setState:forProcessIdentity:", v7, v6);
    }
    v20 = &self->_lock;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v6;
    v22 = self;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "setTargetProcessForAbstract:", v4);
          if (!v11)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          rbs_assertion_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v4;
            v32 = 2112;
            v33 = v14;
            _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_DEFAULT, "%@: applying persistent assertion '%@'", buf, 0x16u);
          }

          objc_msgSend(v11, "addObject:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    self = v22;
    calloutQueue = v22->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__RBAssertionManager_processDidLaunch___block_invoke;
    block[3] = &unk_24DD45E60;
    block[4] = v22;
    v24 = v4;
    v25 = v19;
    v17 = v19;
    dispatch_async(calloutQueue, block);

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:](v22, "_lock_removeAssertions:andUpdateChangedAssertions:", v18, v11);

    }
    p_lock = v20;
    v6 = v21;
  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_55);
  -[RBAssertionManager _acquireUnderlyingAssertionForProcess:](self, "_acquireUnderlyingAssertionForProcess:", v4);

}

- (void)_lock_setState:(id)a3 forProcessIdentity:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *calloutQueue;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v8 = -[RBProcessMap containsIdentity:](self->_stateMap, "containsIdentity:", v7);
  v9 = -[RBProcessMap setValue:forIdentity:](self->_stateMap, "setValue:forIdentity:", v6, v7);
  if (!v8)
  {
    -[NSMutableSet addObject:](self->_assertionTargets, "addObject:", v7);
    calloutQueue = self->_calloutQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke;
    v11[3] = &unk_24DD45FF0;
    v11[4] = self;
    v12 = v7;
    dispatch_async(calloutQueue, v11);

  }
}

- (void)_removeInvalidAssertions
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionManager _lock_removeInvalidAssertions](self, "_lock_removeInvalidAssertions");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_removeInvalidAssertions
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  rbs_assertion_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[NSMutableSet count](self->_invalidAssertions, "count");
    v6 = 134349056;
    v7 = v4;
    _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_INFO, "Processing invalidation queue with %{public}lu assertions", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)-[NSMutableSet copy](self->_invalidAssertions, "copy");
  -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:](self, "_lock_removeAssertions:andUpdateChangedAssertions:", v5, 0);

  -[NSMutableSet removeAllObjects](self->_invalidAssertions, "removeAllObjects");
}

- (void)_lock_removeAssertions:(id)a3 andUpdateChangedAssertions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v8, "unionSet:", v7);
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v8, "unionSet:", v6);
  v9 = (void *)objc_msgSend(v11, "mutableCopy");
  -[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:](self, "_lock_updateStatesDueToChangingAssertions:invalidatedAssertions:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionManager _lock_finalizeRemovingAssertions:](self, "_lock_finalizeRemovingAssertions:", v9);
  -[RBAssertionManager _lock_notifyDelegateOfInvalidatedAssertions:](self, "_lock_notifyDelegateOfInvalidatedAssertions:", v9);
  -[RBAssertionManager _lock_notifyDelegateOfProcessStateChangeSet:](self, "_lock_notifyDelegateOfProcessStateChangeSet:", v10);

}

- (void)_lock_notifyDelegateOfProcessStateChangeSet:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke;
  activity_block[3] = &unk_24DD45FF0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_21A8B4000, "state notification", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)_lock_notifyDelegateOfInvalidatedAssertions:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

- (void)_lock_finalizeRemovingAssertions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        -[RBAssertionManager _lock_removeAssertion:](self, "_lock_removeAssertion:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  -[RBAssertionManager _lock_targetIdentitiesInAssertions:](self, "_lock_targetIdentitiesInAssertions:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
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
        -[RBAssertionManager _lock_removeStateForProcessIdentityIfNecessary:](self, "_lock_removeStateForProcessIdentityIfNecessary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (id)_lock_targetIdentitiesInAssertions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "target", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_lock_removeStateForProcessIdentityIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *calloutQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!-[RBAssertionCollection assertionCountForTargetProcessIdentity:](self->_assertions, "assertionCountForTargetProcessIdentity:", v4)&& !-[RBProcessIndex containsIdentity:](self->_processIndex, "containsIdentity:", v4))
  {
    -[RBProcessMap removeIdentity:](self->_stateMap, "removeIdentity:", v4);
    -[NSMutableSet removeObject:](self->_assertionTargets, "removeObject:", v4);
    rbs_process_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_INFO, "Ended tracking state for process identity %{public}@", buf, 0xCu);
    }

    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke;
    v7[3] = &unk_24DD45FF0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(calloutQueue, v7);

  }
}

- (void)_acquireUnderlyingAssertionForProcess:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  objc_msgSend(v4, "underlyingAssertion");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28[5])
  {
    objc_msgSend(v4, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isApplication");

    if (v6)
    {
      if (!os_variant_has_internal_content()
        || (objc_msgSend(v4, "identity"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "embeddedApplicationIdentifier"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.runningboard.test")),
            v8,
            v7,
            (v9 & 1) == 0))
      {
        v10 = (void *)v28[5];
        v28[5] = (uint64_t)CFSTR("defaultUnderlyingAppAssertion");

        rbs_assertion_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v4;
          _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Using default underlying assertion for app: %{public}@", buf, 0xCu);
        }

      }
    }
  }
  if (v28[5])
  {
    objc_msgSend(v4, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      rbs_assertion_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[RBAssertionManager _acquireUnderlyingAssertionForProcess:].cold.1();
    }
    else
    {
      v14 = (void *)MEMORY[0x24BE80B18];
      objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", getpid());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE80D38];
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "targetWithProcessIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.underlying"), v28[5]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v19;
      objc_msgSend(MEMORY[0x24BE80AD0], "attributeWithCompletionPolicy:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptorWithIdentifier:target:explanation:attributes:", v15, v18, CFSTR("RB Underlying Assertion"), v21);
      v22 = objc_claimAutoreleasedReturnValue();

      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", v4, v22, self->_daemonContext);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke;
      v24[3] = &unk_24DD46430;
      v25 = v4;
      v26 = &v27;
      -[RBAssertionManager acquireAssertionWithContext:completion:](self, "acquireAssertionWithContext:completion:", v23, v24);

    }
  }
  _Block_object_dispose(&v27, 8);

}

- (id)stateForIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2;
  v6[3] = &unk_24DD45FF0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  dispatch_async(v3, v6);

}

- (id)limitationsForInstance:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BE80CB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAssertionManager _remainingRuntimeForProcessIdentity:](self, "_remainingRuntimeForProcessIdentity:", v7);
  objc_msgSend(v6, "setRunTime:");

  return v6;
}

- (void)processDidTerminate:(id)a3
{
  RBProcessState *v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  RBProcessState *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  RBProcessState *v29;
  NSObject *v30;
  NSObject *calloutQueue;
  RBProcessState *v32;
  void *v33;
  RBProcessState *v34;
  void *v35;
  _QWORD block[5];
  RBProcessState *v37;
  RBProcessState *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  RBProcessState *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = (RBProcessState *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v4))
  {
    -[NSMutableSet addObject:](self->_inFlightTerminations, "addObject:", v4);
    -[RBProcessState identity](v4, "identity");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBProcessState identifier](v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    rbs_process_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v4;
      _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "Removing assertions for terminated process: %{public}@", buf, 0xCu);
    }
    v34 = v4;

    v8 = (void *)MEMORY[0x24BDBCEF0];
    v33 = (void *)v6;
    -[RBAssertionCollection assertionsForOriginator:](self->_assertions, "assertionsForOriginator:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v20, "startPolicy") == 3)
          {
            -[NSMapTable setObject:forKey:](self->_originatorExitTimesByAssertion, "setObject:forKey:", v14, v20);
            objc_msgSend(v20, "activate");
            objc_msgSend(v12, "addObject:", v20);
            rbs_ttl_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "identifier");
              v22 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v50 = v22;
              _os_log_impl(&dword_21A8B4000, v21, OS_LOG_TYPE_DEFAULT, "Activating after-originator-exit assertion %{public}@", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v20, "setInvalidationReason:", 1);
            objc_msgSend(v11, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v17);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          if ((objc_msgSend(v28, "isPersistent") & 1) == 0)
          {
            objc_msgSend(v28, "setInvalidationReason:", 1);
            objc_msgSend(v11, "addObject:", v28);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v25);
    }

    -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:](self, "_lock_removeAssertions:andUpdateChangedAssertions:", v11, v12);
    -[NSMutableDictionary removeObjectForKey:](self->_relativeStartTimesByTargetIdentity, "removeObjectForKey:", v35);
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v35);
    v29 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
    if (!v29)
      v29 = -[RBProcessState initWithIdentity:]([RBProcessState alloc], "initWithIdentity:", v35);
    rbs_process_log();
    v30 = objc_claimAutoreleasedReturnValue();
    v4 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_impl(&dword_21A8B4000, v30, OS_LOG_TYPE_INFO, "Resolved state for exited process: %{public}@", buf, 0xCu);
    }

    -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", v34);
    -[NSMutableSet removeObject:](self->_inFlightTerminations, "removeObject:", v34);
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__RBAssertionManager_processDidTerminate___block_invoke;
    block[3] = &unk_24DD45E60;
    block[4] = self;
    v37 = v34;
    v38 = v29;
    v32 = v29;
    dispatch_async(calloutQueue, block);
    -[RBAssertionManager _lock_removeStateForProcessIdentityIfNecessary:](self, "_lock_removeStateForProcessIdentityIfNecessary:", v35);

    p_lock = &self->_lock;
  }
  -[NSMapTable removeObjectForKey:](self->_savedEndowments, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didEndTrackingStateForProcessIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __42__RBAssertionManager_processDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didRemoveProcess:withState:");
}

- (id)assertionsForOriginator:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[RBAssertionCollection assertionsForOriginator:](self->_assertions, "assertionsForOriginator:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (RBSystemState)systemState
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[RBSystemState copy](self->_systemState, "copy");
  os_unfair_lock_unlock(p_lock);
  return (RBSystemState *)v4;
}

+ (id)sharedWorkloop
{
  if (sharedWorkloop_onceToken != -1)
    dispatch_once(&sharedWorkloop_onceToken, &__block_literal_global_2);
  return (id)sharedWorkloop_workloop;
}

void __36__RBAssertionManager_sharedWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("RBAssertionManager");
  v1 = (void *)sharedWorkloop_workloop;
  sharedWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedWorkloop_workloop);
}

- (void)periodicRunningProcessDump
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke;
  block[3] = &unk_24DD46160;
  block[4] = self;
  if (periodicRunningProcessDump_onceToken != -1)
    dispatch_once(&periodicRunningProcessDump_onceToken, block);
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("RBRunningProcessDump", v2);
  v4 = (void *)periodicRunningProcessDump_periodicQueue;
  periodicRunningProcessDump_periodicQueue = (uint64_t)v3;

  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)periodicRunningProcessDump_periodicQueue);
  v6 = (void *)periodicRunningProcessDump_periodicSource;
  periodicRunningProcessDump_periodicSource = (uint64_t)v5;

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2;
  handler[3] = &unk_24DD46160;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)periodicRunningProcessDump_periodicSource, handler);
  dispatch_activate((dispatch_object_t)periodicRunningProcessDump_periodicSource);
  v7 = periodicRunningProcessDump_periodicSource;
  v8 = dispatch_time(0, 1800000000000);
  dispatch_source_set_timer(v7, v8, 0x1A3185C5000uLL, 0x29E8D60800uLL);
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_process_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "Periodic Run States >>>>>", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138543362;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "preventSuspend", v13, (_QWORD)v14))
        {
          rbs_process_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "debugDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v13;
            v19 = v11;
            _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Periodic Run States %{public}@", buf, 0xCu);

          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  rbs_process_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEFAULT, "Periodic Run States <<<<<", buf, 2u);
  }

}

- (RBAssertionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionManager.m"), 159, CFSTR("-init is not allowed on RBAssertionManager"));

  return 0;
}

- (RBAssertionManager)initWithDelegate:(id)a3 bundlePropertiesManager:(id)a4 originatorPidStore:(id)a5 assertionDescriptorValidator:(id)a6 timeProvider:(id)a7 daemonContext:(id)a8 maxOperationsInFlight:(unint64_t)a9 maxAssertionsPerOriginator:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RBAssertionManager *v22;
  uint64_t v23;
  OS_dispatch_queue *workloop;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *calloutQueue;
  RBAssertionCollection *v28;
  RBAssertionCollection *assertions;
  NSMutableDictionary *v30;
  NSMutableDictionary *pluginHoldsForAssertions;
  RBProcessIndex *v32;
  RBProcessIndex *processIndex;
  RBProcessMap *v34;
  RBProcessMap *stateMap;
  uint64_t v36;
  NSMutableDictionary *relativeStartTimesByTargetIdentity;
  uint64_t v38;
  NSMapTable *originatorExitTimesByAssertion;
  uint64_t v40;
  NSMutableDictionary *originatorToInFlightOperationsCountMap;
  NSCountedSet *v42;
  NSCountedSet *inFlightAssertionTargets;
  NSMutableSet *v44;
  NSMutableSet *inFlightTerminations;
  RBAssertionManagerEventQueue *v46;
  RBAssertionManagerEventQueue *eventQueue;
  uint64_t v48;
  NSMutableSet *assertionTargets;
  uint64_t v50;
  NSMutableSet *acquiringAssertionIdentifiers;
  uint64_t v52;
  NSMutableSet *invalidAssertions;
  uint64_t v54;
  NSMapTable *savedEndowments;
  RBAssertionStateResolver *v56;
  RBAssertionStateResolver *stateResolver;
  RBAssertionStateResolver *v58;
  void *v59;
  RBAssertionStateResolver *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id obj;
  id v75;
  id v76;
  objc_super v77;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v76 = a6;
  obj = a7;
  v20 = a7;
  v75 = a8;
  v21 = a8;
  v77.receiver = self;
  v77.super_class = (Class)RBAssertionManager;
  v22 = -[RBAssertionManager init](&v77, sel_init);
  if (!v22)
    goto LABEL_10;
  if (v17)
  {
    if (v18)
      goto LABEL_4;
LABEL_12:
    v72 = v21;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("RBAssertionManager.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundlePropertiesManager"));

    v21 = v72;
    if (v19)
      goto LABEL_5;
LABEL_13:
    v73 = v21;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("RBAssertionManager.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originatorPidStore"));

    v21 = v73;
    goto LABEL_5;
  }
  v71 = v21;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("RBAssertionManager.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  v21 = v71;
  if (!v18)
    goto LABEL_12;
LABEL_4:
  if (!v19)
    goto LABEL_13;
LABEL_5:
  v69 = v18;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("RBAssertionManager.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("validator"));

  }
  v70 = v17;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("RBAssertionManager.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonContext"));

  }
  v22->_lock._os_unfair_lock_opaque = 0;
  +[RBAssertionManager sharedWorkloop](RBAssertionManager, "sharedWorkloop");
  v23 = objc_claimAutoreleasedReturnValue();
  workloop = v22->_workloop;
  v22->_workloop = (OS_dispatch_queue *)v23;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = dispatch_queue_create("RBAssertionManagerCallOut", v25);
  calloutQueue = v22->_calloutQueue;
  v22->_calloutQueue = (OS_dispatch_queue *)v26;

  objc_storeStrong((id *)&v22->_delegate, a3);
  objc_storeStrong((id *)&v22->_bundlePropertiesManager, a4);
  objc_storeStrong((id *)&v22->_descriptorValidator, a6);
  objc_storeStrong((id *)&v22->_originatorPidStore, a5);
  objc_storeStrong((id *)&v22->_timeProvider, obj);
  v22->_maxOperationsInFlight = a9;
  v22->_maxAssertionsPerOriginator = a10;
  objc_storeStrong((id *)&v22->_daemonContext, v75);
  v28 = objc_alloc_init(RBAssertionCollection);
  assertions = v22->_assertions;
  v22->_assertions = v28;

  v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  pluginHoldsForAssertions = v22->_pluginHoldsForAssertions;
  v22->_pluginHoldsForAssertions = v30;

  v32 = objc_alloc_init(RBProcessIndex);
  processIndex = v22->_processIndex;
  v22->_processIndex = v32;

  v34 = objc_alloc_init(RBProcessMap);
  stateMap = v22->_stateMap;
  v22->_stateMap = v34;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = objc_claimAutoreleasedReturnValue();
  relativeStartTimesByTargetIdentity = v22->_relativeStartTimesByTargetIdentity;
  v22->_relativeStartTimesByTargetIdentity = (NSMutableDictionary *)v36;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v38 = objc_claimAutoreleasedReturnValue();
  originatorExitTimesByAssertion = v22->_originatorExitTimesByAssertion;
  v22->_originatorExitTimesByAssertion = (NSMapTable *)v38;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v40 = objc_claimAutoreleasedReturnValue();
  originatorToInFlightOperationsCountMap = v22->_originatorToInFlightOperationsCountMap;
  v22->_originatorToInFlightOperationsCountMap = (NSMutableDictionary *)v40;

  v42 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
  inFlightAssertionTargets = v22->_inFlightAssertionTargets;
  v22->_inFlightAssertionTargets = v42;

  v22->_inFlightOperationsLock._os_unfair_lock_opaque = 0;
  v44 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  inFlightTerminations = v22->_inFlightTerminations;
  v22->_inFlightTerminations = v44;

  v46 = -[RBAssertionManagerEventQueue initWithTimeProvider:]([RBAssertionManagerEventQueue alloc], "initWithTimeProvider:", v20);
  eventQueue = v22->_eventQueue;
  v22->_eventQueue = v46;

  -[RBAssertionManagerEventQueue setDelegate:](v22->_eventQueue, "setDelegate:", v22);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v48 = objc_claimAutoreleasedReturnValue();
  assertionTargets = v22->_assertionTargets;
  v22->_assertionTargets = (NSMutableSet *)v48;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v50 = objc_claimAutoreleasedReturnValue();
  acquiringAssertionIdentifiers = v22->_acquiringAssertionIdentifiers;
  v22->_acquiringAssertionIdentifiers = (NSMutableSet *)v50;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v52 = objc_claimAutoreleasedReturnValue();
  invalidAssertions = v22->_invalidAssertions;
  v22->_invalidAssertions = (NSMutableSet *)v52;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v54 = objc_claimAutoreleasedReturnValue();
  savedEndowments = v22->_savedEndowments;
  v22->_savedEndowments = (NSMapTable *)v54;

  v56 = objc_alloc_init(RBAssertionStateResolver);
  stateResolver = v22->_stateResolver;
  v22->_stateResolver = v56;

  -[RBAssertionStateResolver setAssertionCollection:](v22->_stateResolver, "setAssertionCollection:", v22->_assertions);
  -[RBAssertionStateResolver setProcessIndex:](v22->_stateResolver, "setProcessIndex:", v22->_processIndex);
  -[RBAssertionStateResolver setStateMap:](v22->_stateResolver, "setStateMap:", v22->_stateMap);
  v58 = v22->_stateResolver;
  objc_msgSend(v21, "domainAttributeManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionStateResolver setDomainAttributeManager:](v58, "setDomainAttributeManager:", v59);

  -[RBAssertionStateResolver setBundlePropertiesManager:](v22->_stateResolver, "setBundlePropertiesManager:", v22->_bundlePropertiesManager);
  v60 = v22->_stateResolver;
  -[RBDaemonContextProviding entitlementManager](v22->_daemonContext, "entitlementManager");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionStateResolver setEntitlementManager:](v60, "setEntitlementManager:", v61);

  -[RBAssertionStateResolver setSavedEndowments:](v22->_stateResolver, "setSavedEndowments:", v22->_savedEndowments);
  -[RBAssertionManager periodicRunningProcessDump](v22, "periodicRunningProcessDump");
  v18 = v69;
  v17 = v70;
LABEL_10:

  return v22;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RBAssertionCollection count](self->_assertions, "count");
  -[RBSystemState debugDescription](self->_systemState, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RBAssertionManagerEventQueue count](self->_eventQueue, "count");
  -[RBProcessMap dictionary](self->_stateMap, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entriesToStringWithIndent:debug:", 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| assertionCount:%lu systemState:%@ eventQueueCount:%lu processStates:{\n%@}>"), v4, v5, v6, v7, v9);

  return (NSString *)v10;
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2 == 1)
  {
    v17 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_decreaseInFlightOperationsForTargetIdentities:", *(_QWORD *)(a1 + 40));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          rbs_assertion_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v26 = v12;
            _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_INFO, "Finished acquiring assertion %{public}@", buf, 0xCu);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v9);
    }

    v6 = v17;
    if (*(_QWORD *)(a1 + 56)
      && objc_msgSend(*(id *)(a1 + 32), "_decreaseInFlightOperationsForOriginator:", *(_QWORD *)(a1 + 64)))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 144);
      v16 = *(_QWORD *)(v14 + 8);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_44;
      v18[3] = &unk_24DD45FF0;
      v19 = *(id *)(a1 + 72);
      v20 = *(id *)(a1 + 56);
      objc_msgSend(v15, "executeAfter:onQueue:block:", v16, v18, 0.01);

    }
  }
  if (*(_QWORD *)(a1 + 104) == a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();

}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  rbs_process_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "Resuming connection from %{public}@", (uint8_t *)&v4, 0xCu);
  }

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifiersToInvalidate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:", v3, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (BOOL)invalidateAssertionFromOriginator:(id)a3 withIdentifier:(id)a4
{
  return -[RBAssertionManager invalidateAssertionFromOriginator:sync:withIdentifier:](self, "invalidateAssertionFromOriginator:sync:withIdentifier:", a3, 0, a4);
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionManager.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v5))
    -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v5);
  os_unfair_lock_unlock(&self->_lock);
  v7 = -[RBAssertionManager invalidateAssertion:](self, "invalidateAssertion:", v6);

  return v7;
}

- (BOOL)invalidateAssertion:(id)a3
{
  return -[RBAssertionManager _invalidateAssertion:sync:](self, "_invalidateAssertion:sync:", a3, 0);
}

- (BOOL)invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v23 = v6;
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v22, "role");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v15, "maxCPUUsageViolationPolicyForRole:", v8) == 1)
          {
            objc_msgSend(v15, "setInvalidationReason:", 5);
            objc_msgSend(v9, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v12);
    }

    rbs_process_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v4, "pid");
      v18 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 67240448;
      v29 = v17;
      v30 = 2050;
      v31 = v18;
      _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}d violated CPU limit; removing %{public}lu assertions",
        buf,
        0x12u);
    }

    v19 = objc_msgSend(v9, "count");
    v20 = v19 != 0;
    v6 = v23;
    p_lock = &self->_lock;
    if (v19)
      -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v9);

  }
  else
  {
    v20 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v20;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionStateResolver assertionDescriptorsWithFlattenedAttributes:](self->_stateResolver, "assertionDescriptorsWithFlattenedAttributes:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)hasAssertionWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isProcessForeground:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  BOOL v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v4))
  {
    objc_msgSend(v4, "identity");
    v6 = objc_claimAutoreleasedReturnValue();
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      v12 = *MEMORY[0x24BE80EA0];
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v14, "inheritances");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allNamespaces");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v16);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "isEqual:", v12))
                {

                  v21 = 1;
                  goto LABEL_23;
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v18)
                continue;
              break;
            }
          }

          v11 = v23;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        v21 = 0;
      }
      while (v10);
    }
    else
    {
      v21 = 0;
    }
LABEL_23:

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[RBAssertionManager isProcessForeground:].cold.1();
    v21 = 0;
  }

  return v21;
}

- (id)processForIdentity:(id)a3
{
  return -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", a3);
}

- (void)revalidateAssertionsForProcessIdentities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  RBAssertionCollection *assertions;
  id obj;
  _QWORD v14[6];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        assertions = self->_assertions;
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke;
        v14[3] = &unk_24DD46300;
        v14[4] = self;
        v14[5] = v11;
        v15 = v5;
        -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:](assertions, "enumerateAssertionsForTargetProcessIdentity:withBlock:", v11, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:](self, "_lock_removeAssertions:andUpdateChangedAssertions:", v5, 0);
  os_unfair_lock_unlock(&self->_lock);

}

void __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE80B18];
  objc_msgSend(v5, "createRBSTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v4;
  objc_msgSend(v6, "descriptorWithIdentifier:target:explanation:attributes:", v4, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "processForIdentity:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "valueForIdentity:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "valueForIdentity:");
  v15 = objc_claimAutoreleasedReturnValue();
  +[RBAssertionDescriptorValidatorContext context](RBAssertionDescriptorValidatorContext, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v10;
  objc_msgSend(v16, "setAssertionDescriptor:", v10);
  objc_msgSend(v16, "setOriginatorState:", v15);
  objc_msgSend(v16, "setOriginatorProcess:", v14);
  v28 = (void *)v15;
  objc_msgSend(v16, "setOriginatorState:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "entitlementManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entitlementsForProcess:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOriginatorEntitlements:", v18);

  objc_msgSend(v16, "setTarget:", v5);
  objc_msgSend(v16, "setTargetProcess:", v11);
  objc_msgSend(v16, "setTargetIdentity:", *(_QWORD *)(a1 + 40));
  v30 = (void *)v12;
  objc_msgSend(v16, "setTargetIdentifier:", v12);
  objc_msgSend(v16, "setTargetState:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "entitlementManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "entitlementsForProcess:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTargetEntitlements:", v20);

  objc_msgSend(*(id *)(a1 + 32), "_lock_savedEndowmentsForProcess:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSavedEndowments:", v21);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "entitlementManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEntitlementManager:", v22);

  objc_msgSend(v16, "setBundlePropertiesManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "domainAttributeManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDomainAttributeManager:", v23);

  objc_msgSend(v16, "setSystemState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v33 = 0;
  LODWORD(v12) = objc_msgSend(v24, "isAssertionValidForContext:error:", v16, &v33);
  v25 = v33;
  rbs_assertion_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if ((_DWORD)v12)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v3;
      _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_INFO, "Assertion %{public}@ revalidated correctly", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v3;
      _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_DEFAULT, "Assertion %{public}@ is invalid because its target's properties have changed", buf, 0xCu);
    }

    objc_msgSend(v3, "setInvalidationReason:", 6);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6
{
  RBDaemonContextProviding *daemonContext;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  daemonContext = self->_daemonContext;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributesForDomain:andName:context:withError:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  void *v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originatorEntitlementsForDomain:andName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  void *v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endowmentNamespaceForDomain:andName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  char v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsAttributeWithDomain:andName:", v7, v6);

  return v9;
}

- (id)allEntitlements
{
  void *v2;
  void *v3;

  -[RBDaemonContextProviding domainAttributeManager](self->_daemonContext, "domainAttributeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5
{
  RBDaemonContextProviding *daemonContext;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  daemonContext = self->_daemonContext;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "areTargetPropertiesValidForContext:forAttributeWithDomain:andName:", v10, v9, v8);

  return v12;
}

- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  void *v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalRestrictionsForDomain:andName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)restrictionsForDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  void *v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "restrictionsForDomain:andName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4
{
  RBDaemonContextProviding *daemonContext;
  id v6;
  id v7;
  void *v8;
  void *v9;

  daemonContext = self->_daemonContext;
  v6 = a4;
  v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetEntitlementsForDomain:andName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)eventQueue:(id)a3 handleAssertionsExpirationWarningEventForProcessIdentity:(id)a4 expirationTime:(double)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *calloutQueue;
  _QWORD block[5];
  id v13;
  double v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v8 = a4;
  os_unfair_lock_lock(p_lock);
  -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    rbs_process_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Assertions for process will expire soon: %{public}@", buf, 0xCu);
    }

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke;
    block[3] = &unk_24DD46328;
    block[4] = self;
    v13 = v9;
    v14 = a5;
    dispatch_async(calloutQueue, block);

  }
  os_unfair_lock_unlock(p_lock);

}

uint64_t __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:willExpireAssertionsSoonForProcess:expirationTime:", *(double *)(a1 + 48));
}

- (void)eventQueue:(id)a3 handleWarningEventForAssertion:(id)a4
{
  id v5;
  NSObject *calloutQueue;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[RBAssertionCollection hasAssertion:](self->_assertions, "hasAssertion:", v5))
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke;
    v7[3] = &unk_24DD45FF0;
    v7[4] = self;
    v8 = v5;
    dispatch_async(calloutQueue, v7);

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:willInvalidateAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)eventQueue:(id)a3 handleInvalidationEventForAssertion:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend(v6, "isValid"))
  {
    objc_msgSend(v6, "setInvalidationReason:", 4);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v5);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_lock_originatorIdentifiersInAssertions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "originator", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_lock_dumpAssertionsForTarget:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_sortedAssertionsForTarget:](self, "_lock_sortedAssertionsForTarget:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "count");
  rbs_assertion_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v4;
    v25 = 2048;
    v26 = v17;
    _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_INFO, "%{public}@ has %lu targeting assertions. Debug log lines of their details follow.", buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        rbs_assertion_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          ++v9;
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "explanation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v24 = v4;
          v25 = 2048;
          v26 = v9;
          v27 = 2048;
          v28 = v17;
          v29 = 2114;
          v30 = v14;
          v31 = 2114;
          v32 = v15;
          v33 = 2114;
          v34 = v16;
          _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_INFO, "%{public}@ assertion details %lu/%lu. ID:%{public}@ Explanation:\"%{public}@\" Attributes:\n%{public}@", buf, 0x3Eu);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
    }
    while (v8);
  }

}

- (id)_lock_sortedAssertionsForTarget:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_67);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __54__RBAssertionManager__lock_sortedAssertionsForTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (void)_dumpAssertions
{
  RBTimeProviding *timeProvider;
  void *v4;
  _QWORD v5[5];

  timeProvider = self->_timeProvider;
  dispatch_get_global_queue(17, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__RBAssertionManager__dumpAssertions__block_invoke;
  v5[3] = &unk_24DD46160;
  v5[4] = self;
  -[RBTimeProviding executeAfter:onQueue:block:](timeProvider, "executeAfter:onQueue:block:", v4, v5, 600.0);

}

void __37__RBAssertionManager__dumpAssertions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_lock_dumpAssertionsForTarget:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_dumpAssertions");

}

uint64_t __41__RBAssertionManager__lock_addAssertion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpAssertions");
}

- (void)_lock_checkAssertionToInvalidateByCondition:(id)a3 condition:(id)a4 currentValue:(id)a5 assertionsToInvalidate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v16, "isActive"))
  {
    objc_msgSend(v16, "intransientState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidatesOnConditions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!v10)
        -[RBAssertionManager _lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:].cold.1();
      v15 = objc_msgSend(v10, "integerValue");
      if (v15 > objc_msgSend(v14, "integerValue"))
      {
        objc_msgSend(v11, "addObject:", v16);
        objc_msgSend(v16, "setInvalidationReason:", 8);
      }
    }

  }
}

uint64_t __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __43__RBAssertionManager__lock_setSystemState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didResolveSystemState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (double)_lock_relativeStartTimeForAssertion:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  v6 = v5;
  objc_msgSend(v4, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v4, "isActive") & 1) != 0
      || !-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:](self, "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:", v8))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_relativeStartTimesByTargetIdentity, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "doubleValue");
        v6 = v12;
      }

    }
    else
    {
      -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
      v6 = v9;
    }
  }

  return v6;
}

- (void)_invalidateAssertionsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_unfair_lock_t lock;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = v4;
  objc_msgSend(v4, "identifiersToInvalidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v11, lock);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else if (-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v11))
        {
          -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v11);
        }
        else
        {
          rbs_assertion_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_error_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_ERROR, "Attempt to invalidate nonexistent assertion failed for identifier %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[RBAssertionManager _lock_invalidateAssertions:forceSync:](self, "_lock_invalidateAssertions:forceSync:", v5, 0);
  os_unfair_lock_unlock(lock);

}

- (void)_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

uint64_t __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertionManager:didRejectAcquisitionFromOriginatorWithExcessiveAssertions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)addSavedEndowment:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  id *p_savedEndowments;
  NSMapTable *savedEndowments;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  savedEndowments = self->_savedEndowments;
  p_savedEndowments = (id *)&self->_savedEndowments;
  -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v6, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v19 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v6, "endowment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v21);

    v22 = *p_savedEndowments;
    v23 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v22, "setObject:forKey:", v23, v7);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v6, "endowment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithObject:forKey:", v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*p_savedEndowments, "setObject:forKey:", v12, v7);
  }
  v15 = 1;
LABEL_7:
  rbs_assertion_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[RBAssertionManager addSavedEndowment:forProcess:].cold.1(p_savedEndowments, v24);

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)savedEndowmentsForProcess:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_invalidAssertions, 0);
  objc_storeStrong((id *)&self->_acquiringAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionTargets, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_stateResolver, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_originatorPidStore, 0);
  objc_storeStrong((id *)&self->_descriptorValidator, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_inFlightTerminations, 0);
  objc_storeStrong((id *)&self->_inFlightAssertionTargets, 0);
  objc_storeStrong((id *)&self->_originatorToInFlightOperationsCountMap, 0);
  objc_storeStrong((id *)&self->_originatorExitTimesByAssertion, 0);
  objc_storeStrong((id *)&self->_relativeStartTimesByTargetIdentity, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_pluginHoldsForAssertions, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)commitBatchWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, v0, v1, "Suspending connection from %{public}@ because there are too many assertions in flight", v2);
  OUTLINED_FUNCTION_1_1();
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Error committing batch context %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_invalidateAssertion:(os_log_t)log sync:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Ignoring invalidation request for nil assertion", v1, 2u);
}

- (void)isProcessForeground:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, v0, v1, "isProcessForeground called for untracked process: %{public}@", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:.cold.1()
{
  __assert_rtn("-[RBAssertionManager _lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:]", "RBAssertionManager.m", 1279, "currentValue");
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "processIdentities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_fault_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_FAULT, "State resolution exceeded max depth, possible cycle in assertion activation, latest assertions %{public}@ and changed ids %{public}@", (uint8_t *)&v6, 0x16u);

}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2()
{
  __assert_rtn("-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke", "RBAssertionManager.m", 1333, "changedAssertions == nil");
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3()
{
  __assert_rtn("-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke", "RBAssertionManager.m", 1329, "changedAssertions != nil");
}

- (void)_lock_originatorExitTimeForAssertion:.cold.1()
{
  __assert_rtn("-[RBAssertionManager _lock_originatorExitTimeForAssertion:]", "RBAssertionManager.m", 1511, "startTimeNumber != nil");
}

- (void)_acquireUnderlyingAssertionForProcess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, v0, v1, "Not acquiring underlying assertion for %{public}@ as it has no audit token", v2);
  OUTLINED_FUNCTION_1_1();
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_fault_impl(&dword_21A8B4000, log, OS_LOG_TYPE_FAULT, "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:.cold.1()
{
  __assert_rtn("-[RBAssertionManager _acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:]", "RBAssertionManager.m", 2113, "currentValue");
}

- (void)addSavedEndowment:(id *)a1 forProcess:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, v4, "Saved endowments: %@", v5);

}

@end
