@implementation CLAvengerScannerClientController

- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5
{
  NSMutableDictionary *v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSMutableDictionary *v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v21[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "requestCount");
  v22[0] = a3;
  v21[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "client");
  v22[1] = a4;
  v21[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "scanType");
  v22[2] = a5;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v10 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    *(_DWORD *)buf = 68289538;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = v11;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitClientRequestsEvent\", \"ClientId\":%{public, location:escape_only}s, \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10152F7AC;
  v12[3] = &unk_10215F370;
  v12[4] = v9;
  AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.avengerscanner.clientrequests"), v12);
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  NSObject *v5;
  const char *v6;
  int v7;
  double v8;
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *i;
  id v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  void *context;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t buf;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v5 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    buf = 68289539;
    v32 = 2082;
    v33 = "";
    v34 = 2082;
    v35 = v6;
    v36 = 2049;
    v37 = objc_msgSend(a4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didDiscoverMultiplePeripherals\", \"ClientId\":%{public, location:escape_only}s, \"peripheralsCount\":%{private}lu}", (uint8_t *)&buf, 0x26u);
  }
  context = objc_autoreleasePoolPush();
  if (-[NSDate isEqualToDate:](-[CLAvengerScannerClientController lastScanBufferEmptyDate](self, "lastScanBufferEmptyDate"), "isEqualToDate:", +[NSDate distantPast](NSDate, "distantPast")))
  {
    v7 = -1;
  }
  else
  {
    -[NSDate timeIntervalSinceDate:](+[NSDate now](NSDate, "now"), "timeIntervalSinceDate:", -[CLAvengerScannerClientController lastScanBufferEmptyDate](self, "lastScanBufferEmptyDate"));
    v7 = (int)v8;
  }
  HIDWORD(v19) = v7;
  -[CLAvengerScannerClientController setLastScanBufferEmptyDate:](self, "setLastScanBufferEmptyDate:", +[NSDate now](NSDate, "now"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v22 = 0;
    v23 = 0;
    v21 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(a4);
        v15 = -[CLAvengerScannerClientController parseAndNotifyDelegateOnDiscoveredPeripheral:RSSI:](self, "parseAndNotifyDelegateOnDiscoveredPeripheral:RSSI:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementData")), objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("kCBMsgArgRssi")));
        if (v15)
        {
          v16 = v15;
          v17 = objc_msgSend(v15, "isNearOwner");
          v18 = objc_msgSend(v16, "isPosh");
          if (v17)
          {
            ++v11;
            if (v18 && objc_msgSend(v16, "isApple"))
            {
              ++HIDWORD(v22);
            }
            else if ((objc_msgSend(v16, "isPosh") & 1) != 0
                   || !objc_msgSend(v16, "isApple"))
            {
              if (objc_msgSend(v16, "isPosh"))
                HIDWORD(v23) += objc_msgSend(v16, "isApple") ^ 1;
            }
            else
            {
              LODWORD(v21) = v21 + 1;
            }
          }
          else
          {
            ++v12;
            if (v18 && objc_msgSend(v16, "isApple"))
            {
              LODWORD(v22) = v22 + 1;
            }
            else if ((objc_msgSend(v16, "isPosh") & 1) != 0
                   || !objc_msgSend(v16, "isApple"))
            {
              if (objc_msgSend(v16, "isPosh"))
                LODWORD(v23) = v23 + (objc_msgSend(v16, "isApple") ^ 1);
            }
            else
            {
              ++HIDWORD(v21);
            }
          }
        }
      }
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v21 = 0;
    v11 = 0;
    v12 = 0;
  }
  LODWORD(v19) = HIDWORD(v19);
  -[CLAvengerScannerClientController submitBufferEmptyAnalyticsCounts:numNOApplePosh:numNONonApplePosh:numWildAppleType18:numWildApplePosh:numWildNonApplePosh:totalNearOwnerAdv:totalWildAdv:timeSinceLastBufferEmpty:](self, "submitBufferEmptyAnalyticsCounts:numNOApplePosh:numNONonApplePosh:numWildAppleType18:numWildApplePosh:numWildNonApplePosh:totalNearOwnerAdv:totalWildAdv:timeSinceLastBufferEmpty:", v21, HIDWORD(v22), HIDWORD(v23), HIDWORD(v21), v22, v23, __PAIR64__(v12, v11), v19);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E418;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), block);
  objc_autoreleasePoolPop(context);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)startScanningWithUseCase:(unsigned int)a3 isScanUpgrade:(BOOL)a4
{
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSObject *v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  NSDictionary *v24;
  CBCentralManager *centralManager;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  NSNumber *v30;
  id buf;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  if (self->_centralManagerPoweredOn)
  {
    if (self->_currentUseCase == a3)
    {
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
      v5 = qword_1022A0218;
      if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_FAULT))
      {
        v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
        v7 = sub_1002488CC(self->_currentUseCase);
        buf = (id)68289538;
        v32 = 2082;
        v33 = "";
        v34 = 2082;
        v35 = v6;
        v36 = 2082;
        v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Starting the same scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
        if (qword_1022A0210 != -1)
          dispatch_once(&qword_1022A0210, &stru_1021BCB28);
      }
      v8 = qword_1022A0218;
      if (os_signpost_enabled((os_log_t)qword_1022A0218))
      {
        v9 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
        v10 = sub_1002488CC(self->_currentUseCase);
        buf = (id)68289538;
        v32 = 2082;
        v33 = "";
        v34 = 2082;
        v35 = v9;
        v36 = 2082;
        v37 = v10;
        v11 = "Starting the same scan";
        v12 = "{\"msg%{public}.0s\":\"Starting the same scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentU"
              "seCase\":%{public, location:escape_only}s}";
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      self->_currentUseCase = a3;
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
      v19 = qword_1022A0218;
      if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
        v21 = sub_1002488CC(self->_currentUseCase);
        buf = (id)68289538;
        v32 = 2082;
        v33 = "";
        v34 = 2082;
        v35 = v20;
        v36 = 2082;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"starting scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      }
      if (+[CLAvengerScannerClientController shouldHoldPowerAssertionForScan:](CLAvengerScannerClientController, "shouldHoldPowerAssertionForScan:", self->_currentUseCase))
      {
        if (qword_1022A0210 != -1)
          dispatch_once(&qword_1022A0210, &stru_1021BCB28);
        v22 = qword_1022A0218;
        if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
        {
          v23 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
          buf = (id)68289282;
          v32 = 2082;
          v33 = "";
          v34 = 2082;
          v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Taking PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        }
        objc_msgSend(objc_loadWeak((id *)&self->_powerAssertionDelegate), "takePowerAssertion");
      }
      v29 = CBCentralManagerScanOptionUsecase;
      v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentUseCase);
      v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      objc_initWeak(&buf, self);
      centralManager = self->_centralManager;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10152E408;
      v27[3] = &unk_1021BCB08;
      objc_copyWeak(&v28, &buf);
      -[CBCentralManager scanForPeripheralsWithServices:options:completion:](centralManager, "scanForPeripheralsWithServices:options:completion:", 0, v24, v27);
      if (-[CLAvengerScannerClientController isAggressiveScanning](self, "isAggressiveScanning") && !a4)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10020F8D8;
        v26[3] = &unk_10212BB58;
        v26[4] = self;
        dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), v26);
      }
      objc_destroyWeak(&v28);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v13 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_FAULT))
    {
      v14 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v15 = sub_1002488CC(self->_currentUseCase);
      buf = (id)68289538;
      v32 = 2082;
      v33 = "";
      v34 = 2082;
      v35 = v14;
      v36 = 2082;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Trying to startScanning with central manager powered off\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    }
    v8 = qword_1022A0218;
    if (os_signpost_enabled((os_log_t)qword_1022A0218))
    {
      v16 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v17 = sub_1002488CC(self->_currentUseCase);
      buf = (id)68289538;
      v32 = 2082;
      v33 = "";
      v34 = 2082;
      v35 = v16;
      v36 = 2082;
      v37 = v17;
      v11 = "Trying to startScanning with central manager powered off";
      v12 = "{\"msg%{public}.0s\":\"Trying to startScanning with central manager powered off\", \"ClientId\":%{public, lo"
            "cation:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}";
      goto LABEL_17;
    }
  }
}

- (void)startScanningWithUseCase:(unsigned int)a3
{
  -[CLAvengerScannerClientController startScanningWithUseCase:isScanUpgrade:](self, "startScanningWithUseCase:isScanUpgrade:", *(_QWORD *)&a3, 0);
}

- (CLAvengerReconciler)reconciler
{
  return self->_reconciler;
}

- (BOOL)performTemporaryAggressiveScan
{
  BOOL result;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  if (+[CLAvengerScannerClientController isDefaultScanType:](CLAvengerScannerClientController, "isDefaultScanType:", self->_currentUseCase)&& self->_centralManagerPoweredOn)
  {
    -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", 65547);
    -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aggressive"));
    return 1;
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v4 = qword_1022A0218;
    v5 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = v6;
      v14 = 2082;
      v15 = v7;
      v16 = 1026;
      v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (id)parseAndNotifyDelegateOnDiscoveredPeripheral:(id)a3 RSSI:(id)a4
{
  id v5;
  id v6;
  _QWORD block[7];

  v5 = +[CLAvengerScannerParser convertToObjectDiscoveryDataWithAdvertisementData:rssi:](CLAvengerScannerParser, "convertToObjectDiscoveryDataWithAdvertisementData:rssi:", a3, a4);
  if (v5)
  {
    if (-[CLAvengerScannerClientController reconciler](self, "reconciler"))
      v6 = -[CLAvengerReconciler attemptReconciliationWithAddress:advertisementData:](-[CLAvengerScannerClientController reconciler](self, "reconciler"), "attemptReconciliationWithAddress:advertisementData:", objc_msgSend(v5, "address"), objc_msgSend(v5, "advertisementData"));
    else
      v6 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020F8AC;
    block[3] = &unk_10212BBA8;
    block[4] = self;
    block[5] = v5;
    block[6] = v6;
    dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), block);
  }
  return v5;
}

- (BOOL)isAggressiveScanning
{
  return self->_currentUseCase - 65547 < 2;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  NSObject *v10;
  const char *v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  _QWORD block[5];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v10 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEBUG))
  {
    v11 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    *(_DWORD *)buf = 68289795;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = v11;
    v23 = 2113;
    v24 = a4;
    v25 = 2113;
    v26 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didDiscoverPeripheral\", \"ClientId\":%{public, location:escape_only}s, \"peripheral\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  v12 = -[CLAvengerScannerClientController parseAndNotifyDelegateOnDiscoveredPeripheral:RSSI:](self, "parseAndNotifyDelegateOnDiscoveredPeripheral:RSSI:", a5, a6);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "beepOnMoveHigh"))
    {
      if (objc_msgSend(v13, "didCauseWake")
        && -[CLAvengerScannerClientController bomScanEnabled](self, "bomScanEnabled"))
      {
        if (qword_1022A0210 != -1)
          dispatch_once(&qword_1022A0210, &stru_1021BCB28);
        v14 = qword_1022A0218;
        if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
        {
          v15 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
          *(_DWORD *)buf = 68289795;
          v18 = 0;
          v19 = 2082;
          v20 = "";
          v21 = 2082;
          v22 = v15;
          v23 = 2113;
          v24 = a4;
          v25 = 2113;
          v26 = a5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"discovered BOM waking advertisement\", \"ClientId\":%{public, location:escape_only}s, \"peripheral\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@}", buf, 0x30u);
        }
        -[CLAvengerScannerClientController setBomScanEnabled:](self, "setBomScanEnabled:", 0);
        -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", -[CLAvengerScannerClientController defaultUseCase](self, "defaultUseCase"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10152E4D4;
        block[3] = &unk_10212BB58;
        block[4] = self;
        dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), block);
      }
    }
  }
}

+ (BOOL)shouldHoldPowerAssertionForScan:(unsigned int)a3
{
  return (a3 - 65547 < 4) & (0xBu >> ((a3 - 11) & 0xF));
}

+ (BOOL)isDefaultScanType:(unsigned int)a3
{
  return a3 == 65559 || a3 >> 1 == 32772;
}

- (CLAvengerScannerClientController)initWithDelegate:(id)a3 centralManager:(id)a4 optedIn:(BOOL)a5 reconciler:(id)a6 queue:(id)a7 powerAssertionDelegate:(id)a8
{
  CLAvengerScannerClientController *result;
  CLAvengerScannerClientController *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  NSString *v20;
  NSObject *queue;
  _QWORD block[5];
  objc_super v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v23.receiver = self;
  v23.super_class = (Class)CLAvengerScannerClientController;
  result = -[CLAvengerScannerClientController init](&v23, "init");
  if (result)
  {
    v15 = result;
    result = 0;
    if (a3)
    {
      if (a4 && a8)
      {
        objc_storeWeak((id *)&v15->_delegate, a3);
        v15->_centralManager = (CBCentralManager *)a4;
        v15->_currentUseCase = 0;
        v15->_centralManagerPoweredOn = 0;
        if (a6)
        {
          v15->_reconciler = (CLAvengerReconciler *)a6;
        }
        else
        {
          if (qword_1022A0210 != -1)
            dispatch_once(&qword_1022A0210, &stru_1021BCB28);
          v16 = qword_1022A0218;
          if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_ERROR))
          {
            v17 = -[NSString UTF8String](v15->_clientIdentifier, "UTF8String");
            *(_DWORD *)buf = 68289282;
            v25 = 0;
            v26 = 2082;
            v27 = "";
            v28 = 2082;
            v29 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"No reconciler provided\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
            if (qword_1022A0210 != -1)
              dispatch_once(&qword_1022A0210, &stru_1021BCB28);
          }
          v18 = qword_1022A0218;
          if (os_signpost_enabled((os_log_t)qword_1022A0218))
          {
            v19 = -[NSString UTF8String](v15->_clientIdentifier, "UTF8String");
            *(_DWORD *)buf = 68289282;
            v25 = 0;
            v26 = 2082;
            v27 = "";
            v28 = 2082;
            v29 = v19;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No reconciler provided", "{\"msg%{public}.0s\":\"No reconciler provided\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
        }
        v15->_queue = (OS_dispatch_queue *)a7;
        v15->_optedIn = a5;
        objc_storeWeak((id *)&v15->_powerAssertionDelegate, a8);
        v15->_aggressiveToAggressiveLongUpgradeRequested = 0;
        if (objc_msgSend(objc_loadWeak((id *)&v15->_delegate), "clientIdentifier"))
          v20 = (NSString *)objc_msgSend(objc_loadWeak((id *)&v15->_delegate), "clientIdentifier");
        else
          v20 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", "UNKNOWN");
        v15->_clientIdentifier = v20;
        v15->_bomScanEnabled = 0;
        v15->_lastScanBufferEmptyDate = +[NSDate distantPast](NSDate, "distantPast");
        queue = v15->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10152DAA4;
        block[3] = &unk_10212BB58;
        block[4] = v15;
        dispatch_async(queue, block);
        return v15;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  objc_super v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v3 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    *(_DWORD *)buf = 68289282;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Ending scan\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopMonitor"));
  objc_storeWeak((id *)&self->_delegate, 0);

  self->_centralManager = 0;
  self->_reconciler = 0;
  objc_storeWeak((id *)&self->_powerAssertionDelegate, 0);

  self->_clientIdentifier = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLAvengerScannerClientController;
  -[CLAvengerScannerClientController dealloc](&v5, "dealloc");
}

- (BOOL)isLegacyAggressiveScanning
{
  return self->_currentUseCase == 65547;
}

- (BOOL)isAggressiveLongScanning
{
  return self->_currentUseCase == 65548;
}

- (BOOL)isDefaultScanning
{
  return +[CLAvengerScannerClientController isDefaultScanType:](CLAvengerScannerClientController, "isDefaultScanType:", self->_currentUseCase);
}

- (BOOL)isLegacyAggressiveOrDefaultScanning
{
  if (-[CLAvengerScannerClientController isLegacyAggressiveScanning](self, "isLegacyAggressiveScanning"))
    return 1;
  else
    return -[CLAvengerScannerClientController isDefaultScanning](self, "isDefaultScanning");
}

- (void)stopScan
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  if (-[CBCentralManager isScanning](self->_centralManager, "isScanning"))
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v3 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v5 = sub_1002488CC(self->_currentUseCase);
      v6[0] = 68289538;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = v4;
      v11 = 2082;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"stopping scan\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s}", (uint8_t *)v6, 0x26u);
    }
    -[CBCentralManager stopScan](self->_centralManager, "stopScan");
  }
}

- (void)scanCompletedWithError:(id)a3 totalRXTime:(id)a4
{
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  _QWORD block[5];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const char *v39;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v7 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    v9 = sub_1002488CC(self->_currentUseCase);
    *(_DWORD *)buf = 68290051;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = v8;
    v34 = 2113;
    v35 = a3;
    v36 = 2113;
    v37 = a4;
    v38 = 2082;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"scan completion called\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"totalRXTime\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  if (objc_msgSend(a3, "code") != (id)36 && objc_msgSend(a3, "code") != (id)35)
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v22 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_FAULT))
    {
      v23 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v24 = sub_1002488CC(self->_currentUseCase);
      *(_DWORD *)buf = 68289795;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = v23;
      v34 = 2113;
      v35 = a3;
      v36 = 2082;
      v37 = (id)v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected error\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x30u);
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    }
    v13 = qword_1022A0218;
    if (!os_signpost_enabled((os_log_t)qword_1022A0218))
      goto LABEL_39;
    v25 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    v26 = sub_1002488CC(self->_currentUseCase);
    *(_DWORD *)buf = 68289795;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = v25;
    v34 = 2113;
    v35 = a3;
    v36 = 2082;
    v37 = (id)v26;
    v16 = "Unexpected error";
    v17 = "{\"msg%{public}.0s\":\"Unexpected error\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private,"
          " location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}";
    goto LABEL_38;
  }
  if (+[CLAvengerScannerClientController isDefaultScanType:](CLAvengerScannerClientController, "isDefaultScanType:", self->_currentUseCase))
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v10 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_FAULT))
    {
      v11 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v12 = sub_1002488CC(self->_currentUseCase);
      *(_DWORD *)buf = 68289795;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = v11;
      v34 = 2113;
      v35 = a3;
      v36 = 2082;
      v37 = (id)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Error with default scan type\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}", buf, 0x30u);
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    }
    v13 = qword_1022A0218;
    if (!os_signpost_enabled((os_log_t)qword_1022A0218))
      goto LABEL_39;
    v14 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    v15 = sub_1002488CC(self->_currentUseCase);
    *(_DWORD *)buf = 68289795;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = v14;
    v34 = 2113;
    v35 = a3;
    v36 = 2082;
    v37 = (id)v15;
    v16 = "Error with default scan type";
    v17 = "{\"msg%{public}.0s\":\"Error with default scan type\", \"ClientId\":%{public, location:escape_only}s, \"error\"
          ":%{private, location:escape_only}@, \"CurrentUseCase\":%{public, location:escape_only}s}";
LABEL_38:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x30u);
LABEL_39:
    self->_currentUseCase = 0;
    return;
  }
  if (objc_msgSend(objc_loadWeak((id *)&self->_powerAssertionDelegate), "hasPowerAssertion"))
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v18 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Releasing PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    objc_msgSend(objc_loadWeak((id *)&self->_powerAssertionDelegate), "releasePowerAssertion");
  }
  if (-[CLAvengerScannerClientController isLegacyAggressiveScanning](self, "isLegacyAggressiveScanning")
    && self->_aggressiveToAggressiveLongUpgradeRequested)
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v20 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Performing scan upgrade from Aggressive to AggressiveLong\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    -[CLAvengerScannerClientController startScanningWithUseCase:isScanUpgrade:](self, "startScanningWithUseCase:isScanUpgrade:", 65548, 1);
    self->_aggressiveToAggressiveLongUpgradeRequested = 0;
  }
  else
  {
    if (-[CLAvengerScannerClientController isAggressiveScanning](self, "isAggressiveScanning"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10152E3EC;
      block[3] = &unk_10212BB58;
      block[4] = self;
      dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), block);
    }
    -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", -[CLAvengerScannerClientController defaultUseCase](self, "defaultUseCase"));
  }
}

- (void)submitBufferEmptyAnalyticsCounts:(unsigned int)a3 numNOApplePosh:(unsigned int)a4 numNONonApplePosh:(unsigned int)a5 numWildAppleType18:(unsigned int)a6 numWildApplePosh:(unsigned int)a7 numWildNonApplePosh:(unsigned int)a8 totalNearOwnerAdv:(unsigned int)a9 totalWildAdv:(unsigned int)a10 timeSinceLastBufferEmpty:(int)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  NSMutableDictionary *v29;
  _QWORD v30[10];
  _QWORD v31[10];

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v30[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numNOAppleType18");
  v31[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16);
  v30[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numNOApplePosh");
  v31[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15);
  v30[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numNONonApplePosh");
  v31[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14);
  v30[3] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numWildAppleType18");
  v31[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13);
  v30[4] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numWildApplePosh");
  v31[4] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12);
  v30[5] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "numWildNonApplePosh");
  v31[5] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11);
  v30[6] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "totalNearOwnerAdv");
  v31[6] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a9);
  v30[7] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "totalWildAdv");
  v31[7] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a10);
  v30[8] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "timeSinceLastBufferEmpty");
  v31[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a11);
  v30[9] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "client");
  v31[9] = -[CLAvengerScannerClientController clientIdentifier](self, "clientIdentifier");
  v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 10));
  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v18 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    *(_DWORD *)buf = 68289538;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = v19;
    v28 = 2114;
    v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitBufferEmptyEvent\", \"ClientId\":%{public, location:escape_only}s, \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10152E814;
  v21[3] = &unk_10215F370;
  v21[4] = v17;
  AnalyticsSendEventLazy(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.onAdvBufferFlush"), v21);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  int centralManagerPoweredOn;
  id v5;
  int v7;
  NSObject *v8;
  const char *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  _QWORD block[5];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;

  centralManagerPoweredOn = self->_centralManagerPoweredOn;
  v5 = objc_msgSend(a3, "state");
  v7 = v5 == (id)5 || v5 == (id)10;
  self->_centralManagerPoweredOn = v7;
  if (centralManagerPoweredOn != v7)
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v8 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v10 = self->_centralManagerPoweredOn;
      *(_DWORD *)buf = 68289794;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = v9;
      v21 = 1026;
      v22 = centralManagerPoweredOn;
      v23 = 1026;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"didUpdateState\", \"ClientId\":%{public, location:escape_only}s, \"wasPoweredOn\":%{public}hhd, \"isPoweredOn\":%{public}hhd}", buf, 0x28u);
    }
    if (centralManagerPoweredOn)
    {
      if (!self->_centralManagerPoweredOn)
      {
        if (objc_msgSend(objc_loadWeak((id *)&self->_powerAssertionDelegate), "hasPowerAssertion"))
        {
          if (qword_1022A0210 != -1)
            dispatch_once(&qword_1022A0210, &stru_1021BCB28);
          v11 = qword_1022A0218;
          if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
          {
            v12 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
            *(_DWORD *)buf = 68289282;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            v19 = 2082;
            v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Releasing PowerAssertion\", \"ClientId\":%{public, location:escape_only}s}", buf, 0x1Cu);
          }
          objc_msgSend(objc_loadWeak((id *)&self->_powerAssertionDelegate), "releasePowerAssertion");
        }
        if (-[CLAvengerScannerClientController isAggressiveScanning](self, "isAggressiveScanning"))
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10152EAAC;
          block[3] = &unk_10212BB58;
          block[4] = self;
          dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), block);
        }
        self->_currentUseCase = 0;
      }
    }
    else if (self->_centralManagerPoweredOn)
    {
      -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", -[CLAvengerScannerClientController defaultUseCase](self, "defaultUseCase"));
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10152EAC8;
    v13[3] = &unk_10212BB58;
    v13[4] = self;
    dispatch_async((dispatch_queue_t)-[CLAvengerScannerClientController queue](self, "queue"), v13);
  }
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  v6 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_ERROR))
  {
    v7 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    v10 = 68289538;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = v7;
    v16 = 2114;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"didFailToScan\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v10, 0x26u);
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
  }
  v8 = qword_1022A0218;
  if (os_signpost_enabled((os_log_t)qword_1022A0218))
  {
    v9 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
    v10 = 68289538;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = v9;
    v16 = 2114;
    v17 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "didFailToScan", "{\"msg%{public}.0s\":\"didFailToScan\", \"ClientId\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v10, 0x26u);
  }
}

- (BOOL)performTemporaryLongAggressiveScan
{
  NSObject *v3;
  _BOOL4 v4;
  BOOL result;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  if (-[CLAvengerScannerClientController isLegacyAggressiveOrDefaultScanning](self, "isLegacyAggressiveOrDefaultScanning")&& self->_centralManagerPoweredOn)
  {
    if (-[CLAvengerScannerClientController isLegacyAggressiveScanning](self, "isLegacyAggressiveScanning"))
      self->_aggressiveToAggressiveLongUpgradeRequested = 1;
    else
      -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", 65548);
    -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AggressiveLong"));
    return 1;
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v3 = qword_1022A0218;
    v4 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v4)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = v6;
      v14 = 2082;
      v15 = v7;
      v16 = 1026;
      v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting long aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)stopTemporaryLongAggressiveScan
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  _BOOL4 aggressiveToAggressiveLongUpgradeRequested;
  NSObject *v15;
  const char *v16;
  const char *v17;
  _BOOL4 v18;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BOOL4 v29;

  if (-[CLAvengerScannerClientController isAggressiveScanning](self, "isAggressiveScanning")
    && self->_centralManagerPoweredOn)
  {
    if (-[CLAvengerScannerClientController isAggressiveLongScanning](self, "isAggressiveLongScanning"))
    {
      -[CLAvengerScannerClientController stopScan](self, "stopScan");
LABEL_5:
      -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopAggressiveLong"));
      LOBYTE(v3) = 1;
      return v3;
    }
    if (-[CLAvengerScannerClientController isLegacyAggressiveScanning](self, "isLegacyAggressiveScanning")
      && self->_aggressiveToAggressiveLongUpgradeRequested)
    {
      self->_aggressiveToAggressiveLongUpgradeRequested = 0;
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
      v9 = qword_1022A0218;
      if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
        v20 = 68289282;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2082;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Canceled scan upgrade\", \"ClientId\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);
      }
      goto LABEL_5;
    }
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v11 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_ERROR))
    {
      v12 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v13 = sub_1002488CC(self->_currentUseCase);
      aggressiveToAggressiveLongUpgradeRequested = self->_aggressiveToAggressiveLongUpgradeRequested;
      v20 = 68289794;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = v12;
      v26 = 2082;
      v27 = v13;
      v28 = 1026;
      v29 = aggressiveToAggressiveLongUpgradeRequested;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"No long aggressive scan to stop\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"scanUpgradeRequested\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
      if (qword_1022A0210 != -1)
        dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    }
    v15 = qword_1022A0218;
    v3 = os_signpost_enabled((os_log_t)qword_1022A0218);
    if (v3)
    {
      v16 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v17 = sub_1002488CC(self->_currentUseCase);
      v18 = self->_aggressiveToAggressiveLongUpgradeRequested;
      v20 = 68289794;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 1026;
      v29 = v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No long aggressive scan to stop", "{\"msg%{public}.0s\":\"No long aggressive scan to stop\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"scanUpgradeRequested\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v4 = qword_1022A0218;
    v5 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v5)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v20 = 68289794;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = v6;
      v26 = 2082;
      v27 = v7;
      v28 = 1026;
      v29 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not stopping long aggressives scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)&v20, 0x2Cu);
LABEL_10:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)performTemporaryHawkeyeLowEnergyScan
{
  BOOL result;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  if (+[CLAvengerScannerClientController isDefaultScanType:](CLAvengerScannerClientController, "isDefaultScanType:", self->_currentUseCase)&& self->_centralManagerPoweredOn)
  {
    -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", 65550);
    -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "HELE"));
    return 1;
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v4 = qword_1022A0218;
    v5 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = v6;
      v14 = 2082;
      v15 = v7;
      v16 = 1026;
      v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting HELE scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)startBTFindingScan
{
  BOOL result;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  if (+[CLAvengerScannerClientController isDefaultScanType:](CLAvengerScannerClientController, "isDefaultScanType:", self->_currentUseCase)&& self->_centralManagerPoweredOn)
  {
    -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", 65549);
    -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartBTFinding"));
    return 1;
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v4 = qword_1022A0218;
    v5 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = v6;
      v14 = 2082;
      v15 = v7;
      v16 = 1026;
      v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not starting BT Finding scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)stopBTFindingScan
{
  BOOL result;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  _BOOL4 centralManagerPoweredOn;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  if (self->_currentUseCase == 65549 && self->_centralManagerPoweredOn)
  {
    -[CLAvengerScannerClientController stopScan](self, "stopScan");
    -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF70, self->_clientIdentifier, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopBTFinding"));
    return 1;
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BCB28);
    v4 = qword_1022A0218;
    v5 = os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      v6 = -[NSString UTF8String](self->_clientIdentifier, "UTF8String");
      v7 = sub_1002488CC(self->_currentUseCase);
      centralManagerPoweredOn = self->_centralManagerPoweredOn;
      v9[0] = 68289794;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = v6;
      v14 = 2082;
      v15 = v7;
      v16 = 1026;
      v17 = centralManagerPoweredOn;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Not stopping BT Finding scan due to invalid state\", \"ClientId\":%{public, location:escape_only}s, \"CurrentUseCase\":%{public, location:escape_only}s, \"PoweredOn\":%{public}hhd}", (uint8_t *)v9, 0x2Cu);
      return 0;
    }
  }
  return result;
}

- (BOOL)isScanning
{
  return self->_centralManagerPoweredOn && self->_currentUseCase != 0;
}

- (unsigned)defaultUseCase
{
  if (-[CLAvengerScannerClientController bomScanEnabled](self, "bomScanEnabled")
    && !-[CLAvengerScannerClientController optedIn](self, "optedIn"))
  {
    return 65559;
  }
  if (self->_optedIn)
    return 65545;
  return 65544;
}

- (BOOL)getOptedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  if (self->_optedIn != a3)
  {
    self->_optedIn = a3;
    if (self->_centralManagerPoweredOn)
      -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", -[CLAvengerScannerClientController defaultUseCase](self, "defaultUseCase"));
  }
}

- (BOOL)poweredOn
{
  return -[CLAvengerScannerClientController centralManagerPoweredOn](self, "centralManagerPoweredOn");
}

- (BOOL)performNotOptedInBOMScan
{
  BOOL v3;

  if (!_os_feature_enabled_impl("BluetoothFeatures", "BeepOnMoveWake")
    || -[CLAvengerScannerClientController optedIn](self, "optedIn"))
  {
    return 0;
  }
  v3 = 1;
  if (!-[CLAvengerScannerClientController bomScanEnabled](self, "bomScanEnabled"))
  {
    -[CLAvengerScannerClientController setBomScanEnabled:](self, "setBomScanEnabled:", 1);
    if (self->_centralManagerPoweredOn)
      -[CLAvengerScannerClientController startScanningWithUseCase:](self, "startScanningWithUseCase:", -[CLAvengerScannerClientController defaultUseCase](self, "defaultUseCase"));
  }
  return v3;
}

- (void)initializeClientRequestsViewsWithZeroValues:(id)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[7];

  v15[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aggressive");
  v15[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartBTFinding");
  v15[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopBTFinding");
  v15[3] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AggressiveLong");
  v15[4] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "HELE");
  v15[5] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StartMonitor");
  v15[6] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "StopMonitor");
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 7);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CLAvengerScannerClientController submitClientRequestsEvent:client:scanType:](self, "submitClientRequestsEvent:client:scanType:", &off_10221DF88, a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (CLAvengerScannerClientDelegateProtocol)delegate
{
  return (CLAvengerScannerClientDelegateProtocol *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  self->_centralManager = (CBCentralManager *)a3;
}

- (unsigned)currentUseCase
{
  return self->_currentUseCase;
}

- (void)setCurrentUseCase:(unsigned int)a3
{
  self->_currentUseCase = a3;
}

- (BOOL)centralManagerPoweredOn
{
  return self->_centralManagerPoweredOn;
}

- (void)setCentralManagerPoweredOn:(BOOL)a3
{
  self->_centralManagerPoweredOn = a3;
}

- (void)setReconciler:(id)a3
{
  self->_reconciler = (CLAvengerReconciler *)a3;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (CLAvengerScannerClientControllerPowerAssertionDelegateProtocol)powerAssertionDelegate
{
  return (CLAvengerScannerClientControllerPowerAssertionDelegateProtocol *)objc_loadWeak((id *)&self->_powerAssertionDelegate);
}

- (void)setPowerAssertionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_powerAssertionDelegate, a3);
}

- (BOOL)aggressiveToAggressiveLongUpgradeRequested
{
  return self->_aggressiveToAggressiveLongUpgradeRequested;
}

- (void)setAggressiveToAggressiveLongUpgradeRequested:(BOOL)a3
{
  self->_aggressiveToAggressiveLongUpgradeRequested = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (BOOL)bomScanEnabled
{
  return self->_bomScanEnabled;
}

- (void)setBomScanEnabled:(BOOL)a3
{
  self->_bomScanEnabled = a3;
}

- (NSDate)lastScanBufferEmptyDate
{
  return self->_lastScanBufferEmptyDate;
}

- (void)setLastScanBufferEmptyDate:(id)a3
{
  self->_lastScanBufferEmptyDate = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_powerAssertionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
