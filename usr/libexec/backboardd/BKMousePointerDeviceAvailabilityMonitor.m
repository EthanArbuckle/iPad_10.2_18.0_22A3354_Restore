@implementation BKMousePointerDeviceAvailabilityMonitor

- (NSArray)deviceServices
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray copy](self->_activeServices, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BKMousePointerDeviceAvailabilityMonitor)init
{
  BKMousePointerDeviceAvailabilityMonitor *v2;
  BKMousePointerDeviceAvailabilityMonitor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  id v7;
  void *v8;
  BKIOHIDServiceMatcher *v9;
  BKIOHIDServiceMatcher *hidServiceMatcher;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v12.receiver = self;
  v12.super_class = (Class)BKMousePointerDeviceAvailabilityMonitor;
  v2 = -[BKMousePointerDeviceAvailabilityMonitor init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.backboard.BKMousePointerDeviceAvailabilityMonitor.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v13[0] = CFSTR("DeviceUsagePage");
    v13[1] = CFSTR("DeviceUsage");
    v14[0] = &off_1000F7318;
    v14[1] = &off_1000F7330;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    v7 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v9 = (BKIOHIDServiceMatcher *)objc_msgSend(v7, "initWithMatchingDictionary:dataProvider:", v6, v8);
    hidServiceMatcher = v3->_hidServiceMatcher;
    v3->_hidServiceMatcher = v9;

    -[BKIOHIDServiceMatcher startObserving:queue:](v3->_hidServiceMatcher, "startObserving:queue:", v3, v3->_queue);
  }
  return v3;
}

- (void)dealloc
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  -[BKIOHIDServiceMatcher invalidate](self->_hidServiceMatcher, "invalidate");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_activeServices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "removeDisappearanceObserver:", self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BKMousePointerDeviceAvailabilityMonitor;
  -[BKMousePointerDeviceAvailabilityMonitor dealloc](&v8, "dealloc");
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSMutableArray *activeServices;
  NSMutableArray *v14;
  NSMutableArray *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  v6 = -[NSMutableArray count](self->_activeServices, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
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
        if (objc_msgSend(v12, "serviceStatus", (_QWORD)v16) == (id)1
          && (-[NSMutableArray containsObject:](self->_activeServices, "containsObject:", v12) & 1) == 0)
        {
          activeServices = self->_activeServices;
          if (!activeServices)
          {
            v14 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
            v15 = self->_activeServices;
            self->_activeServices = v14;

            activeServices = self->_activeServices;
          }
          -[NSMutableArray addObject:](activeServices, "addObject:", v12);
          objc_msgSend(v12, "addDisappearanceObserver:queue:", self, self->_queue);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if ((v6 != 0) == (-[NSMutableArray count](self->_activeServices, "count") == 0))
    -[BKMousePointerDeviceAvailabilityMonitor _locked_notifyObserversDidChangeAvailability](self, "_locked_notifyObserversDidChangeAvailability");
  -[BKMousePointerDeviceAvailabilityMonitor _locked_notifyObserversDidAddDevices:](self, "_locked_notifyObserversDidAddDevices:", v7, (_QWORD)v16);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)serviceDidDisappear:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *activeServices;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "removeDisappearanceObserver:", self);
  if (-[NSMutableArray containsObject:](self->_activeServices, "containsObject:", v4))
  {
    -[NSMutableArray removeObject:](self->_activeServices, "removeObject:", v4);
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[BKMousePointerDeviceAvailabilityMonitor _locked_notifyObserversDidRemoveDevices:](self, "_locked_notifyObserversDidRemoveDevices:", v5);

    if (!-[NSMutableArray count](self->_activeServices, "count"))
    {
      activeServices = self->_activeServices;
      self->_activeServices = 0;

      -[BKMousePointerDeviceAvailabilityMonitor _locked_notifyObserversDidChangeAvailability](self, "_locked_notifyObserversDidChangeAvailability");
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)hasDeviceAvailable
{
  BKMousePointerDeviceAvailabilityMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_activeServices, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  _BKMousePointerDeviceAvailabilityMonitorObserverContext *v8;
  NSMutableArray *observerContexts;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BKMousePointerDeviceAvailabilityMonitor *v16;
  _QWORD block[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[_BKMousePointerDeviceAvailabilityMonitorObserverContext initWithObserver:queue:]([_BKMousePointerDeviceAvailabilityMonitorObserverContext alloc], "initWithObserver:queue:", v6, v7);
  observerContexts = self->_observerContexts;
  if (!observerContexts)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11 = self->_observerContexts;
    self->_observerContexts = v10;

    observerContexts = self->_observerContexts;
  }
  -[NSMutableArray addObject:](observerContexts, "addObject:", v8);
  if (-[NSMutableArray count](self->_activeServices, "count"))
  {
    if ((objc_opt_respondsToSelector(v6, "mousePointerIOHIDServicesAdded:") & 1) != 0)
    {
      v12 = -[NSMutableArray copy](self->_activeServices, "copy");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100032574;
      block[3] = &unk_1000ECD80;
      v18 = v6;
      v19 = v12;
      v13 = v12;
      dispatch_async(v7, block);

    }
    if ((objc_opt_respondsToSelector(v6, "mousePointerDeviceAvailabilityMonitorDidChangeAvailability:") & 1) != 0)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100032580;
      v14[3] = &unk_1000ECD80;
      v15 = v6;
      v16 = self;
      dispatch_async(v7, v14);

    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSMutableArray *observerContexts;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSMutableArray copy](self->_observerContexts, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "observer"));

        if (v11 == v4)
          -[NSMutableArray removeObject:](self->_observerContexts, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (!-[NSMutableArray count](self->_observerContexts, "count"))
  {
    observerContexts = self->_observerContexts;
    self->_observerContexts = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_locked_notifyObserversDidChangeAvailability
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  _BOOL4 v22;

  os_unfair_lock_assert_owner(&self->_lock);
  v5 = BKLogMousePointer(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSMutableArray count](self->_activeServices, "count") != 0;
    *(_DWORD *)buf = 67109120;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "now available: %{BOOL}u", buf, 8u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_observerContexts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100032520;
        v15[3] = &unk_1000ECD80;
        v15[4] = v13;
        v15[5] = self;
        dispatch_async(v14, v15);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_locked_notifyObserversDidAddDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = BKLogMousePointer(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "devices added: %{public}@", buf, 0xCu);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_observerContexts;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000324CC;
        v16[3] = &unk_1000ECD80;
        v16[4] = v14;
        v17 = v4;
        dispatch_async(v15, v16);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)_locked_notifyObserversDidRemoveDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = BKLogMousePointer(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "devices removed: %{public}@", buf, 0xCu);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_observerContexts;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100032478;
        v16[3] = &unk_1000ECD80;
        v16[4] = v14;
        v17 = v4;
        dispatch_async(v15, v16);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerContexts, 0);
  objc_storeStrong((id *)&self->_hidServiceMatcher, 0);
  objc_storeStrong((id *)&self->_activeServices, 0);
}

@end
