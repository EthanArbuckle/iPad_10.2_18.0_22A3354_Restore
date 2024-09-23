@implementation CLLocationStreamer

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102305008 != -1)
    dispatch_once(&qword_102305008, &stru_1021590D8);
  return (id)qword_102305000;
}

+ (BOOL)isSupported
{
  if (qword_102305018 != -1)
    dispatch_once(&qword_102305018, &stru_1021590F8);
  return byte_102305010;
}

- (CLLocationStreamer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamer;
  return -[CLLocationStreamer initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationStreamerServiceProtocol, &OBJC_PROTOCOL___CLLocationStreamerClientProtocol);
}

- (void)beginService
{
  void **v3;
  uint64_t v4;
  id (*v5)(uint64_t);
  void *v6;
  CLLocationStreamer *v7;

  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  -[CLLocationStreamer setCurrentGranularity:](self, "setCurrentGranularity:", 0);
  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  v3 = _NSConcreteStackBlock;
  v4 = 3221225472;
  v5 = sub_10088A2DC;
  v6 = &unk_10212BB58;
  v7 = self;
  operator new();
}

- (void)endService
{
  Client *value;
  CLMotionActivity *v4;

  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  sub_10088A6B0((uint64_t **)&self->_locationAssertion, 0);
  sub_10088A6B0((uint64_t **)&self->_motionAlarmAssertion, 0);
  v4 = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0;
  if (v4)
    operator delete();
  -[CLTimer invalidate](-[CLLocationStreamer resendMotionStateTimer](self, "resendMotionStateTimer"), "invalidate");
  -[CLLocationStreamer setResendMotionStateTimer:](self, "setResendMotionStateTimer:", 0);
  -[CLLocationStreamingConnectionManagerServiceProtocol retireClient:](-[CLLocationStreamer streamingConnection](self, "streamingConnection"), "retireClient:", self);
  -[CLLocationStreamer setStreamingConnection:](self, "setStreamingConnection:", 0);
  -[CLTimer invalidate](-[CLLocationStreamer aliveAgainThrottleTimer](self, "aliveAgainThrottleTimer"), "invalidate");
  -[CLLocationStreamer setAliveAgainThrottleTimer:](self, "setAliveAgainThrottleTimer:", 0);
}

- (void)sendAliveAgainMessage
{
  uint64_t v3;
  uint64_t v4;
  CLLocationStreamingMessage *v5;
  NSNumber *v6;
  CFAbsoluteTime Current;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = sub_1001FD94C();
  Current = CFAbsoluteTimeGetCurrent();
  sub_10018A4CC(v3, "kCLLocationStreamerLastAliveAgainMessageTimestamp", &Current);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  v5 = objc_alloc_init(CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:](v5, "setMessageType:", CFSTR("kCLLocationStreamingMessageTypeAliveAgain"));
  -[CLLocationStreamingMessage setPriority:](v5, "setPriority:", 300);
  v8[0] = IDSSendMessageOptionTimeoutKey;
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 30.0);
  v8[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v8[2] = IDSSendMessageOptionEncryptPayloadKey;
  v9[0] = v6;
  v9[1] = &__kCFBooleanTrue;
  v9[2] = &__kCFBooleanTrue;
  v9[3] = &__kCFBooleanTrue;
  v8[3] = IDSSendMessageOptionRequireBluetoothKey;
  v8[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v9[4] = CFSTR("kCLLocationStreamingMessageTypeAliveAgain");
  -[CLLocationStreamingMessage setIdsOptions:](v5, "setIdsOptions:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:](-[CLLocationStreamer streamingConnection](self, "streamingConnection"), "sendMessage:", v5);
}

- (void)unregisterAllLocationNotifications
{
  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 0);
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 1);
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 2);
}

- (void)stopLocation
{
  CLRollingPowerAssertion *value;
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  -[CLLocationStreamer unregisterAllLocationNotifications](self, "unregisterAllLocationNotifications");
  -[CLLocationStreamer setEmergencyEnablementAssertionActive:](self, "setEmergencyEnablementAssertionActive:", 0);
  -[CLLocationStreamer setCurrentGranularity:](self, "setCurrentGranularity:", 0);
  -[CLLocationStreamer setLocationUpdatesIncludeMotionState:](self, "setLocationUpdatesIncludeMotionState:", 0);
  -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
  -[CLLocationStreamer setClientActivityTypeFitnessActive:](self, "setClientActivityTypeFitnessActive:", 0);
  -[CLLocationStreamer setClientActivityTypeAirborneActive:](self, "setClientActivityTypeAirborneActive:", 0);
  -[CLLocationStreamer setClientMapMatchingActive:](self, "setClientMapMatchingActive:", 0);
  value = self->_locationAssertion.__ptr_.__value_;
  objc_msgSend(*((id *)value + 1), "setNextFireDelay:", 1.79769313e308);
  v4 = *(_QWORD *)value;
  *(_QWORD *)value = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v5 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Shut down location streaming\"}", (uint8_t *)v6, 0x12u);
  }
}

- (void)setEmergencyEnablementAssertionActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;

  if (self->_emergencyEnablementAssertionActive != a3)
  {
    v3 = a3;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      v9 = 1026;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLEEA change\", \"needed\":%{public}hhd}", (uint8_t *)v6, 0x18u);
    }
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager")), "markClientEmergencyEnablementTransition:", v3);
    self->_emergencyEnablementAssertionActive = v3;
  }
}

- (void)setClientMapMatchingActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  Client *value;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;

  if (self->_clientMapMatchingActive != a3)
  {
    v3 = a3;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMM Setting client map matching\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientMapMatchingActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    v8 = *((_QWORD *)value + 1);
    v7 = (void *)*((_QWORD *)value + 2);
    if (v3)
      objc_msgSend(v7, "register:forNotification:registrationInfo:", v8, 17, 0);
    else
      objc_msgSend(v7, "unregister:forNotification:", v8, 17);
  }
}

- (void)setClientActivityTypeFitnessActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  Client *value;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;

  if (self->_clientActivityTypeFitnessActive != a3)
  {
    v3 = a3;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting fitness activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientActivityTypeFitnessActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    v8 = *((_QWORD *)value + 1);
    v7 = (void *)*((_QWORD *)value + 2);
    if (v3)
      objc_msgSend(v7, "register:forNotification:registrationInfo:", v8, 28, 0);
    else
      objc_msgSend(v7, "unregister:forNotification:", v8, 28);
  }
}

- (void)setClientActivityTypeAirborneActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  Client *value;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;

  if (self->_clientActivityTypeAirborneActive != a3)
  {
    v3 = a3;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting airborne activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientActivityTypeAirborneActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    v8 = *((_QWORD *)value + 1);
    v7 = (void *)*((_QWORD *)value + 2);
    if (v3)
      objc_msgSend(v7, "register:forNotification:registrationInfo:", v8, 29, 0);
    else
      objc_msgSend(v7, "unregister:forNotification:", v8, 29);
  }
}

- (void)startUpdatingLocationWithGranularity:(int)a3 includeMotion:(BOOL)a4 inFitnessSession:(BOOL)a5 inAirborneSession:(BOOL)a6 emergencyEnablementAssertionActive:(BOOL)a7 hasMapMatching:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = *(_QWORD *)&a3;
  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v15 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    -[CLLocationStreamer currentGranularity](self, "currentGranularity");
    v19 = 68289538;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2050;
    v24 = v13;
    v25 = 2050;
    v26 = -[CLLocationStreamer currentGranularity](self, "currentGranularity");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Starting\", \"new granularity\":%{public, location:CLLocationStreamingGranularity}lld, \"current granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x26u);
  }
  if ((_DWORD)v13)
  {
    -[CLLocationStreamer setLocationUpdatesIncludeMotionState:](self, "setLocationUpdatesIncludeMotionState:", v12);
    -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
    -[CLLocationStreamer setClientActivityTypeFitnessActive:](self, "setClientActivityTypeFitnessActive:", v11);
    -[CLLocationStreamer setClientActivityTypeAirborneActive:](self, "setClientActivityTypeAirborneActive:", v10);
    -[CLLocationStreamer setEmergencyEnablementAssertionActive:](self, "setEmergencyEnablementAssertionActive:", v9);
    -[CLLocationStreamer setClientMapMatchingActive:](self, "setClientMapMatchingActive:", v8);
    if (-[CLLocationStreamer currentGranularity](self, "currentGranularity") == (_DWORD)v13)
      goto LABEL_9;
    -[CLLocationStreamer unregisterAllLocationNotifications](self, "unregisterAllLocationNotifications");
    if (v13 < 4)
    {
      objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), (3 - v13), 0);
      -[CLLocationStreamer setCurrentGranularity:](self, "setCurrentGranularity:", v13);
LABEL_9:
      sub_10088B1F4((uint64_t)self->_locationAssertion.__ptr_.__value_);
    }
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v16 = qword_1022A01E8;
    v17 = v13;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      v19 = 68289282;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2050;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected granularity\", \"granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x1Cu);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102159118);
    }
    v18 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      v19 = 68289282;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2050;
      v24 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected granularity", "{\"msg%{public}.0s\":\"Unexpected granularity\", \"granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    -[CLLocationStreamer stopLocation](self, "stopLocation");
  }
}

- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4
{
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  CLMotionActivity *value;
  CLLocationStreamingMessage *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[8];
  _OWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[4];
  uint64_t buf;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;

  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  if (*a3 > 2u)
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v10 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      v11 = *a3;
      buf = 68289282;
      v31 = 2082;
      v32 = "";
      v33 = 2050;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102159118);
    }
    v12 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      v13 = *a3;
      buf = 68289282;
      v31 = 2082;
      v32 = "";
      v33 = 2050;
      v34 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected notification", "{\"msg%{public}.0s\":\"Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    v7 = *((double *)a4 + 11);
    if (v7 <= 0.0)
    {
      v9 = 15.0;
    }
    else
    {
      v8 = v7 + *(double *)((char *)a4 + 76);
      v9 = v8 - CFAbsoluteTimeGetCurrent();
    }
    if (v9 <= 0.0)
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102159118);
      v23 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)((char *)a4 + 76);
        v25 = *((_QWORD *)a4 + 11);
        buf = 68289538;
        v31 = 2082;
        v32 = "";
        v33 = 2050;
        v34 = v24;
        v35 = 2050;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Dropping location due to expiration\", \"timestamp\":\"%{public}f\", \"lifespan\":\"%{public}f\"}", (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
      v15 = objc_alloc((Class)CLLocation);
      v16 = *((_OWORD *)a4 + 7);
      v26[6] = *((_OWORD *)a4 + 6);
      v26[7] = v16;
      v27[0] = *((_OWORD *)a4 + 8);
      *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)((char *)a4 + 140);
      v17 = *((_OWORD *)a4 + 3);
      v26[2] = *((_OWORD *)a4 + 2);
      v26[3] = v17;
      v18 = *((_OWORD *)a4 + 5);
      v26[4] = *((_OWORD *)a4 + 4);
      v26[5] = v18;
      v19 = *((_OWORD *)a4 + 1);
      v26[0] = *(_OWORD *)a4;
      v26[1] = v19;
      objc_msgSend(v14, "encodeObject:forKey:", objc_msgSend(v15, "initWithClientLocation:", v26), CFSTR("kCLLocationStreamingMessageLocationKey"));
      v20 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v14, "encodedData"), CFSTR("kCLLocationStreamingMessageLocationKey"));
      if (-[CLLocationStreamer locationUpdatesIncludeMotionState](self, "locationUpdatesIncludeMotionState"))
      {
        value = self->_lastMotionActivity.__ptr_.__value_;
        if (value)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CLMotionActivity::isMoving(value)), CFSTR("kCLLocationStreamingMessageInMotionKey"));
      }
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[CLStreamedLocationPrivate data](-[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]([CLStreamedLocationPrivate alloc], "initWithDaemonLocationPrivate:", (char *)a4 + 160), "data"), CFSTR("kCLLocationStreamingMessageLocationPrivateKey"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[CLStreamedLocationInternal data](-[CLStreamedLocationInternal initWithDaemonLocation:]([CLStreamedLocationInternal alloc], "initWithDaemonLocation:", a4), "data"), CFSTR("kCLLocationStreamingMessageLocationInternalKey"));
      v22 = objc_alloc_init(CLLocationStreamingMessage);
      -[CLLocationStreamingMessage setMessageType:](v22, "setMessageType:", CFSTR("kCLLocationStreamingMessageTypeLocation"));
      -[CLLocationStreamingMessage setPayload:](v22, "setPayload:", v20);
      -[CLLocationStreamingMessage setPriority:](v22, "setPriority:", 300);
      v28[0] = IDSSendMessageOptionTimeoutKey;
      v29[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9);
      v29[1] = &__kCFBooleanTrue;
      v28[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v28[2] = IDSSendMessageOptionEncryptPayloadKey;
      v28[3] = IDSSendMessageOptionRequireBluetoothKey;
      v29[2] = &__kCFBooleanTrue;
      v29[3] = &__kCFBooleanTrue;
      -[CLLocationStreamingMessage setIdsOptions:](v22, "setIdsOptions:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 4));
      -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:](-[CLLocationStreamer streamingConnection](self, "streamingConnection"), "sendMessage:", v22);
    }
  }
}

- (void)reevaluateMotionSubscription
{
  CLMotionActivity *value;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;

  if (-[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive")
    || -[CLLocationStreamer locationUpdatesIncludeMotionState](self, "locationUpdatesIncludeMotionState"))
  {
    if (!-[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion"))
    {
      objc_msgSend(*((id *)self->_motionStateClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_motionStateClient.__ptr_.__value_ + 1), 0, 0);
      -[CLLocationStreamer setIsSubscribedForMotion:](self, "setIsSubscribedForMotion:", 1);
    }
  }
  else if (-[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion"))
  {
    objc_msgSend(*((id *)self->_motionStateClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_motionStateClient.__ptr_.__value_ + 1), 0);
    value = self->_lastMotionActivity.__ptr_.__value_;
    self->_lastMotionActivity.__ptr_.__value_ = 0;
    if (value)
      operator delete();
    -[CLLocationStreamer setIsSubscribedForMotion:](self, "setIsSubscribedForMotion:", 0);
    -[CLTimer setNextFireDelay:](-[CLLocationStreamer resendMotionStateTimer](self, "resendMotionStateTimer"), "setNextFireDelay:", 1.79769313e308);
  }
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v4 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1026;
    v9 = -[CLLocationStreamer isSubscribedForMotion](self, "isSubscribedForMotion");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Motion state subscription\", \"is subscribed\":%{public}d}", (uint8_t *)v5, 0x18u);
  }
}

- (void)startMotionAlarm
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;

  objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "silo");
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v3 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    v7 = 1026;
    v8 = -[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Start motion alarm\", \"currently active\":%{public}d}", (uint8_t *)v4, 0x18u);
  }
  sub_10088B1F4((uint64_t)self->_motionAlarmAssertion.__ptr_.__value_);
}

- (void)stopMotionAlarm
{
  NSObject *v3;
  CLRollingPowerAssertion *value;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  unsigned int v10;

  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v3 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = -[CLLocationStreamer motionAlarmActive](self, "motionAlarmActive");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Stop motion alarm\", \"currently active\":%{public}d}", (uint8_t *)v6, 0x18u);
  }
  -[CLLocationStreamer setMotionAlarmActive:](self, "setMotionAlarmActive:", 0);
  -[CLLocationStreamer reevaluateMotionSubscription](self, "reevaluateMotionSubscription");
  value = self->_motionAlarmAssertion.__ptr_.__value_;
  objc_msgSend(*((id *)value + 1), "setNextFireDelay:", 1.79769313e308);
  v5 = *(_QWORD *)value;
  *(_QWORD *)value = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

- (void)sendMotionState
{
  uint64_t isMoving;
  CLLocationStreamingMessage *v4;
  NSNumber *v5;
  _QWORD v6[4];
  _QWORD v7[4];
  const __CFString *v8;
  NSNumber *v9;

  isMoving = CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
  v4 = objc_alloc_init(CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:](v4, "setMessageType:", CFSTR("kCLLocationStreamingMessageTypeMotionAlarmUpdate"));
  v8 = CFSTR("kCLLocationStreamingMessageInMotionKey");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", isMoving);
  -[CLLocationStreamingMessage setPayload:](v4, "setPayload:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  -[CLLocationStreamingMessage setPriority:](v4, "setPriority:", 300);
  v6[0] = IDSSendMessageOptionTimeoutKey;
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&qword_102305020);
  v6[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v6[2] = IDSSendMessageOptionEncryptPayloadKey;
  v7[0] = v5;
  v7[1] = &__kCFBooleanTrue;
  v6[3] = IDSSendMessageOptionRequireBluetoothKey;
  v7[2] = &__kCFBooleanTrue;
  v7[3] = &__kCFBooleanTrue;
  -[CLLocationStreamingMessage setIdsOptions:](v4, "setIdsOptions:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:](-[CLLocationStreamer streamingConnection](self, "streamingConnection"), "sendMessage:", v4);
}

- (void)onMotionStateNotification:(const int *)a3 withData:(const NotificationData *)a4
{
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  uint8_t buf[8];
  _WORD v13[5];
  __int16 v14;
  int v15;

  if (!*a3)
  {
    if (self->_lastMotionActivity.__ptr_.__value_)
      CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
    operator new();
  }
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v8 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
  {
    v9 = *a3;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v13[0] = 2082;
    *(_QWORD *)&v13[1] = "";
    v14 = 1026;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected motion notification\", \"notification\":%{public}d}", buf, 0x18u);
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
  }
  v10 = qword_1022A01E8;
  if (os_signpost_enabled((os_log_t)qword_1022A01E8))
  {
    v11 = *a3;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v13[0] = 2082;
    *(_QWORD *)&v13[1] = "";
    v14 = 1026;
    v15 = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected motion notification", "{\"msg%{public}.0s\":\"Unexpected motion notification\", \"notification\":%{public}d}", buf, 0x18u);
  }
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;

  if (objc_msgSend(a3, "isEqual:", CFSTR("kCLLocationStreamingMessageTypeRequestLocation")))
  {
    v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageGranularityKey"));
    v8 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageIncludeMotionKey"));
    v9 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageInFitnessSessionKey"));
    v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageActivityTypeAirborneKey"));
    v11 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageEmergencyEnablementKey"));
    v12 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageMapMatching"));
    if (v7)
    {
      v13 = v12;
      objc_msgSend(v7, "intValue");
      objc_msgSend(v8, "BOOLValue");
      objc_msgSend(v9, "BOOLValue");
      objc_msgSend(v10, "BOOLValue");
      objc_msgSend(v11, "BOOLValue");
      objc_msgSend(v13, "BOOLValue");
      -[CLLocationStreamer startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAssertionActive:hasMapMatching:](self, "startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAssertionActive:hasMapMatching:");
    }
    else
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102159118);
      v15 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
      {
        v18 = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2082;
        v23 = objc_msgSend(CFSTR("kCLLocationStreamingMessageGranularityKey"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing data\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
        if (qword_1022A01E0 != -1)
          dispatch_once(&qword_1022A01E0, &stru_102159118);
      }
      v16 = qword_1022A01E8;
      if (os_signpost_enabled((os_log_t)qword_1022A01E8))
      {
        v17 = objc_msgSend(CFSTR("kCLLocationStreamingMessageGranularityKey"), "UTF8String");
        v18 = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2082;
        v23 = v17;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing data", "{\"msg%{public}.0s\":\"Missing data\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
      }
    }
  }
  else if (objc_msgSend(a3, "isEqual:", CFSTR("kCLLocationStreamingMessageTypeSetMotionAlarm")))
  {
    if (objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageMotionAlarmStateKey")), "BOOLValue"))-[CLLocationStreamer startMotionAlarm](self, "startMotionAlarm");
    else
      -[CLLocationStreamer stopMotionAlarm](self, "stopMotionAlarm");
  }
  else
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v14 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      v18 = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2082;
      v23 = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Unrecognized message type\", \"type\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)failedToSendMessage:(id)a3 withError:(id)a4 isFatal:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;

  v5 = a5;
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v8 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289794;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
    v14 = 2114;
    v15 = a4;
    v16 = 1026;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Message failed to send\", \"type\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@, \"fatal\":%{public}d}", (uint8_t *)v9, 0x2Cu);
  }
}

- (void)successfullySentMessage:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;

  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v4 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Message sent\", \"type\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);
  }
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;

  v3 = a3;
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_102159118);
  v5 = qword_1022A01E8;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 68289282;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 1026;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", (uint8_t *)&v7, 0x18u);
  }
  if (!v3)
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102159118);
    v6 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Paired device has left us, stopping location\"}", (uint8_t *)&v7, 0x12u);
    }
    -[CLLocationStreamer stopLocation](self, "stopLocation");
  }
}

- (int)currentGranularity
{
  return self->_currentGranularity;
}

- (void)setCurrentGranularity:(int)a3
{
  self->_currentGranularity = a3;
}

- (BOOL)locationUpdatesIncludeMotionState
{
  return self->_locationUpdatesIncludeMotionState;
}

- (void)setLocationUpdatesIncludeMotionState:(BOOL)a3
{
  self->_locationUpdatesIncludeMotionState = a3;
}

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)motionAlarmActive
{
  return self->_motionAlarmActive;
}

- (void)setMotionAlarmActive:(BOOL)a3
{
  self->_motionAlarmActive = a3;
}

- (BOOL)isSubscribedForMotion
{
  return self->_isSubscribedForMotion;
}

- (void)setIsSubscribedForMotion:(BOOL)a3
{
  self->_isSubscribedForMotion = a3;
}

- (CLTimer)resendMotionStateTimer
{
  return self->_resendMotionStateTimer;
}

- (void)setResendMotionStateTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (BOOL)isClientMapMatchingActive
{
  return self->_clientMapMatchingActive;
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CLTimer)aliveAgainThrottleTimer
{
  return self->_aliveAgainThrottleTimer;
}

- (void)setAliveAgainThrottleTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  CLMotionActivity *value;
  Client *v4;
  Client *v5;

  value = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  sub_10088A6B0((uint64_t **)&self->_motionAlarmAssertion, 0);
  v4 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  sub_10088A6B0((uint64_t **)&self->_locationAssertion, 0);
  v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
