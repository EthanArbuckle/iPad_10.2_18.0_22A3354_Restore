@implementation CLATVAirplayMonitor

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
  if (qword_1023055F8 != -1)
    dispatch_once(&qword_1023055F8, &stru_10215A4A8);
  return (id)qword_1023055F0;
}

- (void)beginService
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[CLATVAirplayMonitor beginServiceWithAirPlaySolo:](self, "beginServiceWithAirPlaySolo:", objc_msgSend(objc_alloc((Class)WPAirPlaySolo), "initWithDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo"), "queue")));
}

- (void)beginServiceWithAirPlaySolo:(id)a3
{
  _QWORD v5[5];

  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[CLATVAirplayMonitor setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  -[CLATVAirplayMonitor setAirplaySolo:](self, "setAirplaySolo:", a3);
  -[CLATVAirplayMonitor setPower:](self, "setPower:", -[WPAirPlaySolo state](-[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"), "state") == (id)3);
  -[CLATVAirplayMonitor setScanDeliveryDelayTimer:](self, "setScanDeliveryDelayTimer:", objc_msgSend(objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo"), "newTimer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008B364C;
  v5[3] = &unk_10212BB58;
  v5[4] = self;
  -[CLTimer setHandler:](-[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"), "setHandler:", v5);
  -[CLATVAirplayMonitor setBufferedDevices:](self, "setBufferedDevices:", +[NSMutableArray array](NSMutableArray, "array"));
}

- (void)endService
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[CLATVAirplayMonitor releaseData](self, "releaseData");
}

- (void)releaseData
{
  -[CLATVAirplayMonitor setClients:](self, "setClients:", 0);
  -[WPAirPlaySolo invalidate](-[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"), "invalidate");
  -[CLATVAirplayMonitor setAirplaySolo:](self, "setAirplaySolo:", 0);
  -[CLTimer invalidate](-[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"), "invalidate");
  -[CLATVAirplayMonitor setScanDeliveryDelayTimer:](self, "setScanDeliveryDelayTimer:", 0);
  -[CLATVAirplayMonitor setBufferedDevices:](self, "setBufferedDevices:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[CLATVAirplayMonitor releaseData](self, "releaseData");
  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayMonitor;
  -[CLATVAirplayMonitor dealloc](&v3, "dealloc");
}

- (void)addClient:(id)a3
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[NSMutableSet addObject:](-[CLATVAirplayMonitor clients](self, "clients"), "addObject:", a3);
}

- (void)removeClient:(id)a3
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLATVAirplayMonitor clients](self, "clients"), "removeObject:", a3);
}

- (void)startMonitoringDevicesForClient:(id)a3
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  -[CLATVAirplayMonitor addClient:](self, "addClient:", a3);
}

- (void)stopMonitoringDevicesForClient:(id)a3
{
  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  if (-[NSMutableSet count](-[CLATVAirplayMonitor clients](self, "clients"), "count") == (id)1)
    -[CLATVAirplayMonitor stopScan](self, "stopScan");
  -[CLATVAirplayMonitor removeClient:](self, "removeClient:", a3);
}

- (void)getPowerWithCompletion:(id)a3
{
  (*((void (**)(id, BOOL))a3 + 2))(a3, -[CLATVAirplayMonitor power](self, "power"));
}

- (CLATVAirplayMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayMonitor;
  return -[CLATVAirplayMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLATVAirplayMonitorServiceProtocol, &OBJC_PROTOCOL___CLATVAirplayMonitorClientProtocol);
}

- (void)withClients:(id)a3
{
  NSMutableSet *clients;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  clients = self->_clients;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(clients);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)startScan
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint8_t *v6;
  _QWORD v7[2];
  uint8_t buf[1640];

  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  if (!-[NSMutableSet count](-[CLATVAirplayMonitor clients](self, "clients"), "count"))
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    v3 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Warning Got a request for a scan but no one is interested. Ignoring", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    LOWORD(v7[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#Warning Got a request for a scan but no one is interested. Ignoring", v7, 2, v7[0]);
LABEL_21:
    v6 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLATVAirplayMonitor startScan]", "%s\n", v4);
    if (v6 != buf)
      free(v6);
    return;
  }
  if (-[CLATVAirplayMonitor power](self, "power"))
  {
    -[WPAirPlaySolo startConnectionlessScanningWithData:](-[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"), "startConnectionlessScanningWithData:", &off_10221FD40);
    -[CLTimer setNextFireTime:](-[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"), "setNextFireTime:", (*(double *)&qword_1023055E8 + j__CFAbsoluteTimeGetCurrent() * 1000.0) / 1000.0);
    return;
  }
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Bluetooth is OFF, ignoring request to scan", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    LOWORD(v7[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Bluetooth is OFF, ignoring request to scan", v7, 2, v7[0]);
    goto LABEL_21;
  }
}

- (void)stopScan
{
  -[WPAirPlaySolo stopConnectionlessScanningWithData:](-[CLATVAirplayMonitor airplaySolo](self, "airplaySolo"), "stopConnectionlessScanningWithData:", &off_10221FD40);
  -[CLTimer setNextFireDelay:](-[CLATVAirplayMonitor scanDeliveryDelayTimer](self, "scanDeliveryDelayTimer"), "setNextFireDelay:", 1.79769313e308);
}

- (void)sendBufferedScanNotifications
{
  id v3;
  _QWORD v4[6];

  objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo");
  if (-[NSMutableArray count](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "count"))
  {
    v3 = -[NSMutableArray copy](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "copy");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1008B3DA4;
    v4[3] = &unk_10215A4D0;
    v4[4] = self;
    v4[5] = v3;
    -[CLATVAirplayMonitor withClients:](self, "withClients:", v4);

    -[NSMutableArray removeAllObjects](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "removeAllObjects");
  }
}

- (void)airPlaySoloDidUpdateState:(id)a3
{
  -[CLATVAirplayMonitor setPower:](self, "setPower:", objc_msgSend(a3, "state") == (id)3);
}

- (void)airPlaySolo:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  _BYTE v25[12];
  __int16 v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    v8 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380931;
      v29 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
      v30 = 2081;
      v31 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found device %{private}s withData: %{private}s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
      v21 = qword_1022A02A8;
      *(_DWORD *)v25 = 136380931;
      *(_QWORD *)&v25[4] = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
      v26 = 2081;
      v27 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v21, 2, "Found device %{private}s withData: %{private}s", v25, 22);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
  if (a4)
  {
    v9 = objc_msgSend(a5, "objectForKeyedSubscript:", WPPuckTypeAirPlaySoloAdvertisingData);
    if (v9 && (v10 = v9, objc_msgSend(v9, "length")))
    {
      if ((unint64_t)objc_msgSend(v10, "length") > 5)
      {
        v16 = *(unsigned int *)((char *)objc_msgSend(v10, "bytes") + 2);
        v17 = objc_msgSend(a5, "objectForKeyedSubscript:", WPPuckTypeAirPlaySoloRSSI);
        if (v17)
          v18 = objc_msgSend(v17, "intValue");
        else
          v18 = 0;
        v19 = objc_msgSend(a5, "objectForKeyedSubscript:", WPPuckTypeAirPlaySoloAdvertisingChannel);
        if (v19)
          v20 = (uint64_t)objc_msgSend(v19, "intValue");
        else
          v20 = 0xFFFFFFFFLL;
        -[NSMutableArray addObject:](-[CLATVAirplayMonitor bufferedDevices](self, "bufferedDevices"), "addObject:", -[CLATVAirplayDevice initWithTimestamp:RSSI:uuid:ipv4:channel:]([CLATVAirplayDevice alloc], "initWithTimestamp:RSSI:uuid:ipv4:channel:", v18, a4, v16, v20, j__CFAbsoluteTimeGetCurrent()));
      }
      else
      {
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
        v11 = qword_1022A02A8;
        if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Not enough data provided for advertisement data. Ignoring", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A02A0 != -1)
            dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
          *(_WORD *)v25 = 0;
          LODWORD(v24) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Not enough data provided for advertisement data. Ignoring", v25, v24, *(_QWORD *)v25);
LABEL_35:
          v15 = (uint8_t *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v12);
          if (v15 != buf)
            free(v15);
        }
      }
    }
    else
    {
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
      v13 = qword_1022A02A8;
      if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "No IP address provided. Ignoring device", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
        *(_WORD *)v25 = 0;
        LODWORD(v24) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "No IP address provided. Ignoring device", v25, v24, *(_QWORD *)v25);
        goto LABEL_35;
      }
    }
  }
  else
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    v14 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Found a device but its UUID is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
      *(_WORD *)v25 = 0;
      LODWORD(v24) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Found a device but its UUID is nil", v25, v24, *(_QWORD *)v25);
      goto LABEL_35;
    }
  }
}

- (void)airPlaySoloStartedScanning:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
  v3 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo started scanning", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "AirPlaySolo started scanning", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySoloStartedScanning:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)airPlaySoloStoppedScanning:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
  v3 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo stopped scanning", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "AirPlaySolo stopped scanning", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySoloStoppedScanning:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)airPlaySolo:(id)a3 failedToStartScanningWithError:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = objc_msgSend(a4, "description");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to start AirPlaySolo scanning. %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10215A4F0);
    v6 = qword_1022A02A8;
    v9 = 138543362;
    v10 = objc_msgSend(a4, "description");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 17, "Failed to start AirPlaySolo scanning. %{public}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 0, "-[CLATVAirplayMonitor airPlaySolo:failedToStartScanningWithError:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (WPAirPlaySolo)airplaySolo
{
  return self->_airplaySolo;
}

- (void)setAirplaySolo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)power
{
  return self->_power;
}

- (void)setPower:(BOOL)a3
{
  self->_power = a3;
}

- (CLTimer)scanDeliveryDelayTimer
{
  return self->_scanDeliveryDelayTimer;
}

- (void)setScanDeliveryDelayTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)bufferedDevices
{
  return self->_bufferedDevices;
}

- (void)setBufferedDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
