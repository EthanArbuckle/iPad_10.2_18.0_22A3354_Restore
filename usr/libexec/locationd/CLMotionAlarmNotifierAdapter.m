@implementation CLMotionAlarmNotifierAdapter

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
  if (qword_102305B40 != -1)
    dispatch_once(&qword_102305B40, &stru_102161798);
  return (id)qword_102305B38;
}

- (CLMotionAlarmNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionAlarmNotifierAdapter;
  return -[CLMotionAlarmNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionAlarmNotifierProtocol, &OBJC_PROTOCOL___CLMotionAlarmNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1009917B0((uint64_t)-[CLMotionAlarmNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101910C18();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  return ((unint64_t)sub_1001B7910() >> 1) & 1;
}

- (void)registerClient:(id)a3 adapter:(id)a4 systemClient:(BOOL)a5
{
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  sub_100991A08((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), (__int128 *)v7, (uint64_t)a4);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
}

- (void)unregisterClient:(id)a3 systemClient:(BOOL)a4
{
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *__p;
  char v18;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  sub_1009920F4((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), (__int128 *)v5);
  if (v18 < 0)
    operator delete(__p);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(v5[0]);
}

- (void)registerAlarm:(id)a3 withReply:(id)a4
{
  sub_1009925E8((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (void)unregisterAlarm:(id)a3 withReply:(id)a4
{
  sub_100993548((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (void)acknowledgeAlarm:(id)a3 withReply:(id)a4
{
  sub_100993CB0((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (void)launchRemoteApplication:(id)a3 withReply:(id)a4
{
  sub_10099471C((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (void)onClassATimerActivity:(id)a3 withAlarmId:(unint64_t)a4
{
  sub_1009949AC((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), (xpc_activity_t)a3, a4);
}

- (void)onCardioChangeEvent
{
  sub_100995014((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"));
}

- (void)fireEventAlarm:(unsigned int)a3
{
  sub_100995568((uint64_t)-[CLMotionAlarmNotifierAdapter adaptee](self, "adaptee"), a3);
}

@end
