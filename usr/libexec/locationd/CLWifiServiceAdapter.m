@implementation CLWifiServiceAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (void)fetchScanResultWithReply:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[3];
  __int128 v8;
  __int128 v9;
  void **v10;

  v8 = 0u;
  v9 = 0u;
  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(_QWORD *)v4 + 224))(v4, (char *)&v8 + 8, &v8);
  v6 = v8;
  memset(v7, 0, sizeof(v7));
  sub_10055A7B8(v7, *((uint64_t *)&v8 + 1), v9, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v9 - *((_QWORD *)&v8 + 1)) >> 3));
  v5 = sub_1000ADC5C(&v6);
  (*((void (**)(id, id))a3 + 2))(a3, v5);
  v10 = (void **)v7;
  sub_100279AA4(&v10);
  v10 = (void **)&v8 + 1;
  sub_100279AA4(&v10);
}

- (id)syncgetScanResult
{
  void *v2;
  id v3;
  uint64_t v5;
  _QWORD v6[3];
  __int128 v7;
  __int128 v8;
  void **v9;

  v7 = 0u;
  v8 = 0u;
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(_QWORD *)v2 + 224))(v2, (char *)&v7 + 8, &v7);
  v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_10055A7B8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - *((_QWORD *)&v7 + 1)) >> 3));
  v3 = sub_1000ADC5C(&v5);
  v9 = (void **)v6;
  sub_100279AA4(&v9);
  v9 = (void **)&v7 + 1;
  sub_100279AA4(&v9);
  return v3;
}

- (void)fetchIsWifiAvailableWithReply:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  char v7;

  v7 = 0;
  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  v5 = (*(uint64_t (**)(void *, char *))(*(_QWORD *)v4 + 216))(v4, &v7);
  if (v7)
    v6 = v5;
  else
    v6 = 0;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)fetchIsAssociatedWithReply:(id)a3
{
  uint64_t v4;

  v4 = sub_1000C1E4C((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
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

+ (id)getSilo
{
  if (qword_102301D30 != -1)
    dispatch_once(&qword_102301D30, &stru_102146678);
  return (id)qword_102301D28;
}

- (CLWifiServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLWifiServiceAdapter;
  return -[CLWifiServiceAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWifiServiceProtocol, &OBJC_PROTOCOL___CLWifiServiceClientProtocol);
}

- (void)beginService
{
  CLWifiServiceAdapter *v3;
  SEL v4;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10103AEB0((uint64_t)-[CLWifiServiceAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = (CLWifiServiceAdapter *)sub_1019007AC();
    -[CLWifiServiceAdapter endService](v3, v4);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiServiceAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiServiceAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiServiceAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetIsAssociated
{
  return sub_1000C1E4C((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetIsWifiTrackingAvailable
{
  return *((_BYTE *)-[CLWifiServiceAdapter adaptee](self, "adaptee") + 376);
}

- (BOOL)syncgetIsWifiPowered
{
  void *v2;
  BOOL result;
  char v4;

  v4 = 0;
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  result = (*(uint64_t (**)(void *, char *))(*(_QWORD *)v2 + 216))(v2, &v4);
  if (!v4)
    return 0;
  return result;
}

- (BOOL)syncgetIsWifiPoweredWithStatus:(BOOL *)a3
{
  void *v4;
  BOOL v6;

  v6 = 0;
  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  *a3 = (*(uint64_t (**)(void *, BOOL *))(*(_QWORD *)v4 + 216))(v4, &v6);
  return v6;
}

- (BOOL)syncgetIsAvailable
{
  return sub_1005AB7B4((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetIsSimulationEnabled
{
  void *v2;

  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 208))(v2);
}

- (void)programEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  void *v6;
  void **v7[3];
  uint64_t v8[3];
  void ***v9;

  v6 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v8, a3);
  (*((void (**)(void ***__return_ptr, id))a4 + 2))(v7, a4);
  sub_1005AB8E0((uint64_t)v6, v8, (uint64_t *)v7);
  v9 = v7;
  sub_100279AA4((void ***)&v9);
  v7[0] = (void **)v8;
  sub_100279AA4(v7);
}

- (void)setEntryScanNetworks:(id)a3 andExitScanNetworks:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9[3];
  void **v10;

  v7 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a4 + 2))(v9, a4);
  sub_1005ABB40((uint64_t)v7, v9);
  v10 = (void **)v9;
  sub_100279AA4(&v10);
  v8 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v9, a3);
  sub_1005ABBEC((uint64_t)v8, v9);
  v10 = (void **)v9;
  sub_100279AA4(&v10);
}

- (void)setScannerEntryScanNetworks:(id)a3
{
  void *v4;
  uint64_t v5[3];
  void **v6;

  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1005ABBEC((uint64_t)v4, v5);
  v6 = (void **)v5;
  sub_100279AA4(&v6);
}

- (void)setScannerExitScanNetworks:(id)a3
{
  void *v4;
  uint64_t v5[3];
  void **v6;

  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_1005ABB40((uint64_t)v4, v5);
  v6 = (void **)v5;
  sub_100279AA4(&v6);
}

- (id)syncgetScanStats
{
  char *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(char *))(*((_QWORD *)v2 + 103) + 16))(v2 + 824);
  v4 = *(_OWORD *)(v2 + 756);
  v5 = *(_OWORD *)(v2 + 772);
  v6 = *(_OWORD *)(v2 + 788);
  v7 = *(_OWORD *)(v2 + 804);
  *(_OWORD *)(v2 + 756) = 0u;
  *(_OWORD *)(v2 + 772) = 0u;
  *(_OWORD *)(v2 + 788) = 0u;
  *(_OWORD *)(v2 + 804) = 0u;
  (*(void (**)(char *))(*((_QWORD *)v2 + 103) + 24))(v2 + 824);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005C81D0;
  v8[3] = &unk_102146A70;
  return objc_msgSend(v8, "copy");
}

- (id)syncgetBackgroundScanCacheResult
{
  void *v2;
  id v3;
  uint64_t v5;
  _QWORD v6[3];
  __int128 v7;
  __int128 v8;
  void **v9;

  v7 = 0u;
  v8 = 0u;
  v2 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, char *, __int128 *))(*(_QWORD *)v2 + 240))(v2, (char *)&v7 + 8, &v7);
  v5 = v7;
  memset(v6, 0, sizeof(v6));
  sub_10055A7B8(v6, *((uint64_t *)&v7 + 1), v8, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - *((_QWORD *)&v7 + 1)) >> 3));
  v3 = sub_1000ADC5C(&v5);
  v9 = (void **)v6;
  sub_100279AA4(&v9);
  v9 = (void **)&v7 + 1;
  sub_100279AA4(&v9);
  return v3;
}

- (BOOL)syncgetAssociatedNetwork:(void *)a3
{
  int v4;
  __int128 v5;
  uint64_t v7;
  std::string __p;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  unsigned __int8 v13;

  sub_1000A7FFC((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), (uint64_t)&v7);
  v4 = v13;
  if (v13)
  {
    *(_QWORD *)a3 = v7;
    std::string::operator=((std::string *)((char *)a3 + 8), &__p);
    v5 = v10;
    *((_OWORD *)a3 + 2) = v9;
    *((_OWORD *)a3 + 3) = v5;
    *((_OWORD *)a3 + 4) = v11;
    *((_QWORD *)a3 + 10) = v12;
    if (v13)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v4 != 0;
}

- (BOOL)syncgetHostedNetwork:(void *)a3
{
  int v4;
  std::string __p;
  __int128 v7;
  unsigned __int8 v8;

  sub_1005AC070(-[CLWifiServiceAdapter adaptee](self, "adaptee"), (uint64_t)&__p);
  v4 = v8;
  if (v8)
  {
    std::string::operator=((std::string *)a3, &__p);
    *(_OWORD *)((char *)a3 + 24) = v7;
    if (v8)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v4 != 0;
}

- (void)clearExitAndEntryScanNetworks:(BOOL)a3
{
  sub_1005AC1D4((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 passive:(BOOL)a5 requester:(const char *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *__p[3];
  char v14;
  void *v15[2];
  char v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v15, (char *)a6);
  LOBYTE(__p[0]) = 0;
  v14 = 0;
  v11 = (*(uint64_t (**)(void *, uint64_t, _BOOL8, _QWORD, _BOOL8, void **, void **))(*(_QWORD *)v10 + 256))(v10, v9, v8, 0, v7, v15, __p);
  if (v14 && __p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16 < 0)
    operator delete(v15[0]);
  return v11;
}

- (BOOL)syncgetStartScanWithType:(char)a3 lowPriority:(BOOL)a4 lowLatency:(BOOL)a5 passive:(BOOL)a6 requester:(const char *)a7 channels:(const void *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *__p[2];
  char v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)a7);
  v15 = (*(uint64_t (**)(void *, uint64_t, _BOOL8, _BOOL8, _BOOL8, void **, const void *))(*(_QWORD *)v14
                                                                                                  + 256))(v14, v13, v12, v11, v10, __p, a8);
  if (v18 < 0)
    operator delete(__p[0]);
  return v15;
}

- (BOOL)syncgetStartScanWithParameters:(id)a3
{
  void *v4;
  char v5;
  uint64_t v7[2];
  void *v8;
  void *v9;
  void *__p;
  char v11;

  v4 = -[CLWifiServiceAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v7, a3);
  v5 = sub_1005AC4E0((uint64_t)v4, v7);
  if (v11 < 0)
    operator delete(__p);
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
  return v5;
}

- (void)setQuiesceWifi:(BOOL)a3
{
  sub_1005AD2E4(-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

- (BOOL)syncgetSupportedChannelsAdd2GhzChannels:(BOOL)a3 andAdd5GhzChannels:(BOOL)a4 result:(void *)a5
{
  sub_1005AD6BC((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), (uint64_t)a5, a3, a4);
  return 1;
}

- (void)setWifiPower:(BOOL)a3
{
  sub_1005ADE28((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

- (void)setBackgroundExitScanCount:(int)a3
{
  sub_1005AE20C((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

- (BOOL)syncgetSetAutoJoin:(BOOL)a3
{
  return sub_1005AE4A0((uint64_t)-[CLWifiServiceAdapter adaptee](self, "adaptee"), a3);
}

@end
