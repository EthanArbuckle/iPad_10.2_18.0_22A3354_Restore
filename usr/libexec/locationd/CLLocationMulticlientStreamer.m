@implementation CLLocationMulticlientStreamer

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
  if (qword_10230E658 != -1)
    dispatch_once(&qword_10230E658, &stru_1021B24C8);
  return (id)qword_10230E650;
}

+ (BOOL)isSupported
{
  if (qword_10230E668 != -1)
    dispatch_once(&qword_10230E668, &stru_1021B24E8);
  return byte_10230E660;
}

- (CLLocationMulticlientStreamer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationMulticlientStreamer;
  return -[CLLocationMulticlientStreamer initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationMulticlientStreamerServiceProtocol, &OBJC_PROTOCOL___CLLocationMulticlientStreamerClientProtocol);
}

- (void)beginService
{
  void **v3;
  uint64_t v4;
  id (*v5)(uint64_t);
  void *v6;
  CLLocationMulticlientStreamer *v7;

  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  -[CLLocationMulticlientStreamer setCurrentGranularity:](self, "setCurrentGranularity:", 0);
  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  v3 = _NSConcreteStackBlock;
  v4 = 3221225472;
  v5 = sub_10139BFF4;
  v6 = &unk_10212BB58;
  v7 = self;
  operator new();
}

- (void)endService
{
  Client *value;

  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  sub_10088A6B0((uint64_t **)&self->_locationAssertion, 0);
  -[RPCompanionLinkClient invalidate](-[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"), "invalidate");
  -[CLLocationMulticlientStreamer setRapportStreamingLink:](self, "setRapportStreamingLink:", 0);
  -[RPCompanionLinkClient invalidate](-[CLLocationMulticlientStreamer rapportDiscoveryLink](self, "rapportDiscoveryLink"), "invalidate");
  -[CLLocationMulticlientStreamer setRapportDiscoveryLink:](self, "setRapportDiscoveryLink:", 0);
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
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B2590);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      v9 = 1026;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient #CLEEA change\", \"needed\":%{public}hhd}", (uint8_t *)v6, 0x18u);
    }
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager")), "markClientEmergencyEnablementTransition:", v3);
    self->_emergencyEnablementAssertionActive = v3;
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
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B2590);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Setting fitness activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
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
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B2590);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Setting airborne activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
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

- (void)toggleLocationUpdates:(BOOL)a3 inFitnessSession:(BOOL)a4 inAirborneSession:(BOOL)a5 emergencyEnablementAssertionActive:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B2590);
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68290050;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 1026;
    v16 = v9;
    v17 = 1026;
    v18 = v8;
    v19 = 1026;
    v20 = v7;
    v21 = 1026;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient toggling streaming\", \"state\":%{public}hhd, \"fitness\":%{public}hhd, \"airborne\":%{public}hhd, \"emergency\":%{public}hhd}", (uint8_t *)v12, 0x2Au);
  }
  if (v9)
  {
    -[CLLocationMulticlientStreamer setClientActivityTypeFitnessActive:](self, "setClientActivityTypeFitnessActive:", -[CLLocationMulticlientStreamer isClientActivityTypeFitnessActive](self, "isClientActivityTypeFitnessActive") | v8);
    -[CLLocationMulticlientStreamer setClientActivityTypeAirborneActive:](self, "setClientActivityTypeAirborneActive:", -[CLLocationMulticlientStreamer isClientActivityTypeAirborneActive](self, "isClientActivityTypeAirborneActive") | v7);
    -[CLLocationMulticlientStreamer setEmergencyEnablementAssertionActive:](self, "setEmergencyEnablementAssertionActive:", -[CLLocationMulticlientStreamer emergencyEnablementAssertionActive](self, "emergencyEnablementAssertionActive") | v6);
    if (!-[NSMutableSet count](-[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"), "count"))objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 0, 0);
  }
  else
  {
    -[CLLocationMulticlientStreamer stopLocation](self, "stopLocation");
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
  RPCompanionLinkClient *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  _OWORD v26[8];
  _OWORD v27[2];
  uint64_t buf;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  if (*a3 > 2u)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B2590);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v11 = *a3;
      buf = 68289282;
      v29 = 2082;
      v30 = "";
      v31 = 2050;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Multiclient Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B2590);
    }
    v12 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v13 = *a3;
      buf = 68289282;
      v29 = 2082;
      v30 = "";
      v31 = 2050;
      v32 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Multiclient Unexpected notification", "{\"msg%{public}.0s\":\"#Multiclient Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else if (-[NSMutableSet count](-[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"), "count"))
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
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B2590);
      v22 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)((char *)a4 + 76);
        v24 = *((_QWORD *)a4 + 11);
        buf = 68289538;
        v29 = 2082;
        v30 = "";
        v31 = 2050;
        v32 = v23;
        v33 = 2050;
        v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Dropping location due to expiration\", \"timestamp\":\"%{public}f\", \"lifespan\":\"%{public}f\"}", (uint8_t *)&buf, 0x26u);
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
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[CLStreamedLocationPrivate data](-[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]([CLStreamedLocationPrivate alloc], "initWithDaemonLocationPrivate:", (char *)a4 + 160), "data"), CFSTR("kCLLocationStreamingMessageLocationPrivateKey"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[CLStreamedLocationInternal data](-[CLStreamedLocationInternal initWithDaemonLocation:]([CLStreamedLocationInternal alloc], "initWithDaemonLocation:", a4), "data"), CFSTR("kCLLocationStreamingMessageLocationInternalKey"));
      v21 = -[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink");
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10139CAAC;
      v25[3] = &unk_102143618;
      v25[4] = self;
      -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](v21, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.locationd.rapport.stream-event"), v20, RPDestinationIdentifierInterestedPeers, 0, v25);
    }
  }
}

- (void)registerRequestHandlers
{
  NSObject *v3;
  RPCompanionLinkClient *rapportDiscoveryLink;
  uint64_t v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[2];
  uint64_t v11;
  NSNumber *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B2590);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Multiclient registering request handlers\"}", buf, 0x12u);
  }
  rapportDiscoveryLink = self->_rapportDiscoveryLink;
  v5 = RPOptionStatusFlags;
  v11 = RPOptionStatusFlags;
  v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 532482);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10139CEF0;
  v8[3] = &unk_1021B2510;
  v8[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](rapportDiscoveryLink, "registerRequestID:options:handler:", CFSTR("com.apple.locationd.rapport.availability-interest"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), v8);
  v6 = self->_rapportDiscoveryLink;
  v9[1] = v5;
  v10[0] = &__kCFBooleanTrue;
  v9[0] = RPOptionInterest;
  v10[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 532482);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10139D0FC;
  v7[3] = &unk_1021B2510;
  v7[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](v6, "registerRequestID:options:handler:", CFSTR("com.apple.locationd.rapport.stream-request"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2), v7);
}

- (void)activateRapportLinkIfNecessary
{
  RPCompanionLinkClient *v3;
  _QWORD v4[5];

  if (!self->_rapportDiscoveryLink)
  {
    self->_rapportDiscoveryLink = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](self->_rapportDiscoveryLink, "setDispatchQueue:", objc_msgSend(objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo"), "queue"));
    -[RPCompanionLinkClient setControlFlags:](self->_rapportDiscoveryLink, "setControlFlags:", 2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10139D654;
    v4[3] = &unk_102143640;
    v4[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_rapportDiscoveryLink, "setDeviceLostHandler:", v4);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_rapportDiscoveryLink, "setDeviceFoundHandler:", &stru_1021B2530);
    -[CLLocationMulticlientStreamer registerRequestHandlers](self, "registerRequestHandlers");
    -[RPCompanionLinkClient activateWithCompletion:](self->_rapportDiscoveryLink, "activateWithCompletion:", &stru_1021B2550);
  }
  if (!-[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"))
  {
    v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    self->_rapportStreamingLink = v3;
    if (v3)
    {
      -[RPCompanionLinkClient setDispatchQueue:](self->_rapportStreamingLink, "setDispatchQueue:", objc_msgSend(objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo"), "queue"));
      -[RPCompanionLinkClient setControlFlags:](self->_rapportStreamingLink, "setControlFlags:", 2);
      -[RPCompanionLinkClient activateWithCompletion:](-[CLLocationMulticlientStreamer rapportStreamingLink](self, "rapportStreamingLink"), "activateWithCompletion:", &stru_1021B2570);
    }
  }
}

- (void)stopLocation
{
  CLRollingPowerAssertion *value;
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo");
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 0);
  -[NSMutableSet removeAllObjects](-[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"), "removeAllObjects");
  -[CLLocationMulticlientStreamer setEmergencyEnablementAssertionActive:](self, "setEmergencyEnablementAssertionActive:", 0);
  -[CLLocationMulticlientStreamer setCurrentGranularity:](self, "setCurrentGranularity:", 0);
  -[CLLocationMulticlientStreamer setClientActivityTypeFitnessActive:](self, "setClientActivityTypeFitnessActive:", 0);
  -[CLLocationMulticlientStreamer setClientActivityTypeAirborneActive:](self, "setClientActivityTypeAirborneActive:", 0);
  value = self->_locationAssertion.__ptr_.__value_;
  objc_msgSend(*((id *)value + 1), "setNextFireDelay:", 1.79769313e308);
  v4 = *(_QWORD *)value;
  *(_QWORD *)value = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B2590);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Shut down location streaming\"}", (uint8_t *)v6, 0x12u);
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

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (RPCompanionLinkClient)rapportDiscoveryLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRapportDiscoveryLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)activeStreamingClients
{
  return self->_activeStreamingClients;
}

- (void)setActiveStreamingClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (RPCompanionLinkClient)rapportStreamingLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRapportStreamingLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  Client *value;

  sub_10088A6B0((uint64_t **)&self->_locationAssertion, 0);
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
