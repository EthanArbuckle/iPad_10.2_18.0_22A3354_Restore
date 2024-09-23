@implementation CLBatchedSensorService

+ (BOOL)isSupported
{
  if (qword_1023055E0 != -1)
    dispatch_once(&qword_1023055E0, &stru_10215A468);
  return byte_1023055D8;
}

- (CLBatchedSensorService)initWithClientProtocol:(id)a3
{
  CLBatchedSensorService *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLBatchedSensorService;
  result = -[CLBatchedSensorService initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBatchedSensorServiceProtocol, a3);
  if (result)
    result->_clients = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBatchedSensorService;
  -[CLBatchedSensorService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  NSObject *v3;
  ConnectionInfo *p_info;
  ConnectionInfo *data;
  const char *v6;
  uint8_t *v7;
  int v8;
  ConnectionInfo *v9;
  uint8_t buf[4];
  ConnectionInfo *v11;

  objc_msgSend(-[CLBatchedSensorService universe](self, "universe"), "silo");
  if (qword_10229FFB0 != -1)
    dispatch_once(&qword_10229FFB0, &stru_10215A488);
  v3 = qword_10229FFB8;
  if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    *(_DWORD *)buf = 136446210;
    v11 = p_info;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] beginning service", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_10215A488);
    data = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      data = (ConnectionInfo *)data->name.__r_.__value_.var0.var1.__data_;
    v8 = 136446210;
    v9 = data;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFB8, 0, "[service-base-%{public}s] beginning service", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLBatchedSensorService beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  self->_clients = objc_opt_new(NSMutableSet);
}

- (void)endService
{
  NSObject *v3;
  ConnectionInfo *p_info;
  ConnectionInfo *data;
  const char *v6;
  uint8_t *v7;
  int v8;
  ConnectionInfo *v9;
  uint8_t buf[4];
  ConnectionInfo *v11;

  objc_msgSend(-[CLBatchedSensorService universe](self, "universe"), "silo");
  if (qword_10229FFB0 != -1)
    dispatch_once(&qword_10229FFB0, &stru_10215A488);
  v3 = qword_10229FFB8;
  if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    *(_DWORD *)buf = 136446210;
    v11 = p_info;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] ending service", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_10215A488);
    data = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      data = (ConnectionInfo *)data->name.__r_.__value_.var0.var1.__data_;
    v8 = 136446210;
    v9 = data;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFB8, 0, "[service-base-%{public}s] ending service", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLBatchedSensorService endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }

  self->_clients = 0;
}

- (void)registerForData:(id)a3
{
  NSObject *v5;
  ConnectionInfo *p_info;
  unsigned int v7;
  NSObject **v8;
  ConnectionInfo *v9;
  ConnectionInfo *data;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint8_t *v14;
  void *__p[2];
  uint64_t v16;
  int var0;
  int v18;
  ConnectionInfo *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  uint8_t buf[4];
  ConnectionInfo *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;

  -[NSMutableSet addObject:](self->_clients, "addObject:");
  if (qword_10229FFB0 != -1)
    dispatch_once(&qword_10229FFB0, &stru_10215A488);
  v5 = qword_10229FFB8;
  if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    v7 = -[NSMutableSet count](self->_clients, "count");
    *(_DWORD *)buf = 136446722;
    v25 = p_info;
    v26 = 2050;
    v27 = a3;
    v28 = 1026;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] added client %{public}p, num clients %{public}d", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_10215A488);
    data = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      data = (ConnectionInfo *)data->name.__r_.__value_.var0.var1.__data_;
    v11 = qword_10229FFB8;
    v12 = -[NSMutableSet count](self->_clients, "count");
    v18 = 136446722;
    v19 = data;
    v20 = 2050;
    v21 = a3;
    v22 = 1026;
    v23 = v12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "[service-base-%{public}s] added client %{public}p, num clients %{public}d", &v18, 28);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLBatchedSensorService registerForData:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  v8 = (NSObject **)sub_10009EC60();
  v9 = &self->_info;
  if (*((char *)&v9->name.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_100115CE4(__p, v9->name.__r_.__value_.var0.var1.__data_, v9->name.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v9->name.__r_.__value_.var0.var0.__data_;
    v16 = *((_QWORD *)&v9->name.__r_.__value_.var0.var1 + 2);
  }
  var0 = v9->name.__r_.var0;
  sub_100EA5B58(v8, (__int128 *)__p);
  if (SHIBYTE(v16) < 0)
    operator delete(__p[0]);
}

- (void)unregisterForData:(id)a3
{
  NSObject *v5;
  ConnectionInfo *p_info;
  unsigned int v7;
  uint64_t v8;
  ConnectionInfo *data;
  unsigned int v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  ConnectionInfo *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  uint8_t buf[4];
  ConnectionInfo *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unsigned int v24;

  -[NSMutableSet removeObject:](self->_clients, "removeObject:");
  if (qword_10229FFB0 != -1)
    dispatch_once(&qword_10229FFB0, &stru_10215A488);
  v5 = qword_10229FFB8;
  if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      p_info = (ConnectionInfo *)p_info->name.__r_.__value_.var0.var1.__data_;
    v7 = -[NSMutableSet count](self->_clients, "count");
    *(_DWORD *)buf = 136446722;
    v20 = p_info;
    v21 = 2050;
    v22 = a3;
    v23 = 1026;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[service-base-%{public}s] removed client %{public}p, num clients left %{public}d", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_10215A488);
    v8 = qword_10229FFB8;
    data = &self->_info;
    if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
      data = (ConnectionInfo *)data->name.__r_.__value_.var0.var1.__data_;
    v10 = -[NSMutableSet count](self->_clients, "count");
    v13 = 136446722;
    v14 = data;
    v15 = 2050;
    v16 = a3;
    v17 = 1026;
    v18 = v10;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "[service-base-%{public}s] removed client %{public}p, num clients left %{public}d", &v13, 28);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLBatchedSensorService unregisterForData:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
}

- (void)enableProvider
{
  ConnectionInfo *p_info;
  uint64_t v3;
  size_t size;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  ConnectionInfo *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  void (*v12)(void);

  p_info = &self->_info;
  v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0)
    v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  else
    v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  v6 = qword_1023055A0;
  if (byte_1023055AF >= 0)
    v6 = byte_1023055AF;
  if (v5 == v6)
  {
    if (byte_1023055AF >= 0)
      v7 = &qword_102305598;
    else
      v7 = (uint64_t *)qword_102305598;
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size))
        goto LABEL_31;
    }
    else
    {
      if (!*((_BYTE *)&self->_info.name.__r_.__value_.var0.var1 + 23))
        goto LABEL_31;
      v8 = &self->_info;
      v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        v8 = (ConnectionInfo *)((char *)v8 + 1);
        v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9)
          goto LABEL_31;
      }
    }
  }
  v10 = qword_1023055C0;
  if (byte_1023055CF >= 0)
    v10 = byte_1023055CF;
  if (v5 != v10)
    return;
  if (byte_1023055CF >= 0)
    v11 = &qword_1023055B8;
  else
    v11 = (uint64_t *)qword_1023055B8;
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size))
      return;
LABEL_31:
    v12 = *(void (**)(void))(*(_QWORD *)sub_1001FBB04(0) + 176);
    v12();
    return;
  }
  if (!(_DWORD)v3)
    goto LABEL_31;
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3)
      goto LABEL_31;
  }
}

- (void)disableProvider
{
  ConnectionInfo *p_info;
  uint64_t v3;
  size_t size;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  ConnectionInfo *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  void (*v12)(void);

  p_info = &self->_info;
  v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0)
    v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  else
    v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  v6 = qword_1023055A0;
  if (byte_1023055AF >= 0)
    v6 = byte_1023055AF;
  if (v5 == v6)
  {
    if (byte_1023055AF >= 0)
      v7 = &qword_102305598;
    else
      v7 = (uint64_t *)qword_102305598;
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size))
        goto LABEL_31;
    }
    else
    {
      if (!*((_BYTE *)&self->_info.name.__r_.__value_.var0.var1 + 23))
        goto LABEL_31;
      v8 = &self->_info;
      v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        v8 = (ConnectionInfo *)((char *)v8 + 1);
        v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9)
          goto LABEL_31;
      }
    }
  }
  v10 = qword_1023055C0;
  if (byte_1023055CF >= 0)
    v10 = byte_1023055CF;
  if (v5 != v10)
    return;
  if (byte_1023055CF >= 0)
    v11 = &qword_1023055B8;
  else
    v11 = (uint64_t *)qword_1023055B8;
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size))
      return;
LABEL_31:
    v12 = *(void (**)(void))(*(_QWORD *)sub_1001FBB04(0) + 176);
    v12();
    return;
  }
  if (!(_DWORD)v3)
    goto LABEL_31;
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3)
      goto LABEL_31;
  }
}

- (ConnectionInfo)info
{
  ConnectionInfo *result;
  __long *v3;

  v3 = &result->name.__r_.__value_.var0.var1 + 1;
  if (SHIBYTE(result->name.var0) < 0)
  {
    result = (ConnectionInfo *)sub_100115CE4(retstr, v3->__data_, *(_QWORD *)&result->name.__r_.var0);
  }
  else
  {
    retstr->name.__r_.__value_.var0.var1 = *v3;
    *((_QWORD *)&retstr->name.__r_.__value_.var0.var1 + 2) = result->name.var0;
  }
  retstr->name.__r_.var0 = v3[1].__size_;
  return result;
}

- (void)setInfo:(ConnectionInfo *)a3
{
  ConnectionInfo *p_info;

  p_info = &self->_info;
  std::string::operator=((std::string *)&self->_info, (const std::string *)a3);
  p_info->name.__r_.var0 = a3->name.__r_.var0;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  if (*((char *)&self->_info.name.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_info.name.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
