@implementation BSUIDynamicValue

- (BSUIDynamicValue)initWithValue:(id)a3 options:(id)a4
{
  id v6;
  BSUIDynamicValue *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableSet *strongObservers;
  uint64_t v14;
  NSMutableSet *weakObservers;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BSUIDynamicValue;
  v7 = -[BSUIDynamicValue initWithValue:](&v23, "initWithValue:", a3);
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("BSUIDynamicValue.queue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v7->_observerAccessLock._os_unfair_lock_opaque = 0;
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    strongObservers = v7->_strongObservers;
    v7->_strongObservers = (NSMutableSet *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    weakObservers = v7->_weakObservers;
    v7->_weakObservers = (NSMutableSet *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loadsContent")));
    if (v16)
      -[BSUIDynamicValue setTransactionCategory:](v7, "setTransactionCategory:", TUITransactionCategoryContentLoad);
    v18 = objc_opt_class(NSString, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("debugName")));
    v20 = BUDynamicCast(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[BSUIDynamicValue setDebugName:](v7, "setDebugName:", v21);

  }
  return v7;
}

- (BSUIDynamicValue)initWithValue:(id)a3
{
  return -[BSUIDynamicValue initWithValue:options:](self, "initWithValue:options:", a3, 0);
}

- (void)updateValue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7C0C;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)getValue
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue instanceForObserver:](self, "instanceForObserver:", self));
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_80B0;
  v10 = sub_80C0;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_80C8;
  v5[3] = &unk_2E40F0;
  v5[4] = &v6;
  objc_msgSend(v2, "valueWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue strongObservers](self, "strongObservers"));
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue strongObservers](self, "strongObservers"));
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)addWeakObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;
  void *v7;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue weakObservers](self, "weakObservers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v5));

  objc_msgSend(v6, "addObject:", v7);
  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeWeakObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_observerAccessLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue weakObservers](self, "weakObservers"));
  v6 = objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value", (_QWORD)v16));
        v14 = v13;
        if (!v13 || objc_msgSend(v13, "isEqual:", v4))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue weakObservers](self, "weakObservers"));
          objc_msgSend(v15, "removeObject:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(&self->_observerAccessLock);
}

- (JSValue)onUpdate
{
  return self->_onUpdate;
}

- (void)setOnUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_onUpdate, a3);
}

- (NSMutableSet)strongObservers
{
  return self->_strongObservers;
}

- (void)setStrongObservers:(id)a3
{
  objc_storeStrong((id *)&self->_strongObservers, a3);
}

- (NSMutableSet)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
  objc_storeStrong((id *)&self->_weakObservers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_strongObservers, 0);
  objc_storeStrong((id *)&self->_onUpdate, 0);
}

@end
