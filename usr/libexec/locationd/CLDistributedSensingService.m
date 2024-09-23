@implementation CLDistributedSensingService

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
  if (qword_1023016A0 != -1)
    dispatch_once(&qword_1023016A0, &stru_102140BD8);
  return (id)qword_102301698;
}

+ (BOOL)isSupported
{
  sub_100197040();
  if ((sub_1000C4240() & 1) != 0)
    return 1;
  sub_100197040();
  if ((sub_100081BD0() & 1) != 0)
    return 1;
  sub_100197040();
  return sub_10011E0F0();
}

- (CLDistributedSensingService)init
{
  CLDistributedSensingService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLDistributedSensingService;
  v2 = -[CLDistributedSensingService initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDistributedSensingServiceProtocol, &OBJC_PROTOCOL___CLDistributedSensingServiceClientProtocol);
  -[CLDistributedSensingService listenerInit](v2, "listenerInit");
  -[CLDistributedSensingService providerInit](v2, "providerInit");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDistributedSensingService listenerDealloc](self, "listenerDealloc");
  -[CLDistributedSensingService providerDealloc](self, "providerDealloc");
  v3.receiver = self;
  v3.super_class = (Class)CLDistributedSensingService;
  -[CLDistributedSensingService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  -[CLDistributedSensingService listenerBeginService](self, "listenerBeginService");
  -[CLDistributedSensingService providerBeginService](self, "providerBeginService");
}

- (void)endService
{
  -[CLDistributedSensingService listenerEndService](self, "listenerEndService");
  -[CLDistributedSensingService providerEndService](self, "providerEndService");
}

- (void).cxx_destruct
{
  uint64_t v3;
  DSMotionProvider *vehicleStateProvider;
  uint64_t v5;

  v3 = *(_QWORD *)&self->_proactiveVehicleDetectionEnabled;
  *(_QWORD *)&self->_proactiveVehicleDetectionEnabled = 0;
  if (v3)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v3 + 8))(v3, a2);
  vehicleStateProvider = self->_vehicleStateProvider;
  self->_vehicleStateProvider = 0;
  if (vehicleStateProvider)
    (*(void (**)(DSMotionProvider *, SEL))(*(_QWORD *)vehicleStateProvider + 8))(vehicleStateProvider, a2);
  v5 = *(_QWORD *)&self->_mostRecentVehicleState.state;
  *(_QWORD *)&self->_mostRecentVehicleState.state = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (void)toggleProactiveVehicleDetection:(BOOL)a3
{
  double Current;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double timeBetweenProactiveVehicleDetection;
  id v9;
  double v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t *v17;
  _QWORD v18[5];
  double v19;
  double v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  uint8_t buf[4];
  _BYTE v26[18];

  if (LOBYTE(self->_proactiveVehicleDetectionTimer))
  {
    if (a3)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v20 = Current;
      v19 = 1.79769313e308;
      v5 = sub_1001FD94C();
      sub_1001FD9FC(v5, (uint64_t)CFSTR("DistributedSensingProactiveVehicleStateSubscriptionTimestamp"), &v19);
      if (vabdd_f64(Current, v19) <= *(double *)&self->_vehicleStateClient.__ptr_.__value_)
      {
        if (qword_10229FEE0 != -1)
          dispatch_once(&qword_10229FEE0, &stru_102142038);
        v16 = qword_10229FEE8;
        if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134283777;
          *(double *)v26 = Current;
          *(_WORD *)&v26[8] = 2049;
          *(double *)&v26[10] = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Provider, Too frequent proactive vehicle detection request, declined, %{private}.3f, %{private}.3f", buf, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FEE0 != -1)
            dispatch_once(&qword_10229FEE0, &stru_102142038);
          v21 = 134283777;
          v22 = Current;
          v23 = 2049;
          v24 = v19;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, Too frequent proactive vehicle detection request, declined, %{private}.3f, %{private}.3f", &v21, 22);
          goto LABEL_42;
        }
      }
      else
      {
        v6 = sub_1001FD94C();
        sub_10018A534(v6, CFSTR("DistributedSensingProactiveVehicleStateSubscriptionTimestamp"), &v20);
        v7 = sub_1001FD94C();
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 944))(v7);
        timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
        if (timeBetweenProactiveVehicleDetection == 0.0)
        {
          v9 = objc_msgSend(-[CLDistributedSensingService silo](self, "silo"), "newTimer");
          *(_QWORD *)&self->_timeBetweenProactiveVehicleDetection = v9;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10052F1B0;
          v18[3] = &unk_10212BB58;
          v18[4] = self;
          objc_msgSend(v9, "setHandler:", v18);
          timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
        }
        objc_msgSend(*(id *)&timeBetweenProactiveVehicleDetection, "nextFireDelay");
        if (v10 == 1.79769313e308)
        {
          sub_1018BEA14(buf, "ProactiveVehicleDetectionDurationSeconds", &qword_101BB5808, 0);
          objc_msgSend(*(id *)&self->_timeBetweenProactiveVehicleDetection, "setNextFireDelay:", *(double *)&v26[4]);
          objc_msgSend(*((id *)self->_vehicleStateProvider + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_vehicleStateProvider + 1), 0, 0);
          if (qword_10229FEE0 != -1)
            dispatch_once(&qword_10229FEE0, &stru_102142038);
          v11 = qword_10229FEE8;
          if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Provider, Starting proactive vehicle detection", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FEE0 != -1)
              dispatch_once(&qword_10229FEE0, &stru_102142038);
            LOWORD(v21) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, Starting proactive vehicle detection", &v21, 2);
LABEL_42:
            v17 = (uint8_t *)v12;
            sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) toggleProactiveVehicleDetection:]", "%s\n", v12);
            if (v17 != buf)
              free(v17);
          }
        }
      }
    }
    else
    {
      objc_msgSend(*((id *)self->_vehicleStateProvider + 2), "unregister:forNotification:", *((_QWORD *)self->_vehicleStateProvider + 1), 0);
      v14 = self->_timeBetweenProactiveVehicleDetection;
      if (v14 != 0.0)
        objc_msgSend(*(id *)&v14, "setNextFireDelay:", 1.79769313e308);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      v15 = qword_10229FEE8;
      if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Provider, Stopping proactive vehicle detection", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEE0 != -1)
          dispatch_once(&qword_10229FEE0, &stru_102142038);
        LOWORD(v21) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, Stopping proactive vehicle detection", &v21, 2);
        goto LABEL_42;
      }
    }
  }
  else
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v13 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Proactive vehicle detection is DISABLED", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 1, "Proactive vehicle detection is DISABLED", &v21, 2);
      goto LABEL_42;
    }
  }
}

- (void)sendVehicleState
{
  _objc_msgSend(*(id *)&self->_isConnectedToStationaryWifi, "sendMotionData:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &self->_mostRecentVehicleState, 16));
}

- (void)toggleVehicleStateProvider:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4)
  {
    if (a3)
    {
      v5 = (id)objc_opt_new(DSClientMotionDataOptions);
      objc_msgSend(v5, "setDeviceType:", 1);
      objc_msgSend(v5, "setDataSubType:", 1);
      _objc_msgSend(*(id *)&self->_isConnectedToStationaryWifi, "startMotionDataProviderWithOptions:", v5);
    }
    else
    {
      objc_msgSend(v4, "stopMotionDataProvider");
    }
  }
}

- (void)dsmotionDidStartProvider:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v3 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Provider, started", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, started", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidStartProvider:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)dsmotion:(id)a3 didFailToStartProviderWithError:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v5 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Provider, failed to start with error, %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v8 = 138412290;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 16, "Provider, failed to start with error, %@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) dsmotion:didFailToStartProviderWithError:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)dsmotionDidExpireMotionDataSubscription:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v4 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Provider, subscription expired", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, subscription expired", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidExpireMotionDataSubscription:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  objc_msgSend(objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDistributedSensingService")), "providerUnsubscribeToMotionDataType:", 1);
}

- (void)dsmotionDidUnsubscribeToMotionData:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v4 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Provider, un-subscribed", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, un-subscribed", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotionDidUnsubscribeToMotionData:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  objc_msgSend(objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDistributedSensingService")), "providerUnsubscribeToMotionDataType:", 1);
}

- (void)dsmotion:(id)a3 didSubscribeToMotionDataWithOptions:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v6 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174913;
    v14 = objc_msgSend(a4, "deviceType");
    v15 = 1025;
    v16 = objc_msgSend(a4, "dataSubType");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provider, subscribed with options, %{private}u, %{private}u", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v7 = qword_10229FEE8;
    v10[0] = 67174913;
    v10[1] = objc_msgSend(a4, "deviceType");
    v11 = 1025;
    v12 = objc_msgSend(a4, "dataSubType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "Provider, subscribed with options, %{private}u, %{private}u", v10, 14);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotion:didSubscribeToMotionDataWithOptions:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  objc_msgSend(objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDistributedSensingService")), "providerSubscribeToMotionDataType:", objc_msgSend(a4, "dataSubType"));
}

- (void)dsmotion:(id)a3 didRequestMotionDataWithOptions:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102142038);
  v6 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174913;
    v14 = objc_msgSend(a4, "deviceType");
    v15 = 1025;
    v16 = objc_msgSend(a4, "dataSubType");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provider, queried with options, %{private}u, %{private}u", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v7 = qword_10229FEE8;
    v10[0] = 67174913;
    v10[1] = objc_msgSend(a4, "deviceType");
    v11 = 1025;
    v12 = objc_msgSend(a4, "dataSubType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "Provider, queried with options, %{private}u, %{private}u", v10, 14);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) dsmotion:didRequestMotionDataWithOptions:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  objc_msgSend(objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDistributedSensingService")), "providerQueryMotionDataType:", objc_msgSend(a4, "dataSubType"));
}

- (void)providerInit
{
  DSMotionProvider *vehicleStateProvider;

  *(_QWORD *)&self->_isConnectedToStationaryWifi = 0;
  vehicleStateProvider = self->_vehicleStateProvider;
  self->_vehicleStateProvider = 0;
  if (vehicleStateProvider)
    (*(void (**)(DSMotionProvider *, SEL))(*(_QWORD *)vehicleStateProvider + 8))(vehicleStateProvider, a2);
  self->_mostRecentVehicleState.version = 0;
  *(_QWORD *)(&self->_mostRecentVehicleState.version + 1) = -1;
  *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
  BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
  HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
  self->_vehicleStateClient.__ptr_.__value_ = (Client *)0x7FEFFFFFFFFFFFFFLL;
  self->_timeBetweenProactiveVehicleDetection = 0.0;
  LOBYTE(self->_proactiveVehicleDetectionTimer) = 0;
}

- (void)providerDealloc
{
  double timeBetweenProactiveVehicleDetection;
  void *v4;

  timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
  if (timeBetweenProactiveVehicleDetection != 0.0)
  {

    self->_timeBetweenProactiveVehicleDetection = 0.0;
  }
  v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4)
  {

    *(_QWORD *)&self->_isConnectedToStationaryWifi = 0;
  }
}

- (void)providerBeginService
{
  sub_100197040();
  if ((sub_1001B7910() & 0x800000000) != 0)
  {
    *(_QWORD *)&self->_isConnectedToStationaryWifi = objc_msgSend(objc_alloc((Class)DSMotionProvider), "initWithDelegate:queue:", self, 0);
    -[CLDistributedSensingService toggleVehicleStateProvider:](self, "toggleVehicleStateProvider:", 1);
    -[CLDistributedSensingService universe](self, "universe");
    sub_10144EC5C();
  }
}

- (void)providerEndService
{
  double timeBetweenProactiveVehicleDetection;
  void *v4;
  DSMotionProvider *vehicleStateProvider;

  timeBetweenProactiveVehicleDetection = self->_timeBetweenProactiveVehicleDetection;
  if (timeBetweenProactiveVehicleDetection != 0.0)
    objc_msgSend(*(id *)&timeBetweenProactiveVehicleDetection, "invalidate");
  v4 = *(void **)&self->_isConnectedToStationaryWifi;
  if (v4)
    objc_msgSend(v4, "stopMotionDataProvider");
  vehicleStateProvider = self->_vehicleStateProvider;
  if (vehicleStateProvider)
  {
    self->_vehicleStateProvider = 0;
    (*(void (**)(DSMotionProvider *))(*(_QWORD *)vehicleStateProvider + 8))(vehicleStateProvider);
  }
}

- (void)providerSubscribeToMotionDataType:(unsigned int)a3
{
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _DWORD v8[4];
  uint8_t buf[4];
  unsigned int v10;

  if ((a3 & 1) != 0)
  {
    -[CLDistributedSensingService toggleProactiveVehicleDetection:](self, "toggleProactiveVehicleDetection:", 1);
    -[CLDistributedSensingService sendVehicleState](self, "sendVehicleState");
  }
  else
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v4 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported subscription request for data type, %{private}u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      v8[0] = 67174657;
      v8[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 16, "Provider, Unsupported subscription request for data type, %{private}u", v8, 8);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerSubscribeToMotionDataType:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)providerUnsubscribeToMotionDataType:(unsigned int)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _DWORD v7[4];
  uint8_t buf[4];
  unsigned int v9;

  if ((a3 & 1) != 0)
  {
    -[CLDistributedSensingService toggleProactiveVehicleDetection:](self, "toggleProactiveVehicleDetection:", 0);
  }
  else
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v4 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported un-subscribe request for data type, %{private}u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      v7[0] = 67174657;
      v7[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 16, "Provider, Unsupported un-subscribe request for data type, %{private}u", v7, 8);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerUnsubscribeToMotionDataType:]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)providerQueryMotionDataType:(unsigned int)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _DWORD v7[4];
  uint8_t buf[4];
  unsigned int v9;

  if ((a3 & 1) != 0)
  {
    -[CLDistributedSensingService sendVehicleState](self, "sendVehicleState");
  }
  else
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102142038);
    v4 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Provider, Unsupported query for data type, %{private}u", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      v7[0] = 67174657;
      v7[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 16, "Provider, Unsupported query for data type, %{private}u", v7, 8);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Provider) providerQueryMotionDataType:]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)providerOnVehicleStateNotification:(VehicleStateData *)a3
{
  unint64_t var1;
  unint64_t var0;
  char v7;
  $AB39ED2DFAC8EFCDE5B985891F130C8A *p_mostRecentVehicleState;
  CFAbsoluteTime Current;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  int v13;
  int timestamp_high;
  int v15;
  int v16;
  const char *v17;
  uint8_t *v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;

  if (*(_QWORD *)&self->_isConnectedToStationaryWifi)
  {
    var0 = a3->var0;
    var1 = a3->var1;
    v7 = (var1 & 0x12) != 0 ? 2 : (a3->var1 & 9) != 0;
    p_mostRecentVehicleState = &self->_mostRecentVehicleState;
    if (*(_QWORD *)(&self->_mostRecentVehicleState.version + 1) == -1
      || *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) != (unsigned __int16)var0
      || HIWORD(self->_mostRecentVehicleState.timestamp) != (unsigned __int16)var1)
    {
      if (var0 == 2)
        -[CLDistributedSensingService toggleProactiveVehicleDetection:](self, "toggleProactiveVehicleDetection:", 0);
      Current = CFAbsoluteTimeGetCurrent();
      v10 = a3->var0;
      v11 = a3->var1;
      p_mostRecentVehicleState->version = 1;
      *(_QWORD *)(&p_mostRecentVehicleState->version + 1) = (unint64_t)Current;
      *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1) = v10;
      BYTE5(p_mostRecentVehicleState->timestamp) = v7;
      HIWORD(p_mostRecentVehicleState->timestamp) = v11;
      -[CLDistributedSensingService sendVehicleState](self, "sendVehicleState");
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102142038);
      v12 = qword_10229FEE8;
      if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
        timestamp_high = HIWORD(p_mostRecentVehicleState->timestamp);
        *(_DWORD *)buf = 67174913;
        v23 = v13;
        v24 = 1025;
        v25 = timestamp_high;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Provider, Vehicle State update, state, %{private}d, hints, 0x%{private}x", buf, 0xEu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEE0 != -1)
          dispatch_once(&qword_10229FEE0, &stru_102142038);
        v15 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
        v16 = HIWORD(p_mostRecentVehicleState->timestamp);
        v19[0] = 67174913;
        v19[1] = v15;
        v20 = 1025;
        v21 = v16;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Provider, Vehicle State update, state, %{private}d, hints, 0x%{private}x", v19, 14);
        v18 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Provider) providerOnVehicleStateNotification:]", "%s\n", v17);
        if (v18 != buf)
          free(v18);
      }
    }
  }
}

- (void)providerFitnessTrackingNotification:(BOOL)a3
{
  CLDistributedSensingService *v4;
  uint64_t v5;

  if (a3)
  {
    -[CLDistributedSensingService toggleVehicleStateProvider:](self, "toggleVehicleStateProvider:", 1);
    if (!objc_msgSend(*(id *)&self->_isConnectedToStationaryWifi, "isSubscriptionActive"))
      return;
    v4 = self;
    v5 = 1;
  }
  else
  {
    -[CLDistributedSensingService toggleVehicleStateProvider:](self, "toggleVehicleStateProvider:", 0);
    v4 = self;
    v5 = 0;
  }
  -[CLDistributedSensingService toggleProactiveVehicleDetection:](v4, "toggleProactiveVehicleDetection:", v5);
}

- (void)listenerInit
{
  self->_vehicleStateListener = 0;
  self->_vehicleStateListenerKeepAliveTimer = 0;
  LOBYTE(self->_wifiServiceClient.__ptr_.__value_) = 0;
  self->_mostRecentVehicleState.version = 0;
  *(_QWORD *)(&self->_mostRecentVehicleState.version + 1) = -1;
  *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
  BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
  HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
}

- (void)listenerDealloc
{
  CLTimer *vehicleStateListenerKeepAliveTimer;
  DSMotionListener *vehicleStateListener;
  uint64_t v5;

  vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
  if (vehicleStateListenerKeepAliveTimer)
  {

    self->_vehicleStateListenerKeepAliveTimer = 0;
  }
  vehicleStateListener = self->_vehicleStateListener;
  if (vehicleStateListener)
  {

    self->_vehicleStateListener = 0;
  }
  v5 = *(_QWORD *)&self->_mostRecentVehicleState.state;
  *(_QWORD *)&self->_mostRecentVehicleState.state = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

- (void)listenerBeginService
{
  self->_clients[0] = objc_opt_new(NSMutableSet);
  -[CLDistributedSensingService universe](self, "universe");
  sub_1001B7DEC();
}

- (void)listenerEndService
{
  CLTimer *vehicleStateListenerKeepAliveTimer;
  DSMotionListener *vehicleStateListener;

  vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
  if (vehicleStateListenerKeepAliveTimer)
    -[CLTimer invalidate](vehicleStateListenerKeepAliveTimer, "invalidate");
  vehicleStateListener = self->_vehicleStateListener;
  if (vehicleStateListener)
    -[DSMotionListener stopMotionDataListener](vehicleStateListener, "stopMotionDataListener");
}

- (void)dsmotionDidStartListener:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102161B40);
  v3 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Listener, started", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Listener, started", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) dsmotionDidStartListener:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)dsmotion:(id)a3 didFailToStartListenerWithError:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102161B40);
  v5 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Listener, failed to start with error, %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v8 = 138412290;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 16, "Listener, failed to start with error, %@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Listener) dsmotion:didFailToStartListenerWithError:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)dsmotion:(id)a3 didReceiveMotionData:(id)a4 fromProvider:(id)a5
{
  _objc_msgSend(objc_msgSend(-[CLDistributedSensingService vendor](self, "vendor", a3, a4, a5), "proxyForService:", CFSTR("CLDistributedSensingService")), "listenerVehicleStateUpdate:", a4);
}

- (void)toggleVehicleStateListener:(BOOL)a3
{
  DSMotionListener *vehicleStateListener;
  CLTimer *vehicleStateListenerKeepAliveTimer;
  NSObject *v6;
  int value_low;
  CLTimer *v8;
  CLTimer *v9;
  double v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  uint8_t *v16;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  _QWORD v21[204];

  if (!a3 || LOBYTE(self->_wifiServiceClient.__ptr_.__value_))
  {
    vehicleStateListener = self->_vehicleStateListener;
    if (vehicleStateListener)
    {
      -[DSMotionListener stopMotionDataListener](vehicleStateListener, "stopMotionDataListener");

      self->_vehicleStateListener = 0;
    }
    vehicleStateListenerKeepAliveTimer = self->_vehicleStateListenerKeepAliveTimer;
    if (vehicleStateListenerKeepAliveTimer)
      -[CLTimer setNextFireDelay:interval:](vehicleStateListenerKeepAliveTimer, "setNextFireDelay:interval:", 1.79769313e308, 1.79769313e308);
    self->_mostRecentVehicleState.version = 0;
    *(_QWORD *)(&self->_mostRecentVehicleState.version + 1) = -1;
    *(_DWORD *)((char *)&self->_mostRecentVehicleState.timestamp + 1) = 0;
    BYTE5(self->_mostRecentVehicleState.timestamp) = 0;
    HIWORD(self->_mostRecentVehicleState.timestamp) = 0;
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v6 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_INFO))
    {
      value_low = LOBYTE(self->_wifiServiceClient.__ptr_.__value_);
      *(_DWORD *)buf = 67174657;
      LODWORD(v21[0]) = value_low;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Listener, Keep alive timer expired / connected to Stationary Wifi, %{private}d, un-subscribed to Vehicle State", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v15 = LOBYTE(self->_wifiServiceClient.__ptr_.__value_);
    v18 = 67174657;
    LODWORD(v19) = v15;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 1, "Listener, Keep alive timer expired / connected to Stationary Wifi, %{private}d, un-subscribed to Vehicle State", &v18, 8);
LABEL_28:
    v16 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) toggleVehicleStateListener:]", "%s\n", v14);
    if (v16 != buf)
      free(v16);
    return;
  }
  v8 = self->_vehicleStateListenerKeepAliveTimer;
  if (!v8)
  {
    v9 = (CLTimer *)objc_msgSend(-[CLDistributedSensingService silo](self, "silo"), "newTimer");
    self->_vehicleStateListenerKeepAliveTimer = v9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1009A2A30;
    v17[3] = &unk_10212BB58;
    v17[4] = self;
    -[CLTimer setHandler:](v9, "setHandler:", v17);
    v8 = self->_vehicleStateListenerKeepAliveTimer;
  }
  -[CLTimer fireInterval](v8, "fireInterval");
  if (v10 == 1.79769313e308)
  {
    self->_vehicleStateListener = (DSMotionListener *)objc_msgSend(objc_alloc((Class)DSMotionListener), "initWithDelegate:queue:", self, 0);
    v11 = (void *)objc_opt_new(DSClientMotionDataOptions);
    objc_msgSend(v11, "setDeviceType:", 1);
    objc_msgSend(v11, "setDataSubType:", 1);
    -[DSMotionListener startMotionDataListenerWithOptions:](self->_vehicleStateListener, "startMotionDataListenerWithOptions:", v11);

  }
  sub_1018BEA14(buf, "kVehicleStateListenerKeepAliveTimerDurationSeconds", &qword_101BE9E58, 0);
  v12 = *(_QWORD *)((char *)v21 + 4);
  -[CLTimer setNextFireDelay:interval:](self->_vehicleStateListenerKeepAliveTimer, "setNextFireDelay:interval:", *(double *)((char *)v21 + 4), *(double *)((char *)v21 + 4));
  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102161B40);
  v13 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Listener, Subscribed to Vehicle State, starting keep alive timer, duration, %.3f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v18 = 134217984;
    v19 = v12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Listener, Subscribed to Vehicle State, starting keep alive timer, duration, %.3f");
    goto LABEL_28;
  }
}

- (void)registerClient:(id)a3 forNotification:(int)a4
{
  NSMutableSet *v7;
  NSObject *v8;
  CMVehicleStateData *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v7 = self->_clients[a4];
  -[NSMutableSet addObject:](v7, "addObject:");
  if (!a4)
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v8 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = -[NSMutableSet count](v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Listener, Client register for Vehicle State, num client, %lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102161B40);
      v10 = qword_10229FEE8;
      v13 = 134217984;
      v14 = -[NSMutableSet count](v7, "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "Listener, Client register for Vehicle State, num client, %lu", &v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) registerClient:forNotification:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLDistributedSensingService toggleVehicleStateListener:](self, "toggleVehicleStateListener:", 1);
    v9 = -[CMVehicleStateData initWithTimestamp:state:hints:]([CMVehicleStateData alloc], "initWithTimestamp:state:hints:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)*(unint64_t *)(&self->_mostRecentVehicleState.version + 1)), *(unsigned int *)((char *)&self->_mostRecentVehicleState.timestamp + 1), HIWORD(self->_mostRecentVehicleState.timestamp));
    objc_msgSend(a3, "onVehicleStateUpdate:", v9);

  }
}

- (void)unregisterClient:(id)a3 forNotification:(int)a4
{
  NSMutableSet *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = self->_clients[a4];
  -[NSMutableSet removeObject:](v5, "removeObject:", a3);
  if (!a4)
  {
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v6 = qword_10229FEE8;
    if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = -[NSMutableSet count](v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Listener, Client de-register for Vehicle State, num client, %lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102161B40);
      v7 = qword_10229FEE8;
      v10 = 134217984;
      v11 = -[NSMutableSet count](v5, "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "Listener, Client de-register for Vehicle State, num client, %lu", &v10);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) unregisterClient:forNotification:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)listenerVehicleStateUpdate:(id)a3
{
  $AB39ED2DFAC8EFCDE5B985891F130C8A *p_mostRecentVehicleState;
  NSObject *v5;
  int v6;
  int timestamp_high;
  CMVehicleStateData *v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  int v14;
  int v15;
  const char *v16;
  uint8_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _DWORD v23[2];
  __int16 v24;
  int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;

  p_mostRecentVehicleState = &self->_mostRecentVehicleState;
  objc_msgSend(a3, "getBytes:length:", &self->_mostRecentVehicleState, 16);
  if (qword_10229FEE0 != -1)
    dispatch_once(&qword_10229FEE0, &stru_102161B40);
  v5 = qword_10229FEE8;
  if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
    timestamp_high = HIWORD(p_mostRecentVehicleState->timestamp);
    *(_DWORD *)buf = 67174913;
    v27 = v6;
    v28 = 1025;
    v29 = timestamp_high;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Listener, Vehicle State update, state, %{private}d, hints, 0x%{private}x", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEE0 != -1)
      dispatch_once(&qword_10229FEE0, &stru_102161B40);
    v14 = *(_DWORD *)((char *)&p_mostRecentVehicleState->timestamp + 1);
    v15 = HIWORD(p_mostRecentVehicleState->timestamp);
    v23[0] = 67174913;
    v23[1] = v14;
    v24 = 1025;
    v25 = v15;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 0, "Listener, Vehicle State update, state, %{private}d, hints, 0x%{private}x", v23, 14);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLDistributedSensingService(Listener) listenerVehicleStateUpdate:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  v8 = -[CMVehicleStateData initWithTimestamp:state:hints:]([CMVehicleStateData alloc], "initWithTimestamp:state:hints:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)*(unint64_t *)(&p_mostRecentVehicleState->version + 1)), *(unsigned int *)((char *)&p_mostRecentVehicleState->timestamp + 1), HIWORD(p_mostRecentVehicleState->timestamp));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_clients[0];
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "onVehicleStateUpdate:", v8);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)listenerOnWifiServiceNotification:(int)a3 data:(id)a4
{
  NSObject *v5;
  int *v7;
  char v8;
  _BOOL8 v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x7F3F) != 0)
    {
      if (qword_10229FEE0 != -1)
        dispatch_once(&qword_10229FEE0, &stru_102161B40);
      v5 = qword_10229FEE8;
      if (os_log_type_enabled((os_log_t)qword_10229FEE8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Listener, Unhandled WiFi Service notification, %d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEE0 != -1)
          dispatch_once(&qword_10229FEE0, &stru_102161B40);
        v12[0] = 67109120;
        v12[1] = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEE8, 17, "Listener, Unhandled WiFi Service notification, %d", v12);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 0, "-[CLDistributedSensingService(Listener) listenerOnWifiServiceNotification:data:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
    else
    {
      v7 = (int *)sub_1000ACC08(a4, (uint64_t)a2);
      if (v7)
      {
        v8 = *((_BYTE *)v7 + 96);
        if (v8)
          v8 = v7[12] >= 1 && *((_BYTE *)v7 + 73) == 0;
        LOBYTE(self->_wifiServiceClient.__ptr_.__value_) = v8;
        if (-[NSMutableSet count](self->_clients[0], "count"))
          v9 = LOBYTE(self->_wifiServiceClient.__ptr_.__value_) == 0;
        else
          v9 = 0;
        -[CLDistributedSensingService toggleVehicleStateListener:](self, "toggleVehicleStateListener:", v9);
      }
    }
  }
}

@end
