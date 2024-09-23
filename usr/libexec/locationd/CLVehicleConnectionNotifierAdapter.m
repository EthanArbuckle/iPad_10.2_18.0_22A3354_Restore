@implementation CLVehicleConnectionNotifierAdapter

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
  if (qword_10230C3F8 != -1)
    dispatch_once(&qword_10230C3F8, &stru_10219F078);
  return (id)qword_10230C3F0;
}

- (CLVehicleConnectionNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVehicleConnectionNotifierAdapter;
  return -[CLVehicleConnectionNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVehicleConnectionNotifierProtocol, &OBJC_PROTOCOL___CLVehicleConnectionNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1010AD154((uint64_t)-[CLVehicleConnectionNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193DA84();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchMostRecentConnectionWithReply:(id)a3
{
  _BYTE v4[792];

  memcpy(v4, (char *)-[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee") + 976, sizeof(v4));
  (*((void (**)(id, _BYTE *))a3 + 2))(a3, v4);
}

- (void)fetchIsDeviceVehicle:(id)a3 deviceType:(unint64_t)a4 withReply:(id)a5
{
  int v6;
  unsigned __int8 *v8;
  int v9;
  _BOOL8 v10;
  void *__p[2];
  char v13;

  v6 = a4;
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v8 = -[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee");
  v9 = v8[944];
  v10 = (v6 == 22 || v6 == 17) && (sub_1010B19F4((uint64_t)v8, (uint64_t)__p) & 1) != 0 || v6 == 16 && v9 != 0;
  (*((void (**)(id, _BOOL8))a5 + 2))(a5, v10);
  if (v13 < 0)
    operator delete(__p[0]);
}

- (void)deliverAndReleaseNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4
{
  sub_1010AD414((uint64_t)-[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee"), a4);
  CFRelease(a3);
}

- (void)fetchMostRecentInVehicleStartAndExitTimesWithReply:(id)a3
{
  (*((void (**)(id, double, double))a3 + 2))(a3, *((double *)-[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee") + 122), *((double *)-[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee") + 220));
}

@end
