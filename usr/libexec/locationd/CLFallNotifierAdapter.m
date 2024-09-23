@implementation CLFallNotifierAdapter

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
  if (qword_1023063D0 != -1)
    dispatch_once(&qword_1023063D0, &stru_102165988);
  return (id)qword_1023063C8;
}

- (CLFallNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFallNotifierAdapter;
  return -[CLFallNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFallNotifierProtocol, &OBJC_PROTOCOL___CLFallNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100A10D8C((uint64_t)-[CLFallNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101916FE8();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFallNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFallNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFallNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_1023063E0 != -1)
    dispatch_once(&qword_1023063E0, &stru_1021659A8);
  return byte_1023063D8;
}

- (void)simulateEvent:(unint64_t)a3
{
  sub_100A10FA4((uint64_t)-[CLFallNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (void)setHgalCaptureMode:(unsigned __int8)a3
{
  sub_100A11180((uint64_t)-[CLFallNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (void)onClientAnomalyEventSubscriptionRequest:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[11];
  __int128 v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  int32x4_t v19;
  int v20;
  __int16 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  CFAbsoluteTime Current;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;

  if (a3)
  {
    *(_DWORD *)v8 = 0;
    v9 = xmmword_101C03A70;
    v10 = 0xFF7FFFFF7F7FFFFFLL;
    v11 = -8388609;
    v12 = 0;
    v13 = 0x7F7FFFFF00000000;
    v14 = 2139095039;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
    v19 = vdupq_n_s32(0x7F7FFFFFu);
    v20 = -8388609;
    v21 = 1;
    v28 = 0;
    v27 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a3, "absoluteTimestamp", 0, 0, *(_QWORD *)v8);
    v26 = v5;
    *(_QWORD *)&v8[3] = objc_msgSend(a3, "identifier");
    BYTE5(v7) = objc_msgSend(a3, "state");
    v23 = objc_msgSend(a3, "response");
    v24 = objc_msgSend(a3, "resolution");
    v29 = objc_msgSend(a3, "sosState");
    v22 = objc_msgSend(a3, "operatingMode");
    sub_100A11450((uint64_t)-[CLFallNotifierAdapter adaptee](self, "adaptee"), (uint64_t)&v6);
  }
}

@end
