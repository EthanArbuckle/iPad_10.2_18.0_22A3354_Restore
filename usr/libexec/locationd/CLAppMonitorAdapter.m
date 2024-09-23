@implementation CLAppMonitorAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)syncgetIsApplicationInstalledLocally:(__CFString *)a3
{
  -[CLAppMonitorAdapter adaptee](self, "adaptee");
  return sub_100020780(a3);
}

- (void)onApplicationStateChange:(id)a3
{
  sub_1000BCBD4((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), (const __CFDictionary *)a3);
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
  if (qword_10230CD90 != -1)
    dispatch_once(&qword_10230CD90, &stru_1021A2848);
  return (id)qword_10230CD88;
}

- (CLAppMonitorAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAppMonitorAdapter;
  return -[CLAppMonitorAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAppMonitorProtocol, &OBJC_PROTOCOL___CLAppMonitorClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_101141DA0((uint64_t)-[CLAppMonitorAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101940B4C();
    sub_101141DA0(v3);
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAppMonitorAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAppMonitorAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAppMonitorAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetForegroundApp:(void *)a3
{
  return sub_101141EF0((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)isApplicationInstalledIncludingPairedDevices:(id)a3 withReply:(id)a4
{
  sub_101141F98((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (int)syncgetAppType:(id)a3
{
  -[CLAppMonitorAdapter adaptee](self, "adaptee");
  return sub_10114205C(a3);
}

- (void)onApplicationsInstalled:(id)a3
{
  sub_1011422C8((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), a3);
}

- (void)onApplicationsUninstalled:(id)a3
{
  sub_101142664((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), a3);
}

- (void)checkApplications:(id)a3 withReply:(id)a4
{
  sub_1011429AC((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

@end
