@implementation MTSafeUuidQueryObserver

- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *currentItems;
  MTSafeUuidQueryObserver *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = (NSMutableSet *)objc_opt_new();
  currentItems = self->currentItems;
  self->currentItems = v8;

  v12.receiver = self;
  v12.super_class = (Class)MTSafeUuidQueryObserver;
  v10 = -[MTBaseQueryObserver initWithFetchRequest:managedObjectContext:](&v12, sel_initWithFetchRequest_managedObjectContext_, v7, v6);

  return v10;
}

- (id)addResultsChangedHandler:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTSafeUuidQueryObserver;
  -[MTBaseQueryObserver addResultsChangedHandler:](&v7, sel_addResultsChangedHandler_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startObserving
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTSafeUuidQueryObserver;
  -[MTBaseQueryObserver startObserving](&v4, sel_startObserving);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__MTSafeUuidQueryObserver_startObserving__block_invoke;
  v3[3] = &unk_24FD627C0;
  v3[4] = self;
  -[MTBaseQueryObserver results:](self, "results:", v3);
}

uint64_t __41__MTSafeUuidQueryObserver_startObserving__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a2, "valueForKey:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = objc_opt_new();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

  v11 = objc_opt_new();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = v11;

  return objc_msgSend(*(id *)(a1 + 32), "notifyObservers");
}

- (void)notifyObservers
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *currentInserts;
  NSMutableSet *currentDeletes;
  NSMutableSet *currentUpdates;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v10 = (id)-[NSMutableSet mutableCopy](self->currentItems, "mutableCopy");
  objc_msgSend(v10, "intersectSet:", self->currentInserts);
  -[NSMutableSet minusSet:](self->currentInserts, "minusSet:", v10);
  -[NSMutableSet unionSet:](self->currentUpdates, "unionSet:", v10);
  -[NSMutableSet intersectSet:](self->currentDeletes, "intersectSet:", self->currentItems);
  -[NSMutableSet intersectSet:](self->currentUpdates, "intersectSet:", self->currentItems);
  -[NSMutableSet unionSet:](self->currentItems, "unionSet:", self->currentInserts);
  -[NSMutableSet minusSet:](self->currentItems, "minusSet:", self->currentDeletes);
  v3 = (void *)-[NSMutableSet copy](self->currentInserts, "copy");
  v4 = (void *)-[NSMutableSet copy](self->currentDeletes, "copy");
  v5 = (void *)-[NSMutableSet copy](self->currentUpdates, "copy");
  currentInserts = self->currentInserts;
  self->currentInserts = 0;

  currentDeletes = self->currentDeletes;
  self->currentDeletes = 0;

  currentUpdates = self->currentUpdates;
  self->currentUpdates = 0;

  if (objc_msgSend(v5, "count") || objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
  {
    -[MTBaseQueryObserver handlers](self, "handlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__MTSafeUuidQueryObserver_notifyObservers__block_invoke;
    v11[3] = &unk_24FD627E8;
    v12 = v4;
    v13 = v3;
    v14 = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

void __42__MTSafeUuidQueryObserver_notifyObservers__block_invoke(_QWORD *a1, int a2, void *aBlock)
{
  id v4;

  v4 = _Block_copy(aBlock);
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, a1[4], a1[5], a1[6]);

}

- (void)controllerWillChangeContent:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *currentInserts;
  NSMutableSet *v6;
  NSMutableSet *currentDeletes;
  NSMutableSet *v8;
  NSMutableSet *currentUpdates;

  v4 = (NSMutableSet *)objc_opt_new();
  currentInserts = self->currentInserts;
  self->currentInserts = v4;

  v6 = (NSMutableSet *)objc_opt_new();
  currentDeletes = self->currentDeletes;
  self->currentDeletes = v6;

  v8 = (NSMutableSet *)objc_opt_new();
  currentUpdates = self->currentUpdates;
  self->currentUpdates = v8;

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  objc_msgSend(v9, "valueForKey:", CFSTR("uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a6 == 2)
    {
      v11 = 56;
    }
    else if (a6 == 1)
    {
      v11 = 48;
    }
    else
    {
      v11 = 64;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v11), "addObject:", v10);
  }
  else
  {
    _MTLogCategoryDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_22FB0C000, v12, OS_LOG_TYPE_DEFAULT, "MTSafeUUIDQueryObserver has no UUID for object %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentItems, 0);
  objc_storeStrong((id *)&self->currentUpdates, 0);
  objc_storeStrong((id *)&self->currentDeletes, 0);
  objc_storeStrong((id *)&self->currentInserts, 0);
}

@end
