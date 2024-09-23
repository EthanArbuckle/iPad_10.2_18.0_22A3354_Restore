@implementation RBConnectionClient

void __36__RBConnectionClient_handleMessage___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21 = v6;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v21;
    v11 = &v20;
  }
  else
  {
    objc_msgSend(v5, "target");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setTarget:", v12);
      -[RBConnectionClient acquireAssertionForDescriptor:withReply:](*(_QWORD *)(a1 + 40), v5, *(void **)(a1 + 48));
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = 0;
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v22 = *MEMORY[0x24BDD0FD8];
    v23[0] = CFSTR("missing valid target");
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = v23;
    v11 = &v22;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;
LABEL_6:

}

- (void)acquireAssertionForDescriptor:(void *)a3 withReply:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[RBConnectionClient _trackTargetProcessForDescriptor:](a1, v5);
    objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 136), "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copyWithIdentifier:", v7);

    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_msgSend(*(id *)(a1 + 168), "addObject:", v7);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      objc_msgSend(v6, "prepareForHandoff");
      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", *(_QWORD *)(a1 + 112), v8, *(_QWORD *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 24);
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke;
      v20 = &unk_24DD468A8;
      v21 = v6;
      v22 = v7;
      v23 = a1;
      objc_msgSend(v10, "acquireAssertionWithContext:completion:", v9, &v17);
      objc_msgSend(MEMORY[0x24BE80D68], "currentContext", v17, v18, v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_acquireAssertionForDescriptor_withReply_, a1, CFSTR("RBConnectionClient.m"), 946, CFSTR("xpc message context not handled"));

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE80E48];
      v24 = *MEMORY[0x24BDD0FD8];
      v25[0] = CFSTR("Bad assertion descriptor");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "encodeObject:forKey:", v9, *MEMORY[0x24BE80E70]);

      objc_msgSend(v6, "send");
    }

  }
  else
  {
    v8 = v5;
  }

}

- (BOOL)subscribeToProcessStateChangesWithConfiguration:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v11;

  v5 = a2;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)a1, "hasEntitlementDomain:", 1) & 1) == 0)
  {
    objc_msgSend(v5, "predicates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:].cold.1();

      if (!a3)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 184), "addConfiguration:", v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    v8 = 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE80E48], 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v8);
LABEL_9:
  v9 = v8 == 0;

LABEL_10:
  return v9;
}

void __36__RBConnectionClient_handleMessage___block_invoke_15(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(void **)(a1 + 32);
  v7 = objc_opt_class();
  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v18 = 0;
  objc_msgSend(v6, "decodeArgumentWithClass:atIndex:allowNil:error:", v7, 1, 1, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, v18);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    -[RBConnectionClient statesForPredicate:withDescriptor:withReply:](*(id **)(a1 + 40), v5, v9, *(void **)(a1 + 48));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;
  }

}

- (id)lookupHandleForKey:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE80C78], "handleForKey:fetchIfNeeded:", objc_msgSend(v5, "unsignedLongLongValue"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0)
    {
      if (!v7)
      {
        rbs_general_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[RBConnectionClient lookupHandleForKey:error:].cold.1(v6, v8);

        v9 = (void *)MEMORY[0x24BDD1540];
        v10 = *MEMORY[0x24BE80E48];
        v17 = *MEMORY[0x24BDD0FD8];
        v18 = CFSTR("No such process");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      if (!v7)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingHandle:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v14);

      if ((v15 & 1) == 0)
      {
LABEL_11:
        objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        rbs_connection_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[RBConnectionClient lookupHandleForKey:error:].cold.2();
LABEL_13:

        a1 = 0;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        *a3 = objc_retainAutorelease(v12);
        goto LABEL_15;
      }
    }
    a1 = v7;
    v12 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_16:

  return a1;
}

- (void)statesForPredicate:(void *)a3 withDescriptor:(void *)a4 withReply:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0
      || (v20[0] = v7,
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v10),
          v10,
          v11))
    {
      objc_msgSend(v9, "prepareForHandoff");
      objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "monitorSerializationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke;
      v16[3] = &unk_24DD466C8;
      v16[4] = a1;
      v17 = v7;
      v18 = v8;
      v19 = v9;
      objc_msgSend(v12, "handoffToQueue:block:", v13, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient statesForPredicate:withDescriptor:withReply:].cold.1();

      objc_msgSend(v9, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "encodeObject:forKey:", v12, *MEMORY[0x24BE80E70]);

      objc_msgSend(v9, "send");
    }

  }
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  return -[RBEntitlementPossessing hasEntitlementDomain:](self->_entitlements, "hasEntitlementDomain:", a3);
}

- (void)didInvalidateAssertions:(uint64_t)a1
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
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v3;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v8, "originator");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 136), "isEqual:", v10))
          {
            objc_msgSend(v8, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
            v12 = objc_msgSend(*(id *)(a1 + 168), "containsObject:", v11);
            objc_msgSend(*(id *)(a1 + 168), "removeObject:", v11);
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            objc_msgSend(*(id *)(a1 + 24), "popPluginHoldForAssertion:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              rbs_assertion_log();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v13;
                _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_INFO, "Releasing plugin hold token %@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x24BE72FB8], "managerForUser:", *(unsigned int *)(a1 + 144));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "releaseHold:", v13);

            }
            if (v12)
              objc_msgSend(v26, "addObject:", v11);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v5);
    }

    v16 = objc_msgSend(v26, "count");
    if (v16)
    {
      v17 = v16;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      v18 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if (v18)
      {
        rbs_assertion_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[RBConnectionClient didInvalidateAssertions:].cold.1(a1, v17, v19);

        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BE80D88];
        v32 = *MEMORY[0x24BDD0FD8];
        v33 = CFSTR("Assertions were invalidated");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE80D60], "messageForMethod:varguments:", sel_async_assertionsDidInvalidate_withError_, v26, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sendToConnection:", v18);

      }
    }

    v3 = v25;
  }

}

- (void)didUpdateProcessStates:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a2, "processStateChangeForIdentity:", *(_QWORD *)(a1 + 128));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "updatedState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inheritances");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allInheritances");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      rbs_state_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 112);
        v10 = 138543618;
        v11 = v9;
        v12 = 2114;
        v13 = v7;
        _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, "Process: %{public}@ has changes in inheritances: %{public}@", (uint8_t *)&v10, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 152), "setInheritances:", v7);
    }

  }
}

- (void)inheritanceManager:(id)a3 didChangeInheritances:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  OS_xpc_object *v9;
  void *v10;
  NSObject *v11;
  RBProcess *process;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint8_t buf[4];
  RBProcess *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  os_unfair_lock_lock(&self->_lock);
  v9 = self->_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE80D60], "messageForMethod:varguments:", sel_async_didChangeInheritances_completion_, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke;
    v13[3] = &unk_24DD46B78;
    v14 = v8;
    objc_msgSend(v10, "sendToConnection:completion:", v9, v13);

  }
  else
  {
    rbs_connection_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      process = self->_process;
      *(_DWORD *)buf = 138543618;
      v16 = process;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "No connection found to send inheritance for process %{public}@ with changeSet: %{public}@", buf, 0x16u);
    }

    if (v8)
      v8[2](v8);
  }

}

void __43__RBConnectionClient_handshakeWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v12, "unsignedIntegerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v14);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v21, v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

}

- (void)_trackTargetProcessForDescriptor:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a2, "target");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v6)
    {
      v5 = (id)objc_msgSend(*(id *)(a1 + 40), "processForIdentifier:", v6);
      v4 = v6;
    }

  }
}

- (NSString)description
{
  id v3;
  void *v4;
  RBSProcessIdentifier *processIdentifier;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  processIdentifier = self->_processIdentifier;
  -[RBSProcessIdentity shortDescription](self->_processIdentity, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@ name:%@ entitlements:%@ inheritanceManager:%@>"), v4, processIdentifier, v6, self->_entitlements, self->_inheritanceManager);

  return (NSString *)v7;
}

uint64_t __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__RBConnectionClient_handleMessage___block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    objc_msgSend(v5, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentity:", v9);

    -[RBConnectionClient executeLaunchRequest:withEuid:withReply:](*(_QWORD **)(a1 + 40), v5, *(unsigned int *)(a1 + 80), *(void **)(a1 + 48));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;
  }

}

id __36__RBConnectionClient_handleMessage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(a2, "copyWithAuid:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v3, "personaString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = objc_msgSend(v3, "copyWithPersonaString:");
    v4 = v3;
    v3 = (void *)v5;
LABEL_4:

  }
  return v3;
}

id __36__RBConnectionClient_handleMessage___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(a2, "copyWithAuid:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    return v3;
  }
  v6 = *(_QWORD *)(a1 + 32);

  if (v6)
  {
    v4 = v3;
    v3 = (void *)objc_msgSend(v3, "copyWithPersonaString:", *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
  return v3;
}

- (void)executeLaunchRequest:(uint64_t)a3 withEuid:(void *)a4 withReply:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  id v20;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_executeLaunchRequest_withEuid_withReply_, a1, CFSTR("RBConnectionClient.m"), 1002, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

    }
    objc_msgSend(v9, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareForHandoff");
    v11 = (void *)a1[9];
    v12 = a1[14];
    v13 = a1[20];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke;
    v16[3] = &unk_24DD46AB0;
    v17 = v10;
    v18 = v7;
    v19 = a1;
    v20 = v9;
    v14 = v10;
    objc_msgSend(v11, "executeLaunchRequest:euid:requestor:entitlements:completion:", v18, a3, v12, v13, v16);

  }
}

+ (id)sharedLaunchWorkloop
{
  objc_opt_self();
  if (sharedLaunchWorkloop_onceToken != -1)
    dispatch_once(&sharedLaunchWorkloop_onceToken, &__block_literal_global_3);
  return (id)sharedLaunchWorkloop_workloop;
}

void __36__RBConnectionClient_handleMessage___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    -[RBConnectionClient subscribeToProcessDeath:error:](v16, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v12, *MEMORY[0x24BE80E80]);
  }

}

- (id)subscribeToProcessDeath:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "processForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)a1, "hasEntitlementDomain:", 1) & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v8);

    if (v9)
    {
LABEL_4:
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE80E48], 1, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (v6)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        v10 = objc_msgSend(*(id *)(a1 + 40), "isActiveProcess:", v6);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        if (!v10)
        {
          objc_msgSend(v6, "lastExitContext");
          a1 = objc_claimAutoreleasedReturnValue();
          v11 = 0;
          if (!a3)
            goto LABEL_15;
          goto LABEL_14;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
        objc_msgSend(*(id *)(a1 + 176), "addObject:", v6);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
        v11 = 0;
LABEL_13:
        a1 = 0;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        *a3 = objc_retainAutorelease(v11);
        goto LABEL_15;
      }
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE80E48];
      v16 = *MEMORY[0x24BDD0FD8];
      v17 = CFSTR("No such process");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient subscribeToProcessDeath:error:].cold.1();
    }

    goto LABEL_13;
  }
LABEL_16:

  return (id)a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(void **)(a1 + 32);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v23 = 0;
  objc_msgSend(v6, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v7, v8, 1, 0, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v23);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(_QWORD *)(v11 + 40);
  v13 = (id *)(v11 + 40);
  v12 = v14;
  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE80E58];
    v25 = *MEMORY[0x24BDD1398];
    v26[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 3, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    v21 = *(id **)(a1 + 40);
    v22 = 0;
    -[RBConnectionClient infoPlistResultForInstance:forKeys:error:](v21, v5, v10, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, v22);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v17, *MEMORY[0x24BE80E80]);
  }

}

void __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v5)
  {
    objc_msgSend(v3, "encodeObject:forKey:", v5, *MEMORY[0x24BE80E70]);

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "removeObject:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
  }
  else
  {
    objc_msgSend(v3, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BE80E80]);

  }
  objc_msgSend(*(id *)(a1 + 32), "send");

}

void __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "statesMatchingPredicate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80CE8], "setActiveStateDescriptor:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(v2, "count");
  -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:](*(_QWORD **)(a1 + 32), v2, *(void **)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BE80E80]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("RBSProcessHandleFullEncode"));
    objc_msgSend(*(id *)(a1 + 56), "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v7, *MEMORY[0x24BE80E80]);

    objc_msgSend(v4, "removeObjectForKey:", CFSTR("RBSProcessHandleFullEncode"));
  }

  objc_msgSend(MEMORY[0x24BE80CE8], "setActiveStateDescriptor:", 0);
  objc_msgSend(*(id *)(a1 + 56), "send");

}

- (void)handleMessage:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uid_t v13;
  uid_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uid_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;
  _BYTE *v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  id v47;
  _BYTE *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  id v54;
  _BYTE *v55;
  _QWORD v56[5];
  id v57;
  _BYTE *v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  NSObject *v62;
  _BYTE *v63;
  uint64_t *v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  id v68;
  _BYTE *v69;
  _QWORD v70[4];
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  _BYTE *v75;
  _QWORD v76[4];
  id v77;
  uint64_t v78;
  id v79;
  id v80;
  _BYTE *v81;
  _QWORD v82[4];
  id v83;
  uint64_t v84;
  id v85;
  id v86;
  _BYTE *v87;
  _QWORD v88[4];
  id v89;
  uint64_t v90;
  id v91;
  _BYTE *v92;
  _QWORD v93[4];
  id v94;
  uint64_t v95;
  NSObject *v96;
  _BYTE *v97;
  uint64_t *v98;
  _QWORD v99[4];
  id v100;
  uint64_t v101;
  _BYTE *v102;
  _QWORD v103[4];
  id v104;
  uint64_t v105;
  _BYTE *v106;
  _QWORD v107[4];
  id v108;
  uint64_t v109;
  id v110;
  _BYTE *v111;
  _QWORD v112[4];
  id v113;
  uint64_t v114;
  NSObject *v115;
  _BYTE *v116;
  uint64_t *v117;
  _QWORD v118[4];
  id v119;
  uint64_t v120;
  NSObject *v121;
  id v122;
  _BYTE *v123;
  uint64_t *v124;
  uid_t v125;
  _QWORD v126[4];
  id v127;
  uint64_t v128;
  id v129;
  _BYTE *v130;
  _QWORD v131[4];
  id v132;
  uint64_t v133;
  _BYTE *v134;
  _QWORD v135[4];
  id v136;
  uint64_t v137;
  _BYTE *v138;
  _QWORD v139[4];
  id v140;
  uint64_t v141;
  NSObject *v142;
  id v143;
  _BYTE *v144;
  uint64_t *v145;
  _QWORD v146[4];
  id v147;
  uint64_t v148;
  id v149;
  _BYTE *v150;
  _QWORD v151[4];
  id v152;
  uint64_t v153;
  id v154;
  _BYTE *v155;
  _QWORD v156[4];
  id v157;
  uint64_t v158;
  id v159;
  _BYTE *v160;
  _QWORD v161[4];
  id v162;
  uint64_t v163;
  id v164;
  _BYTE *v165;
  _QWORD activity_block[4];
  id v167;
  uint64_t v168;
  id v169;
  id v170;
  _BYTE *v171;
  uid_t v172;
  _QWORD v173[4];
  id v174;
  uid_t v175;
  _QWORD v176[4];
  id v177;
  uid_t v178;
  _QWORD v179[4];
  id v180;
  uid_t v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[5];
  id v185;
  NSObject *v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  id v192;
  uint64_t v193;
  const __CFString *v194;
  char v195[32];
  _BYTE buf[24];
  _BYTE v197[24];
  _BYTE atoken[36];
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[256];
  uint64_t v203;
  uint64_t v204;

  v204 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE80D60], "messageForXPCMessage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
    {
      v6 = objc_msgSend(v5, "method");
      if (v6)
      {
        v7 = (const char *)v6;
        objc_msgSend(v5, "reply");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "payload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = 0;
        v188 = &v187;
        v189 = 0x3032000000;
        v10 = MEMORY[0x24BDAC760];
        v190 = __Block_byref_object_copy__2;
        v191 = __Block_byref_object_dispose__2;
        v184[0] = MEMORY[0x24BDAC760];
        v184[1] = 3221225472;
        v184[2] = __36__RBConnectionClient_handleMessage___block_invoke;
        v184[3] = &unk_24DD468A8;
        v184[4] = a1;
        v37 = v9;
        v185 = v37;
        v11 = v8;
        v186 = v11;
        v192 = (id)MEMORY[0x22074BF04](v184);
        xpc_dictionary_get_remote_connection(v3);
        v12 = objc_claimAutoreleasedReturnValue();
        v183 = 0u;
        v182 = 0u;
        RBSInvalidRealAuditToken();
        xpc_connection_get_audit_token();
        memset(atoken, 0, 32);
        if (RBSRealAuditTokenValid())
        {
          *(_OWORD *)atoken = v182;
          *(_OWORD *)&atoken[16] = v183;
          v38 = audit_token_to_euid((audit_token_t *)atoken);
          *(_OWORD *)atoken = v182;
          *(_OWORD *)&atoken[16] = v183;
          v13 = audit_token_to_auid((audit_token_t *)atoken);
          if (v13 + 1 >= 2)
            v14 = v13;
          else
            v14 = v38;
        }
        else
        {
          v14 = 0;
          v38 = 0;
        }
        v203 = 0;
        memset(v202, 0, sizeof(v202));
        v201 = 0u;
        v200 = 0u;
        v199 = 0u;
        memset(&atoken[4], 0, 32);
        *(_DWORD *)atoken = 2;
        v36 = (void *)v12;
        v16 = 0;
        if (!kpersona_info() && *(_DWORD *)&atoken[8] <= 5u && ((1 << atoken[8]) & 0x26) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v202[4]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        rbs_message_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = v3;
          v19 = v11;
          v20 = *(_QWORD *)(a1 + 112);
          NSStringFromSelector(v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v38;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v14;
          *(_WORD *)v197 = 2114;
          *(_QWORD *)&v197[2] = v16;
          *(_WORD *)&v197[10] = 2114;
          *(_QWORD *)&v197[12] = v21;
          _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_INFO, "PERF: Received request from %{public}@ (euid %d, auid %d) (persona %{public}@): %{public}@", buf, 0x2Cu);

          v11 = v19;
          v3 = v18;
          v10 = MEMORY[0x24BDAC760];
        }

        if ((_os_feature_enabled_impl() & 1) == 0)
        {

          v16 = 0;
        }
        v179[0] = v10;
        v179[1] = 3221225472;
        v179[2] = __36__RBConnectionClient_handleMessage___block_invoke_26;
        v179[3] = &unk_24DD468D0;
        v181 = v38;
        v22 = v16;
        v180 = v22;
        v35 = (void *)MEMORY[0x22074BF04](v179);
        v176[0] = v10;
        v176[1] = 3221225472;
        v176[2] = __36__RBConnectionClient_handleMessage___block_invoke_2;
        v176[3] = &unk_24DD468F8;
        v178 = v14;
        v23 = v22;
        v177 = v23;
        v34 = (void *)MEMORY[0x22074BF04](v176);
        v173[0] = v10;
        v173[1] = 3221225472;
        v173[2] = __36__RBConnectionClient_handleMessage___block_invoke_3;
        v173[3] = &unk_24DD46920;
        v175 = v14;
        v24 = v23;
        v174 = v24;
        v25 = (void *)MEMORY[0x22074BF04](v173);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)v197 = __Block_byref_object_copy__30;
        *(_QWORD *)&v197[8] = __Block_byref_object_dispose__31;
        *(_QWORD *)&v197[16] = 0;
        if (v7 == sel_handshakeWithRequest_)
        {
          activity_block[0] = v10;
          activity_block[1] = 3221225472;
          activity_block[2] = __36__RBConnectionClient_handleMessage___block_invoke_34;
          activity_block[3] = &unk_24DD46948;
          v171 = buf;
          v167 = v5;
          v168 = a1;
          v169 = v36;
          v172 = v38;
          v170 = v37;
          _os_activity_initiate(&dword_21A8B4000, "handshakeWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

        }
        else if (v7 == sel_lookupHandleForKey_error_)
        {
          v161[0] = v10;
          v161[1] = 3221225472;
          v161[2] = __36__RBConnectionClient_handleMessage___block_invoke_2_40;
          v161[3] = &unk_24DD46970;
          v165 = buf;
          v162 = v5;
          v163 = a1;
          v164 = v37;
          _os_activity_initiate(&dword_21A8B4000, "lookupHandleForKey", OS_ACTIVITY_FLAG_DEFAULT, v161);

        }
        else if (v7 == sel_lookupProcessName_error_)
        {
          v156[0] = v10;
          v156[1] = 3221225472;
          v156[2] = __36__RBConnectionClient_handleMessage___block_invoke_3_44;
          v156[3] = &unk_24DD46970;
          v160 = buf;
          v157 = v5;
          v158 = a1;
          v159 = v37;
          _os_activity_initiate(&dword_21A8B4000, "lookupProcessName", OS_ACTIVITY_FLAG_DEFAULT, v156);

        }
        else if (v7 == sel_lookupHandleForPredicate_error_)
        {
          v151[0] = v10;
          v151[1] = 3221225472;
          v151[2] = __36__RBConnectionClient_handleMessage___block_invoke_4;
          v151[3] = &unk_24DD46970;
          v155 = buf;
          v152 = v5;
          v153 = a1;
          v154 = v37;
          _os_activity_initiate(&dword_21A8B4000, "lookupHandleForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v151);

        }
        else if (v7 == sel_lookupPortForIdentifier_error_)
        {
          v146[0] = v10;
          v146[1] = 3221225472;
          v146[2] = __36__RBConnectionClient_handleMessage___block_invoke_5;
          v146[3] = &unk_24DD46970;
          v150 = buf;
          v147 = v5;
          v148 = a1;
          v149 = v37;
          _os_activity_initiate(&dword_21A8B4000, "lookupHandleForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v146);

        }
        else if (v7 == sel_acquireAssertionWithDescriptor_error_)
        {
          v139[0] = v10;
          v139[1] = 3221225472;
          v139[2] = __36__RBConnectionClient_handleMessage___block_invoke_6;
          v139[3] = &unk_24DD46998;
          v140 = v5;
          v144 = buf;
          v143 = v35;
          v141 = a1;
          v142 = v11;
          v145 = &v187;
          _os_activity_initiate(&dword_21A8B4000, "acquireAssertionWithDescriptor", OS_ACTIVITY_FLAG_DEFAULT, v139);

        }
        else if (v7 == sel_async_invalidateAssertionWithIdentifier_)
        {
          v135[0] = v10;
          v135[1] = 3221225472;
          v135[2] = __36__RBConnectionClient_handleMessage___block_invoke_7;
          v135[3] = &unk_24DD469C0;
          v138 = buf;
          v136 = v5;
          v137 = a1;
          _os_activity_initiate(&dword_21A8B4000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v135);

        }
        else if (v7 == sel_void_invalidateAssertionWithIdentifier_error_)
        {
          v131[0] = v10;
          v131[1] = 3221225472;
          v131[2] = __36__RBConnectionClient_handleMessage___block_invoke_8;
          v131[3] = &unk_24DD469C0;
          v134 = buf;
          v132 = v5;
          v133 = a1;
          _os_activity_initiate(&dword_21A8B4000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v131);

        }
        else if (v7 == sel_assertionDescriptorsWithFlattenedAttributes_error_)
        {
          v126[0] = v10;
          v126[1] = 3221225472;
          v126[2] = __36__RBConnectionClient_handleMessage___block_invoke_9;
          v126[3] = &unk_24DD46970;
          v130 = buf;
          v127 = v5;
          v128 = a1;
          v129 = v37;
          _os_activity_initiate(&dword_21A8B4000, "assertionDescriptorsWithFlattenedAttributes", OS_ACTIVITY_FLAG_DEFAULT, v126);

        }
        else if (v7 == sel_executeLaunchRequest_error_)
        {
          v118[0] = v10;
          v118[1] = 3221225472;
          v118[2] = __36__RBConnectionClient_handleMessage___block_invoke_10;
          v118[3] = &unk_24DD469E8;
          v119 = v5;
          v123 = buf;
          v122 = v34;
          v120 = a1;
          v125 = v38;
          v121 = v11;
          v124 = &v187;
          _os_activity_initiate(&dword_21A8B4000, "executeLaunchRequest", OS_ACTIVITY_FLAG_DEFAULT, v118);

        }
        else if (v7 == sel_executeTerminateRequest_identifier_error_)
        {
          v112[0] = v10;
          v112[1] = 3221225472;
          v112[2] = __36__RBConnectionClient_handleMessage___block_invoke_11;
          v112[3] = &unk_24DD46A10;
          v116 = buf;
          v113 = v5;
          v114 = a1;
          v115 = v11;
          v117 = &v187;
          _os_activity_initiate(&dword_21A8B4000, "executeTerminateRequest", OS_ACTIVITY_FLAG_DEFAULT, v112);

        }
        else if (v7 == sel_subscribeToProcessDeath_error_)
        {
          v107[0] = v10;
          v107[1] = 3221225472;
          v107[2] = __36__RBConnectionClient_handleMessage___block_invoke_12;
          v107[3] = &unk_24DD46970;
          v111 = buf;
          v108 = v5;
          v109 = a1;
          v110 = v37;
          _os_activity_initiate(&dword_21A8B4000, "subscribeToProcessDeath", OS_ACTIVITY_FLAG_DEFAULT, v107);

        }
        else if (v7 == sel_void_subscribeToProcessStateChangesWithConfiguration_error_)
        {
          v103[0] = v10;
          v103[1] = 3221225472;
          v103[2] = __36__RBConnectionClient_handleMessage___block_invoke_13;
          v103[3] = &unk_24DD469C0;
          v106 = buf;
          v104 = v5;
          v105 = a1;
          _os_activity_initiate(&dword_21A8B4000, "subscribeToProcessStateChangesWithConfiguration", OS_ACTIVITY_FLAG_DEFAULT, v103);

        }
        else if (v7 == sel_async_unsubscribeFromProcessStateChangesWithIdentifier_)
        {
          v99[0] = v10;
          v99[1] = 3221225472;
          v99[2] = __36__RBConnectionClient_handleMessage___block_invoke_14;
          v99[3] = &unk_24DD469C0;
          v102 = buf;
          v100 = v5;
          v101 = a1;
          _os_activity_initiate(&dword_21A8B4000, "unsubscribeFromProcessStateChangesWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v99);

        }
        else if (v7 == sel_statesForPredicate_descriptor_error_)
        {
          v93[0] = v10;
          v93[1] = 3221225472;
          v93[2] = __36__RBConnectionClient_handleMessage___block_invoke_15;
          v93[3] = &unk_24DD46A10;
          v97 = buf;
          v94 = v5;
          v95 = a1;
          v96 = v11;
          v98 = &v187;
          _os_activity_initiate(&dword_21A8B4000, "statesForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v93);

        }
        else if (v7 == sel_void_intendToExit_withStatus_)
        {
          v88[0] = v10;
          v88[1] = 3221225472;
          v88[2] = __36__RBConnectionClient_handleMessage___block_invoke_16;
          v88[3] = &unk_24DD46A38;
          v89 = v5;
          v92 = buf;
          v91 = v25;
          v90 = a1;
          _os_activity_initiate(&dword_21A8B4000, "intendToExit", OS_ACTIVITY_FLAG_DEFAULT, v88);

        }
        else if (v7 == sel_lastExitContextForInstance_error_)
        {
          v82[0] = v10;
          v82[1] = 3221225472;
          v82[2] = __36__RBConnectionClient_handleMessage___block_invoke_17;
          v82[3] = &unk_24DD46A60;
          v83 = v5;
          v87 = buf;
          v86 = v25;
          v84 = a1;
          v85 = v37;
          _os_activity_initiate(&dword_21A8B4000, "lastExitContextForInstance", OS_ACTIVITY_FLAG_DEFAULT, v82);

        }
        else if (v7 == sel_limitationsForInstance_error_)
        {
          v76[0] = v10;
          v76[1] = 3221225472;
          v76[2] = __36__RBConnectionClient_handleMessage___block_invoke_18;
          v76[3] = &unk_24DD46A60;
          v77 = v5;
          v81 = buf;
          v80 = v25;
          v78 = a1;
          v79 = v37;
          _os_activity_initiate(&dword_21A8B4000, "limitationsForInstance", OS_ACTIVITY_FLAG_DEFAULT, v76);

        }
        else if (v7 == sel_hostProcessForInstance_error_)
        {
          v70[0] = v10;
          v70[1] = 3221225472;
          v70[2] = __36__RBConnectionClient_handleMessage___block_invoke_19;
          v70[3] = &unk_24DD46A60;
          v71 = v5;
          v75 = buf;
          v74 = v25;
          v72 = a1;
          v73 = v37;
          _os_activity_initiate(&dword_21A8B4000, "hostProcessForInstance", OS_ACTIVITY_FLAG_DEFAULT, v70);

        }
        else if (v7 == sel_infoPlistResultForInstance_forKeys_error_)
        {
          v65[0] = v10;
          v65[1] = 3221225472;
          v65[2] = __36__RBConnectionClient_handleMessage___block_invoke_20;
          v65[3] = &unk_24DD46970;
          v69 = buf;
          v66 = v5;
          v67 = a1;
          v68 = v37;
          _os_activity_initiate(&dword_21A8B4000, "infoPlistResultForInstance", OS_ACTIVITY_FLAG_DEFAULT, v65);

        }
        else if (v7 == sel_captureStateForSubsystem_error_)
        {
          v59[0] = v10;
          v59[1] = 3221225472;
          v59[2] = __36__RBConnectionClient_handleMessage___block_invoke_21;
          v59[3] = &unk_24DD46A10;
          v63 = buf;
          v60 = v5;
          v61 = a1;
          v62 = v11;
          v64 = &v187;
          _os_activity_initiate(&dword_21A8B4000, "captureStateForSubsystem", OS_ACTIVITY_FLAG_DEFAULT, v59);

        }
        else if (v7 == sel_identifiersForStateCaptureSubsystemsWithError_)
        {
          v56[0] = v10;
          v56[1] = 3221225472;
          v56[2] = __36__RBConnectionClient_handleMessage___block_invoke_22;
          v56[3] = &unk_24DD469C0;
          v56[4] = a1;
          v58 = buf;
          v57 = v37;
          _os_activity_initiate(&dword_21A8B4000, "identifiersForStateCaptureSubsystemsWithError", OS_ACTIVITY_FLAG_DEFAULT, v56);

        }
        else if (v7 == sel_busyExtensionInstancesFromSet_error_)
        {
          v51[0] = v10;
          v51[1] = 3221225472;
          v51[2] = __36__RBConnectionClient_handleMessage___block_invoke_23;
          v51[3] = &unk_24DD46970;
          v55 = buf;
          v52 = v5;
          v53 = a1;
          v54 = v37;
          _os_activity_initiate(&dword_21A8B4000, "busyExtensionInstancesFromSet", OS_ACTIVITY_FLAG_DEFAULT, v51);

        }
        else if (v7 == sel_preventLaunchPredicatesWithError_)
        {
          v49[0] = v10;
          v49[1] = 3221225472;
          v49[2] = __36__RBConnectionClient_handleMessage___block_invoke_24;
          v49[3] = &unk_24DD45FF0;
          v49[4] = a1;
          v50 = v37;
          _os_activity_initiate(&dword_21A8B4000, "preventLaunchPredicates", OS_ACTIVITY_FLAG_DEFAULT, v49);

        }
        else if (v7 == sel_saveEndowment_withError_)
        {
          v44[0] = v10;
          v44[1] = 3221225472;
          v44[2] = __36__RBConnectionClient_handleMessage___block_invoke_25;
          v44[3] = &unk_24DD46970;
          v48 = buf;
          v45 = v5;
          v46 = a1;
          v47 = v37;
          _os_activity_initiate(&dword_21A8B4000, "saveEndowment", OS_ACTIVITY_FLAG_DEFAULT, v44);

        }
        else if (v7 == sel_isIdentityAnAngel_withError_)
        {
          v39[0] = v10;
          v39[1] = 3221225472;
          v39[2] = __36__RBConnectionClient_handleMessage___block_invoke_26;
          v39[3] = &unk_24DD46970;
          v43 = buf;
          v40 = v5;
          v41 = a1;
          v42 = v37;
          _os_activity_initiate(&dword_21A8B4000, "isIdentityAnAngel", OS_ACTIVITY_FLAG_DEFAULT, v39);

        }
        else
        {
          rbs_connection_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            v27 = *(_QWORD *)(a1 + 112);
            NSStringFromSelector(v7);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBConnectionClient handleMessage:].cold.2(v27, v28, (uint64_t)v195, v26);
          }

          v29 = (void *)MEMORY[0x24BDD1540];
          v193 = *MEMORY[0x24BDD0FD8];
          v194 = CFSTR("The server has no implementation for this message");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE80E58], 501, v30);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v31;

        }
        v33 = v188[5];
        if (v33)
          (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v187, 8);
      }
      else
      {
        rbs_connection_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[RBConnectionClient handleMessage:].cold.1(a1, v11, v15);
      }

    }
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "rbs_isPermanentFailure");
    rbs_connection_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __36__RBConnectionClient_handleMessage___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_INFO, "Error handling message from %{public}@: <%{public}@>", (uint8_t *)&v10, 0x16u);
    }

  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v9, "encodeObject:forKey:", v4, *MEMORY[0x24BE80E70]);
    objc_msgSend(*(id *)(a1 + 48), "send");
  }

}

- (_QWORD)_addStatesForUntrackedProcessesTo:(void *)a3 withPredicate:
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v35 = a1;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(v6, "processIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
    {
      a1 = v5;
    }
    else
    {
      objc_msgSend(v6, "processIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = v5;
      v12 = v5;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "process", v34);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "instance");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v19);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v14);
      }

      if (objc_msgSend(v11, "count"))
      {
        v20 = (void *)objc_msgSend(v12, "mutableCopy");
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v21 = v11;
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
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "rbs_pid", v34);
              if (RBSPIDExists())
              {
                v26 = (void *)v35[5];
                objc_msgSend(v6, "processIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "processForIdentifierWithoutStartingTracking:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  v29 = v6;
                  v30 = (void *)MEMORY[0x24BE80CE8];
                  objc_msgSend(v28, "handle");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "untrackedRunningStateforProcess:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v32)
                    -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:].cold.1();
                  objc_msgSend(v20, "addObject:", v32);

                  v6 = v29;
                }

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v23);
        }

        a1 = (_QWORD *)objc_msgSend(v20, "copy");
      }
      else
      {
        a1 = v12;
      }

      v5 = v34;
    }
  }

  return a1;
}

- (id)infoPlistResultForInstance:(void *)a3 forKeys:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v19 = 0;
    goto LABEL_23;
  }
  if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0)
    goto LABEL_27;
  v9 = (void *)MEMORY[0x24BE80CD8];
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v12);

  if (v13)
  {
LABEL_27:
    if (v7 && objc_msgSend(v8, "count"))
    {
      objc_msgSend(a1[5], "processForInstance:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        -[NSObject handle](v14, "handle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "bundleInfoValuesForKeys:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            v19 = objc_alloc_init(MEMORY[0x24BE80CA8]);
            objc_msgSend(v19, "setValue:", v18);
          }
          else
          {
            v19 = 0;
          }
          v22 = 0;
        }
        else
        {
          v25 = (void *)MEMORY[0x24BDD1540];
          v26 = *MEMORY[0x24BE80E48];
          v32 = *MEMORY[0x24BDD0FD8];
          v33 = CFSTR("No bundle found");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 3, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
        }

      }
      else
      {
        v23 = (void *)MEMORY[0x24BDD1540];
        v24 = *MEMORY[0x24BE80E48];
        v30 = *MEMORY[0x24BDD0FD8];
        v31 = CFSTR("No process found");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 3, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }

      goto LABEL_20;
    }
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BE80E48];
    v28 = *MEMORY[0x24BDD0FD8];
    v29 = CFSTR("Invalid instance or keys");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_connection_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RBConnectionClient infoPlistResultForInstance:forKeys:error:].cold.1();
  }
  v19 = 0;
LABEL_20:

  if (a4)
    *a4 = objc_retainAutorelease(v22);

LABEL_23:
  return v19;
}

- (void)didRemoveProcess:(uint64_t)a1 withState:(void *)a2
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    if ((objc_msgSend(*(id *)(a1 + 176), "containsObject:", v3) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 176), "removeObject:", v3);
      v4 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      if (v4)
      {
        rbs_process_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 112);
          objc_msgSend(v3, "lastExitContext");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v13 = v6;
          v14 = 2112;
          v15 = v3;
          v16 = 2112;
          v17 = v7;
          _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Notifying connection %@ that process %@ exited with context %@", buf, 0x20u);

        }
        v8 = (void *)MEMORY[0x24BE80D60];
        objc_msgSend(v3, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastExitContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "messageForMethod:varguments:", sel_async_processDidExit_withContext_, v9, v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "sendToConnection:", v4);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      v4 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 184), "didObserveProcessExit:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(_QWORD *)(v6 + 40);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80E58];
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v14 = a1[5];
    v16 = 0;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 1, &v16);
    v15 = v16;
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v15;
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(_QWORD *)(v6 + 40);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80E58];
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v14 = a1[5];
    v16 = 0;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 0, &v16);
    v15 = v16;
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v15;
  }

}

- (BOOL)invalidateAssertionWithIdentifier:(uint64_t)a3 sync:(_QWORD *)a4 error:
{
  id v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL8 v18;
  uint8_t v20[16];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (a1)
  {
    v21 = 0;
    v8 = -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:]((id *)a1, v7, &v21);
    v9 = v21;
    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_msgSend(*(id *)(a1 + 168), "removeObject:", v7);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if ((objc_msgSend(*(id *)(a1 + 24), "invalidateAssertionFromOriginator:sync:withIdentifier:", *(_QWORD *)(a1 + 136), a3, v7) & 1) == 0)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = *MEMORY[0x24BE80E48];
        v22 = *MEMORY[0x24BDD0FD8];
        v23[0] = CFSTR("Assertion invalidation request failed");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 5, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v13;
      }
    }
    rbs_sp_assertion_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, (const void *)objc_msgSend(v7, "hash"));

    rbs_sp_assertion_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_21A8B4000, v17, OS_SIGNPOST_INTERVAL_END, v15, "ClientAssertion", (const char *)&unk_21A939C9A, v20, 2u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v9);
    v18 = v9 == 0;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (uint64_t)_canInvalidateAssertionWithIdentifier:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  int v7;
  uint64_t *v8;
  int v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_13;
  }
  if (v5)
  {
    v7 = objc_msgSend(v5, "clientPid");
    v8 = (uint64_t *)(a1 + 17);
    v9 = objc_msgSend(a1[17], "pid");
    v10 = objc_msgSend(a1, "hasEntitlement:", CFSTR("com.apple.runningboard.invalidateanyassertion"));
    v11 = 0;
    v12 = 1;
    if (v7 == v9 || (v10 & 1) != 0)
      goto LABEL_10;
    rbs_assertion_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:].cold.1(v8, v6, v13);

    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE80E48];
    v23 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("Specified assertion identifier is not owned by the client");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (const __CFString **)v24;
    v18 = &v23;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE80E48];
    v21 = *MEMORY[0x24BDD0FD8];
    v22 = CFSTR("No assertion identifier specified");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v22;
    v18 = &v21;
  }
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
LABEL_10:
  if (a3)
    *a3 = objc_retainAutorelease(v11);

LABEL_13:
  return v12;
}

- (BOOL)hasEntitlement:(id)a3
{
  return -[RBEntitlementPossessing hasEntitlement:](self->_entitlements, "hasEntitlement:", a3);
}

void __36__RBConnectionClient_handleMessage___block_invoke_13(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(_QWORD *)(v6 + 40);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80E58];
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v14 = a1[5];
    v16 = 0;
    -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:](v14, v5, &v16);
    v15 = v16;
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v15;
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = a1[5];
    v17 = 0;
    -[RBConnectionClient lookupHandleForPredicate:error:](v16, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    objc_msgSend(v12, "fullEncode:forKey:", a1[6], *MEMORY[0x24BE80E80]);
  }

}

- (id)lookupHandleForPredicate:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_28;
  }
  if ((objc_msgSend((id)a1, "hasEntitlementDomain:", 1) & 1) == 0)
  {
    v34[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient lookupHandleForPredicate:error:].cold.3();
      v10 = 0;
      goto LABEL_21;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "processesMatchingPredicate:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v8, "count"))
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE80E48];
    v26 = *MEMORY[0x24BDD0FD8];
    v27 = CFSTR("Specified predicate did not match any processes");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    rbs_connection_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 104);
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_INFO, "%{public}@ handle lookup could not find a matching process", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (-[NSObject count](v8, "count") != 1)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE80E48];
    v28 = *MEMORY[0x24BDD0FD8];
    v29 = CFSTR("Specified predicate matched multiple processes");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 1, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    rbs_connection_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBConnectionClient lookupHandleForPredicate:error:].cold.2();
    goto LABEL_19;
  }
  -[NSObject anyObject](v8, "anyObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isActiveProcess:", v9) & 1) == 0)
  {
    -[NSObject rbs_pid](v9, "rbs_pid");
    if (!RBSPIDExists())
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BE80E48];
      v32 = *MEMORY[0x24BDD0FD8];
      v33 = CFSTR("Process is no longer running");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 3, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      rbs_connection_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 104);
        *(_DWORD *)buf = 138543362;
        v31 = v23;
        _os_log_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ handle requested for no longer running process", buf, 0xCu);
      }

LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
  }
  -[NSObject handle](v9, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_20:

LABEL_21:
  if (!v11)
  {
    rbs_connection_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[RBConnectionClient lookupHandleForPredicate:error:].cold.1();

  }
  if (a3)
    *a3 = objc_retainAutorelease(v11);

LABEL_28:
  return v10;
}

void __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v12, *MEMORY[0x24BE80E70]);
  if (v9)
  {
    objc_msgSend(v9, "fullEncode:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE80E80]);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject attributes](v13, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v10)
    {
      if (!objc_msgSend(v14, "count"))
      {
        v10 = 0;
        goto LABEL_6;
      }
      rbs_connection_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112);
        -[NSObject identity](v13, "identity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v17;
        v24 = 2114;
        v25 = v18;
        v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_INFO, "Re-acquiring launch assertion for request %{public}@ from %{public}@ for target: %{public}@", (uint8_t *)&v22, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "acquireDroppedLaunchAssertion:requestor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_6;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "addObject:", v10);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v10, *MEMORY[0x24BE80E68]);
LABEL_6:
    if (objc_msgSend(v11, "count"))
      objc_msgSend(*(id *)(a1 + 32), "encodeDictionary:forKey:", v11, *MEMORY[0x24BE80E78]);

LABEL_12:
    goto LABEL_13;
  }
  if (v10)
  {
    rbs_connection_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112);
      v22 = 138544130;
      v23 = v20;
      v24 = 2114;
      v25 = v21;
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v12;
      _os_log_fault_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_FAULT, "launch request %{public}@ from %{public}@ failed but still created an assertion (%{public}@) : error=%{public}@", (uint8_t *)&v22, 0x2Au);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 56), "send");

}

- (id)initWithContext:(void *)a3 listener:(void *)a4 process:(void *)a5 connection:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v45;
  void *v46;
  objc_super v47;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
    goto LABEL_6;
  if (v12)
  {
    if (v10)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithContext_listener_process_connection_, a1, CFSTR("RBConnectionClient.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process"));

    if (v10)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithContext_listener_process_connection_, a1, CFSTR("RBConnectionClient.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_4:
  v47.receiver = a1;
  v47.super_class = (Class)RBConnectionClient;
  v14 = (id *)objc_msgSendSuper2(&v47, sel_init);
  a1 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a2);
    objc_msgSend(v10, "assertionManager");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = a1[3];
    a1[3] = (id)v15;

    objc_msgSend(v10, "entitlementManager");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = a1[4];
    a1[4] = (id)v17;

    objc_msgSend(v10, "processManager");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = a1[5];
    a1[5] = (id)v19;

    objc_msgSend(v10, "processMonitor");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = a1[6];
    a1[6] = (id)v21;

    objc_msgSend(v10, "stateCaptureManager");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = a1[7];
    a1[7] = (id)v23;

    objc_msgSend(v10, "requestManager");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = a1[9];
    a1[9] = (id)v25;

    objc_storeStrong(a1 + 10, a3);
    objc_msgSend(v10, "process");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = a1[11];
    a1[11] = (id)v27;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = a1[21];
    a1[21] = (id)v29;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = a1[22];
    a1[22] = (id)v31;

    a1[2] = 0;
    v33 = a1[24];
    a1[24] = 0;

    *((_BYTE *)a1 + 96) = 0;
    objc_storeStrong(a1 + 14, a4);
    objc_msgSend(v12, "handle");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = a1[15];
    a1[15] = (id)v34;

    objc_msgSend(v12, "identity");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = a1[16];
    a1[16] = (id)v36;

    objc_msgSend(v12, "identifier");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = a1[17];
    a1[17] = (id)v38;

    *((_DWORD *)a1 + 36) = 0;
    objc_msgSend(v12, "shortDescription");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = a1[13];
    a1[13] = (id)v40;

    objc_msgSend(a1[4], "entitlementsForProcess:", a1[14]);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = a1[20];
    a1[20] = (id)v42;

    objc_storeStrong(a1 + 1, a5);
    objc_msgSend(a1[7], "addItem:", a1);
  }
LABEL_6:

  return a1;
}

- (id)handshakeWithRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v41 = v3;
  if (a1)
  {
    v4 = v3;
    rbs_connection_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 136);
      objc_msgSend(v4, "assertionDescriptors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v6;
      v62 = 2050;
      v63 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Received handshake request from %{public}@ with %{public}lu assertion descriptors", buf, 0x16u);

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v4, "savedEndowments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          -[RBConnectionClient saveEndowment:withError:](a1, *(void **)(*((_QWORD *)&v54 + 1) + 8 * i), 0);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "assertionDescriptors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v13)
    {
      v14 = v13;
      v45 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v51 != v45)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v43, "addObject:", v17);
            objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v16, "copyWithIdentifier:", v18);
            v20 = *(void **)(a1 + 40);
            objc_msgSend(v19, "target");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "processIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (id)objc_msgSend(v20, "processForIdentifier:", v22);

            objc_msgSend(v44, "addObject:", v16);
          }
          else
          {
            rbs_assertion_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v61 = v16;
              _os_log_error_impl(&dword_21A8B4000, v18, OS_LOG_TYPE_ERROR, "Handshake request contains assertion %{public}@ without old identifier", buf, 0xCu);
            }
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v14);
    }

    +[RBAssertionBatchContext contextForProcess:acquisitionCompletionPolicy:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:](RBAssertionBatchContext, "contextForProcess:acquisitionCompletionPolicy:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:", *(_QWORD *)(a1 + 112), 0, v44, MEMORY[0x24BDBD1A8], *(_QWORD *)(a1 + 64));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 24);
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __43__RBConnectionClient_handshakeWithRequest___block_invoke;
    v46[3] = &unk_24DD46A88;
    v46[4] = a1;
    v26 = v43;
    v47 = v26;
    v27 = v40;
    v48 = v27;
    v28 = v39;
    v49 = v28;
    objc_msgSend(v25, "commitBatchWithContext:completion:", v24, v46);
    rbs_connection_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(void **)(a1 + 136);
      *(_DWORD *)buf = 138543362;
      v61 = v30;
      _os_log_impl(&dword_21A8B4000, v29, OS_LOG_TYPE_DEFAULT, "Handshake successful with %{public}@; sending response",
        buf,
        0xCu);
    }

    objc_msgSend(v41, "assertionDescriptors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    v33 = objc_msgSend(v27, "count");
    v34 = objc_msgSend(v28, "count") + v33;
    if (v34 != v32)
    {
      rbs_connection_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[RBConnectionClient handshakeWithRequest:].cold.1(v32, v34, v35);

    }
    v36 = objc_alloc_init(MEMORY[0x24BE80BB8]);
    objc_msgSend(v36, "setHandle:", *(_QWORD *)(a1 + 120));
    objc_msgSend(v36, "setAssertionIdentifiersByOldIdentifier:", v27);
    objc_msgSend(v36, "setAssertionErrorsByOldIdentifier:", v28);
    objc_msgSend(*(id *)(a1 + 112), "managedEndpointByLaunchIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setManagedEndpointByLaunchIdentifier:", v37);

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void)_setReadyWithConnection:(uint64_t)a1
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RBClientInheritanceManager *v12;
  RBProcessMonitorObserver *v13;
  uint64_t v14;
  uint64_t v15;
  RBProcessMonitorObserverConnection *v16;
  RBProcessMonitorObserver *v17;
  void *v18;
  RBClientInheritanceManager *v19;
  void *v20;
  RBProcessMonitorObserver *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    rbs_connection_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 112), "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v6;
      _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Setting client for %{public}@ as ready", (uint8_t *)&v22, 0xCu);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 96))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }
    else
    {
      *(_BYTE *)(a1 + 96) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      v7 = *(void **)(a1 + 24);
      objc_msgSend(*(id *)(a1 + 120), "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stateForIdentity:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inheritances");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allInheritances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[RBClientInheritanceManager initWithInheritances:delegate:]([RBClientInheritanceManager alloc], "initWithInheritances:delegate:", v11, a1);
      v13 = [RBProcessMonitorObserver alloc];
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 112);
      v16 = -[RBProcessMonitorObserverConnection initWithConnection:]([RBProcessMonitorObserverConnection alloc], "initWithConnection:", v4);
      v17 = -[RBProcessMonitorObserver initWithMonitor:forProcess:connection:](v13, "initWithMonitor:forProcess:connection:", v14, v15, v16);

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_storeStrong((id *)(a1 + 8), a2);
      v18 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v12;
      v19 = v12;

      v20 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v17;
      v21 = v17;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      -[RBConnectionListener connectionIsReady:](*(_QWORD *)(a1 + 80), (void *)a1);

    }
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_14(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v14 = *MEMORY[0x24BDD1398];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    -[RBConnectionClient unsubscribeFromProcessStateChangesWithIdentifier:](a1[5], objc_msgSend(v5, "unsignedLongLongValue"));
  }

}

- (void)unsubscribeFromProcessStateChangesWithIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 184), "removeConfigurationWithIdentifier:", a2);
    os_unfair_lock_unlock(v4);
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(_QWORD *)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = *(id **)(a1 + 40);
    v18 = 0;
    -[RBConnectionClient limitationsForInstance:error:](v17, v6, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v13, *MEMORY[0x24BE80E80]);
  }

}

- (id)limitationsForInstance:(_QWORD *)a3 error:
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a1)
    goto LABEL_13;
  if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) == 0)
  {
    v6 = objc_msgSend(a1[17], "pid");
    if (v6 != objc_msgSend(v5, "rbs_pid"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient limitationsForInstance:error:].cold.1();
      goto LABEL_9;
    }
  }
  objc_msgSend(a1[5], "processForInstance:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE80E48];
    v13 = *MEMORY[0x24BDD0FD8];
    v14[0] = CFSTR("No process found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    a1 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1[3], "limitationsForInstance:", v5);
  a1 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_10:

  if (a3)
    *a3 = objc_retainAutorelease(v8);

LABEL_13:
  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_19(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[8] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(a1[7] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1[8] + 8);
  v10 = *(_QWORD *)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[8] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = (id *)a1[5];
    v18 = 0;
    -[RBConnectionClient hostProcessForInstance:error:](v17, v6, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    objc_msgSend(v13, "fullEncode:forKey:", a1[6], *MEMORY[0x24BE80E80]);
  }

}

- (id)hostProcessForInstance:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0)
      goto LABEL_4;
    v6 = (void *)MEMORY[0x24BE80CD8];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateMatchingIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

    if (v10)
    {
LABEL_4:
      objc_msgSend(a1[5], "processForInstance:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        -[NSObject hostProcess](v11, "hostProcess");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "handle");
          a1 = (id *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          a1 = 0;
        }
        v17 = 0;
      }
      else
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BE80E48];
        v19 = *MEMORY[0x24BDD0FD8];
        v20 = CFSTR("No process found");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 3, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient hostProcessForInstance:error:].cold.1();
      a1 = 0;
    }

    if (a3)
      *a3 = objc_retainAutorelease(v17);

  }
  return a1;
}

- (uint64_t)_predicatesMatchOnlyAllowedProcess:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  NSObject *v61;
  __int16 v62;
  NSObject *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
  {
    v42 = 0;
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 112), "hostProcess");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v6, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      objc_msgSend(v6, "hostProcess");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (!v9)
  {
    v42 = 1;
    goto LABEL_49;
  }
  v10 = v9;
  v46 = v3;
  v11 = *(_QWORD *)v56;
  v47 = *(_QWORD *)v56;
  v48 = a1;
LABEL_7:
  v12 = 0;
  v49 = v10;
  while (1)
  {
    if (*(_QWORD *)v56 != v11)
      objc_enumerationMutation(obj);
    v13 = *(NSObject **)(*((_QWORD *)&v55 + 1) + 8 * v12);
    -[NSObject processIdentifier](v13, "processIdentifier", v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "rbs_pid");
    v16 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");

    if (v15 == v16)
    {
      rbs_general_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(NSObject **)(a1 + 112);
        *(_DWORD *)buf = 138543618;
        v61 = v13;
        v62 = 2114;
        v63 = v18;
        _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching self %{public}@ for process %{public}@", buf, 0x16u);
      }
      goto LABEL_31;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = v4;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v52 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          -[NSObject processIdentifier](v13, "processIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "rbs_pid");
          LODWORD(v25) = objc_msgSend(v25, "pid");

          if (v27 == (_DWORD)v25)
          {

            rbs_general_log();
            v17 = objc_claimAutoreleasedReturnValue();
            v10 = v49;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              a1 = v48;
              v36 = *(NSObject **)(v48 + 112);
              *(_DWORD *)buf = 138543618;
              v61 = v13;
              v62 = 2114;
              v63 = v36;
              _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosting %{public}@ for process %{public}@", buf, 0x16u);
              v4 = v19;
            }
            else
            {
              v4 = v19;
              a1 = v48;
            }
            goto LABEL_30;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v22)
          continue;
        break;
      }
    }

    a1 = v48;
    v28 = *(void **)(v48 + 40);
    -[NSObject processIdentifier](v13, "processIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "processForIdentifierWithoutStartingTracking:", v29);
    v17 = objc_claimAutoreleasedReturnValue();

    rbs_general_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      v62 = 2114;
      v63 = v17;
      _os_log_impl(&dword_21A8B4000, v30, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess for predicate %{public}@ resolved target to %{public}@", buf, 0x16u);
    }

    v31 = objc_msgSend(*(id *)(v48 + 112), "rbs_pid");
    -[NSObject hostProcess](v17, "hostProcess");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "rbs_pid");

    if (v31 == v33)
    {
      rbs_general_log();
      v34 = objc_claimAutoreleasedReturnValue();
      v4 = v19;
      v10 = v49;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = *(NSObject **)(v48 + 112);
        *(_DWORD *)buf = 138543618;
        v61 = v13;
        v62 = 2114;
        v63 = v35;
        _os_log_impl(&dword_21A8B4000, v34, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosted %{public}@ for process %{public}@", buf, 0x16u);
      }

LABEL_30:
      v11 = v47;
      goto LABEL_31;
    }
    objc_msgSend(*(id *)(v48 + 32), "entitlementsForProcess:", v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v19;
    if (!objc_msgSend(v37, "hasEntitlement:", CFSTR("com.apple.runningboard.trustedtarget")))
      break;
    rbs_general_log();
    v38 = objc_claimAutoreleasedReturnValue();
    v11 = v47;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = *(NSObject **)(v48 + 112);
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      v62 = 2114;
      v63 = v39;
      _os_log_impl(&dword_21A8B4000, v38, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching trusted target %{public}@ for process %{public}@", buf, 0x16u);
    }
LABEL_41:

    v10 = v49;
LABEL_31:

    if (++v12 == v10)
    {
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      v10 = v41;
      if (!v41)
      {
        v42 = 1;
        goto LABEL_48;
      }
      goto LABEL_7;
    }
  }
  -[NSObject bundleIdentifier](v13, "bundleIdentifier");
  v38 = objc_claimAutoreleasedReturnValue();
  v11 = v47;
  if ((-[NSObject isEqualToString:](v38, "isEqualToString:", CFSTR("com.apple.dt.XcodePreviews")) & 1) != 0
    || -[NSObject isEqualToString:](v38, "isEqualToString:", CFSTR("com.apple.PreviewShell")))
  {
    rbs_general_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v61 = v38;
      v62 = 2114;
      v63 = v13;
      _os_log_impl(&dword_21A8B4000, v40, OS_LOG_TYPE_INFO, "_predicatesMatchOnlyAllowedProcess allowing predicate matching %{public}@ (%{public}@)", buf, 0x16u);
    }

    goto LABEL_41;
  }
  rbs_general_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = *(NSObject **)(v48 + 112);
    *(_DWORD *)buf = 138543618;
    v61 = v13;
    v62 = 2114;
    v63 = v44;
    _os_log_impl(&dword_21A8B4000, v43, OS_LOG_TYPE_DEFAULT, "_predicatesMatchOnlyAllowedProcess denying predicate %{public}@ for process %{public}@", buf, 0x16u);
  }

  v42 = 0;
LABEL_48:
  v3 = v46;
LABEL_49:

LABEL_50:
  return v42;
}

- (__CFString)lookupProcessName:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  _OWORD buffer[3];
  _OWORD v22[5];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  memset(buffer, 0, sizeof(buffer));
  v7 = objc_msgSend(v5, "intValue");
  if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

  if (v10)
  {
LABEL_4:
    if (proc_pidinfo(v7, 3, 0, buffer, 136) == 136)
    {
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22);
      v12 = 0;
      if (!a3)
        goto LABEL_11;
    }
    else
    {
      rbs_assertion_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient lookupProcessName:error:].cold.1(v7, v13);

      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BE80E48];
      v18 = *MEMORY[0x24BDD0FD8];
      v19 = CFSTR("Could not get proc_pidinfo for pid");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 5, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = CFSTR("<unknown>");
      if (!a3)
        goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a3)
      goto LABEL_11;
  }
  *a3 = objc_retainAutorelease(v12);
LABEL_11:

LABEL_12:
  return v11;
}

- (void)limitationsForInstance:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to get limitationsForInstance: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)invalidate
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    rbs_process_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 112);
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    objc_msgSend(*(id *)(a1 + 176), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 112), "setTerminating:", 1);
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    objc_msgSend(*(id *)(a1 + 184), "invalidate");
    v5 = *(void **)(a1 + 184);
    *(_QWORD *)(a1 + 184) = 0;

    objc_msgSend(*(id *)(a1 + 56), "removeItem:", a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    -[RBConnectionClient cleanupHolds](a1);
  }
}

- (void)cleanupHolds
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
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
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "assertionsForOriginator:", *(_QWORD *)(a1 + 136));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v15;
      *(_QWORD *)&v4 = 138412290;
      v13 = v4;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(a1 + 24);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "identifier", v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "popPluginHoldForAssertion:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            rbs_assertion_log();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              v19 = v10;
              _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_INFO, "Releasing plugin hold token for dealloc %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x24BE72FB8], "managerForUser:", *(unsigned int *)(a1 + 144));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "releaseHold:", v10);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationBoostAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateObserver, 0);
  objc_storeStrong((id *)&self->_deathMonitors, 0);
  objc_storeStrong((id *)&self->_assertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_inheritanceManager, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_containingProcess, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)sharedTerminationWorkloop
{
  objc_opt_self();
  if (sharedTerminationWorkloop_onceToken != -1)
    dispatch_once(&sharedTerminationWorkloop_onceToken, &__block_literal_global_8);
  return (id)sharedTerminationWorkloop_workloop;
}

void __47__RBConnectionClient_sharedTerminationWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("RBConnectionClientTermination");
  v1 = (void *)sharedTerminationWorkloop_workloop;
  sharedTerminationWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedTerminationWorkloop_workloop);
}

void __42__RBConnectionClient_sharedLaunchWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("RBConnectionClientLaunch");
  v1 = (void *)sharedLaunchWorkloop_workloop;
  sharedLaunchWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedLaunchWorkloop_workloop);
}

- (RBConnectionClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBConnectionClient.m"), 150, CFSTR("-init is not allowed on RBConnectionClient"));

  return 0;
}

id __36__RBConnectionClient_handleMessage___block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(a2, "copyWithEuid:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v3, "processIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    return v3;
  }
  v6 = *(_QWORD *)(a1 + 32);

  if (v6)
  {
    v4 = v3;
    v3 = (void *)objc_msgSend(v3, "copyWithPersonaString:", *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
  return v3;
}

void __36__RBConnectionClient_handleMessage___block_invoke_34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v14 = *MEMORY[0x24BDD1398];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    -[RBConnectionClient _setReadyWithConnection:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
    objc_msgSend(v5, "setEuid:", *(unsigned int *)(a1 + 72));
    -[RBConnectionClient handshakeWithRequest:](*(_QWORD *)(a1 + 40), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "encodeObject:forKey:", v9, *MEMORY[0x24BE80E80]);
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_2_40(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = (void *)a1[5];
    v17 = 0;
    -[RBConnectionClient lookupHandleForKey:error:](v16, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    objc_msgSend(v12, "fullEncode:forKey:", a1[6], *MEMORY[0x24BE80E80]);
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_3_44(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = *(void **)(a1 + 40);
    v17 = 0;
    -[RBConnectionClient lookupProcessName:error:](v16, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v12, *MEMORY[0x24BE80E80]);
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *v16;
  id v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = *(id **)(a1 + 40);
    v17 = 0;
    -[RBConnectionClient lookupPortForIdentifier:error:](v16, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v12, *MEMORY[0x24BE80E80]);
  }

}

- (id)lookupPortForIdentifier:(_QWORD *)a3 error:
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  if (!a1)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) == 0)
  {
    v6 = objc_msgSend(a1[15], "rbs_pid");
    if (v6 != objc_msgSend(v5, "rbs_pid"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient lookupPortForIdentifier:error:].cold.1();

      if (a3)
        *a3 = objc_retainAutorelease(v8);

      goto LABEL_10;
    }
  }
  objc_msgSend(MEMORY[0x24BE80C10], "taskNameForPID:", objc_msgSend(v5, "rbs_pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v7;
}

void __36__RBConnectionClient_handleMessage___block_invoke_9(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  uint64_t v14;
  id *v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    v13 = *(id **)(a1 + 40);
    v14 = objc_msgSend(v5, "BOOLValue");
    v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v16 = 0;
    -[RBConnectionClient assertionDescriptorsWithFlattenedAttributes:error:](v13, v14, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v15, v16);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v9, *MEMORY[0x24BE80E80]);
  }

}

- (id)assertionDescriptorsWithFlattenedAttributes:(_QWORD *)a3 error:
{
  void *v6;
  void *v7;

  if (!a1)
  {
    v6 = 0;
    return v6;
  }
  if (objc_msgSend(a1, "hasEntitlement:", CFSTR("com.apple.runningboard.listallassertions")))
  {
    objc_msgSend(a1[3], "assertionDescriptorsWithFlattenedAttributes:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.listallassertions"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (a3)
LABEL_6:
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v6;
}

void __36__RBConnectionClient_handleMessage___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id obj;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v15 = *MEMORY[0x24BDD1398];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    -[RBConnectionClient executeTerminateRequest:withReply:](*(_QWORD *)(a1 + 40), v5, *(void **)(a1 + 48));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

}

- (void)executeTerminateRequest:(void *)a3 withReply:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  __CFString *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v51 = v6;
    rbs_connection_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 104);
      v10 = objc_msgSend(v5, "targetsAllManagedProcesses");
      if ((v10 & 1) != 0)
      {
        v11 = CFSTR("All Managed Processes");
      }
      else
      {
        objc_msgSend(v5, "predicate");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v9;
      v66 = 2114;
      v67 = v11;
      v68 = 2114;
      v69 = v12;
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "Received termination request from %{public}@ on %{public}@ with context %{public}@", buf, 0x20u);
      if ((v10 & 1) == 0)

    }
    objc_msgSend(v5, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v5;
    v49 = v14;
    if (v14)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v14;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16, v14);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v60 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
            v21 = (id)objc_msgSend(*(id *)(a1 + 40), "processForIdentifier:", v20);
            objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v20, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v17 |= objc_msgSend(v22, "isXPCService") ^ 1;
            if ((v17 & 1) != 0)
            {
              v23 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 40), "processForIdentifierWithoutStartingTracking:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");
              objc_msgSend(v24, "hostProcess");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v25 == objc_msgSend(v26, "rbs_pid");

            }
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v16);
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
    v7 = v51;
    objc_msgSend(v51, "payload", v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "targetsAllManagedProcesses"))
    {
      if ((objc_msgSend((id)a1, "hasEntitlement:", CFSTR("com.apple.runningboard.terminatemanagedprocesses")) & 1) == 0)
      {
        rbs_connection_log();
        v28 = objc_claimAutoreleasedReturnValue();
        v5 = v52;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[RBConnectionClient executeTerminateRequest:withReply:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

        objc_msgSend(v27, "encodeBool:forKey:", 0, *MEMORY[0x24BE80E80]);
        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = CFSTR("com.apple.runningboard.terminatemanagedprocesses");
LABEL_34:
        objc_msgSend(v36, "rbs_errorClientNotEntitled:permanent:", v37, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "encodeObject:forKey:", v48, *MEMORY[0x24BE80E70]);

        objc_msgSend(v51, "send");
        goto LABEL_35;
      }
    }
    else if (((objc_msgSend((id)a1, "hasEntitlementDomain:", 4) | v23) & 1) == 0)
    {
      rbs_connection_log();
      v40 = objc_claimAutoreleasedReturnValue();
      v5 = v52;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient executeTerminateRequest:withReply:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);

      objc_msgSend(v27, "encodeBool:forKey:", 0, *MEMORY[0x24BE80E80]);
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = CFSTR("com.apple.runningboard.terminateprocess");
      goto LABEL_34;
    }
    objc_msgSend(v51, "prepareForHandoff");
    objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBConnectionClient sharedTerminationWorkloop]();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke;
    v54[3] = &unk_24DD466C8;
    v5 = v52;
    v55 = v52;
    v56 = a1;
    v57 = v27;
    v58 = v51;
    objc_msgSend(v38, "handoffToQueue:block:", v39, v54);

LABEL_35:
  }

}

void __36__RBConnectionClient_handleMessage___block_invoke_16(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id obj;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(a1[6] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)a1[4];
  v8 = objc_opt_class();
  v9 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v22 = 0;
  objc_msgSend(v7, "decodeArgumentWithClass:atIndex:allowNil:error:", v8, 1, 0, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v22);
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(_QWORD *)(v11 + 40);
  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE80E58];
    v24 = *MEMORY[0x24BDD1398];
    v25[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[7] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  else
  {
    v19 = a1[5];
    v21 = 0;
    -[RBConnectionClient intendToExit:withStatus:error:](v19, (uint64_t)v6, v10, &v21);
    v20 = v21;
    v15 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v20;
  }

}

- (BOOL)intendToExit:(void *)a3 withStatus:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL8 v11;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "processForInstance:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    rbs_process_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "Setting intended exit status on %{public}@ to %{public}@", buf, 0x16u);
    }

    objc_msgSend(v8, "setIntendedExitStatus:", v7);
    v10 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE80E48];
    v16 = *MEMORY[0x24BDD0FD8];
    v17 = CFSTR("No process found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_7;
  }
  *a4 = objc_retainAutorelease(v10);
LABEL_7:
  v11 = v10 == 0;

LABEL_8:
  return v11;
}

void __36__RBConnectionClient_handleMessage___block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(_QWORD *)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = *(id **)(a1 + 40);
    v18 = 0;
    -[RBConnectionClient lastExitContextForInstance:error:](v17, (uint64_t)v6, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v13, *MEMORY[0x24BE80E80]);
  }

}

- (id)lastExitContextForInstance:(_QWORD *)a3 error:
{
  id v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v3 = a1;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a1[5], "processForInstance:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasEntitlementDomain:", 1))
    {
      if (v5)
      {
        objc_msgSend(v5, "lastExitContext");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        v6 = 0;
        if (!a3)
          goto LABEL_11;
        goto LABEL_10;
      }
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BE80E48];
      v11 = *MEMORY[0x24BDD0FD8];
      v12[0] = CFSTR("No process found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient lastExitContextForInstance:error:].cold.1();
    }

    v3 = 0;
    if (!a3)
    {
LABEL_11:

      return v3;
    }
LABEL_10:
    *a3 = objc_retainAutorelease(v6);
    goto LABEL_11;
  }
  return v3;
}

void __36__RBConnectionClient_handleMessage___block_invoke_21(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id obj;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 1, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80E58];
    v15 = *MEMORY[0x24BDD1398];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    -[RBConnectionClient captureStateForSubsystem:withReply:](*(void **)(a1 + 40), v5, *(void **)(a1 + 48));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

}

- (void)captureStateForSubsystem:(void *)a3 withReply:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(a1, "hasEntitlement:", CFSTR("com.apple.runningboard.statecapture")))
    {
      objc_msgSend(v6, "prepareForHandoff");
      objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "In captureState with xpcContext %@", buf, 0xCu);
      }

      dispatch_get_global_queue(17, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke;
      v12[3] = &unk_24DD45E60;
      v12[4] = a1;
      v13 = v5;
      v14 = v6;
      objc_msgSend(v7, "handoffToQueue:block:", v9, v12);

    }
    else
    {
      rbs_connection_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Error capturingStateForSubsystem, unentitled client", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.statecapture"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encodeObject:forKey:", v7, *MEMORY[0x24BE80E70]);

      objc_msgSend(v6, "send");
    }

  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_22(uint64_t a1)
{
  id *v2;
  id *v3;
  void *v4;
  id obj;

  v2 = *(id **)(a1 + 32);
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  -[RBConnectionClient identifiersForStateCaptureSubsystemsWithError:](v2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v4, *MEMORY[0x24BE80E80]);

}

- (id)identifiersForStateCaptureSubsystemsWithError:(id *)a1
{
  void *v4;
  void *v5;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  if (objc_msgSend(a1, "hasEntitlement:", CFSTR("com.apple.runningboard.statecapture")))
  {
    objc_msgSend(a1[7], "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (!a2)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.statecapture"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (a2)
LABEL_6:
    *a2 = objc_retainAutorelease(v5);
LABEL_7:

  return v4;
}

void __36__RBConnectionClient_handleMessage___block_invoke_23(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  id v18;
  id obj;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v3, v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(_QWORD *)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E58];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = *(id **)(a1 + 40);
    v18 = 0;
    -[RBConnectionClient busyExtensionInstancesFromSet:error:](v17, v6, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    objc_msgSend(*(id *)(a1 + 48), "encodeObject:forKey:", v13, *MEMORY[0x24BE80E80]);
  }

}

- (id)busyExtensionInstancesFromSet:(_QWORD *)a3 error:
{
  id v5;

  v5 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1[14], "isPlatformBinary") & 1) != 0
      || objc_msgSend(a1, "hasEntitlement:", CFSTR("com.apple.runningboard.statecapture")))
    {
      objc_msgSend(a1[5], "busyExtensionInstancesFromSet:", v5);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.statecapture"), 1);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_24(uint64_t a1)
{
  id v2;

  -[RBConnectionClient preventLaunchPredicates](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v2, *MEMORY[0x24BE80E80]);

}

- (id)preventLaunchPredicates
{
  id *v1;
  void *v2;
  NSObject *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient preventLaunchPredicates].cold.1();

    }
    objc_msgSend(v1[3], "systemState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preventLaunchPredicates");
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_25(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id obj;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v21 = *MEMORY[0x24BDD1398];
    v22[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = a1[5];
    v19 = 0;
    v17 = -[RBConnectionClient saveEndowment:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    v18 = (void *)a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v12, *MEMORY[0x24BE80E80]);
  }

}

- (uint64_t)saveEndowment:(_QWORD *)a3 withError:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 24), "addSavedEndowment:forProcess:", v5, *(_QWORD *)(a1 + 112)) & 1) != 0)
    {
      a1 = 1;
    }
    else
    {
      if (a3)
      {
        v6 = (void *)MEMORY[0x24BDD1540];
        v7 = *MEMORY[0x24BE80E48];
        v11 = *MEMORY[0x24BDD0FD8];
        v12[0] = CFSTR("Saved endowment already set for key");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v8);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      rbs_connection_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient saveEndowment:withError:].cold.1(a1, v5, v9);

      a1 = 0;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_26(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = (id *)(v6 + 40);
  v7 = v9;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80E58];
    v21 = *MEMORY[0x24BDD1398];
    v22[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    v16 = (void *)a1[5];
    v19 = 0;
    v17 = -[RBConnectionClient isIdentityAnAngel:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    v18 = (void *)a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v12, *MEMORY[0x24BE80E80]);
  }

}

- (void)isIdentityAnAngel:(_QWORD *)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1, "hasEntitlementDomain:", 1) & 1) != 0)
    {
      objc_msgSend(v5, "consistentLaunchdJobLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        +[RBLaunchdProperties propertiesForLabel:error:](RBLaunchdProperties, "propertiesForLabel:error:", v6, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (void *)objc_msgSend(v7, "isAngel");

LABEL_12:
        goto LABEL_13;
      }
      if (a3)
      {
        v9 = (void *)MEMORY[0x24BDD1540];
        v10 = *MEMORY[0x24BE80E48];
        v13 = *MEMORY[0x24BDD0FD8];
        v14[0] = CFSTR("Information request not supported for this identity");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 1, v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      rbs_connection_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient isIdentityAnAngel:withError:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotEntitled:permanent:", CFSTR("com.apple.runningboard.process-state"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RBConnectionClient preventLaunchPredicates].cold.1();
    }

    a1 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (void)_requestPluginHoldForProxy:(int)a3 terminate:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke;
    v23 = &unk_24DD46AD8;
    v9 = v7;
    v24 = v9;
    v10 = v8;
    v25 = v10;
    v11 = (void *)MEMORY[0x22074BF04](&v20);
    objc_msgSend(v9, "appState", v20, v21, v22, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isInstalled");

    if (v13)
    {
      objc_msgSend(v9, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BE72FB8], "managerForUser:", *(unsigned int *)(a1 + 144));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (a3)
          objc_msgSend(v15, "terminatePlugInsInApplication:options:result:", v14, 0, v11);
        else
          objc_msgSend(v15, "holdPlugInsInApplication:result:", v14, v11);

      }
      else
      {
        rbs_connection_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:].cold.1(v9, v19);

        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      }

    }
    else
    {
      rbs_connection_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v18;
        _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for uninstalled proxy %{public}@", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    rbs_connection_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_INFO, "Successfully acquired plugin hold for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v9 = 0;
  }
  else
  {
    v7 = objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", CFSTR("Error acquiring hold on plugins"), *MEMORY[0x24BDD0FD8]);
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE80E48], 5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "code");
    rbs_connection_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 14)
    {
      if (v12)
        __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1(a1, (uint64_t)v6, v11);
    }
    else if (v12)
    {
      __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2(a1, (uint64_t)v6, v11);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)expandPredicateForContained:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      rbs_connection_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "Termination predicate not expanded because complex predicate", buf, 2u);
      }
      goto LABEL_28;
    }
    if (!v8)
    {
      v9 = 0;
      v11 = 0;
      v13 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "firstObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        -[NSObject predicate](v11, "predicate");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject bundleIdentifier](v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v9;
          if ((objc_msgSend(v12, "isEqual:", v6) & 1) == 0)
            goto LABEL_25;
LABEL_15:
          RBSContainedExtensionBundleIDs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count") != 1)
          {
            objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifiers:", v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            rbs_connection_log();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v4, "predicate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v27 = v17;
              v28 = 2112;
              v29 = v24;
              _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, "expanding termination predicate from %@ to %@", buf, 0x16u);

            }
            objc_msgSend(v4, "setPredicate:", v24);
            if (v8)
            {
              v18 = (void *)MEMORY[0x24BE80C38];
              -[NSObject allow](v9, "allow");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "limitationWithPredicate:andException:", v24, v23);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v19;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "context");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setAttributes:", v20);

            }
          }

          goto LABEL_28;
        }
        v14 = v9;
LABEL_25:
        rbs_connection_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_DEFAULT, "Termination preventLaunch attribute not expanded because it didn't match Termination Predicate", buf, 2u);
        }

LABEL_28:
        goto LABEL_29;
      }
      v14 = 0;
    }
    else
    {
      v9 = 0;
      v14 = 0;
      v11 = 0;
    }
    v13 = 0;
    goto LABEL_25;
  }
LABEL_29:

}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id *v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beforeTranslocationBundlePath");
  v5 = objc_claimAutoreleasedReturnValue();
  -[RBConnectionClient expandPredicateForContained:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  objc_msgSend(v2, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  rbs_connection_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "predicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v10;
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, "Requesting plugIn hold for %{public}@", buf, 0xCu);

    }
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_157;
    v43[3] = &unk_24DD46B50;
    v11 = &v44;
    v44 = *(id *)(a1 + 48);
    v12 = (id *)v45;
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 40);
    v45[0] = v13;
    v45[1] = v14;
    v15 = v2;
    v46 = v15;
    v47 = *(id *)(a1 + 32);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22074BF04](v43);
    if (v4 | v5)
    {
      v17 = (void *)MEMORY[0x24BDC1538];
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applicationProxyForBundleURL:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "bundleURL");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v42 = v4;
          objc_msgSend(v19, "bundleURL");
          v22 = (void *)v5;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v22;
          LOBYTE(v22) = objc_msgSend(v22, "isEqual:", v24);

          if ((v22 & 1) == 0)
          {
            rbs_connection_log();
            v31 = objc_claimAutoreleasedReturnValue();
            v5 = (uint64_t)v41;
            v11 = &v44;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v19, "bundleURL");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "path");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v52 = v3;
              v53 = 2114;
              v54 = v41;
              v55 = 2114;
              v56 = v40;
              _os_log_error_impl(&dword_21A8B4000, v31, OS_LOG_TYPE_ERROR, "beforeTranslocationBundlePath does not match LS bundleURL %{public}@ (%{public}@, %{public}@)", buf, 0x20u);

            }
            v32 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v19, "bundleURL");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("beforeTranslocationBundlePath does not match LS bundleURL (%@, %@)"), v41, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = (void *)objc_opt_new();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BDD0FD8]);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE80E48], 1, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v16)[2](v16, 0, v37);

            v16 = 0;
            v4 = v42;
            v12 = (id *)v45;
            goto LABEL_25;
          }
          v5 = (uint64_t)v41;
          v4 = v42;
          v11 = &v44;
          v12 = (id *)v45;
          if (!v16)
          {
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          v11 = &v44;
          if (!v16)
            goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_25;
      }
      if (v19)
      {
        v28 = *(_QWORD *)(a1 + 40);
        v29 = objc_msgSend(v15, "shouldTerminatePlugIns");
        v30 = v28;
        v12 = (id *)v45;
        -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:](v30, v19, v29, v16);
        goto LABEL_25;
      }
      rbs_connection_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v3;
        _os_log_impl(&dword_21A8B4000, v38, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for termination request, unable to get proxy %{public}@", buf, 0xCu);
      }

      v16[2](v16, 0, 0);
    }
    else
    {
      rbs_connection_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v3;
        _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_DEFAULT, "skipping plugin hold for termination request without bundle ID or beforeTranslocationBundlePath %{public}@", buf, 0xCu);
      }

      v16[2](v16, 0, 0);
      v16 = 0;
    }
    v19 = 0;
    goto LABEL_25;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, "No attributes, calling executeTerminateRequest directly", buf, 2u);
  }

  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_155;
  v48[3] = &unk_24DD46B00;
  v11 = &v49;
  v49 = *(id *)(a1 + 48);
  v12 = &v50;
  v50 = *(id *)(a1 + 56);
  objc_msgSend(v26, "executeTerminateRequest:completion:", v25, v48);
LABEL_26:

}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_155(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x24BE80E80];
  v7 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", a2, v6);
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v7, *MEMORY[0x24BE80E70]);

  return objc_msgSend(*(id *)(a1 + 40), "send");
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_157(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  if (v5 || !a3)
  {
    objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 136), "pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80D38], "systemTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE80B18];
    objc_msgSend(*(id *)(a1 + 56), "explanation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptorWithIdentifier:target:explanation:attributes:", v6, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112), v11, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAcquisitionPolicy:", 1);
    objc_msgSend(v12, "setHoldToken:", v5);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(v13 + 24);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2;
    v16[3] = &unk_24DD46B28;
    v16[4] = v13;
    v17 = v6;
    v18 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 32);
    v20 = v5;
    v21 = *(id *)(a1 + 40);
    v15 = v6;
    objc_msgSend(v14, "acquireAssertionWithContext:completion:", v12, v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a3, *MEMORY[0x24BE80E70]);
    objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", 0, *MEMORY[0x24BE80E80]);
    objc_msgSend(*(id *)(a1 + 40), "send");
  }

}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE72FB8], "managerForUser:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 144));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "releaseHold:", *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 56), "encodeObject:forKey:", v3, *MEMORY[0x24BE80E70]);
    objc_msgSend(*(id *)(a1 + 56), "encodeBool:forKey:", 0, *MEMORY[0x24BE80E80]);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addObject:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3;
    v10 = &unk_24DD46B00;
    v6 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "executeTerminateRequest:completion:", v6, &v7);

  }
  objc_msgSend(*(id *)(a1 + 72), "send", v7, v8, v9, v10);

}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *MEMORY[0x24BE80E68];
  v8 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v8, *MEMORY[0x24BE80E70]);

  return objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", a2, *MEMORY[0x24BE80E80]);
}

void __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stateForSubsystem:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v3, *MEMORY[0x24BE80E80]);

  objc_msgSend(*(id *)(a1 + 48), "send");
}

- (void)willExpireAssertionsSoonForProcess:(double)a3 expirationTime:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
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
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[3];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1 && *(id *)(a1 + 112) == v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = *(id *)(a1 + 8);
    if (*(_QWORD *)(a1 + 192))
    {
      if (objc_msgSend(*(id *)(a1 + 24), "hasAssertionWithIdentifier:"))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_17:

        goto LABEL_18;
      }
      v8 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (!v7)
      goto LABEL_17;
    RBSMachAbsoluteTime();
    v10 = v9;
    v11 = a3 - v9 + -0.1;
    if (objc_msgSend(v6, "isSuspended"))
    {
      rbs_connection_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138544130;
        v37 = v6;
        v38 = 2050;
        v39 = v11;
        v40 = 2050;
        v41 = a3;
        v42 = 2050;
        v43 = v10;
        _os_log_fault_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_FAULT, "%{public}@ Suspension Warning for already suspened process (d:%{public}fs xt:%{public}fs n:%{public}fs)", buf, 0x2Au);
      }
    }
    else
    {
      if (v11 <= 0.0)
      {
LABEL_16:
        objc_msgSend(MEMORY[0x24BE80D60], "messageForMethod:varguments:", sel_async_willExpireAssertionsSoon, 0, v28, v29, v30, v31, v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sendToConnection:", v7);

        goto LABEL_17;
      }
      rbs_connection_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(a1 + 136);
        *(_DWORD *)buf = 138543618;
        v37 = v14;
        v38 = 2050;
        v39 = v11;
        _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "Boosting client %{public}@ for %{public}fs to handle expiration warning", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x24BE80B20];
      v12 = *(id *)(a1 + 88);
      objc_msgSend(v15, "identifierWithClientPid:", -[NSObject rbs_pid](v12, "rbs_pid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE80B40], "grantUserInitiated");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v18;
      objc_msgSend(MEMORY[0x24BE80B90], "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 103, 1, v11, 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      objc_msgSend(MEMORY[0x24BE80D08], "withReason:", 10101);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE80B18], "descriptorWithIdentifier:target:explanation:attributes:", v16, v17, CFSTR("Will expire assertions soon"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", v12, v22, *(_QWORD *)(a1 + 64));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BE80D58];
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke;
      v31 = &unk_24DD45E60;
      v32 = a1;
      v33 = v23;
      v34 = v16;
      v25 = v16;
      v26 = v23;
      objc_msgSend(v24, "performBackgroundWorkWithServiceClass:block:", 25, &v28);

    }
    goto LABEL_16;
  }
LABEL_18:

}

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2;
  v4[3] = &unk_24DD46BA0;
  v4[4] = v1;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "acquireAssertionWithContext:completion:", v2, v4);

}

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 192);
    *(_QWORD *)(v4 + 192) = 0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v5 = *(void **)(v6 + 192);
    *(_QWORD *)(v6 + 192) = v7;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)willInvalidateAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v12 = v3;
    objc_msgSend(v3, "originator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isEqual:", v6);

    v3 = v12;
    if ((_DWORD)v4)
    {
      v7 = (os_unfair_lock_s *)(a1 + 16);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      v8 = *(id *)(a1 + 8);
      os_unfair_lock_unlock(v7);
      if (v8)
      {
        v9 = (void *)MEMORY[0x24BE80D60];
        objc_msgSend(v12, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "messageForMethod:varguments:", sel_async_assertionWillInvalidate_, v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sendToConnection:", v8);

      }
      v3 = v12;
    }
  }

}

- (NSString)stateCaptureTitle
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBConnectionClient.m"), 1823, CFSTR("stateCaptureTitle should be unused for RBConnectionClient"));

  return 0;
}

- (uint64_t)processIdentifier
{
  if (result)
    return *(_QWORD *)(result + 136);
  return result;
}

- (uint64_t)processIdentity
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

- (void)handleMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 112);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, a3, "Dropping message from %{public}@ that does not conform to expectations", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

- (void)handleMessage:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13(&dword_21A8B4000, a4, a3, "Dropping message from %{public}@: The server is missing an implementation for %{public}@", (uint8_t *)a3);

}

void __36__RBConnectionClient_handleMessage___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Error handling message from %{public}@: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)handshakeWithRequest:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_13(&dword_21A8B4000, a3, (uint64_t)a3, "Expected %lu results; got %lu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupHandleForKey:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a1, "unsignedLongLongValue");
  OUTLINED_FUNCTION_2_3(&dword_21A8B4000, a2, v3, "lookupHandleForKey failed for %@ (%llx)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)lookupHandleForKey:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to lookupHandleForKey: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupProcessName:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Could not get proc_pidinfo for pid %d to get name", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)lookupHandleForPredicate:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, v0, v1, "%{public}@ query resolved to %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupHandleForPredicate:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ Error resolving process: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupHandleForPredicate:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to lookupHandleForPredicate: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupPortForIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to lookupPortForIdentifier: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)executeTerminateRequest:(uint64_t)a3 withReply:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, a1, a3, "Rejecting request because the client is not entitled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)subscribeToProcessDeath:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to subscribeToProcessDeath: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)subscribeToProcessStateChangesWithConfiguration:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to subscribeToProcessStateChangesWithConfiguration: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)statesForPredicate:withDescriptor:withReply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to get statesForPredicate: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)lastExitContextForInstance:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to get lastExitContextForInstance: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)hostProcessForInstance:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to get hostProcessForInstance: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)infoPlistResultForInstance:forKeys:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to get infoPlistResultForInstance: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)preventLaunchPredicates
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ client not entitled to preventLaunchPredicates: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)saveEndowment:(NSObject *)a3 withError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 104);
  objc_msgSend(a2, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_2_3(&dword_21A8B4000, a3, v6, "%{public}@ client tried to save endowment twice for key: <%{public}@>", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)isIdentityAnAngel:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ isIdentityAnAngel called for unsupported identity: <%{public}@>");
  OUTLINED_FUNCTION_1_1();
}

- (void)_canInvalidateAssertionWithIdentifier:(NSObject *)a3 error:.cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = 138543618;
  v6 = v4;
  v7 = 1024;
  v8 = objc_msgSend(a2, "clientPid");
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "Ignoring assertion invalidation request from %{public}@ because the assertion client identifier (%d) does not match", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_requestPluginHoldForProxy:(void *)a1 terminate:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, v4, "Could not get bundle URL for bundle %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(&dword_21A8B4000, a3, v5, "Error acquiring hold on plugins for %{public}@: %{public}@", v6);

  OUTLINED_FUNCTION_8();
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(&dword_21A8B4000, a3, v5, "Ignoring unexpected error acquiring hold on plugins for %{public}@: %{public}@", v6);

  OUTLINED_FUNCTION_8();
}

- (void)_addStatesForUntrackedProcessesTo:withPredicate:.cold.1()
{
  __assert_rtn("-[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:]", "RBConnectionClient.m", 1389, "state");
}

- (void)didInvalidateAssertions:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 136);
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, a2, a3, "Notifying client %{public}@ of %lu invalidated assertions", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_1();
}

@end
