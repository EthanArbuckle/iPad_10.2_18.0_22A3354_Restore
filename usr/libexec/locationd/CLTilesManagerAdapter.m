@implementation CLTilesManagerAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)syncgetRegionPreloadManifest:(void *)a3
{
  return sub_100026860((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (uint64_t *)a3);
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
  if (qword_102309440 != -1)
    dispatch_once(&qword_102309440, &stru_102197440);
  return (id)qword_102309438;
}

- (CLTilesManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTilesManagerAdapter;
  return -[CLTilesManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTilesManagerProtocol, &OBJC_PROTOCOL___CLTilesManagerClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100FAB104((uint64_t)-[CLTilesManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_1019370F4();
    sub_100FAB104(v3);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTilesManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTilesManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTilesManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  int v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  v2 = sub_100761E88();
  if (v2)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102197838);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_102197838);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLTilesManager is not supported in diagnostics mode", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "+[CLTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  return v2 ^ 1;
}

- (void)requestTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6 details:(CLTileFileDownloadDetails *)a7
{
  double Current;
  void *v14;
  _Unwind_Exception *v15;
  std::string __p;

  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v15 = (_Unwind_Exception *)sub_101937268(self, a2, a4, a5);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    _Unwind_Resume(v15);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v14 = -[CLTilesManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, "");
  sub_1001BC1D8((uint64_t)v14, a3, a6, &__p, (__int128 *)&a7->var0, a4, a5, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)requestTileDownloadByType:(int)a3 path:(id)a4 details:(CLTileFileDownloadDetails *)a5
{
  double Current;
  _Unwind_Exception *v9;
  std::string __p;

  if ((a3 & 0xFFFFFFF7) - 1 >= 2)
  {
    v9 = (_Unwind_Exception *)sub_101937538(self, a2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    _Unwind_Resume(v9);
  }
  sub_1015A2E04(&__p, (char *)objc_msgSend(a4, "UTF8String"));
  Current = CFAbsoluteTimeGetCurrent();
  sub_1001BC1D8((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), a3, -1, &__p, (__int128 *)&a5->var0, 0.0, 0.0, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)enableAppTilesDownload:(BOOL)a3
{
  sub_100FAB588((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), a3);
}

- (BOOL)syncgetTileStats:(void *)a3
{
  sub_100FAB7BC((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
  return 1;
}

- (id)syncgetTileFilePath:(int)a3 latitude:(double)a4 longitude:(double)a5 isFileAccessible:(BOOL *)a6 isTileNotExistingOnServer:(BOOL *)a7
{
  void **v9;
  NSString *v10;
  void *__p[2];
  uint64_t v13;
  __int16 v14;
  double v15;
  double v16;
  int v17;

  v17 = a3;
  v16 = a4;
  v15 = a5;
  v14 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v13 = 0;
  if (sub_100FBC3EC((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), &v17, &v16, &v15, (uint64_t)__p, (_BYTE *)&v14 + 1, &v14))
  {
    *a6 = HIBYTE(v14);
    *a7 = v14;
    if (v13 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9);
  }
  else
  {
    v10 = 0;
  }
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
  return v10;
}

- (BOOL)syncgetDeleteTileFile:(int)a3 atPath:(id)a4
{
  int v5;

  v5 = a3;
  return sub_100FABC14((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (unsigned int *)&v5, (const char *)objc_msgSend(a4, "UTF8String"));
}

- (BOOL)syncgetAppAvailabilityForLocation:(id *)a3 radius:(float)a4 searchContext:(void *)a5 availabilityList:(void *)a6 includeRegionalApps:(BOOL)a7
{
  _BOOL8 v7;
  void *v11;
  uint64_t v12;

  v7 = a7;
  v11 = -[CLTilesManagerAdapter adaptee](self, "adaptee", a3, a5);
  return sub_100FAC170((uint64_t)v11, *(double *)(&a3->var0 + 1), *(double *)((char *)&a3->var1.var0 + 4), a4, v12, (uint64_t *)a6, v7);
}

- (BOOL)syncgetTransitMacAddressesAmong:(void *)a3 nearLatitude:(double)a4 longitude:(double)a5 resultMacAddresses:(void *)a6
{
  return sub_100FAD658((uint64_t)-[CLTilesManagerAdapter adaptee](self, "adaptee"), (id **)a3, (uint64_t)a6, a4, a5);
}

- (BOOL)syncgetListTilesDirectory:(id)a3 type:(int)a4 time:(double)a5
{
  void *v8;
  BOOL v9;
  void *__p[2];
  char v12;

  v8 = -[CLTilesManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v9 = sub_100FADA30((uint64_t)v8, (uint64_t)__p, a4, a5);
  if (v12 < 0)
    operator delete(__p[0]);
  return v9;
}

@end
