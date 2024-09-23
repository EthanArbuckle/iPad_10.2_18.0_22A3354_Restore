@implementation CLPedestrianFenceService

+ (BOOL)isAvailable
{
  BOOL result;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  _QWORD v9[2];
  uint8_t buf[1640];

  if ((_os_feature_enabled_impl("CoreLocation", "PedestrianFence") & 1) != 0)
  {
    sub_100197040();
    if ((sub_10075E738() & 1) != 0)
      return 1;
    sub_100197040();
    if ((sub_10075E7E8() & 1) != 0)
      return 1;
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v5 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    v6 = sub_1001BFF7C(115, 0);
    result = 0;
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      LOWORD(v9[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Pedestrian fence not supported", v9, 2, v9[0]);
LABEL_22:
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "+[CLPedestrianFenceService isAvailable]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
      return 0;
    }
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v3 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Pedestrian fence not enabled", buf, 2u);
    }
    v4 = sub_1001BFF7C(115, 0);
    result = 0;
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      LOWORD(v9[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Pedestrian fence not enabled", v9, 2, v9[0]);
      goto LABEL_22;
    }
  }
  return result;
}

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
  if (qword_10230E220 != -1)
    dispatch_once(&qword_10230E220, &stru_1021AE180);
  return (id)qword_10230E218;
}

- (CLPedestrianFenceService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceService;
  return -[CLPedestrianFenceService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPedestrianFenceServiceProtocol, &OBJC_PROTOCOL___CLPedestrianFenceServiceClientProtocol);
}

- (void)dealloc
{
  objc_super v3;

  self->_clientsInSession = 0;
  self->_analyticsManager = 0;
  -[CLTimer invalidate](self->_intervalTimer, "invalidate");

  self->_intervalTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceService;
  -[CLPedestrianFenceService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
  if (!self->_fenceExitDispatcher.__ptr_.__value_)
  {
    objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
    operator new();
  }
  if (!self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
    operator new();
  }
  self->_sequenceNumber = 1;
  -[CLPedestrianFenceService setIntervalTimer:](self, "setIntervalTimer:", objc_msgSend(objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo"), "newTimer"));
  -[CLPedestrianFenceService setClientsInSession:](self, "setClientsInSession:", objc_alloc_init((Class)NSMutableSet));
  -[CLPedestrianFenceService setAnalyticsManager:](self, "setAnalyticsManager:", objc_alloc_init(CLPedestrianFenceAnalyticsManager));
  -[CLPedestrianFenceService toggleSession:](self, "toggleSession:", 0);
}

- (void)endService
{
  uint64_t v3;
  Dispatcher *value;
  uint64_t v5;
  Dispatcher *v6;

  objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo");
  if (self->_fenceExitDispatcher.__ptr_.__value_)
  {
    v3 = sub_1000A652C(0);
    sub_1000A4A6C(v3, 46, (uint64_t)self->_fenceExitDispatcher.__ptr_.__value_);
    value = self->_fenceExitDispatcher.__ptr_.__value_;
    self->_fenceExitDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
  }
  if (self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    v5 = sub_1000A652C(0);
    sub_1000A4A6C(v5, 49, (uint64_t)self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_);
    v6 = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
    self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Dispatcher *))(*(_QWORD *)v6 + 8))(v6);
  }
  -[CLPedestrianFenceService toggleSession:](self, "toggleSession:", 0);
}

- (void)getSupportedFenceTypesWithReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  sub_100197040();
  if (sub_10075E738())
    v4 = 2;
  else
    v4 = 0;
  sub_100197040();
  v5 = v4 | sub_10075E7E8();
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (void)startSessionForClient:(id)a3
{
  -[CLPedestrianFenceService startSessionForClient:withIdentifier:](self, "startSessionForClient:withIdentifier:", a3, CFSTR("locationd"));
}

- (void)startSessionForClient:(id)a3 withIdentifier:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  CLPedestrianFenceSession *v12;
  double v13;
  CLPedestrianFenceSession *v14;
  const char *v15;
  int v16;
  id v17;
  uint8_t buf[4];
  id v19;

  if (!+[CLPedestrianFenceService isAvailable](CLPedestrianFenceService, "isAvailable"))
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v11 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    LOWORD(v16) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Pedestrian fence not supported", &v16, 2);
    v10 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]", "%s\n", v15);
    if (v10 == buf)
      return;
LABEL_22:
    free(v10);
    return;
  }
  if (!-[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a3))
  {
    v12 = [CLPedestrianFenceSession alloc];
    -[NSDate timeIntervalSince1970](+[NSDate date](NSDate, "date"), "timeIntervalSince1970");
    v14 = -[CLPedestrianFenceSession initWithClient:identifier:atTime:atMonotonicTime:](v12, "initWithClient:identifier:atTime:atMonotonicTime:", a3, a4, v13, sub_1001FCBB4());
    -[NSMutableSet addObject:](-[CLPedestrianFenceService clientsInSession](self, "clientsInSession"), "addObject:", v14);

    -[CLPedestrianFenceAnalyticsManager startSessionForClient:sequenceNumber:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "startSessionForClient:sequenceNumber:", a4, self->_sequenceNumber);
    -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
    return;
  }
  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v7 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v19 = objc_msgSend(a3, "description");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Session already started for client %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v8 = qword_10229FF78;
    v16 = 138477827;
    v17 = objc_msgSend(a3, "description");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 16, "Session already started for client %{private}@", &v16, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]", "%s\n", v9);
    if (v10 != buf)
      goto LABEL_22;
  }
}

- (void)endSessionForClient:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (-[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:"))
  {
    -[CLPedestrianFenceService teardownClient:](self, "teardownClient:", a3);
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v5 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v12 = objc_msgSend(a3, "description");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No session for client %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v6 = qword_10229FF78;
      v9 = 138477827;
      v10 = objc_msgSend(a3, "description");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 16, "No session for client %{private}@", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService endSessionForClient:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5
{
  -[CLPedestrianFenceService setFence:forClient:withRadius:wake:](self, "setFence:forClient:withRadius:wake:", a3, a4, 0);
}

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5 wake:(BOOL)a6
{
  _BOOL4 v6;
  _DWORD *v11;
  _DWORD *v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  uint64_t v16;
  CLPedestrianFenceMetadata *v17;
  double v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  int v29;
  double v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  double v34;
  __int16 v35;
  _BOOL4 v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  double v42;
  __int16 v43;
  _BOOL4 v44;

  v6 = a6;
  if (!+[CLPedestrianFenceService isAvailable](CLPedestrianFenceService, "isAvailable"))
  {
    objc_msgSend(a4, "didFailWithError:", 0);
    return;
  }
  v11 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
  if (!v11)
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v19 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      LOWORD(v29) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Must be in session to set a fence", &v29, 2);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    v20 = a4;
    v21 = 4;
    goto LABEL_25;
  }
  if (a5 <= 0.0 || a5 > 1000.0)
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v22 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v38 = a5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid fence radius: %{public}f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v29 = 134349056;
      v30 = a5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Invalid fence radius: %{public}f", &v29, 12);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    v20 = a4;
    v21 = 1;
LABEL_25:
    objc_msgSend(v20, "didFailWithError:", v21);
    return;
  }
  v12 = v11;
  v13 = -[CLPedestrianFenceService insertFence:inSession:](self, "insertFence:inSession:", a3, v11);
  if (v13 != -1)
  {
    v14 = v13;
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v15 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v38 = *(double *)&a3;
      v39 = 1026;
      v40 = v14;
      v41 = 2050;
      v42 = a5;
      v43 = 1026;
      v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d,radius,%{public}f,shouldWake,%{public}d", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v29 = 138544130;
      v30 = *(double *)&a3;
      v31 = 1026;
      v32 = v14;
      v33 = 2050;
      v34 = a5;
      v35 = 1026;
      v36 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Setting pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d,radius,%{public}f,shouldWake,%{public}d", &v29, 34);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    v16 = sub_1000A652C(0);
    sub_1005D325C(v16, v14, v6, a5);
    ++v12[6];
    v17 = objc_alloc_init(CLPedestrianFenceMetadata);
    -[CLPedestrianFenceMetadata setTimeFenceStart:](v17, "setTimeFenceStart:", sub_1001FCBB4());
    -[CLPedestrianFenceMetadata setFenceID:](v17, "setFenceID:", a3);
    -[CLPedestrianFenceMetadata setClientIdentifier:](v17, "setClientIdentifier:", objc_msgSend(v12, "clientIdentifier"));
    *(float *)&v18 = a5;
    -[CLPedestrianFenceMetadata setRadius:](v17, "setRadius:", v18);
    objc_msgSend(objc_msgSend(v12, "fenceMetadata"), "setObject:forKeyedSubscript:", v17, a3);

  }
}

- (void)simulateFence:(id)a3 forClient:(id)a4 withExitAfterDelay:(double)a5 wake:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  float v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  float v23;
  const char *v24;
  uint8_t *v25;
  int v26;
  id v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  _BOOL4 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  double v39;
  __int16 v40;
  _BOOL4 v41;

  v6 = a6;
  if (+[CLPedestrianFenceService isAvailable](CLPedestrianFenceService, "isAvailable"))
  {
    v11 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
    if (v11)
    {
      if (a5 > 60.0 || a5 < 0.0)
      {
        if (qword_10229FF70 != -1)
          dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
        v18 = qword_10229FF78;
        if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid delay set", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FF70 != -1)
            dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
          LOWORD(v26) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Invalid delay set", &v26, 2);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
      }
      else
      {
        v12 = -[CLPedestrianFenceService insertFence:inSession:](self, "insertFence:inSession:", a3, v11);
        if (v12 != -1)
        {
          v13 = v12;
          if (qword_10229FF70 != -1)
            dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
          v14 = qword_10229FF78;
          if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
          {
            v15 = a5;
            *(_DWORD *)buf = 138544130;
            v35 = a3;
            v36 = 1026;
            v37 = v13;
            v38 = 2050;
            v39 = v15;
            v40 = 1026;
            v41 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Simulating fence exit: fenceID,%{public}@,fenceIndex,%{public}d,delay,%{public}f,shouldWake,%{public}d", buf, 0x22u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FF70 != -1)
              dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
            v23 = a5;
            v26 = 138544130;
            v27 = a3;
            v28 = 1026;
            v29 = v13;
            v30 = 2050;
            v31 = v23;
            v32 = 1026;
            v33 = v6;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Simulating fence exit: fenceID,%{public}@,fenceIndex,%{public}d,delay,%{public}f,shouldWake,%{public}d", &v26, 34);
            v25 = (uint8_t *)v24;
            sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v24);
            if (v25 != buf)
              free(v25);
          }
          v16 = sub_1000A652C(0);
          sub_1005D32CC(v16, v13, v6, a5);
        }
      }
    }
    else
    {
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v17 = qword_10229FF78;
      if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF70 != -1)
          dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
        LOWORD(v26) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Must be in session to set a fence", &v26, 2);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
      objc_msgSend(a4, "didFailWithError:", 4);
    }
  }
  else
  {
    objc_msgSend(a4, "didFailWithError:", 0);
  }
}

- (void)forceClearFence:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (v5)
  {
    v6 = v5;
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v7 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Force clearing fence %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v13 = 138543362;
      v14 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Force clearing fence %{public}@", &v13, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    objc_msgSend(objc_msgSend(v6, "client"), "didExitFence:", a3);
    -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", a3, v6);
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v8 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No fence %{public}@ to force clear", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v13 = 138543362;
      v14 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "No fence %{public}@ to force clear", &v13, 12);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)forceClearAllFences
{
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  NSMutableSet *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _WORD v26[8];
  _BYTE v27[128];
  uint8_t v28[128];
  uint8_t buf[1632];

  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v3 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Force clearing all fences", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v26[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Force clearing all fences", v26, 2);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService forceClearAllFences]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(objc_msgSend(v8, "fenceIDToIndex"), "allKeys");
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
              objc_msgSend(objc_msgSend(v8, "client"), "didExitFence:", v14);
              -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", v14, v8);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          }
          while (v11);
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }
}

- (void)clearFence:(id)a3 forClient:(id)a4
{
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (+[CLPedestrianFenceService isAvailable](CLPedestrianFenceService, "isAvailable"))
  {
    v7 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a4);
    if (v7)
      -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", a3, v7);
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v8 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Pedestrian fence not supported", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService clearFence:forClient:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    objc_msgSend(a4, "didFailWithError:", 0);
  }
}

- (void)teardownClient:(id)a3
{
  NSObject *v5;
  double *v6;
  double *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  const char *v14;
  uint8_t *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  int v21;
  id v22;
  uint8_t buf[4];
  id v24;

  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v5 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v24 = objc_msgSend(a3, "description");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down client %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v13 = qword_10229FF78;
    v21 = 138477827;
    v22 = objc_msgSend(a3, "description");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "Tearing down client %{private}@", &v21, 12);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService teardownClient:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  v6 = -[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:", a3);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_msgSend(v6, "fenceIDToIndex"), "allKeys");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          -[CLPedestrianFenceService clearFence:inSession:](self, "clearFence:inSession:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), v7);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    -[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:", objc_msgSend(v7, "clientIdentifier"), self->_sequenceNumber, v7[2], sub_1001FCBB4());
    -[CLPedestrianFenceService sessionEndPowerLog:](self, "sessionEndPowerLog:", v7);
    -[NSMutableSet removeObject:](-[CLPedestrianFenceService clientsInSession](self, "clientsInSession"), "removeObject:", v7);
    -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
  }
}

- (void)odometryClient:(id)a3 requestInterval:(id)a4
{
  CLPedestrianFenceAnalyticsManager *v7;

  v7 = -[CLPedestrianFenceService analyticsManager](self, "analyticsManager");
  objc_msgSend(a4, "doubleValue");
  -[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:](v7, "odometryClient:requestInterval:sequenceNumber:", a3, self->_sequenceNumber);
  -[CLPedestrianFenceService toggleIntervalTimer](self, "toggleIntervalTimer");
  -[CLPedestrianFenceService toggleSession](self, "toggleSession");
}

- (int)insertFence:(id)a3 inSession:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  _QWORD v20[5];
  _DWORD v21[2];
  __int16 v22;
  id v23;
  uint8_t buf[4];
  _QWORD v25[203];
  __int128 v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (!v7)
  {
    *(_QWORD *)&v26 = 0;
    *((_QWORD *)&v26 + 1) = &v26;
    v27 = 0x3052000000;
    v28 = sub_100207338;
    v29 = sub_100207E40;
    v30 = 0;
    v30 = +[NSMutableSet set](NSMutableSet, "set");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_101304A18;
    v20[3] = &unk_1021AE1A8;
    v20[4] = &v26;
    -[NSMutableSet enumerateObjectsUsingBlock:](-[CLPedestrianFenceService clientsInSession](self, "clientsInSession"), "enumerateObjectsUsingBlock:", v20);
    v12 = 0;
    do
    {
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 40), "member:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12)))
      {
        objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12), a3);
        _Block_object_dispose(&v26, 8);
        return objc_msgSend(objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKeyedSubscript:", a3), "intValue");
      }
      v12 = (v12 + 1);
    }
    while ((_DWORD)v12 != 7);
    objc_msgSend(objc_msgSend(a4, "client"), "didFailWithError:", 2);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v13 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240450;
      LODWORD(v25[0]) = 7;
      WORD2(v25[0]) = 2114;
      *(_QWORD *)((char *)v25 + 6) = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Too many pedestrian fence clients (max %{public}d), ignoring fence request %{public}@", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v21[0] = 67240450;
      v21[1] = 7;
      v22 = 2114;
      v23 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Too many pedestrian fence clients (max %{public}d), ignoring fence request %{public}@", v21, 18);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    _Block_object_dispose(&v26, 8);
    return -1;
  }
  v8 = objc_msgSend(v7, "client");
  if (v8 != objc_msgSend(a4, "client"))
  {
    objc_msgSend(objc_msgSend(a4, "client"), "didFailWithError:", 3);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v9 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25[0] = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Another client has already set a fence with ID %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      LODWORD(v26) = 138543362;
      *(_QWORD *)((char *)&v26 + 4) = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "Another client has already set a fence with ID %{public}@", &v26, 12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    return -1;
  }
  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v15 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25[0] = a3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Overwriting fence with ID %{public}@ for client", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    LODWORD(v26) = 138543362;
    *(_QWORD *)((char *)&v26 + 4) = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Overwriting fence with ID %{public}@ for client", &v26, 12);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  return objc_msgSend(objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKeyedSubscript:", a3), "intValue");
}

- (void)clearFence:(id)a3 inSession:(id)a4
{
  id v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  unsigned int v22;

  v6 = objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKey:", a3);
  if (v6)
  {
    v7 = objc_msgSend(v6, "intValue");
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v8 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v20 = a3;
      v21 = 1026;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v15 = 138543618;
      v16 = a3;
      v17 = 1026;
      v18 = v7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Clearing pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d", &v15, 18);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v9 = sub_1000A652C(0);
    sub_1005D3298(v9, v7);
    objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "removeObjectForKey:", a3);
    objc_msgSend(objc_msgSend(a4, "fenceMetadata"), "removeObjectForKey:", a3);
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v10 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No fence with ID: %{public}@ to clear", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
      v15 = 138543362;
      v16 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "No fence with ID: %{public}@ to clear", &v15, 12);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)onPedestrianFenceExitData:(const PedestrianFenceExit *)a3
{
  NSNumber *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSNumber *v13;
  NSObject *v15;
  double v16;
  uint8_t *v17;
  uint8_t *v18;
  NSObject *v19;
  int var1;
  int v30;
  double v33;
  uint8_t *v34;
  NSNumber *v35;
  NSObject *v36;
  const char *v37;
  uint8_t *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  int v44;
  NSNumber *v45;
  __int16 v46;
  _BYTE v47[14];
  uint8_t buf[4];
  NSNumber *v49;
  __int16 v50;
  _BYTE v51[14];

  if (!a3->var2)
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v19 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
    {
      _H0 = *(_WORD *)&a3[1].var2;
      __asm { FCVT            D0, H0 }
      var1 = a3->var1;
      _H1 = *(_WORD *)&a3[1].var0;
      __asm { FCVT            D1, H1 }
      *(_DWORD *)buf = 134349568;
      v49 = _D0;
      v50 = 1026;
      *(_DWORD *)v51 = var1;
      *(_WORD *)&v51[4] = 2050;
      *(_QWORD *)&v51[6] = _D1;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Status][AOP] Cleared fence: radius,%{public}f,fenceIndex,%{public}u,displacement,%{public}f", buf, 0x1Cu);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    _H0 = *(_WORD *)&a3[1].var2;
    __asm { FCVT            D0, H0 }
    v30 = a3->var1;
    _H1 = *(_WORD *)&a3[1].var0;
    __asm { FCVT            D1, H1 }
    v44 = 134349568;
    v45 = _D0;
    v46 = 1026;
    *(_DWORD *)v47 = v30;
    *(_WORD *)&v47[4] = 2050;
    *(_QWORD *)&v47[6] = _D1;
    v33 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "[Status][AOP] Cleared fence: radius,%{public}f,fenceIndex,%{public}u,displacement,%{public}f", &v44, 28);
    v18 = v34;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v33);
LABEL_32:
    if (v18 != buf)
      free(v18);
    return;
  }
  v5 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", a3->var1);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v7)
  {
LABEL_16:
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v15 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No client found for fence exit with fenceIndex %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v44 = 138543362;
    v45 = v5;
    v16 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "No client found for fence exit with fenceIndex %{public}@", &v44, 12);
    v18 = v17;
    sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v16);
    goto LABEL_32;
  }
  v8 = v7;
  v9 = *(_QWORD *)v40;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v40 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
    v12 = objc_msgSend(objc_msgSend(v11, "fenceIDToIndex"), "allKeysForObject:", v5);
    if (objc_msgSend(v12, "count"))
      break;
    if (v8 == (id)++v10)
    {
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v8)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  v13 = (NSNumber *)objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  if (v11)
    _ZF = v13 == 0;
  else
    _ZF = 1;
  if (_ZF)
    goto LABEL_16;
  v35 = v13;
  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v36 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v49 = v35;
    v50 = 2114;
    *(_QWORD *)v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Pedestrian fence exit notified: fenceID,%{public}@,fenceIndex,%{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v44 = 138543618;
    v45 = v35;
    v46 = 2114;
    *(_QWORD *)v47 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Pedestrian fence exit notified: fenceID,%{public}@,fenceIndex,%{public}@", &v44, 22);
    v38 = (uint8_t *)v37;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v37);
    if (v38 != buf)
      free(v38);
  }
  objc_msgSend(objc_msgSend(v11, "client"), "didExitFence:", v35);
  objc_msgSend(objc_msgSend(v11, "fenceIDToIndex"), "removeObjectForKey:", v35);
  objc_msgSend(objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "objectForKeyedSubscript:", v35), "setTimeFenceExit:", sub_1001FCBB4());
  -[CLPedestrianFenceAnalyticsManager processSingleFenceAnalyticsData:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "processSingleFenceAnalyticsData:", objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "objectForKeyedSubscript:", v35));
  objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "removeObjectForKey:", v35);
}

- (void)onInertialOdometryAnalyticsData:(const InertialOdometryAnalytics *)a3
{
  map<unsigned long long, double, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, double>>> *p_packetStartTimes;
  unint64_t *v6;
  _QWORD *left;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSMutableArray *v16;
  uint64_t i;
  NSObject *v23;
  int var1;
  int var2;
  int var3;
  int var4;
  int v28;
  int v29;
  int v30;
  int v31;
  const char *v32;
  uint8_t *v33;
  _DWORD v34[2];
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint8_t buf[8];
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;

  p_packetStartTimes = &self->_packetStartTimes;
  v6 = (unint64_t *)(&a3->var4 + 1);
  left = self->_packetStartTimes.__tree_.__pair1_.__value_.__left_;
  v8 = 0.0;
  v9 = 0.0;
  if (left)
  {
    v10 = *v6;
    while (1)
    {
      v11 = left[4];
      if (v10 >= v11)
      {
        if (v11 >= v10)
        {
          *(_QWORD *)buf = &a3->var4 + 1;
          v9 = *((double *)sub_10006221C((uint64_t **)&self->_packetStartTimes, v6, (uint64_t)&unk_101B9EB60, (uint64_t **)buf)+ 5);
          sub_10071E360((uint64_t)p_packetStartTimes, v6);
          break;
        }
        ++left;
      }
      left = (_QWORD *)*left;
      if (!left)
      {
        v9 = 0.0;
        break;
      }
    }
  }
  v12 = self->_packetStopTriggerTimes.__tree_.__pair1_.__value_.__left_;
  if (!v12)
    goto LABEL_17;
  v13 = *v6;
  while (1)
  {
    v14 = v12[4];
    if (v13 >= v14)
      break;
LABEL_14:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_17;
  }
  if (v14 < v13)
  {
    ++v12;
    goto LABEL_14;
  }
  *(_QWORD *)buf = v6;
  v8 = *((double *)sub_10006221C((uint64_t **)&self->_packetStopTriggerTimes, v6, (uint64_t)&unk_101B9EB60, (uint64_t **)buf)+ 5);
  sub_10071E360((uint64_t)&self->_packetStopTriggerTimes, v6);
LABEL_17:
  -[CLPedestrianFenceAnalyticsManager feedInertialOdometryPacket:atTime:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "feedInertialOdometryPacket:atTime:", a3, v9);
  v15 = *(_QWORD *)(&a3->var4 + 1);
  if (v15 > self->_sequenceNumber)
    self->_sequenceNumber = v15;
  v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7);
  for (i = 0; i != 14; i += 2)
  {
    LOWORD(_D0) = *(unsigned __int16 *)((char *)&a3->var19 + i + 1);
    __asm { FCVT            S0, H0 }
    -[NSMutableArray addObject:](v16, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", _D0));
  }
  -[CLPedestrianFenceService sendStatusForFences:setBefore:](self, "sendStatusForFences:setBefore:", v16, v8);
  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
  v23 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
  {
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    *(_DWORD *)buf = 67240960;
    *(_DWORD *)&buf[4] = var1;
    v42 = 1026;
    v43 = var2;
    v44 = 1026;
    v45 = var3;
    v46 = 1026;
    v47 = var4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Status][AOP] fencesMaskIsSet,%{public}u,fencesMaskWasSet,%{public}u,fencesMaskWasExited,%{public}u,fencesMaskWasCleared,%{public}u", buf, 0x1Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
    v28 = a3->var1;
    v29 = a3->var2;
    v30 = a3->var3;
    v31 = a3->var4;
    v34[0] = 67240960;
    v34[1] = v28;
    v35 = 1026;
    v36 = v29;
    v37 = 1026;
    v38 = v30;
    v39 = 1026;
    v40 = v31;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "[Status][AOP] fencesMaskIsSet,%{public}u,fencesMaskWasSet,%{public}u,fencesMaskWasExited,%{public}u,fencesMaskWasCleared,%{public}u", v34, 26);
    v33 = (uint8_t *)v32;
    sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService onInertialOdometryAnalyticsData:]", "%s\n", v32);
    if (v33 != buf)
      free(v33);
  }
}

- (void)toggleSession
{
  -[CLPedestrianFenceService toggleSession:](self, "toggleSession:", -[NSMutableSet count](-[CLPedestrianFenceService clientsInSession](self, "clientsInSession"), "count") != 0);
}

- (void)toggleSession:(BOOL)a3
{
  uint64_t v5;
  CFAbsoluteTime Current;
  double v7;
  unint64_t v8;
  unint64_t *p_sequenceNumber;

  if (+[CLPedestrianFenceService isAvailable](CLPedestrianFenceService, "isAvailable"))
  {
    v5 = sub_1000A652C(0);
    sub_1005D330C(v5, a3, self->_sequenceNumber);
    Current = CFAbsoluteTimeGetCurrent();
    p_sequenceNumber = &self->_sequenceNumber;
    *((CFAbsoluteTime *)sub_10006221C((uint64_t **)&self->_packetStartTimes, &self->_sequenceNumber, (uint64_t)&unk_101B9EB60, (uint64_t **)&p_sequenceNumber)+ 5) = Current;
    v7 = sub_1001FCBB4();
    v8 = self->_sequenceNumber - 1;
    p_sequenceNumber = &v8;
    *((double *)sub_10006221C((uint64_t **)&self->_packetStopTriggerTimes, &v8, (uint64_t)&unk_101B9EB60, (uint64_t **)&p_sequenceNumber)+ 5) = v7;
    ++self->_sequenceNumber;
  }
}

- (id)sessionForClient:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession", 0);
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "client") == a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)sessionForFence:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession", 0);
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "fenceIDToIndex"), "objectForKey:", a3))
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)sessionEndPowerLog:(id)a3
{
  _QWORD v4[4];
  _QWORD v5[4];

  v4[0] = CFSTR("sessionStartTime");
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)a3 + 1));
  v4[1] = CFSTR("sessionEndTime");
  -[NSDate timeIntervalSince1970](+[NSDate date](NSDate, "date"), "timeIntervalSince1970");
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[2] = CFSTR("identifier");
  v5[2] = objc_msgSend(a3, "clientIdentifier");
  v4[3] = CFSTR("numFences");
  v5[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)a3 + 6));
  sub_10019E128((uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 4), (uint64_t)"PedestrianFencePowerMetric");
}

- (void)toggleIntervalTimer
{
  unsigned __int8 v3;
  CLTimer *v4;
  double v5;
  _QWORD v6[5];

  v3 = -[CLPedestrianFenceAnalyticsManager isAnySessionActive](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "isAnySessionActive");
  v4 = -[CLPedestrianFenceService intervalTimer](self, "intervalTimer");
  if ((v3 & 1) != 0)
  {
    -[CLTimer nextFireDelay](v4, "nextFireDelay");
    if (v5 == 1.79769313e308)
    {
      -[CLPedestrianFenceService onIntervalTimerCreateEventAndIncrementPacket:](self, "onIntervalTimerCreateEventAndIncrementPacket:", 0);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_101305CE0;
      v6[3] = &unk_10212BB58;
      v6[4] = self;
      -[CLTimer setHandler:](-[CLPedestrianFenceService intervalTimer](self, "intervalTimer"), "setHandler:", v6);
      -[CLTimer setNextFireDelay:interval:](-[CLPedestrianFenceService intervalTimer](self, "intervalTimer"), "setNextFireDelay:interval:", 120.0, 120.0);
    }
  }
  else
  {
    -[CLTimer invalidate](v4, "invalidate");
  }
}

- (void)onIntervalTimerCreateEventAndIncrementPacket:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[CLPedestrianFenceAnalyticsManager createIntervalEventStartingAt:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "createIntervalEventStartingAt:", self->_sequenceNumber);
  if (v3)
    -[CLPedestrianFenceService toggleSession](self, "toggleSession");
}

- (void)sendStatusForFences:(id)a3 setBefore:(double)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;
  float v19;
  double v20;
  float v21;
  CLPedestrianFenceStatus *v22;
  int v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CLPedestrianFenceStatus *v29;
  float v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  NSMutableSet *obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  id v56;
  __int16 v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];

  if (objc_msgSend(a3, "count") == (id)7)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = -[CLPedestrianFenceService clientsInSession](self, "clientsInSession");
    v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v52;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(obj);
          v44 = v6;
          v7 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v6);
          v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
          v46 = +[NSMutableString string](NSMutableString, "string");
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v9 = objc_msgSend(v7, "fenceIDToIndex");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v11; i = (char *)i + 1)
              {
                if (*(_QWORD *)v48 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
                v15 = objc_msgSend(objc_msgSend(v7, "fenceMetadata"), "objectForKeyedSubscript:", v14);
                v16 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "fenceIDToIndex"), "objectForKeyedSubscript:", v14), "unsignedIntValue");
                if (v15)
                  v17 = v16 > 6;
                else
                  v17 = 1;
                if (!v17)
                {
                  v18 = v16;
                  objc_msgSend(v15, "timeFenceStart");
                  v19 = 0.0;
                  if (v20 < a4)
                  {
                    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v18), "floatValue");
                    v19 = v21;
                  }
                  v22 = [CLPedestrianFenceStatus alloc];
                  objc_msgSend(v15, "radius");
                  v24 = v23;
                  v25 = sub_1001FCBB4();
                  objc_msgSend(v15, "timeFenceStart");
                  v27 = v25 - v26;
                  LODWORD(v26) = v24;
                  *(float *)&v28 = v19;
                  v29 = -[CLPedestrianFenceStatus initWithRadius:radialDisplacement:duration:](v22, "initWithRadius:radialDisplacement:duration:", v26, v28, v27);
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, v14);
                  objc_msgSend(v15, "radius");
                  v31 = v30;
                  -[CLPedestrianFenceStatus duration](v29, "duration");
                  objc_msgSend(v46, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,radius,%f,displacement,%f,duration,%f,index,%@; "),
                      v14,
                      *(_QWORD *)&v31,
                      v19,
                      v32,
                      objc_msgSend(objc_msgSend(v7, "fenceIDToIndex"), "objectForKeyedSubscript:", v14)));

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
            }
            while (v11);
          }
          objc_msgSend(objc_msgSend(v7, "client"), "sessionStatusReport:", v8);
          if (objc_msgSend(v46, "length"))
          {
            if (qword_10229FF70 != -1)
              dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
            v33 = qword_10229FF78;
            if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
            {
              v34 = objc_msgSend(v7, "clientIdentifier");
              *(_DWORD *)buf = 138543618;
              v60 = v34;
              v61 = 2114;
              v62 = v46;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[Status] Session %{public}@: %{public}@", buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FF70 != -1)
                dispatch_once(&qword_10229FF70, &stru_1021AE1C8);
              v35 = qword_10229FF78;
              v36 = objc_msgSend(v7, "clientIdentifier");
              v55 = 138543618;
              v56 = v36;
              v57 = 2114;
              v58 = v46;
              LODWORD(v40) = 22;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v35, 0, "[Status] Session %{public}@: %{public}@", &v55, v40);
              v38 = (uint8_t *)v37;
              sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceService sendStatusForFences:setBefore:]", "%s\n", v37);
              if (v38 != buf)
                free(v38);
            }
          }
          v6 = v44 + 1;
        }
        while ((id)(v44 + 1) != v43);
        v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        v43 = v39;
      }
      while (v39);
    }
  }
}

- (NSMutableSet)clientsInSession
{
  return self->_clientsInSession;
}

- (void)setClientsInSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CLPedestrianFenceAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CLTimer)intervalTimer
{
  return self->_intervalTimer;
}

- (void)setIntervalTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  Dispatcher *value;
  Dispatcher *v4;

  sub_100008848((uint64_t)&self->_packetStopTriggerTimes, (_QWORD *)self->_packetStopTriggerTimes.__tree_.__pair1_.__value_.__left_);
  sub_100008848((uint64_t)&self->_packetStartTimes, (_QWORD *)self->_packetStartTimes.__tree_.__pair1_.__value_.__left_);
  value = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
  self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
  v4 = self->_fenceExitDispatcher.__ptr_.__value_;
  self->_fenceExitDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  return self;
}

@end
