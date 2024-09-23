@implementation CLTelephonyStewieStateObserver

- (CLTelephonyStewieStateObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyStewieStateObserverHelper *)a4
{
  CLTelephonyStewieStateObserver *v6;
  CTStewieStateMonitor *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint8_t *v12;
  _QWORD v13[2];
  objc_super v14;
  uint8_t buf[1640];

  v14.receiver = self;
  v14.super_class = (Class)CLTelephonyStewieStateObserver;
  v6 = -[CLTelephonyStewieStateObserver init](&v14, "init");
  if (!v6)
    return v6;
  v7 = (CTStewieStateMonitor *)objc_msgSend(objc_alloc((Class)CTStewieStateMonitor), "initWithDelegate:queue:", v6, a3);
  v6->_fStewieStateObserver = v7;
  if (v7)
  {
    v6->_fHelper = a4;
    -[CTStewieStateMonitor start](v7, "start");
    if (_os_feature_enabled_impl("CoreTelephony", "Bifrost"))
    {
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021461A0);
      v8 = qword_1022A02A8;
      if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,started", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_1021461A0);
        LOWORD(v13[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLT,CTStewieStateMonitor,started", v13, 2, v13[0]);
LABEL_22:
        v12 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLTelephonyStewieStateObserver initWithQueue:helperObj:]", "%s\n", v9);
        if (v12 != buf)
          free(v12);
      }
    }
  }
  else if (_os_feature_enabled_impl("CoreTelephony", "Bifrost"))
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021461A0);
    v10 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,alloc failed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021461A0);
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLT,CTStewieStateMonitor,alloc failed", v13, 2, v13[0]);
      goto LABEL_22;
    }
  }
  return v6;
}

- (void)stateChanged:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  CFDictionaryRef v13;
  const __CFDictionary *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  void *values;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  uint8_t buf[8];
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;

  if (a3)
  {
    v5 = objc_msgSend(a3, "isStewieActive");
    HIBYTE(v20) = v5;
    v6 = objc_msgSend(a3, "status");
    v7 = objc_msgSend(a3, "reason");
    v8 = objc_msgSend(a3, "allowedServices");
    v9 = objc_msgSend(a3, "transportType");
    if (self->_fHelper)
    {
      v10 = v9;
      if (_os_feature_enabled_impl("CoreTelephony", "Bifrost"))
      {
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_1021461A0);
        v11 = qword_1022A02A8;
        if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67241216;
          *(_DWORD *)&buf[4] = v6;
          v31 = 1026;
          v32 = v7;
          v33 = 1026;
          v34 = v8;
          v35 = 1026;
          v36 = v10;
          v37 = 1026;
          v38 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,status,%{public}d,reason,%{public}d,service,%{public}d,transport,%{public}d,usecaseactive,%{public}d", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A02A0 != -1)
            dispatch_once(&qword_1022A02A0, &stru_1021461A0);
          LODWORD(values) = 67241216;
          HIDWORD(values) = v6;
          v22 = 1026;
          v23 = v7;
          v24 = 1026;
          v25 = v8;
          v26 = 1026;
          v27 = v10;
          v28 = 1026;
          v29 = v5;
          LODWORD(v20) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLT,CTStewieStateMonitor,status,%{public}d,reason,%{public}d,service,%{public}d,transport,%{public}d,usecaseactive,%{public}d", &values, v20);
          v17 = (uint8_t *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLTelephonyStewieStateObserver stateChanged:]", "%s\n", v16);
          if (v17 != buf)
            free(v17);
        }
      }
      v12 = (void *)sub_10023EC34((_BYTE *)&v20 + 7);
      *(_QWORD *)buf = CFSTR("kStewieUseCaseActiveKey");
      values = v12;
      v13 = CFDictionaryCreate(0, (const void **)buf, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v14 = v13;
      if (qword_1023108D8)
        (*(void (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(_QWORD *)qword_1023108D8 + 256))(qword_1023108D8, CFSTR("kStewieStatus"), v13);
      if (v12)
        CFRelease(v12);
    }
  }
  else if (_os_feature_enabled_impl("CoreTelephony", "Bifrost"))
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021461A0);
    v15 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "unexpected CTStewieState null pointer in delegate callback", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021461A0);
      LOWORD(values) = 0;
      LODWORD(v20) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 16, "unexpected CTStewieState null pointer in delegate callback", &values, v20);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLTelephonyStewieStateObserver stateChanged:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
}

- (void)shutdown
{
  CTStewieStateMonitor *fStewieStateObserver;
  CTStewieStateMonitor **p_fStewieStateObserver;

  p_fStewieStateObserver = &self->_fStewieStateObserver;
  fStewieStateObserver = self->_fStewieStateObserver;
  if (fStewieStateObserver)
  {

    *p_fStewieStateObserver = 0;
    p_fStewieStateObserver[1] = 0;
  }
}

- (CTStewieStateMonitor)fStewieStateObserver
{
  return self->_fStewieStateObserver;
}

- (CLTelephonyStewieStateObserverHelper)fHelper
{
  return self->_fHelper;
}

@end
