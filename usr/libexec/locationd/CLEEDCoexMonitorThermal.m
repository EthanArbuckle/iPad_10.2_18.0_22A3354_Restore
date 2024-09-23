@implementation CLEEDCoexMonitorThermal

- (CLEEDCoexMonitorThermal)initWithQueue:(id)a3 mitigationConfig:(MitigationsConfig *)a4 cachedCoexMetricData:(id)a5 eventCB:(id)a6 coexMetricUpdateCB:(id)a7
{
  NSObject *v13;
  _BYTE *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  MitigationParams light;
  MitigationParams heavyAndGreater;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  id *v29;
  char *v30;
  char *v31;
  const char *v32;
  uint8_t *v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD handler[4];
  id v37;
  _QWORD block[5];
  objc_super v39;
  id location[2];
  char v41;
  _BYTE __p[12];
  __int16 v43;
  id v44;
  __int16 v45;
  id *v46;
  __int16 v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  _BYTE *v54;
  __int16 v55;
  id v56;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102140790);
  v13 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    sub_1004C3D30((unsigned __int8 *)&a4->thermal, __p);
    v14 = v45 >= 0 ? __p : *(_BYTE **)__p;
    *(_DWORD *)buf = 136446978;
    v50 = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
    v51 = 2114;
    v52 = a3;
    v53 = 2082;
    v54 = v14;
    v55 = 2114;
    v56 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s[queue:%{public}@,thermalConfig:%{public}s,mitigationCB:%{public}@]", buf, 0x2Au);
    if (SHIBYTE(v45) < 0)
      operator delete(*(void **)__p);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v28 = qword_1022A0088;
    sub_1004C3D30((unsigned __int8 *)&a4->thermal, location);
    if (v41 >= 0)
      v29 = location;
    else
      v29 = (id *)location[0];
    *(_DWORD *)__p = 136446978;
    *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
    v43 = 2114;
    v44 = a3;
    v45 = 2082;
    v46 = v29;
    v47 = 2114;
    v48 = a6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 0, "#EED2CXTH,%{public}s[queue:%{public}@,thermalConfig:%{public}s,mitigationCB:%{public}@]", __p, 42);
    v31 = v30;
    if (v41 < 0)
      operator delete(location[0]);
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v31);
    if (v31 != (char *)buf)
      free(v31);
  }
  v39.receiver = self;
  v39.super_class = (Class)CLEEDCoexMonitorThermal;
  v15 = -[CLEEDCoexMonitorThermal init](&v39, "init");
  if (v15)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)a3);
    *((_QWORD *)v15 + 1) = a3;
    *((_QWORD *)v15 + 2) = _Block_copy(a6);
    *((_QWORD *)v15 + 25) = _Block_copy(a7);
    *((_BYTE *)v15 + 24) = 0;
    v16 = *(_OWORD *)&a4->cellular.enabled;
    *((_OWORD *)v15 + 2) = a4->nominal;
    *((_OWORD *)v15 + 3) = v16;
    v17 = *(_OWORD *)&a4->cellular.rsrpSamplesToAvg;
    v18 = *(_OWORD *)&a4->cellular.belowThresholdParams.maxStreamingBitrateKbps;
    v19 = *(_OWORD *)&a4->thermal.moderate.maxFramerateFps;
    *((_OWORD *)v15 + 6) = *(_OWORD *)&a4->thermal.light.maxFramerateFps;
    *((_OWORD *)v15 + 7) = v19;
    *((_OWORD *)v15 + 4) = v17;
    *((_OWORD *)v15 + 5) = v18;
    v20 = *(_OWORD *)&a4->thermal.heavyAndGreater.maxFramerateFps;
    light = a4->peakPower.light;
    heavyAndGreater = a4->peakPower.heavyAndGreater;
    *((_OWORD *)v15 + 10) = a4->peakPower.moderate;
    *((MitigationParams *)v15 + 11) = heavyAndGreater;
    *((_OWORD *)v15 + 8) = v20;
    *((MitigationParams *)v15 + 9) = light;
    *((_QWORD *)v15 + 26) = -[CLEEDCoexThermalForCA initWithCoexMetricDict:]([CLEEDCoexThermalForCA alloc], "initWithCoexMetricDict:", a5);
    if (!*((_BYTE *)v15 + 88))
    {
      v23 = *((_QWORD *)v15 + 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004FD24C;
      block[3] = &unk_10212BB58;
      block[4] = v15;
      dispatch_async(v23, block);
    }
    objc_initWeak(location, v15);
    v24 = *((_QWORD *)v15 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004FD424;
    handler[3] = &unk_10213EAC8;
    objc_copyWeak(&v37, location);
    if (notify_register_dispatch("com.apple.system.thermalpressurelevel", (int *)v15 + 48, v24, handler))
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      v25 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v50 = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s: unable to register for Thermal notifications", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_102140790);
        *(_DWORD *)__p = 136446210;
        *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]";
        LODWORD(v34) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXTH,%{public}s: unable to register for Thermal notifications", __p, v34);
        v33 = (uint8_t *)v32;
        sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:]", "%s\n", v32);
        if (v33 != buf)
          free(v33);
      }
      objc_destroyWeak(&v37);
      objc_destroyWeak(location);
      return 0;
    }
    else
    {
      v26 = *((_QWORD *)v15 + 1);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1004FD448;
      v35[3] = &unk_10212BB58;
      v35[4] = v15;
      dispatch_async(v26, v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak(location);
    }
  }
  return (CLEEDCoexMonitorThermal *)v15;
}

- (void)dealloc
{
  NSObject *v3;
  id fNotificationCallback;
  id fCoexMetricUpdateCallback;
  CLEEDCoexThermalForCA *fCoexTermalForCA;
  const char *v7;
  uint8_t *v8;
  objc_super v9;
  int v10;
  const char *v11;
  uint8_t buf[4];
  const char *v13;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102140790);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[CLEEDCoexMonitorThermal dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v10 = 136446210;
    v11 = "-[CLEEDCoexMonitorThermal dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXTH,%{public}s", &v10, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal dealloc]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  notify_cancel(self->fToken);
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
  fCoexTermalForCA = self->_fCoexTermalForCA;
  if (fCoexTermalForCA)
  {

    self->_fCoexTermalForCA = 0;
  }
  self->fQueue = 0;
  v9.receiver = self;
  v9.super_class = (Class)CLEEDCoexMonitorThermal;
  -[CLEEDCoexMonitorThermal dealloc](&v9, "dealloc");
}

- (void)queryThermalLevel
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  void (**fNotificationCallback)(id, id, _QWORD);
  const char *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t state64;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;

  state64 = 0;
  if (notify_get_state(self->fToken, &state64))
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v3 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, could not get Thermal State", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      v14 = 136446210;
      v15 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXTH,%{public}s, could not get Thermal State", &v14, 12);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal queryThermalLevel]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v6 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "NO";
      if (!self->fInitialValueReceived)
        v7 = "YES";
      *(_DWORD *)buf = 136446722;
      v21 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      v22 = 2082;
      v23 = v7;
      v24 = 2050;
      v25 = state64;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s, InitialValue:%{public}s, ThermalPressureLevel:%{public}llu", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      v10 = "NO";
      if (!self->fInitialValueReceived)
        v10 = "YES";
      v14 = 136446722;
      v15 = "-[CLEEDCoexMonitorThermal queryThermalLevel]";
      v16 = 2082;
      v17 = v10;
      v18 = 2050;
      v19 = state64;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXTH,%{public}s, InitialValue:%{public}s, ThermalPressureLevel:%{public}llu", &v14, 32);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal queryThermalLevel]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if (!self->fInitialValueReceived
      || (v8 = state64, -[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel") != v8))
    {
      -[CLEEDCoexMonitorThermal processThermalLevelForCA:](self, "processThermalLevelForCA:", state64);
      self->fInitialValueReceived = 1;
      -[CLEEDCoexMonitorThermal setCurrentThermalLevel:](self, "setCurrentThermalLevel:", state64);
      fNotificationCallback = (void (**)(id, id, _QWORD))self->fNotificationCallback;
      if (fNotificationCallback)
        fNotificationCallback[2](fNotificationCallback, -[CLEEDCoexMonitorThermal getMitigationForCurrentlevel](self, "getMitigationForCurrentlevel"), 0);
    }
  }
}

- (id)getMitigationForCurrentlevel
{
  MitigationsConfig *p_fMitigationConfig;
  int v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  id v29;

  p_fMitigationConfig = &self->fMitigationConfig;
  if (self->fMitigationConfig.thermal.enabled)
  {
    v4 = -[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel");
    if (v4 > 29)
    {
      if (v4 == 30 || v4 == 40 || v4 == 50)
      {
        p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.heavyAndGreater;
        goto LABEL_17;
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
          goto LABEL_17;
        case 10:
          p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.light;
          goto LABEL_17;
        case 20:
          p_fMitigationConfig = (MitigationsConfig *)&self->fMitigationConfig.thermal.moderate;
          goto LABEL_17;
      }
    }
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v25 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "#EED2CXTH,%{public}s, unhandled thermal state", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      v18 = 136446210;
      v19 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 17, "#EED2CXTH,%{public}s, unhandled thermal state", &v18, 12);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
LABEL_17:
  v6 = objc_msgSend(objc_alloc((Class)CLEEDMitigation), "initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:", p_fMitigationConfig->nominal.allowNewStreamingRequests, p_fMitigationConfig->nominal.maxFramerateFps, p_fMitigationConfig->nominal.maxStreamingBitrateKbps, p_fMitigationConfig->nominal.dropStreaming, p_fMitigationConfig->nominal.allowNewMediaRequests, p_fMitigationConfig->nominal.delayMedia, 2);
  v7 = v6;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_102140790);
  v8 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel");
    *(_DWORD *)buf = 136446722;
    v25 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
    v26 = 1026;
    v27 = v9;
    v28 = 2114;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXTH,%{public}s ThermalState:%{public}u, Mitigation:%{public}@", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v11 = qword_1022A0088;
    v12 = -[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel");
    v18 = 136446722;
    v19 = "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]";
    v20 = 1026;
    v21 = v12;
    v22 = 2114;
    v23 = v6;
    LODWORD(v17) = 28;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "#EED2CXTH,%{public}s ThermalState:%{public}u, Mitigation:%{public}@", &v18, v17);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitorThermal getMitigationForCurrentlevel]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  return v6;
}

- (void)processThermalLevelForCA:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (!self->fInitialValueReceived)
  {
    -[CLEEDCoexThermalForCA setThermalLevelAtStartOfCall:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalLevelAtStartOfCall:", *(_QWORD *)&a3);
LABEL_6:
    -[CLEEDCoexThermalForCA setMaxThermalLevelInCall:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setMaxThermalLevelInCall:", v3);
    goto LABEL_7;
  }
  if (-[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel") == a3)
    goto LABEL_8;
  -[CLEEDCoexMonitorThermal computeThermalLevelDurationForCA](self, "computeThermalLevelDurationForCA");
  if (-[CLEEDCoexThermalForCA maxThermalLevelInCall](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "maxThermalLevelInCall") < (int)v3)goto LABEL_6;
LABEL_7:
  -[CLEEDCoexThermalForCA setCurrentThermalLevelStartTime:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setCurrentThermalLevelStartTime:", CFAbsoluteTimeGetCurrent());
LABEL_8:
  -[CLEEDCoexThermalForCA setThermalLevelAtEndOfCall:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalLevelAtEndOfCall:", v3);
  if (-[CLEEDCoexMonitorThermal fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback"))
    (*((void (**)(void))-[CLEEDCoexMonitorThermal fCoexMetricUpdateCallback](self, "fCoexMetricUpdateCallback") + 2))();
}

- (void)computeThermalLevelDurationForCA
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Current;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v3 = -[CLEEDCoexMonitorThermal currentThermalLevel](self, "currentThermalLevel");
  if (v3 > 29)
  {
    switch(v3)
    {
      case 30:
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        if (v19 > 0.0)
        {
          -[CLEEDCoexThermalForCA thermalHeavyDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalHeavyDuration");
          v21 = v20;
          Current = CFAbsoluteTimeGetCurrent();
          -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
          -[CLEEDCoexThermalForCA setThermalHeavyDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalHeavyDuration:", v21 + vabdd_f64(Current, v23));
        }
        break;
      case 40:
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        if (v29 > 0.0)
        {
          -[CLEEDCoexThermalForCA thermalTrappingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalTrappingDuration");
          v31 = v30;
          v32 = CFAbsoluteTimeGetCurrent();
          -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
          -[CLEEDCoexThermalForCA setThermalTrappingDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalTrappingDuration:", v31 + vabdd_f64(v32, v33));
        }
        break;
      case 50:
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        if (v9 > 0.0)
        {
          -[CLEEDCoexThermalForCA thermalSleepingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalSleepingDuration");
          v11 = v10;
          v12 = CFAbsoluteTimeGetCurrent();
          -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
          -[CLEEDCoexThermalForCA setThermalSleepingDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalSleepingDuration:", v11 + vabdd_f64(v12, v13));
        }
        break;
    }
  }
  else if (v3)
  {
    if (v3 == 10)
    {
      -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
      if (v24 > 0.0)
      {
        -[CLEEDCoexThermalForCA thermalLightDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLightDuration");
        v26 = v25;
        v27 = CFAbsoluteTimeGetCurrent();
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        -[CLEEDCoexThermalForCA setThermalLightDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalLightDuration:", v26 + vabdd_f64(v27, v28));
      }
    }
    else if (v3 == 20)
    {
      -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
      if (v4 > 0.0)
      {
        -[CLEEDCoexThermalForCA thermalModerateDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalModerateDuration");
        v6 = v5;
        v7 = CFAbsoluteTimeGetCurrent();
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        -[CLEEDCoexThermalForCA setThermalModerateDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalModerateDuration:", v6 + vabdd_f64(v7, v8));
      }
    }
  }
  else
  {
    -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
    if (v14 > 0.0)
    {
      -[CLEEDCoexThermalForCA thermalNominalDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalNominalDuration");
      v16 = v15;
      v17 = CFAbsoluteTimeGetCurrent();
      -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
      -[CLEEDCoexThermalForCA setThermalNominalDuration:](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "setThermalNominalDuration:", v16 + vabdd_f64(v17, v18));
    }
  }
}

- (void)updateCoexMetricDict:(id *)a3 forCASubmission:(BOOL)a4
{
  _BOOL4 v5;
  id v7;
  double v8;
  uint64_t v9;
  id v10;
  double v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  id v16;
  double v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  id v22;
  double v23;
  uint64_t v24;
  NSNumber *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t *v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;

  if (a3 && *a3)
  {
    v5 = a4;
    if (-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"))
    {
      if (v5)
      {
        -[CLEEDCoexMonitorThermal computeThermalLevelDurationForCA](self, "computeThermalLevelDurationForCA");
        v7 = *a3;
        -[CLEEDCoexThermalForCA thermalNominalDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalNominalDuration");
        LODWORD(v9) = vcvtpd_s64_f64(v8 * 1000.0);
        objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9), CFSTR("thermalNominalDuration"));
        v10 = *a3;
        -[CLEEDCoexThermalForCA thermalLightDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLightDuration");
        LODWORD(v12) = vcvtpd_s64_f64(v11 * 1000.0);
        objc_msgSend(v10, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12), CFSTR("thermalLightDuration"));
        v13 = *a3;
        -[CLEEDCoexThermalForCA thermalModerateDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalModerateDuration");
        LODWORD(v15) = vcvtpd_s64_f64(v14 * 1000.0);
        objc_msgSend(v13, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15), CFSTR("thermalModerateDuration"));
        v16 = *a3;
        -[CLEEDCoexThermalForCA thermalHeavyDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalHeavyDuration");
        LODWORD(v18) = vcvtpd_s64_f64(v17 * 1000.0);
        objc_msgSend(v16, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v18), CFSTR("thermalHeavyDuration"));
        v19 = *a3;
        -[CLEEDCoexThermalForCA thermalTrappingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalTrappingDuration");
        LODWORD(v21) = vcvtpd_s64_f64(v20 * 1000.0);
        objc_msgSend(v19, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v21), CFSTR("thermalTrappingDuration"));
        v22 = *a3;
        -[CLEEDCoexThermalForCA thermalSleepingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalSleepingDuration");
        LODWORD(v24) = vcvtpd_s64_f64(v23 * 1000.0);
        v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24);
        v26 = CFSTR("thermalSleepingDuration");
      }
      else
      {
        v30 = *a3;
        -[CLEEDCoexThermalForCA thermalNominalDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalNominalDuration");
        objc_msgSend(v30, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalNominalDuration"));
        v31 = *a3;
        -[CLEEDCoexThermalForCA thermalLightDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLightDuration");
        objc_msgSend(v31, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalLightDuration"));
        v32 = *a3;
        -[CLEEDCoexThermalForCA thermalModerateDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalModerateDuration");
        objc_msgSend(v32, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalModerateDuration"));
        v33 = *a3;
        -[CLEEDCoexThermalForCA thermalHeavyDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalHeavyDuration");
        objc_msgSend(v33, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalHeavyDuration"));
        v34 = *a3;
        -[CLEEDCoexThermalForCA thermalTrappingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalTrappingDuration");
        objc_msgSend(v34, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalTrappingDuration"));
        v35 = *a3;
        -[CLEEDCoexThermalForCA thermalSleepingDuration](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalSleepingDuration");
        objc_msgSend(v35, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("thermalSleepingDuration"));
        v22 = *a3;
        -[CLEEDCoexThermalForCA currentThermalLevelStartTime](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "currentThermalLevelStartTime");
        v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v26 = CFSTR("currentThermalLevelStartTime");
      }
      objc_msgSend(v22, "setValue:forKey:", v25, v26);
      objc_msgSend(*a3, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexThermalForCA thermalLevelAtStartOfCall](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLevelAtStartOfCall")), CFSTR("thermalLevelAtStartOfCall"));
      objc_msgSend(*a3, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexThermalForCA maxThermalLevelInCall](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "maxThermalLevelInCall")), CFSTR("maxThermalLevelInCall"));
      objc_msgSend(*a3, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDCoexThermalForCA thermalLevelAtEndOfCall](-[CLEEDCoexMonitorThermal fCoexTermalForCA](self, "fCoexTermalForCA"), "thermalLevelAtEndOfCall")), CFSTR("thermalLevelAtEndOfCall"));
      return;
    }
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v28 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v39 = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, nil fCoexTermalForCA", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      LODWORD(v37) = 136446210;
      *(_QWORD *)((char *)&v37 + 4) = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXTH,%{public}s, nil fCoexTermalForCA", &v37, 12, v37);
LABEL_25:
      v36 = (uint8_t *)v29;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]", "%s\n", v29);
      if (v36 != buf)
        free(v36);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_102140790);
    v27 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v39 = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#EED2CXTH,%{public}s, nil metricDict", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_102140790);
      LODWORD(v37) = 136446210;
      *(_QWORD *)((char *)&v37 + 4) = "-[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXTH,%{public}s, nil metricDict", &v37, 12, v37);
      goto LABEL_25;
    }
  }
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_fCoexMetricUpdateCallback = a3;
}

- (CLEEDCoexThermalForCA)fCoexTermalForCA
{
  return self->_fCoexTermalForCA;
}

- (void)setFCoexTermalForCA:(id)a3
{
  self->_fCoexTermalForCA = (CLEEDCoexThermalForCA *)a3;
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 257;
  *(_QWORD *)((char *)self + 36) = 0x32000000018;
  *((_WORD *)self + 22) = 0;
  *((_BYTE *)self + 48) = 1;
  *((_DWORD *)self + 13) = -115;
  *((_QWORD *)self + 7) = 0x4000000000000000;
  *((_QWORD *)self + 8) = 0x3E800000005;
  *((_WORD *)self + 36) = 0;
  *(_QWORD *)((char *)self + 76) = -1;
  *((_WORD *)self + 42) = 257;
  *((_BYTE *)self + 88) = 1;
  *((_WORD *)self + 46) = 257;
  *((_QWORD *)self + 12) = 0x32000000018;
  *((_WORD *)self + 52) = 0;
  *((_WORD *)self + 54) = 0;
  *((_QWORD *)self + 14) = 0x6400000005;
  *((_WORD *)self + 60) = 256;
  *((_WORD *)self + 62) = 0;
  *((_QWORD *)self + 16) = -1;
  *((_WORD *)self + 68) = 257;
  *((_BYTE *)self + 140) = 1;
  *((_WORD *)self + 72) = 0;
  *(_QWORD *)((char *)self + 148) = -1;
  *((_WORD *)self + 78) = 257;
  *((_WORD *)self + 80) = 0;
  *(_QWORD *)((char *)self + 164) = -1;
  *((_WORD *)self + 86) = 257;
  *((_WORD *)self + 88) = 0;
  *(_QWORD *)((char *)self + 180) = -1;
  *((_WORD *)self + 94) = 257;
  return self;
}

@end
