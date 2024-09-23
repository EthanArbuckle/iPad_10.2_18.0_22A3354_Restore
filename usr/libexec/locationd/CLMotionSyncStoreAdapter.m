@implementation CLMotionSyncStoreAdapter

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
  if (qword_10230C450 != -1)
    dispatch_once(&qword_10230C450, &stru_10219F4F0);
  return (id)qword_10230C448;
}

- (CLMotionSyncStoreAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionSyncStoreAdapter;
  return -[CLMotionSyncStoreAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionSyncStoreProtocol, &OBJC_PROTOCOL___CLMotionSyncStoreClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1010B9F70((uint64_t)-[CLMotionSyncStoreAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193DD7C();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionSyncStoreAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionSyncStoreAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionSyncStoreAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  sub_100197040();
  return sub_1000C4240();
}

- (void)resetStoredCalibrations
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  v2 = -[CLMotionSyncStoreAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(_QWORD *)v2 + 232))(v2);
  if (qword_10229FC90 != -1)
    dispatch_once(&qword_10229FC90, &stru_10219F680);
  v3 = qword_10229FC98;
  if (os_log_type_enabled((os_log_t)qword_10229FC98, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Notice Calibrations were successfully cleared.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC90 != -1)
      dispatch_once(&qword_10229FC90, &stru_10219F680);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC98, 0, "#Notice Calibrations were successfully cleared.", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLMotionSyncStoreAdapter resetStoredCalibrations]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

@end
