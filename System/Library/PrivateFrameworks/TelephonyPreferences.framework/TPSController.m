@implementation TPSController

- (TPSController)init
{
  TPSController *v2;
  TPSController *v3;
  uint64_t v4;
  NSMapTable *delegateToQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSController;
  v2 = -[TPSController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_delegateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;

  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__TPSController_addDelegate_queue___block_invoke;
  v10[3] = &unk_1EA2CD990;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v10);

}

void __35__TPSController_addDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = MEMORY[0x1E0C80D38];
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__TPSController_removeDelegate___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v6);

}

void __32__TPSController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)performAtomicDelegateBlock:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_delegateLock = &self->_delegateLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock_with_options();
    v4[2](v4);

    os_unfair_lock_unlock(p_delegateLock);
  }
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void)setDelegateLock:(os_unfair_lock_s)a3
{
  self->_delegateLock = a3;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

@end
