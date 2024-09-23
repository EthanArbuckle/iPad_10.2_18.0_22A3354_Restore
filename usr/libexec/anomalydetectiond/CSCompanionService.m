@implementation CSCompanionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = a4 + 1;
  if (v5 < (unint64_t)objc_msgSend(v6, "count"))
    objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", v6, v5);

}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_100389428 != -1)
    dispatch_once(&qword_100389428, &stru_100365630);
  return (id)qword_100389420;
}

- (CSCompanionService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCompanionService;
  return -[CSCompanionService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CSCompanionServiceIBProtocol, &OBJC_PROTOCOL___CSCompanionServiceClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  NSHashTable *v4;
  NSHashTable *clients;
  _QWORD v6[5];
  id v7;
  id buf[2];

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v3 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "beginService", (uint8_t *)buf, 2u);
  }
  v4 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 0);
  clients = self->_clients;
  self->_clients = v4;

  _companionCompatibility = 0;
  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002C5CB0;
  v6[3] = &unk_100365798;
  objc_copyWeak(&v7, buf);
  v6[4] = self;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.kappa"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)statusHandler:(BOOL)a3 pairedDevice:(id)a4 timestamp:(double)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v6 = a3;
  v8 = a4;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v9 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "statusHandler", buf, 2u);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSCompanionService clients](self, "clients", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "onCompanionStatusUpdate:pairedDevice:updatedTimestamp:", v6, v8, a5);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

- (void)testTriggerHandler:(double)a3
{
  void *v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSCompanionService clients](self, "clients"));
  v4 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v3);
      if (qword_100387380 != -1)
        dispatch_once(&qword_100387380, &stru_1003657B8);
      v6 = qword_100387388;
      if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "testTriggerHandler", v7, 2u);
      }
      if (!--v4)
      {
        v4 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (!v4)
          break;
      }
    }
  }

}

- (void)messageHandler:(int)a3 data:(id)a4 timestamp:(double)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v9 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "messageHandler", buf, 2u);
  }
  if ((_DWORD)v6 == 11 && !_companionCompatibility)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v10 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Determined that companion is forward compatible", buf, 2u);
    }
    _companionCompatibility = 1;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSCompanionService clients](self, "clients", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "onCompanionMessage:data:receivedTimestamp:", v6, v8, a5);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5
{
  uint64_t v7;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  int v20;

  v7 = *(_QWORD *)&a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v9 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "onCompanionConnectionStatusUpdate %d", buf, 8u);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSCompanionService clients](self, "clients", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "onCompanionConnectionStatusUpdate:cftime:sputime:", v7, a5, a4);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)registerClient:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v5 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "registerClient", v6, 2u);
  }
  -[NSHashTable addObject:](self->_clients, "addObject:", v4);

}

- (void)unregisterClient:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v5 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "unregisterClient", v6, 2u);
  }
  -[NSHashTable removeObject:](self->_clients, "removeObject:", v4);

}

- (BOOL)syncget_isCompanionConnected
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v3 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isCompanionConnected", v5, 2u);
  }
  -[CompanionDelegate updateIDSStatus](self->_delegate, "updateIDSStatus");
  return -[CompanionDelegate isConnected](self->_delegate, "isConnected");
}

- (BOOL)syncget_isCompanionPaired
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  uint8_t v7[16];

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v3 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isCompanionPaired", v7, 2u);
  }
  -[CompanionDelegate updateIDSStatus](self->_delegate, "updateIDSStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompanionDelegate pairedDevice](self->_delegate, "pairedDevice"));
  v5 = objc_msgSend(v4, "isLocallyPaired");

  return v5;
}

- (void)notifyCompanionOfLocalCrash:(id)a3 forMode:(int)a4 martyIsBicycle:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  CompanionDelegate *delegate;
  void *v15;
  _BYTE v16[12];
  uint8_t buf[8];
  uint64_t v18;

  v5 = a5;
  v8 = a3;
  if (!a4)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v13 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "invalid mode", buf, 2u);
    }
    goto LABEL_23;
  }
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v9 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "notifyCompanionOfLocalCrash", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v18 = 0;
  if (v8)
  {
    objc_msgSend(v8, "getUUIDBytes:", buf);
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v10 = (id)qword_100387388;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      *(_DWORD *)v16 = 138412290;
      *(_QWORD *)&v16[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Test UUID bytes %@", v16, 0xCu);

    }
  }
  if (a4 == 1)
  {
    v12 = 6;
LABEL_22:
    delegate = self->_delegate;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 16));
    -[CompanionDelegate sendData:type:](delegate, "sendData:type:", v15, v12);

LABEL_23:
    return;
  }
  if (a4 == 2)
  {
    if (v5)
      v12 = 306;
    else
      v12 = 305;
    goto LABEL_22;
  }
  sub_1002C789C((NSObject **)v16);

  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyCompanion/CSCompanionService.mm", 478, "-[CSCompanionService notifyCompanionOfLocalCrash:forMode:martyIsBicycle:]");
  __break(1u);
}

- (void)notifyCompanionOfForwardMsgCompatibility
{
  NSObject *v3;
  CompanionDelegate *delegate;
  void *v5;
  int v6;
  uint8_t buf[16];

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v3 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "notifyCompanionOfForwardMsgCompatibility", buf, 2u);
  }
  v6 = 1;
  delegate = self->_delegate;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 4));
  -[CompanionDelegate sendData:type:](delegate, "sendData:type:", v5, 11);

}

- (void)queryCompanion:(int)a3
{
  NSObject *v5;
  CompanionDelegate *delegate;
  void *v7;
  int v8;
  uint8_t buf[4];
  int v10;

  v8 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v5 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "queryCompanion type:%d", buf, 8u);
  }
  delegate = self->_delegate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 4));
  -[CompanionDelegate sendData:type:](delegate, "sendData:type:", v7, 9);

}

- (void)returnQueryToCompanion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v5 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "returnQueryToCompanion", v6, 2u);
  }
  -[CompanionDelegate sendData:type:](self->_delegate, "sendData:type:", v4, 10);

}

- (void)sendData:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v7 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sendMessage: type: %d", (uint8_t *)v8, 8u);
  }
  -[CompanionDelegate sendData:type:](self->_delegate, "sendData:type:", v6, v4);

}

- (void)sendTestTrigger
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v3 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendTestTrigger", v4, 2u);
  }
  -[CompanionDelegate sendData:type:](self->_delegate, "sendData:type:", 0, 0);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (CompanionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
