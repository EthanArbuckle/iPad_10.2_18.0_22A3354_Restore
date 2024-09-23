@implementation CLCompanionBluetoothService

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
  if (qword_102306238 != -1)
    dispatch_once(&qword_102306238, &stru_102164B80);
  return (id)qword_102306230;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLCompanionBluetoothService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCompanionBluetoothService;
  return -[CLCompanionBluetoothService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCompanionBluetoothServiceProtocol, &OBJC_PROTOCOL___CLCompanionBluetoothClientProtocol);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCompanionBluetoothService;
  -[CLCompanionBluetoothService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  NSObject *v3;
  id v4;
  id v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[1640];

  -[CLCompanionBluetoothService silo](self, "silo");
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v3 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Initiating service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "[CLCompanionBluetoothService] Initiating service", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v4 = objc_msgSend(objc_msgSend(-[CLCompanionBluetoothService universe](self, "universe"), "silo"), "queue");
  -[CLCompanionBluetoothService setClients:](self, "setClients:", objc_opt_new(NSMutableSet));
  v5 = objc_alloc((Class)CBCentralManager);
  v9[0] = CBCentralManagerOptionReceiveIncomingObjectDiscoveryData;
  v9[1] = CBCentralManagerOptionReceiveSystemEvents;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanTrue;
  v9[2] = CBManagerNeedsRestrictedStateOperation;
  v10[2] = &__kCFBooleanTrue;
  -[CLCompanionBluetoothService setCbManager:](self, "setCbManager:", objc_msgSend(v5, "initWithDelegate:queue:options:", self, v4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3)));
  -[CLCompanionBluetoothService setCompanionPeripheral:](self, "setCompanionPeripheral:", 0);
}

- (void)endService
{
  NSObject *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  const char *v9;
  uint8_t *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _WORD v15[8];
  uint8_t v16[128];
  uint8_t buf[1640];

  -[CLCompanionBluetoothService silo](self, "silo");
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v3 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Terminating service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v15[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "[CLCompanionBluetoothService] Terminating service", v15, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService endService]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[CLCompanionBluetoothService clients](self, "clients");
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[CLCompanionBluetoothService unregisterForRSSIUpdatesForClient:](self, "unregisterForRSSIUpdatesForClient:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  -[CLCompanionBluetoothService setClients:](self, "setClients:", 0);
  -[CLCompanionBluetoothService setCbManager:](self, "setCbManager:", 0);

  -[CLCompanionBluetoothService setCompanionPeripheral:](self, "setCompanionPeripheral:", 0);
}

- (void)registerForRSSIUpdatesForClient:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v5 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v12 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Registering client %{private}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v6 = qword_10229FEB8;
    v9 = 136380675;
    v10 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "[CLCompanionBluetoothService] Registering client %{private}s", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService registerForRSSIUpdatesForClient:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[NSMutableSet addObject:](-[CLCompanionBluetoothService clients](self, "clients"), "addObject:", a3);
}

- (void)unregisterForRSSIUpdatesForClient:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v5 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v12 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Unegistering client %{private}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v6 = qword_10229FEB8;
    v9 = 136380675;
    v10 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "[CLCompanionBluetoothService] Unegistering client %{private}s", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService unregisterForRSSIUpdatesForClient:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[NSMutableSet removeObject:](-[CLCompanionBluetoothService clients](self, "clients"), "removeObject:", a3);
}

- (void)updateCompanionDevice
{
  unsigned __int8 v3;
  id v4;
  CBPeripheral *companionPeripheral;
  id v6;
  id v7;
  void *v8;
  CBCentralManager *cbManager;
  NSArray *v10;
  NSObject *v11;
  id v12;
  NSString *v13;
  NSObject *v14;
  const char *v15;
  char *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSString *v21;
  const char *v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  id v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  id v32;
  _BYTE buf[12];
  __int16 v34;
  NSString *v35;
  __int16 v36;
  uint64_t v37;

  v3 = atomic_load((unsigned __int8 *)&qword_102306258);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_102306258))
  {
    *(_QWORD *)buf = 0x403E000000000000;
    sub_1018BEA14(byte_102306240, "BtRssiLogInterval", buf, 0);
    __cxa_guard_release(&qword_102306258);
  }
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("kCBPhyStatsConfigEnable"));
  companionPeripheral = self->_companionPeripheral;
  if (companionPeripheral)
    -[CBCentralManager setBluetoothPhyStatisticsNotifications:options:](self->_cbManager, "setBluetoothPhyStatisticsNotifications:options:", companionPeripheral, v4);
  v6 = -[objc_class getActivePairedDevice](-[objc_class sharedInstance](off_1022A6450(), "sharedInstance"), "getActivePairedDevice");
  v7 = objc_msgSend(v6, "valueForProperty:", off_1022A6458());
  v8 = v7;
  if (!v7)
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v14 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Unable to get bluetoothIdentifier.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    LOWORD(v26) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "[CLCompanionBluetoothService] Unable to get bluetoothIdentifier.", &v26, 2);
    v16 = (char *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService updateCompanionDevice]", "%s\n", v15);
LABEL_33:
    if (v16 != buf)
      free(v16);
    return;
  }
  cbManager = self->_cbManager;
  v32 = v7;
  v10 = -[CBCentralManager retrievePeripheralsWithIdentifiers:](cbManager, "retrievePeripheralsWithIdentifiers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  if (-[NSArray count](v10, "count"))
  {

    self->_companionPeripheral = (CBPeripheral *)-[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v11 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend(-[CBPeripheral identifier](self->_companionPeripheral, "identifier"), "UUIDString");
      v13 = -[CBPeripheral name](self->_companionPeripheral, "name");
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v12;
      v34 = 2113;
      v35 = v13;
      v36 = 2050;
      v37 = qword_102306248;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Found companion CBPeripheral, uuid, %{private}@, btPeripheral, %{private}@. Enabling BT RSSI reporting with interval, %{public}f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102164BA0);
      v19 = qword_10229FEB8;
      v20 = objc_msgSend(-[CBPeripheral identifier](self->_companionPeripheral, "identifier"), "UUIDString");
      v21 = -[CBPeripheral name](self->_companionPeripheral, "name");
      v26 = 138478339;
      v27 = v20;
      v28 = 2113;
      v29 = v21;
      v30 = 2050;
      v31 = qword_102306248;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "[CLCompanionBluetoothService] Found companion CBPeripheral, uuid, %{private}@, btPeripheral, %{private}@. Enabling BT RSSI reporting with interval, %{public}f", &v26, 32);
      v23 = (char *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService updateCompanionDevice]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("kCBPhyStatsConfigEnable"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)*(double *)&qword_102306248), CFSTR("kCBPhyStatsConfigFrequencySubrate"));
    -[CBCentralManager setBluetoothPhyStatisticsNotifications:options:](self->_cbManager, "setBluetoothPhyStatisticsNotifications:options:", self->_companionPeripheral, v4);
    return;
  }
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v17 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_msgSend(v8, "UUIDString");
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Could not find companion CBPeripheral, uuid, %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v24 = qword_10229FEB8;
    v26 = 138477827;
    v27 = objc_msgSend(v8, "UUIDString");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "[CLCompanionBluetoothService] Could not find companion CBPeripheral, uuid, %{private}@", &v26, 12);
    v16 = (char *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService updateCompanionDevice]", "%s\n", v25);
    goto LABEL_33;
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  if (objc_msgSend(a3, "state") == (id)5)
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v4 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] CBManager is ready!", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    LOWORD(v10) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "[CLCompanionBluetoothService] CBManager is ready!", &v10, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService centralManagerDidUpdateState:]", "%s\n", v5);
    if (v6 == buf)
      return;
LABEL_20:
    free(v6);
    return;
  }
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102164BA0);
  v7 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v13 = objc_msgSend(a3, "state");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Bluetooth is unavailable %{public}ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v8 = qword_10229FEB8;
    v10 = 134349056;
    v11 = objc_msgSend(a3, "state");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "[CLCompanionBluetoothService] Bluetooth is unavailable %{public}ld", &v10, 12);
    v6 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService centralManagerDidUpdateState:]", "%s\n", v9);
    if (v6 != buf)
      goto LABEL_20;
  }
}

- (void)centralManager:(id)a3 didUpdatePhyStatisticEvent:(id)a4 results:(id)a5 error:(id)a6
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  id v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  NSMutableSet *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  int v31;
  _BYTE v32[14];
  uint8_t buf[4];
  _BYTE v34[14];

  if (a6)
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v7 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v34 = objc_msgSend(objc_msgSend(a6, "localizedDescription"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] error during didUpdatePhyStatisticEvent: %{public}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102164BA0);
      v8 = qword_10229FEB8;
      v31 = 136446210;
      *(_QWORD *)v32 = objc_msgSend(objc_msgSend(a6, "localizedDescription"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "[CLCompanionBluetoothService] error during didUpdatePhyStatisticEvent: %{public}s", &v31, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService centralManager:didUpdatePhyStatisticEvent:results:error:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    return;
  }
  v13 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"), a4);
  v14 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCBPhyStatsRSSI"));
  if (objc_msgSend(v13, "intValue"))
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v15 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] Error while configuring setBluetoothUsageNotifications error=%{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_26;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v31 = 138543362;
    *(_QWORD *)v32 = v13;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "[CLCompanionBluetoothService] Error while configuring setBluetoothUsageNotifications error=%{public}@", &v31, 12);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService centralManager:didUpdatePhyStatisticEvent:results:error:]", "%s\n", v16);
    if (v17 == buf)
      goto LABEL_26;
  }
  else
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v18 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v34 = objc_msgSend(v14, "intValue");
      *(_WORD *)&v34[4] = 2114;
      *(_QWORD *)&v34[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] didUpdatePhyStatisticEvent PhyUsage BtRssi=%{public}d, error=%{public}@", buf, 0x12u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_26;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102164BA0);
    v24 = qword_10229FEB8;
    v31 = 67240450;
    *(_DWORD *)v32 = objc_msgSend(v14, "intValue");
    *(_WORD *)&v32[4] = 2114;
    *(_QWORD *)&v32[6] = v13;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "[CLCompanionBluetoothService] didUpdatePhyStatisticEvent PhyUsage BtRssi=%{public}d, error=%{public}@", &v31, 18);
    v17 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionBluetoothService centralManager:didUpdatePhyStatisticEvent:results:error:]", "%s\n", v25);
    if (v17 == buf)
      goto LABEL_26;
  }
  free(v17);
LABEL_26:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = -[CLCompanionBluetoothService clients](self, "clients");
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "didUpdateRSSI:", v14);
      }
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v21);
  }
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CBCentralManager)cbManager
{
  return self->_cbManager;
}

- (void)setCbManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CBPeripheral)companionPeripheral
{
  return self->_companionPeripheral;
}

- (void)setCompanionPeripheral:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
