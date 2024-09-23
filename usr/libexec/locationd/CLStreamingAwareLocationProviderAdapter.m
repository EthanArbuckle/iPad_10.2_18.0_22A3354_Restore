@implementation CLStreamingAwareLocationProviderAdapter

- (void)takeAccuracyEnablementAssertionForClient:(id)a3 withDesiredAccuracy:(double)a4
{
  sub_100062098((uint64_t)-[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee"), a3, a4);
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

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102308BD0 != -1)
    dispatch_once(&qword_102308BD0, &stru_10218BC68);
  return (id)qword_102308BC8;
}

- (CLStreamingAwareLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStreamingAwareLocationProviderAdapter;
  return -[CLStreamingAwareLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLStreamingAwareLocationProviderProtocol, &OBJC_PROTOCOL___CLStreamingAwareLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100E4A11C((uint64_t)-[CLStreamingAwareLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10192EA94();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)releaseAccuracyEnablementAssertionForClient:(id)a3
{
  sub_100E4A26C(-[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee"), a3);
}

- (void)remoteDeviceMotionUpdate:(int)a3 atTime:(double)a4
{
  sub_100E337C4(*((_QWORD *)-[CLStreamingAwareLocationProviderAdapter adaptee](self, "adaptee") + 16), a4);
}

@end
