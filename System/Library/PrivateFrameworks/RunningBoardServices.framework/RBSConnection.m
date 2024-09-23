@implementation RBSConnection

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(v6, "process", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v12, "matchesProcess:", v13);

        if ((v12 & 1) != 0)
        {

          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObjectForKey:", v5);
LABEL_11:

}

void __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_handleProcessStateChange:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_handleProcessStateChange:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)async_observedProcessStatesDidChange:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  NSMutableDictionary *stateByIdentity;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  dispatch_qos_class_t v34;
  void *v35;
  os_unfair_lock_t lock;
  void (**v37)(_QWORD);
  RBSConnection *v38;
  uint64_t v39;
  id obj;
  _QWORD v41[4];
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  int v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const __CFString *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = (void (**)(_QWORD))a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_processMonitors, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    v38 = self;
    v39 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        rbs_monitor_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "process");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rbs_pid");
          objc_msgSend(v11, "process");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromRBSTaskState(objc_msgSend(v11, "taskState"));
          v17 = v8;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "endowmentNamespaces");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
          *(_DWORD *)buf = 67109890;
          v21 = CFSTR("-NotVisible");
          if (v20)
            v21 = CFSTR("-Visible");
          v54 = v14;
          v55 = 2114;
          v56 = v16;
          v57 = 2114;
          v58 = v18;
          v59 = 2114;
          v60 = v21;
          _os_log_impl(&dword_190CD6000, v12, OS_LOG_TYPE_DEFAULT, "Received state update for %d (%{public}@, %{public}@%{public}@", buf, 0x26u);

          v8 = v17;
          self = v38;
          v9 = v39;
        }

        objc_msgSend(v11, "process");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          -[RBSConnection async_observedProcessStatesDidChange:completion:].cold.1();
        v24 = objc_msgSend(v11, "isEmptyState");
        stateByIdentity = self->_stateByIdentity;
        if (v24)
          -[NSMutableDictionary removeObjectForKey:](stateByIdentity, "removeObjectForKey:", v23);
        else
          -[NSMutableDictionary setObject:forKey:](stateByIdentity, "setObject:forKey:", v11, v23);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v26 = v35;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    v30 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v32, "calloutQueue");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "serviceClass");
        v41[0] = v30;
        v41[1] = 3221225472;
        v41[2] = __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke;
        v41[3] = &unk_1E2D17468;
        v42 = obj;
        v43 = v32;
        RBSDispatchAsyncWithQoS(v33, v34, v41);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v28);
  }

  v37[2](v37);
}

uint64_t __32__RBSConnection__handleMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send");
}

- (void)unsubscribeProcessStateMonitor:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_processMonitors, "containsObject:", v6))
    -[NSHashTable removeObject:](self->_processMonitors, "removeObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  rbs_monitor_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_190CD6000, v8, OS_LOG_TYPE_DEFAULT, "unsubscribing configuration of monitor %{public}@", buf, 0xCu);
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_async_unsubscribeFromProcessStateChangesWithIdentifier_, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBSConnection _connection]((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "sendToConnection:error:", v11, 0);

}

void __32__RBSConnection__handleMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  NSObject *v6;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    rbs_connection_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_didChangeInheritances:completion:", v5, *(_QWORD *)(a1 + 48));
  }

}

void __37__RBSConnection__lock_setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  v4 = MEMORY[0x194019424]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    v5 = (id)MEMORY[0x1E0C81258];
    rbs_connection_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v3 == v5)
    {
      if (v7)
        __37__RBSConnection__lock_setConnection___block_invoke_cold_1();

      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_208);
      xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)(v8 + 8) = 0;

      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 16);
      *(_QWORD *)(v10 + 16) = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      -[RBSConnection _handshake](*(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v7)
        __37__RBSConnection__lock_setConnection___block_invoke_cold_2();

      -[RBSConnection _disconnect](*(_QWORD *)(a1 + 32));
    }
  }
  else if (v4 == MEMORY[0x1E0C812F8])
  {
    -[RBSConnection _handleMessage:](*(_QWORD *)(a1 + 32), v3);
  }

}

- (void)_handleMessage:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD *v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  const char *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  const char *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  _QWORD *v42;
  const char *v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  _QWORD *v47;
  const char *v48;
  _QWORD v49[5];
  _QWORD activity_block[4];
  id v51;
  uint64_t v52;
  id v53;
  _QWORD *v54;
  const char *v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  _BYTE v60[24];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    +[RBSXPCMessage messageForXPCMessage:](RBSXPCMessage, "messageForXPCMessage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "method");
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {
      rbs_connection_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RBSConnection _handleMessage:].cold.4();
    }
    else
    {
      v8 = (const char *)v5;
      v9 = objc_opt_respondsToSelector();
      if ((v9 & 1) != 0)
      {
        rbs_message_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[RBSConnection _handleMessage:].cold.2(a1, v8, v10);

        objc_msgSend(v4, "reply");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x1E0C809B0];
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __32__RBSConnection__handleMessage___block_invoke;
        v58[3] = &unk_1E2D17490;
        v7 = v11;
        v59 = v7;
        v13 = (void *)MEMORY[0x194018FEC](v58);
        v56[0] = 0;
        v56[1] = v56;
        v56[2] = 0x3032000000;
        v56[3] = __Block_byref_object_copy__1;
        v56[4] = __Block_byref_object_dispose__1;
        v57 = 0;
        if (v8 == sel_async_didChangeInheritances_completion_)
        {
          activity_block[0] = v12;
          activity_block[1] = 3221225472;
          activity_block[2] = __32__RBSConnection__handleMessage___block_invoke_2;
          activity_block[3] = &unk_1E2D17668;
          v54 = v56;
          v51 = v4;
          v52 = a1;
          v53 = v13;
          v55 = v8;
          _os_activity_initiate(&dword_190CD6000, "didChangeInheritances", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

        }
        else if (v8 == sel_async_willExpireAssertionsSoon)
        {
          v49[0] = v12;
          v49[1] = 3221225472;
          v49[2] = __32__RBSConnection__handleMessage___block_invoke_185;
          v49[3] = &unk_1E2D17490;
          v49[4] = a1;
          _os_activity_initiate(&dword_190CD6000, "willExpireAssertionsSoon", OS_ACTIVITY_FLAG_DEFAULT, v49);
        }
        else if (v8 == sel_async_assertionWillInvalidate_)
        {
          v44[0] = v12;
          v44[1] = 3221225472;
          v44[2] = __32__RBSConnection__handleMessage___block_invoke_2_188;
          v44[3] = &unk_1E2D17690;
          v45 = v4;
          v46 = a1;
          v47 = v56;
          v48 = v8;
          _os_activity_initiate(&dword_190CD6000, "assertionWillInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v44);

        }
        else if (v8 == sel_async_assertionsDidInvalidate_withError_)
        {
          v39[0] = v12;
          v39[1] = 3221225472;
          v39[2] = __32__RBSConnection__handleMessage___block_invoke_191;
          v39[3] = &unk_1E2D17690;
          v40 = v4;
          v41 = a1;
          v42 = v56;
          v43 = v8;
          _os_activity_initiate(&dword_190CD6000, "assertionsDidInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v39);

        }
        else if (v8 == sel_async_observedProcessStatesDidChange_completion_)
        {
          v33[0] = v12;
          v33[1] = 3221225472;
          v33[2] = __32__RBSConnection__handleMessage___block_invoke_194;
          v33[3] = &unk_1E2D17668;
          v37 = v56;
          v34 = v4;
          v35 = a1;
          v36 = v13;
          v38 = v8;
          _os_activity_initiate(&dword_190CD6000, "observedProcessStatesDidChange", OS_ACTIVITY_FLAG_DEFAULT, v33);

        }
        else if (v8 == sel_async_observedProcessExitEvents_completion_)
        {
          v27[0] = v12;
          v27[1] = 3221225472;
          v27[2] = __32__RBSConnection__handleMessage___block_invoke_197;
          v27[3] = &unk_1E2D17668;
          v31 = v56;
          v28 = v4;
          v29 = a1;
          v30 = v13;
          v32 = v8;
          _os_activity_initiate(&dword_190CD6000, "observedProcessExitEvents", OS_ACTIVITY_FLAG_DEFAULT, v27);

        }
        else if (v8 == sel_async_observedPreventLaunchPredicatesUpdate_completion_)
        {
          v21[0] = v12;
          v21[1] = 3221225472;
          v21[2] = __32__RBSConnection__handleMessage___block_invoke_201;
          v21[3] = &unk_1E2D17668;
          v25 = v56;
          v22 = v4;
          v23 = a1;
          v24 = v13;
          v26 = v8;
          _os_activity_initiate(&dword_190CD6000, "observedPreventLaunchPredicatesUpdate", OS_ACTIVITY_FLAG_DEFAULT, v21);

        }
        else if (v8 == sel_async_processDidExit_withContext_)
        {
          v16[0] = v12;
          v16[1] = 3221225472;
          v16[2] = __32__RBSConnection__handleMessage___block_invoke_204;
          v16[3] = &unk_1E2D17690;
          v17 = v4;
          v18 = a1;
          v19 = v56;
          v20 = v8;
          _os_activity_initiate(&dword_190CD6000, "processDidExit", OS_ACTIVITY_FLAG_DEFAULT, v16);

        }
        else
        {
          rbs_connection_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBSConnection _handleMessage:].cold.1(v15, (uint64_t)v60, v14);
          }

        }
        _Block_object_dispose(v56, 8);

      }
      else
      {
        rbs_connection_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[RBSConnection _handleMessage:].cold.3(v8, v7);
      }
    }

  }
}

- (id)identity
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[RBSConnection handle](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)invalidateAssertion:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[RBSConnection invalidateAssertionWithIdentifier:error:](self, "invalidateAssertionWithIdentifier:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (void)async_didChangeInheritances:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_unfair_lock_s *p_lock;
  NSMutableSet *inheritances;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  RBSConnectionServiceDelegate *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  rbs_connection_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[RBSConnection async_didChangeInheritances:completion:].cold.1();

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  inheritances = self->_inheritances;
  objc_msgSend(v6, "gainedInheritances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](inheritances, "unionSet:", v11);

  v12 = self->_inheritances;
  objc_msgSend(v6, "lostInheritances");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](v12, "minusSet:", v13);

  v14 = self->_serviceDelegate;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "gainedInheritances");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(v6, "gainedInheritances");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnectionServiceDelegate didReceiveInheritances:](v14, "didReceiveInheritances:", v17);

  }
  objc_msgSend(v6, "lostInheritances");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    objc_msgSend(v6, "lostInheritances");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnectionServiceDelegate didLoseInheritances:](v14, "didLoseInheritances:", v20);

  }
  v7[2](v7);

}

- (id)infoPlistResultForInstance:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  SEL *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v18;

  v8 = a3;
  v9 = a4;
  if (infoPlistResultForInstance_forKeys_error__permanentError)
  {
    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)infoPlistResultForInstance_forKeys_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_infoPlistResultForInstance_forKeys_error_, v8, v9, 0);
    v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v18 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    objc_msgSend(v14, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v10 = 0;
    }
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      if (objc_msgSend(v15, "rbs_isPermanentFailure"))
        v16 = v15;
      else
        v16 = (void *)infoPlistResultForInstance_forKeys_error__permanentError;
      objc_storeStrong((id *)&infoPlistResultForInstance_forKeys_error__permanentError, v16);
    }

  }
  return v10;
}

- (BOOL)subscribeProcessStateMonitor:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  dispatch_qos_class_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSSet *preventLaunchPredicates;
  void *v18;
  void *v19;
  dispatch_qos_class_t v20;
  uint64_t v21;
  dispatch_qos_class_t v22;
  id v23;
  int has_internal_content;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (subscribeProcessStateMonitor_configuration_error__permanentError)
  {
    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)subscribeProcessStateMonitor_configuration_error__permanentError);
    goto LABEL_20;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_processMonitors, "containsObject:", v8))
    -[NSHashTable addObject:](self->_processMonitors, "addObject:", v8);
  v11 = (void *)-[NSMutableDictionary copy](self->_stateByIdentity, "copy");
  objc_msgSend(v8, "calloutQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "serviceClass");
  v14 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke;
  v38[3] = &unk_1E2D17468;
  v15 = v11;
  v39 = v15;
  v16 = v8;
  v40 = v16;
  RBSDispatchAsyncWithQoS(v12, v13, v38);

  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    v18 = (void *)-[NSSet copy](preventLaunchPredicates, "copy");
    objc_msgSend(v16, "calloutQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "serviceClass");
    v21 = v14;
    v22 = v20;
    v35[0] = v21;
    v35[1] = 3221225472;
    v35[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2;
    v35[3] = &unk_1E2D17468;
    v36 = v16;
    v37 = v18;
    v23 = v18;
    RBSDispatchAsyncWithQoS(v19, v22, v35);

  }
  os_unfair_lock_unlock(&self->_lock);
  has_internal_content = os_variant_has_internal_content();
  rbs_monitor_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v26)
    {
      objc_msgSend(v9, "debugDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
LABEL_14:
      _os_log_impl(&dword_190CD6000, v25, OS_LOG_TYPE_DEFAULT, "Updating configuration of monitor %{public}@", buf, 0xCu);

    }
  }
  else if (v26)
  {
    objc_msgSend(v9, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v27;
    goto LABEL_14;
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_void_subscribeToProcessStateChangesWithConfiguration_error_, v9, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v30 = (id)objc_msgSend(v28, "sendToConnection:error:", v29, &v34);
  v31 = v34;
  v32 = v34;

  if (objc_msgSend(v32, "rbs_isPermanentFailure"))
    objc_storeStrong((id *)&subscribeProcessStateMonitor_configuration_error__permanentError, v31);
  if (a5)
    *a5 = objc_retainAutorelease(v32);
  v10 = v32 == 0;

LABEL_20:
  return v10;
}

- (id)handle
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__RBSConnection_handle__block_invoke;
  v4[3] = &unk_1E2D17518;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_async_and_wait(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_assertionLock;
  id v7;
  char **v8;
  SEL *v9;
  void *v10;
  id v11;
  id v12;
  id v14;

  p_assertionLock = &self->_assertionLock;
  v7 = a3;
  os_unfair_lock_lock(p_assertionLock);
  -[NSMapTable removeObjectForKey:](self->_acquiredAssertionsByIdentifier, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_assertionLock);
  v8 = &selRef_async_invalidateAssertionWithIdentifier_;
  if (a4)
    v8 = &selRef_void_invalidateAssertionWithIdentifier_error_;
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", *v8, v7, 0);
  v9 = (SEL *)objc_claimAutoreleasedReturnValue();

  -[RBSConnection _connection]((uint64_t)self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v10, 0, &v14);
  v12 = v14;

  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (id)acquireAssertion:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  SEL *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(v19, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_assertion_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v5;
    _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_INFO, "Acquiring assertion: %{public}@", buf, 0xCu);
  }

  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_acquireAssertionWithDescriptor_error_, v5, 0);
  v7 = (SEL *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB28A8];
  while (1)
  {
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v20 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v9, v10, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    if (v11)
      break;
    if (objc_msgSend(v12, "code") != 4101)
      goto LABEL_13;
    objc_msgSend(v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v8);

    if (!v14)
      goto LABEL_13;
    rbs_assertion_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RBSConnection acquireAssertion:error:].cold.1(buf, &buf[1], v15);

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.1);
  }
  rbs_assertion_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[RBSConnection acquireAssertion:error:].cold.2();

  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v19, v11);
  os_unfair_lock_unlock(&self->_assertionLock);
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (id)handleForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;
  OS_xpc_object *v7;
  NSObject *v8;
  OS_xpc_object *mach_service;
  OS_xpc_object *handleConnection;
  OS_xpc_object *v11;
  SEL *v12;
  uint64_t v13;
  void *v14;
  _QWORD handler[4];
  OS_xpc_object *v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = -[RBSConnection _lock_connect]((os_unfair_lock *)self);
  v7 = self->_handleConnection;
  if (!v7)
  {
    rbs_connection_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = CFSTR("com.apple.runningboard");
      _os_log_impl(&dword_190CD6000, v8, OS_LOG_TYPE_DEFAULT, "Creating side-channel connection to %{public}@", buf, 0xCu);
    }

    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(CFSTR("com.apple.runningboard"), "UTF8String"), 0, 2uLL);
    handleConnection = self->_handleConnection;
    self->_handleConnection = mach_service;

    v11 = mach_service;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__RBSConnection_handleForKey___block_invoke;
    handler[3] = &unk_1E2D175D0;
    v7 = v11;
    v17 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_activate(v7);

  }
  os_unfair_lock_unlock(p_lock);
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupHandleForKey_error_, v5, 0);
  v12 = (SEL *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v12, v7, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  SEL *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v18;

  v8 = a3;
  v9 = a4;
  if (statesForPredicate_withDescriptor_error__permanentError)
  {
    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)statesForPredicate_withDescriptor_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_statesForPredicate_descriptor_error_, v8, v9, 0);
    v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v18 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v11, v12, v13, v14, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      if (objc_msgSend(v15, "rbs_isPermanentFailure"))
        v16 = v15;
      else
        v16 = (void *)statesForPredicate_withDescriptor_error__permanentError;
      objc_storeStrong((id *)&statesForPredicate_withDescriptor_error__permanentError, v16);
    }

  }
  return v10;
}

- (id)_connection
{
  void *v2;

  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 56));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    -[RBSConnection _lock_connect]((os_unfair_lock *)a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    dispatch_async_and_wait(*(dispatch_queue_t *)(a1 + 64), &__block_literal_global_206);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (os_unfair_lock)_lock_connect
{
  uint64_t v1;
  void *v2;
  char CanAccessMachService;
  NSObject *v4;
  NSObject *v5;
  xpc_connection_t mach_service;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return a1;
  v1 = (uint64_t)a1;
  os_unfair_lock_assert_owner(a1 + 10);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
LABEL_9:
    a1 = v2;
    return a1;
  }
  if (*(_QWORD *)(v1 + 144) == 3)
  {
    v2 = 0;
    goto LABEL_9;
  }
  CanAccessMachService = RBSSandboxCanAccessMachService();
  rbs_connection_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((CanAccessMachService & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = CFSTR("com.apple.runningboard");
      _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Creating connection to %{public}@", (uint8_t *)&v8, 0xCu);
    }

    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(CFSTR("com.apple.runningboard"), "UTF8String"), *(dispatch_queue_t *)(v1 + 56), 2uLL);
    -[RBSConnection _lock_setConnection:](v1, mach_service);

    v2 = *(void **)(v1 + 8);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[RBSConnection _lock_connect].cold.1();

  return (os_unfair_lock *)0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance___sharedInstance_0;
}

- (uint64_t)cleanOutStateIfNeeded
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke;
    v1[3] = &unk_1E2D17490;
    v1[4] = result;
    return +[RBSWorkloop performBackgroundWorkWithServiceClass:block:](RBSWorkloop, "performBackgroundWorkWithServiceClass:block:", 9, v1);
  }
  return result;
}

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "predicates");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2;
  v14[3] = &unk_1E2D17640;
  v12 = *(_QWORD *)(a1 + 32);
  v15 = v2;
  v16 = v12;
  v13 = v2;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_lock_setConnection:(uint64_t)a1
{
  id v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  _QWORD handler[5];

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_storeStrong((id *)(a1 + 8), a2);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 8), *(dispatch_queue_t *)(a1 + 56));
    v5 = *(_xpc_connection_s **)(a1 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__RBSConnection__lock_setConnection___block_invoke;
    handler[3] = &unk_1E2D175D0;
    handler[4] = a1;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 8));
    v6 = *(_xpc_connection_s **)(a1 + 8);
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_connection_send_message(v6, v7);

  }
}

- (_QWORD)observeProcessAssertionsExpirationWarningWithBlock:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  _RBSExpirationWarningClient *v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[4];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (os_unfair_lock_s *)(a1 + 48);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = [_RBSExpirationWarningClient alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke;
  v9[3] = &unk_1E2D17568;
  v9[4] = a1;
  v6 = -[_RBSExpirationWarningClient initWithBlock:invalidationBlock:](v5, v4, v9);

  objc_msgSend(*(id *)(a1 + 112), "addObject:", v6);
  os_unfair_lock_unlock(v3);
  rbs_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_190CD6000, v7, OS_LOG_TYPE_DEFAULT, "Added observer for process assertions expiration warning: %{public}@", buf, 0xCu);
  }

  return v6;
}

- (void)subscribeToProcessDeath:(id)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  qos_class_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  qos_class_t v14;

  v6 = a4;
  v7 = subscribeToProcessDeath_handler__onceToken;
  v8 = a3;
  if (v7 != -1)
    dispatch_once(&subscribeToProcessDeath_handler__onceToken, &__block_literal_global_120);
  v9 = qos_class_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2;
  v12[3] = &unk_1E2D17618;
  v14 = v9;
  v13 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v12, "copy");
  -[RBSConnection _subscribeToProcessDeath:handler:]((uint64_t)self, v8, v11);

}

- (void)_subscribeToProcessDeath:(void *)a3 handler:
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  SEL *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (!a1)
    goto LABEL_21;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__subscribeToProcessDeath_handler_, a1, CFSTR("RBSConnection.m"), 550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v7)
      goto LABEL_4;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__subscribeToProcessDeath_handler_, a1, CFSTR("RBSConnection.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_4;
  }
  if (!v6)
    goto LABEL_23;
LABEL_4:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 120), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 120), "setObject:forKey:", v8, v5);
    rbs_process_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v5;
      _os_log_impl(&dword_190CD6000, v9, OS_LOG_TYPE_INFO, "Subscribing to death of process %{public}@", buf, 0xCu);
    }

  }
  v10 = (void *)MEMORY[0x194018FEC](v7);
  objc_msgSend(v8, "addObject:", v10);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_subscribeToProcessDeath_error_, v5, 0);
  v11 = (SEL *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection](a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v25 = 0;
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;

  if (v14
    || (objc_msgSend(v15, "domain"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("RBSRequestErrorDomain")),
        v16,
        v17))
  {
    rbs_process_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[RBSConnection _subscribeToProcessDeath:handler:].cold.1();
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v5;
      _os_log_impl(&dword_190CD6000, v19, OS_LOG_TYPE_INFO, "Process %{public}@ is already exited, no need to subscribe", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v20 = (void *)MEMORY[0x194018FEC](v7);
    v21 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v20);

    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = (void *)MEMORY[0x194018FEC](v7);
      objc_msgSend(v8, "removeObjectIdenticalTo:", v22);

      if (!objc_msgSend(v8, "count"))
        objc_msgSend(*(id *)(a1 + 120), "removeObjectForKey:", v5);
      ((void (**)(_QWORD, void *, id))v7)[2](v7, v14, v15);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }

LABEL_21:
}

- (id)handleForPredicate:(id)a3 error:(id *)a4
{
  id v6;
  SEL *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupHandleForPredicate_error_, v6, 0);
    v7 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v8, v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D68];
    v14[0] = CFSTR("No predicate specified");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RBSRequestErrorDomain"), 1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)executeLaunchRequest:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v27;
  __CFString *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = -[RBSLaunchResponse _init]([RBSLaunchResponse alloc], "_init");
  v6 = v5;
  if (executeLaunchRequest__permanentError)
  {
    objc_msgSend(v5, "setError:");
  }
  else
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v4;
      _os_log_impl(&dword_190CD6000, v7, OS_LOG_TYPE_INFO, "Sending launch request: %{public}@", buf, 0xCu);
    }

    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_executeLaunchRequest_error_, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v8, "sendToConnection:error:", v9, &v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v30;
    v12 = (__CFString *)v30;

    objc_msgSend(v6, "setError:", v12);
    if (-[__CFString rbs_isPermanentFailure](v12, "rbs_isPermanentFailure"))
      objc_storeStrong((id *)&executeLaunchRequest__permanentError, v11);
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("return-value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProcess:", v13);
    rbs_general_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("No Error");
      if (!v13)
        v15 = v12;
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_impl(&dword_190CD6000, v14, OS_LOG_TYPE_INFO, "Received launch request response: <%{public}@>", buf, 0xCu);
    }

    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assertion-identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v27 = v13;
      v28 = v12;
      v29 = v8;
      -[__CFString context](v4, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSTarget targetWithProcessIdentity:](RBSTarget, "targetWithProcessIdentity:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "explanation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:](RBSAssertionDescriptor, "descriptorWithIdentifier:target:explanation:attributes:", v16, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[RBSAssertion _initWithServerValidatedDescriptor:]([RBSAssertion alloc], "_initWithServerValidatedDescriptor:", v22);
      rbs_assertion_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[RBSConnection acquireAssertion:error:].cold.2();

      os_unfair_lock_lock(&self->_assertionLock);
      -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v23, v16);
      os_unfair_lock_unlock(&self->_assertionLock);
      objc_msgSend(v6, "setAssertion:", v23);

      v12 = v28;
      v8 = v29;
      v13 = v27;
    }
    objc_msgSend(v10, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("managed-endpoint-by-launch-identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
      objc_msgSend(v6, "setManagedEndpointByLaunchIdentifier:", v25);

  }
  return v6;
}

void __23__RBSConnection_handle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  RBSProcessHandle *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "executablePath");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    +[RBSProcessIdentity identityForExecutablePath:pid:auid:](RBSProcessIdentity, "identityForExecutablePath:pid:auid:", v7, getpid(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[RBSProcessHandle initWithIdentity:]([RBSProcessHandle alloc], "initWithIdentity:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __37__RBSConnection__initWithConnection___block_invoke(uint64_t a1)
{
  -[RBSConnection _handshake](*(_QWORD *)(a1 + 32));
}

uint64_t __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreventLaunchUpdate:", *(_QWORD *)(a1 + 40));
}

void __32__RBSConnection_connectionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.runningboardservices.connection.incoming", v2);
  v1 = (void *)connectionQueue_queue;
  connectionQueue_queue = (uint64_t)v0;

}

void __31__RBSConnection_handshakeQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.runningboardservices.connection.outgoing", v2);
  v1 = (void *)handshakeQueue_queue;
  handshakeQueue_queue = (uint64_t)v0;

}

- (void)_handshake
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_190CD6000, v0, OS_LOG_TYPE_FAULT, "Handshake called in runningboardd", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_lock_announceLostInheritances
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    v3 = *(id *)(a1 + 32);
    v2 = (void *)objc_msgSend(*(id *)(a1 + 104), "copy");
    if (objc_msgSend(v2, "count"))
      objc_msgSend(v3, "didLoseInheritances:", v2);

  }
}

void __31__RBSConnection_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RBSConnection _initWithConnection:]([RBSConnection alloc], 0);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (id)_initWithConnection:(id)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v24;
  _QWORD block[4];
  id v27;
  uint8_t buf[16];
  objc_super v29;

  v3 = a2;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)RBSConnection;
    a1 = objc_msgSendSuper2(&v29, sel_init);
    if (a1)
    {
      rbs_connection_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "Initializing connection", buf, 2u);
      }

      *((_DWORD *)a1 + 10) = 0;
      *((_DWORD *)a1 + 12) = 0;
      *((_QWORD *)a1 + 18) = 0;
      +[RBSConnection handshakeQueue](RBSConnection, "handshakeQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)*((_QWORD *)a1 + 8);
      *((_QWORD *)a1 + 8) = v5;

      +[RBSConnection connectionQueue](RBSConnection, "connectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v7;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)a1 + 9);
      *((_QWORD *)a1 + 9) = v9;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)a1 + 13);
      *((_QWORD *)a1 + 13) = v11;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)*((_QWORD *)a1 + 10);
      *((_QWORD *)a1 + 10) = v13;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)*((_QWORD *)a1 + 14);
      *((_QWORD *)a1 + 14) = v15;

      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = (void *)*((_QWORD *)a1 + 15);
      *((_QWORD *)a1 + 15) = v17;

      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = (void *)*((_QWORD *)a1 + 11);
      *((_QWORD *)a1 + 11) = v19;

      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = (void *)*((_QWORD *)a1 + 16);
      *((_QWORD *)a1 + 16) = v21;

      if (v3)
      {
        os_unfair_lock_lock((os_unfair_lock_t)a1 + 10);
        -[RBSConnection _lock_setConnection:]((uint64_t)a1, v3);
        *((_QWORD *)a1 + 18) = 2;
        os_unfair_lock_unlock((os_unfair_lock_t)a1 + 10);
      }
      else
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)__RBSDaemonDidStart, CFSTR("com.apple.runningboard.daemonstartup"), 0, CFNotificationSuspensionBehaviorCoalesce);
        v24 = *((_QWORD *)a1 + 7);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __37__RBSConnection__initWithConnection___block_invoke;
        block[3] = &unk_1E2D17490;
        a1 = a1;
        v27 = a1;
        dispatch_sync(v24, block);

      }
    }
  }

  return a1;
}

+ (id)handshakeQueue
{
  if (handshakeQueue_onceToken != -1)
    dispatch_once(&handshakeQueue_onceToken, &__block_literal_global_55);
  return (id)handshakeQueue_queue;
}

+ (id)connectionQueue
{
  if (connectionQueue_onceToken != -1)
    dispatch_once(&connectionQueue_onceToken, &__block_literal_global_57);
  return (id)connectionQueue_queue;
}

void __27__RBSConnection__handshake__block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s **v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  SEL *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_unfair_lock_s *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  CFIndex Count;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  id v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[5];
  id v85;
  id v86;
  uint8_t v87;
  _BYTE v88[7];
  id v89;
  uint8_t buf[16];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _OWORD v95[4];
  uint64_t v96;

  v1 = a1;
  v96 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(*v2 + 10);
  if (v3 != 3)
  {
    v4 = 0;
    v73 = v1;
    while (1)
    {
      rbs_connection_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v4 + 1;
        _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Sending handshake request attempt #%lu to server", buf, 0xCu);
      }

      os_unfair_lock_lock(*v2 + 10);
      -[RBSConnection _lock_connect](*v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(*v2 + 10);
      if (v7 == 3 || v6 == 0)
        break;
      +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_handshakeWithRequest_, *(_QWORD *)(v1 + 40), 0);
      v9 = (SEL *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v89 = 0;
      -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v6, v10, &v89);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v89;
      if (v11)
      {
        rbs_connection_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190CD6000, v13, OS_LOG_TYPE_DEFAULT, "Handshake succeeded", buf, 2u);
        }

        v7 = 2;
      }
      else
      {
        if (v4 >= 0x3E8)
          __27__RBSConnection__handshake__block_invoke_cold_4();
        rbs_connection_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v12;
          _os_log_error_impl(&dword_190CD6000, v14, OS_LOG_TYPE_ERROR, "Handshake failed with error: <%{public}@>", buf, 0xCu);
        }

        os_unfair_lock_lock(*v2 + 10);
        -[RBSConnection _lock_announceLostInheritances]((uint64_t)*v2);
        os_unfair_lock_unlock(*v2 + 10);
        v15 = (unsigned __int16)++v4 / 0xAu;
        if (v15 >= 0xA)
          v16 = 10;
        else
          v16 = v15;
        if ((_DWORD)v16)
        {
          rbs_connection_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl(&dword_190CD6000, v17, OS_LOG_TYPE_DEFAULT, "Sleeping for %lus before trying to reconnect", buf, 0xCu);
          }

          sleep(v16);
        }
        v1 = v73;
      }

      if (v11)
        goto LABEL_30;
    }
    rbs_connection_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __27__RBSConnection__handshake__block_invoke_cold_5(&v87, v88, v18);

    -[RBSConnection _disconnect]((uint64_t)*v2);
  }
  v11 = 0;
  v7 = 3;
LABEL_30:
  os_unfair_lock_lock(*v2 + 10);
  *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque = v7;
  v19 = *v2;
  if (*(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque != 2)
    goto LABEL_67;
  objc_msgSend(v11, "handle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 32), CFSTR("RBSConnection.m"), 1450, CFSTR("No process identity was resolved!"));

  }
  rbs_connection_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_190CD6000, v22, OS_LOG_TYPE_DEFAULT, "Identity resolved as %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)&(*v2)[6]._os_unfair_lock_opaque, "identity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (uint64_t)*v2;
  v72 = v23;
  if (!*(_QWORD *)&(*v2)[6]._os_unfair_lock_opaque)
  {
LABEL_38:
    objc_storeStrong((id *)(v24 + 24), v20);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertionIdentifiersByOldIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(*v2 + 11);
    v29 = MEMORY[0x1E0C809B0];
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __27__RBSConnection__handshake__block_invoke_220;
    v84[3] = &unk_1E2D17718;
    v84[4] = *v2;
    v70 = v26;
    v85 = v70;
    v30 = v28;
    v86 = v30;
    v71 = v27;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v84);
    objc_msgSend(v11, "assertionErrorsByOldIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v29;
    v83[1] = 3221225472;
    v83[2] = __27__RBSConnection__handshake__block_invoke_222;
    v83[3] = &unk_1E2D17740;
    v83[4] = *v2;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v83);

    v80[0] = v29;
    v80[1] = 3221225472;
    v80[2] = __27__RBSConnection__handshake__block_invoke_224;
    v80[3] = &unk_1E2D17468;
    v32 = v30;
    v33 = (uint64_t)*v2;
    v81 = v32;
    v82 = v33;
    +[RBSWorkloop performBackgroundWork:](RBSWorkloop, "performBackgroundWork:", v80);
    if (objc_msgSend(*(id *)&(*v2)[18]._os_unfair_lock_opaque, "count"))
    {
      rbs_assertion_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        __27__RBSConnection__handshake__block_invoke_cold_2((uint64_t)v2, v34, v35, v36, v37, v38, v39, v40);

    }
    objc_storeStrong((id *)&(*v2)[18], v26);
    if (objc_msgSend(*(id *)&(*v2)[18]._os_unfair_lock_opaque, "count"))
    {
      rbs_connection_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = *(_QWORD *)&(*v2)[18]._os_unfair_lock_opaque;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v42;
        _os_log_impl(&dword_190CD6000, v41, OS_LOG_TYPE_INFO, "Reacquired assertions: %{public}@", buf, 0xCu);
      }

    }
    os_unfair_lock_unlock(*v2 + 11);
    objc_msgSend(v11, "managedEndpointByLaunchIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    v46 = v45;

    v47 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    if (v47 && v47 != v46)
    {
      if (v46
        && (Count = CFDictionaryGetCount(*(CFDictionaryRef *)&(*v2)[34]._os_unfair_lock_opaque),
            Count == CFDictionaryGetCount((CFDictionaryRef)v46)))
      {
        v67 = v32;
        v68 = v20;
        v69 = v21;
        v74 = v1;
        memset(v95, 0, sizeof(v95));
        v49 = v47;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", v95, buf, 16);
        if (v50)
        {
          v51 = v50;
          v75 = **(_QWORD **)&v95[1];
          while (2)
          {
            for (i = 0; i != v51; ++i)
            {
              if (**(_QWORD **)&v95[1] != v75)
                objc_enumerationMutation(v49);
              v53 = *(_QWORD *)(*((_QWORD *)&v95[0] + 1) + 8 * i);
              objc_msgSend(v49, "objectForKey:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKey:", v53);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v54, "_isEquivalentToEndpoint:", v55);

              if (!v56)
              {

                v1 = v74;
                v20 = v68;
                v21 = v69;
                v32 = v67;
                goto LABEL_63;
              }
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", v95, buf, 16);
            if (v51)
              continue;
            break;
          }
        }

        v1 = v74;
        v20 = v68;
        v21 = v69;
        v32 = v67;
      }
      else
      {
LABEL_63:
        rbs_connection_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          __27__RBSConnection__handshake__block_invoke_cold_1((uint64_t)v2, (uint64_t)v46, v57);

      }
    }
    v58 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    *(_QWORD *)&(*v2)[34]._os_unfair_lock_opaque = v46;

    v19 = *v2;
LABEL_67:
    os_unfair_lock_unlock(v19 + 10);
    if (v7 == 2)
    {
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __27__RBSConnection__handshake__block_invoke_225;
      v76[3] = &unk_1E2D17790;
      v77 = *(id *)(v1 + 48);
      v59 = *(id *)(v1 + 56);
      v60 = *(_QWORD *)(v1 + 32);
      v78 = v59;
      v79 = v60;
      +[RBSWorkloop performBackgroundWorkWithServiceClass:block:](RBSWorkloop, "performBackgroundWorkWithServiceClass:block:", 33, v76);

    }
    return;
  }
  v25 = v23;
  if (objc_msgSend(v23, "isEqual:", v21))
  {
    v24 = (uint64_t)*v2;
    goto LABEL_38;
  }
  v62 = v25;
  objc_msgSend(v25, "hostIdentity");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    objc_msgSend(v21, "hostIdentity");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      rbs_connection_log();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        __27__RBSConnection__handshake__block_invoke_cold_3();

      abort_with_reason();
    }
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  *(_OWORD *)buf = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  LODWORD(v95[0]) = 138412546;
  *(_QWORD *)((char *)v95 + 4) = v21;
  WORD6(v95[0]) = 2112;
  *(_QWORD *)((char *)v95 + 14) = v62;
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (id)limitationsForInstance:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v6 = a3;
  if (limitationsForInstance_error__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)limitationsForInstance_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_limitationsForInstance_error_, v6, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v14 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)limitationsForInstance_error__permanentError;
      objc_storeStrong((id *)&limitationsForInstance_error__permanentError, v12);
    }

  }
  return v7;
}

void __41__RBSConnection_registerServiceDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 32), *(id *)(a1 + 40));
  v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 40), "didReceiveInheritances:", v4);

}

- (void)registerServiceDelegate:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  char *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__RBSConnection_registerServiceDelegate___block_invoke;
    block[3] = &unk_1E2D17540;
    block[4] = a1;
    v8 = sel_registerServiceDelegate_;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

- (void)acquireAssertion:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, v0, v1, "Adding assertion %{public}@ to dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (id)processName:(id)a3
{
  SEL *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupProcessName_error_, a3, 0);
  v4 = (SEL *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v11 = 0;
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v4, v5, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v8)
  {
    rbs_process_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSConnection processName:].cold.1();

  }
  return v7;
}

- (id)hostProcessForInstance:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v6 = a3;
  if (hostProcessForInstance_error__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)hostProcessForInstance_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_hostProcessForInstance_error_, v6, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v14 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)hostProcessForInstance_error__permanentError;
      objc_storeStrong((id *)&hostProcessForInstance_error__permanentError, v12);
    }

  }
  return v7;
}

+ (id)testConnectionWithConnection:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBSConnection _initWithConnection:]([RBSConnection alloc], v3);

  return v4;
}

+ (void)setInDaemon
{
  inRunningBoardDaemon = 1;
}

- (RBSConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSConnection.m"), 197, CFSTR("cannot call -init on RBSConnection"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  xpc_connection_cancel(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)RBSConnection;
  -[RBSConnection dealloc](&v3, sel_dealloc);
}

- (id)managedEndpointByLaunchIdentifier
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke;
  v4[3] = &unk_1E2D17518;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_async_and_wait(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

void __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  rbs_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "Removed observer for process assertions expiration warning: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));

}

- (id)assertionDescriptorsByPidWithFlattenedAttributes:(BOOL)a3 error:(id *)a4
{
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SEL *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError);
      return 0;
    }
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_assertionDescriptorsWithFlattenedAttributes_error_, v7, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();

    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v31 = 0;
    v26 = v8;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31;

    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      if (objc_msgSend(v13, "rbs_isPermanentFailure"))
        v14 = v13;
      else
        v14 = (void *)assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError;
      objc_storeStrong((id *)&assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError, v14);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v21, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "clientPid"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v25, v24);
          }
          objc_msgSend(v25, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

  }
  return v15;
}

- (BOOL)executeTerminateRequest:(id)a3 assertion:(id *)a4 error:(id *)a5
{
  __CFString *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  __CFString *v29;
  void *v30;
  void *v31;
  id obj;
  id *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  if (executeTerminateRequest_assertion_error__permanentError)
  {
    LOBYTE(v10) = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)executeTerminateRequest_assertion_error__permanentError);
  }
  else
  {
    rbs_general_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v9;
      _os_log_impl(&dword_190CD6000, v11, OS_LOG_TYPE_INFO, "Sending terminate request: %{public}@", buf, 0xCu);
    }

    -[__CFString context](v9, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v33 = a4;
    if (!a4 && v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSConnection.m"), 414, CFSTR("Cannot attempt to create a prevent launch assertion if the client will not retain the assertion"));

    }
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_executeTerminateRequest_identifier_error_, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v15, "sendToConnection:error:", v16, &v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v35;
    v18 = (__CFString *)v35;

    v10 = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("return-value"));
    rbs_general_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("Success");
      if (!v10)
        v20 = v18;
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      _os_log_impl(&dword_190CD6000, v19, OS_LOG_TYPE_INFO, "Received terminate request response: <%{public}@>", buf, 0xCu);
    }

    objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assertion-identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v29 = v18;
      v30 = v17;
      v31 = v15;
      +[RBSTarget systemTarget](RBSTarget, "systemTarget");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "explanation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:](RBSAssertionDescriptor, "descriptorWithIdentifier:target:explanation:attributes:", v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = -[RBSAssertion _initWithServerValidatedDescriptor:]([RBSAssertion alloc], "_initWithServerValidatedDescriptor:", v25);
      rbs_assertion_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[RBSConnection acquireAssertion:error:].cold.2();

      os_unfair_lock_lock(&self->_assertionLock);
      -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v26, v21);
      os_unfair_lock_unlock(&self->_assertionLock);
      if (v33)
        *v33 = objc_retainAutorelease(v26);

      v17 = v30;
      v15 = v31;
      v18 = v29;
    }
    if (-[__CFString rbs_isPermanentFailure](v18, "rbs_isPermanentFailure"))
      objc_storeStrong((id *)&executeTerminateRequest_assertion_error__permanentError, obj);
    if (a5)
      *a5 = objc_retainAutorelease(v18);

  }
  return v10;
}

void __30__RBSConnection_handleForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;

  v3 = a2;
  if (MEMORY[0x194019424]() == MEMORY[0x1E0C81310])
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
  else
  {
    v4 = MEMORY[0x194019424](v3);
    if (v4 == MEMORY[0x1E0C812F8])
    {
      rbs_connection_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __30__RBSConnection_handleForKey___block_invoke_cold_1();

      xpc_dictionary_apply(v3, &__block_literal_global_104);
    }
    else
    {
      v5 = v4;
      v6 = MEMORY[0x1E0C812E0];
      rbs_connection_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
      if (v5 == v6)
      {
        if (v8)
          __30__RBSConnection_handleForKey___block_invoke_cold_2();
      }
      else if (v8)
      {
        __30__RBSConnection_handleForKey___block_invoke_cold_3();
      }

    }
  }

}

uint64_t __30__RBSConnection_handleForKey___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  rbs_connection_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = a2;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "errant message dictionary key:'%s' value:%@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

- (id)portForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  rbs_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_INFO, "Fetching port for identifier: %{public}@", buf, 0xCu);
  }

  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lookupPortForIdentifier_error_, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "sendToConnection:error:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("return-value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_general_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[RBSConnection portForIdentifier:].cold.1();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_190CD6000, v12, OS_LOG_TYPE_INFO, "Received port for identifier response: <%{public}@>", buf, 0xCu);
  }

  return v10;
}

void __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = +[RBSWorkloop createCalloutQueue:]((uint64_t)RBSWorkloop, CFSTR("RBSProcessDeathQueue"));
  v1 = (void *)subscribeToProcessDeath_handler__processDeathQueue;
  subscribeToProcessDeath_handler__processDeathQueue = (uint64_t)v0;

}

void __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  dispatch_qos_class_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)subscribeToProcessDeath_handler__processDeathQueue;
  v8 = *(_DWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3;
  v12[3] = &unk_1E2D17418;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  RBSDispatchAsyncWithQoS(v7, v8, v12);

}

uint64_t __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)intendToExit:(id)a3 withStatus:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;

  v6 = a3;
  +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_void_intendToExit_withStatus_, v6, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = (id)objc_msgSend(v7, "sendToConnection:error:", v8, &v12);
  v10 = v12;

  if (v10)
  {
    rbs_process_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RBSConnection intendToExit:withStatus:].cold.1();

  }
}

- (id)lastExitContextForInstance:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v6 = a3;
  if (lastExitContextForInstance_error__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)lastExitContextForInstance_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_lastExitContextForInstance_error_, v6, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v14 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)lastExitContextForInstance_error__permanentError;
      objc_storeStrong((id *)&lastExitContextForInstance_error__permanentError, v12);
    }

  }
  return v7;
}

- (id)captureStateForSubsystem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v6 = a3;
  if (captureStateForSubsystem_error__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)captureStateForSubsystem_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_captureStateForSubsystem_error_, v6, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v14 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)captureStateForSubsystem_error__permanentError;
      objc_storeStrong((id *)&captureStateForSubsystem_error__permanentError, v12);
    }

  }
  return v7;
}

- (id)identifiersForStateCaptureSubsystems:(id *)a3
{
  SEL *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (identifiersForStateCaptureSubsystems__permanentError)
  {
    if (a3)
    {
      *a3 = objc_retainAutorelease((id)identifiersForStateCaptureSubsystems__permanentError);
      return 0;
    }
    v10 = 0;
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_identifiersForStateCaptureSubsystemsWithError_, 0);
    v6 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v13 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)identifiersForStateCaptureSubsystems__permanentError;
      objc_storeStrong((id *)&identifiersForStateCaptureSubsystems__permanentError, v12);
    }

  }
  return v10;
}

- (id)busyExtensionInstancesFromSet:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SEL *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  if (busyExtensionInstancesFromSet_error__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)busyExtensionInstancesFromSet_error__permanentError);
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_busyExtensionInstancesFromSet_error_, v6, 0);
    v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v15 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      if (objc_msgSend(v12, "rbs_isPermanentFailure"))
        v13 = v12;
      else
        v13 = (void *)busyExtensionInstancesFromSet_error__permanentError;
      objc_storeStrong((id *)&busyExtensionInstancesFromSet_error__permanentError, v13);
    }

  }
  return v7;
}

- (id)preventLaunchPredicatesWithError:(id *)a3
{
  SEL *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (preventLaunchPredicatesWithError__permanentError)
  {
    if (a3)
    {
      *a3 = objc_retainAutorelease((id)preventLaunchPredicatesWithError__permanentError);
      return 0;
    }
    v10 = 0;
  }
  else
  {
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_preventLaunchPredicatesWithError_, 0);
    v6 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v13 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      if (objc_msgSend(v11, "rbs_isPermanentFailure"))
        v12 = v11;
      else
        v12 = (void *)preventLaunchPredicatesWithError__permanentError;
      objc_storeStrong((id *)&preventLaunchPredicatesWithError__permanentError, v12);
    }

  }
  return v10;
}

- (void)reset
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[RBSConnection reset]";
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a1, a3, "%s no longer does anything", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (BOOL)saveEndowment:(id)a3 withError:(id *)a4
{
  id v7;
  int v8;
  void *v9;
  SEL *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSConnection.m"), 901, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("savedEndowment"));

  }
  if (saveEndowment_withError__permanentError)
  {
    LOBYTE(v8) = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)saveEndowment_withError__permanentError);
  }
  else
  {
    -[RBSConnection _connection]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_savedEndowmentLock);
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_saveEndowment_withError_, v7, 0);
    v10 = (SEL *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v17 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v10, v9, v11, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    v14 = v17;

    if (objc_msgSend(v14, "rbs_isPermanentFailure"))
      objc_storeStrong((id *)&saveEndowment_withError__permanentError, v13);
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    v8 = objc_msgSend(v12, "BOOLValue");
    if (v8)
      -[NSMutableArray addObject:](self->_savedEndowments, "addObject:", v7);
    os_unfair_lock_unlock(&self->_savedEndowmentLock);

  }
  return v8;
}

- (void)async_willExpireAssertionsSoon
{
  NSObject *v3;
  os_unfair_lock_s *p_processExpirationLock;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  rbs_general_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190CD6000, v3, OS_LOG_TYPE_DEFAULT, "Received process assertions expiration warning!", buf, 2u);
  }

  p_processExpirationLock = &self->_processExpirationLock;
  os_unfair_lock_lock(&self->_processExpirationLock);
  v5 = (void *)-[NSHashTable copy](self->_expirationWarningClients, "copy");
  os_unfair_lock_unlock(p_processExpirationLock);
  rbs_general_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of imminent expiration of assertion", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke;
  v8[3] = &unk_1E2D17490;
  v9 = v5;
  v7 = v5;
  +[RBSWorkloop performCalloutWithServiceClass:block:]((uint64_t)RBSWorkloop, QOS_CLASS_USER_INITIATED, v8);

}

void __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5++) + 8) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  rbs_general_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "Expiration notification complete", v7, 2u);
  }

}

- (void)async_assertionsDidInvalidate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_assertionLock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
        rbs_assertion_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v14;
          _os_log_debug_impl(&dword_190CD6000, v15, OS_LOG_TYPE_DEBUG, "Assertion %{public}@ did invalidate", buf, 0xCu);
        }

        -[NSMapTable objectForKey:](self->_acquiredAssertionsByIdentifier, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        rbs_assertion_log();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v14;
            _os_log_debug_impl(&dword_190CD6000, v18, OS_LOG_TYPE_DEBUG, "Removing assertion %{public}@ from dictionary", buf, 0xCu);
          }

          -[NSMapTable removeObjectForKey:](self->_acquiredAssertionsByIdentifier, "removeObjectForKey:", v14);
          objc_msgSend(v8, "addObject:", v16);
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v14;
            _os_log_impl(&dword_190CD6000, v18, OS_LOG_TYPE_INFO, "Client is not tracking assertion %{public}@", buf, 0xCu);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_assertionLock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "_serverInvalidateWithError:", v7);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (void)async_assertionWillInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_assertionLock;
  void *v7;

  v4 = a3;
  rbs_assertion_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RBSConnection async_assertionWillInvalidate:].cold.1();

  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMapTable objectForKey:](self->_acquiredAssertionsByIdentifier, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_assertionLock);
  -[RBSAssertion _serverWillInvalidate]((uint64_t)v7);

}

- (void)async_observedProcessExitEvents:(id)a3 completion:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  dispatch_qos_class_t v16;
  void (**v17)(_QWORD);
  id obj;
  _QWORD v19[4];
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_processMonitors, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "calloutQueue", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "serviceClass");
        v19[0] = v12;
        v19[1] = 3221225472;
        v19[2] = __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke;
        v19[3] = &unk_1E2D17468;
        v20 = v6;
        v21 = v14;
        RBSDispatchAsyncWithQoS(v15, v16, v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v17[2](v17);
}

void __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_handleExitEvent:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)async_observedPreventLaunchPredicatesUpdate:(id)a3 completion:(id)a4
{
  NSSet *v6;
  void (**v7)(_QWORD);
  os_unfair_lock_s *p_lock;
  NSSet *preventLaunchPredicates;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  dispatch_qos_class_t v18;
  void (**v19)(_QWORD);
  id obj;
  _QWORD v21[5];
  NSSet *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (NSSet *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (v6 == preventLaunchPredicates || v6 && preventLaunchPredicates && -[NSSet isEqual:](v6, "isEqual:"))
  {
    os_unfair_lock_unlock(&self->_lock);
    v7[2](v7);
  }
  else
  {
    v19 = v7;
    objc_storeStrong((id *)&self->_preventLaunchPredicates, v6);
    -[NSHashTable allObjects](self->_processMonitors, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      v14 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "calloutQueue", v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "serviceClass");
          v21[0] = v14;
          v21[1] = 3221225472;
          v21[2] = __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke;
          v21[3] = &unk_1E2D17468;
          v21[4] = v16;
          v22 = v6;
          RBSDispatchAsyncWithQoS(v17, v18, v21);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    v7 = v19;
    v19[2](v19);

  }
}

uint64_t __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreventLaunchUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)async_processDidExit:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  rbs_process_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_190CD6000, v8, OS_LOG_TYPE_DEFAULT, "Firing exit handlers for %{public}@ with context %{public}@", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_deathHandlers, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSMutableDictionary removeObjectForKey:](self->_deathHandlers, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

uint64_t __32__RBSConnection__handleMessage___block_invoke_185(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "async_willExpireAssertionsSoon");
}

void __32__RBSConnection__handleMessage___block_invoke_2_188(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  NSObject *v6;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    rbs_connection_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionWillInvalidate:", v5);
  }

}

void __32__RBSConnection__handleMessage___block_invoke_191(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v3, v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  v7 = *(void **)(a1 + 32);
  v8 = objc_opt_class();
  v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v12 = 0;
  objc_msgSend(v7, "decodeArgumentWithClass:atIndex:allowNil:error:", v8, 1, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    rbs_connection_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionsDidInvalidate:withError:", v6, v10);
  }

}

void __32__RBSConnection__handleMessage___block_invoke_194(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  NSObject *v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v3, v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    rbs_connection_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessStatesDidChange:completion:", v6, *(_QWORD *)(a1 + 48));
  }

}

void __32__RBSConnection__handleMessage___block_invoke_197(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  NSObject *v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v3, v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    rbs_connection_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessExitEvents:completion:", v6, *(_QWORD *)(a1 + 48));
  }

}

void __32__RBSConnection__handleMessage___block_invoke_201(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  NSObject *v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", v3, v4, 0, 1, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    rbs_connection_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedPreventLaunchPredicatesUpdate:completion:", v6, *(_QWORD *)(a1 + 48));
  }

}

void __32__RBSConnection__handleMessage___block_invoke_204(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "decodeArgumentWithClass:atIndex:allowNil:error:", v3, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(void **)(a1 + 32);
  v7 = objc_opt_class();
  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v11 = 0;
  objc_msgSend(v6, "decodeArgumentWithClass:atIndex:allowNil:error:", v7, 1, 0, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, v11);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    rbs_connection_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_processDidExit:withContext:", v5, v9);
  }

}

- (void)_disconnect
{
  os_unfair_lock_s *v2;
  _xpc_connection_s *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v3 = *(_xpc_connection_s **)(a1 + 8);
    if (v3)
    {
      xpc_connection_set_event_handler(v3, &__block_literal_global_234);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 8));
      v4 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
    *(_QWORD *)(a1 + 144) = 3;
    os_unfair_lock_unlock(v2);
  }
}

void __27__RBSConnection__handshake__block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSObject *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __27__RBSConnection__handshake__block_invoke_2;
    v15 = &unk_1E2D17468;
    v9 = v7;
    v16 = v9;
    v10 = v6;
    v17 = v10;
    +[RBSWorkloop performBackgroundWork:](RBSWorkloop, "performBackgroundWork:", &v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v10, v12, v13, v14, v15);

    v11 = v16;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    rbs_connection_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __27__RBSConnection__handshake__block_invoke_220_cold_1();
  }

}

void __27__RBSConnection__handshake__block_invoke_2(uint64_t a1)
{
  -[RBSAssertion _serverDidChangeIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __27__RBSConnection__handshake__block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  rbs_connection_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_190CD6000, v7, OS_LOG_TYPE_DEFAULT, "Failed to reconnect assertion %{public}@ with error <%{public}@>", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_serverInvalidateWithError:", v6);

}

void __27__RBSConnection__handshake__block_invoke_224(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "invalidateAssertionWithIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __27__RBSConnection__handshake__block_invoke_225(uint64_t a1)
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        -[RBSProcessMonitor _reconnect](*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7++), v4);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__RBSConnection__handshake__block_invoke_2_226;
  v10[3] = &unk_1E2D17768;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
}

void __27__RBSConnection__handshake__block_invoke_2_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[RBSConnection _subscribeToProcessDeath:handler:](*(_QWORD *)(a1 + 32), v5, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isIdentityAnAngel:(id)a3 withError:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  SEL *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v15;

  v6 = a3;
  if (isIdentityAnAngel_withError__permanentError)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)isIdentityAnAngel_withError__permanentError);
  }
  else
  {
    -[RBSConnection _connection]((uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSXPCMessage messageForMethod:varguments:](RBSXPCMessage, "messageForMethod:varguments:", sel_isIdentityAnAngel_withError_, v6, 0);
    v9 = (SEL *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v15 = 0;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v8, v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = v15;

    if (objc_msgSend(v13, "rbs_isPermanentFailure"))
      objc_storeStrong((id *)&isIdentityAnAngel_withError__permanentError, v12);
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    v7 = objc_msgSend(v11, "BOOLValue");

  }
  return v7;
}

- (void)_handleDaemonDidStart
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(_QWORD *)(a1 + 144) == 3)
    {
      rbs_connection_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_190CD6000, v3, OS_LOG_TYPE_DEFAULT, "runningboardd is back; connection can be restored",
          v4,
          2u);
      }

      *(_QWORD *)(a1 + 144) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_deathHandlers, 0);
  objc_storeStrong((id *)&self->_expirationWarningClients, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_stateByIdentity, 0);
  objc_storeStrong((id *)&self->_processMonitors, 0);
  objc_storeStrong((id *)&self->_acquiredAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_handshakeQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handleConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)acquireAssertion:(NSObject *)a3 error:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0(&dword_190CD6000, a3, (uint64_t)a3, "XPC failed, retrying assertion acquisition", a1);
}

- (void)_lock_connect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "The sandbox in this process does not allow access to RunningBoard.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __30__RBSConnection_handleForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11(&dword_190CD6000, v0, v1, "This connection is not supposed to receive any messages, got dictionary: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __30__RBSConnection_handleForKey___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11(&dword_190CD6000, v0, v1, "This connection is not supposed to receive any messages, got connection: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __30__RBSConnection_handleForKey___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11(&dword_190CD6000, v0, v1, "This connection is not supposed to receive any messages got unknown: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)processName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, v0, v1, "Could not get process name: <%{public}@>", v2);
  OUTLINED_FUNCTION_0();
}

- (void)portForIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16(&dword_190CD6000, v0, v1, "Received port for identifier response: <%{public}@> with error:%{public}@");
  OUTLINED_FUNCTION_0();
}

- (void)_subscribeToProcessDeath:handler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_190CD6000, v0, (uint64_t)v0, "Error subscribing to death of process %{public}@: <%{public}@>", v1);
  OUTLINED_FUNCTION_0();
}

- (void)intendToExit:withStatus:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_190CD6000, v0, (uint64_t)v0, "Could not set intended exit for %{public}@ because %{public}@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)async_didChangeInheritances:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, v0, v1, "didChangeInheritances: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)async_assertionWillInvalidate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, v0, v1, "Assertion %{public}@ will invalidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)async_observedProcessStatesDidChange:completion:.cold.1()
{
  __assert_rtn("-[RBSConnection async_observedProcessStatesDidChange:completion:]", "RBSConnection.m", 1022, "identity != nil");
}

- (void)_handleMessage:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a3, (uint64_t)a3, "*** Unhandled message from server: %{public}@", (uint8_t *)a2);

}

- (void)_handleMessage:(NSObject *)a3 .cold.2(uint64_t a1, SEL aSelector, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 24);
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_190CD6000, a3, OS_LOG_TYPE_DEBUG, "PERF: %{public}@ Received message from runningboardd: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_2_1();
}

- (void)_handleMessage:(const char *)a1 .cold.3(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a2, v4, "Dropping message from server: The client is missing an implementation for %{public}@", v5);

}

- (void)_handleMessage:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Dropping message from server that does not conform to expectations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __32__RBSConnection__handleMessage___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_15();
  v2 = (const char *)OUTLINED_FUNCTION_17(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_190CD6000, v3, v4, "decodeArgumentsWithClass failed for method %{public}@ with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_15();
  NSStringFromSelector(*(SEL *)(v1 + 56));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_190CD6000, v2, v3, "decodeArgumentsWithClass failed for method %{public}@ with error %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Connection interrupted: will attempt to reconnect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Connection invalidated!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __27__RBSConnection__handshake__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 136);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_16(&dword_190CD6000, a2, a3, "managedEndpointByLaunchIdentifier mismatch : previous=%{public}@ new=%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __27__RBSConnection__handshake__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, a2, a3, "Replacing old assertions %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __27__RBSConnection__handshake__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "attempted handshake from xpc service with no host process, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __27__RBSConnection__handshake__block_invoke_cold_4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_15();
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v3 + 64), *v1, CFSTR("RBSConnection.m"), 1413, CFSTR("BUG IN RUNNINGBOARD %d RunningBoard handshakes failed"), v0);

  abort();
}

void __27__RBSConnection__handshake__block_invoke_cold_5(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0(&dword_190CD6000, a3, (uint64_t)a3, "Handshake aborted as the connection has been invalidated", a1);
}

void __27__RBSConnection__handshake__block_invoke_220_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_190CD6000, v0, (uint64_t)v0, "No old assertion found for %{public}@; new assertion %{public}@ will be invalidated",
    v1);
  OUTLINED_FUNCTION_0();
}

@end
