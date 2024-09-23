@implementation CLDaemonMinimumAltitudeCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 callbackHandler:(id)a8
{
  CLDaemonMinimumAltitudeCondition *v13;
  NSObject *v14;
  uint64_t v15;
  CLBarometerCalibrationProtocol *v16;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  CLDaemonMinimumAltitudeCondition *v26;

  objc_msgSend(a3, "altitude");
  v18.receiver = self;
  v18.super_class = (Class)CLDaemonMinimumAltitudeCondition;
  v13 = -[CLDaemonMinimumAltitudeCondition initWithAltitude:](&v18, "initWithAltitude:");
  if (v13)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      -[CLDaemonMinimumAltitudeCondition altitude](v13, "altitude");
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2049;
      v24 = v15;
      v25 = 2050;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition created\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    -[CLDaemonMinimumAltitudeCondition setAuthorizationContext:](v13, "setAuthorizationContext:", a5);
    -[CLDaemonMinimumAltitudeCondition setUniverse:](v13, "setUniverse:", a6);
    -[CLDaemonMinimumAltitudeCondition setOnConditionUpdateCallbackHandler:](v13, "setOnConditionUpdateCallbackHandler:", a8);
    -[CLDaemonMinimumAltitudeCondition setIdentifier:](v13, "setIdentifier:", a7);
    v16 = (CLBarometerCalibrationProtocol *)objc_msgSend(objc_msgSend(-[CLDaemonMinimumAltitudeCondition universe](v13, "universe"), "vendor"), "proxyForService:", CFSTR("CLBarometerCalibration"));
    v13->_barometerCalibrationProxy = v16;
    -[CLBarometerCalibrationProtocol registerDelegate:inSilo:](v16, "registerDelegate:inSilo:", v13, objc_msgSend(-[CLDaemonMinimumAltitudeCondition universe](v13, "universe"), "silo"));
    -[CLBarometerCalibrationProtocol setDelegateEntityName:](v13->_barometerCalibrationProxy, "setDelegateEntityName:", "CLDaemonMinimumAltitudeCondition");
    -[CLDaemonMinimumAltitudeCondition setValid:](v13, "setValid:", 1);
    if (-[CLDaemonMinimumAltitudeCondition isAuthorized](v13, "isAuthorized"))
      -[CLDaemonMinimumAltitudeCondition startMonitoring](v13, "startMonitoring");
  }
  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  CLDaemonMinimumAltitudeCondition *v10;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  -[CLDaemonMinimumAltitudeCondition stopMonitoring](self, "stopMonitoring");
  -[CLDaemonMinimumAltitudeCondition setValid:](self, "setValid:", 0);

  self->_barometerCalibrationProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonMinimumAltitudeCondition;
  -[CLDaemonMinimumAltitudeCondition dealloc](&v4, "dealloc");
}

- (BOOL)isAuthorized
{
  return objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 524304);
}

- (void)startMonitoring
{
  NSObject *v3;
  CLDaemonMinimumAltitudeCondition *v4;
  CLBarometerCalibrationProtocol *barometerCalibrationProxy;
  double v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CLDaemonMinimumAltitudeCondition *v13;
  __int16 v14;
  CLDaemonMinimumAltitudeCondition *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
    v8 = 68290051;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2049;
    v13 = v4;
    v14 = 2050;
    v15 = self;
    v16 = 1026;
    v17 = -[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized");
    v18 = 1026;
    v19 = -[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition startMonitoring\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", (uint8_t *)&v8, 0x32u);
  }
  if ((-[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring") & 1) == 0)
  {
    if (-[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized"))
    {
      -[CLDaemonMinimumAltitudeCondition setIsMonitoring:](self, "setIsMonitoring:", 1);
      -[CLBarometerCalibrationProtocol registerClient:forNotification:](self->_barometerCalibrationProxy, "registerClient:forNotification:", self, 1);
      barometerCalibrationProxy = self->_barometerCalibrationProxy;
      -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
      -[CLBarometerCalibrationProtocol registerClient:forElevationThreshold:](barometerCalibrationProxy, "registerClient:forElevationThreshold:", self, 1.79769313e308, v6);
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
      v7 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 68289282;
        v9 = 0;
        v10 = 2082;
        v11 = "";
        v12 = 2050;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition startMonitoring not authorized\", \"self\":\"%{public}p\"}", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

- (void)stopMonitoring
{
  NSObject *v3;
  uint64_t v4;
  CLBarometerCalibrationProtocol *barometerCalibrationProxy;
  double v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  CLDaemonMinimumAltitudeCondition *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
    v7[0] = 68290051;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2049;
    v11 = v4;
    v12 = 2050;
    v13 = self;
    v14 = 1026;
    v15 = -[CLDaemonMinimumAltitudeCondition isAuthorized](self, "isAuthorized");
    v16 = 1026;
    v17 = -[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition stopMonitoring\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", (uint8_t *)v7, 0x32u);
  }
  if (-[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring"))
  {
    -[CLDaemonMinimumAltitudeCondition setIsMonitoring:](self, "setIsMonitoring:", 0);
    -[CLDaemonMinimumAltitudeCondition setLastMonitoringState:](self, "setLastMonitoringState:", 0);
    -[CLDaemonMinimumAltitudeCondition setRefinement:](self, "setRefinement:", 0);
    -[CLBarometerCalibrationProtocol unregisterClient:forNotification:](self->_barometerCalibrationProxy, "unregisterClient:forNotification:", self, 1);
    barometerCalibrationProxy = self->_barometerCalibrationProxy;
    -[CLDaemonMinimumAltitudeCondition altitude](self, "altitude");
    -[CLBarometerCalibrationProtocol unregisterClient:forElevationThreshold:](barometerCalibrationProxy, "unregisterClient:forElevationThreshold:", self, 1.79769313e308, v6);
  }
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  unint64_t v3;
  unint64_t v4;

  if ((-[CLDaemonMinimumAltitudeCondition isMonitoring](self, "isMonitoring") & 1) != 0)
    return 0;
  if ((int)objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "inUseLevel") <= 0)v3 = 16* (objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") != 0);
  else
    v3 = 0;
  v4 = v3 | 0x1000;
  if (objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 16))v3 |= 0x1000uLL;
  if ((objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  {
    return v4;
  }
  return v3;
}

- (void)onElevationThresold:(float)a3 direction:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  CLDaemonMinimumAltitudeCondition *v19;

  v4 = a4;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021ADED8);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2049;
    v15 = a3;
    v16 = 1026;
    v17 = v4;
    v18 = 2050;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition elevation threshold alert\", \"threshold\":\"%{private}f\", \"above\":%{public}d, \"self\":\"%{public}p\"}", buf, 0x2Cu);
  }
  if (-[CLDaemonMinimumAltitudeCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler"))
  {
    if (v4)
      v8 = 1;
    else
      v8 = 2;
    -[CLDaemonMinimumAltitudeCondition setLastMonitoringState:](self, "setLastMonitoringState:", v8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1012F41AC;
    v9[3] = &unk_102165F00;
    v9[4] = self;
    v9[5] = v8;
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLDaemonMinimumAltitudeCondition universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager")), "doAsync:", v9);
  }
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end
