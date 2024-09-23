@implementation CLHomeKitDelegate

- (CLHomeKitDelegate)initWithProvider:(void *)a3
{
  CLHomeKitDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLHomeKitDelegate;
  result = -[CLHomeKitDelegate init](&v5, "init");
  if (result)
  {
    result->_homekitProvider = a3;
    *(_WORD *)&result->_homekitPower = 0;
  }
  return result;
}

- (BOOL)power
{
  return self->_cbPower || self->_homekitPower;
}

- (void)homeKitDidUpdateState:(id)a3
{
  self->_homekitPower = objc_msgSend(a3, "state") == (id)3;
  sub_100586678((uint64_t)self->_homekitProvider, -[CLHomeKitDelegate power](self, "power"));
}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7
{
  id v11;
  int v12;
  void *homekitProvider;
  double Current;

  v11 = objc_msgSend(a5, "objectForKeyedSubscript:", CBAdvertisementDataManufacturerDataKey);
  if (a6)
    LODWORD(a6) = objc_msgSend(a6, "intValue");
  v12 = sub_100586790(a7);
  homekitProvider = self->_homekitProvider;
  Current = j__CFAbsoluteTimeGetCurrent();
  sub_100586960((uint64_t)homekitProvider, a4, 2, v11, (int)a6, v12, Current);
}

- (void)homeKitStartedScanning:(id)a3 forType:(int64_t)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  int64_t v9;
  uint8_t buf[4];
  int64_t v11;

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_102145450);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Started scanning for HomeKit 2.0 devices for type %{public}ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_102145450);
    v8 = 134349056;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Started scanning for HomeKit 2.0 devices for type %{public}ld", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeKitDelegate homeKitStartedScanning:forType:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)homeKitStoppedScanning:(id)a3 forType:(int64_t)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  int64_t v9;
  uint8_t buf[4];
  int64_t v11;

  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_102145450);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Stopped scanning for HomeKit 2.0 devices for type %{public}ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_102145450);
    v8 = 134349056;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Stopped scanning for HomeKit 2.0 devices for type %{public}ld", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLHomeKitDelegate homeKitStoppedScanning:forType:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4 forType:(int64_t)a5
{
  uint64_t v6;

  v6 = sub_100586790(a5);
  sub_100587840(v6, a4, v6);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  self->_cbPower = objc_msgSend(a3, "state") != (id)4;
  sub_100586678((uint64_t)self->_homekitProvider, -[CLHomeKitDelegate power](self, "power"));
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v9;
  id v10;
  void *homekitProvider;
  id v12;
  double Current;

  v9 = objc_msgSend(a5, "objectForKey:", CBAdvertisementDataServiceDataKey);
  if (v9)
  {
    v10 = objc_msgSend(v9, "objectForKeyedSubscript:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED4")));
    if (a6)
      LODWORD(a6) = objc_msgSend(a6, "intValue");
    homekitProvider = self->_homekitProvider;
    v12 = objc_msgSend(a4, "identifier");
    Current = j__CFAbsoluteTimeGetCurrent();
    sub_100586960((uint64_t)homekitProvider, v12, 1, v10, (int)a6, 0, Current);
  }
}

@end
