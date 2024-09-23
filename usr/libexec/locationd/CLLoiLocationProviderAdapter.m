@implementation CLLoiLocationProviderAdapter

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
  if (qword_102308D68 != -1)
    dispatch_once(&qword_102308D68, &stru_1021902C8);
  return (id)qword_102308D60;
}

- (CLLoiLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLoiLocationProviderAdapter;
  return -[CLLoiLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLoiLocationProviderProtocol, &OBJC_PROTOCOL___CLLoiLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100EA98D4((uint64_t)-[CLLoiLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019308F0();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLoiLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLoiLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLoiLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  BOOL v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _DWORD v7[4];
  uint8_t buf[4];
  int v9;

  if (_os_feature_enabled_impl("CoreLocation", "CLLoiLocationProvider"))
    v2 = &RTVisitConfidenceHigh == 0;
  else
    v2 = 1;
  if (!v2)
    byte_102308D70 = 1;
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021904D0);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v9 = byte_102308D70;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@ClxLoi, supported, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021904D0);
    v7[0] = 67240192;
    v7[1] = byte_102308D70;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 1, "@ClxLoi, supported, %{public}d", v7, 8);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "+[CLLoiLocationProviderAdapter(IsSupported) isSupported]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  return byte_102308D70;
}

@end
