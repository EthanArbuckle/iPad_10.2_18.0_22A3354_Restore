@implementation CLWifiLocationProviderAdapter

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
  if (qword_102303290 != -1)
    dispatch_once(&qword_102303290, &stru_10214CBD0);
  return (id)qword_102303288;
}

- (CLWifiLocationProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLWifiLocationProviderAdapter;
  return -[CLWifiLocationProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWifiLocationProviderProtocol, &OBJC_PROTOCOL___CLWifiLocationProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1006AC4A0((uint64_t)-[CLWifiLocationProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101904DAC();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiLocationProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiLocationProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLWifiLocationProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)emergencyStateChange:(id)a3
{
  NSObject *v4;
  std::string *v5;
  void *v6;
  uint64_t v7;
  std::string *p_buf;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  std::string buf;
  int v16;
  std::string *v17;
  std::string __p[68];

  (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&v13, a3, a2);
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10214CDD0);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    sub_100CD5278(&v13, __p);
    v5 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? __p
       : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "notifier adapter received emergency state %s", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10214CDD0);
    v7 = qword_1022A0058;
    sub_100CD5278(&v13, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    v16 = 136315138;
    v17 = p_buf;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v7, 0, "notifier adapter received emergency state %s", (const char *)&v16);
    v10 = v9;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiLocationProviderAdapter emergencyStateChange:]", "%s\n", (const char *)v10);
    if (v10 != __p)
      free(v10);
  }
  v6 = -[CLWifiLocationProviderAdapter adaptee](self, "adaptee");
  v11 = v13;
  v12 = v14;
  sub_1006AC840((uint64_t)v6, (uint64_t)&v11);
}

- (void)requestLocationUpdateWithParameters:(id)a3
{
  void *v4;
  uint64_t v5[4];
  char v6;
  void *__p;
  char v8;

  v4 = -[CLWifiLocationProviderAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10022DDF8((uint64_t)v4, v5);
  if (v8 < 0)
    operator delete(__p);
  if (v6 < 0)
    operator delete((void *)v5[2]);
}

+ (BOOL)isSupported
{
  NSObject *v2;
  const char *v4;
  uint8_t *v5;
  _DWORD v6[4];
  uint8_t buf[4];
  int v8;

  if (qword_1023032A0 != -1)
    dispatch_once(&qword_1023032A0, &stru_10214CBF0);
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_10214CDF0);
  v2 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v8 = byte_102303298;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxWifi, supported, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214CDF0);
    v6[0] = 67240192;
    v6[1] = byte_102303298;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "@ClxWifi, supported, %{public}d", v6, 8);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "+[CLWifiLocationProviderAdapter isSupported]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  return byte_102303298;
}

@end
