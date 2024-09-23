@implementation CLEEDCoexMonitorCellular

- (BOOL)favorableCellularConditions
{
  _BOOL4 v3;

  v3 = -[CLEEDCoexMonitorCellular supportedRat](self, "supportedRat");
  if (v3)
  {
    if (-[CLEEDCoexMonitorCellular onImpactedFrequency](self, "onImpactedFrequency"))
      LOBYTE(v3) = -[CLEEDCoexMonitorCellular averageRSRP](self, "averageRSRP") >= self->fMitigationConfig.cellular.rsrpThresholddBm;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)combinedFavorableConditions
{
  if (!self->fMitigationConfig.cellular.enabled
    || -[CLEEDCoexMonitorCellular wifiAvailable](self, "wifiAvailable")
    || self->fWifiEmergency)
  {
    return 1;
  }
  else
  {
    return -[CLEEDCoexMonitorCellular favorableCellularConditions](self, "favorableCellularConditions");
  }
}

- (id)getCurrentMitigation
{
  unsigned int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  id v6;
  id v7;
  NSObject *v8;
  const char *v10;
  uint8_t *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v3 = -[CLEEDCoexMonitorCellular combinedFavorableConditions](self, "combinedFavorableConditions");
  v4 = 168;
  if (v3)
    v4 = 128;
  v5 = (unsigned __int8 *)self + v4;
  v6 = objc_msgSend(objc_alloc((Class)CLEEDMitigation), "initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:", *v5, *((int *)v5 + 1), *((int *)v5 + 2), v5[12], v5[1], *((unsigned __int8 *)&self->fUniverse + v4 + 5), 4);
  v7 = v6;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v8 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[CLEEDCoexMonitorCellular getCurrentMitigation]";
    v18 = 2114;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, Mitigation:%{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v12 = 136446466;
    v13 = "-[CLEEDCoexMonitorCellular getCurrentMitigation]";
    v14 = 2114;
    v15 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s, Mitigation:%{public}@", &v12, 22);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular getCurrentMitigation]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  return v6;
}

- (void)checkAndSendMitigation
{
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  double v6;
  uint8_t *v7;
  uint8_t *v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  const char *v12;
  const char *v13;
  const char *v14;
  double v15;
  uint8_t *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  if (!self->fNotificationCallback)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, NotificationCallback is nil, early return", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v17 = 136446210;
    v18 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
    v6 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, NotificationCallback is nil, early return", &v17, 12);
    v8 = v7;
    sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular checkAndSendMitigation]", "%s\n", v6);
LABEL_32:
    if (v8 != buf)
      free(v8);
    return;
  }
  v3 = -[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived](self, "initialCellParamsDeemedReceived");
  v4 = v3;
  if (self->fWifiInitialValueReceived && (v3 & 1) != 0)
  {
    (*((void (**)(id, id, _QWORD))self->fNotificationCallback + 2))(self->fNotificationCallback, -[CLEEDCoexMonitorCellular getCurrentMitigation](self, "getCurrentMitigation"), 0);
    return;
  }
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "received";
    v11 = !self->fWifiInitialValueReceived;
    v24 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
    if (v11)
      v12 = "nil";
    else
      v12 = "received";
    *(_DWORD *)buf = 136446722;
    v26 = v12;
    v25 = 2082;
    if (!v4)
      v10 = "nil";
    v27 = 2082;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, Awaiting initial mitigations, wifi:%{public}s, cellParams:%{public}s", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v13 = "received";
    if (self->fWifiInitialValueReceived)
      v14 = "received";
    else
      v14 = "nil";
    v17 = 136446722;
    v18 = "-[CLEEDCoexMonitorCellular checkAndSendMitigation]";
    if (!v4)
      v13 = "nil";
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v13;
    v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s, Awaiting initial mitigations, wifi:%{public}s, cellParams:%{public}s", COERCE_DOUBLE(136446722), &v17, 32);
    v8 = v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndSendMitigation]", "%s\n", v15);
    goto LABEL_32;
  }
}

- (id)ratAsString:(int)a3
{
  if ((a3 - 1) > 0xB)
    return CFSTR("GSM");
  else
    return off_102168498[a3 - 1];
}

- (id)bandAsString:(int64_t)a3 forRAT:(int)a4
{
  const __CFString *v4;

  if (a4 == 10)
  {
    v4 = CFSTR("NR Band %ld");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  }
  if (a4 == 6)
  {
    v4 = CFSTR("LTE Band %ld");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  }
  return CFSTR("-1");
}

- (BOOL)supportedRat
{
  return (self->fActiveRat > 0xCu) | (0x440u >> self->fActiveRat) & 1;
}

- (BOOL)initialCellParamsDeemedReceived
{
  NSObject *v3;
  const char *v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v9;
  const char *v10;
  id v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fWifiEmergency)
      v4 = "YES";
    else
      v4 = "NO";
    v5 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
    if (self->fULFreqInitalValueReceived)
      v6 = "YES";
    else
      v6 = "NO";
    if (self->fRSRPInitialValueReceived)
      v7 = "YES";
    else
      v7 = "NO";
    *(_DWORD *)buf = 136447234;
    v27 = "-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived]";
    v28 = 2082;
    v29 = v4;
    v30 = 2082;
    v31 = v5;
    v32 = 2082;
    v33 = v6;
    v34 = 2082;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, ulFreqReceived:%{public}s, rsrpReceived:%{public}s", buf, 0x34u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v9 = qword_1022A0088;
    if (self->fWifiEmergency)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
    if (self->fULFreqInitalValueReceived)
      v12 = "YES";
    else
      v12 = "NO";
    if (self->fRSRPInitialValueReceived)
      v13 = "YES";
    else
      v13 = "NO";
    v16 = 136447234;
    v17 = "-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived]";
    v18 = 2082;
    v19 = v10;
    v20 = 2082;
    v21 = v11;
    v22 = 2082;
    v23 = v12;
    v24 = 2082;
    v25 = v13;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, ulFreqReceived:%{public}s, rsrpReceived:%{public}s", &v16, 52);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  if (self->fWifiEmergency || !-[CLEEDCoexMonitorCellular supportedRat](self, "supportedRat"))
    return 1;
  if (self->fULFreqInitalValueReceived)
    return self->fRSRPInitialValueReceived;
  return 0;
}

- (BOOL)allowFetchingRSRP
{
  if (self->fActiveSim == 255 || self->fWifiEmergency)
    return 0;
  else
    return -[CLEEDCoexMonitorCellular supportedRat](self, "supportedRat");
}

- (void)checkAndRestartRsrpTimer
{
  CLTimer *fRsrpTimer;
  NSObject *v4;
  CLTimer *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  int fActiveSim;
  uint64_t v11;
  const char *v12;
  id v13;
  int v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int v43;

  fRsrpTimer = self->fRsrpTimer;
  if (fRsrpTimer)
  {
    -[CLTimer invalidate](fRsrpTimer, "invalidate");

    self->fRsrpTimer = 0;
  }
  if (-[CLEEDCoexMonitorCellular allowFetchingRSRP](self, "allowFetchingRSRP"))
  {
    objc_initWeak(&location, self);
    self->fRsrpTimer = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "newTimer");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v37 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s,fRsrpTimer created", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v28 = 136446210;
      v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s,fRsrpTimer created", &v28, 12);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v5 = self->fRsrpTimer;
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100ABF5E4;
    v25 = &unk_10213D3A8;
    objc_copyWeak(&v26, &location);
    -[CLTimer setHandler:](v5, "setHandler:", &v22);
    -[CLTimer setNextFireDelay:interval:](self->fRsrpTimer, "setNextFireDelay:interval:", 0.01, self->fMitigationConfig.cellular.rsrpQueryRateSecs);
    if (!self->fRsrpTimer)
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v6 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, rsrpTimer creation failure!", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_102168478);
        v28 = 136446210;
        v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
        LODWORD(v21) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, rsrpTimer creation failure!", &v28, v21, v22, v23, v24, v25);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
      -[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements](self, "fetchSignalStrengthMeasurements");
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      if (self->fWifiEmergency)
        v8 = "YES";
      else
        v8 = "NO";
      v9 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
      fActiveSim = self->fActiveSim;
      *(_DWORD *)buf = 136446978;
      v37 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      v38 = 2082;
      v39 = v8;
      v40 = 2082;
      v41 = v9;
      v42 = 1026;
      v43 = fActiveSim;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, sim:%{public}d, rsrpTimer stopped. Resetting RSRP to default", buf, 0x26u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v11 = qword_1022A0088;
      if (self->fWifiEmergency)
        v12 = "YES";
      else
        v12 = "NO";
      v13 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
      v14 = self->fActiveSim;
      v28 = 136446978;
      v29 = "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]";
      v30 = 2082;
      v31 = v12;
      v32 = 2082;
      v33 = v13;
      v34 = 1026;
      v35 = v14;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "#EED2CXCL,%{public}s, wifiEmergency:%{public}s, rat:%{public}s, sim:%{public}d, rsrpTimer stopped. Resetting RSRP to default", &v28, 38);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)handleAverageRsrpUpdate:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  int64_t rsrpThresholddBm;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fRSRPInitialValueReceived)
      v6 = "NO";
    else
      v6 = "YES";
    *(_DWORD *)buf = 136446978;
    v24 = "-[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:]";
    v25 = 2082;
    v26 = v6;
    v27 = 2050;
    v28 = a3;
    v29 = 2050;
    v30 = -[CLEEDCoexMonitorCellular averageRSRP](self, "averageRSRP");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, incomingAverageRSRP:%{public}ld, existingAverageRSRP:%{public}ld", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v11 = qword_1022A0088;
    if (self->fRSRPInitialValueReceived)
      v12 = "NO";
    else
      v12 = "YES";
    v15 = 136446978;
    v16 = "-[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:]";
    v17 = 2082;
    v18 = v12;
    v19 = 2050;
    v20 = a3;
    v21 = 2050;
    v22 = -[CLEEDCoexMonitorCellular averageRSRP](self, "averageRSRP");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "#EED2CXCL,%{public}s, InitialValue:%{public}s, incomingAverageRSRP:%{public}ld, existingAverageRSRP:%{public}ld", &v15, 42);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  if (!self->fRSRPInitialValueReceived)
  {
    self->fRSRPInitialValueReceived = 1;
LABEL_15:
    -[CLEEDCoexMonitorCellular setAverageRSRP:](self, "setAverageRSRP:", a3);
LABEL_16:
    -[CLEEDCoexMonitorCellular checkAndSendMitigation](self, "checkAndSendMitigation");
    return;
  }
  rsrpThresholddBm = self->fMitigationConfig.cellular.rsrpThresholddBm;
  if (rsrpThresholddBm > a3)
  {
    v8 = -[CLEEDCoexMonitorCellular averageRSRP](self, "averageRSRP");
    rsrpThresholddBm = self->fMitigationConfig.cellular.rsrpThresholddBm;
    if (v8 >= rsrpThresholddBm)
      goto LABEL_15;
  }
  if (rsrpThresholddBm > a3)
  {
    -[CLEEDCoexMonitorCellular setAverageRSRP:](self, "setAverageRSRP:", a3);
    return;
  }
  v9 = -[CLEEDCoexMonitorCellular averageRSRP](self, "averageRSRP");
  v10 = self->fMitigationConfig.cellular.rsrpThresholddBm;
  -[CLEEDCoexMonitorCellular setAverageRSRP:](self, "setAverageRSRP:", a3);
  if (v9 < v10)
    goto LABEL_16;
}

- (void)storeRsrpUpdate:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int *end;
  vector<int, std::allocator<int>> *p_fArrayRsrpValues;
  int *begin;
  unsigned int v11;
  int *v12;
  int *v13;
  int *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  int64_t v20;
  int *value;
  int *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  int *v28;
  int *v29;
  int v30;
  int v31;
  int *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  unint64_t v38;
  NSObject *v39;
  int64_t v40;
  int64_t v41;
  const char *v42;
  uint8_t *v43;
  double v44;
  int v45;
  const char *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  int64_t v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  int64_t v56;

  objc_msgSend(a3, "intValue");
  if ((objc_msgSend(a3, "intValue") & 0x80000000) == 0)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v52 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      v53 = 2114;
      v54 = (unint64_t)a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, Invalid rsrp:%{public}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v45 = 136446466;
      v46 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      v47 = 2114;
      v48 = (unint64_t)a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, Invalid rsrp:%{public}@", &v45, 22);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    return;
  }
  begin = self->fArrayRsrpValues.__begin_;
  end = self->fArrayRsrpValues.__end_;
  p_fArrayRsrpValues = &self->fArrayRsrpValues;
  if (self->fMitigationConfig.cellular.rsrpSamplesToAvg <= (unint64_t)(end - begin))
  {
    v20 = (char *)end - (char *)(begin + 1);
    if (end != begin + 1)
      memmove(self->fArrayRsrpValues.__begin_, begin + 1, (char *)end - (char *)(begin + 1));
    self->fArrayRsrpValues.__end_ = (int *)((char *)begin + v20);
    v11 = objc_msgSend(a3, "intValue");
    v13 = self->fArrayRsrpValues.__end_;
    value = self->fArrayRsrpValues.__end_cap_.__value_;
    if (v13 >= value)
    {
      v14 = p_fArrayRsrpValues->__begin_;
      v23 = v13 - p_fArrayRsrpValues->__begin_;
      v24 = v23 + 1;
      if (!((unint64_t)(v23 + 1) >> 62))
      {
        v25 = (char *)value - (char *)v14;
        if (v25 >> 1 > v24)
          v24 = v25 >> 1;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
          v26 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
        {
          v27 = (char *)sub_100260634((uint64_t)&self->fArrayRsrpValues.__end_cap_, v26);
          v14 = self->fArrayRsrpValues.__begin_;
          v13 = self->fArrayRsrpValues.__end_;
        }
        else
        {
          v27 = 0;
        }
        v28 = (int *)&v27[4 * v23];
        v29 = (int *)&v27[4 * v26];
        *v28 = v11;
        v22 = v28 + 1;
        while (v13 != v14)
        {
          v31 = *--v13;
          *--v28 = v31;
        }
        goto LABEL_41;
      }
LABEL_60:
      sub_100259694();
    }
  }
  else
  {
    v11 = objc_msgSend(a3, "intValue");
    v12 = self->fArrayRsrpValues.__end_cap_.__value_;
    v13 = self->fArrayRsrpValues.__end_;
    if (v13 >= v12)
    {
      v14 = p_fArrayRsrpValues->__begin_;
      v15 = v13 - p_fArrayRsrpValues->__begin_;
      v16 = v15 + 1;
      if (!((unint64_t)(v15 + 1) >> 62))
      {
        v17 = (char *)v12 - (char *)v14;
        if (v17 >> 1 > v16)
          v16 = v17 >> 1;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
          v18 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        if (v18)
        {
          v19 = (char *)sub_100260634((uint64_t)&self->fArrayRsrpValues.__end_cap_, v18);
          v14 = self->fArrayRsrpValues.__begin_;
          v13 = self->fArrayRsrpValues.__end_;
        }
        else
        {
          v19 = 0;
        }
        v28 = (int *)&v19[4 * v15];
        v29 = (int *)&v19[4 * v18];
        *v28 = v11;
        v22 = v28 + 1;
        while (v13 != v14)
        {
          v30 = *--v13;
          *--v28 = v30;
        }
LABEL_41:
        self->fArrayRsrpValues.__begin_ = v28;
        self->fArrayRsrpValues.__end_ = v22;
        self->fArrayRsrpValues.__end_cap_.__value_ = v29;
        if (v14)
          operator delete(v14);
        goto LABEL_43;
      }
      goto LABEL_60;
    }
  }
  *v13 = v11;
  v22 = v13 + 1;
LABEL_43:
  self->fArrayRsrpValues.__end_ = v22;
  v32 = self->fArrayRsrpValues.__begin_;
  v33 = v22 - v32;
  if (v33 >= self->fMitigationConfig.cellular.rsrpSamplesToAvg)
  {
    if (v32 == v22)
    {
      v36 = 0.0;
    }
    else
    {
      v34 = 0;
      do
      {
        v35 = *v32++;
        v34 += v35;
      }
      while (v32 != v22);
      v36 = (double)v34;
    }
    v37 = v36 / (double)v33;
    if (qword_1022A0080 != -1)
    {
      v44 = v37;
      dispatch_once(&qword_1022A0080, &stru_102168478);
      v37 = v44;
    }
    v38 = llround(v37);
    v39 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      v40 = self->fArrayRsrpValues.__end_ - self->fArrayRsrpValues.__begin_;
      *(_DWORD *)buf = 136446722;
      v52 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      v53 = 2050;
      v54 = v38;
      v55 = 2050;
      v56 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "#EED2CXCL,%{public}s, averageRsrp:%{public}ld, size:%{public}lu", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v41 = self->fArrayRsrpValues.__end_ - self->fArrayRsrpValues.__begin_;
      v45 = 136446722;
      v46 = "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]";
      v47 = 2050;
      v48 = v38;
      v49 = 2050;
      v50 = v41;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2CXCL,%{public}s, averageRsrp:%{public}ld, size:%{public}lu", &v45, 32);
      v43 = (uint8_t *)v42;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular storeRsrpUpdate:]", "%s\n", v42);
      if (v43 != buf)
        free(v43);
    }
    -[CLEEDCoexMonitorCellular processAverageRSRPForCA:](self, "processAverageRSRPForCA:", v38);
    -[CLEEDCoexMonitorCellular handleAverageRsrpUpdate:](self, "handleAverageRsrpUpdate:", v38);
  }
}

- (void)fetchSignalStrengthMeasurements
{
  id v3;
  uint64_t fActiveSim;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _BOOL4 fWifiEmergency;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  char *v16;
  _QWORD v17[4];
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  _BYTE location[12];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const char *v33;

  if (-[CLEEDCoexMonitorCellular allowFetchingRSRP](self, "allowFetchingRSRP"))
  {
    v3 = objc_msgSend(-[CLIntersiloUniverse vendor](self->fUniverse, "vendor"), "proxyForService:", CFSTR("CLTelephonyService"));
    objc_msgSend(v3, "registerDelegate:inSilo:", sub_1001E5288((uint64_t)&self->fCallbackDropManager), -[CLIntersiloUniverse silo](self->fUniverse, "silo"));
    objc_initWeak((id *)location, self);
    fActiveSim = self->fActiveSim;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100AC0338;
    v17[3] = &unk_102168430;
    objc_copyWeak(&v18, (id *)location);
    objc_msgSend(v3, "fetchSignalStrengthMeasurementForSim:withReply:", fActiveSim, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->fActiveSim;
      v7 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
      fWifiEmergency = self->fWifiEmergency;
      *(_QWORD *)&location[4] = "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]";
      v28 = 2050;
      *(_DWORD *)location = 136446978;
      if (fWifiEmergency)
        v9 = "YES";
      else
        v9 = "NO";
      v29 = v6;
      v30 = 2082;
      v31 = v7;
      v32 = 2082;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, cannot fetch RSRP, activeSim:%{public}ld, activeRat:%{public}s, wifiEmergency:%{public}s", location, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(location, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v10 = qword_1022A0088;
      v11 = self->fActiveSim;
      v12 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", self->fActiveRat), "UTF8String");
      v13 = self->fWifiEmergency;
      v19 = 136446978;
      v21 = 2050;
      v20 = "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]";
      if (v13)
        v14 = "YES";
      else
        v14 = "NO";
      v22 = v11;
      v23 = 2082;
      v24 = v12;
      v25 = 2082;
      v26 = v14;
      _os_log_send_and_compose_impl(2, 0, location, 1628, &_mh_execute_header, v10, 0, "#EED2CXCL,%{public}s, cannot fetch RSRP, activeSim:%{public}ld, activeRat:%{public}s, wifiEmergency:%{public}s", &v19, 42);
      v16 = (char *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular fetchSignalStrengthMeasurements]", "%s\n", v15);
      if (v16 != location)
        free(v16);
    }
  }
}

- (void)handleReachability:(int)a3
{
  NSObject *v5;
  const char *v6;
  _BOOL4 fWifiEmergency;
  const char *v8;
  const char *v9;
  _BOOL4 fWifiInitialValueReceived;
  unsigned __int8 v11;
  const char *v12;
  const char *v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  uint8_t *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    fWifiEmergency = self->fWifiEmergency;
    if (self->fWifiInitialValueReceived)
      v8 = "NO";
    else
      v8 = "YES";
    *(_DWORD *)buf = 136447234;
    v29 = "-[CLEEDCoexMonitorCellular handleReachability:]";
    v30 = 2082;
    if (a3 == 2)
      v9 = "YES";
    else
      v9 = "NO";
    v31 = v8;
    v32 = 2082;
    if (fWifiEmergency)
      v6 = "YES";
    v33 = v9;
    v34 = 2050;
    v35 = a3;
    v36 = 2082;
    v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, wifiAvailable:%{public}s, reachability:%{public}ld, wifiEmergency:%{public}s", buf, 0x34u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v12 = "NO";
    if (self->fWifiInitialValueReceived)
      v13 = "NO";
    else
      v13 = "YES";
    v14 = self->fWifiEmergency;
    if (a3 == 2)
      v15 = "YES";
    else
      v15 = "NO";
    v18 = 136447234;
    v21 = v13;
    v19 = "-[CLEEDCoexMonitorCellular handleReachability:]";
    v20 = 2082;
    if (v14)
      v12 = "YES";
    v22 = 2082;
    v23 = v15;
    v24 = 2050;
    v25 = a3;
    v26 = 2082;
    v27 = v12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s, InitialValue:%{public}s, wifiAvailable:%{public}s, reachability:%{public}ld, wifiEmergency:%{public}s", COERCE_DOUBLE(136447234), &v18, 52);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleReachability:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  fWifiInitialValueReceived = self->fWifiInitialValueReceived;
  if (self->fWifiInitialValueReceived)
  {
    if ((a3 == 2) == -[CLEEDCoexMonitorCellular wifiAvailable](self, "wifiAvailable"))
      return;
  }
  else
  {
    self->fWifiInitialValueReceived = 1;
  }
  -[CLEEDCoexMonitorCellular setWifiAvailable:](self, "setWifiAvailable:", a3 == 2);
  if (!-[CLEEDCoexMonitorCellular initialCellParamsDeemedReceived](self, "initialCellParamsDeemedReceived"))
  {
    if (fWifiInitialValueReceived)
      return;
    goto LABEL_23;
  }
  v11 = -[CLEEDCoexMonitorCellular favorableCellularConditions](self, "favorableCellularConditions");
  if (!fWifiInitialValueReceived || (v11 & 1) == 0)
LABEL_23:
    -[CLEEDCoexMonitorCellular checkAndSendMitigation](self, "checkAndSendMitigation");
}

- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6
{
  int v7;
  uint64_t v8;
  NSObject *v11;
  const char *v12;
  id v13;
  const char *v14;
  int fWifiEmergency;
  const char *v16;
  const char *v17;
  int fActiveRat;
  int *begin;
  uint64_t v20;
  const char *v21;
  id v22;
  const char *v23;
  int v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint8_t *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v11 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fActiveSim == a3)
      v12 = "NO";
    else
      v12 = "YES";
    v13 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v8), "UTF8String");
    if (self->fActiveRat == (_DWORD)v8)
      v14 = "NO";
    else
      v14 = "YES";
    fWifiEmergency = self->fWifiEmergency;
    if (v7)
      v16 = "YES";
    else
      v16 = "NO";
    *(_DWORD *)buf = 136447746;
    v44 = "-[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:]";
    if (fWifiEmergency == v7)
      v17 = "NO";
    else
      v17 = "YES";
    v45 = 2050;
    v46 = a3;
    v47 = 2082;
    v48 = v12;
    v49 = 2082;
    v50 = v13;
    v51 = 2082;
    v52 = v14;
    v53 = 2082;
    v54 = v16;
    v55 = 2082;
    v56 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, sim:%{public}ld, simChanged:%{public}s, rat:%{public}s, ratChanged:%{public}s, wifiEmergency:%{public}s, wifiEmergencyChanged:%{public}s", buf, 0x48u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v20 = qword_1022A0088;
    if (self->fActiveSim == a3)
      v21 = "NO";
    else
      v21 = "YES";
    v22 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v8), "UTF8String");
    if (self->fActiveRat == (_DWORD)v8)
      v23 = "NO";
    else
      v23 = "YES";
    v24 = self->fWifiEmergency;
    if (v7)
      v25 = "YES";
    else
      v25 = "NO";
    v29 = 136447746;
    v30 = "-[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:]";
    if (v24 == v7)
      v26 = "NO";
    else
      v26 = "YES";
    v31 = 2050;
    v32 = a3;
    v33 = 2082;
    v34 = v21;
    v35 = 2082;
    v36 = v22;
    v37 = 2082;
    v38 = v23;
    v39 = 2082;
    v40 = v25;
    v41 = 2082;
    v42 = v26;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "#EED2CXCL,%{public}s, sim:%{public}ld, simChanged:%{public}s, rat:%{public}s, ratChanged:%{public}s, wifiEmergency:%{public}s, wifiEmergencyChanged:%{public}s", COERCE_DOUBLE(136447746), &v29, 72);
    v28 = (uint8_t *)v27;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:]", "%s\n", v27);
    if (v28 != buf)
      free(v28);
  }
  fActiveRat = self->fActiveRat;
  if (fActiveRat != (_DWORD)v8)
  {
    self->fActiveRat = v8;
    self->fArrayRsrpValues.__end_ = self->fArrayRsrpValues.__begin_;
  }
  if (self->fActiveSim != a3)
  {
    self->fActiveSim = a3;
    begin = self->fArrayRsrpValues.__begin_;
    self->fArrayRsrpValues.__end_ = begin;
    if (self->fWifiEmergency == v7)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (self->fWifiEmergency != v7)
  {
    begin = self->fArrayRsrpValues.__begin_;
LABEL_27:
    self->fWifiEmergency = v7;
    self->fArrayRsrpValues.__end_ = begin;
    goto LABEL_28;
  }
  if (fActiveRat != (_DWORD)v8)
  {
LABEL_28:
    -[CLEEDCoexMonitorCellular checkAndRestartRsrpTimer](self, "checkAndRestartRsrpTimer");
    -[CLEEDCoexMonitorCellular checkAndSendMitigation](self, "checkAndSendMitigation");
  }
  if (-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"))
  {
    -[CLEEDCoexCellularForCA setCellularBand:](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "setCellularBand:", a6);
    -[CLEEDCoexCellularForCA setCellularRAT:](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "setCellularRAT:", v8);
    if (-[CLEEDCoexMonitorCellular fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback"))
      (*((void (**)(void))-[CLEEDCoexMonitorCellular fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback") + 2))();
  }
}

- (void)handleVlqmForActiveCall:(int)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v4 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[CLEEDCoexMonitorCellular handleVlqmForActiveCall:]";
    v13 = 1026;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, voiceLQM:%{public}d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v7 = 136446466;
    v8 = "-[CLEEDCoexMonitorCellular handleVlqmForActiveCall:]";
    v9 = 1026;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s, voiceLQM:%{public}d", &v7, 18);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleVlqmForActiveCall:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)handleUplinkFrequency:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;

  if (a3)
  {
    v5 = (int)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ULCenterFrequency")), "intValue");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v6 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      v24 = 2114;
      v25 = a3;
      v26 = 2082;
      v27 = objc_msgSend(-[CLEEDCoexMonitorCellular BandInfoTypeAsString:](self, "BandInfoTypeAsString:", (int)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BandInfoType")), "intValue")), "UTF8String");
      v28 = 2050;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, UL Frequency Info callback, Dict:%{public}@, Band:%{public}s CenterFrequency:%{public}ld", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v11 = qword_1022A0088;
      v14 = 136446978;
      v15 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      v16 = 2114;
      v17 = a3;
      v18 = 2082;
      v19 = objc_msgSend(-[CLEEDCoexMonitorCellular BandInfoTypeAsString:](self, "BandInfoTypeAsString:", (int)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BandInfoType")), "intValue")), "UTF8String");
      v20 = 2050;
      v21 = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "#EED2CXCL,%{public}s, UL Frequency Info callback, Dict:%{public}@, Band:%{public}s CenterFrequency:%{public}ld", &v14, 42);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    if (self->fULFreqInitalValueReceived)
    {
      v7 = -[CLEEDCoexMonitorCellular ulCenterFrequency](self, "ulCenterFrequency");
      -[CLEEDCoexMonitorCellular setUlCenterFrequency:](self, "setUlCenterFrequency:", v5);
      if (v7 == v5)
        return;
    }
    else
    {
      self->fULFreqInitalValueReceived = 1;
      -[CLEEDCoexMonitorCellular setUlCenterFrequency:](self, "setUlCenterFrequency:", v5);
    }
    -[CLEEDCoexMonitorCellular checkAndSendMitigation](self, "checkAndSendMitigation");
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v8 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v23 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, ULFrequencyInfo is nil.", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v14 = 136446210;
      v15 = "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, ULFrequencyInfo is nil.", &v14, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular handleUplinkFrequency:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (BOOL)onImpactedFrequency
{
  NSObject *v3;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int64_t v15;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[CLEEDCoexMonitorCellular onImpactedFrequency]";
    v14 = 2050;
    v15 = -[CLEEDCoexMonitorCellular ulCenterFrequency](self, "ulCenterFrequency");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, ulCenterFrequency:%{public}ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v5 = qword_1022A0088;
    v8 = 136446466;
    v9 = "-[CLEEDCoexMonitorCellular onImpactedFrequency]";
    v10 = 2050;
    v11 = -[CLEEDCoexMonitorCellular ulCenterFrequency](self, "ulCenterFrequency");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 0, "#EED2CXCL,%{public}s, ulCenterFrequency:%{public}ld", &v8, 22);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular onImpactedFrequency]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  return !-[CLEEDCoexMonitorCellular ulCenterFrequency](self, "ulCenterFrequency")
      || -[CLEEDCoexMonitorCellular ulCenterFrequency](self, "ulCenterFrequency") >= self->fMitigationConfig.cellular.ulFreqThresholdMHz;
}

- (id)BandInfoTypeAsString:(int64_t)a3
{
  id result;

  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        return CFSTR("HDR");
      case 32:
        return CFSTR("WCDMA");
      case 64:
        return CFSTR("NR5G");
      default:
        return CFSTR("Unknown");
    }
  }
  else
  {
    result = CFSTR("LTE");
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        result = CFSTR("TDSCDMA");
        break;
      case 4:
        result = CFSTR("GSM");
        break;
      case 8:
        result = CFSTR("CDMA");
        break;
      default:
        return CFSTR("Unknown");
    }
  }
  return result;
}

- (void)queryDCAwareState
{
  uint32_t state;
  uint32_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t state64;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;

  state64 = 0;
  state = notify_get_state(self->fDCAwareNotificationToken, &state64);
  if (state)
  {
    v4 = state;
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[CLEEDCoexMonitorCellular queryDCAwareState]";
      v23 = 1026;
      LODWORD(v24) = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, could not get DCAware State, status:%{public}u", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v15 = 136446466;
      v16 = "-[CLEEDCoexMonitorCellular queryDCAwareState]";
      v17 = 1026;
      LODWORD(v18) = v4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, could not get DCAware State, status:%{public}u", &v15, 18);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular queryDCAwareState]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v8 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "NO";
      if (!self->fDCAwareInitialValueReceived)
        v9 = "YES";
      *(_DWORD *)buf = 136446722;
      v22 = "-[CLEEDCoexMonitorCellular queryDCAwareState]";
      v23 = 2082;
      v24 = v9;
      v25 = 2050;
      v26 = state64;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s, InitialValue:%{public}s, DCAwareState:%{public}llu", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v11 = "NO";
      if (!self->fDCAwareInitialValueReceived)
        v11 = "YES";
      v15 = 136446722;
      v16 = "-[CLEEDCoexMonitorCellular queryDCAwareState]";
      v17 = 2082;
      v18 = v11;
      v19 = 2050;
      v20 = state64;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXCL,%{public}s, InitialValue:%{public}s, DCAwareState:%{public}llu", &v15, 32);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular queryDCAwareState]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    if (!self->fDCAwareInitialValueReceived
      || (v10 = (void *)state64,
          v10 != (void *)-[CLEEDCoexMonitorCellular currentDCAwareValue](self, "currentDCAwareValue")))
    {
      self->fDCAwareInitialValueReceived = 1;
      -[CLEEDCoexMonitorCellular setCurrentDCAwareValue:](self, "setCurrentDCAwareValue:", state64);
    }
  }
}

- (CLEEDCoexMonitorCellular)initWithUniverse:(id)a3 mitigationConfig:(MitigationsConfig *)a4 activeSim:(int)a5 Rat:(int)a6 wifiEmergency:(BOOL)a7 cachedCoexMetricData:(id)a8 eventCB:(id)a9 coexMetricUpdateCB:(id)a10
{
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v16;
  id v17;
  char *v18;
  _BYTE *v19;
  CLEEDCoexMonitorCellular *v20;
  CLEEDCoexMonitorCellular *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  MitigationParams light;
  MitigationParams heavyAndGreater;
  NSObject *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  NSObject *fULInfoQueue;
  NSObject *v33;
  uint32_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v40;
  const char *v41;
  id *v42;
  char *v43;
  char *v44;
  const char *v45;
  uint8_t *v46;
  const char *v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD handler[4];
  id v55;
  _QWORD v56[6];
  _QWORD v57[4];
  id v58;
  _QWORD block[5];
  objc_super v60;
  id location[2];
  char v62;
  _BYTE __p[12];
  __int16 v64;
  id v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  id *v73;
  __int16 v74;
  id v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  id v83;
  __int16 v84;
  char *v85;
  __int16 v86;
  _BYTE *v87;
  __int16 v88;
  id v89;

  v10 = a7;
  v11 = *(_QWORD *)&a6;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v16 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v11), "UTF8String");
    v18 = v10 ? "YES" : "NO";
    sub_100920930((unsigned __int8 *)&a4->cellular, __p);
    v19 = v66 >= 0 ? __p : *(_BYTE **)__p;
    *(_DWORD *)buf = 136447746;
    v77 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:"
          "eventCB:coexMetricUpdateCB:]";
    v78 = 2114;
    v79 = a3;
    v80 = 2050;
    v81 = a5;
    v82 = 2082;
    v83 = v17;
    v84 = 2082;
    v85 = v18;
    v86 = 2082;
    v87 = v19;
    v88 = 2114;
    v89 = a9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#EED2CXCL,%{public}s[universe:%{public}@,sim:%{public}ld,rat:%{public}s,wifiEmergency:%{public}s,cellularConfig:%{public}s,mitigationCB:%{public}@]", buf, 0x48u);
    if (SHIBYTE(v66) < 0)
      operator delete(*(void **)__p);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v50 = qword_1022A0088;
    v40 = objc_msgSend(-[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", v11), "UTF8String");
    if (v10)
      v41 = "YES";
    else
      v41 = "NO";
    sub_100920930((unsigned __int8 *)&a4->cellular, location);
    if (v62 >= 0)
      v42 = location;
    else
      v42 = (id *)location[0];
    *(_DWORD *)__p = 136447746;
    *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cached"
                         "CoexMetricData:eventCB:coexMetricUpdateCB:]";
    v64 = 2114;
    v65 = a3;
    v66 = 2050;
    v67 = a5;
    v68 = 2082;
    v69 = v40;
    v70 = 2082;
    v71 = v41;
    v72 = 2082;
    v73 = v42;
    v74 = 2114;
    v75 = a9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v50, 0, "#EED2CXCL,%{public}s[universe:%{public}@,sim:%{public}ld,rat:%{public}s,wifiEmergency:%{public}s,cellularConfig:%{public}s,mitigationCB:%{public}@]", __p, 72);
    v44 = v43;
    if (v62 < 0)
      operator delete(location[0]);
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v44);
    if (v44 != (char *)buf)
      free(v44);
  }
  v60.receiver = self;
  v60.super_class = (Class)CLEEDCoexMonitorCellular;
  v20 = -[CLEEDCoexMonitorCellular init](&v60, "init");
  v21 = v20;
  if (v20)
  {
    v20->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(objc_msgSend(a3, "silo"), "queue"));
    *(_WORD *)&v21->fWifiInitialValueReceived = 0;
    v21->fULFreqInitalValueReceived = 0;
    v21->fDCAwareInitialValueReceived = 0;
    v21->fRsrpTimer = 0;
    sub_1002A3054((char *)&v21->fArrayRsrpValues, 0, 0, 0);
    v21->fActiveSim = a5;
    v21->fActiveRat = v11;
    v21->fWifiEmergency = v10;
    v22 = *(_OWORD *)&a4->cellular.enabled;
    v21->fMitigationConfig.nominal = a4->nominal;
    *(_OWORD *)&v21->fMitigationConfig.cellular.enabled = v22;
    v23 = *(_OWORD *)&a4->cellular.rsrpSamplesToAvg;
    v24 = *(_OWORD *)&a4->cellular.belowThresholdParams.maxStreamingBitrateKbps;
    v25 = *(_OWORD *)&a4->thermal.moderate.maxFramerateFps;
    *(_OWORD *)&v21->fMitigationConfig.thermal.light.maxFramerateFps = *(_OWORD *)&a4->thermal.light.maxFramerateFps;
    *(_OWORD *)&v21->fMitigationConfig.thermal.moderate.maxFramerateFps = v25;
    *(_OWORD *)&v21->fMitigationConfig.cellular.rsrpSamplesToAvg = v23;
    *(_OWORD *)&v21->fMitigationConfig.cellular.belowThresholdParams.maxStreamingBitrateKbps = v24;
    v26 = *(_OWORD *)&a4->thermal.heavyAndGreater.maxFramerateFps;
    light = a4->peakPower.light;
    heavyAndGreater = a4->peakPower.heavyAndGreater;
    v21->fMitigationConfig.peakPower.moderate = a4->peakPower.moderate;
    v21->fMitigationConfig.peakPower.heavyAndGreater = heavyAndGreater;
    *(_OWORD *)&v21->fMitigationConfig.thermal.heavyAndGreater.maxFramerateFps = v26;
    v21->fMitigationConfig.peakPower.light = light;
    v21->_wifiAvailable = 0;
    v21->_averageRSRP = -150;
    v21->_ulCenterFrequency = 0;
    v21->fNotificationCallback = _Block_copy(a9);
    v21->_fCoexMetricUpdateCallback = _Block_copy(a10);
    if (!v21->fMitigationConfig.cellular.enabled)
    {
      v29 = objc_msgSend(-[CLIntersiloUniverse silo](v21->fUniverse, "silo"), "queue");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100AC2498;
      block[3] = &unk_10212BB58;
      block[4] = v21;
      dispatch_async(v29, block);
    }
    v21->fUCMClient = (WRM_UCMInterface *)objc_alloc_init((Class)WRM_UCMInterface);
    v21->_fCoexCellularForCA = -[CLEEDCoexCellularForCA initWithCoexMetricDict:]([CLEEDCoexCellularForCA alloc], "initWithCoexMetricDict:", a8);
    if (v21->fUCMClient)
    {
      v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v31 = dispatch_queue_create("com.apple.Client.queueSOS.wirelesscoexmanager", v30);
      v21->fULInfoQueue = (OS_dispatch_queue *)v31;
      -[WRM_UCMInterface registerClient:queue:](v21->fUCMClient, "registerClient:queue:", 42, v31);
      objc_initWeak(location, v21);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100AC2670;
      v57[3] = &unk_102168458;
      objc_copyWeak(&v58, location);
      fULInfoQueue = v21->fULInfoQueue;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100AC28C4;
      v56[3] = &unk_102159978;
      v56[4] = v21;
      v56[5] = v57;
      dispatch_async(fULInfoQueue, v56);
      v33 = objc_msgSend(-[CLIntersiloUniverse silo](v21->fUniverse, "silo"), "queue");
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100AC28D0;
      handler[3] = &unk_10213EAC8;
      objc_copyWeak(&v55, location);
      v34 = notify_register_dispatch("com.apple.CoreTelephony.UL.Health.Emergency.Bottleneck", &v21->fDCAwareNotificationToken, v33, handler);
      if (!v34)
      {
        v37 = objc_msgSend(-[CLIntersiloUniverse silo](v21->fUniverse, "silo"), "queue");
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100AC28F4;
        v53[3] = &unk_10212BB58;
        v53[4] = v21;
        dispatch_async(v37, v53);
        v38 = objc_msgSend(-[CLIntersiloUniverse silo](v21->fUniverse, "silo"), "queue");
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_100AC28FC;
        v52[3] = &unk_10212BB58;
        v52[4] = v21;
        dispatch_async(v38, v52);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&v58);
        objc_destroyWeak(location);
        return v21;
      }
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v35 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v77 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricD"
              "ata:eventCB:coexMetricUpdateCB:]";
        v78 = 1026;
        LODWORD(v79) = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s: unable to register for DCAware notifications, status:%{public}u", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_102168478);
        *(_DWORD *)__p = 136446466;
        *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:ca"
                             "chedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        v64 = 1026;
        LODWORD(v65) = v34;
        LODWORD(v49) = 18;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s: unable to register for DCAware notifications, status:%{public}u", __p, v49);
        v46 = (uint8_t *)v45;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v45);
        if (v46 != buf)
          free(v46);
      }
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v58);
      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      v36 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricD"
              "ata:eventCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "#EED2CXCL,%{public}s, WRM_UCMInterface init failure", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_102168478);
        *(_DWORD *)__p = 136446210;
        *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:ca"
                             "chedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        LODWORD(v49) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 17, "#EED2CXCL,%{public}s, WRM_UCMInterface init failure", __p, v49);
        v48 = (uint8_t *)v47;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v47);
        if (v48 != buf)
          free(v48);
      }
    }
    return 0;
  }
  return v21;
}

- (void)dealloc
{
  NSObject *v3;
  id fNotificationCallback;
  id fCoexMetricUpdateCallback;
  WRM_UCMInterface *fUCMClient;
  int *begin;
  CLTimer *fRsrpTimer;
  OS_dispatch_queue *fULInfoQueue;
  CLEEDCoexCellularForCA *fCoexCellularForCA;
  const char *v11;
  uint8_t *v12;
  objc_super v13;
  int v14;
  const char *v15;
  uint8_t buf[4];
  const char *v17;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v17 = "-[CLEEDCoexMonitorCellular dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2CXCL,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v14 = 136446210;
    v15 = "-[CLEEDCoexMonitorCellular dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2CXCL,%{public}s", &v14, 12);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorCellular dealloc]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  fNotificationCallback = self->fNotificationCallback;
  if (fNotificationCallback)
  {
    _Block_release(fNotificationCallback);
    self->fNotificationCallback = 0;
  }
  fCoexMetricUpdateCallback = self->_fCoexMetricUpdateCallback;
  if (fCoexMetricUpdateCallback)
  {
    _Block_release(fCoexMetricUpdateCallback);
    self->_fCoexMetricUpdateCallback = 0;
  }
  fUCMClient = self->fUCMClient;
  if (fUCMClient)
  {
    -[WRM_UCMInterface unregisterClient](fUCMClient, "unregisterClient");

    self->fUCMClient = 0;
  }
  begin = self->fArrayRsrpValues.__begin_;
  if (self->fArrayRsrpValues.__end_ != begin)
  {
    self->fArrayRsrpValues.__end_ = begin;
    sub_1002A3054((char *)&self->fArrayRsrpValues, 0, 0, 0);
  }
  fRsrpTimer = self->fRsrpTimer;
  if (fRsrpTimer)
  {
    -[CLTimer invalidate](fRsrpTimer, "invalidate");

    self->fRsrpTimer = 0;
  }
  fULInfoQueue = self->fULInfoQueue;
  if (fULInfoQueue)
  {

    self->fULInfoQueue = 0;
  }
  fCoexCellularForCA = self->_fCoexCellularForCA;
  if (fCoexCellularForCA)
  {

    self->_fCoexCellularForCA = 0;
  }
  self->fUniverse = 0;
  v13.receiver = self;
  v13.super_class = (Class)CLEEDCoexMonitorCellular;
  -[CLEEDCoexMonitorCellular dealloc](&v13, "dealloc");
}

- (void)processAverageRSRPForCA:(int64_t)a3
{
  _BOOL4 fRSRPInitialValueReceived;
  CLEEDCoexCellularForCA *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void (**v10)(_QWORD);
  int v11;
  const char *v12;
  uint8_t buf[4];
  const char *v14;

  if (-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"))
  {
    fRSRPInitialValueReceived = self->fRSRPInitialValueReceived;
    v6 = -[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA");
    if (fRSRPInitialValueReceived)
    {
      if (-[CLEEDCoexCellularForCA maxCellularRSRP](v6, "maxCellularRSRP") < a3)
        -[CLEEDCoexCellularForCA setMaxCellularRSRP:](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "setMaxCellularRSRP:", a3);
      if (-[CLEEDCoexCellularForCA minCellularRSRP](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "minCellularRSRP") <= a3)goto LABEL_18;
    }
    else
    {
      -[CLEEDCoexCellularForCA setMaxCellularRSRP:](v6, "setMaxCellularRSRP:", a3);
    }
    -[CLEEDCoexCellularForCA setMinCellularRSRP:](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "setMinCellularRSRP:", a3);
LABEL_18:
    if (-[CLEEDCoexMonitorCellular fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback"))
    {
      v10 = -[CLEEDCoexMonitorCellular fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback");
      v10[2](v10);
    }
    return;
  }
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102168478);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[CLEEDCoexMonitorCellular processAverageRSRPForCA:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "#EED2CXCL,%{public}s,nil fCoexCellularForCA,early return", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v11 = 136446210;
    v12 = "-[CLEEDCoexMonitorCellular processAverageRSRPForCA:]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 17, "#EED2CXCL,%{public}s,nil fCoexCellularForCA,early return", &v11, 12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular processAverageRSRPForCA:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSNumber *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;

  if (a3 && *a3)
  {
    v5 = a4;
    if (-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"))
    {
      v7 = *a3;
      if (v5)
      {
        objc_msgSend(v7, "setValue:forKey:", -[CLEEDCoexMonitorCellular ratAsString:](self, "ratAsString:", -[CLEEDCoexCellularForCA cellularRAT](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularRAT")), CFSTR("cellularRAT"));
        v8 = *a3;
        v9 = -[CLEEDCoexMonitorCellular bandAsString:forRAT:](self, "bandAsString:forRAT:", -[CLEEDCoexCellularForCA cellularBand](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularBand"), -[CLEEDCoexCellularForCA cellularRAT](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularRAT"));
      }
      else
      {
        objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexCellularForCA cellularRAT](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularRAT")), CFSTR("cellularRAT"));
        v8 = *a3;
        v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLEEDCoexCellularForCA cellularBand](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "cellularBand"));
      }
      objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("cellularBand"));
      objc_msgSend(*a3, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLEEDCoexCellularForCA minCellularRSRP](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "minCellularRSRP")), CFSTR("minCellularRSRP"));
      objc_msgSend(*a3, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLEEDCoexCellularForCA maxCellularRSRP](-[CLEEDCoexMonitorCellular fCoexCellularForCA](self, "fCoexCellularForCA"), "maxCellularRSRP")), CFSTR("maxCellularRSRP"));
      return;
    }
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v11 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v16 = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, nil fCoexCellularForCA", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      LODWORD(v14) = 136446210;
      *(_QWORD *)((char *)&v14 + 4) = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, nil fCoexCellularForCA", &v14, 12, v14);
LABEL_25:
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102168478);
    v10 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v16 = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2CXCL,%{public}s, nil metricDict", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102168478);
      LODWORD(v14) = 136446210;
      *(_QWORD *)((char *)&v14 + 4) = "-[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXCL,%{public}s, nil metricDict", &v14, 12, v14);
      goto LABEL_25;
    }
  }
}

- (int64_t)averageRSRP
{
  return self->_averageRSRP;
}

- (void)setAverageRSRP:(int64_t)a3
{
  self->_averageRSRP = a3;
}

- (BOOL)wifiAvailable
{
  return self->_wifiAvailable;
}

- (void)setWifiAvailable:(BOOL)a3
{
  self->_wifiAvailable = a3;
}

- (int64_t)ulCenterFrequency
{
  return self->_ulCenterFrequency;
}

- (void)setUlCenterFrequency:(int64_t)a3
{
  self->_ulCenterFrequency = a3;
}

- (int64_t)currentDCAwareValue
{
  return self->_currentDCAwareValue;
}

- (void)setCurrentDCAwareValue:(int64_t)a3
{
  self->_currentDCAwareValue = a3;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_fCoexMetricUpdateCallback = a3;
}

- (CLEEDCoexCellularForCA)fCoexCellularForCA
{
  return self->_fCoexCellularForCA;
}

- (void)setFCoexCellularForCA:(id)a3
{
  self->_fCoexCellularForCA = (CLEEDCoexCellularForCA *)a3;
}

- (void).cxx_destruct
{
  int *begin;

  sub_1007A1B98((uint64_t)&self->fCallbackDropManager);
  begin = self->fArrayRsrpValues.__begin_;
  if (begin)
  {
    self->fArrayRsrpValues.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  char *v3;

  self->fArrayRsrpValues.__begin_ = 0;
  self->fArrayRsrpValues.__end_ = 0;
  self->fArrayRsrpValues.__end_cap_.__value_ = 0;
  self->fCallbackDropManager._vptr$CLCallbackDropManager = (void **)off_102141E98;
  v3 = (char *)operator new(0x20uLL);
  *((_QWORD *)v3 + 2) = 0;
  *((_DWORD *)v3 + 6) = 31337;
  *(_QWORD *)v3 = off_102141ED0;
  *((_QWORD *)v3 + 1) = 0;
  self->fCallbackDropManager._vptr$CLCallbackDropManager = (void **)off_102152D70;
  self->fCallbackDropManager.fToken.__ptr_ = (int *)(v3 + 24);
  self->fCallbackDropManager.fToken.__cntrl_ = (__shared_weak_count *)v3;
  self->fCallbackDropManager.fNullDelegate = 0;
  *(_WORD *)&self->fMitigationConfig.nominal.allowNewStreamingRequests = 257;
  *(_QWORD *)&self->fMitigationConfig.nominal.maxFramerateFps = 0x32000000018;
  *(_WORD *)&self->fMitigationConfig.nominal.dropStreaming = 0;
  self->fMitigationConfig.cellular.enabled = 1;
  self->fMitigationConfig.cellular.rsrpThresholddBm = -115;
  self->fMitigationConfig.cellular.rsrpQueryRateSecs = 2.0;
  *(_QWORD *)&self->fMitigationConfig.cellular.rsrpSamplesToAvg = 0x3E800000005;
  *(_WORD *)&self->fMitigationConfig.cellular.belowThresholdParams.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.cellular.belowThresholdParams.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.cellular.belowThresholdParams.dropStreaming = 257;
  self->fMitigationConfig.thermal.enabled = 1;
  *(_WORD *)&self->fMitigationConfig.thermal.light.allowNewStreamingRequests = 257;
  *(_QWORD *)&self->fMitigationConfig.thermal.light.maxFramerateFps = 0x32000000018;
  *(_WORD *)&self->fMitigationConfig.thermal.light.dropStreaming = 0;
  *(_WORD *)&self->fMitigationConfig.thermal.moderate.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.thermal.moderate.maxFramerateFps = 0x6400000005;
  *(_WORD *)&self->fMitigationConfig.thermal.moderate.dropStreaming = 256;
  *(_WORD *)&self->fMitigationConfig.thermal.heavyAndGreater.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.thermal.heavyAndGreater.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.thermal.heavyAndGreater.dropStreaming = 257;
  self->fMitigationConfig.peakPower.enabled = 1;
  *(_WORD *)&self->fMitigationConfig.peakPower.light.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.peakPower.light.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.light.dropStreaming = 257;
  *(_WORD *)&self->fMitigationConfig.peakPower.moderate.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.peakPower.moderate.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.moderate.dropStreaming = 257;
  *(_WORD *)&self->fMitigationConfig.peakPower.heavyAndGreater.allowNewStreamingRequests = 0;
  *(_QWORD *)&self->fMitigationConfig.peakPower.heavyAndGreater.maxFramerateFps = -1;
  *(_WORD *)&self->fMitigationConfig.peakPower.heavyAndGreater.dropStreaming = 257;
  return self;
}

@end
