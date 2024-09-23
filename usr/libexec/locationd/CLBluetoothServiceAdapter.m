@implementation CLBluetoothServiceAdapter

- (void)fetchHasConnectedDevicesWithReply:(id)a3
{
  (*((void (**)(id, BOOL))a3 + 2))(a3, *((_QWORD *)-[CLBluetoothServiceAdapter adaptee](self, "adaptee") + 19) != 0);
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
  if (qword_102307318 != -1)
    dispatch_once(&qword_102307318, &stru_102179D10);
  return (id)qword_102307310;
}

- (CLBluetoothServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBluetoothServiceAdapter;
  return -[CLBluetoothServiceAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBluetoothServiceProtocol, &OBJC_PROTOCOL___CLBluetoothServiceClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100C0A1E4((uint64_t)-[CLBluetoothServiceAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101921B68();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBluetoothServiceAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBluetoothServiceAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLBluetoothServiceAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102307328 != -1)
    dispatch_once(&qword_102307328, &stru_102179D30);
  return byte_102307320;
}

- (void)clearAFHSettings
{
  sub_100C0A38C((uint64_t)-[CLBluetoothServiceAdapter adaptee](self, "adaptee"));
}

- (void)setAFHChannelAvoidance:(id)a3
{
  sub_100C0A58C((uint64_t)-[CLBluetoothServiceAdapter adaptee](self, "adaptee"), (int *)objc_msgSend(a3, "bytes"), (unint64_t)objc_msgSend(a3, "length") >> 2);
}

- (BOOL)syncgetHasConnectedDevices
{
  return *((_QWORD *)-[CLBluetoothServiceAdapter adaptee](self, "adaptee") + 19) != 0;
}

- (void)scan
{
  sub_100C0A628((uint64_t)-[CLBluetoothServiceAdapter adaptee](self, "adaptee"));
}

- (void)fetchIsBluetoothPoweredWithReply:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, *((unsigned __int8 *)-[CLBluetoothServiceAdapter adaptee](self, "adaptee") + 109));
}

@end
