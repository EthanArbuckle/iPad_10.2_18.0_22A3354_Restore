@implementation CLLocationControllerAdapter

- (BOOL)syncgetActiveTechs:(void *)a3
{
  sub_1001148AC((uint64_t)-[CLLocationControllerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
  return 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (void)setGpsAssistantHasClients:(BOOL)a3 forNotification:(int)a4
{
  _BOOL8 v4;
  _QWORD **v5;
  int v6;

  v4 = a3;
  v6 = a4;
  v5 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *, int *, _BOOL8))(*v5[36] + 304))(v5[36], &v6, v4);
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
  if (qword_102303258 != -1)
    dispatch_once(&qword_102303258, &stru_10214C288);
  return (id)qword_102303250;
}

- (CLLocationControllerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationControllerAdapter;
  return -[CLLocationControllerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationControllerProtocol, &OBJC_PROTOCOL___CLLocationControllerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1006978B4((uint64_t)-[CLLocationControllerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101904B7C();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationControllerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationControllerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationControllerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetMetric:(void *)a3
{
  _QWORD **v4;

  v4 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *, void *))(*v4[36] + 208))(v4[36], a3);
  return 1;
}

- (BOOL)syncgetZaxisStats:(void *)a3
{
  sub_100697A44((uint64_t)-[CLLocationControllerAdapter adaptee](self, "adaptee"), (uint64_t)a3);
  return 1;
}

- (void)setTrackRunHint:(id)a3
{
  _DWORD *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  _QWORD **v9;
  uint64_t v10;
  int v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;

  v4 = objc_msgSend(a3, "bytes");
  if (qword_10229FC50 != -1)
    dispatch_once(&qword_10229FC50, &stru_10214C580);
  v5 = qword_10229FC58;
  if (os_log_type_enabled((os_log_t)qword_10229FC58, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)v4;
    v7 = v4[2];
    v8 = v4[3];
    *(_DWORD *)buf = 134349569;
    v22 = v6;
    v23 = 1025;
    v24 = v7;
    v25 = 1025;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLTR,Daemon,syncsetTrackRunHint,received,mctime,%{public}.1lf,lane,%{private}d,notification,%{private}d", buf, 0x18u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC50 != -1)
      dispatch_once(&qword_10229FC50, &stru_10214C580);
    v10 = *(_QWORD *)v4;
    v11 = v4[2];
    v12 = v4[3];
    v15 = 134349569;
    v16 = v10;
    v17 = 1025;
    v18 = v11;
    v19 = 1025;
    v20 = v12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC58, 0, "CLTR,Daemon,syncsetTrackRunHint,received,mctime,%{public}.1lf,lane,%{private}d,notification,%{private}d", &v15, 24);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationControllerAdapter setTrackRunHint:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  v9 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *, _DWORD *))(*v9[36] + 424))(v9[36], v4);
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
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_10214C5A0);
  v4 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
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
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_10214C5A0);
    v7 = qword_1022A0028;
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
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationControllerAdapter emergencyStateChange:]", "%s\n", (const char *)v10);
    if (v10 != __p)
      free(v10);
  }
  v6 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  v11 = v13;
  v12 = v14;
  sub_100698FF8((uint64_t)v6, (uint64_t)&v11);
}

- (void)onOutdoorUpdate:(id)a3
{
  void *v4;
  _QWORD v5[7];

  v4 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*((void (**)(_QWORD *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10069927C((uint64_t)v4, (uint64_t)v5);
}

- (void)setRealTimeHarvestTriggered:(double)a3
{
  _QWORD **v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  double v9;
  uint8_t buf[4];
  double v11;

  v4 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(_QWORD *, double))(*v4[36] + 256))(v4[36], a3);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_10214C5A0);
  v5 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BaroAlt,Realtime harvest,received,%{public}.3f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_10214C5A0);
    v8 = 134349056;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 1, "BaroAlt,Realtime harvest,received,%{public}.3f", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationControllerAdapter setRealTimeHarvestTriggered:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

@end
