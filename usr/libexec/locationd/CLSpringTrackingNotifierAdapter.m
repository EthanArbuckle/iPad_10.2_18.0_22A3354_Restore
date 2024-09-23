@implementation CLSpringTrackingNotifierAdapter

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
  if (qword_10230DA68 != -1)
    dispatch_once(&qword_10230DA68, &stru_1021AB380);
  return (id)qword_10230DA60;
}

- (CLSpringTrackingNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSpringTrackingNotifierAdapter;
  return -[CLSpringTrackingNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSpringTrackingNotifierProtocol, &OBJC_PROTOCOL___CLSpringTrackingNotifierClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1012696E0((uint64_t)-[CLSpringTrackingNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101948A74();
    sub_1012696E0(v3);
  }
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetIsTracking
{
  return *((_QWORD *)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee") + 26) != 0;
}

- (int)syncgetStartTracking
{
  return sub_101269874((uint64_t)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
}

- (int)syncgetStopTracking
{
  sub_101269AE0((uint64_t)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"));
  return 100;
}

- (void)querySinceRecord:(CLSpringTrackerEntry *)a3 withReply:(id)a4
{
  NSMutableArray *v5;
  _OWORD *v6;
  _BYTE *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  void *__p;
  _BYTE *v13;
  _OWORD v14[3];
  uint64_t v15;

  if (!a4)
  {
    sub_101948BE8(self, a2, a3);
    __break(1u);
  }
  sub_101269DD4((uint64_t)-[CLSpringTrackingNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3, &__p);
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v13 - (_BYTE *)__p) >> 3));
  v6 = __p;
  v7 = v13;
  if (__p != v13)
  {
    do
    {
      v8 = *v6;
      v9 = v6[1];
      v10 = v6[2];
      v15 = *((_QWORD *)v6 + 6);
      v14[1] = v9;
      v14[2] = v10;
      v14[0] = v8;
      v11 = objc_msgSend(objc_alloc((Class)CMSleepData), "initWithSpringEntry:", v14);
      -[NSMutableArray addObject:](v5, "addObject:", v11);

      v6 = (_OWORD *)((char *)v6 + 56);
    }
    while (v6 != (_OWORD *)v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
}

+ (BOOL)isSupported
{
  if (qword_10230DA78 != -1)
    dispatch_once(&qword_10230DA78, &stru_1021AB3A0);
  return byte_10230DA70;
}

@end
