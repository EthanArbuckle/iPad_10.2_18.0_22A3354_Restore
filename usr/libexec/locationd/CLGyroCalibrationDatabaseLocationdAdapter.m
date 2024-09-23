@implementation CLGyroCalibrationDatabaseLocationdAdapter

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee"));
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
  if (qword_102303028 != -1)
    dispatch_once(&qword_102303028, &stru_102148558);
  return (id)qword_102303020;
}

- (CLGyroCalibrationDatabaseLocationdAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGyroCalibrationDatabaseLocationdAdapter;
  return -[CLGyroCalibrationDatabaseLocationdAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGyroCalibrationDatabaseProtocol, &OBJC_PROTOCOL___CLGyroCalibrationDatabaseClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1018B3F48((uint64_t)-[CLGyroCalibrationDatabaseLocationdAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101901DB0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102303038 != -1)
    dispatch_once(&qword_102303038, &stru_102148578);
  return byte_102303030;
}

- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10
{
  _BOOL8 v12;
  void *v17;
  int v18;
  void *v19;

  v12 = a6;
  v17 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  v18 = (*(uint64_t (**)(void *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, _BOOL8))(*(_QWORD *)v17 + 256))(v17, a3, a4, a5, v12);
  if (v18)
  {
    v19 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
    LOBYTE(v18) = (*(uint64_t (**)(void *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, BOOL))(*(_QWORD *)v19 + 256))(v19, a7, a8, a9, a10);
  }
  return v18;
}

- (int)syncgetMaxDynamicTemperature
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 264))(v2);
}

- (void)startFactoryGYTT
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(_QWORD *)v2 + 248))(v2);
}

- (BOOL)syncgetBiasFit:(id *)a3
{
  void *v4;

  v4 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, $91D97E04BD10290E371D52D4FB998ED7 *))(*(_QWORD *)v4 + 216))(v4, a3);
}

- (void)getBiasFitWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  _BYTE v6[320];
  _OWORD __src[20];

  memset(__src, 0, sizeof(__src));
  v4 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  v5 = (*(uint64_t (**)(void *, _OWORD *))(*(_QWORD *)v4 + 216))(v4, __src);
  memcpy(v6, __src, sizeof(v6));
  (*((void (**)(id, uint64_t, _BYTE *))a3 + 2))(a3, v5, v6);
}

- (int)syncgetNonFactoryRoundCount
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 296))(v2);
}

- (BOOL)syncgetSupportsMiniCalibration
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 272))(v2);
}

- (double)syncgetLastMiniCalibration
{
  void *v2;
  double v4;

  v4 = 0.0;
  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, double *))(*(_QWORD *)v2 + 288))(v2, &v4);
  return v4;
}

- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6
{
  void *v10;

  v10 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *, const $E2C29196C7A5C696474C6955C5A9CE06 *, const $E2C29196C7A5C696474C6955C5A9CE06 *, float, double))(*(_QWORD *)v10 + 208))(v10, a3, a4, a5, a6);
}

- (void)dumpDatabase:(id)a3 onCompletion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  v7 = (*(uint64_t (**)(void *, id))(*(_QWORD *)v6 + 224))(v6, a3);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v7);
}

- (BOOL)syncgetWipeDatabase
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 232))(v2);
}

- (int)syncgetNumTemperatures
{
  void *v2;

  v2 = -[CLGyroCalibrationDatabaseLocationdAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 240))(v2);
}

@end
