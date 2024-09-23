@implementation MTBaseProcessor

- (void)results:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  objc_msgSend(v5, "results:", v4);

}

- (void)enqueueWorkBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));

  if (v5)
  {
    v7 = -[MTBaseProcessor isStopping](self, "isStopping");
    if (!v7)
    {
      objc_initWeak(buf, self);
      v12 = objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000306B4;
      v13[3] = &unk_1004A9978;
      objc_copyWeak(&v15, buf);
      v14 = v4;
      dispatch_async(v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    v8 = _MTLogCategoryDefault(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v10 = "Attempting to enqueue work after the processor has stopped.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v11 = _MTLogCategoryDefault(v6);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v10 = "Attempting to enqueue work before processor has been started.";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)isStopping
{
  MTBaseProcessor *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor isStoppingLock](self, "isStoppingLock"));
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_isStopping;
  objc_sync_exit(v3);

  return (char)v2;
}

- (NSObject)isStoppingLock
{
  return self->_isStoppingLock;
}

- (void)setQueryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_queryObserver, a3);
}

- (MTBaseQueryObserver)queryObserver
{
  return self->_queryObserver;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor entityName](self, "entityName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor predicate](self, "predicate"));
  v6 = -[MTSafeUuidQueryObserver initWithEntityName:predicate:](v3, "initWithEntityName:predicate:", v4, v5);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000296CC;
  v9[3] = &unk_1004A9AA8;
  objc_copyWeak(&v10, &location);
  v7 = -[MTSafeUuidQueryObserver addResultsChangedHandler:](v6, "addResultsChangedHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (double)updatePredicateDuration
{
  return 0.0;
}

- (id)defaultPropertiesThatAffectPredicate
{
  return 0;
}

- (BOOL)isRunning
{
  if (self->_workQueue)
    return !-[MTBaseProcessor isStopping](self, "isStopping");
  else
    return 0;
}

+ (id)sharedInstance
{
  NSString *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v3 = NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (id)qword_100567438;
  objc_sync_enter(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100567438, "objectForKey:", v4));
  objc_sync_exit(v5);

  if (!v6)
  {
    v7 = (id)qword_100567438;
    objc_sync_enter(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100567438, "objectForKey:", v4));
    if (!v6)
    {
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___MTBaseProcessor;
      v6 = objc_msgSend(objc_msgSendSuper2(&v9, "allocWithZone:", 0), "init");
      objc_msgSend((id)qword_100567438, "setObject:forKey:", v6, v4);
    }
    objc_sync_exit(v7);

  }
  return v6;
}

- (MTBaseProcessor)init
{
  MTBaseProcessor *v2;
  NSObject *v3;
  NSObject *isStoppingLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTBaseProcessor;
  v2 = -[MTBaseProcessor init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSObject);
    isStoppingLock = v2->_isStoppingLock;
    v2->_isStoppingLock = v3;

    v2->_isStopping = 0;
  }
  return v2;
}

- (BOOL)start
{
  unsigned __int8 v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *workQueue;
  _QWORD v12[5];
  id v13;
  id location;

  v3 = -[MTBaseProcessor isStopping](self, "isStopping");
  if ((v3 & 1) == 0)
  {
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@SerialQueue"), v6));

    v8 = objc_retainAutorelease(v7);
    v9 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    workQueue = self->_workQueue;
    self->_workQueue = v9;

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100030994;
    v12[3] = &unk_1004A9A58;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return v3 ^ 1;
}

+ (void)initialize
{
  if (qword_100567440 != -1)
    dispatch_once(&qword_100567440, &stru_1004A9A30);
}

- (void)stop
{
  void *v3;
  id v4;

  -[MTBaseProcessor setIsStopping:](self, "setIsStopping:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  objc_msgSend(v3, "stop");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor defaultsNotifier](self, "defaultsNotifier"));
  objc_msgSend(v4, "stop");

}

- (void)setIsStopping:(BOOL)a3
{
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor isStoppingLock](self, "isStoppingLock"));
  objc_sync_enter(obj);
  self->_isStopping = a3;
  objc_sync_exit(obj);

}

- (void)updatePredicate
{
  uint64_t v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = _MTLogCategoryDefault(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v10 = 138543362;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updated predicate", (uint8_t *)&v10, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor predicate](self, "predicate"));
  objc_msgSend(v8, "setPredicate:", v9);

}

- (id)entityName
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("entityName must be implemented by subclasses"), 0));
  objc_exception_throw(v2);
}

- (id)predicate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("Predicate must be implemented by subclasses"), 0));
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
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("resulstChanged must be implemented by subclasses"), 0));
  objc_exception_throw(v10);
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
