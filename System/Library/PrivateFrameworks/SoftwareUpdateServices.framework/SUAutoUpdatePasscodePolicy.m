@implementation SUAutoUpdatePasscodePolicy

- (SUAutoUpdatePasscodePolicy)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUAutoUpdatePasscodePolicy.m"), 41, CFSTR("Please use the sharedInstance."));

  return 0;
}

- (id)_init
{
  SUAutoUpdatePasscodePolicy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *observerCalloutQueue;
  uint64_t v7;
  NSHashTable *queue_observers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUAutoUpdatePasscodePolicy;
  v2 = -[SUAutoUpdatePasscodePolicy init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.softwareupdateservices.passcodePolicy", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.softwareupdateservices.passcodepolicy.observerCallout", 0);
    observerCalloutQueue = v2->_observerCalloutQueue;
    v2->_observerCalloutQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    queue_observers = v2->_queue_observers;
    v2->_queue_observers = (NSHashTable *)v7;

    -[SUAutoUpdatePasscodePolicy setCurrentPolicyType:](v2, "setCurrentPolicyType:", 0);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_0);
  return (id)sharedInstance___instance;
}

void __44__SUAutoUpdatePasscodePolicy_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SUAutoUpdatePasscodePolicy _init]([SUAutoUpdatePasscodePolicy alloc], "_init");
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (unint64_t)currentPolicyType
{
  NSObject *queue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  BSDispatchQueueAssertNot();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__SUAutoUpdatePasscodePolicy_currentPolicyType__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__SUAutoUpdatePasscodePolicy_currentPolicyType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (BOOL)_isValidPasscodePolicyType:(unint64_t)a3
{
  return a3 < 3;
}

- (id)stringForCurrentPolicy
{
  unint64_t v2;

  v2 = -[SUAutoUpdatePasscodePolicy currentPolicyType](self, "currentPolicyType");
  if (v2 > 2)
    return CFSTR("Unknown");
  else
    return off_24CE3B7B8[v2];
}

- (void)setCurrentPolicyType:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v6[6];

  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SUAutoUpdatePasscodePolicy_setCurrentPolicyType___block_invoke;
  v6[3] = &unk_24CE3B798;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(queue, v6);
}

void __51__SUAutoUpdatePasscodePolicy_setCurrentPolicyType___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isValidPasscodePolicyType:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasPasscodeSet") & 1) != 0)
    {

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);

      if (v5)
      {
        SULogInfo(CFSTR("%s: Tried to change passcode policy to %@, but passcode is not set, so override policy to not required"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUAutoUpdatePasscodePolicy setCurrentPolicyType:]_block_invoke");
        v3 = 0;
      }
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v13 + 40) != v3)
    {
      *(_QWORD *)(v13 + 40) = v3;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v19, "passcodePolicyInterface:passcodePolicyTypeChanged:", *(_QWORD *)(a1 + 32), v3);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v16);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPolicyType");
    SULogInfo(CFSTR("Invalid passcode policy type: %lu. Leaving policy as %@"), v20, v21, v22, v23, v24, v25, v26, v3);
  }
}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUAutoUpdatePasscodePolicy.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUAutoUpdatePasscodePolicy_addObserver___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __42__SUAutoUpdatePasscodePolicy_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUAutoUpdatePasscodePolicy.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUAutoUpdatePasscodePolicy_removeObserver___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __45__SUAutoUpdatePasscodePolicy_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)description
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[SUAutoUpdatePasscodePolicy currentPolicyType](self, "currentPolicyType");
  if (v3 > 2)
    v4 = CFSTR("Unknown");
  else
    v4 = off_24CE3B7B8[v3];
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
}

@end
