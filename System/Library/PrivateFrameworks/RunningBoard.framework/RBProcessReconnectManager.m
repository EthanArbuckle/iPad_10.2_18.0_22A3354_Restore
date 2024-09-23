@implementation RBProcessReconnectManager

- (void)didInvalidateAssertion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__RBProcessReconnectManager_didInvalidateAssertion___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __52__RBProcessReconnectManager_didInvalidateAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v2))
  {
    rbs_assertion_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_DEFAULT, "Invalidated assertion %{public}@ for reconnected process", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
    -[RBProcessReconnectManager _lockQueue_resumeNextProcess](*(_QWORD *)(a1 + 32));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  }

}

- (RBProcessReconnectManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessReconnectManager.m"), 63, CFSTR("-init is not allowed on RBProcessReconnectManager"));

  return 0;
}

- (RBProcessReconnectManager)initWithDaemonContext:(id)a3 originatorProcess:(id)a4
{
  id v7;
  id v8;
  RBProcessReconnectManager *v9;
  RBProcessReconnectManager *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  NSMutableSet *currentAssertionIdentifiers;
  uint64_t v15;
  NSMutableSet *pendingProcesses;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RBProcessReconnectManager;
  v9 = -[RBProcessReconnectManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBProcessReconnectManager"));
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    currentAssertionIdentifiers = v10->_currentAssertionIdentifiers;
    v10->_currentAssertionIdentifiers = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingProcesses = v10->_pendingProcesses;
    v10->_pendingProcesses = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v10->_daemonContext, a3);
    objc_storeStrong((id *)&v10->_originatorProcess, a4);
  }

  return v10;
}

- (void)reconnectProcesses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  rbs_process_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v9 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Reconnecting to %{public}lu processes", buf, 0xCu);
  }

  -[RBDaemonContextProviding assertionOriginatorPidStore](self->_daemonContext, "assertionOriginatorPidStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValidProcesses:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__RBProcessReconnectManager_reconnectProcesses___block_invoke;
  v7[3] = &unk_24DD470C0;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __48__RBProcessReconnectManager_reconnectProcesses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assertionOriginatorPidStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  v6 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(*(id *)(v6 + 8), "assertionOriginatorPidStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsPid:", objc_msgSend(v8, "pid"));

  if (v9)
  {
    v6 = *(_QWORD *)(a1 + 32);
LABEL_4:
    -[RBProcessReconnectManager _reconnectProcess:](v6, v3);
    goto LABEL_8;
  }
  rbs_process_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Pid store does not include process: %{public}@", (uint8_t *)&v11, 0xCu);
  }

LABEL_8:
}

- (void)_reconnectProcess:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  NSObject *v5;
  _QWORD block[5];

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 48);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    os_unfair_lock_unlock(v3);
    v5 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__RBProcessReconnectManager__reconnectProcess___block_invoke;
    block[3] = &unk_24DD46160;
    block[4] = a1;
    dispatch_async(v5, block);
  }
}

- (void)_lockQueue_resumeNextProcess
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  int v18;
  uint8_t buf[4];
  _BYTE v20[14];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 24), "count") == 4)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "anyObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        objc_msgSend(v3, "handle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "pid");

        rbs_process_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend(*(id *)(a1 + 32), "count");
          v9 = objc_msgSend(*(id *)(a1 + 24), "count");
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v20 = v6;
          *(_WORD *)&v20[4] = 2048;
          *(_QWORD *)&v20[6] = v8;
          v21 = 2048;
          v22 = v9;
          v23 = 2048;
          v24 = 4;
          _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to reconnect to process %d; %lu left in the queue; %lu of %lu in flight",
            buf,
            0x26u);
        }

        objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);
        -[RBProcessReconnectManager _assertionDescriptorForProcess:]((id)a1, v4);
        v10 = objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 24), "addObject:", v11);
        rbs_assertion_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v20 = v11;
          *(_WORD *)&v20[8] = 1024;
          *(_DWORD *)&v20[10] = v6;
          v21 = 2048;
          v22 = 0x4000000000000000;
          _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_INFO, "Acquiring assertion with temporary identifier %{public}@ for reconnected process %d for %fs", buf, 0x1Cu);
        }

        +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", *(_QWORD *)(a1 + 16), v10, *(_QWORD *)(a1 + 8));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAcquisitionPolicy:", 0);
        objc_msgSend(*(id *)(a1 + 8), "assertionManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke;
        v16[3] = &unk_24DD470E8;
        v18 = v6;
        v16[4] = a1;
        v17 = v11;
        v15 = v11;
        objc_msgSend(v14, "acquireAssertionWithContext:completion:", v13, v16);

      }
      else
      {
        rbs_process_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Reconnect queue is empty; reconnect done", buf, 2u);
        }
      }

      os_unfair_lock_unlock(v2);
    }
  }
}

void __47__RBProcessReconnectManager__reconnectProcess___block_invoke(uint64_t a1)
{
  -[RBProcessReconnectManager _lockQueue_resumeNextProcess](*(_QWORD *)(a1 + 32));
}

- (id)_assertionDescriptorForProcess:(id)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)MEMORY[0x24BE80B20];
    v4 = a2;
    objc_msgSend(v3, "identifierWithClientPid:", getpid());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE80D38];
    objc_msgSend(v4, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "targetWithPid:", objc_msgSend(v7, "pid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RBProcessReconnectManager _assertionAttributes]((uint64_t)v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B18], "descriptorWithIdentifier:target:explanation:attributes:", v5, v8, CFSTR("Resuming process for assertion reconnection"), v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  rbs_assertion_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke_cold_1(a1, (uint64_t)v3, v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_DWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 40);
      v8[0] = 67109634;
      v8[1] = v6;
      v9 = 2114;
      v10 = v7;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_INFO, "Acquired assertion for reconnected process %d with identifier %{public}@ replacing temporary identifier %{public}@", (uint8_t *)v8, 0x1Cu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_assertionAttributes
{
  void *v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[8];
  _QWORD v11[3];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "domainAttributeManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsAttributeWithDomain:andName:", CFSTR("com.apple.coreos"), CFSTR("reconnect"));

  rbs_assertion_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "Using domain attribute for reconnect", v10, 2u);
    }

    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.coreos"), CFSTR("reconnect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[RBProcessReconnectManager _assertionAttributes].cold.1(v4);

    objc_msgSend(MEMORY[0x24BE80B40], "grantWithUserInteractivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BE80BE0], "grantWithBackgroundPriority");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BE80B90], "attributeWithDuration:warningDuration:startPolicy:endPolicy:", 1, 1, 2.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)debugDescription
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__RBProcessReconnectManager_debugDescription__block_invoke;
  v5[3] = &unk_24DD461B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__RBProcessReconnectManager_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ReconnectManager:%d pending>"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingProcesses, 0);
  objc_storeStrong((id *)&self->_currentAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_originatorProcess, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
}

void __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_DWORD *)(a1 + 48);
  v5 = 138543874;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Error acquiring reconnection assertion with temporary identifier %{public}@ for process %d: <%{public}@>", (uint8_t *)&v5, 0x1Cu);
}

- (void)_assertionAttributes
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Missing domain attribute for reconnect", v1, 2u);
}

@end
