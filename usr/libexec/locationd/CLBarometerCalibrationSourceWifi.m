@implementation CLBarometerCalibrationSourceWifi

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  char *v13;
  char *v14;
  int v15;
  const char *v16;
  uint8_t buf[4];
  const char *v18;

  if (a3 == 12)
  {
    if (sub_1010679CC(*(_DWORD *)(a4 + 140)))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v8 = sub_100CF2174(*(_DWORD *)(a4 + 140));
        *(_DWORD *)buf = 136446210;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ignoring NotificationScanCache source %{public}s", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
        v9 = qword_10229FE88;
        v10 = sub_100CF2174(*(_DWORD *)(a4 + 140));
        v15 = 136446210;
        v16 = v10;
        v11 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 2, "ignoring NotificationScanCache source %{public}s", &v15, 12);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf)
          free(v11);
      }
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      v12 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "received wifi scan cache notification", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
        LOWORD(v15) = 0;
        v14 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "received wifi scan cache notification", &v15, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v14);
        if (v14 != (char *)buf)
          free(v14);
      }
      objc_msgSend(a1, "processScanCache:", a4 + 112);
    }
  }
  else if (a3 == 3)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received wifi scan notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      LOWORD(v15) = 0;
      v13 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "received wifi scan notification", &v15, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
    objc_msgSend(a1, "processActiveScan:", a4 + 112);
  }
}

- (void)processActiveScan:(const void *)a3
{
  uint64_t **i;
  uint64_t **v6;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t *v17;
  std::string *p_p;
  int v19;
  int v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t value;
  char *v27;
  char *v28;
  double lastSubmissionToSourceAggregator;
  CFAbsoluteTime Current;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  double v44;
  CFAbsoluteTime v45;
  char *v46;
  double v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  uint64_t *v57;
  std::__shared_weak_count *v58;
  uint64_t *v59;
  std::__shared_weak_count *v60;
  uint64_t **v61;
  uint64_t **v62;
  std::string __p;
  double v64;
  __int16 v65;
  CFAbsoluteTime v66;
  _BYTE buf[64];
  __int128 v68;
  uint64_t v69;

  if (self->lastSubmissionToSourceAggregator == 1.79769313e308)
    self->lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
  if (CFAbsoluteTimeGetCurrent() > self->lastSubmissionToSourceAggregator + 5.0)
  {
    sub_100014E5C((uint64_t)&self->activeScanBuffer, 0xAu, (uint64_t)&v61);
    v6 = v61;
    for (i = v62; v6 != i; v6 += 2)
    {
      v7 = *v6;
      v8 = (std::__shared_weak_count *)v6[1];
      v59 = *v6;
      v60 = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
        delegate = self->super._delegate;
        v57 = v7;
        v58 = v8;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      else
      {
        delegate = self->super._delegate;
        v57 = v7;
        v58 = 0;
      }
      -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 2, &v57);
      v13 = v58;
      if (v58)
      {
        v14 = (unint64_t *)&v58->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      v16 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v17 = v59;
        sub_1000C2150(v59 + 1, &__p);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        v19 = *((_DWORD *)v17 + 4);
        v20 = *((_DWORD *)v17 + 6);
        v21 = *v17;
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2081;
        *(_QWORD *)&buf[20] = p_p;
        *(_WORD *)&buf[28] = 1025;
        *(_DWORD *)&buf[30] = v19;
        *(_WORD *)&buf[34] = 1025;
        *(_DWORD *)&buf[36] = v20;
        *(_WORD *)&buf[40] = 2049;
        *(_QWORD *)&buf[42] = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submit wifi scan data\", \"mac\":%{private, location:escape_only}s, \"channel\":%{private}d, \"rssi\":%{private}d, \"scan time stamp_s\":\"%{private}.09f\"}", buf, 0x32u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      v22 = v60;
      if (v60)
      {
        v23 = (unint64_t *)&v60->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
    v25 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      value = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      v28 = (char *)v61;
      v27 = (char *)v62;
      lastSubmissionToSourceAggregator = self->lastSubmissionToSourceAggregator;
      Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = value;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (v27 - v28) >> 4;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = lastSubmissionToSourceAggregator;
      *(_WORD *)&buf[32] = 2048;
      *(CFAbsoluteTime *)&buf[34] = Current;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "buffered %zu samples, submitted %zu samples, between %f and %f", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      v40 = qword_10229FE88;
      v41 = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      v43 = (char *)v61;
      v42 = (char *)v62;
      v44 = self->lastSubmissionToSourceAggregator;
      v45 = CFAbsoluteTimeGetCurrent();
      LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v41;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (v42 - v43) >> 4;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
      v64 = v44;
      v65 = 2048;
      v66 = v45;
      v46 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v40, 2, "buffered %zu samples, submitted %zu samples, between %f and %f", (size_t)&__p, 42, v47, *(double *)&a3);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi processActiveScan:]", "%s\n", v46);
      if (v46 != buf)
        free(v46);
    }
    sub_1000255D0((uint64_t)&self->activeScanBuffer);
    self->lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)buf = &v61;
    sub_1002A3684((void ***)buf);
  }
  v31 = *(_QWORD *)a3;
  v32 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v32)
  {
    do
    {
      *(_QWORD *)buf = *(_QWORD *)v31;
      if (*(char *)(v31 + 31) < 0)
      {
        sub_100115CE4(&buf[8], *(void **)(v31 + 8), *(_QWORD *)(v31 + 16));
      }
      else
      {
        v33 = *(_OWORD *)(v31 + 8);
        *(_QWORD *)&buf[24] = *(_QWORD *)(v31 + 24);
        *(_OWORD *)&buf[8] = v33;
      }
      v34 = *(_OWORD *)(v31 + 32);
      v35 = *(_OWORD *)(v31 + 48);
      v36 = *(_OWORD *)(v31 + 64);
      v69 = *(_QWORD *)(v31 + 80);
      *(_OWORD *)&buf[48] = v35;
      v68 = v36;
      *(_OWORD *)&buf[32] = v34;
      if (!sub_1002058D0((uint64_t)buf))
      {
        v48 = *(_QWORD *)buf;
        if ((buf[31] & 0x80000000) != 0)
        {
          sub_100115CE4(&v49, *(void **)&buf[8], *(unint64_t *)&buf[16]);
        }
        else
        {
          v49 = *(_OWORD *)&buf[8];
          v50 = *(_QWORD *)&buf[24];
        }
        v51 = *(_OWORD *)&buf[32];
        v52 = *(_OWORD *)&buf[48];
        v53 = v68;
        v54 = v69;
        -[CLBarometerCalibrationSourceWifi convertAPToWifiData:](self, "convertAPToWifiData:", &v48);
        sub_1000AEF7C(&self->activeScanBuffer.buffer.__table_.__bucket_list_.__ptr_.__value_, &v55);
        v37 = v56;
        if (v56)
        {
          v38 = (unint64_t *)&v56->__shared_owners_;
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
            std::__shared_weak_count::__release_weak(v37);
          }
        }
        if (SHIBYTE(v50) < 0)
          operator delete((void *)v49);
      }
      if ((buf[31] & 0x80000000) != 0)
        operator delete(*(void **)&buf[8]);
      v31 += 88;
    }
    while (v31 != v32);
  }
}

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData>)convertAPToWifiData:(AccessPoint *)a3
{
  uint64_t *v3;
  uint64_t *v5;
  CLBarometerCalibrationWifiData *v6;
  __shared_weak_count *v7;
  uint64_t v8;
  void *v9;
  void *__p[2];
  uint64_t v11;
  shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData> result;

  v5 = v3;
  v6 = (CLBarometerCalibrationWifiData *)sub_1012A9128(v3);
  v8 = *v5;
  *(_QWORD *)(v8 + 8) = a3->var0.var0;
  *(_DWORD *)(v8 + 16) = a3->var1.var0;
  *(_DWORD *)(v8 + 24) = a3->var1.__r_.var0;
  if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
  {
    v6 = (CLBarometerCalibrationWifiData *)sub_100115CE4(__p, a3->var1.__r_.__value_.var0.var1.__data_, a3->var1.__r_.__value_.var0.var1.__size_);
    v8 = *v5;
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var1.__r_.__value_.var0.var0.__data_;
    v11 = *((_QWORD *)&a3->var1.__r_.__value_.var0.var1 + 2);
  }
  v9 = (void *)HIBYTE(v11);
  if (v11 < 0)
    v9 = __p[1];
  *(_BYTE *)(v8 + 20) = v9 == 0;
  if (SHIBYTE(v11) < 0)
  {
    operator delete(__p[0]);
    v8 = *v5;
  }
  *(_QWORD *)v8 = a3[1].var1.__r_.__value_.var0.var1.__data_;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (CLBarometerCalibrationSourceWifi)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSourceWifi *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLBarometerCalibrationSourceWifi;
  v5 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v7, "initWithUniverse:delegate:", a3, a4);
  if (v5)
  {
    v5->_wifiServiceProxy = (CLWifiServiceProtocol *)objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", CFSTR("CLWifiService"));
    sub_1001B7DEC();
  }
  return 0;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
    sub_10061DCC4();
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 3);
    objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 12);
    self->super._sourceEnabled = 0;
  }
}

- (void)processScanCache:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CLBarometerCalibrationSourceClient *delegate;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  __int128 __p;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v3 = *(uint64_t **)a3;
  v4 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v4)
  {
    do
    {
      v26 = *v3;
      if (*((char *)v3 + 31) < 0)
      {
        sub_100115CE4(&v27, (void *)v3[1], v3[2]);
      }
      else
      {
        v6 = *(_OWORD *)(v3 + 1);
        v28 = v3[3];
        v27 = v6;
      }
      v7 = *((_OWORD *)v3 + 2);
      v8 = *((_OWORD *)v3 + 3);
      v9 = *((_OWORD *)v3 + 4);
      v32 = v3[10];
      v30 = v8;
      v31 = v9;
      v29 = v7;
      if (!sub_1002058D0((uint64_t)&v26))
      {
        delegate = self->super._delegate;
        v17 = v26;
        if (SHIBYTE(v28) < 0)
        {
          sub_100115CE4(&__p, (void *)v27, *((unint64_t *)&v27 + 1));
        }
        else
        {
          __p = v27;
          v19 = v28;
        }
        v20 = v29;
        v21 = v30;
        v22 = v31;
        v23 = v32;
        -[CLBarometerCalibrationSourceWifi convertAPToWifiData:](self, "convertAPToWifiData:", &v17);
        v25 = v24;
        v24 = 0uLL;
        -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 2, &v25);
        v11 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1))
        {
          v12 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
        v14 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
        if (*((_QWORD *)&v24 + 1))
        {
          v15 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        if (SHIBYTE(v19) < 0)
          operator delete((void *)__p);
      }
      if (SHIBYTE(v28) < 0)
        operator delete((void *)v27);
      v3 += 11;
    }
    while (v3 != v4);
  }
}

- (void)dealloc
{
  Client *value;
  objc_super v4;

  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);

  self->_wifiServiceProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourceWifi;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)writeWifiAPToJson:(id)a3 withData:(const void *)a4
{
  id v5;
  double Current;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  std::string *v16;
  void *v17;
  NSDictionary *v18;
  NSObject *v19;
  const char *v20;
  char *v21;
  void *__p[2];
  uint64_t v23;
  uint64_t v24;
  std::string::size_type v25;
  _BYTE buf[24];
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  std::string v32;
  _QWORD v33[6];
  _QWORD v34[6];

  v5 = objc_msgSend(objc_alloc((Class)NSOutputStream), "initToFileAtPath:append:", a3, 1);
  objc_msgSend(v5, "open");
  v25 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v7 = *((_QWORD *)a4 + 1);
  if (*(_QWORD *)a4 != v7)
  {
    v8 = Current;
    v9 = *(_QWORD *)a4 + 8;
    do
    {
      v11 = v9 - 8;
      v10 = *(_QWORD *)(v9 - 8);
      *(_QWORD *)buf = v10;
      if (*(char *)(v9 + 23) < 0)
      {
        sub_100115CE4(&buf[8], *(void **)v9, *(_QWORD *)(v9 + 8));
        v10 = *(_QWORD *)buf;
      }
      else
      {
        v12 = *(_OWORD *)v9;
        v27 = *(_QWORD *)(v9 + 16);
        *(_OWORD *)&buf[8] = v12;
      }
      v13 = *(_OWORD *)(v9 + 24);
      v14 = *(_OWORD *)(v9 + 40);
      v15 = *(_OWORD *)(v9 + 56);
      v31 = *(_QWORD *)(v9 + 72);
      v29 = v14;
      v30 = v15;
      v28 = v13;
      v33[0] = CFSTR("mac");
      v24 = v10;
      sub_1000C2150(&v24, &v32);
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = &v32;
      else
        v16 = (std::string *)v32.__r_.__value_.__r.__words[0];
      v34[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16);
      v33[1] = CFSTR("channel");
      v34[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", DWORD2(v28));
      v33[2] = CFSTR("rssi");
      v34[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28);
      v33[3] = CFSTR("hidden");
      if (SHIBYTE(v27) < 0)
      {
        sub_100115CE4(__p, *(void **)&buf[8], *(unint64_t *)&buf[16]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)&buf[8];
        v23 = v27;
      }
      v17 = (void *)HIBYTE(v23);
      if (v23 < 0)
        v17 = __p[1];
      v34[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17 == 0);
      v33[4] = CFSTR("timestamp");
      v34[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v29 + 1));
      v33[5] = CFSTR("collectionTime");
      v34[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8);
      v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v32.__r_.__value_.__l.__data_);
      +[NSJSONSerialization writeJSONObject:toStream:options:error:](NSJSONSerialization, "writeJSONObject:toStream:options:error:", v18, v5, 8, &v25);
      if (SHIBYTE(v27) < 0)
        operator delete(*(void **)&buf[8]);
      v9 += 88;
    }
    while (v11 + 88 != v7);
  }
  if (v25)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
    v19 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to serialize dictionary data to json stream. Error: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021AC3C0);
      LODWORD(v32.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "Unable to serialize dictionary data to json stream. Error: %@", &v32, 12);
      v21 = (char *)v20;
      sub_100512490("Generic", 1, 0, 0, "-[CLBarometerCalibrationSourceWifi writeWifiAPToJson:withData:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
  }
  objc_msgSend(v5, "close", Current);
}

- (void).cxx_destruct
{
  Client *value;

  sub_100090BB8((uint64_t)&self->activeScanBuffer);
  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end
