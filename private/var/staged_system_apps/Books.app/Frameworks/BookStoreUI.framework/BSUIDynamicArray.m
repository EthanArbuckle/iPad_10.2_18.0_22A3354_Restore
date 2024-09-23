@implementation BSUIDynamicArray

- (BSUIDynamicArray)initWithArray:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BSUIDynamicArrayProvider *v8;
  void *v9;
  id v10;
  BSUIDynamicArray *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMutableSet *strongObservers;
  uint64_t v18;
  NSMutableSet *weakObservers;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v6 = a4;
  v7 = a3;
  v8 = -[BSUIDynamicArrayProvider initWithArray:options:dynamicArray:]([BSUIDynamicArrayProvider alloc], "initWithArray:options:dynamicArray:", v7, v6, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider currentGeneration](v8, "currentGeneration"));
  v10 = objc_msgSend(v7, "count");

  v26.receiver = self;
  v26.super_class = (Class)BSUIDynamicArray;
  v11 = -[BSUIDynamicArray initWithDataProvider:generation:count:](&v26, "initWithDataProvider:generation:count:", v8, v9, v10);

  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("BSUIDynamicArray.queue", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    v11->_observerAccessLock._os_unfair_lock_opaque = 0;
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    strongObservers = v11->_strongObservers;
    v11->_strongObservers = (NSMutableSet *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    weakObservers = v11->_weakObservers;
    v11->_weakObservers = (NSMutableSet *)v18;

    if (-[BSUIDynamicArrayProvider loadsContent](v8, "loadsContent"))
      -[BSUIDynamicArray setTransactionCategory:](v11, "setTransactionCategory:", TUITransactionCategoryContentLoad);
    v21 = objc_opt_class(NSString, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("debugName")));
    v23 = BUDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[BSUIDynamicArray setDebugName:](v11, "setDebugName:", v24);

  }
  return v11;
}

- (void)updateArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v6 = objc_opt_class(BSUIDynamicArrayProvider, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray dataProvider](self, "dataProvider"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "updateArray:batchUpdatesBlock:", v4, 0);
}

- (void)performBatchUpdatesWithGeneration:(id)a3 block:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUIDynamicArray;
  -[BSUIDynamicArray performBatchUpdatesWithGeneration:block:](&v5, "performBatchUpdatesWithGeneration:block:", a3, a4);
  -[BSUIDynamicArray notifyObservers](self, "notifyObservers");
}

- (void)notifyObservers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v3 = objc_opt_class(BSUIDynamicArrayProvider, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray dataProvider](self, "dataProvider"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentArray"));
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_18B88;
  v10[3] = &unk_2E48F8;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)objectAtIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_opt_class(BSUIDynamicArrayProvider, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray dataProvider](self, "dataProvider"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentGeneration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:generation:", a3, v9));

  return v10;
}

- (NSArray)internalArray
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(BSUIDynamicArrayProvider, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray dataProvider](self, "dataProvider"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentArray"));
  return (NSArray *)v7;
}

- (int64_t)length
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_class(BSUIDynamicArrayProvider, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray dataProvider](self, "dataProvider"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentGeneration"));
  v8 = objc_msgSend(v6, "countForGeneration:", v7);

  return (int64_t)v8;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray strongObservers](self, "strongObservers"));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray strongObservers](self, "strongObservers"));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArray weakObservers](self, "weakObservers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v5));

  objc_msgSend(v6, "addObject:", v7);
  os_unfair_lock_unlock(p_observerAccessLock);
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
