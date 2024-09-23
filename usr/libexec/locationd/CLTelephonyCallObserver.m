@implementation CLTelephonyCallObserver

- (CLTelephonyCallObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyCallObserverHelper *)a4
{
  CLTelephonyCallObserver *v6;
  CXCallObserver *v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  objc_super v13;
  uint8_t buf[1640];

  v13.receiver = self;
  v13.super_class = (Class)CLTelephonyCallObserver;
  v6 = -[CLTelephonyCallObserver init](&v13, "init");
  if (v6)
  {
    v7 = (CXCallObserver *)objc_alloc((Class)CXCallObserver);
    v6->_fCallObserver = v7;
    if (v7)
    {
      -[CXCallObserver init](v7, "init");
      -[CXCallObserver setDelegate:queue:](v6->_fCallObserver, "setDelegate:queue:", v6, a3);
      v6->_fHelper = a4;
    }
    else
    {
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021461A0);
      v8 = qword_1022A02A8;
      if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CLT CXCallObserver alloc failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_1021461A0);
        v12[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLT CXCallObserver alloc failed", v12, 2);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLTelephonyCallObserver initWithQueue:helperObj:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
  }
  return v6;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = objc_msgSend(objc_msgSend(a3, "calls"), "count");
  if (self->_fHelper)
  {
    v6 = v5;
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021461A0);
    v7 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CLT CXCallObserver call count, %{public}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021461A0);
      v10 = 134349056;
      v11 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLT CXCallObserver call count, %{public}lu", &v10, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLTelephonyCallObserver callObserver:callChanged:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    if (qword_1023108D8)
    {
      (*(void (**)(void))(*(_QWORD *)qword_1023108D8 + 264))();
      if (qword_1023108D8)
        (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)qword_1023108D8 + 264))(qword_1023108D8, CFSTR("kCallStatusChangeNotification"), 0);
    }
  }
}

- (void)shutdown
{
  CXCallObserver *fCallObserver;
  CXCallObserver **p_fCallObserver;

  p_fCallObserver = &self->_fCallObserver;
  fCallObserver = self->_fCallObserver;
  if (fCallObserver)
  {
    -[CXCallObserver setDelegate:queue:](fCallObserver, "setDelegate:queue:", 0, 0);

    *p_fCallObserver = 0;
    p_fCallObserver[1] = 0;
  }
}

- (CXCallObserver)fCallObserver
{
  return self->_fCallObserver;
}

- (CLTelephonyCallObserverHelper)fHelper
{
  return self->_fHelper;
}

@end
