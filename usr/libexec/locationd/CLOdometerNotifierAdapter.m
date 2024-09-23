@implementation CLOdometerNotifierAdapter

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
  if (qword_102301668 != -1)
    dispatch_once(&qword_102301668, &stru_102140050);
  return (id)qword_102301660;
}

- (CLOdometerNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLOdometerNotifierAdapter;
  return -[CLOdometerNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLOdometerNotifierProtocol, &OBJC_PROTOCOL___CLOdometerNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1004F92DC((uint64_t)-[CLOdometerNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1018FCF6C();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOdometerNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOdometerNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLOdometerNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102301678 != -1)
    dispatch_once(&qword_102301678, &stru_102140070);
  return byte_102301670;
}

- (void)querySignificantElevationDeltaFromDate:(id)a3 toDate:(id)a4 withReply:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v8 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee", 0, 0, 0);
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  sub_1004F95C0((uint64_t)v8, (uint64_t)&v13, v10, v11);
  if (*((double *)&v14 + 1) == -1.0)
  {
    (*((void (**)(id, _QWORD, double))a5 + 2))(a5, 0, *((double *)&v14 + 1));
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)CMSignificantElevationSample), "initWithSignificantElevation:", &v13);
    (*((void (**)(id, id))a5 + 2))(a5, v12);

  }
}

- (void)updatePhoneWorkoutElevationSubscription:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, _BOOL8))(*(_QWORD *)v4 + 208))(v4, v3);
}

- (void)registerForCyclingWorkoutDistanceUpdates:(id)a3
{
  void *v4;

  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(_QWORD *)v4 + 216))(v4, a3);
}

- (void)unregisterForCyclingWorkoutDistanceUpdates:(id)a3
{
  void *v4;

  v4 = -[CLOdometerNotifierAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id))(*(_QWORD *)v4 + 224))(v4, a3);
}

@end
