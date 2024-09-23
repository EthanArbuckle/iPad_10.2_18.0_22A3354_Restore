@implementation NIServerSessionLifeCycleManager

- (void)_watchdogLoop
{
  id v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSUUID *sessionIdentifier;
  NSHashTable *v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  OS_dispatch_queue *updatesQueue;
  OS_dispatch_queue *v18;
  _QWORD *v19;
  double v20;
  NSObject *v21;
  NSUUID *v22;
  NSHashTable *v23;
  id v24;
  uint64_t v25;
  void *k;
  uint64_t v27;
  OS_dispatch_queue *v28;
  NSObject *v29;
  NSUUID *v30;
  NSObject *v31;
  NSUUID *v32;
  id v33;
  uint64_t v34;
  void *m;
  uint64_t v36;
  OS_dispatch_queue *v37;
  NSObject *v38;
  dispatch_time_t v39;
  OS_dispatch_queue *watchdogQueue;
  __int128 v41;
  NSMutableArray *v42;
  int v43;
  NSMutableDictionary *obj;
  uint64_t v45;
  id v46;
  void *i;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[6];
  _QWORD block[6];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[6];
  _QWORD v62[6];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  if (!self->_clientWantsSessionToRun || self->_sessionInvalidated)
    return;
  v42 = objc_opt_new(NSMutableArray);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = self->_nearbyObjectsCache;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  v5 = &unk_100456000;
  if (!v3)
    goto LABEL_50;
  v43 = 0;
  v45 = *(_QWORD *)v68;
  v46 = v3;
  *(_QWORD *)&v4 = 138412546;
  v41 = v4;
  do
  {
    for (i = 0; i != v46; i = (char *)i + 1)
    {
      if (*(_QWORD *)v68 != v45)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nearbyObjectsCache, "objectForKeyedSubscript:", v6, v41));
      objc_msgSend(v48, "latestActivityTimestamp");
      v8 = sub_10000883C() - v7;
      if (objc_msgSend(v48, "latestActivityType"))
      {
        if (objc_msgSend(v48, "latestActivityType") != 1)
          goto LABEL_40;
        if (-[NIServerSessionLifeCycleManager timeoutOnPeerInactivity](self, "timeoutOnPeerInactivity"))
        {
          -[NIServerSessionLifeCycleManager maxInactivityAfterTrackingBeganSeconds](self, "maxInactivityAfterTrackingBeganSeconds");
          if (v8 > v9)
          {
            -[NSMutableArray addObject:](v42, "addObject:", v6);
            v10 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              sessionIdentifier = self->_sessionIdentifier;
              *(_DWORD *)buf = v41;
              v75 = sessionIdentifier;
              v76 = 2112;
              v77 = v6;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#lifecycle,(ses id: %@) TRACKING timed out for %@", buf, 0x16u);
            }
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v12 = self->_observers;
            v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v58;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v58 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                  updatesQueue = self->_updatesQueue;
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_100216E40;
                  block[3] = &unk_1007FA518;
                  block[4] = v16;
                  block[5] = v6;
                  dispatch_async((dispatch_queue_t)updatesQueue, block);
                }
                v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
              }
              while (v13);
            }

            v5 = (_QWORD *)&unk_100456000;
            v18 = self->_updatesQueue;
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_100216E4C;
            v55[3] = &unk_1007FA518;
            v55[4] = self;
            v55[5] = v6;
            v19 = v55;
LABEL_34:
            dispatch_async((dispatch_queue_t)v18, v19);
            goto LABEL_40;
          }
        }
        v31 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        {
          v32 = self->_sessionIdentifier;
          *(_DWORD *)buf = v41;
          v75 = v32;
          v76 = 2112;
          v77 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "#lifecycle,(ses id: %@) TRACKING active for %@", buf, 0x16u);
        }
        ++v43;
      }
      else
      {
        if (-[NIServerSessionLifeCycleManager timeoutOnPeerInactivity](self, "timeoutOnPeerInactivity"))
        {
          -[NIServerSessionLifeCycleManager maxInactivityBeforeTrackingBeganSeconds](self, "maxInactivityBeforeTrackingBeganSeconds");
          if (v8 > v20)
          {
            -[NSMutableArray addObject:](v42, "addObject:", v6);
            v21 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              v22 = self->_sessionIdentifier;
              *(_DWORD *)buf = v41;
              v75 = v22;
              v76 = 2112;
              v77 = v6;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#lifecycle,(ses id: %@) DISCOVERY timed out for %@", buf, 0x16u);
            }
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v23 = self->_observers;
            v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v64;
              do
              {
                for (k = 0; k != v24; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v64 != v25)
                    objc_enumerationMutation(v23);
                  v27 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k);
                  v28 = self->_updatesQueue;
                  v62[0] = _NSConcreteStackBlock;
                  v62[1] = 3221225472;
                  v62[2] = sub_100216DE0;
                  v62[3] = &unk_1007FA518;
                  v62[4] = v27;
                  v62[5] = v6;
                  dispatch_async((dispatch_queue_t)v28, v62);
                }
                v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              }
              while (v24);
            }

            v5 = (_QWORD *)&unk_100456000;
            v18 = self->_updatesQueue;
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_100216DEC;
            v61[3] = &unk_1007FA518;
            v61[4] = self;
            v61[5] = v6;
            v19 = v61;
            goto LABEL_34;
          }
        }
        v29 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        {
          v30 = self->_sessionIdentifier;
          *(_DWORD *)buf = v41;
          v75 = v30;
          v76 = 2112;
          v77 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "#lifecycle,(ses id: %@) DISCOVERY active for %@", buf, 0x16u);
        }
      }
LABEL_40:

    }
    v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  }
  while (v46);

  if (v43 >= 1)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = self->_observers;
    v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v52;
      do
      {
        for (m = 0; m != v33; m = (char *)m + 1)
        {
          if (*(_QWORD *)v52 != v34)
            objc_enumerationMutation(obj);
          v36 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)m);
          v37 = self->_updatesQueue;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100216EA0;
          v50[3] = &unk_1007FB340;
          v50[4] = v36;
          dispatch_async((dispatch_queue_t)v37, v50);
        }
        v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
      }
      while (v33);
    }
LABEL_50:

  }
  if (-[NSMutableArray count](v42, "count"))
  {
    v38 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v42;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#lifecycle,Removing tokens from cache: %@", buf, 0xCu);
    }
    -[NSMutableDictionary removeObjectsForKeys:](self->_nearbyObjectsCache, "removeObjectsForKeys:", v42);
  }
  v39 = dispatch_time(0, 1000000 * self->_cycleRate.__rep_);
  watchdogQueue = self->_watchdogQueue;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = v5[154];
  v49[2] = sub_100216EA8;
  v49[3] = &unk_1007FB340;
  v49[4] = self;
  dispatch_after(v39, (dispatch_queue_t)watchdogQueue, v49);

}

- (NIServerSessionLifeCycleManager)initWithSessionIdentifier:(id)a3 cycleRate:(duration<long)long updatesQueue:()std:(1000>>)a4 :(id)a5 ratio<1 analyticsManager:(id)a6
{
  id v12;
  id v13;
  id v14;
  NIServerSessionLifeCycleManager *v15;
  uint64_t v16;
  NSHashTable *observers;
  dispatch_queue_t v18;
  OS_dispatch_queue *watchdogQueue;
  NSMutableDictionary *v20;
  NSMutableDictionary *nearbyObjectsCache;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  uint8_t buf[4];
  double v35;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_16:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionLifeCycleManager.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updatesQueue"));

    if (v14)
      goto LABEL_4;
    goto LABEL_17;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionLifeCycleManager.mm"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  if (!v13)
    goto LABEL_16;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_17:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionLifeCycleManager.mm"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("analyticsManager"));

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)NIServerSessionLifeCycleManager;
  v15 = -[NIServerSessionLifeCycleManager init](&v33, "init");
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_sessionIdentifier, a3);
    v15->_cycleRate = a4;
    objc_storeStrong((id *)&v15->_updatesQueue, a5);
    v18 = dispatch_queue_create("com.apple.nearbyd.sessionLifeCycleWatchdog", 0);
    watchdogQueue = v15->_watchdogQueue;
    v15->_watchdogQueue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new(NSMutableDictionary);
    nearbyObjectsCache = v15->_nearbyObjectsCache;
    v15->_nearbyObjectsCache = v20;

    objc_storeWeak((id *)&v15->_analyticsManager, v14);
    -[NIServerSessionLifeCycleManager setTimeoutOnPeerInactivity:](v15, "setTimeoutOnPeerInactivity:", 1);
    -[NIServerSessionLifeCycleManager setMaxInactivityAfterTrackingBeganSeconds:](v15, "setMaxInactivityAfterTrackingBeganSeconds:", 60.0);
    -[NIServerSessionLifeCycleManager setMaxInactivityBeforeTrackingBeganSeconds:](v15, "setMaxInactivityBeforeTrackingBeganSeconds:", 120.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v22, "doubleForKey:", CFSTR("MaxInactivityAfterTrackingBeganSeconds"));
    v24 = v23;
    objc_msgSend(v22, "doubleForKey:", CFSTR("MaxInactivityBeforeTrackingBeganSeconds"));
    v26 = v25;
    if (v24 > 0.0)
    {
      v27 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#lifecycle,* MaxInactivityAfterTrackingBeganSeconds from default write: %f", buf, 0xCu);
      }
      -[NIServerSessionLifeCycleManager setMaxInactivityAfterTrackingBeganSeconds:](v15, "setMaxInactivityAfterTrackingBeganSeconds:", v24);
    }
    if (v26 > 0.0)
    {
      v28 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#lifecycle,* MaxInactivityBeforeTrackingBeganSeconds from default write: %f", buf, 0xCu);
      }
      -[NIServerSessionLifeCycleManager setMaxInactivityBeforeTrackingBeganSeconds:](v15, "setMaxInactivityBeforeTrackingBeganSeconds:", v26);
    }

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[NIServerSessionLifeCycleManager _printStats](self, "_printStats");
  v3.receiver = self;
  v3.super_class = (Class)NIServerSessionLifeCycleManager;
  -[NIServerSessionLifeCycleManager dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4;
  _QWORD *v5;
  void *__p[2];
  char v7;
  void **v8;

  v4 = a3;
  sub_10000BF04(__p, "addObserver");
  v8 = __p;
  v5 = sub_1002175EC((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_100472CF8, (__int128 **)&v8);
  ++v5[5];
  if (v7 < 0)
    operator delete(__p[0]);
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  _QWORD *v5;
  void *__p[2];
  char v7;
  void **v8;

  v4 = a3;
  sub_10000BF04(__p, "removeObserver");
  v8 = __p;
  v5 = sub_1002175EC((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_100472CF8, (__int128 **)&v8);
  ++v5[5];
  if (v7 < 0)
    operator delete(__p[0]);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (NSArray)peers
{
  OS_dispatch_queue *watchdogQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1002153E0;
  v10 = sub_1002153F0;
  v11 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002153F8;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)runWithConfigurationCalled
{
  OS_dispatch_queue *watchdogQueue;
  OS_dispatch_queue *v4;
  _QWORD v5[5];
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002154C8;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
  v4 = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100215610;
  v5[3] = &unk_1007FB340;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)v4, v5);
}

- (void)pauseCalled
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215670;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)invalidateCalled
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215814;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)failedToAddPeer
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002159BC;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)failedToRemovePeer
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215B50;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)startedDiscoveringPeersWithTokens:(id)a3
{
  id v4;
  OS_dispatch_queue *watchdogQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215D08;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);

}

- (void)stoppedDiscoveringPeersWithTokens:(id)a3
{
  id v4;
  OS_dispatch_queue *watchdogQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100215ED4;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);

}

- (void)stoppedDiscoveringAllPeers
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002160FC;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)peerLostCallbackReceived:(id)a3
{
  id v4;
  OS_dispatch_queue *watchdogQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002162C4;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);

}

- (void)positioningSensorSessionStarted
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021649C;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)positioningSensorSessionStopped
{
  OS_dispatch_queue *watchdogQueue;
  _QWORD block[5];

  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021663C;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
}

- (void)measurementReceivedForToken:(id)a3 contTimestamp:(double)a4
{
  id v6;
  OS_dispatch_queue *watchdogQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021680C;
  block[3] = &unk_10080F290;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);

}

- (void)peerHangupReceived:(id)a3
{
  id v4;
  OS_dispatch_queue *watchdogQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100216968;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);

}

- (BOOL)isTrackingPeer:(id)a3
{
  id v4;
  OS_dispatch_queue *watchdogQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  watchdogQueue = self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100216AC4;
  block[3] = &unk_10080F2B8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)watchdogQueue, block);
  LOBYTE(watchdogQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)watchdogQueue;
}

- (void)_startMonitoringPeersActivity:(id)a3
{
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NINearbyObject *v10;
  id v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  v4 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = v11;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[PRPeerActivityEntry entryWithActivityType:](PRPeerActivityEntry, "entryWithActivityType:", 0, v11));
        v10 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v8);
        -[NSMutableArray addObject:](v4, "addObject:", v10);
        -[NSMutableDictionary setObject:forKey:](self->_nearbyObjectsCache, "setObject:forKey:", v9, v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_removePeer:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  -[NSMutableDictionary removeObjectForKey:](self->_nearbyObjectsCache, "removeObjectForKey:", v4);

}

- (void)_removeAllPeers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  -[NSMutableDictionary removeAllObjects](self->_nearbyObjectsCache, "removeAllObjects");
}

- (NIServerSessionLifeCycleManager)init
{
  __assert_rtn("-[NIServerSessionLifeCycleManager init]", "NIServerSessionLifeCycleManager.mm", 364, "NO");
}

+ (NIServerSessionLifeCycleManager)new
{
  __assert_rtn("+[NIServerSessionLifeCycleManager new]", "NIServerSessionLifeCycleManager.mm", 369, "NO");
}

- (void)setDiscoveryActive:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  self->_discoveryActive = a3;
}

- (BOOL)isDiscoveryActive
{
  OS_dispatch_queue *watchdogQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100216FD8;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientWantsSessionToRun:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  self->_clientWantsSessionToRun = a3;
}

- (BOOL)doesClientWantSessionToRun
{
  OS_dispatch_queue *watchdogQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002170A8;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPositioningSensorActive:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  self->_positioningSensorActive = a3;
}

- (BOOL)isPositioningSensorActive
{
  OS_dispatch_queue *watchdogQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100217178;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTracking:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  self->_tracking = a3;
}

- (BOOL)isTracking
{
  OS_dispatch_queue *watchdogQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100217248;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSessionInvalidated:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  self->_sessionInvalidated = a3;
}

- (BOOL)isSessionInvalidated
{
  OS_dispatch_queue *watchdogQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  watchdogQueue = self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100217318;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)watchdogQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_printStats
{
  NSMutableString *v3;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *i;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *next;
  NSObject *v6;
  NSUUID *sessionIdentifier;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  NSMutableString *v11;

  v3 = objc_opt_new(NSMutableString);
  for (i = &self->_callCounter.__table_.__p1_;
        ;
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%s : %llu times\n"), next, i[5].__value_.__next_))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
    next = i + 2;
    if (SHIBYTE(i[4].__value_.__next_) < 0)
      next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)next->__value_.__next_;
  }
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = sessionIdentifier;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#lifecycle,\n============================\nStats for session ID %@\n%@\n============================", buf, 0x16u);
  }

}

- (BOOL)timeoutOnPeerInactivity
{
  return self->timeoutOnPeerInactivity;
}

- (void)setTimeoutOnPeerInactivity:(BOOL)a3
{
  self->timeoutOnPeerInactivity = a3;
}

- (double)maxInactivityAfterTrackingBeganSeconds
{
  return self->maxInactivityAfterTrackingBeganSeconds;
}

- (void)setMaxInactivityAfterTrackingBeganSeconds:(double)a3
{
  self->maxInactivityAfterTrackingBeganSeconds = a3;
}

- (double)maxInactivityBeforeTrackingBeganSeconds
{
  return self->maxInactivityBeforeTrackingBeganSeconds;
}

- (void)setMaxInactivityBeforeTrackingBeganSeconds:(double)a3
{
  self->maxInactivityBeforeTrackingBeganSeconds = a3;
}

- (NIServerSessionLifeCycleObserver)observer
{
  return (NIServerSessionLifeCycleObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_analyticsManager);
  sub_10003A4EC((uint64_t)&self->_callCounter);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updatesQueue, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
  objc_storeStrong((id *)&self->_nearbyObjectsCache, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end
