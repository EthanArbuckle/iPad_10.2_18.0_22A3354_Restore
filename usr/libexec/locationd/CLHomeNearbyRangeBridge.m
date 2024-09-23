@implementation CLHomeNearbyRangeBridge

- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withUniverse:(id)a4
{
  CLHomeNearbyRangeBridge *v6;
  id v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  objc_super v13;
  uint8_t buf[1640];

  v13.receiver = self;
  v13.super_class = (Class)CLHomeNearbyRangeBridge;
  v6 = -[CLHomeNearbyRangeBridge init](&v13, "init");
  if (v6)
  {
    if (+[NISession isSupported](NISession, "isSupported"))
    {
      if (a3)
      {
        v6->_cppWrapper = a3;
        v7 = objc_msgSend(a4, "silo");
        v6->_rangingCallbackQueue = (OS_dispatch_queue *)objc_msgSend(v7, "queue");
        v6->_customRangeRateTimer = (CLTimer *)objc_msgSend(v7, "newTimer");
        v6->_reactivationInProgress = 0;
        v6->_reactivationDelayInSeconds = 3.0;
        return v6;
      }
    }
    else
    {
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v8 = qword_1022A00F8;
      if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ranging is not supported on this platform", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00F0 != -1)
          dispatch_once(&qword_1022A00F0, &stru_102160FB0);
        v12[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 2, "ranging is not supported on this platform", v12, 2);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge initWithDelegate:withUniverse:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");

  self->_customRangeRateTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLHomeNearbyRangeBridge;
  -[CLHomeNearbyRangeBridge dealloc](&v3, "dealloc");
}

- (void)startRanging
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v3 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: startRanging: starting a ranging session", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: startRanging: starting a ranging session", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge startRanging]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");
  -[CLHomeNearbyRangeBridge createRangeSession](self, "createRangeSession");
  -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", objc_alloc_init((Class)NIHomeDeviceConfiguration));
}

- (void)setRangingRateWithConfiguration:(id)a3
{
  id v5;
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v15;
  _QWORD v16[5];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;

  if (self->_session)
  {
    v5 = objc_alloc_init((Class)NIHomeDeviceConfiguration);
    objc_msgSend(v5, "setMinimumPreferredUpdatedRate:", objc_msgSend(a3, "updateRate"));
    -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v5);
    Current = j__CFAbsoluteTimeGetCurrent();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100976F2C;
    v16[3] = &unk_10212BB58;
    v16[4] = self;
    -[CLTimer setHandler:](self->_customRangeRateTimer, "setHandler:", v16);
    objc_msgSend(a3, "rateDurationInSeconds");
    v8 = Current + v7;
    -[CLTimer setNextFireTime:](self->_customRangeRateTimer, "setNextFireTime:", Current + v7);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v9 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(a3, "updateRate");
      objc_msgSend(a3, "rateDurationInSeconds");
      *(_DWORD *)buf = 68290050;
      v19 = 2082;
      v18 = 0;
      v20 = "";
      v21 = 1026;
      v22 = v10;
      v23 = 2050;
      v24 = Current;
      v25 = 2050;
      v26 = v11;
      v27 = 2050;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMicroLocationHomeNearbyRangeBridge: set high ranging rate\", \"rate\":%{public}d, \"now\":\"%{public}.3f\", \"duration\":\"%{public}f\", \"expected end time\":\"%{public}.3f\"}", buf, 0x36u);
    }
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v12 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set high ranging rate without an active ranging session!", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v15 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "CLMicroLocationHomeNearbyRangeBridge: tried to set high ranging rate without an active ranging session!", &v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLHomeNearbyRangeBridge setRangingRateWithConfiguration:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)resetRangingRate
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (self->_session)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v3 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: set default ranging rate", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: set default ranging rate", v10, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge resetRangingRate]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    v4 = objc_alloc_init((Class)NIHomeDeviceConfiguration);
    objc_msgSend(v4, "setMinimumPreferredUpdatedRate:", 3);
    -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v4);
    -[CLTimer invalidate](self->_customRangeRateTimer, "invalidate");
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v5 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set default ranging rate without an active ranging session!", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "CLMicroLocationHomeNearbyRangeBridge: tried to set default ranging rate without an active ranging session!", v10, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLHomeNearbyRangeBridge resetRangingRate]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)stopRanging
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v3 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: stopRanging: stopping a ranging session", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: stopRanging: stopping a ranging session", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge stopRanging]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLTimer invalidate](self->_customRangeRateTimer, "invalidate");
  sub_1002A3994((uint64_t)self->_cppWrapper);
  -[NISession pause](self->_session, "pause");
}

- (void)createRangeSession
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v3 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: createRangeSession: creating a ranging session", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: createRangeSession: creating a ranging session", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge createRangeSession]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  self->_session = (NISession *)+[NISession observerSession](NISession, "observerSession");
  sub_1002A3984((uint64_t)self->_cppWrapper);
  -[NISession setDelegate:](self->_session, "setDelegate:", self);
  -[NISession setDelegateQueue:](self->_session, "setDelegateQueue:", self->_rangingCallbackQueue);
}

- (void)reactivate
{
  NSObject *v3;
  double reactivationDelayInSeconds;
  dispatch_time_t v5;
  NSObject *rangingCallbackQueue;
  double v7;
  double v8;
  const char *v9;
  uint8_t *v10;
  _QWORD block[5];
  int v12;
  double v13;
  uint8_t buf[4];
  double v15;

  if (!self->_reactivationInProgress)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v3 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134217984;
      v15 = reactivationDelayInSeconds;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: reactivate: start ranging session in %.3fsec", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v8 = self->_reactivationDelayInSeconds;
      v12 = 134217984;
      v13 = v8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: reactivate: start ranging session in %.3fsec", COERCE_DOUBLE(&v12));
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge reactivate]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    self->_reactivationInProgress = 1;
    v5 = dispatch_time(0, (uint64_t)(self->_reactivationDelayInSeconds * 1000000000.0));
    rangingCallbackQueue = self->_rangingCallbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100977960;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_after(v5, rangingCallbackQueue, block);
    sub_1002A39A4((uint64_t)self->_cppWrapper);
    v7 = self->_reactivationDelayInSeconds + self->_reactivationDelayInSeconds;
    if (v7 > 120.0)
      v7 = 120.0;
    self->_reactivationDelayInSeconds = v7;
  }
}

- (void)invalidateRangingSession
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (self->_session)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v3 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: invalidateRangingSession: invalidating a ranging session", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 0, "CLMicroLocationHomeNearbyRangeBridge: invalidateRangingSession: invalidating a ranging session", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge invalidateRangingSession]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    -[NISession invalidate](self->_session, "invalidate");

    self->_session = 0;
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  _BYTE *v15;
  id v16;
  uint64_t v17;
  void **v18;
  id v19;
  char *v20;
  char *v21;
  id v22;
  uint64_t v23;
  char *__s;
  void *v26[2];
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE __p[12];
  __int16 v33;
  void **v34;
  __int16 v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  _BYTE *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
  if (v7)
  {
    v8 = "unknown";
    v9 = *(_QWORD *)v29;
    if (a5 == 1)
      v8 = "PeerEnded";
    if (!a5)
      v8 = "Timeout";
    __s = (char *)v8;
    v10 = &qword_1022A0000;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11);
        if (v10[30] != -1)
          dispatch_once(&qword_1022A00F0, &stru_102160FB0);
        v13 = qword_1022A00F8;
        if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
        {
          sub_1015A2E04(__p, __s);
          v14 = v10;
          if (v35 >= 0)
            v15 = __p;
          else
            v15 = *(_BYTE **)__p;
          v16 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "discoveryToken"), "description"), "UTF8String");
          *(_DWORD *)buf = 134349570;
          v38 = a3;
          v39 = 2082;
          v40 = v15;
          v41 = 2082;
          v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NI, Session %{public}p did remove nearby object with reason: '%{public}s'. %{public}s", buf, 0x20u);
          if (SHIBYTE(v35) < 0)
            operator delete(*(void **)__p);
          v10 = v14;
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v10[30] != -1)
            dispatch_once(&qword_1022A00F0, &stru_102160FB0);
          v17 = qword_1022A00F8;
          sub_1015A2E04(v26, __s);
          if (v27 >= 0)
            v18 = v26;
          else
            v18 = (void **)v26[0];
          v19 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "discoveryToken"), "description"), "UTF8String");
          *(_DWORD *)__p = 134349570;
          *(_QWORD *)&__p[4] = a3;
          v33 = 2082;
          v34 = v18;
          v35 = 2082;
          v36 = v19;
          LODWORD(v23) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v17, 0, "NI, Session %{public}p did remove nearby object with reason: '%{public}s'. %{public}s", __p, v23);
          v21 = v20;
          if (v27 < 0)
            operator delete(v26[0]);
          sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didRemoveNearbyObjects:withReason:]", "%s\n", v21);
          v10 = &qword_1022A0000;
          if (v21 != (char *)buf)
            free(v21);
        }
        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
      v7 = v22;
    }
    while (v22);
  }
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  float v10;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  int v16;
  __int128 v17;
  int v18;
  int v19;
  id v20;
  char v21;
  NSObject *v22;
  void **v23;
  uint64_t v24;
  id v25;
  CLMicroLocationUwbBridgeWrapper *cppWrapper;
  uint64_t *v28[3];
  void *v29[2];
  char v30;
  void *__p[2];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 *v37;
  __int128 *v38;
  uint64_t v39;
  uint8_t buf[32];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[8];
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;
  void *v49;
  char v50;
  _BYTE v51[128];

  v37 = 0;
  v38 = 0;
  v39 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v51, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(a4);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v7);
        v9 = objc_msgSend(v8, "relationship");
        objc_msgSend(v8, "distance");
        if (v10 != NINearbyObjectDistanceNotAvailable && (v9 & 2) != 0)
        {
          if (objc_msgSend(v8, "deviceIdentifer"))
          {
            v42 = 0u;
            v43 = 0u;
            v41 = 0u;
            memset(buf, 0, sizeof(buf));
            *(_QWORD *)buf = j__CFAbsoluteTimeGetCurrent();
            objc_msgSend(v8, "distance");
            *(_DWORD *)&buf[8] = v16;
            objc_msgSend(v8, "direction");
            *(_OWORD *)&buf[16] = v17;
            sub_1015A2E04(__p, (char *)objc_msgSend(objc_msgSend(v8, "deviceIdentifer"), "UTF8String"));
            v41 = *(_OWORD *)__p;
            *(_QWORD *)&v42 = v32;
            HIBYTE(v32) = 0;
            LOBYTE(__p[0]) = 0;
            BYTE8(v42) = 2;
            objc_msgSend(v8, "azimuth");
            HIDWORD(v42) = v18;
            objc_msgSend(v8, "elevation");
            LODWORD(v43) = v19;
            v20 = objc_msgSend(v8, "distanceMeasurementQuality");
            if ((unint64_t)v20 >= 4)
              v21 = 0;
            else
              v21 = (char)v20;
            BYTE4(v43) = v21;
            sub_10097640C((char *)buf, (uint64_t)v44);
            if (SHIBYTE(v32) < 0)
              operator delete(__p[0]);
            if (SBYTE7(v42) < 0)
              operator delete((void *)v41);
            if (qword_1022A02A0 != -1)
              dispatch_once(&qword_1022A02A0, &stru_102160FD0);
            v22 = qword_1022A02A8;
            if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
            {
              sub_100976498((float32x4_t *)v44, v29);
              v23 = v29;
              if (v30 < 0)
                v23 = (void **)v29[0];
              *(_DWORD *)buf = 68289283;
              *(_DWORD *)&buf[4] = 0;
              *(_WORD *)&buf[8] = 2082;
              *(_QWORD *)&buf[10] = "";
              *(_WORD *)&buf[18] = 2081;
              *(_QWORD *)&buf[20] = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, Session update: \", \"nearby object\":%{private, location:escape_only}s}", buf, 0x1Cu);
              if (v30 < 0)
                operator delete(v29[0]);
            }
            sub_1009783C0((uint64_t *)&v37, (uint64_t)v44);
            if (v50 < 0)
              operator delete(v49);
            goto LABEL_40;
          }
LABEL_33:
          if (objc_msgSend(v8, "deviceIdentifer"))
          {
            if (qword_1022A00F0 != -1)
              dispatch_once(&qword_1022A00F0, &stru_102160FB0);
            v24 = qword_1022A00F8;
            if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
            {
              v25 = objc_msgSend(objc_msgSend(v8, "deviceIdentifer"), "UTF8String");
              *(_DWORD *)v44 = 68289282;
              *(_DWORD *)&v44[4] = 0;
              v45 = 2082;
              v46 = "";
              v47 = 2082;
              v48 = v25;
              v13 = v24;
              v14 = "{\"msg%{public}.0s\":\"NI, known device's distance is not available\", \"deviceIdentifer\":%{public,"
                    " location:escape_only}s}";
              v15 = 28;
              goto LABEL_38;
            }
          }
          else
          {
            sub_10038ADA4((uint64_t)CFSTR("NI, known device but deviceIdentifier is nil"));
          }
          goto LABEL_40;
        }
        if ((v9 & 2) != 0)
          goto LABEL_33;
        if (qword_1022A00F0 != -1)
          dispatch_once(&qword_1022A00F0, &stru_102160FB0);
        v12 = qword_1022A00F8;
        if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v44 = 68289026;
          *(_DWORD *)&v44[4] = 0;
          v45 = 2082;
          v46 = "";
          v13 = v12;
          v14 = "{\"msg%{public}.0s\":\"NI, unknwon device, ignore\"}";
          v15 = 18;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, v44, v15);
        }
LABEL_40:
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v51, 16);
    }
    while (v5);
  }
  cppWrapper = self->_cppWrapper;
  memset(v28, 0, sizeof(v28));
  sub_1009794AC(v28, v37, v38, 0xCCCCCCCCCCCCCCCDLL * (v38 - v37));
  sub_1002A39D4((uint64_t)cppWrapper, v28);
  *(_QWORD *)v44 = v28;
  sub_1009791F4((void ***)v44);
  *(_QWORD *)v44 = &v37;
  sub_1009791F4((void ***)v44);
}

- (void)sessionWasSuspended:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p was suspended.", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v8 = 134349056;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 2, "NI, Session %{public}p was suspended.", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionWasSuspended:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  sub_1002A39A4((uint64_t)self->_cppWrapper);
}

- (void)sessionSuspensionEnded:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p suspension ended. Restarting...", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v8 = 134349056;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 2, "NI, Session %{public}p suspension ended. Restarting...", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionSuspensionEnded:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  sub_1002A39B4((uint64_t)self->_cppWrapper);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  NSObject *v6;
  id v7;
  double reactivationDelayInSeconds;
  uint64_t v9;
  id v10;
  double v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  double v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  double v25;

  if (a4)
  {
    sub_10038ADA4((uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Uwb range session invalidated error:"), a4));
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(objc_msgSend(0, "debugDescription"), "UTF8String");
      reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134349570;
      v21 = a3;
      v22 = 2080;
      v23 = v7;
      v24 = 2048;
      v25 = reactivationDelayInSeconds;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NI, Error: session %{public}p invalidated with error: %s next reactivation try in %fsec", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102160FB0);
      v9 = qword_1022A00F8;
      v10 = objc_msgSend(objc_msgSend(0, "debugDescription"), "UTF8String");
      v11 = self->_reactivationDelayInSeconds;
      v14 = 134349570;
      v15 = a3;
      v16 = 2080;
      v17 = v10;
      v18 = 2048;
      v19 = v11;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "NI, Error: session %{public}p invalidated with error: %s next reactivation try in %fsec", &v14, 32);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didInvalidateWithError:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");
  -[CLHomeNearbyRangeBridge reactivate](self, "reactivate");
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NI, failed (non-fatal): %{public}s.", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6 = qword_1022A00F8;
    v9 = 136446210;
    v10 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "NI, failed (non-fatal): %{public}s.", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didFailWithError:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, discovered object: %{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v6 = qword_1022A00F8;
    v9 = 136446210;
    v10 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "NI, discovered object: %{public}s", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didDiscoverNearbyObject:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)sessionDidStartRunning:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102160FB0);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p Start Running", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102160FB0);
    v8 = 134349056;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 2, "NI, Session %{public}p Start Running", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionDidStartRunning:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  self->_reactivationDelayInSeconds = 3.0;
}

- (CLTimer)customRangeRateTimer
{
  return self->_customRangeRateTimer;
}

- (void)setCustomRangeRateTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)rangingCallbackQueue
{
  return self->_rangingCallbackQueue;
}

- (void)setRangingCallbackQueue:(id)a3
{
  self->_rangingCallbackQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)reactivationInProgress
{
  return self->_reactivationInProgress;
}

- (void)setReactivationInProgress:(BOOL)a3
{
  self->_reactivationInProgress = a3;
}

- (double)reactivationDelayInSeconds
{
  return self->_reactivationDelayInSeconds;
}

- (void)setReactivationDelayInSeconds:(double)a3
{
  self->_reactivationDelayInSeconds = a3;
}

@end
