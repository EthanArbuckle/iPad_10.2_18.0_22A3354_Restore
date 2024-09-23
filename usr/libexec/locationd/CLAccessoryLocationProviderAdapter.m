@implementation CLAccessoryLocationProviderAdapter

- (void)fetchIsAccessoryConnectedWithReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, *((unsigned __int8 *)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee") + 1362));
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
  if (qword_102303BB8 != -1)
    dispatch_once(&qword_102303BB8, &stru_102150480);
  return (id)qword_102303BB0;
}

- (CLAccessoryLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAccessoryLocationProviderAdapter;
  return -[CLAccessoryLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAccessoryLocationProviderProtocol, &OBJC_PROTOCOL___CLAccessoryLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10072DEBC((uint64_t)-[CLAccessoryLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1019071E0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchAccessoryBitSetWithReply:(id)a3
{
  uint64_t v4;

  v4 = sub_10072E01C((uint64_t)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"), 1);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)fetchAccessoryPASCDTransmissionStateWithReply:(id)a3
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;

  HIDWORD(v5) = *((_DWORD *)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee") + 248);
  LODWORD(v5) = HIDWORD(v5) - 68;
  v4 = v5 >> 1;
  if (v4 > 7)
    v6 = 4;
  else
    v6 = dword_101BBF3C8[v4];
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)syncSetNavigationStateChange:(int)a3
{
  if (-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"))
    sub_10072E25C((uint64_t)-[CLAccessoryLocationProviderAdapter adaptee](self, "adaptee"), a3);
}

- (id)syncgetConnectedAccessory
{
  return objc_msgSend((id)qword_102303BC0, "activeAccessory");
}

+ (BOOL)isSupported
{
  if (qword_102303BD0 != -1)
    dispatch_once(&qword_102303BD0, &stru_1021504A0);
  return byte_102303BC8;
}

@end
