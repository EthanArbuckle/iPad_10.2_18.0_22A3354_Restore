@implementation CRWirelessSessionAssertionManager

- (CRWirelessSessionAssertionManager)initWithSessionStatus:(id)a3 connectionTimeServiceAgent:(id)a4 messagingConnector:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRWirelessSessionAssertionManager *v12;
  CRWirelessSessionAssertionManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRWirelessSessionAssertionManager;
  v12 = -[CRWirelessSessionAssertionManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionStatus, a3);
    objc_msgSend(v9, "addSessionObserver:", v13);
    objc_storeStrong((id *)&v13->_connectionTimeService, a4);
    objc_storeStrong((id *)&v13->_messagingConnector, a5);
    -[CRWirelessSessionAssertionManager setTimeoutTimer:](v13, "setTimeoutTimer:", 0);
    -[CRWirelessSessionAssertionManager setProcessTransaction:](v13, "setProcessTransaction:", 0);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CRWirelessSessionAssertionManager setSessionStatus:](self, "setSessionStatus:", 0);
  -[CRWirelessSessionAssertionManager stopTimeoutTimer](self, "stopTimeoutTimer");
  -[CRWirelessSessionAssertionManager setProcessTransaction:](self, "setProcessTransaction:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRWirelessSessionAssertionManager;
  -[CRWirelessSessionAssertionManager dealloc](&v3, "dealloc");
}

- (void)startTimeoutTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "assertion manager starting re-evaluation timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessSessionAssertionManager timeoutTimer](self, "timeoutTimer"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "handleTimeout:", 0, 0, 60.0));
    -[CRWirelessSessionAssertionManager setTimeoutTimer:](self, "setTimeoutTimer:", v6);

  }
}

- (void)stopTimeoutTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessSessionAssertionManager timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v3, "invalidate");

  -[CRWirelessSessionAssertionManager setTimeoutTimer:](self, "setTimeoutTimer:", 0);
}

- (void)handleTimeout:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessSessionAssertionManager sessionStatus](self, "sessionStatus", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));

  if (v5
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration")),
        v8 = objc_msgSend(v7, "transportType"),
        v7,
        v8 == (id)3))
  {
    v9 = CarGeneralLogging(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006E8F4(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    v18 = CarGeneralLogging(v6);
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006E8C0(v10, v19, v20, v21, v22, v23, v24, v25);
  }

  -[CRWirelessSessionAssertionManager stopWaitingForConnection](self, "stopWaitingForConnection");
}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CARConnectionTimeServiceAgent *connectionTimeService;
  _QWORD v11[5];
  const __CFString *v12;
  void *v13;

  if (a3 == 3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000564C0;
    v11[3] = &unk_1000B51B8;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRWirelessSessionAssertionManager _descriptionForTransportType:](CRWirelessSessionAssertionManager, "_descriptionForTransportType:", a3));
  v6 = CARCarKitTransportEvent;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = CFSTR("transportType");
  v13 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v6, 4, v7, v8));

  connectionTimeService = self->_connectionTimeService;
  if (connectionTimeService)
    -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](connectionTimeService, "recordConnectionEvent:completion:", v9, &stru_1000B74D0);

}

+ (id)_descriptionForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1000B74F0 + a3 - 1);
}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[7];

  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000565B4;
    block[3] = &unk_1000B51B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRWirelessSessionAssertionManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056638;
  v5[3] = &unk_1000B5390;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRWirelessSessionAssertionManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056730;
  v5[3] = &unk_1000B5390;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)startWaitingForConnection
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;

  v3 = (void *)os_transaction_create("com.apple.carkit.active-session.process");
  v4 = CarGeneralLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "opening 'com.apple.carkit.active-session' transaction %@", (uint8_t *)&v6, 0xCu);
  }

  -[CRWirelessSessionAssertionManager setProcessTransaction:](self, "setProcessTransaction:", v3);
  -[CRWirelessSessionAssertionManager startTimeoutTimer](self, "startTimeoutTimer");

}

- (void)stopWaitingForConnection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRWirelessSessionAssertionManager processTransaction](self, "processTransaction"));

  if (v3)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "closing 'com.apple.carkit.active-session' transaction", v7, 2u);
    }

  }
  -[CRWirelessSessionAssertionManager setProcessTransaction:](self, "setProcessTransaction:", 0);
  -[CRWirelessSessionAssertionManager stopTimeoutTimer](self, "stopTimeoutTimer");
}

- (CRSessionStoredVehicleProviding)storedVehicleProvider
{
  return (CRSessionStoredVehicleProviding *)objc_loadWeakRetained((id *)&self->_storedVehicleProvider);
}

- (void)setStoredVehicleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_storedVehicleProvider, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (OS_os_transaction)processTransaction
{
  return self->_processTransaction;
}

- (void)setProcessTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_processTransaction, a3);
}

- (CARConnectionTimeServiceAgent)connectionTimeService
{
  return self->_connectionTimeService;
}

- (CARMessagingServiceConnector)messagingConnector
{
  return self->_messagingConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingConnector, 0);
  objc_storeStrong((id *)&self->_connectionTimeService, 0);
  objc_storeStrong((id *)&self->_processTransaction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_destroyWeak((id *)&self->_storedVehicleProvider);
}

@end
