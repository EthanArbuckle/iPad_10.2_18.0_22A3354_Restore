@implementation CLGatheringService

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
  if (qword_1023085B0 != -1)
    dispatch_once(&qword_1023085B0, &stru_102186BE8);
  return (id)qword_1023085A8;
}

+ (BOOL)isSupported
{
  if (qword_1023085C0 != -1)
    dispatch_once(&qword_1023085C0, &stru_102186C08);
  return byte_1023085B8;
}

- (CLGatheringService)init
{
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  objc_super v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102186C28);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "init service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102186C28);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "init service", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringService init]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CLGatheringService;
  return -[CLGatheringService initWithInboundProtocol:outboundProtocol:](&v7, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGatheringServiceProtocol, &OBJC_PROTOCOL___CLGatheringClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102186C28);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "begin service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102186C28);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "begin service", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringService beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v4 = objc_msgSend(objc_msgSend(-[CLGatheringService universe](self, "universe"), "silo"), "queue");
  self->_settings = -[CLGatheringSettings initWithUniverse:]([CLGatheringSettings alloc], "initWithUniverse:", -[CLGatheringService universe](self, "universe"));
  self->_bluetoothClient = -[CLGatheringBluetoothClient initWithQueue:withSettings:]([CLGatheringBluetoothClient alloc], "initWithQueue:withSettings:", v4, self->_settings);
  self->_advStore = -[CLGatheringDiscoveryStore initWithQueue:withSettings:]([CLGatheringDiscoveryStore alloc], "initWithQueue:withSettings:", v4, self->_settings);
  self->_xpcServer = -[CLGatheringXPCServer initWithQueue:settings:advStore:btClient:]([CLGatheringXPCServer alloc], "initWithQueue:settings:advStore:btClient:", v4, self->_settings, self->_advStore, self->_bluetoothClient);
  -[CLGatheringBluetoothClient setScannerDelegate:](self->_bluetoothClient, "setScannerDelegate:", self->_advStore);
  -[CLGatheringBluetoothClient run](self->_bluetoothClient, "run");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CLLocationManagerGatheringCameUp, 0, 0, 0);
}

- (void)endService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102186C28);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "end service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102186C28);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "end service", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringService endService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLGatheringBluetoothClient stop](self->_bluetoothClient, "stop");

}

@end
