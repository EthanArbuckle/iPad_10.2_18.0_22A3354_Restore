@implementation CARConnectionTimeServiceAgent

- (CARConnectionTimeServiceAgent)initWithUserDefaults:(id)a3 sessionStatus:(id)a4
{
  id v7;
  id v8;
  CARConnectionTimeServiceAgent *v9;
  CARConnectionTimeServiceAgent *v10;
  uint64_t v11;
  NSString *sessionUUIDString;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *connectionTimeQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CARConnectionTimeServiceAgent;
  v9 = -[CARConnectionTimeServiceAgent init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_sessionStatus, a4);
    -[CARSessionStatus addSessionObserver:](v10->_sessionStatus, "addSessionObserver:", v10);
    v11 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v10->_userDefaults, "stringForKey:", CFSTR("CARConnectionTimeSessionUUIDKey")));
    sessionUUIDString = v10->_sessionUUIDString;
    v10->_sessionUUIDString = (NSString *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.carkit.connectionTimeQueue", v14);
    connectionTimeQueue = v10->_connectionTimeQueue;
    v10->_connectionTimeQueue = (OS_dispatch_queue *)v15;

    v10->_wasPairing = 0;
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v16;
  _BYTE v17[18];
  __int16 v18;
  void *v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.carconnectiontime")));
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = CarConnectionTimeLogging();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
      v16 = 138412802;
      *(_QWORD *)v17 = v5;
      *(_WORD *)&v17[8] = 2112;
      *(_QWORD *)&v17[10] = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Receiving connection %@ to service %@ from %@", (uint8_t *)&v16, 0x20u);

    }
    v13 = objc_msgSend((id)objc_opt_class(self), "_CARConnectionServiceInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v5, "setExportedInterface:", v14);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
  }
  else
  {
    if (v10)
    {
      v16 = 67109378;
      *(_DWORD *)v17 = objc_msgSend(v5, "processIdentifier");
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = CFSTR("com.apple.private.carkit.carconnectiontime");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Process %i does not have entitlement %@", (uint8_t *)&v16, 0x12u);
    }

  }
  return v7;
}

+ (id)_CARConnectionServiceInterface
{
  if (qword_1000DB8A0 != -1)
    dispatch_once(&qword_1000DB8A0, &stru_1000B6E30);
  return (id)qword_1000DB898;
}

- (void)clearHistoricalConnectionDataWithReply:(id)a3
{
  id v4;
  NSObject *connectionTimeQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionTimeQueue = self->_connectionTimeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000496CC;
  v7[3] = &unk_1000B5650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionTimeQueue, v7);

}

- (void)fetchConnectionSessions:(id)a3
{
  id v4;
  NSObject *connectionTimeQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionTimeQueue = self->_connectionTimeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004977C;
  v7[3] = &unk_1000B5650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionTimeQueue, v7);

}

- (void)setAllowUnlimitedConnectionEvents:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (-[CARConnectionTimeServiceAgent allowUnlimitedConnectionEvents](self, "allowUnlimitedConnectionEvents") != a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CARPrototypePref allowUnlimitedConnectionEvents](CARPrototypePref, "allowUnlimitedConnectionEvents"));
    objc_msgSend(v4, "setInternalSettingsState:", v3);

  }
}

- (BOOL)allowUnlimitedConnectionEvents
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref allowUnlimitedConnectionEvents](CARPrototypePref, "allowUnlimitedConnectionEvents"));
  v3 = objc_msgSend(v2, "internalSettingsState");

  return v3;
}

- (void)setAllowSessionDurationRecordingEvents:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (-[CARConnectionTimeServiceAgent allowSessionDurationRecordingEvents](self, "allowSessionDurationRecordingEvents") != a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CARPrototypePref allowSessionDurationRecordingEvents](CARPrototypePref, "allowSessionDurationRecordingEvents"));
    objc_msgSend(v4, "setInternalSettingsState:", v3);

  }
}

- (BOOL)allowSessionDurationRecordingEvents
{
  int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = CRIsInternalInstall(self);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref allowSessionDurationRecordingEvents](CARPrototypePref, "allowSessionDurationRecordingEvents"));
    v4 = objc_msgSend(v3, "internalSettingsState");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)sortedConnectionEvents
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARConnectionTimeServiceAgent userDefaults](self, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayForKey:", CFSTR("CARConnectionTimeEventStoreKey")));

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000B6EB0));

  }
  else
  {
    v5 = (void *)objc_opt_new(NSArray, v4);
  }
  return v5;
}

- (void)recordConnectionEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionTimeQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionTimeQueue = self->_connectionTimeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A244;
  block[3] = &unk_1000B6D08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(connectionTimeQueue, block);

}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];

  v4 = -[CARConnectionTimeServiceAgent allowSessionDurationRecordingEvents](self, "allowSessionDurationRecordingEvents", a3);
  if ((_DWORD)v4 && (v4 = CRIsInternalInstall(v4), (_DWORD)v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", CFSTR("CARSessionDidDisconnectEvent"), 4, v5, 0));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004AD18;
    v10[3] = &unk_1000B5F30;
    v10[4] = self;
    -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](self, "recordConnectionEvent:completion:", v6, v10);

  }
  else
  {
    v7 = CarConnectionTimeLogging(v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session disconnected, clearing current session identifier if any.", v9, 2u);
    }

    -[CARConnectionTimeServiceAgent setSessionUUIDString:](self, "setSessionUUIDString:", 0);
  }
  self->_wasPairing = 0;
}

- (void)setSessionUUIDString:(id)a3
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSObject *v7;
  NSString *sessionUUIDString;
  uint8_t v9[16];

  v4 = (NSString *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = CarConnectionTimeLogging(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting session identifier", v9, 2u);
    }

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v5, CFSTR("CARConnectionTimeSessionUUIDKey"));
  }
  else
  {
    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("CARConnectionTimeSessionUUIDKey"));
  }
  sessionUUIDString = self->_sessionUUIDString;
  self->_sessionUUIDString = v5;

}

- (void)eraseConnectionData
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarConnectionTimeLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Erasing Connection Time measurement data", v5, 2u);
  }

  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("CARConnectionTimeSessionUUIDKey"));
  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("CARConnectionTimeEventStoreKey"));
}

- (void)_addConnectionData:(id)a3 toReconnectArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  void *v11;
  NSString *sessionUUIDString;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSString *v35;

  v6 = a3;
  v7 = a4;
  v8 = CarConnectionTimeLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventDate"));
    sessionUUIDString = self->_sessionUUIDString;
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = sessionUUIDString;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Recording CarConnectionEvent: %@ with date %@ and identifier %@", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryRepresentation"));
  v14 = objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARConnectionTimeServiceAgent sessionUUIDString](self, "sessionUUIDString"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CAREventIdentifier);

  objc_msgSend(v7, "insertObject:atIndex:", v14, 0);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004B1F0;
  v28[3] = &unk_1000B6ED8;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -2592000.0));
  v16 = v29;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v28));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v17));

  if (-[CARConnectionTimeServiceAgent allowUnlimitedConnectionEvents](self, "allowUnlimitedConnectionEvents")
    || (unint64_t)objc_msgSend(v18, "count") < 0x15)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[CARConnectionTimeServiceAgent userDefaults](self, "userDefaults"));
    objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("CARConnectionTimeEventStoreKey"));
  }
  else
  {
    v19 = objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "removeObjectsInRange:", 20, (char *)objc_msgSend(v19, "count") - 20);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CARConnectionTimeServiceAgent userDefaults](self, "userDefaults"));
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("CARConnectionTimeEventStoreKey"));

    v22 = CarConnectionTimeLogging(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (char *)objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v24 - 20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Trimmed connection events: %lu", buf, 0xCu);
    }

  }
  v26 = CarConnectionTimeLogging(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Wrote CARConnectionEvent array to disk", buf, 2u);
  }

}

- (NSString)sessionUUIDString
{
  return self->_sessionUUIDString;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (OS_dispatch_queue)connectionTimeQueue
{
  return self->_connectionTimeQueue;
}

- (void)setConnectionTimeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimeQueue, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (BOOL)wasPairing
{
  return self->_wasPairing;
}

- (void)setWasPairing:(BOOL)a3
{
  self->_wasPairing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_connectionTimeQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_sessionUUIDString, 0);
}

@end
