@implementation CLStatusBarIconManagerAdapter

- (void)entityClass:(unsigned int)a3 didChangeArrowState:(unint64_t)a4 dueToDeauthorization:(BOOL)a5
{
  sub_1000913F4((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"), a3, a4, a5);
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
  if (qword_102308B18 != -1)
    dispatch_once(&qword_102308B18, &stru_10218B510);
  return (id)qword_102308B10;
}

- (CLStatusBarIconManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStatusBarIconManagerAdapter;
  return -[CLStatusBarIconManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLStatusBarIconManagerProtocol, &OBJC_PROTOCOL___CLStatusBarIconManagerClientProtocol);
}

- (void)beginService
{
  -[CLStatusBarIconManagerAdapter universe](self, "universe");
  sub_100E428B0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

+ (BOOL)isSupported
{
  return 1;
}

- (int)syncgetIconState
{
  return sub_100E42950((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetStatusBarIconForEntityClass:(int)a3
{
  return sub_100E42C34((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"), a3);
}

- (void)setStatusBarIconForEntityClass:(int)a3 visible:(BOOL)a4
{
  sub_100E42CC0((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"), a3, a4);
}

- (void)setE911Active:(BOOL)a3
{
  sub_100E42D2C((uint64_t)-[CLStatusBarIconManagerAdapter adaptee](self, "adaptee"), a3);
}

@end
