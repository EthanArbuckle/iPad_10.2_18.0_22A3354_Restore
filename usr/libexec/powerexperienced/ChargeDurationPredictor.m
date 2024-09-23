@implementation ChargeDurationPredictor

+ (id)sharedInstance
{
  if (qword_10001BDB8 != -1)
    dispatch_once(&qword_10001BDB8, &stru_100014390);
  return (id)qword_10001BDB0;
}

- (ChargeDurationPredictor)init
{
  ChargeDurationPredictor *v2;
  os_log_t v3;
  OS_os_log *log;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *predictionQueryQueue;
  id v9;
  uint64_t v10;
  OS_dispatch_queue *mainQueue;
  uint64_t v12;
  _OSChargingPredictor *predictor;
  uint64_t v14;
  NSMutableDictionary *predictorOutput;
  uint64_t v16;
  DeviceContext *deviceContext;
  NSObject *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ChargeDurationPredictor;
  v2 = -[ChargeDurationPredictor init](&v20, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.powerexperienced", "chargedurationpredictor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.powerexperienced.chargedurationpredictorquery", v6);
    predictionQueryQueue = v2->_predictionQueryQueue;
    v2->_predictionQueryQueue = (OS_dispatch_queue *)v7;

    v9 = sub_1000090D4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    mainQueue = v2->_mainQueue;
    v2->_mainQueue = (OS_dispatch_queue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[_OSChargingPredictor predictor](_OSChargingPredictor, "predictor"));
    predictor = v2->_predictor;
    v2->_predictor = (_OSChargingPredictor *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    predictorOutput = v2->_predictorOutput;
    v2->_predictorOutput = (NSMutableDictionary *)v14;

    v2->_lastPluggedInState = IOPSDrawingUnlimitedPower();
    v16 = objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    deviceContext = v2->_deviceContext;
    v2->_deviceContext = (DeviceContext *)v16;

    -[DeviceContext addObserver:forKeyPath:options:context:](v2->_deviceContext, "addObserver:forKeyPath:options:context:", v2, CFSTR("currentContext"), 3, 0);
    if (!v2->_predictor)
    {
      v18 = v2->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10000CDE4(v18);
    }
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _DWORD v14[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor deviceContext](self, "deviceContext", a3, a4, a5, a6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPluggedInContext")));
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)v10 != -[ChargeDurationPredictor lastPluggedInState](self, "lastPluggedInState"))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = (_DWORD)v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "plugin state changed to %d", (uint8_t *)v14, 8u);
    }

    -[ChargeDurationPredictor setLastPluggedInState:](self, "setLastPluggedInState:", v10);
    if (!-[ChargeDurationPredictor lastPluggedInState](self, "lastPluggedInState"))
    {
      v12 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clearing cached predictor output", (uint8_t *)v14, 2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
      objc_msgSend(v13, "removeAllObjects");

    }
  }
}

- (BOOL)predictorReady
{
  return MKBDeviceUnlockedSinceBoot(self, a2) != 0;
}

- (BOOL)predictionAvailableForScheme:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6 != 0;
}

- (void)queryModelForScheme:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:"))
  {
    if (self->_predictor)
    {
      v5 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictionQueryQueue](self, "predictionQueryQueue"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100002F78;
      v6[3] = &unk_1000143E0;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(v5, v6);

    }
  }
}

- (BOOL)longChargeExpected
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  void *v11;

  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady"))
    return 0;
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 3))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "LongChargeExpected:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 3);
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_100015068));

  if (!v4)
    goto LABEL_12;
  v5 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LongChargeExpected: %@", (uint8_t *)&v10, 0xCu);

  }
  if ((objc_msgSend(v4, "meetsSystemConfidenceThreshold") & 1) != 0)
    v7 = 1;
  else
LABEL_12:
    v7 = 0;

  return v7;
}

- (BOOL)shortChargeExpected
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  void *v11;

  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady"))
    return 0;
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 5))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shortchargePrediction:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 5);
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_100015080));

  if (!v4)
    goto LABEL_12;
  v5 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "shortChargeExpected: %@", (uint8_t *)&v10, 0xCu);

  }
  if ((objc_msgSend(v4, "meetsSystemConfidenceThreshold") & 1) != 0)
    v7 = 1;
  else
LABEL_12:
    v7 = 0;

  return v7;
}

- (BOOL)inTypicalUsageEnvironment
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  void *v11;

  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady"))
    return 0;
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 4))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "inTypicalUsageEnvironment:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 4);
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_100015098));

  if (!v4)
    goto LABEL_12;
  v5 = objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "inTypicalUsageEnvironment: %@", (uint8_t *)&v10, 0xCu);

  }
  if ((objc_msgSend(v4, "meetsSystemConfidenceThreshold") & 1) != 0)
    v7 = 1;
  else
LABEL_12:
    v7 = 0;

  return v7;
}

- (BOOL)lastPluggedInState
{
  return self->_lastPluggedInState;
}

- (void)setLastPluggedInState:(BOOL)a3
{
  self->_lastPluggedInState = a3;
}

- (DeviceContext)deviceContext
{
  return (DeviceContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_OSChargingPredictor)predictor
{
  return (_OSChargingPredictor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPredictor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)predictorOutput
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPredictorOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)predictionQueryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPredictionQueryQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_predictionQueryQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_predictorOutput, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end
