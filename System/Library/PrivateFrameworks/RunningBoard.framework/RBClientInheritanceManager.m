@implementation RBClientInheritanceManager

- (void)setInheritances:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableSet *v6;
  NSMutableSet *queuedGainedInheritances;
  NSMutableSet *v8;
  NSMutableSet *queuedLostInheritances;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSMutableSet *)objc_msgSend(v5, "mutableCopy");
  queuedGainedInheritances = self->_queuedGainedInheritances;
  self->_queuedGainedInheritances = v6;

  v8 = (NSMutableSet *)-[NSMutableSet mutableCopy](self->_inheritances, "mutableCopy");
  queuedLostInheritances = self->_queuedLostInheritances;
  self->_queuedLostInheritances = v8;

  -[NSMutableSet minusSet:](self->_queuedGainedInheritances, "minusSet:", self->_inheritances);
  -[NSMutableSet minusSet:](self->_queuedLostInheritances, "minusSet:", v5);

  -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock]((uint64_t)self);
}

- (void)_lock_sendQueuedInheritancesAndUnlock
{
  os_unfair_lock_s *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 36));
    if (*(_BYTE *)(a1 + 32))
    {
LABEL_3:
      os_unfair_lock_unlock(v2);
      return;
    }
    objc_msgSend(*(id *)(a1 + 16), "minusSet:", *(_QWORD *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "intersectSet:", *(_QWORD *)(a1 + 8));
    if (!objc_msgSend(*(id *)(a1 + 16), "count") && !objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      v10 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      goto LABEL_3;
    }
    *(_BYTE *)(a1 + 32) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BD0]), "initWithGainedInheritances:lostInheritances:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
    if (v4)
    {
      rbs_connection_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Inheritance changeset: %{public}@", buf, 0xCu);
      }

    }
    v6 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v7 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    os_unfair_lock_unlock(v2);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke;
    v11[3] = &unk_24DD45FF0;
    v11[4] = a1;
    v12 = v4;
    v8 = v4;
    objc_msgSend(WeakRetained, "inheritanceManager:didChangeInheritances:completion:", a1, v8, v11);

  }
}

uint64_t __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 36));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "gainedInheritances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "lostInheritances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock](*(_QWORD *)(a1 + 32));
}

- (RBClientInheritanceManager)initWithInheritances:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  RBClientInheritanceManager *v8;
  RBClientInheritanceManager *v9;
  uint64_t v10;
  NSMutableSet *inheritances;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RBClientInheritanceManager;
  v8 = -[RBClientInheritanceManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_awaitingAck = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    inheritances = v9->_inheritances;
    v9->_inheritances = (NSMutableSet *)v10;

    if (v6)
      -[RBClientInheritanceManager setInheritances:](v9, "setInheritances:", v6);
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet allObjects](self->_inheritances, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[NSMutableSet allObjects](self->_queuedGainedInheritances, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[NSMutableSet allObjects](self->_queuedLostInheritances, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v23 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR(" inheritances:[\n\t");
  if (!v4)
    v10 = &stru_24DD48378;
  v22 = v10;
  v24 = v4;
  if (v4)
  {
    -[NSMutableSet allObjects](self->_inheritances, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(",\n\t"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("\n\t]");
  }
  else
  {
    v12 = &stru_24DD48378;
    v11 = &stru_24DD48378;
  }
  if (v6)
    v13 = CFSTR(" queuedGainedInheritances:[\n\t");
  else
    v13 = &stru_24DD48378;
  if (v6)
  {
    -[NSMutableSet allObjects](self->_queuedGainedInheritances, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(",\n\t"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("\n\t]");
    if (v8)
      goto LABEL_11;
  }
  else
  {
    v15 = &stru_24DD48378;
    v14 = &stru_24DD48378;
    if (v8)
    {
LABEL_11:
      -[NSMutableSet allObjects](self->_queuedLostInheritances, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(",\n\t"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("<%@| %@%@%@%@%@%@%@%@%@>"), v9, v22, v11, v12, v13, v14, v15, CFSTR(" queuedLostInheritances:[\n\t"), v17, CFSTR("\n\t]"));

      if (!v6)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  v18 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("<%@| %@%@%@%@%@%@%@%@%@>"), v9, v22, v11, v12, v13, v14, v15, &stru_24DD48378, &stru_24DD48378, &stru_24DD48378);
  if (v6)
  {
LABEL_12:

  }
LABEL_13:
  if (v24)
  {

  }
  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedLostInheritances, 0);
  objc_storeStrong((id *)&self->_queuedGainedInheritances, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
}

- (RBClientInheritanceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBClientInheritanceManager.m"), 46, CFSTR("wrong initializer"));

  return 0;
}

- (RBClientInheritanceManagerDelegate)delegate
{
  return (RBClientInheritanceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
