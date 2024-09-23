@implementation CLTransitMacTileDataProvider

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
  if (qword_102305A20 != -1)
    dispatch_once(&qword_102305A20, &stru_10215FBF8);
  return (id)qword_102305A18;
}

- (CLTransitMacTileDataProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTransitMacTileDataProvider;
  return -[CLTransitMacTileDataProvider initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTransitMacTileDataProviderProtocol, &OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "silo");
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_10215FC58);
  v3 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TransitMac: service begin", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10215FC58);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TransitMac: service begin", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLTransitMacTileDataProvider universe](self, "universe");
  sub_1012B2C64();
}

- (void)endService
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "silo");
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_10215FC58);
  v2 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "TransitMac: service end", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10215FC58);
    v5[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TransitMac: service end", v5, 2);
    v4 = (uint8_t *)v3;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider endService]", "%s\n", v3);
    if (v4 != buf)
      free(v4);
  }
}

- (void)fetchMacAddressesAmong:(id)a3 nearLatitude:(double)a4 longitude:(double)a5 withReply:(id)a6
{
  NSMutableArray *v11;
  _QWORD *v12;
  void *__p;
  _QWORD *v14;
  uint64_t v15;
  void *v16[3];

  objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "silo");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v16, a3);
  __p = 0;
  v14 = 0;
  v15 = 0;
  objc_msgSend(objc_msgSend(objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTilesManager")), "syncgetTransitMacAddressesAmong:nearLatitude:longitude:resultMacAddresses:", v16, &__p, a4, a5);
  v11 = objc_opt_new(NSMutableArray);
  v12 = __p;
  if (__p != v14)
  {
    do
      -[NSMutableArray addObject:](v11, "addObject:", -[CLTransitMacTileDataProviderResult initWithMacAddress:]([CLTransitMacTileDataProviderResult alloc], "initWithMacAddress:", *v12++));
    while (v12 != v14);
  }
  (*((void (**)(id, NSMutableArray *, _QWORD))a6 + 2))(a6, v11, 0);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }
}

- (void)onDarwinNotifierNotification:(int)a3 data:(id)a4
{
  _BOOL4 v6;
  _BOOL4 v7;
  std::__shared_weak_count *size;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD *v15;
  const char *v16;
  std::string *v17;
  void *__p;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22[2];
  _QWORD v23[2];
  std::string buf[68];

  objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe", *(_QWORD *)&a3, *(_QWORD *)&a4.var0), "silo");
  if (!a3)
  {
    sub_100119F3C(v23);
    sub_1001E4804(buf);
    v6 = sub_100006BB4((uint64_t)buf[0].__r_.__value_.__l.__data_, "SpoofTransitMacQuery", v23);
    v7 = v6;
    size = (std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_;
    if (!buf[0].__r_.__value_.__l.__size_)
      goto LABEL_6;
    v9 = (unint64_t *)(buf[0].__r_.__value_.__l.__size_ + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
      if (v7)
        goto LABEL_7;
    }
    else
    {
LABEL_6:
      if (v6)
      {
LABEL_7:
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_10215FC58);
        v11 = qword_1022A02D8;
        if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TransitMac: spoofing a query", (uint8_t *)buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A02D0 != -1)
            dispatch_once(&qword_1022A02D0, &stru_10215FC58);
          LOWORD(v22[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 1, "TransitMac: spoofing a query", v22, 2);
          v17 = (std::string *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacTileDataProvider onDarwinNotifierNotification:data:]", "%s\n", v16);
          if (v17 != buf)
            free(v17);
        }
        v22[0] = 0.0;
        if (sub_1001FD98C((uint64_t)v23, "Latitude", v22))
          v12 = v22[0];
        else
          v12 = 37.332862;
        if (sub_1001FD98C((uint64_t)v23, "Longitude", v22))
          v13 = v22[0];
        else
          v13 = -122.030238;
        memset(buf, 0, 24);
        if (sub_1000BCB64((uint64_t)v23, "MacAddress", buf))
        {
          v21 = sub_1000CC740((uint64_t)buf);
          v14 = sub_100129380((uint64_t)&v21);
        }
        else
        {
          v14 = 567;
        }
        v15 = operator new(8uLL);
        *v15 = v14;
        v19 = 0;
        v20 = 0;
        __p = 0;
        sub_10025EA00(&__p, v15, (uint64_t)(v15 + 1), 1uLL);
        -[CLTransitMacTileDataProvider fetchMacAddressesAmong:nearLatitude:longitude:withReply:](self, "fetchMacAddressesAmong:nearLatitude:longitude:withReply:", sub_100958000((uint64_t)&__p), &stru_10215FC38, v12, v13);
        if (__p)
        {
          v19 = __p;
          operator delete(__p);
        }
        operator delete(v15);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
      }
    }
    sub_10011A5A8(v23);
  }
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
