@implementation CLUnifiedCellLocationProviderAdapter

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
  if (qword_102308208 != -1)
    dispatch_once(&qword_102308208, &stru_102184390);
  return (id)qword_102308200;
}

- (CLUnifiedCellLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLUnifiedCellLocationProviderAdapter;
  return -[CLUnifiedCellLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLUnifiedCellLocationProviderProtocol, &OBJC_PROTOCOL___CLUnifiedCellLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100D91BDC((uint64_t)-[CLUnifiedCellLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101929C90();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLUnifiedCellLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLUnifiedCellLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLUnifiedCellLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  NSObject *v2;
  const char *v4;
  uint8_t *v5;
  _DWORD v6[4];
  uint8_t buf[4];
  int v8;

  if (qword_102308218 != -1)
    dispatch_once(&qword_102308218, &stru_1021843B0);
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021846D8);
  v2 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v8 = byte_102308210;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxCell, supported, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021846D8);
    v6[0] = 67240192;
    v6[1] = byte_102308210;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "@ClxCell, supported, %{public}d", v6, 8);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "+[CLUnifiedCellLocationProviderAdapter(IsSupported) isSupported]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  return byte_102308210;
}

@end
