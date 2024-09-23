@implementation CLFenceManagerAdapter

- (BOOL)syncgetFences:(void *)a3 forKey:(id)a4
{
  void *v6;
  void *__p[2];
  char v9;

  v6 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_100042F58((uint64_t)v6 + 112, (uint64_t)__p, (uint64_t *)a3);
  if (v9 < 0)
    operator delete(__p[0]);
  return 1;
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (BOOL)isSupported
{
  if (qword_1023057D8 != -1)
    dispatch_once(&qword_1023057D8, &stru_10215E708);
  return byte_1023057D0;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_1023057C8 != -1)
    dispatch_once(&qword_1023057C8, &stru_10215E6E8);
  return (id)qword_1023057C0;
}

- (CLFenceManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceManagerAdapter;
  return -[CLFenceManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFenceManagerProtocol, &OBJC_PROTOCOL___CLFenceManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10090E488((uint64_t)-[CLFenceManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10190ECA8();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFenceManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFenceManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLFenceManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)addFence:(id)a3
{
  uint64_t *v4;
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  void *__p;
  void *v15;

  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_10090E674(v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(v5[0]);
}

- (void)removeFence:(id)a3
{
  void *v4;
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  void *__p;
  void *v15;

  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_10091031C((uint64_t)v4, (__int128 *)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(v5[0]);
}

- (void)requestRegionState:(id)a3
{
  void *v4;
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  void *__p;
  void *v15;

  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_100910634((uint64_t)v4, (uint64_t)v5);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(v5[0]);
}

- (void)requestChangeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4
{
  sub_100D3F7CC((uint64_t)-[CLFenceManagerAdapter adaptee](self, "adaptee") + 112, a3, a4);
}

- (BOOL)syncgetHasMonitoredFences:(id)a3
{
  void *v4;
  char v5;
  void *__p;
  char v8;

  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  v5 = sub_100D406BC((uint64_t)v4 + 112);
  if (v8 < 0)
    operator delete(__p);
  return v5;
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  int v9;
  int v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  _OWORD v21[8];
  _OWORD v22[2];
  const void *v23[2];
  char v24;
  void *v25[2];
  char v26;

  if (a5 == 1)
    v9 = 1;
  else
    v9 = -1;
  if (a5)
    v10 = v9;
  else
    v10 = 0;
  v11 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v25, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(v23, (char *)objc_msgSend(a4, "UTF8String"));
  if (a6)
  {
    objc_msgSend(a6, "clientLocation");
  }
  else
  {
    v19 = 0u;
    memset(v20, 0, 28);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v21[6] = v18;
  v21[7] = v19;
  v22[0] = v20[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v20 + 12);
  v21[2] = v14;
  v21[3] = v15;
  v21[4] = v16;
  v21[5] = v17;
  v21[0] = v12;
  v21[1] = v13;
  sub_1009111AC((uint64_t)v11, (uint64_t)v25, v23, v10, v21);
  if (v24 < 0)
    operator delete((void *)v23[0]);
  if (v26 < 0)
    operator delete(v25[0]);
}

- (void)setIsSimulatingLocation:(BOOL)a3
{
  _BYTE *v4;

  v4 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  v4[3810] = a3;
  sub_100D16FBC((uint64_t)(v4 + 344), a3);
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
  void *v6;
  void *__p[2];
  char v8;

  v6 = -[CLFenceManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100911650((uint64_t)v6, (uint64_t)__p, (uint64_t)a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

@end
