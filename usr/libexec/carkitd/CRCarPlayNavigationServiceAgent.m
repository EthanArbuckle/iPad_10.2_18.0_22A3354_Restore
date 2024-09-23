@implementation CRCarPlayNavigationServiceAgent

- (CRCarPlayNavigationServiceAgent)initWithSessionStatus:(id)a3
{
  id v5;
  CRCarPlayNavigationServiceAgent *v6;
  CRCarPlayNavigationServiceAgent *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  void *v10;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *owners;
  NSMutableArray *v13;
  NSMutableArray *observers;
  void *v15;
  objc_class *v16;
  CRAccNavProvider *v17;
  CRAccNavProvider *accNavProvider;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRCarPlayNavigationServiceAgent;
  v6 = -[CRCarPlayNavigationServiceAgent init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v6->_sessionLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_queue_create("com.apple.carkit.navigationService", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_sessionStatus, a3);
    os_unfair_lock_lock(&v7->_sessionLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](v7->_sessionStatus, "currentSession"));
    -[CRCarPlayNavigationServiceAgent setLock_session:](v7, "setLock_session:", v10);

    os_unfair_lock_unlock(&v7->_sessionLock);
    -[CARSessionStatus addSessionObserver:](v7->_sessionStatus, "addSessionObserver:", v7);
    v11 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    owners = v7->_owners;
    v7->_owners = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v7->_observers;
    v7->_observers = v13;

    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v15 = (void *)qword_1000DB868;
    v25 = qword_1000DB868;
    if (!qword_1000DB868)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10003C6E8;
      v21[3] = &unk_1000B5320;
      v21[4] = &v22;
      sub_10003C6E8((uint64_t)v21);
      v15 = (void *)v23[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v22, 8);
    v17 = (CRAccNavProvider *)objc_msgSend([v16 alloc], "initWithDelegate:", v7);
    accNavProvider = v7->_accNavProvider;
    v7->_accNavProvider = v17;

    v7->_cachedDoWeOwnNavigation = 0;
    v7->_maximumConcurrentNavigationOwners = 0;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  __int128 buf;
  uint64_t v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.carkit.navowners.service"));

  if (v9)
  {
    v10 = CRCarPlayNavigationOwnersServiceInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "setExportedInterface:", v11);

    v12 = CRCarPlayNavigationOwnerClientInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v7, "setRemoteObjectInterface:", v13);

    v14 = sub_100056C84(1uLL);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Receiving navigation ownership connection: %{public}@", (uint8_t *)&buf, 0xCu);
    }
LABEL_14:

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak((id *)&buf, self);
    objc_initWeak(&location, v7);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100039A04;
    v33[3] = &unk_1000B6558;
    objc_copyWeak(&v34, &location);
    objc_copyWeak(&v35, (id *)&buf);
    objc_msgSend(v7, "setInterruptionHandler:", v33);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100039A7C;
    v30[3] = &unk_1000B6558;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, (id *)&buf);
    objc_msgSend(v7, "setInvalidationHandler:", v30);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)&buf);
    v28 = 1;
    goto LABEL_18;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.carkit.navigation.service"));

  v18 = sub_100056C84(1uLL);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Receiving accessory navigation connection: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x2020000000;
    v21 = off_1000DB878;
    v39 = off_1000DB878;
    if (!off_1000DB878)
    {
      v22 = (void *)sub_10003C73C();
      v21 = dlsym(v22, "CRNavigationServiceInterface");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
      off_1000DB878 = v21;
    }
    _Block_object_dispose(&buf, 8);
    if (!v21)
      goto LABEL_19;
    v23 = ((uint64_t (*)(void))v21)();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v7, "setExportedInterface:", v24);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x2020000000;
    v25 = off_1000DB880;
    v39 = off_1000DB880;
    if (!off_1000DB880)
    {
      v26 = (void *)sub_10003C73C();
      v25 = dlsym(v26, "CRNavigationClientInterface");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v25;
      off_1000DB880 = v25;
    }
    _Block_object_dispose(&buf, 8);
    if (!v25)
    {
LABEL_19:
      sub_10006B48C();
      __break(1u);
    }
    v27 = ((uint64_t (*)(void))v25)();
    v15 = objc_claimAutoreleasedReturnValue(v27);
    objc_msgSend(v7, "setRemoteObjectInterface:", v15);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10006D168();

  v28 = 0;
LABEL_18:

  return v28;
}

- (void)_removeConnection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CRCarPlayNavigationServiceAgent *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_100056C84(1uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing owners requested for connection: %{public}@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039C0C;
  v9[3] = &unk_1000B5390;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_navigationOwnershipChangedFromCar:", CARSessionOwnsTurnByTurnNavigationChangedNotification, v4);

  v6 = sub_100056C84(1uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "connected session: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_sessionLock);
  -[CRCarPlayNavigationServiceAgent setLock_session:](self, "setLock_session:", v4);
  os_unfair_lock_unlock(&self->_sessionLock);
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039E34;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v8, block);

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v5 = sub_100056C84(1uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "disconnected session: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_sessionLock);
  -[CRCarPlayNavigationServiceAgent setLock_session:](self, "setLock_session:", 0);
  os_unfair_lock_unlock(&self->_sessionLock);
  v7 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039F60;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)_navigationOwnershipChangedFromCar:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_100056C84(1uLL);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified ownership changed by car", buf, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A05C;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)addNavigationOwnerWithIdentifier:(id)a3
{
  -[CRCarPlayNavigationServiceAgent addNavigationOwnerWithIdentifier:supportsAccNav:](self, "addNavigationOwnerWithIdentifier:supportsAccNav:", a3, 0);
}

- (void)addNavigationOwnerWithIdentifier:(id)a3 supportsAccNav:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A140;
  v11[3] = &unk_1000B6580;
  v11[4] = self;
  v12 = v6;
  v14 = a4;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

- (void)beginObserving
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003A1FC;
    v5[3] = &unk_1000B5390;
    v5[4] = self;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

- (void)removeNavigationOwnerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A300;
  block[3] = &unk_1000B53B8;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)fetchNavigationOwnerWithReply:(id)a3
{
  os_unfair_lock_s *p_sessionLock;
  void *v5;
  id v6;
  void (**v7)(id, id);

  p_sessionLock = &self->_sessionLock;
  v7 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_sessionLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
  v6 = objc_msgSend(v5, "navigationOwner");

  os_unfair_lock_unlock(p_sessionLock);
  v7[2](v7, v6);

}

- (void)fetchNavigationIdentifierWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_sessionLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
  v6 = objc_msgSend(v5, "navigationOwner");

  os_unfair_lock_unlock(&self->_sessionLock);
  if (v6 == (id)1)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003A460;
    v8[3] = &unk_1000B5650;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

- (void)fetchNavigationIdentifiersWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A568;
  v7[3] = &unk_1000B5650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_work_queue_ownersForIdentifier:(id)a3 pid:(int)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v7);

  v9 = (void *)objc_opt_new(NSMutableArray, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003A6A0;
  v16[3] = &unk_1000B65A8;
  v19 = a4;
  v17 = v6;
  v11 = v9;
  v18 = v11;
  v12 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

- (void)_work_queue_addNavigationIdentifer:(id)a3 supportsAccNav:(BOOL)a4 forConnection:(id)a5
{
  _BOOL8 v6;
  _CRAppStateNavigationOwner *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _CRAppStateNavigationOwner *v14;
  id v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  _CRAppStateNavigationOwner *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  _CRAppStateNavigationOwner *v39;
  id v40;
  NSObject *v41;
  void *v42;
  _CRAppStateNavigationOwner *v43;
  _QWORD v44[4];
  _CRAppStateNavigationOwner *v45;
  CRCarPlayNavigationServiceAgent *v46;
  uint8_t buf[4];
  _CRAppStateNavigationOwner *v48;
  __int16 v49;
  const __CFString *v50;

  v6 = a4;
  v8 = (_CRAppStateNavigationOwner *)a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v10);

  if (v8 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", v8, objc_msgSend(v9, "processIdentifier")));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = sub_100056C84(1uLL);
      v14 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
        sub_10006D2B8((uint64_t)v8, v9);
    }
    else
    {
      v14 = objc_alloc_init(_CRAppStateNavigationOwner);
      -[_CRAppStateNavigationOwner setIdentifier:](v14, "setIdentifier:", v8);
      -[_CRAppStateNavigationOwner setConnection:](v14, "setConnection:", v9);
      -[_CRAppStateNavigationOwner setSupportsAccNav:](v14, "setSupportsAccNav:", v6);
      v16 = sub_100056C84(1uLL);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = CFSTR("NO");
        if (v6)
          v18 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v48 = v14;
        v49 = 2114;
        v50 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Adding navigation owner: %{public}@ suportsAccNav: %{public}@", buf, 0x16u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
      objc_msgSend(v19, "addObject:", v14);

      if (!-[CRCarPlayNavigationServiceAgent _work_queue_updateOwnershipToiOSIfNecessary](self, "_work_queue_updateOwnershipToiOSIfNecessary"))
      {
        os_unfair_lock_lock(&self->_sessionLock);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
        v21 = objc_msgSend(v20, "navigationOwner");

        os_unfair_lock_unlock(&self->_sessionLock);
        v22 = sub_100056C84(1uLL);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner identifier](v14, "identifier"));
          v25 = CFSTR("None");
          if (v21 == (id)1)
            v25 = CFSTR("iOS");
          if (v21 == (id)2)
            v25 = CFSTR("Car");
          v26 = v25;
          *(_DWORD *)buf = 138543618;
          v48 = v24;
          v49 = 2114;
          v50 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation owner: %{public}@ ownership is %{public}@", buf, 0x16u);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxy"));
        objc_msgSend(v27, "navigationOwnershipChangedTo:", v21);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
      v29 = objc_msgSend(v28, "count");

      if (v29 > (id)-[CRCarPlayNavigationServiceAgent maximumConcurrentNavigationOwners](self, "maximumConcurrentNavigationOwners"))-[CRCarPlayNavigationServiceAgent setMaximumConcurrentNavigationOwners:](self, "setMaximumConcurrentNavigationOwners:", v29);
      v30 = -[_CRAppStateNavigationOwner supportsAccNav](v14, "supportsAccNav");
      v31 = sub_100056C84(1uLL);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if ((v30 & 1) != 0)
      {
        if (v33)
        {
          *(_DWORD *)buf = 138543362;
          v48 = v8;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Updating new owner with components: %{public}@", buf, 0xCu);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "activeComponents"));
        -[CRCarPlayNavigationServiceAgent _work_queue_updateActiveComponents:forOwner:](self, "_work_queue_updateActiveComponents:forOwner:", v35, v14);
      }
      else
      {
        if (v33)
        {
          *(_DWORD *)buf = 138543362;
          v48 = v8;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Sending app identifier as no ACCNav support after adding: %{public}@", buf, 0xCu);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[_CRAppStateNavigationOwner identifier](v14, "identifier"));
        objc_msgSend(v34, "sendNoSupportForAppIdentifier:", v35);
      }

      v36 = sub_100056C84(1uLL);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v8;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation observers of new arrival: %{public}@", buf, 0xCu);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      objc_msgSend(v38, "postNotificationName:object:", CARNavigationOwnerRequestedNotificationName, v8);

      v39 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent _work_queue_activeNavigationIdentifiers](self, "_work_queue_activeNavigationIdentifiers"));
      v40 = sub_100056C84(1uLL);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v39;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Active navigation owners after addition: %{public}@", buf, 0xCu);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent observers](self, "observers"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10003ACCC;
      v44[3] = &unk_1000B65D0;
      v45 = v39;
      v46 = self;
      v43 = v39;
      objc_msgSend(v42, "enumerateObjectsUsingBlock:", v44);

    }
  }
  else
  {
    v15 = sub_100056C84(1uLL);
    v14 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      sub_10006D324((uint64_t)v8, v9);
  }

}

- (void)_work_queue_removeOwnerWithIdentifier:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unsigned int v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v8);

  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", v6, objc_msgSend(v7, "processIdentifier")));
    v10 = sub_100056C84(1uLL);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v24 = objc_msgSend(v9, "count");
      v25 = 2114;
      v26 = v6;
      v27 = 1024;
      v28 = objc_msgSend(v7, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing %lu owners for %{public}@(%d)", buf, 0x1Cu);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v9;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[CRCarPlayNavigationServiceAgent _work_queue_removeNavigationOwner:](self, "_work_queue_removeNavigationOwner:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v16), (_QWORD)v18);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v17 = sub_100056C84(1uLL);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006D390();
  }

}

- (void)_work_queue_removeNavigationOwnerForConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", 0, objc_msgSend(v4, "processIdentifier")));
  v7 = sub_100056C84(1uLL);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v20 = objc_msgSend(v6, "count");
    v21 = 2114;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing %lu owners for %{public}@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CRCarPlayNavigationServiceAgent _work_queue_removeNavigationOwner:](self, "_work_queue_removeNavigationOwner:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), (_QWORD)v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_work_queue_removeNavigationOwner:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_100056C84(1uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Removing navigation owner: %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  objc_msgSend(v8, "removeObject:", v4);

  -[CRCarPlayNavigationServiceAgent _work_queue_updateNavigationStateForRemoval](self, "_work_queue_updateNavigationStateForRemoval");
  v9 = sub_100056C84(1uLL);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138543362;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Informing navigation observers of released owner: %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v13 = CARNavigationOwnerReleasedNotificationName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v12, "postNotificationName:object:", v13, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
  objc_msgSend(v15, "resetActiveComponents");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));

  if ((objc_msgSend(v17, "supportsAccNav") & 1) != 0)
  {
    v18 = sub_100056C84(1uLL);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Updating new owner with components: %{public}@", buf, 0xCu);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeComponents"));
    -[CRCarPlayNavigationServiceAgent _work_queue_updateActiveComponents:forOwner:](self, "_work_queue_updateActiveComponents:forOwner:", v22, v17);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));

    if (!v23)
      goto LABEL_12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    objc_msgSend(v21, "sendNoSupportForAppIdentifier:", v22);
  }

LABEL_12:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent _work_queue_activeNavigationIdentifiers](self, "_work_queue_activeNavigationIdentifiers"));
  v25 = sub_100056C84(1uLL);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Active navigation owners after removal: %{public}@", buf, 0xCu);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent observers](self, "observers"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003B5FC;
  v29[3] = &unk_1000B65F8;
  v30 = v24;
  v28 = v24;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v29);

}

- (void)_work_queue_navigationOwnershipChangedFromCar
{
  os_unfair_lock_s *p_sessionLock;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const __CFString *v13;

  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
  v5 = objc_msgSend(v4, "navigationOwner");

  os_unfair_lock_unlock(p_sessionLock);
  if (v5 == (id)1)
  {
    v7 = CFSTR("iOS");
  }
  else if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CARNavigationOwnerRequestedNotificationName, CFSTR("OEM"));

    v7 = CFSTR("car");
  }
  else
  {
    v7 = CFSTR("nobody");
  }
  v8 = sub_100056C84(1uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[navigationOwnershipChangedFromCar] Received notification indicating ownership changed to %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B858;
  v11[3] = &unk_1000B6618;
  v11[4] = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

- (BOOL)_work_queue_navigationOwnerExistsForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "identifier"));
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)_work_queue_activeNavigationIdentifiers
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003BB50;
  v8[3] = &unk_1000B6640;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = objc_msgSend(v5, "copy");
  return v6;
}

- (BOOL)_work_queue_doWeHaveOwners
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  LOBYTE(v3) = objc_msgSend(v4, "count") != 0;

  return (char)v3;
}

- (BOOL)_work_queue_updateOwnershipToiOSIfNecessary
{
  NSObject *v3;
  void *v4;
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  int v18;
  void *v19;

  v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock(&self->_sessionLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
  os_unfair_lock_unlock(&self->_sessionLock);
  if (!v4)
  {
    v13 = sub_100056C84(1uLL);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10006D410(v14);
    goto LABEL_13;
  }
  v5 = objc_msgSend(v4, "navigationOwner");
  v6 = -[CRCarPlayNavigationServiceAgent _work_queue_doWeHaveOwners](self, "_work_queue_doWeHaveOwners");
  v7 = sub_100056C84(1uLL);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
    v18 = 138543362;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] Owners: %{public}@", (uint8_t *)&v18, 0xCu);

  }
  if (!v6)
  {
    v15 = sub_100056C84(1uLL);
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] No current navigation owners", (uint8_t *)&v18, 2u);
    }
LABEL_13:

LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v10 = sub_100056C84(1uLL);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)1)
  {
    if (v12)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] iOS already has ownership", (uint8_t *)&v18, 2u);
    }

    goto LABEL_14;
  }
  if (v12)
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] Requesting iOS ownership", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(v4, "requestTurnByTurnOwnership");
  -[CRCarPlayNavigationServiceAgent _work_queue_navigationOwnershipChangedFromCar](self, "_work_queue_navigationOwnershipChangedFromCar");
  v16 = 1;
LABEL_15:

  return v16;
}

- (void)_work_queue_updateNavigationStateForRemoval
{
  os_unfair_lock_s *p_sessionLock;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;

  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent lock_session](self, "lock_session"));
  os_unfair_lock_unlock(p_sessionLock);
  v5 = -[CRCarPlayNavigationServiceAgent _work_queue_doWeHaveOwners](self, "_work_queue_doWeHaveOwners");
  if (!v4)
    goto LABEL_12;
  v6 = objc_msgSend(v4, "navigationOwner");
  v7 = sub_100056C84(1uLL);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
    v14 = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Owners: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v10 = sub_100056C84(1uLL);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6 != (id)1)
  {
    if (v12)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] iOS does not have ownership", (uint8_t *)&v14, 2u);
    }

LABEL_12:
    if ((v5 & 1) != 0)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (v5)
  {
    if (v12)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Holding iOS ownership", (uint8_t *)&v14, 2u);
    }

    goto LABEL_19;
  }
  if (v12)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Releasing iOS ownership", (uint8_t *)&v14, 2u);
  }

  objc_msgSend(v4, "releaseTurnByTurnOwnership");
  -[CRCarPlayNavigationServiceAgent setCachedDoWeOwnNavigation:](self, "setCachedDoWeOwnNavigation:", 0);
LABEL_17:
  if (-[CRCarPlayNavigationServiceAgent maximumConcurrentNavigationOwners](self, "maximumConcurrentNavigationOwners"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v13, "navigationOwnershipEndedWithMaximumConcurrentCount:", -[CRCarPlayNavigationServiceAgent maximumConcurrentNavigationOwners](self, "maximumConcurrentNavigationOwners"));

    -[CRCarPlayNavigationServiceAgent setMaximumConcurrentNavigationOwners:](self, "setMaximumConcurrentNavigationOwners:", 0);
  }
LABEL_19:

}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  CRCarPlayNavigationServiceAgent *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));

  if (v10 == v11)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent accNavProvider](self, "accNavProvider"));
    objc_msgSend(v18, "sendInfo:toComponentUID:", v6, v7);

  }
  else
  {
    v12 = sub_100056C84(1uLL);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_opt_class(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent owners](self, "owners"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v19 = 138543874;
      v20 = self;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ not sent.  NavOwner=%{public}@", (uint8_t *)&v19, 0x20u);

    }
  }

}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (NSMutableOrderedSet)owners
{
  return self->_owners;
}

- (void)setOwners:(id)a3
{
  objc_storeStrong((id *)&self->_owners, a3);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CRAccNavProvider)accNavProvider
{
  return self->_accNavProvider;
}

- (void)setAccNavProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accNavProvider, a3);
}

- (BOOL)cachedDoWeOwnNavigation
{
  return self->_cachedDoWeOwnNavigation;
}

- (void)setCachedDoWeOwnNavigation:(BOOL)a3
{
  self->_cachedDoWeOwnNavigation = a3;
}

- (unint64_t)maximumConcurrentNavigationOwners
{
  return self->_maximumConcurrentNavigationOwners;
}

- (void)setMaximumConcurrentNavigationOwners:(unint64_t)a3
{
  self->_maximumConcurrentNavigationOwners = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (CARSession)lock_session
{
  return self->_lock_session;
}

- (void)setLock_session:(id)a3
{
  objc_storeStrong((id *)&self->_lock_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_session, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accNavProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_owners, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

- (void)session:(id)a3 didUpdateActiveComponents:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CRCarPlayNavigationServiceAgent *v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C374;
  v8[3] = &unk_1000B5390;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)_work_queue_updateActiveComponents:(id)a3 forOwner:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  unsigned int v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CRCarPlayNavigationServiceAgent workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v7, "supportsAccNav"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxy"));
    if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___CRNavigationClient))
      v11 = v10;
    else
      v11 = 0;

    v12 = sub_100056C84(1uLL);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
        v19 = 138543618;
        v20 = v15;
        v21 = 1024;
        v22 = objc_msgSend(v16, "processIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[updateActiveComponents] Informing navigation owner: %{public}@(%d)", (uint8_t *)&v19, 0x12u);

      }
      objc_msgSend(v11, "didUpdateActiveComponents:", v6);
    }
    else
    {
      if (v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
        v19 = 138543618;
        v20 = v17;
        v21 = 1024;
        v22 = objc_msgSend(v18, "processIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[updateActiveComponents] Navigation supports accNav but is not client: %{public}@(%d)", (uint8_t *)&v19, 0x12u);

      }
    }

  }
}

@end
