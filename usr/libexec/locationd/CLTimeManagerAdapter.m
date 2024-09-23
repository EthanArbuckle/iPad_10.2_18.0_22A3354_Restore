@implementation CLTimeManagerAdapter

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
  if (qword_102303208 != -1)
    dispatch_once(&qword_102303208, &stru_10214BEE8);
  return (id)qword_102303200;
}

- (CLTimeManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTimeManagerAdapter;
  return -[CLTimeManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTimeManagerProtocol, &OBJC_PROTOCOL___CLTimeManagerClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100692DAC((uint64_t)-[CLTimeManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_1019045AC();
    sub_100692DAC(v3);
  }
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTimeManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTimeManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTimeManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetReferenceTime:(double *)a3
{
  uint64_t v5;
  int v6;

  -[CLTimeManagerAdapter adaptee](self, "adaptee");
  v5 = 0;
  v6 = 0;
  return TMGetReferenceTime(a3, &v5, &v6) != 0;
}

- (BOOL)syncgetReferenceTime:(double *)a3 andError:(double *)a4
{
  int v7;

  -[CLTimeManagerAdapter adaptee](self, "adaptee");
  v7 = 0;
  return TMGetReferenceTime(a3, a4, &v7) != 0;
}

- (void)setGpsTime:(unint64_t)a3
{
  sub_100692FC0((uint64_t)-[CLTimeManagerAdapter adaptee](self, "adaptee"), a3);
}

@end
