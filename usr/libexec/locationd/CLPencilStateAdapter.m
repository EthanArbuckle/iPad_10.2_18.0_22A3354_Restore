@implementation CLPencilStateAdapter

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
  if (qword_10230C8E0 != -1)
    dispatch_once(&qword_10230C8E0, &stru_1021A20C8);
  return (id)qword_10230C8D8;
}

- (CLPencilStateAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPencilStateAdapter;
  return -[CLPencilStateAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPencilStateProtocol, &OBJC_PROTOCOL___CLPencilStateClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1011271A8((uint64_t)-[CLPencilStateAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193F50C();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPencilStateAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPencilStateAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLPencilStateAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10230C8F0 != -1)
    dispatch_once(&qword_10230C8F0, &stru_1021A20E8);
  return byte_10230C8E8;
}

- (CLPencilStateAdapter)initWithPencilState:(void *)a3
{
  CLPencilStateAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLPencilStateAdapter;
  result = -[CLNotifierServiceAdapter init](&v5, "init");
  if (result)
    result->_pencilState = a3;
  return result;
}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  _QWORD *pencilState;
  void *v8;
  _QWORD v9[5];
  char v10;

  pencilState = self->_pencilState;
  v8 = (void *)pencilState[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1011279F4;
  v9[3] = &unk_1021468D0;
  v9[4] = pencilState;
  v10 = 1;
  objc_msgSend(v8, "async:", v9, a4, a5, a6, a7);
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  _QWORD *pencilState;
  void *v6;
  _QWORD v7[5];
  char v8;

  pencilState = self->_pencilState;
  v6 = (void *)pencilState[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1011279F4;
  v7[3] = &unk_1021468D0;
  v7[4] = pencilState;
  v8 = 0;
  objc_msgSend(v6, "async:", v7, a4, a5);
}

@end
