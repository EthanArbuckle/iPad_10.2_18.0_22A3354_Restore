@implementation OSBatteryPredictorService

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF5C;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_100076858 != -1)
    dispatch_once(&qword_100076858, block);
  return (id)qword_100076850;
}

- (OSBatteryPredictorService)init
{
  OSBatteryPredictorService *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  _OSLowSOCEventPredictor *highDrainPredictor;
  NSObject *v7;
  NSXPCListener *v8;
  NSXPCListener *listener;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OSBatteryPredictorService;
  v2 = -[OSBatteryPredictorService init](&v12, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "battery");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_OSLowSOCEventPredictor sharedInstance](_OSLowSOCEventPredictor, "sharedInstance"));
    highDrainPredictor = v2->_highDrainPredictor;
    v2->_highDrainPredictor = (_OSLowSOCEventPredictor *)v5;

    v7 = v2->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initializing delegate", v11, 2u);
    }
    v8 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.OSIntelligence.battery"));
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCListener *listener;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)OSBatteryPredictorService;
  -[OSBatteryPredictorService dealloc](&v4, "dealloc");
}

- (void)predictLowSOCWithHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  OS_os_log *log;
  id v6;
  OS_os_log *v7;
  OS_os_log *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;

  v4 = (void (**)(id, id, _QWORD))a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Request for low SOC prediction", (uint8_t *)&v16, 2u);
  }
  v6 = objc_msgSend(_OSBatteryLowSOCPredictorOutput, "init");
  objc_msgSend(v6, "setConfidence:", 0.0);
  objc_msgSend(v6, "setLowSOCPredicted:", 0);
  objc_msgSend(v6, "setConfidence:", 0.0);
  objc_msgSend(v6, "setConfidenceThreshold:", 0.0);
  objc_msgSend(v6, "setModelName:", CFSTR("NoOpModel"));
  objc_msgSend(v6, "setModelVersion:", CFSTR("0.0"));
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "Low SOC prediction output %@", (uint8_t *)&v16, 0xCu);
  }
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    sub_10003E1B8(v8, v9, v10, v11, v12, v13, v14, v15);
  v4[2](v4, v6, 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  OS_os_log *log;
  void *v9;
  uint64_t v10;
  void *v11;
  OSBatteryPredictorServiceXPCProxy *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v23[16];

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Listener received connection!", v23, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.osintelligence.battery")));
  if (v9
    && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____OSBatteryPredictorProtocol));
    objc_msgSend(v7, "setExportedInterface:", v11);

    v12 = -[OSBatteryPredictorServiceXPCProxy initWithObserver:]([OSBatteryPredictorServiceXPCProxy alloc], "initWithObserver:", self);
    objc_msgSend(v7, "setExportedObject:", v12);

    objc_msgSend(v7, "resume");
    v13 = 1;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[OSBatteryPredictorService log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003E1EC(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0;
  }

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (_OSLowSOCEventPredictor)highDrainPredictor
{
  return self->_highDrainPredictor;
}

- (void)setHighDrainPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_highDrainPredictor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highDrainPredictor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
