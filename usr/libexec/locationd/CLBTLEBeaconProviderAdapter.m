@implementation CLBTLEBeaconProviderAdapter

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
  if (qword_10230DF48 != -1)
    dispatch_once(&qword_10230DF48, &stru_1021ACAF0);
  return (id)qword_10230DF40;
}

- (CLBTLEBeaconProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBTLEBeaconProviderAdapter;
  return -[CLBTLEBeaconProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBTLEBeaconProviderProtocol, &OBJC_PROTOCOL___CLBTLEBeaconProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1012AEFDC((uint64_t)-[CLBTLEBeaconProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10194B210();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)startScan
{
  void *v2;

  v2 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(_QWORD *)v2 + 240))(v2);
}

- (void)stopScan
{
  void *v2;

  v2 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(_QWORD *)v2 + 248))(v2);
}

- (BOOL)syncgetAddProximityZone:(const void *)a3
{
  void *v4;

  v4 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const void *))(*(_QWORD *)v4 + 208))(v4, a3);
}

- (BOOL)syncgetRemoveProximityZone:(const void *)a3
{
  void *v4;

  v4 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const void *))(*(_QWORD *)v4 + 216))(v4, a3);
}

- (BOOL)syncgetadvertiseSelfAsBeaconForRegion:(id)a3 power:(int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v6 = -[CLBTLEBeaconProviderAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, id, uint64_t))(*(_QWORD *)v6 + 256))(v6, a3, v4);
}

@end
