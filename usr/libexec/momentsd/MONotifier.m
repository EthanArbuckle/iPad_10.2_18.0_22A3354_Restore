@implementation MONotifier

+ (BOOL)isAvailable
{
  if (isAvailable_pred != -1)
    dispatch_once(&isAvailable_pred, &__block_literal_global_25);
  return isAvailable_available;
}

void __25__MONotifier_isAvailable__block_invoke(id a1)
{
  isAvailable_available = 1;
}

- (id)queue
{
  return self->_queue;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unint64_t)observerCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __27__MONotifier_observerCount__block_invoke;
  v5[3] = &unk_1002B2A98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__MONotifier_observerCount__block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedPayload, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (MONotifier)initWithName:(id)a3
{
  id v4;
  MONotifier *v5;
  __CFString *v6;
  NSMutableArray *v7;
  NSMutableArray *dispatchers;
  NSMutableDictionary *v9;
  NSMutableDictionary *persistedPayload;
  __CFString *v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  MONotifier *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MONotifier;
  v5 = -[MONotifier init](&v19, "init");
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "length"))
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.momentsd:%@"), v4));
    else
      v6 = CFSTR("com.apple.momentsd:anonymous");
    v5->_enabled = 0;
    v7 = objc_opt_new(NSMutableArray);
    dispatchers = v5->_dispatchers;
    v5->_dispatchers = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    persistedPayload = v5->_persistedPayload;
    v5->_persistedPayload = v9;

    v11 = objc_retainAutorelease(v6);
    v12 = (const char *)-[__CFString UTF8String](v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)notify:(int)a3 withPayload:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__MONotifier_MODerivedNotifierUtility__notify_withPayload___block_invoke;
  block[3] = &unk_1002B2AC0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

void __59__MONotifier_MODerivedNotifierUtility__notify_withPayload___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);
        v8 = objc_msgSend(*(id *)(a1 + 40), "copy", (_QWORD)v9);
        objc_msgSend(v7, "onNotification:withPayload:", *(unsigned int *)(a1 + 48), v8);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)notifyAndPersist:(int)a3 withPayload:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__MONotifier_MODerivedNotifierUtility__notifyAndPersist_withPayload___block_invoke;
  block[3] = &unk_1002B2AC0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __69__MONotifier_MODerivedNotifierUtility__notifyAndPersist_withPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "notify:withPayload:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  objc_msgSend(v2, "setObject:forKey:", v4, v3);

}

- (void)registerDispatcher:(id)a3 forNotification:(int)a4
{
  id v7;
  NSObject *queue;
  id os_log;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  int v15;

  v7 = a3;
  queue = self->_queue;
  if (!queue)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MONotifier(MODispatcherUtility) registerDispatcher:forNotification:].cold.1();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MONotifier.m"), 117, CFSTR("Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)"), "-[MONotifier(MODispatcherUtility) registerDispatcher:forNotification:]", 117);

    queue = self->_queue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MONotifier_MODispatcherUtility__registerDispatcher_forNotification___block_invoke;
  block[3] = &unk_1002B2AC0;
  block[4] = self;
  v14 = v7;
  v15 = a4;
  v12 = v7;
  dispatch_sync(queue, block);

}

void __70__MONotifier_MODispatcherUtility__registerDispatcher_forNotification___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(v3 + 16), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "onObserverCountChange:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    v3 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      if (!*(_BYTE *)(v3 + 32))
      {
        *(_BYTE *)(v3 + 32) = 1;
        objc_msgSend(*(id *)(a1 + 32), "onEnable");
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  v5 = *(void **)(v3 + 24);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "copy");
    objc_msgSend(*(id *)(a1 + 40), "onNotification:withPayload:", *(unsigned int *)(a1 + 48), v8);

    v7 = v9;
  }

}

- (void)unregisterDispatcher:(id)a3
{
  id v5;
  NSObject *queue;
  id os_log;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  queue = self->_queue;
  if (!queue)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MONotifier(MODispatcherUtility) unregisterDispatcher:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MONotifier.m"), 137, CFSTR("Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)"), "-[MONotifier(MODispatcherUtility) unregisterDispatcher:]", 137);

    queue = self->_queue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __56__MONotifier_MODispatcherUtility__unregisterDispatcher___block_invoke;
  block[3] = &unk_1002AD508;
  block[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_sync(queue, block);

}

id __56__MONotifier_MODispatcherUtility__unregisterDispatcher___block_invoke(uint64_t a1)
{
  id result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "onObserverCountChange:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    if (!result)
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v3 + 32))
      {
        *(_BYTE *)(v3 + 32) = 0;
        return objc_msgSend(*(id *)(a1 + 32), "onDisable");
      }
    }
  }
  return result;
}

@end
