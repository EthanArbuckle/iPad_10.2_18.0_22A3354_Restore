@implementation CLGeomagneticModelProviderLocationdAdapter

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
  if (qword_102308100 != -1)
    dispatch_once(&qword_102308100, &stru_102183480);
  return (id)qword_1023080F8;
}

- (CLGeomagneticModelProviderLocationdAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGeomagneticModelProviderLocationdAdapter;
  return -[CLGeomagneticModelProviderLocationdAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGeomagneticModelProviderProtocol, &OBJC_PROTOCOL___CLGeomagneticModelProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1018D7D14((uint64_t)-[CLGeomagneticModelProviderLocationdAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019297C4();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGeomagneticModelProviderLocationdAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGeomagneticModelProviderLocationdAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLGeomagneticModelProviderLocationdAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchGeomagneticModelData:(id)a3
{
  _QWORD v4[8];

  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)-[CLGeomagneticModelProviderLocationdAdapter adaptee](self, "adaptee")+ 208))(v4);
  (*((void (**)(id, _QWORD *))a3 + 2))(a3, v4);
}

@end
