@implementation RPApplicationStateMonitor

- (RPApplicationStateMonitor)init
{
  RPApplicationStateMonitor *v2;
  id v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPApplicationStateMonitor;
  v2 = -[RPApplicationStateMonitor init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)BKSApplicationStateMonitor);
    -[RPApplicationStateMonitor setApplicationStateMonitor:](v2, "setApplicationStateMonitor:", v3);

    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[RPApplicationStateMonitor setObservers:](v2, "setObservers:", v4);

    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[RPApplicationStateMonitor setPreviousState:](v2, "setPreviousState:", v5);

    -[RPApplicationStateMonitor setSystemObserver:](v2, "setSystemObserver:", 0);
  }
  return v2;
}

- (void)addObserver:(id)a3 processIdentifier:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationInfoForPID:", v4));

  v10 = BKSApplicationStateKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", BKSApplicationStateKey));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog(CFSTR("%s processIdentifier %i userInfo %@ previousState %@"), "-[RPApplicationStateMonitor addObserver:processIdentifier:]", v4, v17, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v10));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog(CFSTR("%s processIdentifier %i BKSApplicationStateKey %@ previousState %@"), "-[RPApplicationStateMonitor addObserver:processIdentifier:]", v4, v15, v16);

  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (void)removeObserverWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (void)addSystemObserver:(id)a3
{
  -[RPApplicationStateMonitor setSystemObserver:](self, "setSystemObserver:", a3);
  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (void)removeSystemObserver
{
  -[RPApplicationStateMonitor setSystemObserver:](self, "setSystemObserver:", 0);
  -[RPApplicationStateMonitor observersCountDidChange](self, "observersCountDidChange");
}

- (int64_t)observersCount
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
  if (v5)
    v6 = (int64_t)v4 + 1;
  else
    v6 = (int64_t)v4;

  return v6;
}

- (void)observersCountDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  if (-[RPApplicationStateMonitor observersCount](self, "observersCount") >= 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handler"));

    if (!v4)
    {
      objc_initWeak(&location, self);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_10001A5BC;
      v13 = &unk_100081600;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v5, "setHandler:", &v10);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor", v10, v11, v12, v13));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[RPApplicationStateMonitor observersCount](self, "observersCount");

    if (v9)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor applicationStateMonitor](self, "applicationStateMonitor"));
    objc_msgSend(v6, "setHandler:", 0);
  }

}

- (void)applicationStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
  NSLog(CFSTR("%s userInfo %@ previousState %@"), "-[RPApplicationStateMonitor applicationStateDidChange:]", v8, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
  if (v5)
    -[RPApplicationStateMonitor handleApplicationStateChange:](self, "handleApplicationStateChange:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:](self, "notifyInAppSessionShouldPauseOrResume:", v8);

}

- (void)handleApplicationStateChange:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BKSApplicationStateAppIsFrontmostKey));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = v10;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BKSApplicationStateDisplayIDKey));
    v8 = (void *)SBSCopyFrontmostApplicationDisplayIdentifier();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor systemObserver](self, "systemObserver"));
      objc_msgSend(v9, "frontmostApplicationDidChange:", v7);

    }
    v6 = v10;
  }

}

- (void)notifyInAppSessionShouldPauseOrResume:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", BKSApplicationStateProcessIDKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor observers](self, "observers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  NSLog(CFSTR("%s processIdentifer %@ observer nonnil %i"), "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v5, v7 != 0);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", BKSApplicationStateKey));
    v9 = objc_msgSend(v8, "unsignedIntValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v5));
    v12 = objc_msgSend(v11, "unsignedIntValue");

    NSLog(CFSTR("%s state %i previousState %i"), "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v9, v12);
    if ((_DWORD)v9 == 8)
    {
      if ((_DWORD)v12 != 8)
      {
        NSLog(CFSTR("%s calling clientApplicationDidEnterForeground"), "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
        objc_msgSend(v7, "clientApplicationDidEnterForeground");
      }
    }
    else if ((_DWORD)v12 == 8)
    {
      NSLog(CFSTR("%s calling clientApplicationDidEnterBackground"), "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
      objc_msgSend(v7, "clientApplicationDidEnterBackground");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v5);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPApplicationStateMonitor previousState](self, "previousState"));
    NSLog(CFSTR("%s state %i previousState %@"), "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v9, v15);

  }
}

- (BOOL)isApplicationInForegroundWithBundleIdentifier:(id)a3
{
  return (-[BKSApplicationStateMonitor applicationStateForApplication:](self->_applicationStateMonitor, "applicationStateForApplication:", a3) >> 3) & 1;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (RPSystemStateObserver)systemObserver
{
  return self->_systemObserver;
}

- (void)setSystemObserver:(id)a3
{
  objc_storeStrong((id *)&self->_systemObserver, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableDictionary)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_previousState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemObserver, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
}

@end
