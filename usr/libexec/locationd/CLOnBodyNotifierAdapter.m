@implementation CLOnBodyNotifierAdapter

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
  if (qword_102307358 != -1)
    dispatch_once(&qword_102307358, &stru_10217AB58);
  return (id)qword_102307350;
}

- (CLOnBodyNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLOnBodyNotifierAdapter;
  return -[CLOnBodyNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLOnBodyNotifierProtocol, &OBJC_PROTOCOL___CLOnBodyNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100C21F84((uint64_t)-[CLOnBodyNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019234E4();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOnBodyNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOnBodyNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOnBodyNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102307368 != -1)
    dispatch_once(&qword_102307368, &stru_10217AB78);
  return byte_102307360;
}

@end
