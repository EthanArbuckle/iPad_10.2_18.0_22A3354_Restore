@implementation RBProcessIndex

- (id)processForIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_processByIdentity, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)processForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *processByIdentifier;
  void *v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    processByIdentifier = self->_processByIdentifier;
    objc_msgSend(MEMORY[0x24BE80C90], "identifierForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](processByIdentifier, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)containsProcess:(id)a3
{
  void *v4;

  objc_msgSend(a3, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBProcessIndex containsInstance:](self, "containsInstance:", v4);

  return (char)self;
}

- (BOOL)containsInstance:(id)a3
{
  void *v3;
  BOOL v4;

  -[RBProcessIndex processForInstance:](self, "processForInstance:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)processForInstance:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_processByInstance, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)allProcesses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet objectEnumerator](self->_processes, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_processes, "count");
}

- (BOOL)addProcess:(id)a3 existingProcess:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock_with_options();
  v7 = -[NSMutableOrderedSet containsObject:](self->_processes, "containsObject:", v6);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v6, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80C90], "identifierForIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_processByIdentifier, "objectForKey:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[RBProcessIndex addProcess:existingProcess:].cold.1();
    if (!v8)
      -[RBProcessIndex addProcess:existingProcess:].cold.2();
    if (!v9)
      -[RBProcessIndex addProcess:existingProcess:].cold.3();
    if (!v10)
      -[RBProcessIndex addProcess:existingProcess:].cold.4();
    v12 = (void *)v11;
    rbs_ttl_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "Existing process in RBProcessIndex is: %{public}@", (uint8_t *)&v19, 0xCu);
    }

    if (v12)
    {
      v14 = objc_msgSend(v12, "pidversion");
      if (v14 == objc_msgSend(v6, "pidversion"))
      {
        rbs_ttl_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          v19 = 138543874;
          v20 = v12;
          v21 = 2114;
          v22 = v6;
          v23 = 2114;
          v24 = v10;
          _os_log_fault_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_FAULT, "cannot map existing process %{public}@ and new process %{public}@ which have the same identifier: %{public}@", (uint8_t *)&v19, 0x20u);
        }

      }
      else
      {
        rbs_process_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138543618;
          v20 = v12;
          v21 = 2114;
          v22 = v6;
          _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, "replacing %{public}@ which appears to have been exec'd into %{public}@", (uint8_t *)&v19, 0x16u);
        }

        if (a4)
          *a4 = objc_retainAutorelease(v12);
      }
    }
    -[NSMutableOrderedSet insertObject:atIndex:](self->_processes, "insertObject:atIndex:", v6, 0);
    -[NSMutableDictionary setObject:forKey:](self->_processByIdentity, "setObject:forKey:", v6, v8);
    -[NSMutableDictionary setObject:forKey:](self->_processByInstance, "setObject:forKey:", v6, v9);
    -[NSMutableDictionary setObject:forKey:](self->_processByIdentifier, "setObject:forKey:", v6, v10);
    if (self->_capacity && -[NSMutableOrderedSet count](self->_processes, "count") > self->_capacity)
    {
      -[NSMutableOrderedSet lastObject](self->_processes, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v17);

    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v7 ^ 1;
}

- (BOOL)addProcess:(id)a3
{
  return -[RBProcessIndex addProcess:existingProcess:](self, "addProcess:existingProcess:", a3, 0);
}

- (BOOL)containsIdentity:(id)a3
{
  void *v3;
  BOOL v4;

  -[RBProcessIndex processForIdentity:](self, "processForIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)removeProcess:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v5 = -[NSMutableOrderedSet containsObject:](self->_processes, "containsObject:", v4);
    if (v5)
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v4);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_lock_removeProcess:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (a1 && v3)
  {
    v10 = v3;
    objc_msgSend(v3, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80C90], "identifierForIdentifier:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[3], "removeObject:", v10);
    objc_msgSend(a1[5], "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v10)
      objc_msgSend(a1[5], "removeObjectForKey:", v4);
    objc_msgSend(a1[6], "objectForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
      objc_msgSend(a1[6], "removeObjectForKey:", v6);
    objc_msgSend(a1[4], "objectForKey:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      objc_msgSend(a1[4], "removeObjectForKey:", v5);

    v3 = v10;
  }

}

+ (id)index
{
  return objc_alloc_init((Class)a1);
}

+ (RBProcessIndex)indexWithCapacity:(unint64_t)a3
{
  return (RBProcessIndex *)-[RBProcessIndex initWithCapacity:]([RBProcessIndex alloc], a3);
}

- (_QWORD)initWithCapacity:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)RBProcessIndex;
  v3 = objc_msgSendSuper2(&v14, sel_init);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 2) = 0;
    v3[2] = a2;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v6 = (void *)v4[3];
    v4[3] = v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)v4[4];
    v4[4] = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = (void *)v4[5];
    v4[5] = v9;

    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = (void *)v4[6];
    v4[6] = v11;

  }
  return v4;
}

- (RBProcessIndex)init
{
  return (RBProcessIndex *)-[RBProcessIndex initWithCapacity:](self, 0);
}

- (BOOL)containsIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[RBProcessIndex processForIdentifier:](self, "processForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet removeAllObjects](self->_processes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByIdentity, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByInstance, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByIdentifier, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[RBProcessIndex allProcesses](self, "allProcesses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processByIdentifier, 0);
  objc_storeStrong((id *)&self->_processByInstance, 0);
  objc_storeStrong((id *)&self->_processByIdentity, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

- (void)addProcess:existingProcess:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)addProcess:existingProcess:.cold.2()
{
  _os_crash();
  __break(1u);
}

- (void)addProcess:existingProcess:.cold.3()
{
  _os_crash();
  __break(1u);
}

- (void)addProcess:existingProcess:.cold.4()
{
  _os_crash();
  __break(1u);
}

@end
