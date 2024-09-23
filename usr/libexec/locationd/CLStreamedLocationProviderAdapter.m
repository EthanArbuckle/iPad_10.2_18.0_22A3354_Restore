@implementation CLStreamedLocationProviderAdapter

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
  if (qword_102301498 != -1)
    dispatch_once(&qword_102301498, &stru_10213E058);
  return (id)qword_102301490;
}

- (CLStreamedLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderAdapter;
  return -[CLStreamedLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLStreamedLocationProviderProtocol, &OBJC_PROTOCOL___CLStreamedLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1004AF894((uint64_t)-[CLStreamedLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1018FBF20();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1023014A8 != -1)
    dispatch_once(&qword_1023014A8, &stru_10213E078);
  return byte_1023014A0;
}

- (void)takeDisablementAssertion
{
  sub_1004AFB24(-[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)releaseDisablementAssertion
{
  sub_1004AFEA4(-[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)takeEmergencyEnablementAssertion
{
  sub_1004B0224((uint64_t)-[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)releaseEmergencyEnablementAssertion
{
  sub_1004B0588((uint64_t)-[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  sub_1004B090C((uint64_t)-[CLStreamedLocationProviderAdapter adaptee](self, "adaptee"), a3, a4);
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  int v6;

  v3 = a3;
  v4 = -[CLStreamedLocationProviderAdapter adaptee](self, "adaptee");
  if (v3)
  {
    v6 = 9;
    (*(void (**)(void *, int *))(*(_QWORD *)v4 + 120))(v4, &v6);
  }
  else
  {
    v5 = 9;
    (*(void (**)(void *, int *, uint64_t, uint64_t))(*(_QWORD *)v4 + 144))(v4, &v5, 1, 0xFFFFFFFFLL);
  }
}

@end
