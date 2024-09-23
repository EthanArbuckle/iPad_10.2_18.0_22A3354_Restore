@implementation CLPipelineLocationProviderAdapter

- (void)onOutdoorUpdate:(id)a3
{
  uint64_t *v4;
  std::chrono::steady_clock::time_point v5;
  _QWORD v6[7];

  v4 = -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v6, a3);
  v5.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  sub_10008D5A4(v4[18], v5.__d_.__rep_, (uint64_t)v6);
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
  if (qword_10230D210 != -1)
    dispatch_once(&qword_10230D210, &stru_1021A4708);
  return (id)qword_10230D208;
}

+ (BOOL)isSupported
{
  unsigned __int8 v2;
  int v4;

  v2 = atomic_load((unsigned __int8 *)&qword_10230D220);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_10230D220))
  {
    v4 = sub_10118DC54();
    if (v4)
      LOBYTE(v4) = sub_100762064();
    byte_10230D218 = v4;
    __cxa_guard_release(&qword_10230D220);
  }
  return byte_10230D218;
}

- (CLPipelineLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPipelineLocationProviderAdapter;
  return -[CLPipelineLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPipelineLocationProviderProtocol, &OBJC_PROTOCOL___CLPipelineLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10118349C((uint64_t)-[CLPipelineLocationProviderAdapter universe](self, "universe"), (uint64_t)self));
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  uint64_t *v4;

  v4 = -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee");
  std::chrono::steady_clock::now();
  sub_100253868(v4[18]);
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  uint64_t *v5;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep;

  v5 = -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee", a3, a4);
  rep = std::chrono::steady_clock::now().__d_.__rep_;
  sub_1002538C0(v5[18], rep, (uint64_t)a3);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  uint64_t *v5;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep;

  v5 = -[CLPipelineLocationProviderAdapter adaptee](self, "adaptee", a3, a4);
  rep = std::chrono::steady_clock::now().__d_.__rep_;
  sub_100253908(v5[18], rep, (uint64_t)a3);
}

@end
