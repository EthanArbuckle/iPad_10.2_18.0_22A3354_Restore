@implementation CLSensorRecorderNotifierAdapter

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
  if (qword_10230D9B8 != -1)
    dispatch_once(&qword_10230D9B8, &stru_1021AA658);
  return (id)qword_10230D9B0;
}

- (CLSensorRecorderNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSensorRecorderNotifierAdapter;
  return -[CLSensorRecorderNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSensorRecorderNotifierProtocol, &OBJC_PROTOCOL___CLSensorRecorderNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_101248C30((uint64_t)-[CLSensorRecorderNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101947E08();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSensorRecorderNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSensorRecorderNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSensorRecorderNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupportedForType:(int)a3
{
  _QWORD block[4];
  int v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101248E04;
  block[3] = &unk_1021AA678;
  v5 = a3;
  if (qword_10230D9C8 != -1)
    dispatch_once(&qword_10230D9C8, block);
  return byte_10230D9C0;
}

@end
