@implementation CLSignificantChangeManagerAdapter

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
  if (qword_102307958 != -1)
    dispatch_once(&qword_102307958, &stru_10217C9B0);
  return (id)qword_102307950;
}

- (CLSignificantChangeManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSignificantChangeManagerAdapter;
  return -[CLSignificantChangeManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSignificantChangeManagerProtocol, &OBJC_PROTOCOL___CLSignificantChangeManagerClientProtocol);
}

- (void)beginService
{
  -[CLSignificantChangeManagerAdapter universe](self, "universe");
  sub_100C981A4();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignificantChangeManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignificantChangeManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignificantChangeManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchLastSignificantLocationDistanceAndLatencyWithReply:(id)a3
{
  double *v4;

  v4 = -[CLSignificantChangeManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(id, double, double))a3 + 2))(a3, v4[23], v4[24]);
}

- (void)simulateSignificantLocationChange:(id)a3
{
  sub_100C98348((uint64_t)-[CLSignificantChangeManagerAdapter adaptee](self, "adaptee"), a3);
}

+ (BOOL)isSupported
{
  return 1;
}

@end
