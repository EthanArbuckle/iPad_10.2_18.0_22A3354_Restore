@implementation CLDataProtectionManagerAdapter

- (void)fetchDataAvailabilityWithReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, *((unsigned int *)-[CLDataProtectionManagerAdapter adaptee](self, "adaptee") + 28));
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

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
  if (qword_1023089E8 != -1)
    dispatch_once(&qword_1023089E8, &stru_10218AF60);
  return (id)qword_1023089E0;
}

- (CLDataProtectionManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDataProtectionManagerAdapter;
  return -[CLDataProtectionManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDataProtectionManagerProtocol, &OBJC_PROTOCOL___CLDataProtectionManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100E33BD4((uint64_t)-[CLDataProtectionManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10192E000();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDataProtectionManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDataProtectionManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDataProtectionManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)postDataAvailability
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_10218B108);
  v3 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "client of CLDataProtectionManager is requesting a re-broadcast of data availability", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10218B108);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "client of CLDataProtectionManager is requesting a re-broadcast of data availability", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLDataProtectionManagerAdapter postDataAvailability]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_100E33E9C(-[CLDataProtectionManagerAdapter adaptee](self, "adaptee"));
}

- (int)syncgetDataAvailability
{
  return *((_DWORD *)-[CLDataProtectionManagerAdapter adaptee](self, "adaptee") + 28);
}

- (BOOL)syncgetDeviceUnlockedSinceFirstBoot
{
  -[CLDataProtectionManagerAdapter adaptee](self, "adaptee");
  return sub_100E340A8();
}

@end
