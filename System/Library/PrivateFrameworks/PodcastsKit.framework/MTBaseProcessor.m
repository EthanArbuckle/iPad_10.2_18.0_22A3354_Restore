@implementation MTBaseProcessor

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
}

void __29__MTBaseProcessor_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_instanceMap;
  _instanceMap = (uint64_t)v0;

}

+ (id)sharedInstance
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_instanceMap;
  objc_sync_enter(v4);
  objc_msgSend((id)_instanceMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  if (!v5)
  {
    v6 = (id)_instanceMap;
    objc_sync_enter(v6);
    objc_msgSend((id)_instanceMap, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___MTBaseProcessor;
      v5 = (void *)objc_msgSend(objc_msgSendSuper2(&v8, sel_allocWithZone_, 0), "init");
      objc_msgSend((id)_instanceMap, "setObject:forKey:", v5, v3);
    }
    objc_sync_exit(v6);

  }
  return v5;
}

- (MTBaseProcessor)init
{
  MTBaseProcessor *v2;
  uint64_t v3;
  NSObject *isStoppingLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTBaseProcessor;
  v2 = -[MTBaseProcessor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    isStoppingLock = v2->_isStoppingLock;
    v2->_isStoppingLock = v3;

    v2->_isStopping = 0;
  }
  return v2;
}

- (BOOL)start
{
  BOOL v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *workQueue;
  _QWORD v12[5];
  id v13;
  id location;

  v3 = -[MTBaseProcessor isStopping](self, "isStopping");
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@SerialQueue"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    workQueue = self->_workQueue;
    self->_workQueue = v9;

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __24__MTBaseProcessor_start__block_invoke;
    v12[3] = &unk_24FD62748;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return !v3;
}

void __24__MTBaseProcessor_start__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id WeakRetained;
  NSObject *v9;
  dispatch_source_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  MTDefaultsChangeNotifier *v16;
  void *v17;
  MTDefaultsChangeNotifier *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  id v25;
  _QWORD handler[4];
  id v27;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "createQueryObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueryObserver:", v3);

  objc_msgSend(v2, "queryObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startObserving");

  objc_msgSend(v2, "updatePredicateDuration");
  v6 = v5;
  v7 = MEMORY[0x24BDAC760];
  if (fabs(v5) > 2.22044605e-16)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v9);
    objc_msgSend(v2, "setTimer:", v10);

    v11 = dispatch_walltime(0, 0);
    objc_msgSend(v2, "timer");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v12, v11, (unint64_t)(v6 * 1000000000.0), 0);

    objc_msgSend(v2, "timer");
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __24__MTBaseProcessor_start__block_invoke_2;
    handler[3] = &unk_24FD626F8;
    objc_copyWeak(&v27, (id *)(a1 + 40));
    dispatch_source_set_event_handler(v13, handler);

    objc_msgSend(v2, "timer");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v14);

    objc_destroyWeak(&v27);
  }
  objc_msgSend(v2, "defaultPropertiesThatAffectPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = [MTDefaultsChangeNotifier alloc];
    objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSettingsUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MTDefaultsChangeNotifier initWithProperties:defaults:](v16, "initWithProperties:defaults:", v15, v17);
    objc_msgSend(v2, "setDefaultsNotifier:", v18);

    objc_msgSend(v2, "defaultsNotifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v22 = 3221225472;
    v23 = __24__MTBaseProcessor_start__block_invoke_3;
    v24 = &unk_24FD62720;
    objc_copyWeak(&v25, (id *)(a1 + 40));
    objc_msgSend(v19, "addCallback:", &v21);

    objc_msgSend(v2, "defaultsNotifier", v21, v22, v23, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "start");

    objc_destroyWeak(&v25);
  }

}

void __24__MTBaseProcessor_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePredicate");

}

void __24__MTBaseProcessor_start__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __24__MTBaseProcessor_start__block_invoke_4;
  v12[3] = &unk_24FD626F8;
  objc_copyWeak(&v13, v10);
  objc_msgSend(WeakRetained, "enqueueWorkBlock:", v12);

  objc_destroyWeak(&v13);
}

void __24__MTBaseProcessor_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePredicate");

}

- (void)stop
{
  void *v3;
  id v4;

  -[MTBaseProcessor setIsStopping:](self, "setIsStopping:", 1);
  -[MTBaseProcessor queryObserver](self, "queryObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[MTBaseProcessor defaultsNotifier](self, "defaultsNotifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (BOOL)isStopping
{
  MTBaseProcessor *v2;
  void *v3;

  v2 = self;
  -[MTBaseProcessor isStoppingLock](self, "isStoppingLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_isStopping;
  objc_sync_exit(v3);

  return (char)v2;
}

- (void)setIsStopping:(BOOL)a3
{
  id obj;

  -[MTBaseProcessor isStoppingLock](self, "isStoppingLock");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  self->_isStopping = a3;
  objc_sync_exit(obj);

}

- (BOOL)isRunning
{
  if (self->_workQueue)
    return !-[MTBaseProcessor isStopping](self, "isStopping");
  else
    return 0;
}

- (id)createQueryObserver
{
  MTSafeUuidQueryObserver *v3;
  void *v4;
  void *v5;
  MTSafeUuidQueryObserver *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = [MTSafeUuidQueryObserver alloc];
  -[MTBaseProcessor entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTBaseProcessor predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTBaseQueryObserver initWithEntityName:predicate:](v3, "initWithEntityName:predicate:", v4, v5);

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__MTBaseProcessor_createQueryObserver__block_invoke;
  v9[3] = &unk_24FD62770;
  objc_copyWeak(&v10, &location);
  v7 = -[MTSafeUuidQueryObserver addResultsChangedHandler:](v6, "addResultsChangedHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __38__MTBaseProcessor_createQueryObserver__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__MTBaseProcessor_createQueryObserver__block_invoke_2;
  v15[3] = &unk_24FD625A0;
  objc_copyWeak(&v19, v10);
  v12 = v7;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  objc_msgSend(WeakRetained, "enqueueWorkBlock:", v15);

  objc_destroyWeak(&v19);
}

void __38__MTBaseProcessor_createQueryObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "resultsChangedWithDeletedIds:insertIds:updatedIds:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updatePredicate
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _MTLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_22FB0C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated predicate", (uint8_t *)&v8, 0xCu);

  }
  -[MTBaseProcessor queryObserver](self, "queryObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTBaseProcessor predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

}

- (double)updatePredicateDuration
{
  return 0.0;
}

- (id)entityName
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("entityName must be implemented by subclasses"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)predicate
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Predicate must be implemented by subclasses"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("resulstChanged must be implemented by subclasses"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

- (void)results:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTBaseProcessor queryObserver](self, "queryObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results:", v4);

}

- (id)defaultPropertiesThatAffectPredicate
{
  return 0;
}

- (void)enqueueWorkBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id buf[2];

  v4 = a3;
  -[MTBaseProcessor workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[MTBaseProcessor isStopping](self, "isStopping"))
    {
      objc_initWeak(buf, self);
      -[MTBaseProcessor workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __36__MTBaseProcessor_enqueueWorkBlock___block_invoke;
      v9[3] = &unk_24FD62798;
      objc_copyWeak(&v11, buf);
      v10 = v4;
      dispatch_async(v8, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    _MTLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v7 = "Attempting to enqueue work after the processor has stopped.";
LABEL_7:
      _os_log_impl(&dword_22FB0C000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    _MTLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v7 = "Attempting to enqueue work before processor has been started.";
      goto LABEL_7;
    }
  }

LABEL_10:
}

void __36__MTBaseProcessor_enqueueWorkBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_msgSend(WeakRetained, "isStopping"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_10;
    }
    _MTLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = "Attempting to execute work after the processor has stopped.";
      v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_22FB0C000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    _MTLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Attempting to execute work after the processor has been deallocated.";
      v6 = buf;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (MTBaseQueryObserver)queryObserver
{
  return self->_queryObserver;
}

- (void)setQueryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_queryObserver, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsNotifier, a3);
}

- (NSObject)isStoppingLock
{
  return self->_isStoppingLock;
}

- (void)setIsStoppingLock:(id)a3
{
  objc_storeStrong((id *)&self->_isStoppingLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStoppingLock, 0);
  objc_storeStrong((id *)&self->_defaultsNotifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queryObserver, 0);
}

@end
