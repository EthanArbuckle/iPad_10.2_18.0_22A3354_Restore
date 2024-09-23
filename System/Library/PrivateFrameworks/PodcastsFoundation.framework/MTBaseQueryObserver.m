@implementation MTBaseQueryObserver

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 returnObjectsAsFaults:(BOOL)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  void *v15;
  MTBaseQueryObserver *v16;

  v7 = a7;
  v12 = (void *)MEMORY[0x1E0C97B48];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "fetchRequestWithEntityName:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v14);

  objc_msgSend(v15, "setSortDescriptors:", v13);
  objc_msgSend(v15, "setFetchLimit:", a6);
  objc_msgSend(v15, "setReturnsObjectsAsFaults:", v7);
  v16 = -[MTBaseQueryObserver initWithFetchRequest:](self, "initWithFetchRequest:", v15);

  return v16;
}

- (MTBaseQueryObserver)initWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTBaseQueryObserver *v7;

  v4 = a3;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MTBaseQueryObserver initWithFetchRequest:managedObjectContext:](self, "initWithFetchRequest:managedObjectContext:", v4, v6);
  return v7;
}

- (MTBaseQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  MTBaseQueryObserver *v8;
  MTBaseQueryObserver *v9;
  uint64_t v10;
  NSFetchedResultsController *frc;
  NSMutableDictionary *v12;
  NSMutableDictionary *handlers;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTBaseQueryObserver;
  v8 = -[MTBaseQueryObserver init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isObserving = 0;
    v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "fetchedResultsControllerClass")), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v7, 0, 0);
    frc = v9->_frc;
    v9->_frc = (NSFetchedResultsController *)v10;

    -[NSFetchedResultsController setDelegate:](v9->_frc, "setDelegate:", v9);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    handlers = v9->_handlers;
    v9->_handlers = v12;

  }
  return v9;
}

+ (Class)fetchedResultsControllerClass
{
  return (Class)objc_opt_class();
}

void __31__MTBaseQueryObserver_results___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_frc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void __37__MTBaseQueryObserver_startObserving__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_frc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "performFetch:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (id)_frc
{
  return self->_frc;
}

void __28__MTBaseQueryObserver_uuids__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "valueForKey:", CFSTR("uuid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6
{
  return -[MTBaseQueryObserver initWithEntityName:predicate:sortDescriptors:limit:returnObjectsAsFaults:](self, "initWithEntityName:predicate:sortDescriptors:limit:returnObjectsAsFaults:", a3, a4, a5, a6, 1);
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4
{
  return -[MTBaseQueryObserver initWithEntityName:predicate:sortDescriptors:limit:](self, "initWithEntityName:predicate:sortDescriptors:limit:", a3, a4, MEMORY[0x1E0C9AA60], 0);
}

- (id)uuids
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__MTBaseQueryObserver_uuids__block_invoke;
  v4[3] = &unk_1E54D1248;
  v4[4] = &v5;
  -[MTBaseQueryObserver results:](self, "results:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)startObserving
{
  void *v3;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MTBaseQueryObserver_startObserving__block_invoke;
  v4[3] = &unk_1E54D1220;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = &v9;
  objc_msgSend(v3, "performBlockAndWait:", v4);

  if (!*((_BYTE *)v6 + 24))
    objc_msgSend((id)v10[5], "logAndThrow:", 1);
  self->_isObserving = 1;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);

}

- (void)results:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__MTBaseQueryObserver_results___block_invoke;
  v7[3] = &unk_1E54D1148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (NSMutableDictionary)handlers
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_handlers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_handlers, "copy");
  objc_sync_exit(v3);

  return (NSMutableDictionary *)v4;
}

- (id)addResultsChangedHandler:(id)a3
{
  id v4;
  const __CFUUID *v5;
  __CFString *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *handlers;
  void *v9;

  v4 = a3;
  v5 = CFUUIDCreate(0);
  v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  v7 = self->_handlers;
  objc_sync_enter(v7);
  handlers = self->_handlers;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](handlers, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
  return v6;
}

- (void)setPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTBaseQueryObserver_setPredicate___block_invoke;
  v7[3] = &unk_1E54D11F8;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v7);
  if (self->_isObserving)
    -[MTBaseQueryObserver startObserving](self, "startObserving");

}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 background:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MTBaseQueryObserver *v13;

  v8 = a4;
  v9 = a3;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5)
    objc_msgSend(v10, "privateQueueContext");
  else
    objc_msgSend(v10, "mainQueueContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MTBaseQueryObserver initWithEntityName:predicate:managedObjectContext:](self, "initWithEntityName:predicate:managedObjectContext:", v9, v8, v12);
  return v13;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 managedObjectContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  MTBaseQueryObserver *v12;

  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "fetchRequestWithEntityName:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v10);

  objc_msgSend(v11, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  v12 = -[MTBaseQueryObserver initWithFetchRequest:managedObjectContext:](self, "initWithFetchRequest:managedObjectContext:", v11, v9);

  return v12;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[MTBaseQueryObserver initWithEntityName:predicate:sortDescriptors:limit:](self, "initWithEntityName:predicate:sortDescriptors:limit:", a3, a4, a5, 0);
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  MTBaseQueryObserver *v20;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mainOrPrivateContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MTBaseQueryObserver initWithEntityName:predicate:sortDescriptors:limit:batchSize:propertiesToFetch:managedObjectContext:](self, "initWithEntityName:predicate:sortDescriptors:limit:batchSize:propertiesToFetch:managedObjectContext:", v17, v16, v15, a6, a7, v14, v19);

  return v20;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8 managedObjectContext:(id)a9
{
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MTBaseQueryObserver *v21;

  v15 = a8;
  v16 = (void *)MEMORY[0x1E0C97B48];
  v17 = a9;
  v18 = a5;
  v19 = a4;
  objc_msgSend(v16, "fetchRequestWithEntityName:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v19);

  objc_msgSend(v20, "setFetchBatchSize:", a7);
  objc_msgSend(v20, "setSortDescriptors:", v18);

  objc_msgSend(v20, "setFetchLimit:", a6);
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v20, "setReturnsObjectsAsFaults:", 1);
    objc_msgSend(v20, "setPropertiesToFetch:", v15);
  }
  else
  {
    objc_msgSend(v20, "setReturnsObjectsAsFaults:", 0);
  }
  v21 = -[MTBaseQueryObserver initWithFetchRequest:managedObjectContext:](self, "initWithFetchRequest:managedObjectContext:", v20, v17);

  return v21;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  if (!self->_stopCalled
    || self->_isObserving
    || (+[IMLogger sharedLogger](IMLogger, "sharedLogger"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldOverrideCondition:file:", CFSTR("!assertCondition"), CFSTR("/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Query/MTBaseQueryObserver.m")), v3, v4))
  {
    +[IMLogger sharedLogger](IMLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Query/MTBaseQueryObserver.m", 161, CFSTR("%@"), CFSTR("The observer's -[stop] must be called before deallocating. This is a programmer error."));

  }
  v6.receiver = self;
  v6.super_class = (Class)MTBaseQueryObserver;
  -[MTBaseQueryObserver dealloc](&v6, sel_dealloc);
}

- (id)managedObjectContext
{
  return -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
}

void __36__MTBaseQueryObserver_setPredicate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_frc");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v1);

}

- (id)predicate
{
  void *v2;
  void *v3;

  -[NSFetchedResultsController fetchRequest](self->_frc, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSortDescriptors:(id)a3
{
  NSFetchedResultsController *frc;
  id v4;
  id v5;

  frc = self->_frc;
  v4 = a3;
  -[NSFetchedResultsController fetchRequest](frc, "fetchRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v4);

}

- (id)sortDescriptors
{
  void *v2;
  void *v3;

  -[NSFetchedResultsController fetchRequest](self->_frc, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)refetch:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__MTBaseQueryObserver_refetch___block_invoke;
  v6[3] = &unk_1E54D1220;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v6);

  if (!*((_BYTE *)v8 + 24))
    objc_msgSend((id)v12[5], "logAndThrow:", 1);
  -[MTBaseQueryObserver results:](self, "results:", v4);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

}

void __31__MTBaseQueryObserver_refetch___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_frc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "performFetch:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (void)removeResultsChangedHandler:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_handlers;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)stop
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[MTBaseQueryObserver removeAllResultsChangedHandlers](self, "removeAllResultsChangedHandlers");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self->_frc, 0, 0);

  self->_isObserving = 0;
  -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__MTBaseQueryObserver_stop__block_invoke;
  v5[3] = &unk_1E54D0DE0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

  -[MTBaseQueryObserver setStopCalled:](self, "setStopCalled:", 1);
}

void __27__MTBaseQueryObserver_stop__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_frc");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDelegate:", 0);

}

- (void)removeAllResultsChangedHandlers
{
  NSMutableDictionary *obj;

  obj = self->_handlers;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_handlers, "removeAllObjects");
  objc_sync_exit(obj);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)stopCalled
{
  return self->_stopCalled;
}

- (void)setStopCalled:(BOOL)a3
{
  self->_stopCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_frc, 0);
}

@end
