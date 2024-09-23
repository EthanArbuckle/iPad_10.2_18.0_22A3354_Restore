@implementation BKFirstBootDetector

- (BKFirstBootDetector)initWithSystemAppSentinel:(id)a3 firstBootToken:(id)a4 alternateSystemAppManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKFirstBootDetector *v12;
  BKFirstBootDetector *v13;
  NSHashTable *v14;
  NSHashTable *queue_observers;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *queue;
  unsigned __int8 v22;
  NSObject *v23;
  _QWORD v25[4];
  BKFirstBootDetector *v26;
  unsigned __int8 v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)BKFirstBootDetector;
  v12 = -[BKFirstBootDetector init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v13->_lock_firstBootToken, a4);
    objc_storeStrong((id *)&v13->_alternateSystemAppManager, a5);
    v14 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 2);
    queue_observers = v13->_queue_observers;
    v13->_queue_observers = v14;

    v17 = (objc_class *)objc_opt_class(v13, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS(v19, 33);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)SerialWithQoS;

    v22 = objc_msgSend(v10, "isTokenSet");
    v13->_lock_isFirstBoot = v22;
    v23 = v13->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004CDA0;
    v25[3] = &unk_1000EC978;
    v27 = v22;
    v26 = v13;
    dispatch_sync(v23, v25);

  }
  return v13;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendBool:withName:", self->_lock_isFirstBoot, CFSTR("isFirstBoot"));
  v5 = objc_msgSend(v3, "appendObject:withName:", self->_lock_firstBootToken, CFSTR("firstBootToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v6;
}

- (BOOL)isFirstBoot
{
  BKFirstBootDetector *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isFirstBoot;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CD94;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CD88;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)systemShellDidFinishLaunching:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CD7C;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemShellWillBootstrap
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000597D0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First boot: systemShellWillBootstrap", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[BKFirstBootTokenProviding unsetToken](self->_lock_firstBootToken, "unsetToken");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_queue_finishBootingIfNecessaryAndTellObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];

  v3 = a3;
  BSDispatchQueueAssert(self->_queue, a2);
  if (-[BKFirstBootDetector isFirstBoot](self, "isFirstBoot"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel primarySystemShell](self->_systemAppSentinel, "primarySystemShell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAlternateSystemAppManager alternateSystemAppBundleIdentifier](self->_alternateSystemAppManager, "alternateSystemAppBundleIdentifier"));
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
      v8 = objc_msgSend(v7, "isEqualToString:", v6);

      if ((v8 & 1) == 0)
      {
        v9 = sub_1000597D0();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "First boot is finished", buf, 2u);
        }

        os_unfair_lock_lock(&self->_lock);
        -[BKFirstBootTokenProviding unsetToken](self->_lock_firstBootToken, "unsetToken");
        self->_lock_isFirstBoot = 0;
        os_unfair_lock_unlock(&self->_lock);
        if (v3)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_queue_observers, "allObjects"));
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v17;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v17 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "firstBootDetectorDidFinishFirstBoot:", self);
                v15 = (char *)v15 + 1;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
            }
            while (v13);
          }

        }
      }
    }

  }
}

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (void)setSystemAppSentinel:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppSentinel, a3);
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setAlternateSystemAppManager:(id)a3
{
  objc_storeStrong((id *)&self->_alternateSystemAppManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_alternateSystemAppManager, 0);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_lock_firstBootToken, 0);
  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
}

+ (id)sharedInstance
{
  if (qword_100117380 != -1)
    dispatch_once(&qword_100117380, &stru_1000EAD48);
  return (id)qword_100117378;
}

@end
