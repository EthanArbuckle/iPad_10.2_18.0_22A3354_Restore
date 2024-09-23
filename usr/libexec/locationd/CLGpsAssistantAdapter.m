@implementation CLGpsAssistantAdapter

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
  if (qword_10230DEE8 != -1)
    dispatch_once(&qword_10230DEE8, &stru_1021AC020);
  return (id)qword_10230DEE0;
}

- (CLGpsAssistantAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGpsAssistantAdapter;
  return -[CLGpsAssistantAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGpsAssistantProtocol, &OBJC_PROTOCOL___CLGpsAssistantClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1012A2D5C((uint64_t)-[CLGpsAssistantAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10194A390();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGpsAssistantAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGpsAssistantAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGpsAssistantAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)setVehicleSpeedAssistance:(double)a3 vehicleSpeed:(id *)a4
{
  double v4;

  v4 = a3;
  sub_1012A2EF4((unsigned __int8 *)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), &v4, (uint64_t)a4);
}

- (void)setVehicleGyroAssistance:(double)a3 vehicleGyro:(id *)a4
{
  double v4;

  v4 = a3;
  sub_1012A3224((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), &v4, &a4->var0);
}

- (void)setDirectionOfTravelAssistance:(DirectionOfTravelAssistance *)a3
{
  sub_1012A351C((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)setMapMatchedPositionAssistance:(MapMatchedPositionAssistance *)a3
{
  sub_1012A35CC((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), a3);
}

- (void)setTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
  sub_1012A3670((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), a3);
}

- (void)setTunnelEndPointPositionAssistance:(TunnelEndPositionAssistance *)a3
{
  sub_1012A3714((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

@end
