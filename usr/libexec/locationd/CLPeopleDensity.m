@implementation CLPeopleDensity

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
  if (qword_1023073B8 != -1)
    dispatch_once(&qword_1023073B8, &stru_10217B668);
  return (id)qword_1023073B0;
}

+ (BOOL)isSupported
{
  char v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;
  BOOL v9;

  v9 = 0;
  sub_1001E4804(&v7);
  v2 = sub_1001E4874(v7, "TrackingAvoidanceOn", &v9);
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  if (v9)
    return 1;
  else
    return v2 ^ 1;
}

- (CLPeopleDensity)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPeopleDensity;
  return -[CLPeopleDensity initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPeopleDensityProtocol, &OBJC_PROTOCOL___CLIntersiloClientProtocol);
}

- (void)beginService
{
  CLTimer *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  _QWORD v8[5];
  uint8_t buf[1640];

  self->_scanAllowance = 10;
  v3 = (CLTimer *)objc_msgSend(objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo"), "newTimer");
  self->_scanAllowanceRefreshTimer = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C49B58;
  v8[3] = &unk_10212BB58;
  v8[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v8);
  -[CLTimer setNextFireDelay:interval:](self->_scanAllowanceRefreshTimer, "setNextFireDelay:interval:", 86400.0, 86400.0);
  self->_scanSessionTimer = 0;
  self->_cuScanner = 0;
  self->_requests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_classifier = 0;
  self->_isBluetoothPoweredOn = 1;
  -[CLPeopleDensity registerForBluetoothPowerNotification](self, "registerForBluetoothPowerNotification");
  if (qword_1022A0270 != -1)
    dispatch_once(&qword_1022A0270, &stru_10217B6D8);
  v4 = qword_1022A0278;
  if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BeginService: done", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v7 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BeginService: done", &v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity beginService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)endService
{
  NSObject *v3;
  NSObject *scanSessionTimer;
  CUBLEScanner *cuScanner;
  Client *value;
  Client *v7;
  CLTimer *scanAllowanceRefreshTimer;
  CLPeopleDensityClassifier *classifier;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[1640];

  if (qword_1022A0270 != -1)
    dispatch_once(&qword_1022A0270, &stru_10217B6D8);
  v3 = qword_1022A0278;
  if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "EndService: entry", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v12[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "EndService: entry", v12, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity endService]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  scanSessionTimer = self->_scanSessionTimer;
  if (scanSessionTimer)
  {
    dispatch_source_cancel(scanSessionTimer);
    dispatch_release((dispatch_object_t)self->_scanSessionTimer);
    self->_scanSessionTimer = 0;
  }
  cuScanner = self->_cuScanner;
  if (cuScanner)
  {
    -[CUBLEScanner invalidate](cuScanner, "invalidate");

    self->_cuScanner = 0;
  }
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 9);
    v7 = self->_bluetoothServiceClient.__ptr_.__value_;
    self->_bluetoothServiceClient.__ptr_.__value_ = 0;
    if (v7)
      (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  }
  self->_isBluetoothPoweredOn = 0;
  scanAllowanceRefreshTimer = self->_scanAllowanceRefreshTimer;
  if (scanAllowanceRefreshTimer)
  {
    -[CLTimer invalidate](scanAllowanceRefreshTimer, "invalidate");

    self->_scanAllowanceRefreshTimer = 0;
  }
  self->_scanAllowance = -1;

  classifier = self->_classifier;
  if (classifier)

}

- (void)isUserCurrentlyAloneWithHints:(id)a3 withReply:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  char *v10;
  const char *v11;
  CLPeopleDensityRequest *v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  const char *v16;
  uint8_t *v17;
  int v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;

  objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo");
  v7 = -[CLPeopleDensity shouldServiceQuery](self, "shouldServiceQuery");
  if (v7)
  {
    v8 = v7;
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v9 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      v10 = (char *)objc_msgSend(v8, "code");
      if ((unint64_t)(v10 - 2) > 3)
        v11 = "Bluetooth powered off";
      else
        v11 = (&off_10217B6F8)[(_QWORD)(v10 - 2)];
      *(_DWORD *)buf = 136380675;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Invalid query, %{private}s, not handling", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v13 = qword_1022A0278;
      v14 = (char *)objc_msgSend(v8, "code");
      if ((unint64_t)(v14 - 2) > 3)
        v15 = "Bluetooth powered off";
      else
        v15 = (&off_10217B6F8)[(_QWORD)(v14 - 2)];
      v18 = 136380675;
      v19 = v15;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 2, "Invalid query, %{private}s, not handling", &v18, 12);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity isUserCurrentlyAloneWithHints:withReply:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    (*((void (**)(id, void *, _QWORD))a4 + 2))(a4, v8, 0);
  }
  else
  {
    v12 = -[CLPeopleDensityRequest initWithRequestTimestamp:hints:replyBlock:]([CLPeopleDensityRequest alloc], "initWithRequestTimestamp:hints:replyBlock:", a3, a4, CFAbsoluteTimeGetCurrent());
    -[NSMutableArray addObject:](self->_requests, "addObject:", v12);

    -[CLPeopleDensity initiateScanSession](self, "initiateScanSession");
  }
}

- (void)initiateScanSession
{
  NSObject *v3;
  NSObject *v4;
  CLPeopleDensityMediumSignalClassifierConfig *v5;
  OS_dispatch_source *v6;
  dispatch_time_t v7;
  NSObject *scanSessionTimer;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD handler[5];
  _WORD v18[8];
  uint8_t buf[1640];

  if (self->_scanSessionTimer || self->_classifier || self->_cuScanner)
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v3 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initiate: already initiated, returning", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Initiate: already initiated, returning", v18, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity initiateScanSession]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v4 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initiate: setting up", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Initiate: setting up", v18, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity initiateScanSession]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v5 = -[CLPeopleDensityMediumSignalClassifierConfig initWithDefaults]([CLPeopleDensityMediumSignalClassifierConfig alloc], "initWithDefaults");
    self->_classifier = (CLPeopleDensityClassifier *)-[CLPeopleDensityClassifier initAndMarkScanningStarted:]([CLPeopleDensityClassifier alloc], "initAndMarkScanningStarted:", v5);

    if (self->_classifier)
    {
      v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo"), "queue"));
      self->_scanSessionTimer = v6;
      v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 60000000000);
      dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
      scanSessionTimer = self->_scanSessionTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100C4A784;
      handler[3] = &unk_10212BB58;
      handler[4] = self;
      dispatch_source_set_event_handler(scanSessionTimer, handler);
      -[CLPeopleDensity prepareBTLEScanner](self, "prepareBTLEScanner");
      dispatch_resume((dispatch_object_t)self->_scanSessionTimer);
      -[CUBLEScanner activate](self->_cuScanner, "activate");
      --self->_scanAllowance;
    }
    else
    {
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v9 = qword_1022A0278;
      if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to instantiate the classifier; something is wrong w/ the configuration",
          buf,
          2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        v18[0] = 0;
        LODWORD(v16) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 17, "Failed to instantiate the classifier; something is wrong w/ the configuration",
          v18,
          v16);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 0, "-[CLPeopleDensity initiateScanSession]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
      -[CLPeopleDensity replyRequestsWithErrorCode:](self, "replyRequestsWithErrorCode:", 5);
    }
  }
}

- (void)terminateScanSessionFor:(int)a3
{
  NSObject *scanSessionTimer;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint8_t *v9;
  double v10;
  NSObject *v11;
  double v12;
  uint8_t *v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t *v20;
  uint8_t *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  int v24;

  scanSessionTimer = self->_scanSessionTimer;
  if (scanSessionTimer)
  {
    if (self->_cuScanner)
    {
      if (self->_classifier)
      {
        dispatch_source_cancel(scanSessionTimer);
        dispatch_release((dispatch_object_t)self->_scanSessionTimer);
        self->_scanSessionTimer = 0;
        -[CUBLEScanner invalidate](self->_cuScanner, "invalidate");

        self->_cuScanner = 0;
        -[CLPeopleDensityClassifier markScanningStopped](self->_classifier, "markScanningStopped");
        switch(a3)
        {
          case 0:
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            v6 = qword_1022A0278;
            if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Terminate: time out when scanning, classifying", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 2))
              goto LABEL_59;
            bzero(buf, 0x65CuLL);
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            LOWORD(v22[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: time out when scanning, classifying", v22, 2, v22[0]);
            goto LABEL_70;
          case 1:
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            v16 = qword_1022A0278;
            if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Terminate: bluetooth failed, replying error", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 2))
              goto LABEL_53;
            bzero(buf, 0x65CuLL);
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            LOWORD(v22[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: bluetooth failed, replying error", v22, 2, v22[0]);
            break;
          case 2:
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            v18 = qword_1022A0278;
            if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Terminate: invalidated while timer is running, replying error", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 2))
              goto LABEL_53;
            bzero(buf, 0x65CuLL);
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            LOWORD(v22[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: invalidated while timer is running, replying error", v22, 2, v22[0]);
            break;
          case 3:
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            v19 = qword_1022A0278;
            if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Terminate: collected enough scans, classifying", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0270 != -1)
                dispatch_once(&qword_1022A0270, &stru_10217B6D8);
              LOWORD(v22[0]) = 0;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: collected enough scans, classifying", v22, 2, v22[0]);
LABEL_70:
              v21 = (uint8_t *)v7;
              sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v7);
              if (v21 != buf)
                free(v21);
            }
LABEL_59:
            -[CLPeopleDensity replyRequestsWithResult](self, "replyRequestsWithResult");
            goto LABEL_60;
          default:
            goto LABEL_60;
        }
        v20 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v17);
        if (v20 != buf)
          free(v20);
LABEL_53:
        -[CLPeopleDensity replyRequestsWithErrorCode:](self, "replyRequestsWithErrorCode:", 4);
LABEL_60:

        self->_classifier = 0;
        return;
      }
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v15 = qword_1022A0278;
      if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67174657;
        v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Terminate: called with no active classifier, %{private}d, returning", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        LODWORD(v22[0]) = 67174657;
        HIDWORD(v22[0]) = a3;
        v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: called with no active classifier, %{private}d, returning", v22, 8, v22[0]);
LABEL_37:
        v14 = v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v10);
LABEL_38:
        if (v14 != buf)
          free(v14);
      }
    }
    else
    {
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v11 = qword_1022A0278;
      if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67174657;
        v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Terminate: called with no active scanner, %{private}d, returning", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        LODWORD(v22[0]) = 67174657;
        HIDWORD(v22[0]) = a3;
        v12 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 16, "Terminate: called with no active scanner, %{private}d, returning", v22, 8);
        v14 = v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v12);
        goto LABEL_38;
      }
    }
  }
  else
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v8 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Terminate: called with no active timer, %{private}d, returning", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      LODWORD(v22[0]) = 67174657;
      HIDWORD(v22[0]) = a3;
      v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Terminate: called with no active timer, %{private}d, returning", v22, 8, v22[0]);
      goto LABEL_37;
    }
  }
}

- (void)onBTLEAdvertisement:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  char *v8;
  NSObject *v9;
  _BYTE *v10;
  _BYTE *v11;
  NSObject *v12;
  const char *v13;
  CLPeopleDensityClassifier *classifier;
  unsigned __int8 v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  const char *v21;
  const char *v22;
  char *v23;
  const char *v24;
  char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  _BYTE buf[12];
  char v30;
  char v31;
  unsigned int v32;
  CFAbsoluteTime Current;

  if (qword_1022A0270 != -1)
    dispatch_once(&qword_1022A0270, &stru_10217B6D8);
  v5 = qword_1022A0278;
  if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    *(_QWORD *)&buf[4] = -[NSString UTF8String](sub_10068B898(a3), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BTLEAdv, payload, %{private}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v18 = qword_1022A0278;
    v27 = 136380675;
    v28 = -[NSString UTF8String](sub_10068B898(a3), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "BTLEAdv, payload, %{private}s", &v27, 12);
    v20 = (char *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  if (objc_msgSend(a3, "addressData") && objc_msgSend(objc_msgSend(a3, "addressData"), "length") == (id)6)
  {
    if (objc_msgSend(a3, "manufacturerData")
      && (unint64_t)objc_msgSend(objc_msgSend(a3, "manufacturerData"), "length") > 2)
    {
      v10 = objc_msgSend(objc_msgSend(a3, "manufacturerData"), "bytes");
      v11 = v10;
      if (*v10 == 76 && !v10[1])
      {
        classifier = self->_classifier;
        sub_1015A2E04(buf, (char *)objc_msgSend(objc_msgSend(a3, "addressData"), "bytes"));
        v31 = v11[2];
        v32 = objc_msgSend(a3, "rawRSSI");
        Current = CFAbsoluteTimeGetCurrent();
        v15 = -[CLPeopleDensityClassifier ingestBTLEAdvertisement:](classifier, "ingestBTLEAdvertisement:", buf);
        if (v30 < 0)
          operator delete(*(void **)buf);
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        v16 = qword_1022A0278;
        if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "BTLEAdv, ingested advertisement to classifier", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0270 != -1)
            dispatch_once(&qword_1022A0270, &stru_10217B6D8);
          LOWORD(v27) = 0;
          LODWORD(v26) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEAdv, ingested advertisement to classifier", &v27, v26);
          v23 = (char *)v22;
          sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v22);
          if (v23 != buf)
            free(v23);
        }
        if ((v15 & 1) == 0)
        {
          if (qword_1022A0270 != -1)
            dispatch_once(&qword_1022A0270, &stru_10217B6D8);
          v17 = qword_1022A0278;
          if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "BTLEAdv, enough scan collected, terminating", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0270 != -1)
              dispatch_once(&qword_1022A0270, &stru_10217B6D8);
            LOWORD(v27) = 0;
            LODWORD(v26) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEAdv, enough scan collected, terminating", &v27, v26);
            v25 = (char *)v24;
            sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v24);
            if (v25 != buf)
              free(v25);
          }
          -[CLPeopleDensity terminateScanSessionFor:](self, "terminateScanSessionFor:", 3);
        }
      }
      else
      {
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        v12 = qword_1022A0278;
        if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "BTLEAdv, not an apple packet, discarding result", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0270 != -1)
            dispatch_once(&qword_1022A0270, &stru_10217B6D8);
          LOWORD(v27) = 0;
          LODWORD(v26) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEAdv, not an apple packet, discarding result", &v27, v26);
          v8 = (char *)v13;
          sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v13);
          goto LABEL_55;
        }
      }
    }
    else
    {
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v6 = qword_1022A0278;
      if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BTLEAdv, manufacturer data too short, discarding result", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0270 != -1)
          dispatch_once(&qword_1022A0270, &stru_10217B6D8);
        LOWORD(v27) = 0;
        LODWORD(v26) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEAdv, manufacturer data too short, discarding result", &v27, v26);
        v8 = (char *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v7);
LABEL_55:
        if (v8 != buf)
          free(v8);
      }
    }
  }
  else
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v9 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "BTLEAdv, invalid address data, discarding result", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      LOWORD(v27) = 0;
      LODWORD(v26) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEAdv, invalid address data, discarding result", &v27, v26);
      v8 = (char *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v21);
      goto LABEL_55;
    }
  }
}

- (void)onBTLEInvalidated
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (self->_scanSessionTimer)
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v3 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "BTLEInvalidationHandler: called before timer is canceled, terminating permaturely", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEInvalidationHandler: called before timer is canceled, terminating permaturely", v9, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEInvalidated]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    -[CLPeopleDensity terminateScanSessionFor:](self, "terminateScanSessionFor:", 2);
  }
  else
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v4 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BTLEInvalidationHanlder: called after timer is canceled, no-op", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "BTLEInvalidationHanlder: called after timer is canceled, no-op", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEInvalidated]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)prepareBTLEScanner
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  self->_cuScanner = (CUBLEScanner *)objc_alloc_init((Class)CUBLEScanner);
  -[CUBLEScanner setDispatchQueue:](self->_cuScanner, "setDispatchQueue:", objc_msgSend(objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo"), "queue"));
  -[CUBLEScanner setScanFlags:](self->_cuScanner, "setScanFlags:", 191);
  -[CUBLEScanner setScanRate:](self->_cuScanner, "setScanRate:", 60);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C4BCB8;
  v6[3] = &unk_10212BB58;
  v6[4] = self;
  -[CUBLEScanner setBluetoothStateChangedHandler:](self->_cuScanner, "setBluetoothStateChangedHandler:", v6);
  -[CUBLEScanner setChangeFlags:](self->_cuScanner, "setChangeFlags:", 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C4BD04;
  v5[3] = &unk_10217B690;
  v5[4] = self;
  -[CUBLEScanner setDeviceChangedHandler:](self->_cuScanner, "setDeviceChangedHandler:", v5);
  -[CUBLEScanner setDeviceLostHandler:](self->_cuScanner, "setDeviceLostHandler:", 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C4BD10;
  v4[3] = &unk_10217B6B8;
  v4[4] = self;
  -[CUBLEScanner setDeviceFoundHandler:](self->_cuScanner, "setDeviceFoundHandler:", v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C4BD1C;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  -[CUBLEScanner setInvalidationHandler:](self->_cuScanner, "setInvalidationHandler:", v3);
}

- (void)replyRequestsWithErrorCode:(int64_t)a3
{
  void (**v5)(id, NSError *, _QWORD);

  while (-[NSMutableArray count](self->_requests, "count"))
  {
    v5 = (void (**)(id, NSError *, _QWORD))objc_msgSend(-[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", 0), "reply");
    v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CLPeopleDensityErrorDomain"), a3, 0), 0);
    -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
  }
}

- (void)replyRequestsWithResult
{
  id v3;
  CLPeopleDensityClassifier *classifier;
  double v5;
  id v6;
  void (**v7)(id, _QWORD, id);

  while (-[NSMutableArray count](self->_requests, "count"))
  {
    v3 = -[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", 0);
    classifier = self->_classifier;
    objc_msgSend(v3, "requestTimestamp");
    v6 = -[CLPeopleDensityClassifier isUserAloneAt:withHints:](classifier, "isUserAloneAt:withHints:", objc_msgSend(v3, "hints"), v5);
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(v3, "reply");
    if (v6)
      v7[2](v7, 0, v6);
    else
      ((void (**)(id, NSError *, id))v7)[2](v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CLPeopleDensityErrorDomain"), 5, 0), 0);
    -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
  }
}

- (id)shouldServiceQuery
{
  double Current;
  double v4;
  uint64_t v5;

  if (self->_scanAllowance < 1)
  {
    v5 = 2;
  }
  else if (self->_isBluetoothPoweredOn)
  {
    if (!self->_scanSessionTimer)
      return 0;
    if (!self->_cuScanner)
      return 0;
    if (!self->_classifier)
      return 0;
    Current = CFAbsoluteTimeGetCurrent();
    -[NSDate timeIntervalSinceReferenceDate](-[CLPeopleDensityClassifier scanSessionStartTimestamp](self->_classifier, "scanSessionStartTimestamp"), "timeIntervalSinceReferenceDate");
    if (Current <= v4 + 10.0)
      return 0;
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CLPeopleDensityErrorDomain"), v5, 0);
}

- (void)registerForBluetoothPowerNotification
{
  self->_isBluetoothPoweredOn = 0;
  -[CLPeopleDensity universe](self, "universe");
  sub_100C10C08();
}

- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v6;
  int v7;
  int v8;
  double v9;
  uint8_t *v10;
  uint8_t *v11;
  NSObject *v13;
  double v14;
  uint8_t *v15;
  int v16;
  int v17;
  uint8_t buf[4];
  int v19;

  if (a3 == 9)
  {
    self->_isBluetoothPoweredOn = *((_BYTE *)a4 + 113);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v6 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
    {
      v7 = *((unsigned __int8 *)a4 + 113);
      *(_DWORD *)buf = 67174657;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Bluetooth notification: power, state, %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v8 = *((unsigned __int8 *)a4 + 113);
      v16 = 67174657;
      v17 = v8;
      v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Bluetooth notification: power, state, %{private}d", &v16, 8);
      v11 = v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensity onBluetoothServiceNotification:data:]", "%s\n", v9);
LABEL_19:
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_10217B6D8);
    v13 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Bluetooth notification: unexpected type, %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0270 != -1)
        dispatch_once(&qword_1022A0270, &stru_10217B6D8);
      v16 = 67174657;
      v17 = a3;
      v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 16, "Bluetooth notification: unexpected type, %{private}d", &v16, 8);
      v11 = v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLPeopleDensity onBluetoothServiceNotification:data:]", "%s\n", v14);
      goto LABEL_19;
    }
  }
}

- (BOOL)isBluetoothPoweredOn
{
  return self->_isBluetoothPoweredOn;
}

- (void)setIsBluetoothPoweredOn:(BOOL)a3
{
  self->_isBluetoothPoweredOn = a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
