@implementation CLWifiTilesManagerAdapter

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
  if (qword_10230D310 != -1)
    dispatch_once(&qword_10230D310, &stru_1021A50F8);
  return (id)qword_10230D308;
}

- (CLWifiTilesManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLWifiTilesManagerAdapter;
  return -[CLWifiTilesManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWifiTilesManagerProtocol, &OBJC_PROTOCOL___CLWifiTilesManagerClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1011A77D4((uint64_t)-[CLWifiTilesManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_10194419C();
    sub_1011A77D4(v3);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiTilesManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiTilesManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiTilesManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  int v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v11;
  _WORD v12[8];
  uint8_t buf[1640];

  v2 = sub_100761E88();
  if (v2)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021A53E8);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWifiTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021A53E8);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLWifiTilesManager is not supported in diagnostics mode", v12, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  if ((sub_10093935C() & 1) != 0)
  {
    LOBYTE(v4) = v2 ^ 1;
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021A53E8);
    v5 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLWifiTilesManager is disabled by settings", buf, 2u);
    }
    v4 = sub_1001BFF7C(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021A53E8);
      v12[0] = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLWifiTilesManager is disabled by settings", v12, v11);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)requestTileDownloadForLat:(double)a3 lon:(double)a4 details:(CLTileFileDownloadDetails *)a5
{
  double Current;
  void *v10;
  std::string __p;

  Current = CFAbsoluteTimeGetCurrent();
  v10 = -[CLWifiTilesManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, "");
  sub_100096CB4((uint64_t)v10, 0, &__p, (uint64_t)a5, a3, a4, Current);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)getNumberOfInputApsUsedInWifiTileForCoordinate:(id)a3 withReply:(id)a4
{
  uint64_t v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  v6 = a3;
  v5 = sub_1013696E8(*((_QWORD *)-[CLWifiTilesManagerAdapter adaptee](self, "adaptee") + 60), &v6.var0);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

@end
