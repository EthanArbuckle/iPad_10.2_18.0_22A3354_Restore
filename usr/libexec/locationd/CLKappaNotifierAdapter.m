@implementation CLKappaNotifierAdapter

- (void)simulateTriggerWithDelay:(int)a3
{
  -[CLKappaNotifierAdapter simulateTriggerWithDelay:forMode:](self, "simulateTriggerWithDelay:forMode:", *(_QWORD *)&a3, 1);
}

- (void)simulateTriggerWithDelay:(int)a3 forMode:(unsigned __int8)a4
{
  unsigned __int8 v4[4];
  uint64_t v5;
  int v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v4[0] = 8 * (a4 == 1);
  v4[1] = 8 * (a4 == 2);
  v4[2] = 8 * (a4 == 4);
  v4[3] = 0;
  v5 = (1000000 * a3);
  sub_10143D640((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), v4);
}

- (void)collect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL var4;
  _BOOL4 var7;
  unint64_t v11;
  BOOL var6;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  OverrideClient v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;

  v4 = a4;
  v17 = a3;
  v6 = *(unint64_t *)&a3 >> 8;
  v7 = *(unint64_t *)&a3 >> 16;
  v8 = *(unint64_t *)&a3 >> 24;
  var4 = a3.var4;
  var7 = a3.var7;
  v11 = *(unint64_t *)&a3 >> 40;
  var6 = a3.var6;
  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v13 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    v27 = v6;
    v28 = 1024;
    v29 = v7;
    v30 = 1024;
    v31 = v8;
    v32 = 1024;
    v33 = var4;
    v34 = 1024;
    v35 = var7;
    v36 = 1024;
    v37 = v11;
    v38 = 1024;
    v39 = var6;
    v40 = 1024;
    v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "collect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    LOWORD(v19) = 1024;
    HIWORD(v19) = v7;
    v20 = 1024;
    v21 = v11;
    v22 = 1024;
    v23 = var6;
    v24 = 1024;
    v25 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FDA8, 1, "collect %d %d %d %d %d %d %d %d", &v18, 50, v16, *(_DWORD *)&v17.var0, 67110912, v19, v8, 0x4000000);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter collect:isLocal:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  sub_10143CA54((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (uint64_t)&v17, v4);
}

- (void)dontcollect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL var4;
  _BOOL4 var7;
  unint64_t v11;
  BOOL var6;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  OverrideClient v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;

  v4 = a4;
  v17 = a3;
  v6 = *(unint64_t *)&a3 >> 8;
  v7 = *(unint64_t *)&a3 >> 16;
  v8 = *(unint64_t *)&a3 >> 24;
  var4 = a3.var4;
  var7 = a3.var7;
  v11 = *(unint64_t *)&a3 >> 40;
  var6 = a3.var6;
  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v13 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    v27 = v6;
    v28 = 1024;
    v29 = v7;
    v30 = 1024;
    v31 = v8;
    v32 = 1024;
    v33 = var4;
    v34 = 1024;
    v35 = var7;
    v36 = 1024;
    v37 = v11;
    v38 = 1024;
    v39 = var6;
    v40 = 1024;
    v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "dontcollect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    LOWORD(v19) = 1024;
    HIWORD(v19) = v7;
    v20 = 1024;
    v21 = v11;
    v22 = 1024;
    v23 = var6;
    v24 = 1024;
    v25 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FDA8, 1, "dontcollect %d %d %d %d %d %d %d %d", &v18, 50, v16, *(_DWORD *)&v17.var0, 67110912, v19, v8, 0x4000000);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter dontcollect:isLocal:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  sub_10143C634((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (unint64_t *)&v17, v4);
}

- (void)remoteTimeout
{
  sub_101437B8C((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"));
}

- (void)companionHeartbeat:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v5 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "received heartbeat from companion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FDA8, 1, "received heartbeat from companion", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter companionHeartbeat:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  sub_101438444((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)forceCompanionHeartbeat
{
  sub_101438B60((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"));
}

- (void)startDem
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v3 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start DEM", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FDA8, 1, "start DEM", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter startDem]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10143D3C8((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), 1);
}

- (void)stopDem
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v3 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop DEM", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FDA8, 1, "stop DEM", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter stopDem]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10143D3C8((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), 0);
}

- (void)forceTrigger
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v4 = 0uLL;
  v2 = 4;
  v3 = 0uLL;
  sub_10143D640((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (unsigned __int8 *)&v2);
}

- (int)syncgetKappaState
{
  return sub_10143E30C((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"));
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
  if (qword_10229FDA0 != -1)
    dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
  v4 = qword_10229FDA8;
  if (os_log_type_enabled((os_log_t)qword_10229FDA8, OS_LOG_TYPE_DEFAULT))
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
    if (qword_10229FDA0 != -1)
      dispatch_once(&qword_10229FDA0, &stru_1021B6A88);
    v7 = qword_10229FDA8;
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
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter emergencyStateChange:]", "%s\n", (const char *)v10);
    if (v10 != __p)
      free(v10);
  }
  v6 = -[CLKappaNotifierAdapter adaptee](self, "adaptee");
  v11 = v13;
  v12 = v14;
  sub_101435D54((uint64_t)v6, (uint64_t)&v11);
}

- (void)forceTriggerIgneous:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  char *v18;
  __int16 v19;
  char *v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  char *v24;
  __int128 v25;
  uint64_t v26;

  v26 = 0;
  v25 = 0x40000uLL;
  if (a3)
  {
    strncpy((char *)&v25 + 8, (const char *)objc_msgSend(a3, "UTF8String"), 0xFuLL);
    if ((unint64_t)objc_msgSend(a3, "length") < 0x10)
      goto LABEL_17;
    if (qword_10229FFC0 != -1)
      dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
    v5 = qword_10229FFC8;
    if (os_log_type_enabled((os_log_t)qword_10229FFC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = (char *)objc_msgSend(a3, "UTF8String");
      v23 = 2080;
      v24 = (char *)&v25 + 8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "truncated force trigger uid from %s to %s", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_17;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFC0 != -1)
      dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
    v6 = qword_10229FFC8;
    v17 = 136315394;
    v18 = (char *)objc_msgSend(a3, "UTF8String");
    v19 = 2080;
    v20 = (char *)&v25 + 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "truncated force trigger uid from %s to %s", (const char *)&v17, 22);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v7);
    if (v8 == buf)
      goto LABEL_17;
LABEL_32:
    free(v8);
    goto LABEL_17;
  }
  if (qword_10229FFC0 != -1)
    dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
  v9 = qword_10229FFC8;
  if (os_log_type_enabled((os_log_t)qword_10229FFC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received nil GUID, setting to empty", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFC0 != -1)
      dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
    LOWORD(v17) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFC8, 0, "Received nil GUID, setting to empty", &v17, 2);
    v8 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v14);
    if (v8 != buf)
      goto LABEL_32;
  }
LABEL_17:
  if (qword_10229FFC0 != -1)
    dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
  v10 = qword_10229FFC8;
  if (os_log_type_enabled((os_log_t)qword_10229FFC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = (char *)&v25 + 8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received force trigger,uid,%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFC0 != -1)
      dispatch_once(&qword_10229FFC0, &stru_1021B6BE8);
    v17 = 136315138;
    v18 = (char *)&v25 + 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFC8, 0, "received force trigger,uid,%s", (const char *)&v17);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  -[CLKappaNotifierAdapter adaptee](self, "adaptee");
  if (sub_10143EA58())
  {
    v11 = -[CLKappaNotifierAdapter adaptee](self, "adaptee");
    v15 = v25;
    v16 = v26;
    sub_10143D640((uint64_t)v11, (unsigned __int8 *)&v15);
  }
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
  if (qword_10230F100 != -1)
    dispatch_once(&qword_10230F100, &stru_1021B69E8);
  return (id)qword_10230F0F8;
}

- (CLKappaNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKappaNotifierAdapter;
  return -[CLKappaNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLKappaNotifierProtocol, &OBJC_PROTOCOL___CLKappaNotifierClientProtocol);
}

- (void)beginService
{
  CLKappaNotifierAdapter *v3;
  SEL v4;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10142EC0C((uint64_t)-[CLKappaNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = (CLKappaNotifierAdapter *)sub_101954A50();
    -[CLKappaNotifierAdapter endService](v3, v4);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLKappaNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLKappaNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLKappaNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10230F110 != -1)
    dispatch_once(&qword_10230F110, &stru_1021B6A68);
  return byte_10230F108;
}

- (void)simulateTrustedCrashVerification
{
  -[CLKappaNotifierAdapter adaptee](self, "adaptee");
  sub_10143F0C0();
}

- (void)queryTrustedCrashVerification
{
  -[CLKappaNotifierAdapter adaptee](self, "adaptee");
  sub_10143F268();
}

@end
