@implementation CLEEDCoexMonitor

- (CLEEDCoexMonitor)initWithUniverse:(id)a3 initialMitigation:(id)a4 mitigationConfig:(MitigationsConfig *)a5 activeSim:(int)a6 Rat:(int)a7 wifiEmergency:(BOOL)a8 cachedCoexMetricData:(id)a9 mitigationCB:(id)a10 coexMetricUpdateCB:(id)a11
{
  NSObject *v14;
  _BYTE *v15;
  CLEEDCoexMonitor *v16;
  CLEEDMitigation *v17;
  id *p_currentMitigation;
  CLEEDCoexMonitorThermal *v19;
  id v20;
  MitigationParams light;
  MitigationParams heavyAndGreater;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CLEEDCoexMonitorThermal *v26;
  id *p_thermal;
  CLEEDCoexMonitorPower *v28;
  id v29;
  MitigationParams v30;
  MitigationParams v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CLEEDCoexMonitorPower *v35;
  CLEEDCoexMonitorCellular *v36;
  MitigationParams v37;
  MitigationParams v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CLEEDCoexMonitorCellular *v42;
  NSObject *v43;
  id fMitigationCallback;
  id fCoexMetricUpdateCallback;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v50;
  id *v51;
  char *v52;
  char *v53;
  const char *v54;
  uint8_t *v55;
  const char *v56;
  uint8_t *v57;
  const char *v58;
  uint8_t *v59;
  const char *v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL4 v66;
  _OWORD v68[10];
  _OWORD v69[10];
  _OWORD v70[10];
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  objc_super v75;
  id location[2];
  char v77;
  _BYTE __p[12];
  __int16 v79;
  id v80;
  __int16 v81;
  id *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  _BYTE *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;

  v66 = a8;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10215EC00);
  v14 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    sub_10091EF54((unsigned __int8 *)a5, __p);
    v15 = v81 >= 0 ? __p : *(_BYTE **)__p;
    *(_DWORD *)buf = 136447234;
    v88 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexM"
          "etricData:mitigationCB:coexMetricUpdateCB:]";
    v89 = 2114;
    v90 = a3;
    v91 = 2082;
    v92 = v15;
    v93 = 2114;
    v94 = a10;
    v95 = 2114;
    v96 = a11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s[universe:%{public}@,config:%{public}s,mitigationCB:%{public}@,coexMetricUpdateCB:%{public}@]", buf, 0x34u);
    if (SHIBYTE(v81) < 0)
      operator delete(*(void **)__p);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v50 = qword_1022A0088;
    sub_10091EF54((unsigned __int8 *)a5, location);
    if (v77 >= 0)
      v51 = location;
    else
      v51 = (id *)location[0];
    *(_DWORD *)__p = 136447234;
    *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmerge"
                         "ncy:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
    v79 = 2114;
    v80 = a3;
    v81 = 2082;
    v82 = v51;
    v83 = 2114;
    v84 = a10;
    v85 = 2114;
    v86 = a11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v50, 0, "#EED2CXMN,%{public}s[universe:%{public}@,config:%{public}s,mitigationCB:%{public}@,coexMetricUpdateCB:%{public}@]", __p, 52);
    v53 = v52;
    if (v77 < 0)
      operator delete(location[0]);
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v53);
    if (v53 != (char *)buf)
      free(v53);
  }
  v75.receiver = self;
  v75.super_class = (Class)CLEEDCoexMonitor;
  v16 = -[CLEEDCoexMonitor init](&v75, "init");
  if (v16)
  {
    v16->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(objc_msgSend(a3, "silo"), "queue"));
    v16->fMitigationCallback = _Block_copy(a10);
    v16->_fCoexMetricUpdateCallback = _Block_copy(a11);
    v16->fInitialMitigationsReceived = 0;
    if (a4)
      v17 = (CLEEDMitigation *)objc_msgSend(objc_alloc((Class)CLEEDMitigation), "initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:", objc_msgSend(a4, "newStreamingAllowed"), objc_msgSend(a4, "streamingFPS"), objc_msgSend(a4, "streamingBitrate"), objc_msgSend(a4, "dropStreaming"), objc_msgSend(a4, "newUploadAllowed"), objc_msgSend(a4, "uploadMigitation"), objc_msgSend(a4, "source"));
    else
      v17 = (CLEEDMitigation *)objc_alloc_init((Class)CLEEDMitigation);
    v16->_currentMitigation = v17;
    p_currentMitigation = (id *)&v16->_currentMitigation;
    if (v17)
    {
      objc_initWeak(location, v16);
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10091F1E0;
      v73[3] = &unk_10215EBE0;
      objc_copyWeak(&v74, location);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_10091F3CC;
      v71[3] = &unk_10213D3A8;
      objc_copyWeak(&v72, location);
      v19 = [CLEEDCoexMonitorThermal alloc];
      v20 = objc_msgSend(-[CLIntersiloUniverse silo](v16->fUniverse, "silo"), "queue");
      light = a5->peakPower.light;
      v70[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
      v70[7] = light;
      heavyAndGreater = a5->peakPower.heavyAndGreater;
      v70[8] = a5->peakPower.moderate;
      v70[9] = heavyAndGreater;
      v23 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
      v70[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
      v70[3] = v23;
      v24 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
      v70[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
      v70[5] = v24;
      v25 = *(_OWORD *)&a5->cellular.enabled;
      v70[0] = a5->nominal;
      v70[1] = v25;
      v26 = -[CLEEDCoexMonitorThermal initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:](v19, "initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:", v20, v70, a9, v73, v71);
      v16->_thermal = v26;
      p_thermal = (id *)&v16->_thermal;
      if (v26)
      {
        v28 = [CLEEDCoexMonitorPower alloc];
        v29 = objc_msgSend(-[CLIntersiloUniverse silo](v16->fUniverse, "silo"), "queue");
        v30 = a5->peakPower.light;
        v69[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
        v69[7] = v30;
        v31 = a5->peakPower.heavyAndGreater;
        v69[8] = a5->peakPower.moderate;
        v69[9] = v31;
        v32 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
        v69[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
        v69[3] = v32;
        v33 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
        v69[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
        v69[5] = v33;
        v34 = *(_OWORD *)&a5->cellular.enabled;
        v69[0] = a5->nominal;
        v69[1] = v34;
        v35 = -[CLEEDCoexMonitorPower initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:](v28, "initWithQueue:mitigationConfig:cachedCoexMetricData:eventCB:coexMetricUpdateCB:", v29, v69, a9, v73, v71);
        v16->_power = v35;
        if (v35)
        {
          v36 = [CLEEDCoexMonitorCellular alloc];
          v37 = a5->peakPower.light;
          v68[6] = *(_OWORD *)&a5->thermal.heavyAndGreater.maxFramerateFps;
          v68[7] = v37;
          v38 = a5->peakPower.heavyAndGreater;
          v68[8] = a5->peakPower.moderate;
          v68[9] = v38;
          v39 = *(_OWORD *)&a5->cellular.belowThresholdParams.maxStreamingBitrateKbps;
          v68[2] = *(_OWORD *)&a5->cellular.rsrpSamplesToAvg;
          v68[3] = v39;
          v40 = *(_OWORD *)&a5->thermal.moderate.maxFramerateFps;
          v68[4] = *(_OWORD *)&a5->thermal.light.maxFramerateFps;
          v68[5] = v40;
          v41 = *(_OWORD *)&a5->cellular.enabled;
          v68[0] = a5->nominal;
          v68[1] = v41;
          v42 = -[CLEEDCoexMonitorCellular initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:](v36, "initWithUniverse:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:eventCB:coexMetricUpdateCB:", a3, v68, a6, a7, v66, a9, v73, v71);
          v16->_cellular = v42;
          if (v42)
          {
            objc_destroyWeak(&v72);
            objc_destroyWeak(&v74);
            objc_destroyWeak(location);
            return v16;
          }
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10215EC00);
          v48 = qword_1022A0088;
          if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v88 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cac"
                  "hedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating cellular monitor", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0080 != -1)
              dispatch_once(&qword_1022A0080, &stru_10215EC00);
            *(_DWORD *)__p = 136446210;
            *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wi"
                                 "fiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            LODWORD(v63) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s failure while creating cellular monitor", __p, v63);
            v61 = (uint8_t *)v60;
            sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v60);
            if (v61 != buf)
              free(v61);
          }

          p_thermal = (id *)&v16->_power;
        }
        else
        {
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10215EC00);
          v47 = qword_1022A0088;
          if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v88 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cac"
                  "hedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating peak pressure monitor", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0080 != -1)
              dispatch_once(&qword_1022A0080, &stru_10215EC00);
            *(_DWORD *)__p = 136446210;
            *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wi"
                                 "fiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
            LODWORD(v62) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s failure while creating peak pressure monitor", __p, v62);
            v59 = (uint8_t *)v58;
            sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v58);
            if (v59 != buf)
              free(v59);
          }

        }
      }
      else
      {
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10215EC00);
        v46 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v88 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cache"
                "dCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating thermal monitor", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10215EC00);
          *(_DWORD *)__p = 136446210;
          *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifi"
                               "Emergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
          LODWORD(v62) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s failure while creating thermal monitor", __p, v62);
          v57 = (uint8_t *)v56;
          sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v56);
          if (v57 != buf)
            free(v57);
        }
        p_thermal = (id *)&v16->_currentMitigation;
      }

      objc_destroyWeak(&v72);
      objc_destroyWeak(&v74);
      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v43 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v88 = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedC"
              "oexMetricData:mitigationCB:coexMetricUpdateCB:]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s failure while creating current mitigation", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10215EC00);
        *(_DWORD *)__p = 136446210;
        *(_QWORD *)&__p[4] = "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEm"
                             "ergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]";
        LODWORD(v62) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s failure while creating current mitigation", __p, v62);
        v55 = (uint8_t *)v54;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor initWithUniverse:initialMitigation:mitigationConfig:activeSim:Rat:wifiEmergency:cachedCoexMetricData:mitigationCB:coexMetricUpdateCB:]", "%s\n", v54);
        if (v55 != buf)
          free(v55);
      }
      fMitigationCallback = v16->fMitigationCallback;
      if (fMitigationCallback)
        _Block_release(fMitigationCallback);
      fCoexMetricUpdateCallback = v16->_fCoexMetricUpdateCallback;
      if (fCoexMetricUpdateCallback)
        _Block_release(fCoexMetricUpdateCallback);
      v16->fUniverse = 0;
    }
    return 0;
  }
  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  id fMitigationCallback;
  id fCoexMetricUpdateCallback;
  const char *v6;
  uint8_t *v7;
  objc_super v8;
  int v9;
  const char *v10;
  uint8_t buf[4];
  const char *v12;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10215EC00);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[CLEEDCoexMonitor dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2CXMN,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v9 = 136446210;
    v10 = "-[CLEEDCoexMonitor dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2CXMN,%{public}s", &v9, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor dealloc]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fMitigationCallback = self->fMitigationCallback;
  if (fMitigationCallback)
  {
    _Block_release(fMitigationCallback);
    self->fMitigationCallback = 0;
  }
  fCoexMetricUpdateCallback = self->_fCoexMetricUpdateCallback;
  if (fCoexMetricUpdateCallback)
  {
    _Block_release(fCoexMetricUpdateCallback);
    self->_fCoexMetricUpdateCallback = 0;
  }

  self->_currentMitigation = 0;
  self->_cellular = 0;

  self->_thermal = 0;
  self->_power = 0;
  self->fUniverse = 0;
  v8.receiver = self;
  v8.super_class = (Class)CLEEDCoexMonitor;
  -[CLEEDCoexMonitor dealloc](&v8, "dealloc");
}

- (void)processIncomingMitigation:(id)a3
{
  id v5;
  BOOL *p_fInitialNotifCellular;
  unsigned __int8 v7;
  NSObject *v8;
  CLEEDMitigation *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  _BOOL4 fInitialNotifPower;
  _BOOL4 fInitialNotifCellular;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  CLEEDMitigation *v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;

  if (!a3)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v10 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v38 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, mitigation nil", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v29 = 136446210;
      v30 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s, mitigation nil", &v29, 12);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    return;
  }
  v5 = objc_msgSend(a3, "source");
  if (v5 == (id)4)
  {
    p_fInitialNotifCellular = &self->fInitialNotifCellular;
    if (!self->fInitialNotifCellular)
      goto LABEL_6;
  }
  else
  {
    if (v5 != (id)3)
    {
      if (v5 != (id)2)
        goto LABEL_7;
      p_fInitialNotifCellular = &self->fInitialNotifThermal;
      if (self->fInitialNotifThermal)
        goto LABEL_7;
      goto LABEL_6;
    }
    p_fInitialNotifCellular = &self->fInitialNotifPower;
    if (!self->fInitialNotifPower)
LABEL_6:
      *p_fInitialNotifCellular = 1;
  }
LABEL_7:
  v7 = -[CLEEDMitigation updateWorseMitigationsFrom:](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "updateWorseMitigationsFrom:", a3);
  if (!self->fInitialMitigationsReceived || (v7 & 1) == 0)
  {
    if (self->fInitialMitigationsReceived
      || !self->fInitialNotifPower
      || !self->fInitialNotifThermal
      || !self->fInitialNotifCellular)
    {
      return;
    }
    self->fInitialMitigationsReceived = 1;
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v13 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "received";
      if (self->fInitialNotifThermal)
        v15 = "received";
      else
        v15 = "nil";
      fInitialNotifPower = self->fInitialNotifPower;
      v38 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      fInitialNotifCellular = self->fInitialNotifCellular;
      if (fInitialNotifPower)
        v18 = "received";
      else
        v18 = "nil";
      *(_DWORD *)buf = 136446978;
      v39 = 2082;
      if (!fInitialNotifCellular)
        v14 = "nil";
      v40 = (void *)v15;
      v41 = 2082;
      v42 = v18;
      v43 = 2082;
      v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, Received initial mitigations, Thermal:%{public}s, Power:%{public}s, Cellular:%{public}s", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v19 = "received";
      if (self->fInitialNotifThermal)
        v20 = "received";
      else
        v20 = "nil";
      if (self->fInitialNotifPower)
        v21 = "received";
      else
        v21 = "nil";
      if (!self->fInitialNotifCellular)
        v19 = "nil";
      v29 = 136446978;
      v30 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      v31 = 2082;
      v32 = (void *)v20;
      v33 = 2082;
      v34 = v21;
      v35 = 2082;
      v36 = v19;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXMN,%{public}s, Received initial mitigations, Thermal:%{public}s, Power:%{public}s, Cellular:%{public}s", &v29, 42);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
  if (self->fMitigationCallback)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v8 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[CLEEDCoexMonitor currentMitigation](self, "currentMitigation");
      *(_DWORD *)buf = 136446466;
      v38 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      v39 = 2114;
      v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, SendMitigation:%{public}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v24 = qword_1022A0088;
      v25 = -[CLEEDCoexMonitor currentMitigation](self, "currentMitigation");
      v29 = 136446466;
      v30 = "-[CLEEDCoexMonitor processIncomingMitigation:]";
      v31 = 2114;
      v32 = v25;
      LODWORD(v28) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 0, "#EED2CXMN,%{public}s, SendMitigation:%{public}@", &v29, v28);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor processIncomingMitigation:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    (*((void (**)(id, CLEEDMitigation *, _QWORD))self->fMitigationCallback + 2))(self->fMitigationCallback, -[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), 0);
  }
}

- (void)handleVlqmForActiveCall:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[CLEEDCoexMonitor cellular](self, "cellular"))
    -[CLEEDCoexMonitorCellular handleVlqmForActiveCall:](-[CLEEDCoexMonitor cellular](self, "cellular"), "handleVlqmForActiveCall:", v3);
}

- (void)handleReachability:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[CLEEDCoexMonitor cellular](self, "cellular"))
    -[CLEEDCoexMonitorCellular handleReachability:](-[CLEEDCoexMonitor cellular](self, "cellular"), "handleReachability:", v3);
}

- (void)handleUpdatesToSim:(int)a3 Rat:(int)a4 WifiEmergency:(BOOL)a5 bandInfo:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  if (-[CLEEDCoexMonitor cellular](self, "cellular"))
    -[CLEEDCoexMonitorCellular handleUpdatesToSim:Rat:WifiEmergency:bandInfo:](-[CLEEDCoexMonitor cellular](self, "cellular"), "handleUpdatesToSim:Rat:WifiEmergency:bandInfo:", v9, v8, v7, v6);
}

- (id)createCoexMetricDictForCASubmission:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  id v28;

  v3 = a3;
  v16 = objc_alloc_init((Class)NSMutableDictionary);
  if (v16)
  {
    if (-[CLEEDCoexMonitor thermal](self, "thermal"))
      -[CLEEDCoexMonitorThermal updateCoexMetricDict:forCASubmission:](-[CLEEDCoexMonitor thermal](self, "thermal"), "updateCoexMetricDict:forCASubmission:", &v16, v3);
    if (-[CLEEDCoexMonitor power](self, "power"))
      -[CLEEDCoexMonitorPower updateCoexMetricDict:forCASubmission:](-[CLEEDCoexMonitor power](self, "power"), "updateCoexMetricDict:forCASubmission:", &v16, v3);
    if (-[CLEEDCoexMonitor cellular](self, "cellular"))
      -[CLEEDCoexMonitorCellular updateCoexMetricDict:forCASubmission:](-[CLEEDCoexMonitor cellular](self, "cellular"), "updateCoexMetricDict:forCASubmission:", &v16, v3);
    if (-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"))
    {
      objc_msgSend(v16, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLEEDMitigation source](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "source")), CFSTR("mitigationSource"));
      objc_msgSend(v16, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLEEDMitigation newUploadAllowed](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "newUploadAllowed") ^ 1), CFSTR("uploadsDisallowed"));
      objc_msgSend(v16, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLEEDMitigation uploadMigitation](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "uploadMigitation") == (id)1), CFSTR("uploadsDelayed"));
      objc_msgSend(v16, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLEEDMitigation newStreamingAllowed](-[CLEEDCoexMonitor currentMitigation](self, "currentMitigation"), "newStreamingAllowed") ^ 1), CFSTR("streamingDisallowed"));
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v7 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, self.currentMitigation nil", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10215EC00);
        v17 = 136446210;
        v18 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s, self.currentMitigation nil", &v17, 12);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v8 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      v25 = 1024;
      v26 = v3;
      v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, caSubmission:%d, coexMetricDict:%@", buf, 0x1Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v17 = 136446722;
      v18 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      v19 = 1024;
      v20 = v3;
      v21 = 2112;
      v22 = v16;
      LODWORD(v15) = 28;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXMN,%{public}s, caSubmission:%d, coexMetricDict:%@", &v17, v15);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    return v16;
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, coexMetricDict nil", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v17 = 136446210;
      v18 = "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s, coexMetricDict nil", &v17, 12);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor createCoexMetricDictForCASubmission:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    return 0;
  }
}

- (void)submitCoexMetricToCAWithBatteryLevelAtCallStart:(int)a3 batteryLevelAtCallEnd:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  double v13;
  uint8_t *v14;
  uint8_t *v15;
  NSObject *v16;
  double v17;
  uint8_t *v18;
  _QWORD v19[5];
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = -[CLEEDCoexMonitor createCoexMetricDictForCASubmission:](self, "createCoexMetricDictForCASubmission:", 1);
  if (v6)
  {
    v7 = v6;
    v8 = v6;
    objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), CFSTR("batteryLevelAtStartOfCall"));
    objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4), CFSTR("batteryLevelAtEndOfCall"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1009208C4;
    v19[3] = &unk_102132010;
    v19[4] = v7;
    v9 = AnalyticsSendEventLazy(CFSTR("com.apple.locationd.eed.coex.mitigation"), v19);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v10 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "NO";
      v27 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      *(_DWORD *)buf = 136446723;
      if (v9)
        v11 = "YES";
      v28 = 2082;
      v29 = v11;
      v30 = 2113;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#EED2CXMN,%{public}s, eventSent:%{public}s, eventDict:%{private}@", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v12 = "NO";
      v20 = 136446723;
      v21 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      if (v9)
        v12 = "YES";
      v22 = 2082;
      v23 = v12;
      v24 = 2113;
      v25 = v7;
      v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2CXMN,%{public}s, eventSent:%{public}s, eventDict:%{private}@", &v20, 32);
      v15 = v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]", "%s\n", v13);
LABEL_23:
      if (v15 != buf)
        free(v15);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10215EC00);
    v16 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#EED2CXMN,%{public}s, coexMetricDict nil", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10215EC00);
      v20 = 136446210;
      v21 = "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]";
      v17 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2CXMN,%{public}s, coexMetricDict nil", &v20, 12);
      v15 = v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDCoexMonitor submitCoexMetricToCAWithBatteryLevelAtCallStart:batteryLevelAtCallEnd:]", "%s\n", v17);
      goto LABEL_23;
    }
  }
}

- (CLEEDMitigation)currentMitigation
{
  return self->_currentMitigation;
}

- (void)setCurrentMitigation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CLEEDCoexMonitorCellular)cellular
{
  return self->_cellular;
}

- (CLEEDCoexMonitorThermal)thermal
{
  return self->_thermal;
}

- (CLEEDCoexMonitorPower)power
{
  return self->_power;
}

- (id)fCoexMetricUpdateCallback
{
  return self->_fCoexMetricUpdateCallback;
}

- (void)setFCoexMetricUpdateCallback:(id)a3
{
  self->_fCoexMetricUpdateCallback = a3;
}

@end
