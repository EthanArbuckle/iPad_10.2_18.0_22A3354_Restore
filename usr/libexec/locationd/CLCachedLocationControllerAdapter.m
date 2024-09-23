@implementation CLCachedLocationControllerAdapter

+ (BOOL)isSupported
{
  if (qword_102305060 != -1)
    dispatch_once(&qword_102305060, &stru_1021593C0);
  return (byte_102305058 & 1) == 0;
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
  if (qword_102305070 != -1)
    dispatch_once(&qword_102305070, &stru_1021593E0);
  return (id)qword_102305068;
}

- (CLCachedLocationControllerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCachedLocationControllerAdapter;
  return -[CLCachedLocationControllerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCachedLocationControllerProtocol, &OBJC_PROTOCOL___CLCachedLocationControllerClientProtocol);
}

- (void)beginService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10089183C((uint64_t)-[CLCachedLocationControllerAdapter universe](self, "universe"));
  if (v3)
    v4 = v3 + 8;
  else
    v4 = 0;
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", v4);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v5 = sub_10190D664();
    sub_10089183C(v5);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCachedLocationControllerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCachedLocationControllerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCachedLocationControllerAdapter adaptee](self, "adaptee"));
  return 0;
}

@end
