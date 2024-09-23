@implementation CLBTLEFenceManagerAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)syncgetMonitoredRegions:(void *)a3 forClient:(id)a4
{
  void *v6;
  void *__p[2];
  char v9;

  v6 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  (*(void (**)(void *, void **, void *))(*(_QWORD *)v6 + 224))(v6, __p, a3);
  if (v9 < 0)
    operator delete(__p[0]);
  return 1;
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_10230DA30 != -1)
    dispatch_once(&qword_10230DA30, &stru_1021AAE20);
  return (id)qword_10230DA28;
}

- (CLBTLEFenceManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBTLEFenceManagerAdapter;
  return -[CLBTLEFenceManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBTLEFenceManagerProtocol, &OBJC_PROTOCOL___CLBTLEFenceManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1012650E4((uint64_t)-[CLBTLEFenceManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019488A8();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10230DA40 != -1)
    dispatch_once(&qword_10230DA40, &stru_1021AAE40);
  return byte_10230DA38;
}

- (void)queryBundleIdentifiersWithEnteredRegionsWithReply:(id)a3
{
  void *v4;

  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(_QWORD *)v4 + 256))(v4, a3);
}

- (void)addMonitoredRegion:(id)a3
{
  void *v4;
  _QWORD v5[15];

  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 216))(v4, v5);
  sub_100114750((uint64_t)v5);
}

- (void)removeMonitoredRegion:(id)a3
{
  void *v4;
  _QWORD v5[15];

  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 240))(v4, v5);
  sub_100114750((uint64_t)v5);
}

- (void)requestRegionState:(id)a3
{
  void *v4;
  _QWORD v5[15];

  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v4 + 248))(v4, v5);
  sub_100114750((uint64_t)v5);
}

- (BOOL)syncgetHasMonitoredRegions:(id)a3
{
  void *v4;
  char v5;
  void *__p[2];
  char v8;

  v4 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v5 = (*(uint64_t (**)(void *, void **))(*(_QWORD *)v4 + 232))(v4, __p);
  if (v8 < 0)
    operator delete(__p[0]);
  return v5;
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *__p[2];
  char v13;

  if (a6 == 1)
    v9 = 4;
  else
    v9 = 1;
  if (a6)
    v10 = v9;
  else
    v10 = 2;
  v11 = -[CLBTLEFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  (*(void (**)(void *, void **, int64_t, int64_t, uint64_t))(*(_QWORD *)v11 + 208))(v11, __p, a4, a5, v10);
  if (v13 < 0)
    operator delete(__p[0]);
}

@end
