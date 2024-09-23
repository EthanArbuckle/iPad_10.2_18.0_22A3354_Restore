@implementation CLVDRNotifierAdapter

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
  if (qword_102306AB0 != -1)
    dispatch_once(&qword_102306AB0, &stru_102168EF8);
  return (id)qword_102306AA8;
}

- (CLVDRNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVDRNotifierAdapter;
  return -[CLVDRNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVDRNotifierProtocol, &OBJC_PROTOCOL___CLVDRNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100AD56DC((uint64_t)-[CLVDRNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10191999C();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVDRNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVDRNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVDRNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102306AC0 != -1)
    dispatch_once(&qword_102306AC0, &stru_102168F18);
  return byte_102306AB8;
}

- (void)registerForVdr2DofMeasurements:(id)a3
{
  void *v4;

  v4 = -[CLVDRNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(_QWORD *)v4 + 208))(v4, a3);
}

- (void)unregisterForVdr2DofMeasurements:(id)a3
{
  void *v4;

  v4 = -[CLVDRNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(_QWORD *)v4 + 216))(v4, a3);
}

@end
