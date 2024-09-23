@implementation CLVehicleStateNotifierAdapter

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
  if (qword_10230F158 != -1)
    dispatch_once(&qword_10230F158, &stru_1021B6F18);
  return (id)qword_10230F150;
}

- (CLVehicleStateNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVehicleStateNotifierAdapter;
  return -[CLVehicleStateNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVehicleStateNotifierProtocol, &OBJC_PROTOCOL___CLVehicleStateNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10144A2BC((uint64_t)-[CLVehicleStateNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019550D0();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  return !sub_10075C270();
}

- (unint64_t)syncgetVehicularDndState
{
  return *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 143);
}

- (unint64_t)syncgetVehicularDndHints
{
  return *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 145);
}

- (unint64_t)syncgetVehicularDndOperatorState
{
  return *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 146);
}

- (void)resetVehicularFalsePositiveSuppressionDnd
{
  sub_10144A490((uint64_t)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
}

- (void)fetchVehicularFalsePositiveSuppressionStatusWithReply:(id)a3
{
  uint64_t v4;

  v4 = sub_10012409C((uint64_t)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)fetchVehicularDndStateAndHintsWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 143), *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 145));
}

- (void)fetchVehicularDndOperatorStateWithReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 146));
}

- (void)fetchVehicularDndStateAndHintsAndOperatorStateWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 143), *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 145), *((_QWORD *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 146));
}

@end
