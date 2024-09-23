@implementation NDApplication

- (void)setCurrentRequestDelay:(double)a3
{
  self->_currentRequestDelay = a3;
}

- (void)invokeSelectorForAllObservers:(SEL)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F91C;
  v7[3] = &unk_1000B2440;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (id)springboardApplicationWithBundleIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NDSpringBoardApplication *v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(NDApplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70D0, "objectForKeyedSubscript:", v3));

  if (!v6)
  {
    v7 = -[NDSpringBoardApplication initWithIdentifier:]([NDSpringBoardApplication alloc], "initWithIdentifier:", v3);
    objc_msgSend((id)qword_1000C70D0, "setObject:forKeyedSubscript:", v7, v3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70D0, "objectForKeyedSubscript:", v3));
  objc_sync_exit(v5);

  return v8;
}

- (void)addObserver:(id)a3
{
  id v4;
  NDApplication *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray addObject:](obj->_observers, "addObject:", v4);

  objc_sync_exit(obj);
}

- (double)currentRequestDelay
{
  return self->_currentRequestDelay;
}

- (void)setIsInTransitionalDiscretionaryPeriod:(BOOL)a3
{
  self->isInTransitionalDiscretionaryPeriod = a3;
}

- (void)removeObserver:(id)a3
{
  NDApplication *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray indexOfObject:](v4->_observers, "indexOfObject:", v6);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](v4->_observers, "removeObjectAtIndex:", v5);
  objc_sync_exit(v4);

}

- (NDApplication)initWithIdentifier:(id)a3
{
  id v5;
  NDApplication *v6;
  NDApplication *v7;
  uint64_t v8;
  NSMutableArray *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NDApplication;
  v6 = -[NDApplication init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;

    v7->isInTransitionalDiscretionaryPeriod = 0;
  }

  return v7;
}

- (id)containerURL
{
  return 0;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (BOOL)supportsWakes
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  LOBYTE(self) = objc_msgSend(v3, "canLaunchProcessWithIdentifier:", self->_bundleIdentifier);

  return (char)self;
}

- (BOOL)maySupportWakesLater
{
  uint64_t v2;

  v2 = objc_opt_class(self);
  return v2 == objc_opt_class(NDApplication);
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  id v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSString *v17;
  id v18;

  v6 = a3;
  v7 = self->_bundleIdentifier;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10004AD58;
  v16 = &unk_1000B23F0;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  objc_msgSend(v8, "performWake:uponNotification:sessionIdentifier:", &v13, self->_bundleIdentifier, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection", v13, v14, v15, v16));
  objc_msgSend(v11, "launchProcessWithIdentifier:sessionIdentifier:", v9, v10);

  return 1;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 0;
}

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)canBeSuspended
{
  return 0;
}

- (BOOL)hasBackgroundTaskCompletion
{
  return 0;
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  return 0;
}

- (void)invokeSelectorForAllObservers:(SEL)a3 pid:(int)a4
{
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[6];
  int v10;

  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004ABF8;
  block[3] = &unk_1000B1940;
  block[4] = self;
  block[5] = a3;
  v10 = a4;
  dispatch_async(v8, block);

}

- (BOOL)backgroundUpdatesEnabled
{
  return 1;
}

- (void)_onqueue_resetRequestDelay
{
  NSObject *v3;
  NSString *bundleIdentifier;
  int v5;
  NSString *v6;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v5 = 138412290;
    v6 = bundleIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Resetting request delay for %@", (uint8_t *)&v5, 0xCu);
  }
  -[NDApplication setCurrentRequestDelay:](self, "setCurrentRequestDelay:", 0.0);
}

- (BOOL)isInTransitionalDiscretionaryPeriod
{
  return self->isInTransitionalDiscretionaryPeriod;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (void)initialize
{
  if (qword_1000C70E0 != -1)
    dispatch_once(&qword_1000C70E0, &stru_1000B1918);
}

+ (NDApplication)applicationWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(NDApplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v3));

  if (!v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(NDApplication)), "initWithIdentifier:", v3);
    objc_msgSend((id)qword_1000C70C8, "setObject:forKeyedSubscript:", v7, v3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v3));
  objc_sync_exit(v5);

  return (NDApplication *)v8;
}

+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  v5 = objc_msgSend(v4, "identifierIsForSpringBoardApplication:", v3);

  return v5;
}

+ (id)chronoKitExtensionWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NDChronoKitExtension *v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(NDApplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70D8, "objectForKeyedSubscript:", v3));

  if (!v6)
  {
    v7 = -[NDApplication initWithIdentifier:]([NDChronoKitExtension alloc], "initWithIdentifier:", v3);
    objc_msgSend((id)qword_1000C70D8, "setObject:forKeyedSubscript:", v7, v3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70D8, "objectForKeyedSubscript:", v3));
  objc_sync_exit(v5);

  return v8;
}

+ (id)cloudContainerWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NDCloudContainer *v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class(NDApplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v3));

  if (!v6)
  {
    v7 = -[NDCloudContainer initWithIdentifier:]([NDCloudContainer alloc], "initWithIdentifier:", v3);
    objc_msgSend((id)qword_1000C70C8, "setObject:forKeyedSubscript:", v7, v3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v3));
  objc_sync_exit(v5);

  return v8;
}

+ (id)fileProviderWithIdentifer:(id)a3 applicationIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NDFPProvider *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(NDApplication);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v5));

  if (!v9)
  {
    v10 = -[NDFPProvider initWithIdentifier:applicationIdentifier:]([NDFPProvider alloc], "initWithIdentifier:applicationIdentifier:", v5, v6);
    objc_msgSend((id)qword_1000C70C8, "setObject:forKeyedSubscript:", v10, v5);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C70C8, "objectForKeyedSubscript:", v5));
  objc_sync_exit(v8);

  return v11;
}

@end
