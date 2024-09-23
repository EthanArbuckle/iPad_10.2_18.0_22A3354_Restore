@implementation CLMagneticAccessoryAdapter

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
  if (qword_102307B38 != -1)
    dispatch_once(&qword_102307B38, &stru_10217E9E8);
  return (id)qword_102307B30;
}

- (CLMagneticAccessoryAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMagneticAccessoryAdapter;
  return -[CLMagneticAccessoryAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMagneticAccessoryProtocol, &OBJC_PROTOCOL___CLMagneticAccessoryClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100CE2E64((uint64_t)-[CLMagneticAccessoryAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019257A8();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMagneticAccessoryAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMagneticAccessoryAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMagneticAccessoryAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102307B48 != -1)
    dispatch_once(&qword_102307B48, &stru_10217EA08);
  return byte_102307B40;
}

- (CLMagneticAccessoryAdapter)initWithMagneticAccessory:(void *)a3
{
  CLMagneticAccessoryAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMagneticAccessoryAdapter;
  result = -[CLNotifierServiceAdapter init](&v5, "init");
  if (result)
    result->_magneticAccessory = a3;
  return result;
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  sub_100CE30CC((uint64_t **)self->_magneticAccessory, 0, a4, 0);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  sub_100CE30CC((uint64_t **)self->_magneticAccessory, 1, a7, a6);
}

@end
