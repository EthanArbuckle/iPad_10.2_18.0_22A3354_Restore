@implementation BKTouchDeliveryPolicyServer

- (BOOL)shouldCancelTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4
{
  void *v6;
  void *v7;
  unsigned __int8 v8;
  _QWORD v10[5];
  unsigned int v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008250;
  v10[3] = &unk_1000ED2A0;
  v11 = a3;
  *(double *)&v10[4] = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reducePolicyToObjectWithBlock:", v10));
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (id)filterDestinations:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  id v23;
  id obj;
  void *v26;
  _QWORD v27[4];
  id v28;
  _DWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  _BYTE v40[128];

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 8);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    while (1)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_DWORD **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v10);
        v13 = BKLogTouchDeliveryPolicy();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          if (v12)
          {
            v19 = v12[2];
            if (v11)
              goto LABEL_16;
LABEL_22:
            v20 = 0;
          }
          else
          {
            v19 = 0;
            if (!v11)
              goto LABEL_22;
LABEL_16:
            v20 = v11[2];
          }
          *(_DWORD *)buf = 67109376;
          v35 = v19;
          v36 = 1024;
          v37 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "host %X -> child %X", buf, 0xEu);
        }

        if (v11)
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1000081BC;
          v27[3] = &unk_1000ED200;
          v8 = v11;
          v28 = v8;
          v29 = v12;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "reducePolicyToObjectWithBlock:", v27));
          v16 = objc_msgSend(v15, "BOOLValue");
          v17 = BKLogTouchDeliveryPolicy();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            if (v12)
              v21 = v12[2];
            else
              v21 = 0;
            v22 = v8[2];
            *(_DWORD *)buf = 67109632;
            v35 = v21;
            v36 = 1024;
            v37 = v22;
            v38 = 1024;
            v39 = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%X -> %X: %{BOOL}u", buf, 0x14u);
          }

          if (!v16)
          {

            goto LABEL_27;
          }
          objc_msgSend(v5, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = v12;

        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      v7 = v23;
      if (!v23)
      {
LABEL_27:

        break;
      }
    }
  }

  return v5;
}

- (BKSTouchDeliveryPolicy)_policy
{
  return (BKSTouchDeliveryPolicy *)objc_getProperty(self, a2, 32, 1);
}

+ (id)sharedServer
{
  if (qword_100117630 != -1)
    dispatch_once(&qword_100117630, &stru_1000ED070);
  return (id)qword_100117628;
}

- (BKTouchDeliveryPolicyServer)init
{
  BKTouchDeliveryPolicyServer *v2;
  uint64_t v3;
  BKSTouchDeliveryPolicy *policy;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  NSMutableSet *v7;
  NSMutableSet *assertionConnections;
  id v9;
  NSXPCListener *v10;
  NSXPCListener *listener;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKTouchDeliveryPolicyServer;
  v2 = -[BKTouchDeliveryPolicyServer init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKSTouchDeliveryPolicy policyByCombiningPolicies:](BKSTouchDeliveryPolicy, "policyByCombiningPolicies:", &__NSArray0__struct));
    policy = v2->_policy;
    v2->_policy = (BKSTouchDeliveryPolicy *)v3;

    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.TouchDeliveryPolicyServer"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    assertionConnections = v2->_assertionConnections;
    v2->_assertionConnections = v7;

    v9 = objc_alloc((Class)NSXPCListener);
    v10 = (NSXPCListener *)objc_msgSend(v9, "initWithMachServiceName:", BKSTouchDeliveryPolicyServerMachServiceName);
    listener = v2->_listener;
    v2->_listener = v10;

    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_queue);
    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKTouchDeliveryPolicyServer;
  -[BKTouchDeliveryPolicyServer dealloc](&v3, "dealloc");
}

- (void)run
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;

  v5 = a4;
  v6 = BKLogTouchDeliveryPolicy();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = BSProcessDescriptionForPID(objc_msgSend(v5, "processIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TDPS server connection from %{public}@", (uint8_t *)&v12, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BKSTouchDeliveryPolicyServerInterface));
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "_setQueue:", self->_queue);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v6 = a3;
  v7 = a4;
  if (sel_isEqual((SEL)objc_msgSend(v7, "selector"), "ipc_addPolicy:"))
  {
    v20 = 0;
    objc_msgSend(v7, "getArgument:atIndex:", &v20, 2);
    v8 = v20;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100096868;
    v18 = &unk_1000ED128;
    v9 = v6;
    v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reducePolicyToObjectWithBlock:", &v15));
    if (objc_msgSend(v10, "BOOLValue", v15, v16, v17, v18))
    {
      objc_msgSend(v7, "invoke");
    }
    else
    {
      v11 = BKLogTouchDeliveryPolicy();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = BSProcessDescriptionForPID(objc_msgSend(v9, "processIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "not allowing %{public}@ to include policies because it does not have appropriate permissions", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(v7, "invoke");
  }

}

- (void)ipc_addPolicy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000964D0;
  v11[3] = &unk_1000ED128;
  v11[4] = self;
  v5 = objc_msgSend(v4, "reducePolicyToObjectWithBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "policyIncludingPolicy:", v4));
  -[BKTouchDeliveryPolicyServer _queue_setPolicy:](self, "_queue_setPolicy:", v7);

  v8 = BKLogTouchDeliveryPolicy();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryPolicyServer _policy](self, "_policy"));
    *(_DWORD *)buf = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "TDPS server got new policy %{public}@, [self _policy] is now %{public}@", buf, 0x16u);

  }
}

- (void)_queue_setPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
