@implementation CLFitnessMachineNotifierAdapter

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
  if (qword_10230C4C0 != -1)
    dispatch_once(&qword_10230C4C0, &stru_10219FBD0);
  return (id)qword_10230C4B8;
}

- (CLFitnessMachineNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFitnessMachineNotifierAdapter;
  return -[CLFitnessMachineNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFitnessMachineNotifierProtocol, &OBJC_PROTOCOL___CLFitnessMachineNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1010C443C((uint64_t)-[CLFitnessMachineNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193E198();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFitnessMachineNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFitnessMachineNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFitnessMachineNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)feedFitnessMachineData:(id)a3
{
  void *v4;
  _OWORD v5[10];
  uint64_t v6;
  _OWORD v7[10];
  uint64_t v8;

  objc_msgSend(a3, "convertToCLFitnessMachineData:deviceId:", v7, 0);
  v4 = -[CLFitnessMachineNotifierAdapter adaptee](self, "adaptee");
  v5[8] = v7[8];
  v5[9] = v7[9];
  v6 = v8;
  v5[4] = v7[4];
  v5[5] = v7[5];
  v5[6] = v7[6];
  v5[7] = v7[7];
  v5[0] = v7[0];
  v5[1] = v7[1];
  v5[2] = v7[2];
  v5[3] = v7[3];
  sub_1010C4620((uint64_t)v4, (uint64_t)v5);
}

+ (BOOL)isSupported
{
  if (qword_10230C4D0 != -1)
    dispatch_once(&qword_10230C4D0, &stru_10219FBF0);
  return byte_10230C4C8;
}

@end
