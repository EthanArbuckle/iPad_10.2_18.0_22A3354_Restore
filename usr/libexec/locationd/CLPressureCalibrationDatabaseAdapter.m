@implementation CLPressureCalibrationDatabaseAdapter

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
  if (qword_1023073E0 != -1)
    dispatch_once(&qword_1023073E0, &stru_10217B950);
  return (id)qword_1023073D8;
}

- (CLPressureCalibrationDatabaseAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPressureCalibrationDatabaseAdapter;
  return -[CLPressureCalibrationDatabaseAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPressureCalibrationDatabaseProtocol, &OBJC_PROTOCOL___CLPressureCalibrationDatabaseClientProtocol);
}

- (void)beginService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100C512D4((uint64_t)-[CLPressureCalibrationDatabaseAdapter universe](self, "universe"));
  if (v3)
    v4 = v3 + 16;
  else
    v4 = 0;
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", v4);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v5 = sub_101923AA0();
    sub_100C512D4(v5);
  }
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPressureCalibrationDatabaseAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPressureCalibrationDatabaseAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPressureCalibrationDatabaseAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1023073F0 != -1)
    dispatch_once(&qword_1023073F0, &stru_10217B970);
  return byte_1023073E8;
}

@end
