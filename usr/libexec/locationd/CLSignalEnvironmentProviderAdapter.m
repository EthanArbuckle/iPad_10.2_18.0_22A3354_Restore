@implementation CLSignalEnvironmentProviderAdapter

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
  if (qword_102308110 != -1)
    dispatch_once(&qword_102308110, &stru_1021838D0);
  return (id)qword_102308108;
}

- (CLSignalEnvironmentProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSignalEnvironmentProviderAdapter;
  return -[CLSignalEnvironmentProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSignalEnvironmentProviderProtocol, &OBJC_PROTOCOL___CLSignalEnvironmentProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100D7CC7C((uint64_t)-[CLSignalEnvironmentProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10192994C();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignalEnvironmentProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignalEnvironmentProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSignalEnvironmentProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchCoarseSignalEnvironmentForLatitude:(double)a3 longitude:(double)a4 withReply:(id)a5
{
  uint64_t v6;

  v6 = sub_100D7CE24((uint64_t)-[CLSignalEnvironmentProviderAdapter adaptee](self, "adaptee"), a3, a4);
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v6);
}

+ (BOOL)isSupported
{
  if (qword_102308118 != -1)
    dispatch_once(&qword_102308118, &stru_1021838F0);
  return 1;
}

@end
