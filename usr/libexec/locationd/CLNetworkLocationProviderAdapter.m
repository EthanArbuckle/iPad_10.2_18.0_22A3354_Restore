@implementation CLNetworkLocationProviderAdapter

- (BOOL)syncgetIsBroadConnection
{
  return sub_100026624(-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)resetRetryCounters:(id)a3
{
  sub_100044A24((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t)objc_msgSend(a3, "UTF8String"));
}

- (int)syncgetBestMatchLocation:(CLDaemonLocation *)a3 forCell:(const void *)a4
{
  return sub_1000948A8((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (unsigned int *)a4, (uint64_t)a3);
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

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_102303B40 != -1)
    dispatch_once(&qword_102303B40, &stru_10214FDA8);
  return (id)qword_102303B38;
}

- (CLNetworkLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNetworkLocationProviderAdapter;
  return -[CLNetworkLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLNetworkLocationProviderProtocol, &OBJC_PROTOCOL___CLNetworkLocationProviderClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1006FA4F0((uint64_t)-[CLNetworkLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_1019062EC();
    sub_1006FA4F0(v3);
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)setLocation_GSM:(id)a3 forCell:(id)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[4];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v14 = 0u;
    memset(v15, 0, 28);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(_QWORD *)&v15[1], *((_QWORD *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(_QWORD *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006FA6E0((uint64_t)v6);
}

- (void)setLocation_SCDMA:(id)a3 forCell:(id)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[4];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v14 = 0u;
    memset(v15, 0, 28);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(_QWORD *)&v15[1], *((_QWORD *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(_QWORD *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006FADFC((uint64_t)v6);
}

- (void)setLocation_CDMA:(id)a3 forCell:(id)a4
{
  void *v6;
  void *v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v14 = 0u;
    memset(v15, 0, 28);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    *(_OWORD *)v7 = 0u;
  }
  v22 = v13;
  v23 = v14;
  v24[0] = v15[0];
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)((char *)v15 + 12);
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v16 = *(_OWORD *)v7;
  v17 = v8;
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7[0]);
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v7, a4);
  sub_1006FB548((uint64_t)v6, (uint64_t)v7);
}

- (void)setLocation_LTE:(id)a3 forCell:(id)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[4];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v14 = 0u;
    memset(v15, 0, 28);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(_QWORD *)&v15[1], *((_QWORD *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(_QWORD *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006FBDD8((uint64_t)v6);
}

- (void)setLocation_NR:(id)a3 forCell:(id)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[4];

  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v14 = 0u;
    memset(v15, 0, 28);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  LODWORD(v16[1]) = DWORD2(v15[0]);
  *(_OWORD *)((char *)&v16[1] + 4) = *(_OWORD *)((char *)v15 + 12);
  v6 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee", v7, v8, v9, v10, v11, v12, v13, v14, v15[0], *(_QWORD *)&v15[1], *((_QWORD *)&v15[1] + 1), v7, v8, v9, v10, v11, v12,
         v13,
         v14,
         *(_QWORD *)&v15[0],
         v16[1],
         (unint64_t)(*(_OWORD *)((char *)v15 + 12) >> 32),
         v16[3]);
  (*((void (**)(__int128 *__return_ptr, id))a4 + 2))(&v7, a4);
  sub_1006FC610((uint64_t)v6);
}

- (void)setPrivateMode:(BOOL)a3
{
  *((_BYTE *)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 456) = a3;
}

- (BOOL)syncgetMetric:(void *)a3
{
  sub_1006FCDD4((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t)a3);
  return 1;
}

- (int)syncgetQueryNearbys:(const CLDaemonLocation *)a3 forFenceKeys:(const void *)a4
{
  return sub_1006FD028((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t)a3, (uint64_t)a4);
}

- (void)setCurrentReachability:(int)a3
{
  uint64_t v3;
  _QWORD **v4;

  v3 = *(_QWORD *)&a3;
  v4 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *, uint64_t))(*v4[56] + 32))(v4[56], v3);
}

- (void)addResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  CLNetworkLocationServerResponseListener *v3;

  v3 = a3;
  sub_100210524((uint64_t **)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 73, (unint64_t *)&v3, (uint64_t *)&v3);
}

- (void)removeResponseListener:(CLNetworkLocationServerResponseListener *)a3
{
  CLNetworkLocationServerResponseListener *v3;

  v3 = a3;
  sub_10071E360((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee") + 584, (unint64_t *)&v3);
}

- (int)syncgetQueryLocationsForCells:(const void *)a3 useCache:(BOOL)a4
{
  return sub_1006FD5EC((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t *)a3, a4);
}

- (int)syncgetQueryLocationsForWifis:(const void *)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(const CLNetworkLocationRequestConfig *)a6
{
  return sub_100708BF8((uint64_t)-[CLNetworkLocationProviderAdapter adaptee](self, "adaptee"), &qword_102310B98, &qword_102310BC8, &qword_102310BB0, &qword_102310BE0, &qword_102310BF8, (uint64_t **)a3, a4, a5, (uint64_t)a6);
}

- (void)fetchQueryLocationsForWifis:(id)a3 useCache:(BOOL)a4 piggyback:(BOOL)a5 config:(id)a6 withReply:(id)a7
{
  _BOOL4 v10;
  void *v12;
  uint64_t v13;
  int v14;
  void *__p[3];

  v10 = a4;
  v12 = -[CLNetworkLocationProviderAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(__p, a3);
  v14 = (*((uint64_t (**)(id))a6 + 2))(a6);
  v13 = sub_100708BF8((uint64_t)v12, &qword_102310B98, &qword_102310BC8, &qword_102310BB0, &qword_102310BE0, &qword_102310BF8, (uint64_t **)__p, v10, a5, (uint64_t)&v14);
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v13);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end
