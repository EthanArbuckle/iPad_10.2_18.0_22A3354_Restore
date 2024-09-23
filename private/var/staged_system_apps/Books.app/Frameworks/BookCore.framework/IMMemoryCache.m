@implementation IMMemoryCache

- (IMMemoryCache)init
{
  IMMemoryCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *items;
  NSMutableArray *v5;
  NSMutableArray *itemsArray;
  NSOperationQueue *v7;
  NSOperationQueue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  double v11;
  IMMemoryCache *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMMemoryCache;
  v2 = -[IMMemoryCache init](&v14, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    items = v2->_items;
    v2->_items = v3;

    v5 = objc_opt_new(NSMutableArray);
    itemsArray = v2->_itemsArray;
    v2->_itemsArray = v5;

    v7 = objc_opt_new(NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v9 = dispatch_queue_create("com.apple.itunesmobile.immemorycache", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v2->_lastCheckTime = v11;
    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IMMemoryCache setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMMemoryCache;
  -[IMMemoryCache dealloc](&v3, "dealloc");
}

- (id)allKeys
{
  NSObject *accessQueue;
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
  v9 = sub_165528;
  v10 = sub_165538;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_165540;
  v5[3] = &unk_28B700;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)hasObjectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_165528;
  v15 = sub_165538;
  v16 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165668;
  block[3] = &unk_28B7E0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = v12[5] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_165528;
  v16 = sub_165538;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165778;
  block[3] = &unk_28C430;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[_IMMemoryCacheItem cacheItemWithItem:key:cost:](_IMMemoryCacheItem, "cacheItemWithItem:key:cost:", a3, v6, 0));
  -[IMMemoryCache _addItem:forKey:](self, "_addItem:forKey:", v7, v6);

}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[_IMMemoryCacheItem cacheItemWithItem:key:cost:](_IMMemoryCacheItem, "cacheItemWithItem:key:cost:", a3, v8, a5));
  -[IMMemoryCache _addItem:forKey:](self, "_addItem:forKey:", v9, v8);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = sub_165A28;
    block[3] = &unk_28B808;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(accessQueue, block);

    v4 = v6;
  }

}

- (void)removeAllObjects
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165A8C;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)removeObjectsForKeyWithPrefix:(id)a3 andSuffix:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_165B84;
    block[3] = &unk_28C5F0;
    block[4] = self;
    v10 = v8;
    v11 = v6;
    dispatch_sync(accessQueue, block);

  }
}

- (void)removeObjectsForKeyWithPrefix:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = sub_165D28;
    block[3] = &unk_28B808;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(accessQueue, block);

    v4 = v6;
  }

}

- (BOOL)_removeItemFromItemsDictionaryIfReady:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  NSMutableDictionary *items;
  void *v10;
  BOOL v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_itemsArray, "objectAtIndex:", a3));
  if (objc_msgSend(v4, "conformsToProtocol")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item")),
        objc_msgSend(v5, "discardContentIfPossible"),
        v5,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item")),
        v7 = objc_msgSend(v6, "isContentDiscarded"),
        v6,
        !v7))
  {
    v11 = 0;
  }
  else
  {
    -[IMMemoryCache _willEvict:](self, "_willEvict:", v4);
    v8 = self->_totalCost - (_QWORD)objc_msgSend(v4, "cost");
    --self->_count;
    self->_totalCost = v8;
    items = self->_items;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    -[NSMutableDictionary removeObjectForKey:](items, "removeObjectForKey:", v10);

    v11 = 1;
  }

  return v11;
}

- (void)_willEvict:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMMemoryCache delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "cache:willEvictObject:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "item"));
    objc_msgSend(v4, "cache:willEvictObject:", self, v5);

  }
}

- (void)checkLimitsAndEvictObjects
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_165FE4;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_checkLimitsAndEvictObjects
{
  unint64_t totalCostLimit;
  unint64_t count;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t countLimit;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v17;

  totalCostLimit = self->_totalCostLimit;
  if (totalCostLimit && self->_totalCost > totalCostLimit)
  {
    count = self->_count;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    if (count)
    {
      v6 = 0;
      v7 = count - 1;
      do
      {
        if (-[IMMemoryCache _removeItemFromItemsDictionaryIfReady:](self, "_removeItemFromItemsDictionaryIfReady:", v6))
          objc_msgSend(v5, "addIndex:", v6);
      }
      while (self->_totalCost > self->_totalCostLimit && v7 != v6++);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_itemsArray, "removeObjectsAtIndexes:", v5);
    v9 = 20;
    do
    {
      if (self->_totalCost <= self->_totalCostLimit)
        break;
      if (!-[NSMutableArray count](self->_itemsArray, "count"))
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_itemsArray, "objectAtIndex:", 0));
      -[IMMemoryCache _willEvict:](self, "_willEvict:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
      -[IMMemoryCache _removeObjectForKey:](self, "_removeObjectForKey:", v11);

      --v9;
    }
    while (v9);

  }
  countLimit = self->_countLimit;
  if (countLimit)
  {
    v13 = self->_count;
    if (v13 > countLimit)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
      v14 = 0;
      v15 = v13 - 1;
      do
      {
        if (-[IMMemoryCache _removeItemFromItemsDictionaryIfReady:](self, "_removeItemFromItemsDictionaryIfReady:", v14))
        {
          objc_msgSend(v17, "addIndex:", v14);
        }
      }
      while (self->_count > self->_countLimit && v15 != v14++);
      -[NSMutableArray removeObjectsAtIndexes:](self->_itemsArray, "removeObjectsAtIndexes:", v17);

    }
  }
}

- (void)_checkLimits
{
  double v3;
  unint64_t countLimit;
  unint64_t totalCostLimit;
  double v6;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (v3 - self->_lastCheckTime > 0.4
    && ((countLimit = self->_countLimit) != 0 && self->_count > countLimit
     || (totalCostLimit = self->_totalCostLimit) != 0 && self->_totalCost > totalCostLimit))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_lastCheckTime = v6;
    -[IMMemoryCache _checkLimitsAndEvictObjects](self, "_checkLimitsAndEvictObjects");
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCost
{
  return self->_totalCost;
}

- (unint64_t)costForObjectWithKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1662D8;
  block[3] = &unk_28C430;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)numberOfCachedItems
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1663C8;
  v5[3] = &unk_28B700;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  NSObject *accessQueue;
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
  v9 = sub_165528;
  v10 = sub_165538;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1664B0;
  v5[3] = &unk_28B700;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_addItem:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16660C;
  block[3] = &unk_28C5F0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(accessQueue, block);

}

- (void)_removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *itemsArray;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:"));
  v5 = v4;
  if (v4)
  {
    --self->_count;
    self->_totalCost -= (unint64_t)objc_msgSend(v4, "cost");
    -[NSMutableDictionary removeObjectForKey:](self->_items, "removeObjectForKey:", v9);
    itemsArray = self->_itemsArray;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "timeStamp")));
    v8 = -[NSMutableArray bu_indexOfObjectWithValue:forKeyPath:](itemsArray, "bu_indexOfObjectWithValue:forKeyPath:", v7, CFSTR("timeStamp"));

    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_itemsArray, "removeObjectAtIndex:", v8);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)evictsItemsWithDiscardedContent
{
  return self->_evictsItemsWithDiscardedContent;
}

- (void)setEvictsItemsWithDiscardedContent:(BOOL)a3
{
  self->_evictsItemsWithDiscardedContent = a3;
}

- (unint64_t)totalCostLimit
{
  return self->_totalCostLimit;
}

- (void)setTotalCostLimit:(unint64_t)a3
{
  self->_totalCostLimit = a3;
}

- (unint64_t)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_countLimit = a3;
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableArray)itemsArray
{
  return self->_itemsArray;
}

- (void)setItemsArray:(id)a3
{
  objc_storeStrong((id *)&self->_itemsArray, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (double)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(double)a3
{
  self->_lastCheckTime = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
