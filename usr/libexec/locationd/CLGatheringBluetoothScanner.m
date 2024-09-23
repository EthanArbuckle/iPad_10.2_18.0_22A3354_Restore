@implementation CLGatheringBluetoothScanner

- (CLGatheringBluetoothScanner)initWithQueue:(id)a3 withSettings:(id)a4 withPolicy:(BOOL)a5
{
  CLGatheringBluetoothScanner *v8;
  CLGatheringBluetoothScanner *v9;
  CBDiscovery *discovery;
  CBDiscovery *leechNearbyInfoV2Discovery;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[6];
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLGatheringBluetoothScanner;
  v8 = -[CLGatheringBluetoothScanner init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    -[CLGatheringBluetoothScanner setQueue:](v8, "setQueue:", a3);
    -[CLGatheringBluetoothScanner setSettings:](v9, "setSettings:", a4);
    v9->_discovery = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    -[CBDiscovery setDispatchQueue:](v9->_discovery, "setDispatchQueue:", -[CLGatheringBluetoothScanner queue](v9, "queue"));
    -[CBDiscovery setLabel:](v9->_discovery, "setLabel:", CFSTR("CLGathering"));
    -[CBDiscovery setBleRSSIThresholdHint:](v9->_discovery, "setBleRSSIThresholdHint:", 4294967216);
    -[CBDiscovery setBleScanRate:](v9->_discovery, "setBleScanRate:", 10);
    -[CBDiscovery setBleScanRateScreenOff:](v9->_discovery, "setBleScanRateScreenOff:", 20);
    v9->_leechNearbyInfoV2Discovery = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    -[CBDiscovery setDispatchQueue:](v9->_leechNearbyInfoV2Discovery, "setDispatchQueue:", -[CLGatheringBluetoothScanner queue](v9, "queue"));
    -[CBDiscovery setLabel:](v9->_leechNearbyInfoV2Discovery, "setLabel:", CFSTR("CLGatheringLeech"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100C9FA50;
    v16[3] = &unk_10217CDA0;
    v16[4] = v9;
    if (a5)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100C9FD90;
      v15[3] = &unk_102159D70;
      v15[4] = v9;
      v15[5] = v16;
      -[CBDiscovery setDevicesBufferedHandler:](v9->_leechNearbyInfoV2Discovery, "setDevicesBufferedHandler:", v15);
    }
    else
    {
      -[CBDiscovery setDeviceFoundHandler:](v9->_leechNearbyInfoV2Discovery, "setDeviceFoundHandler:", v16);
    }
    discovery = v9->_discovery;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100CA00F0;
    v14[3] = &unk_102143618;
    v14[4] = v9;
    -[CBDiscovery activateWithCompletion:](discovery, "activateWithCompletion:", v14);
    leechNearbyInfoV2Discovery = v9->_leechNearbyInfoV2Discovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100CA02D4;
    v13[3] = &unk_102143618;
    v13[4] = v9;
    -[CBDiscovery activateWithCompletion:](leechNearbyInfoV2Discovery, "activateWithCompletion:", v13);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CLGatheringBluetoothScanner setQueue:](self, "setQueue:", 0);
  -[CLGatheringBluetoothScanner setSettings:](self, "setSettings:", 0);
  -[CLGatheringBluetoothScanner setDelegate:](self, "setDelegate:", 0);
  -[CBDiscovery invalidate](self->_discovery, "invalidate");

  self->_discovery = 0;
  -[CBDiscovery invalidate](self->_leechNearbyInfoV2Discovery, "invalidate");

  self->_leechNearbyInfoV2Discovery = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringBluetoothScanner;
  -[CLGatheringBluetoothScanner dealloc](&v3, "dealloc");
}

- (void)startDeviceDiscoveryCommon
{
  uint64_t v3;

  if (-[CLGatheringSettings scanWithDuplicates](-[CLGatheringBluetoothScanner settings](self, "settings"), "scanWithDuplicates"))
  {
    v3 = 0x202000000;
  }
  else
  {
    v3 = 0x2000000;
  }
  -[CBDiscovery setDiscoveryFlags:](self->_discovery, "setDiscoveryFlags:", v3);
  -[CBDiscovery setDiscoveryFlags:](self->_leechNearbyInfoV2Discovery, "setDiscoveryFlags:", v3 | 0x100000000000);
  -[CBDiscovery addDiscoveryType:](self->_leechNearbyInfoV2Discovery, "addDiscoveryType:", 4);
}

- (void)startPermanentDeviceDiscovery
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217CDC0);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startPermanentDeviceDiscovery", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217CDC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "startPermanentDeviceDiscovery", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner startPermanentDeviceDiscovery]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLGatheringBluetoothScanner startDeviceDiscoveryCommon](self, "startDeviceDiscoveryCommon");
  -[CBDiscovery addDiscoveryType:](self->_discovery, "addDiscoveryType:", 11);
  -[CBDiscovery setUseCase:](self->_discovery, "setUseCase:", 524289);
  -[CBDiscovery setBleScanRateScreenOff:](self->_discovery, "setBleScanRateScreenOff:", -[CLGatheringSettings scanAonDutyCycle](-[CLGatheringBluetoothScanner settings](self, "settings"), "scanAonDutyCycle"));
}

- (void)startDeviceDiscovery
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217CDC0);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startDeviceDiscovery", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217CDC0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "startDeviceDiscovery", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner startDeviceDiscovery]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLGatheringBluetoothScanner startDeviceDiscoveryCommon](self, "startDeviceDiscoveryCommon");
  -[CBDiscovery addDiscoveryType:](self->_discovery, "addDiscoveryType:", 18);
  -[CBDiscovery setUseCase:](self->_discovery, "setUseCase:", 0x80000);
  -[CBDiscovery setBleScanRateScreenOff:](self->_discovery, "setBleScanRateScreenOff:", -[CLGatheringSettings scanDutyCycle](-[CLGatheringBluetoothScanner settings](self, "settings"), "scanDutyCycle"));
}

- (void)stopDeviceDiscovery
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10217CDC0);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopDeviceDiscovery", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10217CDC0);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "stopDeviceDiscovery", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringBluetoothScanner stopDeviceDiscovery]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  -[CBDiscovery setUseCase:](self->_discovery, "setUseCase:", 0);
  -[CBDiscovery setDiscoveryFlags:](self->_discovery, "setDiscoveryFlags:", 0);
  -[CBDiscovery removeAllDiscoveryTypes](self->_discovery, "removeAllDiscoveryTypes");
  -[CBDiscovery setDiscoveryFlags:](self->_leechNearbyInfoV2Discovery, "setDiscoveryFlags:", 0);
  -[CBDiscovery removeAllDiscoveryTypes](self->_leechNearbyInfoV2Discovery, "removeAllDiscoveryTypes");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CLLocationManagerGatheringBufferedDevicesReceived, 0, 0, 0);
}

- (CLGatheringBluetoothScannerDelegate)delegate
{
  return (CLGatheringBluetoothScannerDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CLGatheringSettings)settings
{
  return (CLGatheringSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
