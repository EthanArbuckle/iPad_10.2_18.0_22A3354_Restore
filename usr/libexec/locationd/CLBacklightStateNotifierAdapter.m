@implementation CLBacklightStateNotifierAdapter

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
  if (qword_102304EF8 != -1)
    dispatch_once(&qword_102304EF8, &stru_102158080);
  return (id)qword_102304EF0;
}

- (CLBacklightStateNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBacklightStateNotifierAdapter;
  return -[CLBacklightStateNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBacklightStateNotifierProtocol, &OBJC_PROTOCOL___CLBacklightStateNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100865A40((uint64_t)-[CLBacklightStateNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10190CE20();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBacklightStateNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBacklightStateNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBacklightStateNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (CLBacklightStateNotifierAdapter)initWithCLBacklightStateNotifier:(void *)a3
{
  CLBacklightStateNotifierAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLBacklightStateNotifierAdapter;
  result = -[CLNotifierServiceAdapter init](&v5, "init");
  if (result)
    result->_backlightStateNotifier = a3;
  return result;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  int v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *backlightStateNotifier;
  void *__p[2];
  char v15;
  void *v16[2];
  char v17;

  v6 = a4;
  v8 = objc_msgSend(objc_msgSend(a5, "changeRequest", a3), "sourceEventMetadata");
  v10 = objc_opt_class(BLSBacklightChangeSourceEventSuppressionMetadata, v9);
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v11 = (void *)NSStringFromBLSBacklightChangeSourceEvent(objc_msgSend(objc_msgSend(a5, "changeRequest"), "sourceEvent"));
  if (v8 && (objc_msgSend(v8, "type") == (id)1 || objc_msgSend(v8, "type") == (id)2))
    v12 = (__CFString *)NSStringFromBLSAlwaysOnSuppressionReason(objc_msgSend(v8, "reason"));
  else
    v12 = &stru_1021D8FB8;
  backlightStateNotifier = self->_backlightStateNotifier;
  sub_1015A2E04(v16, (char *)objc_msgSend(v11, "UTF8String"));
  sub_1015A2E04(__p, (char *)-[__CFString UTF8String](v12, "UTF8String"));
  sub_100865D50((uint64_t)backlightStateNotifier, v6, (__int128 *)v16, (uint64_t)__p);
  if (v15 < 0)
    operator delete(__p[0]);
  if (v17 < 0)
    operator delete(v16[0]);
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  _QWORD *backlightStateNotifier;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  backlightStateNotifier = self->_backlightStateNotifier;
  v5 = (void *)backlightStateNotifier[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100866544;
  v6[3] = &unk_1021468D0;
  v6[4] = backlightStateNotifier;
  v7 = a4;
  objc_msgSend(v5, "async:", v6);
}

@end
