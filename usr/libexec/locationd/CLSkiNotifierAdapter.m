@implementation CLSkiNotifierAdapter

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
  if (qword_102308900 != -1)
    dispatch_once(&qword_102308900, &stru_102188740);
  return (id)qword_1023088F8;
}

- (CLSkiNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSkiNotifierAdapter;
  return -[CLSkiNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSkiNotifierProtocol, &OBJC_PROTOCOL___CLSkiNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100CF9E04((uint64_t)-[CLSkiNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10192B2E8();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSkiNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSkiNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSkiNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)queryUsingRecord:(CLSkiEntry *)a3 withReply:(id)a4
{
  NSMutableArray *v5;
  char *v6;
  char *v7;
  id v8;
  void *__p;
  char *v10;

  sub_100CFAB8C((uint64_t)-[CLSkiNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3, (uint64_t)&__p);
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v10 - (_BYTE *)__p) >> 5));
  v6 = (char *)__p;
  v7 = v10;
  if (__p != v10)
  {
    do
    {
      v8 = objc_msgSend(objc_alloc((Class)CMSkiData), "initWithSkiEntry:", v6);
      -[NSMutableArray addObject:](v5, "addObject:", v8);

      v6 += 96;
    }
    while (v6 != v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v10 = (char *)__p;
    operator delete(__p);
  }
}

+ (BOOL)isSupported
{
  if (qword_102308910 != -1)
    dispatch_once(&qword_102308910, &stru_102188760);
  return byte_102308908;
}

@end
