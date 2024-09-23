@implementation BKTouchDeliveryObservationManager

- (void)_queue_pendUpdate:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = objc_msgSend(v9, "touchIdentifier");
  v5 = objc_msgSend(v9, "contextID");
  v6 = v4;
  v7 = objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToUpdate, "objectForKey:", v4));
  v8 = (void *)v7;
  if (v5 || !v7)
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToUpdate, "setObject:forKey:", v9, v6);

}

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3;
  uint64_t ClientConnectionManager;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = *(_QWORD *)&a3;
  ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientForTaskPort:", v3));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "pid");
  else
    v8 = -1;

  return v8;
}

- (void)_queue_postUpdate:(id)a3 toProcessPID:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  BKTouchObservationClient *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = BKLogTouchDeliveryObserver();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109376;
    v11[1] = objc_msgSend(v6, "touchIdentifier");
    v12 = 1024;
    v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "post update for touch:%X to pid:%d", (uint8_t *)v11, 0xEu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer connectionForPID:](self->_server, "connectionForPID:", v4));
  v10 = (BKTouchObservationClient *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v9));
  if (!v10)
  {
    v10 = -[BKTouchObservationClient initWithConnection:pid:]([BKTouchObservationClient alloc], "initWithConnection:pid:", v9, v4);
    -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:");
  }
  -[BKTouchObservationClient sendTouchUpdate:](v10, "sendTouchUpdate:", v6);

}

- (void)_queue_postUpdate:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSMutableIndexSet *globalTouchObserverPIDs;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  int v24;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = objc_msgSend(v6, "pid");
  v8 = BKLogTouchDeliveryObserver();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v22 = a4;
    v23 = 1024;
    v24 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "touch %X sent to destination pid:%d", buf, 0xEu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToPIDs, "objectForKey:", a4));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100033358;
  v19[3] = &unk_1000EA4C0;
  v19[4] = self;
  v11 = v6;
  v20 = v11;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v19);
  v12 = -[NSMutableIndexSet mutableCopy](self->_globalTouchObserverPIDs, "mutableCopy");
  v13 = v12;
  if (v10)
    objc_msgSend(v12, "removeIndexes:", v10);
  if (v7 >= 1 && objc_msgSend(v13, "count"))
  {
    v14 = objc_msgSend(v11, "copy");
    objc_msgSend(v14, "setTouchIdentifier:", 0);
    globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100018BAC;
    v17[3] = &unk_1000EA4C0;
    v17[4] = self;
    v16 = v14;
    v18 = v16;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](globalTouchObserverPIDs, "enumerateIndexesUsingBlock:", v17);

  }
}

- (void)_queue_postPendingUpdates
{
  BSMutableIntegerMap *touchIdentifierToUpdate;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  touchIdentifierToUpdate = self->_touchIdentifierToUpdate;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018DD8;
  v4[3] = &unk_1000EA498;
  v4[4] = self;
  -[BSMutableIntegerMap enumerateWithBlock:](touchIdentifierToUpdate, "enumerateWithBlock:", v4);
  -[BSMutableIntegerMap removeAllObjects](self->_touchIdentifierToUpdate, "removeAllObjects");
}

- (void)touchDidFinishProcessingTouchCollection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018A14;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  NSObject *queue;
  _QWORD v7[5];
  unsigned int v8;
  BOOL v9;

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018BBC;
  v7[3] = &unk_1000EA470;
  v7[4] = self;
  v8 = a3;
  v9 = a6;
  dispatch_async(queue, v7);
}

- (void)noteTouchUpOccurred:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 clientPort:(unsigned int)a6
{
  NSObject *queue;
  _QWORD block[5];
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B94;
  block[3] = &unk_1000EA428;
  block[4] = self;
  v8 = a6;
  v9 = a3;
  v10 = a5;
  v11 = a4;
  dispatch_async(queue, block);
}

+ (id)sharedInstance
{
  if (qword_100117268 != -1)
    dispatch_once(&qword_100117268, &stru_1000EA400);
  return (id)qword_100117260;
}

- (BKTouchDeliveryObservationManager)init
{
  BKTouchDeliveryObservationManager *v2;
  BSMutableIntegerMap *v3;
  BSMutableIntegerMap *touchIdentifierToPIDs;
  BSMutableIntegerMap *v5;
  BSMutableIntegerMap *touchIdentifierToUpdate;
  uint64_t v7;
  NSMutableIndexSet *globalTouchObserverPIDs;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  id v11;
  OS_dispatch_queue *v12;
  uint64_t v13;
  void *v14;
  BKHIDDomainServiceServer *v15;
  BKHIDDomainServiceServer *server;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKTouchDeliveryObservationManager;
  v2 = -[BKTouchDeliveryObservationManager init](&v18, "init");
  if (v2)
  {
    v3 = objc_opt_new(BSMutableIntegerMap);
    touchIdentifierToPIDs = v2->_touchIdentifierToPIDs;
    v2->_touchIdentifierToPIDs = v3;

    v5 = objc_opt_new(BSMutableIntegerMap);
    touchIdentifierToUpdate = v2->_touchIdentifierToUpdate;
    v2->_touchIdentifierToUpdate = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    globalTouchObserverPIDs = v2->_globalTouchObserverPIDs;
    v2->_globalTouchObserverPIDs = (NSMutableIndexSet *)v7;

    v9 = dispatch_queue_create("com.apple.backboard.BKTouchDeliveryObservationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc((Class)BKHIDDomainServiceServer);
    v12 = v2->_queue;
    v13 = BKLogTouchDeliveryObserver(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (BKHIDDomainServiceServer *)objc_msgSend(v11, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", v2, v2, &OBJC_PROTOCOL___BKSTouchDeliveryObservationService_IPC, &OBJC_PROTOCOL___BKSTouchDeliveryObserving_IPC, BKSTouchDeliveryObservationBSServiceName, v12, v14, BKObserveTouchDeliveryObservingEntitlement);
    server = v2->_server;
    v2->_server = v15;

    -[BKHIDDomainServiceServer activate](v2->_server, "activate");
  }
  return v2;
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  signed int v9;
  BSMutableIntegerMap *touchIdentifierToPIDs;
  _QWORD v11[4];
  signed int v12;
  uint8_t buf[4];
  id v14;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = BKLogTouchDeliveryObserver(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "terminate %{public}@", buf, 0xCu);
  }

  v9 = objc_msgSend(v5, "pid");
  -[NSMutableIndexSet removeIndex:](self->_globalTouchObserverPIDs, "removeIndex:", v9);
  touchIdentifierToPIDs = self->_touchIdentifierToPIDs;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100033510;
  v11[3] = &unk_1000EA448;
  v12 = v9;
  -[BSMutableIntegerMap enumerateWithBlock:](touchIdentifierToPIDs, "enumerateWithBlock:", v11);

}

- (void)setObservesAllTouches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  unsigned int v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteProcess"));

  v7 = objc_msgSend(v6, "pid");
  v8 = BKLogTouchDeliveryObserver(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v10;
    v15 = 1024;
    v16 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "process:%{public}@ (ctx:%{public}@) observes all touches:%{BOOL}u", (uint8_t *)&v11, 0x1Cu);

  }
  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesGlobalTouches:](self, "_queue_setProcessPID:observesGlobalTouches:", v7, objc_msgSend(v4, "BOOLValue"));

}

- (void)setObservesTouch:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteProcess"));

  v10 = objc_msgSend(v9, "pid");
  v11 = objc_msgSend(v7, "unsignedIntValue");
  v12 = BKLogTouchDeliveryObserver(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109632;
    v14[1] = (_DWORD)v10;
    v15 = 1024;
    v16 = objc_msgSend(v6, "BOOLValue");
    v17 = 1024;
    v18 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "pid:%d observes touch:%{BOOL}u identifier:%X", (uint8_t *)v14, 0x14u);
  }

  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesTouch:withIdentifier:](self, "_queue_setProcessPID:observesTouch:withIdentifier:", v10, objc_msgSend(v6, "BOOLValue"), v11);
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  BKTouchDeliveryObservationManager *v12;
  unsigned int v13;

  v6 = a4;
  v7 = objc_msgSend(v6, "copy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033368;
  block[3] = &unk_1000ECDF8;
  v11 = v7;
  v12 = self;
  v13 = a3;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)_queue_setProcessPID:(int)a3 observesTouch:(BOOL)a4 withIdentifier:(unsigned int)a5
{
  _BOOL4 v5;
  BOOL v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToPIDs, "objectForKey:", a5));
  if (v9)
    v8 = 1;
  else
    v8 = !v5;
  if (!v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToPIDs, "setObject:forKey:");
  }
  if (v5)
    objc_msgSend(v9, "addIndex:", a3);
  else
    objc_msgSend(v9, "removeIndex:", a3);

}

- (void)_queue_setProcessPID:(int)a3 observesGlobalTouches:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableIndexSet *globalTouchObserverPIDs;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
  if (v4)
    -[NSMutableIndexSet addIndex:](globalTouchObserverPIDs, "addIndex:", a3);
  else
    -[NSMutableIndexSet removeIndex:](globalTouchObserverPIDs, "removeIndex:", a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_globalTouchObserverPIDs, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToUpdate, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToPIDs, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
