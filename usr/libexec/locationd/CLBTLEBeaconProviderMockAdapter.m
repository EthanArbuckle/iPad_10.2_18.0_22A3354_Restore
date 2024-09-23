@implementation CLBTLEBeaconProviderMockAdapter

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
  if (qword_10230DA10 != -1)
    dispatch_once(&qword_10230DA10, &stru_1021AAA08);
  return (id)qword_10230DA08;
}

- (CLBTLEBeaconProviderMockAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBTLEBeaconProviderMockAdapter;
  return -[CLBTLEBeaconProviderMockAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBTLEBeaconProviderMockProtocol, &OBJC_PROTOCOL___CLBTLEBeaconProviderMockClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10125060C((uint64_t)-[CLBTLEBeaconProviderMockAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101948100();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)addProximityZoneEvent:(id)a3
{
  void *v4;
  _QWORD v5[3];
  char v6;
  uint64_t (**v7)();
  void *__p;
  char v9;

  v4 = -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1012507FC((uint64_t)v4, (uint64_t)v5);
  v7 = off_10213F058;
  if (v9 < 0)
    operator delete(__p);
  v5[0] = off_10213F058;
  if (v6 < 0)
    operator delete((void *)v5[1]);
}

- (void)addProximityScanEvent:(id)a3
{
  void *v4;
  uint64_t v5[3];

  v4 = -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_101250924((uint64_t)v4, (uint64_t)v5);
  sub_1007A1BE8(v5);
}

- (void)requestScan:(double)a3
{
  void *v4;

  v4 = -[CLBTLEBeaconProviderMockAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, double))(*(_QWORD *)v4 + 232))(v4, a3);
}

@end
