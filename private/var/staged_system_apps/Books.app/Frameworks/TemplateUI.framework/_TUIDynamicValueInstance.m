@implementation _TUIDynamicValueInstance

- (_TUIDynamicValueInstance)initWithDynamicValue:(id)a3 value:(id)a4 observer:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIDynamicValueInstance *v12;
  _TUIDynamicValueInstance *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUIDynamicValueInstance;
  v12 = -[_TUIDynamicValueInstance init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dynamicValue, a3);
    objc_storeStrong(&v13->_value, a4);
    objc_storeWeak((id *)&v13->_observer, v11);
  }

  return v13;
}

- (void)enqueueUpdate:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  NSMutableArray *updates;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id WeakRetained;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  updates = self->_updates;
  if (!updates)
  {
    v7 = objc_opt_new(NSMutableArray);
    v8 = self->_updates;
    self->_updates = v7;

    updates = self->_updates;
  }
  -[NSMutableArray addObject:](updates, "addObject:", v5);
  os_unfair_lock_unlock(p_accessLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transaction"));

  objc_msgSend(WeakRetained, "dynamicChanged:transaction:", self, v9);
}

- (id)dequeueUpdate
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (-[NSMutableArray count](self->_updates, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_updates, "objectAtIndexedSubscript:", 0));
    -[NSMutableArray removeObjectAtIndex:](self->_updates, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  os_unfair_lock_s *p_accessLock;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableArray *updates;
  BOOL v21;

  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v9 = (char *)-[NSMutableArray count](self->_updates, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      if (v6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_updates, "objectAtIndexedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transaction"));
        v14 = objc_msgSend(v6, "containsTransaction:", v13);

        if (!v14)
          break;
      }
      if (v10 == ++v11)
      {
        v11 = v10;
        break;
      }
    }
    if (v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_updates, "subarrayWithRange:", 0, v11));
      v16 = v7[2](v7, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v15 != v17)
      {
        v19 = objc_msgSend(v17, "count");
        updates = self->_updates;
        if (!v19)
        {
          -[NSMutableArray removeObjectsInRange:](updates, "removeObjectsInRange:", 0, v11);
          v21 = 0;
          goto LABEL_14;
        }
        -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](updates, "replaceObjectsInRange:withObjectsFromArray:", 0, v11, v18);
      }
      v21 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v21 = 0;
LABEL_15:
  os_unfair_lock_unlock(p_accessLock);

  return v21;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_updates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        if (v4)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "transaction", (_QWORD)v15));
          v12 = objc_msgSend(v4, "containsTransaction:", v11);

          if ((v12 & 1) == 0)
            continue;
        }
        v13 = 1;
        goto LABEL_13;
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  os_unfair_lock_unlock(p_accessLock);
  return v13;
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_68118;
  v4[3] = &unk_23F1F0;
  v4[4] = self;
  return -[_TUIDynamicValueInstance optimizeUpdatesForTransactionGroup:block:](self, "optimizeUpdatesForTransactionGroup:block:", a3, v4);
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id value;
  BOOL v12;

  v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (-[NSMutableArray count](self->_updates, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_updates, "firstObject"));
    v7 = v6;
    if (v4
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transaction")),
          v9 = objc_msgSend(v4, "containsTransaction:", v8),
          v8,
          !v9))
    {
      v12 = 0;
    }
    else
    {
      -[NSMutableArray removeObjectAtIndex:](self->_updates, "removeObjectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
      value = self->_value;
      self->_value = v10;

      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v12;
}

- (void)valueWithBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, id))a3 + 2))(a3, self->_value);
}

- (id)tui_unwrapDynamicWithError:(unint64_t *)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_68344;
  v10 = sub_68354;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6835C;
  v5[3] = &unk_23F218;
  v5[4] = &v6;
  -[_TUIDynamicValueInstance valueWithBlock:](self, "valueWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (TUIDynamicValueObserving)observer
{
  return (TUIDynamicValueObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

- (TUIDynamicValue)dynamicValue
{
  return self->_dynamicValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicValue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
