@implementation BKHIDTouchSensitiveButtonScanningController

- (BKHIDTouchSensitiveButtonScanningController)initWithContext:(id)a3
{
  id v4;
  BKHIDTouchSensitiveButtonScanningController *v5;
  BKHIDTouchSensitiveButtonScanningController *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  BKIOHIDServiceMatcher *v11;
  BKIOHIDServiceMatcher *serviceMatcher;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKHIDTouchSensitiveButtonScanningController;
  v5 = -[BKHIDTouchSensitiveButtonScanningController init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.migration", 0, 33, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceMatcherDataProvider"));
    v11 = (BKIOHIDServiceMatcher *)objc_msgSend(v9, "initWithUsagePage:usage:builtIn:dataProvider:", 65280, 102, 1, v10);
    serviceMatcher = v6->_serviceMatcher;
    v6->_serviceMatcher = v11;

    -[BKIOHIDServiceMatcher startObserving:queue:](v6->_serviceMatcher, "startObserving:queue:", v6, v6->_queue);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController](BKIOHIDServicePersistentPropertyController, "touchSensitiveButtonServicePersistentPropertyController"));
    objc_msgSend(v13, "registerHandler:", v6);

  }
  return v6;
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
  _BOOL4 v7;
  os_unfair_lock_s *p_lock;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSMutableIndexSet *v15;
  NSMutableIndexSet *lock_activeCameraButtonScanningPIDs;
  NSMutableDictionary *v17;
  NSMutableDictionary *lock_pidToProcessDeathWatcher;
  _QWORD v19[5];
  int v20;
  BOOL v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = sub_100059844();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (a4 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromBKSHIDTouchSensitiveButtonIdentifier(1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 67109634;
      v23 = v7;
      v24 = 2114;
      v25 = v14;
      v26 = 1024;
      v27 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setScanningActive:%{BOOL}u button:%{public}@ pid:%d", buf, 0x18u);

    }
    if (v7 && !self->_lock_activeCameraButtonScanningPIDs)
    {
      v15 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
      lock_activeCameraButtonScanningPIDs = self->_lock_activeCameraButtonScanningPIDs;
      self->_lock_activeCameraButtonScanningPIDs = v15;

      v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
      self->_lock_pidToProcessDeathWatcher = v17;

    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027354;
    v19[3] = &unk_1000EA470;
    v21 = v7;
    v19[4] = self;
    v20 = a5;
    sub_100026F98((uint64_t)self, v19);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v23 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "setScanningActive: unsupported touch button identifier: %d", buf, 8u);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5;
  NSMutableSet *lock_services;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_services = self->_lock_services;
  if (!lock_services)
  {
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v8 = self->_lock_services;
    self->_lock_services = v7;

    lock_services = self->_lock_services;
  }
  -[NSMutableSet addObjectsFromArray:](lock_services, "addObjectsFromArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventSenderDescriptor build:](BKSHIDEventSenderDescriptor, "build:", &stru_1000EA0C0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController](BKIOHIDServicePersistentPropertyController, "touchSensitiveButtonServicePersistentPropertyController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allPersistentPropertiesForServicesMatchingDescriptor:", v9));

  if (!objc_msgSend(v11, "count"))
  {

    v11 = 0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "addDisappearanceObserver:queue:", self, self->_queue, (_QWORD)v18);
        if (v11)
          objc_msgSend(v17, "setProperties:", v11);
        sub_100027160((uint64_t)self, -[NSMutableIndexSet count](self->_lock_activeCameraButtonScanningPIDs, "count") != 0, v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_lock_services, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "primaryPage") == 65280 && objc_msgSend(v3, "primaryUsage") == 102;

  return v4;
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000272A8;
  v16 = &unk_1000EB380;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("HalfPressThresholdModifier")));
  v17 = v8;
  v18 = &v19;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v13);
  if (*((_BYTE *)v20 + 24))
  {
    v9 = sub_1000599A0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "BKHIDTouchSensitiveButton disallowed persistent properties: %{public}@", buf, 0xCu);
    }

    v11 = 1;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_lock_services, "makeObjectsPerformSelector:withObject:", "asyncSetProperties:", v6, v13, v14, v15, v16);
    os_unfair_lock_unlock(&self->_lock);
    v11 = 2;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (void)processDidTerminate:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_pidToProcessDeathWatcher;
  void *v7;
  _QWORD v8[5];
  int v9;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  -[NSMutableDictionary removeObjectForKey:](lock_pidToProcessDeathWatcher, "removeObjectForKey:", v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026F84;
  v8[3] = &unk_1000EC950;
  v8[4] = self;
  v9 = v3;
  sub_100026F98((uint64_t)self, v8);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_activeCameraButtonScanningPIDs, 0);
  objc_storeStrong((id *)&self->_lock_services, 0);
  objc_storeStrong((id *)&self->_lock_pidToProcessDeathWatcher, 0);
  objc_storeStrong((id *)&self->_serviceMatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
