@implementation CLTrackingAvoidanceBOMScanManager

- (CLTrackingAvoidanceBOMScanManager)initWithQueue:(id)a3 andController:(id)a4
{
  CLTrackingAvoidanceBOMScanManager *v6;
  CLTrackingAvoidanceBOMScanManager *v7;
  int v8;
  double v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  double coolDownScan;
  unsigned int v20;
  objc_super v22;
  double v23;
  uint8_t buf[8];
  _BYTE v25[10];
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  uint64_t v29;

  v22.receiver = self;
  v22.super_class = (Class)CLTrackingAvoidanceBOMScanManager;
  v6 = -[CLTrackingAvoidanceBOMScanManager init](&v22, "init");
  v7 = v6;
  if (!v6)
    return v7;
  v6->_queue = (OS_dispatch_queue *)a3;
  v6->_controller = (CLAvengerScannerClient *)a4;
  sub_1001E4804(buf);
  v23 = 0.0;
  v8 = sub_1001FD98C(*(uint64_t *)buf, "TrackingAvoidanceCooldownTimeForBOMScan", &v23);
  v9 = v23;
  if (!v8)
    v9 = 960.0;
  v7->_coolDownScan = v9;
  v10 = *(std::__shared_weak_count **)v25;
  if (*(_QWORD *)v25)
  {
    v11 = (unint64_t *)(*(_QWORD *)v25 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v7->_dailyStartingValue = 5;
  sub_1001E4804(buf);
  v13 = sub_100526244(*(uint64_t *)buf, "TrackingAvoidanceRemainingBOMScansStartingValue", &v7->_dailyStartingValue);
  v14 = v13;
  v15 = *(std::__shared_weak_count **)v25;
  if (*(_QWORD *)v25)
  {
    v16 = (unint64_t *)(*(_QWORD *)v25 + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
      if (!v14)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  if (v13)
LABEL_14:
    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](v7, "setRemainingBOMScansTo:", v7->_dailyStartingValue);
LABEL_15:
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v18 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    coolDownScan = v7->_coolDownScan;
    v20 = -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](v7, "remainingBOMScans");
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v25 = 2082;
    *(_QWORD *)&v25[2] = "";
    v26 = 2050;
    v27 = (unint64_t)coolDownScan;
    v28 = 2050;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan manager init \", \"coolDownScan\":%{public}lu, \"remainingBOMScans\":%{public}lu}", buf, 0x26u);
  }
  -[CLTrackingAvoidanceBOMScanManager submitBOMMetricsBoot](v7, "submitBOMMetricsBoot");
  return v7;
}

- (id)initAndStartWithQueue:(id)a3 andController:(id)a4
{
  CLTrackingAvoidanceBOMScanManager *v4;
  CLTrackingAvoidanceBOMScanManager *v5;

  v4 = -[CLTrackingAvoidanceBOMScanManager initWithQueue:andController:](self, "initWithQueue:andController:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CLTrackingAvoidanceBOMScanManager resetBOMScanIfNeeded](v4, "resetBOMScanIfNeeded");
    -[CLTrackingAvoidanceBOMScanManager scheduleDailyResetBOMScan](v5, "scheduleDailyResetBOMScan");
    -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](v5, "dispatchEnableBomScanAfterBackoff");
  }
  return v5;
}

- (void)setTimeStampLastBeepOnMoveScan:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;

  v6 = a3;
  v3 = sub_1001FD94C();
  sub_10018A4CC(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting last BOM timestamp\", \"time\":%{private}lu}", buf, 0x1Cu);
  }
}

- (id)timestampOfLastBeepOnMoveScanDate
{
  uint64_t v3;
  NSObject *v4;
  double v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;

  v6 = 0.0;
  v3 = sub_1001FD94C();
  if ((sub_1001FD98C(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6) & 1) == 0)
  {
    v6 = 0.0;
    -[CLTrackingAvoidanceBOMScanManager setTimeStampLastBeepOnMoveScan:](self, "setTimeStampLastBeepOnMoveScan:", 0.0);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_10213D408);
    v4 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2049;
      v12 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"timestampOfLastBeepOnMoveScanDate\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6);
}

- (void)setTimestampLastBOMDailyLimitResetDate:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;

  v6 = a3;
  v3 = sub_1001FD94C();
  sub_10018A4CC(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting last BOM daily limit reset timestamp\", \"time\":%{private}lu}", buf, 0x1Cu);
  }
}

- (id)timestampOfLastBOMDailyLimitResetDate
{
  uint64_t v3;
  NSObject *v4;
  double v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;

  v6 = 0.0;
  v3 = sub_1001FD94C();
  if ((sub_1001FD98C(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6) & 1) == 0)
  {
    v6 = 0.0;
    -[CLTrackingAvoidanceBOMScanManager setTimestampLastBOMDailyLimitResetDate:](self, "setTimestampLastBOMDailyLimitResetDate:", 0.0);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_10213D408);
    v4 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2049;
      v12 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"lastBOMDailyLimitResetKey\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6);
}

- (void)setRemainingBOMScansTo:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v6 = a3;
  v3 = sub_1001FD94C();
  sub_100019BD4(v3, "TrackingAvoidanceRemainingBOMScans", &v6);
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting scans reaming\", \"remainingBOMScans\":%{private}lu}", buf, 0x1Cu);
  }
}

- (unsigned)remainingBOMScans
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v6 = 0;
  v3 = sub_1001FD94C();
  if ((sub_100526244(v3, "TrackingAvoidanceRemainingBOMScans", &v6) & 1) == 0)
  {
    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](self, "setRemainingBOMScansTo:", 5);
    v6 = 5;
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_10213D408);
    v4 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2049;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"remainingBOMScans\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return v6;
}

- (void)handleRegisterWithController:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM register\"}", (uint8_t *)v6, 0x12u);
  }
  -[CLTrackingAvoidanceBOMScanManager setController:](self, "setController:", a3);
  -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
}

- (void)handleUnRegisterController
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM unregister\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLTrackingAvoidanceBOMScanManager setController:](self, "setController:", 0);
}

- (void)enableBOMScan
{
  NSObject *v3;
  unsigned int v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    v6 = 68289539;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2049;
    v11 = -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans");
    v12 = 2113;
    v13 = -[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate](self, "timestampOfLastBeepOnMoveScanDate");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scans\", \"count\":%{private}lu, \"LastBOMScan\":%{private, location:escape_only}@}", (uint8_t *)&v6, 0x26u);
  }
  if (-[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans")
    && -[CLTrackingAvoidanceBOMScanManager controller](self, "controller"))
  {
    v4 = -[CLAvengerScannerClient performNotOptedInBOMScan](self->_controller, "performNotOptedInBOMScan");
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_10213D408);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      v6 = 68289283;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2049;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan completed\", \"completed\":%{private}lu}", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (double)computeBOMScanBackoffOfDate:(id)a3
{
  double v4;
  double coolDownScan;
  BOOL v6;
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", -[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate](self, "timestampOfLastBeepOnMoveScanDate"));
  coolDownScan = self->_coolDownScan;
  v6 = v4 >= coolDownScan || v4 < 0.0;
  result = coolDownScan - v4;
  if (v6)
    return 0.0;
  return result;
}

- (void)dispatchEnableBomScanAfterBackoff
{
  double v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[CLTrackingAvoidanceBOMScanManager computeBOMScanBackoffOfDate:](self, "computeBOMScanBackoffOfDate:", +[NSDate now](NSDate, "now"));
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100481774;
  v6[3] = &unk_10213D3A8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)scanCompleted
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan completed \"}", (uint8_t *)v4, 0x12u);
  }
  -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](self, "setRemainingBOMScansTo:", -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans") - 1);
  -[NSDate timeIntervalSinceDate:](+[NSDate now](NSDate, "now"), "timeIntervalSinceDate:", -[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate](self, "timestampOfLastBeepOnMoveScanDate"));
  -[CLTrackingAvoidanceBOMScanManager submitBOMMetricsScansCompleted:andTimeSinceLastDisable:](self, "submitBOMMetricsScansCompleted:andTimeSinceLastDisable:", 1);
  -[NSDate timeIntervalSince1970](+[NSDate now](NSDate, "now"), "timeIntervalSince1970");
  -[CLTrackingAvoidanceBOMScanManager setTimeStampLastBeepOnMoveScan:](self, "setTimeStampLastBeepOnMoveScan:");
  -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
}

- (void)submitBOMMetricsBoot
{
  AnalyticsSendEventLazy(CFSTR("com.apple.clx.ta.BOMScanning"), &stru_10213D3E8);
}

- (void)submitBOMMetricsScansCompleted:(unint64_t)a3 andTimeSinceLastDisable:(double)a4
{
  double v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;

  if (a4 > 86400.0 || a4 < 0.0)
    v6 = -1.0;
  else
    v6 = a4;
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v7 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2050;
    v14 = (unint64_t)v6;
    v15 = 2050;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM metrics \", \"timeSinceLastDisable\":%{public}lu, \"scanCount\":%{public}lu}", buf, 0x26u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100481A44;
  v8[3] = &unk_102139B90;
  v8[4] = a3;
  *(double *)&v8[5] = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.clx.ta.BOMScanning"), v8);
}

- (void)resetBOMScanIfNeeded
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (-[CLTrackingAvoidanceBOMScanManager checkDailyResetEligible:](self, "checkDailyResetEligible:", +[NSDate now](NSDate, "now")))
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_10213D408);
    v3 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM reset \"}", (uint8_t *)v4, 0x12u);
    }
    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](self, "setRemainingBOMScansTo:", self->_dailyStartingValue);
    -[NSDate timeIntervalSince1970](+[NSDate now](NSDate, "now"), "timeIntervalSince1970");
    -[CLTrackingAvoidanceBOMScanManager setTimestampLastBOMDailyLimitResetDate:](self, "setTimestampLastBOMDailyLimitResetDate:");
    -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
  }
}

- (BOOL)checkDailyResetEligible:(id)a3
{
  double v3;
  double v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;

  objc_msgSend(a3, "timeIntervalSinceDate:", -[CLTrackingAvoidanceBOMScanManager timestampOfLastBOMDailyLimitResetDate](self, "timestampOfLastBOMDailyLimitResetDate"));
  v4 = v3;
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2050;
    v11 = (unint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM checking daily reset \", \"timeSinceLastDailyReset\":%{public}lu}", (uint8_t *)v7, 0x1Cu);
  }
  return v4 < -86400.0 || v4 > 86400.0;
}

- (void)scheduleDailyResetBOMScan
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  id buf;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_10213D408);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
  {
    buf = (id)68289282;
    v9 = 2082;
    v10 = "";
    v11 = 2050;
    v12 = 3600;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM schedule daily reset check\", \"timeUntilNextReset\":%{public}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  objc_initWeak(&buf, self);
  v4 = dispatch_time(0, 3600000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100481EA4;
  block[3] = &unk_10213D3A8;
  objc_copyWeak(&v7, &buf);
  dispatch_after(v4, queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (CLAvengerScannerClient)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClient *)a3;
}

- (double)coolDownScan
{
  return self->_coolDownScan;
}

- (unsigned)dailyStartingValue
{
  return self->_dailyStartingValue;
}

@end
