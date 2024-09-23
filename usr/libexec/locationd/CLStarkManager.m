@implementation CLStarkManager

- (CLStarkManager)init
{
  CLStarkManager *v2;
  Class v3;
  objc_class *v4;
  NSObject *v5;
  CRVehicleAccessoryManager *v6;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  objc_super v11;
  uint8_t buf[1640];

  v11.receiver = self;
  v11.super_class = (Class)CLStarkManager;
  v2 = -[CLStarkManager init](&v11, "init");
  if (v2)
  {
    v3 = off_1022FF950();
    if (v3)
    {
      v4 = v3;
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_1021B30C0);
      v5 = qword_10229FC78;
      if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#fmc CarKit is available.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC70 != -1)
          dispatch_once(&qword_10229FC70, &stru_1021B30C0);
        v10[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 0, "#fmc CarKit is available.", v10, 2);
        v9 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLStarkManager init]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
      v6 = (CRVehicleAccessoryManager *)objc_alloc_init(v4);
      v2->fAccessoryManager = v6;
      -[CRVehicleAccessoryManager addObserver:](v6, "addObserver:", v2);
      v2->_isConnected = -[CLStarkManager checkVehicleConnectionStatus](v2, "checkVehicleConnectionStatus");
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[CLStarkManager connectionUpdateHandler](self, "connectionUpdateHandler"))

  -[CRVehicleAccessoryManager removeObserver:](self->fAccessoryManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CLStarkManager;
  -[CLStarkManager dealloc](&v3, "dealloc");
}

- (BOOL)checkVehicleConnectionStatus
{
  id v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _DWORD v7[4];
  uint8_t buf[4];
  _BOOL4 v9;

  v2 = objc_msgSend(-[CRVehicleAccessoryManager connectedVehicleAccessories](self->fAccessoryManager, "connectedVehicleAccessories"), "count");
  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021B30C0);
  v3 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v9 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle connection status: %{public}d.", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021B30C0);
    v7[0] = 67240192;
    v7[1] = v2 != 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 0, "#fmc Vehicle connection status: %{public}d.", v7, 8);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLStarkManager checkVehicleConnectionStatus]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  return v2 != 0;
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  NSObject *v6;
  void (**v7)(id, BOOL, NSString *, id, id);
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021B30C0);
  v6 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = objc_msgSend(objc_msgSend(a4, "vehicleName"), "UTF8String");
    v17 = 2080;
    v18 = objc_msgSend(objc_msgSend(a4, "bluetoothAddress"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle connected: name, %s, address, %s.", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021B30C0);
    v8 = qword_10229FC78;
    v11 = 136315394;
    v12 = objc_msgSend(objc_msgSend(a4, "vehicleName"), "UTF8String");
    v13 = 2080;
    v14 = objc_msgSend(objc_msgSend(a4, "bluetoothAddress"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "#fmc Vehicle connected: name, %s, address, %s.", (const char *)&v11, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLStarkManager accessoryManager:didConnectVehicleAccessory:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (!self->_isConnected)
  {
    self->_isConnected = 1;
    if (-[CLStarkManager connectionUpdateHandler](self, "connectionUpdateHandler"))
    {
      v7 = -[CLStarkManager connectionUpdateHandler](self, "connectionUpdateHandler");
      v7[2](v7, self->_isConnected, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarKit %@"), objc_msgSend(a4, "vehicleName")), objc_msgSend(a4, "vehicleModelName"), objc_msgSend(a4, "bluetoothAddress"));
    }
  }
}

- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4
{
  NSObject *v6;
  _BOOL4 v7;
  void (**v8)(id, BOOL, NSString *, id, id);
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021B30C0);
  v6 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = objc_msgSend(objc_msgSend(a4, "vehicleName"), "UTF8String");
    v18 = 2080;
    v19 = objc_msgSend(objc_msgSend(a4, "bluetoothAddress"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#fmc Vehicle disconnected: name, %s, address, %s.", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021B30C0);
    v9 = qword_10229FC78;
    v12 = 136315394;
    v13 = objc_msgSend(objc_msgSend(a4, "vehicleName"), "UTF8String");
    v14 = 2080;
    v15 = objc_msgSend(objc_msgSend(a4, "bluetoothAddress"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "#fmc Vehicle disconnected: name, %s, address, %s.", (const char *)&v12, 22);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLStarkManager accessoryManager:didDisconnectVehicleAccessory:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  v7 = -[CLStarkManager checkVehicleConnectionStatus](self, "checkVehicleConnectionStatus");
  if (self->_isConnected != v7)
  {
    self->_isConnected = v7;
    if (-[CLStarkManager connectionUpdateHandler](self, "connectionUpdateHandler"))
    {
      v8 = -[CLStarkManager connectionUpdateHandler](self, "connectionUpdateHandler");
      v8[2](v8, self->_isConnected, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarKit %@"), objc_msgSend(a4, "vehicleName")), objc_msgSend(a4, "vehicleModelName"), objc_msgSend(a4, "bluetoothAddress"));
    }
  }
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (id)connectionUpdateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
