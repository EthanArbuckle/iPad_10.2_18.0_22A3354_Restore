@implementation CLDurianSystemMonitor

- (CLDurianSystemMonitor)init
{
  -[CLDurianSystemMonitor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianSystemMonitor)initWithUniverse:(id)a3
{
  CLDurianSystemMonitor *v4;
  CLDurianSystemMonitor *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLDurianSystemMonitor;
  v4 = -[CLDurianSystemMonitor init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    -[CLDurianSystemMonitor setUniverse:](v4, "setUniverse:", a3);
    v5->_vehicleStateProxy = 0;
    -[CLDurianSystemMonitor _registerForNotifications](v5, "_registerForNotifications");
    v6 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1014D6CDC;
    block[3] = &unk_10212BB58;
    block[4] = v5;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    -[CLDurianSystemMonitor fetchLOIVisitAtStart](v5, "fetchLOIVisitAtStart");
    -[CLDurianSystemMonitor setValid:](v5, "setValid:", 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDurianSystemMonitor _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CLDurianSystemMonitor;
  -[CLDurianSystemMonitor dealloc](&v3, "dealloc");
}

- (int)coexImpactState
{
  return self->_isCoexImpacted;
}

- (void)_recomputeCoexImpactedStateAndNotifyClients
{
  int isCoexImpacted;
  NSObject *v4;
  int v5;
  _BOOL4 btStreaming;
  _BOOL4 wifiNetworkCritical;
  _BOOL4 isAssociatedTo2GHzWiFi;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;

  isCoexImpacted = self->_isCoexImpacted;
  self->_isCoexImpacted = self->_btStreaming | (2 * self->_wifiNetworkCritical) | (4 * self->_isAssociatedTo2GHzWiFi);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC018);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self->_isCoexImpacted;
    btStreaming = self->_btStreaming;
    wifiNetworkCritical = self->_wifiNetworkCritical;
    isAssociatedTo2GHzWiFi = self->_isAssociatedTo2GHzWiFi;
    v9[0] = 68290306;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v5;
    v14 = 1026;
    v15 = btStreaming;
    v16 = 1026;
    v17 = wifiNetworkCritical;
    v18 = 1026;
    v19 = isAssociatedTo2GHzWiFi;
    v20 = 1026;
    v21 = isCoexImpacted;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system coex\", \"state\":%{public}d, \"btaudio\":%{public}d, \"wifiNetworkCritical\":%{public}d, \"isAssociatedTo2GHzWiFi\":%{public}d, \"prior\":%{public}d}", (uint8_t *)v9, 0x30u);
  }
  if (isCoexImpacted != self->_isCoexImpacted)
    -[CLDurianSystemMonitorDelegate systemCoexImpact:toState:](-[CLDurianSystemMonitor delegate](self, "delegate"), "systemCoexImpact:toState:", self, self->_isCoexImpacted);
}

- (void)_checkAudioStreamState
{
  NSObject *v3;
  NSObject *v4;
  uint64_t state64;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  state64 = 42;
  if (notify_get_state(self->_audioStreamNotificationToken, &state64))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system failed to get audio stream state\"}", buf, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
    }
    v4 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system failed to get audio stream state", "{\"msg%{public}.0s\":\"#durian #system failed to get audio stream state\"}", buf, 0x12u);
    }
  }
  else
  {
    if (state64 <= 1)
      self->_btStreaming = state64;
    -[CLDurianSystemMonitor _recomputeCoexImpactedStateAndNotifyClients](self, "_recomputeCoexImpactedStateAndNotifyClients");
  }
}

- (void)_registerForNotifications
{
  -[CLDurianSystemMonitor universe](self, "universe");
  sub_100647FA8();
}

- (void)_unregisterForNotifications
{
  Client *value;

  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 2);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 6);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 16);
  objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 13);
  objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 6);
  CFRelease(self->_wifiManager);
  self->_wifiManager = 0;
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineMonitor, "stopLeechingVisitsForClient:", self);
  -[CLDurianSystemMonitor unregisterForVehicleStateNotification](self, "unregisterForVehicleStateNotification");
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 4);
    objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 5);
    objc_msgSend(*((id *)self->_bluetoothServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_bluetoothServiceClient.__ptr_.__value_ + 1), 11);
  }
}

- (void)_onDaemonStatusNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  switch(a3)
  {
    case 16:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
      v7 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 68289026;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system metricheartbeat\"}", (uint8_t *)&v13, 0x12u);
      }
      objc_msgSend(objc_msgSend(a1, "delegate"), "systemMetricHeartbeat");
      break;
    case 6:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
      v9 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(a4 + 4);
        v13 = 68289282;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 1026;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system\", \"reach\":%{public}d}", (uint8_t *)&v13, 0x18u);
      }
      objc_msgSend(objc_msgSend(a1, "delegate"), "systemConnectivity:isConnected:", a1, *(_DWORD *)(a4 + 4) != 0);
      break;
    case 2:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 68289026;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system will sleep\"}", (uint8_t *)&v13, 0x12u);
      }
      objc_msgSend(objc_msgSend(a1, "delegate"), "systemWillSleep:", a1);
      break;
    default:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
      {
        v13 = 68289282;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 1026;
        v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system unexpected status\", \"notification\":%{public}d}", (uint8_t *)&v13, 0x18u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC018);
      }
      v12 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v13 = 68289282;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 1026;
        v18 = a3;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system unexpected status", "{\"msg%{public}.0s\":\"#durian #system unexpected status\", \"notification\":%{public}d}", (uint8_t *)&v13, 0x18u);
      }
      break;
  }
}

- (void)_onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  int v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (a3 == 6)
  {
    v7 = *(_BYTE *)(a4 + 96) && (v6 = *(_DWORD *)(a4 + 48), v6 >= 1) && sub_1000AFA5C(v6);
    a1[56] = v7;
    goto LABEL_17;
  }
  if (a3 == 13)
  {
    a1[49] = *(_BYTE *)(a4 + 139);
LABEL_17:
    objc_msgSend(a1, "_recomputeCoexImpactedStateAndNotifyClients");
    return;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC018);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v10 = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #system unexpected wifi\", \"notification\":%{public}d}", (uint8_t *)&v10, 0x18u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
  }
  v9 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v10 = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #system unexpected wifi", "{\"msg%{public}.0s\":\"#durian #system unexpected wifi\", \"notification\":%{public}d}", (uint8_t *)&v10, 0x18u);
  }
}

- (void)_onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4
{
  _QWORD *v5;
  NSString *v6;
  NSObject *v7;
  id v8;
  NSString *v9;
  uint64_t v10;
  _QWORD *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  _WORD v17[8];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;

  if (a3 == 11 || a3 == 5)
  {
    v11 = (_QWORD *)(a4 + 16);
    if (*(char *)(a4 + 39) < 0)
      v11 = (_QWORD *)*v11;
    v12 = -[NSString stringByReplacingOccurrencesOfString:withString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11), "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1021D8FB8);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system received bluetooth disconnect event\", \"deviceAddress\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v8 = objc_msgSend(a1, "delegate");
    v9 = v12;
    v10 = 2;
    goto LABEL_18;
  }
  if (a3 == 4)
  {
    v5 = (_QWORD *)(a4 + 16);
    if (*(char *)(a4 + 39) < 0)
      v5 = (_QWORD *)*v5;
    v6 = -[NSString stringByReplacingOccurrencesOfString:withString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5), "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1021D8FB8);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system received bluetooth connect event\", \"deviceAddress\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v8 = objc_msgSend(a1, "delegate");
    v9 = v6;
    v10 = 1;
LABEL_18:
    objc_msgSend(v8, "updateDeviceConnectionState:state:", v9, v10);
    return;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC018);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#durian #system, received unhandled bluetooth service notification", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
    v17[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 16, "#durian #system, received unhandled bluetooth service notification", v17, 2);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 0, "-[CLDurianSystemMonitor _onBluetoothServiceNotification:data:]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  unsigned int v12;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC018);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289538;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType");
    v11 = 1026;
    v12 = objc_msgSend(a3, "hasDepartureDate") ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #system visit\", \"loitype\":%{public}ld, \"entry\":%{public}hhd}", (uint8_t *)v6, 0x22u);
  }
  -[CLDurianSystemMonitorDelegate updateSystemLoiType:isEntry:](-[CLDurianSystemMonitor delegate](self, "delegate"), "updateSystemLoiType:isEntry:", objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType"), objc_msgSend(a3, "hasDepartureDate") ^ 1);
}

- (void)fetchLOIVisitAtStart
{
  id v3;
  id v4;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  _QWORD v6[5];

  v3 = objc_alloc((Class)RTStoredVisitFetchOptions);
  v4 = objc_msgSend(v3, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh), 0, 1, &off_10221DD78);
  routineMonitor = self->_routineMonitor;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1014D8134;
  v6[3] = &unk_10212BB80;
  v6[4] = self;
  -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:](routineMonitor, "fetchStoredVisitsWithOptions:withReply:", v4, v6);

}

- (id)_onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  char v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  if (a3 == 1)
  {
    v4 = BYTE4(a4);
    v5 = result;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC018);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      v11 = v4 & 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#durian received keybag unlock notification state:%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC018);
      v9[0] = 67174657;
      v9[1] = v4 & 1;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 2, "#durian received keybag unlock notification state:%{private}d", v9, 8);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLDurianSystemMonitor _onDataProtectionNotification:data:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    return objc_msgSend(objc_msgSend(v5, "delegate"), "onFirstUnlock");
  }
  return result;
}

- (void)registerForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *v3;
  _QWORD handler[5];

  if (objc_msgSend(-[CLIntersiloUniverse vendor](-[CLDurianSystemMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLVehicleStateNotifier"))&& !self->_vehicleStateProxy)
  {
    v3 = (CLVehicleStateNotifierProtocol *)objc_msgSend(-[CLIntersiloUniverse vendor](-[CLDurianSystemMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVehicleStateNotifier"));
    self->_vehicleStateProxy = v3;
    -[CLVehicleStateNotifierProtocol registerDelegate:inSilo:](v3, "registerDelegate:inSilo:", self, -[CLIntersiloUniverse silo](self->_universe, "silo"));
    -[CLVehicleStateNotifierProtocol setDelegateEntityName:](self->_vehicleStateProxy, "setDelegateEntityName:", "CLDurianSystemMonitor");
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1014D8750;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(kCMVehicularStateChangedNotification, "UTF8String"), &self->_vehicularToken, (dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](-[CLDurianSystemMonitor universe](self, "universe"), "silo"), "queue"), handler);
}

- (void)unregisterForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;

  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)onVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;
  _QWORD v3[6];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  vehicleStateProxy = self->_vehicleStateProxy;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1014D8860;
  v3[3] = &unk_1021BBFF8;
  v3[4] = self;
  v3[5] = v4;
  -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsAndOperatorStateWithReply:](vehicleStateProxy, "fetchVehicularDndStateAndHintsAndOperatorStateWithReply:", v3);
  _Block_object_dispose(v4, 8);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLDurianSystemMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianSystemMonitorDelegate *)a3;
}

- (CLIntersiloUniverse)universe
{
  return (CLIntersiloUniverse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUniverse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;

  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
