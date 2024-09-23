@implementation CLBeaconFenceAuthorizationManagerAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4
{
  void *v6;
  void *__p[2];

  v6 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1000847A8((uint64_t)v6 + 128, (uint64_t *)__p, (uint64_t *)a3);
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
  if (qword_10230E0E0 != -1)
    dispatch_once(&qword_10230E0E0, &stru_1021AD8F8);
  return (id)qword_10230E0D8;
}

- (CLBeaconFenceAuthorizationManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBeaconFenceAuthorizationManagerAdapter;
  return -[CLBeaconFenceAuthorizationManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerProtocol, &OBJC_PROTOCOL___CLBeaconFenceAuthorizationManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1012E26C8((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10194C440();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetAddFence:(const void *)a3
{
  sub_1012E2818((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (BOOL)syncgetRemoveFence:(const void *)a3
{
  sub_1012E3268((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)fetchAllFencesCountWithReply:(id)a3
{
  sub_1012E37A8((uint64_t)-[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetFences:(void *)a3 forBundle:(id)a4 onBehalfOf:(id)a5
{
  void *v8;
  void *__p[2];
  void *v11[2];

  v8 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v11, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a5, "UTF8String"));
  sub_1012E0A40((uint64_t)v8 + 128, (uint64_t *)v11, (uint64_t)__p, (uint64_t *)a3);
}

- (int)syncgetCanBundle:(id)a3 performFenceOperationFor:(id)a4
{
  void *v6;
  int v7;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  v6 = -[CLBeaconFenceAuthorizationManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v11, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  v7 = sub_1012E3A60((uint64_t)v6, (uint64_t)v11, (uint64_t)__p);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);
  return v7;
}

@end
