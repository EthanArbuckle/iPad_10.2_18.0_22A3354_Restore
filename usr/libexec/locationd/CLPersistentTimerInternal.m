@implementation CLPersistentTimerInternal

- (void)setTimerWithInterval:(double)a3
{
  NSObject *v5;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_strIdentifier;
  double v7;
  NSObject *v8;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v9;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v10;
  char *v11;
  NSObject *v12;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v13;
  NSObject *v14;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v15;
  PCPersistentTimer *v16;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  double v18;
  char *v19;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v20;
  char *v21;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v22;
  char *v23;
  double v24;
  int v25;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v26;
  __int16 v27;
  double v28;
  uint8_t buf[4];
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v30;
  __int16 v31;
  double v32;

  -[CLSilo assertInside](self->_silo, "assertInside");
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021612F0);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      p_strIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_strIdentifier->__r_.__value_.var0.var1.__data_;
    v7 = -1.0;
    if (a3 != 1.79769313e308)
      v7 = a3;
    *(_DWORD *)buf = 136315394;
    v30 = p_strIdentifier;
    v31 = 2048;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, %.1lf", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    data = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
    v18 = -1.0;
    if (a3 != 1.79769313e308)
      v18 = a3;
    v25 = 136315394;
    v26 = data;
    v27 = 2048;
    v28 = v18;
    LODWORD(v24) = 22;
    v19 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "setTimerWithInterval, %s, interval, %.1lf", (const char *)&v25, v24);
    sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  -[CLPersistentTimerInternal invalidate](self, "invalidate");
  if (a3 <= 0.0)
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    v12 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      v13 = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        v13 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v13->__r_.__value_.var0.var1.__data_;
      *(_DWORD *)buf = 136315394;
      v30 = v13;
      v31 = 2048;
      v32 = 1.0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "interval, %s, %.5lf, flooring to 1.0, interval", buf, 0x16u);
    }
    a3 = 1.0;
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021612F0);
      v22 = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        v22 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v22->__r_.__value_.var0.var1.__data_;
      v25 = 136315394;
      v26 = v22;
      v27 = 2048;
      v28 = 1.0;
      LODWORD(v24) = 22;
      v23 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "interval, %s, %.5lf, flooring to 1.0, interval", (const char *)&v25, v24);
      sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
  }
  else if (a3 == 1.79769313e308)
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    v8 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      v9 = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        v9 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v9->__r_.__value_.var0.var1.__data_;
      *(_DWORD *)buf = 136315138;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, DBL_MAX", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021612F0);
      v10 = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v10->__r_.__value_.var0.var1.__data_;
      v25 = 136315138;
      v26 = v10;
      v11 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "setTimerWithInterval, %s, interval, DBL_MAX", (const char *)&v25);
      sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
    return;
  }
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021612F0);
  v14 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    v15 = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      v15 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v15->__r_.__value_.var0.var1.__data_;
    *(_DWORD *)buf = 136315394;
    v30 = v15;
    v31 = 2048;
    v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, %.1lf", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    v20 = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      v20 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v20->__r_.__value_.var0.var1.__data_;
    v25 = 136315394;
    v26 = v20;
    v27 = 2048;
    v28 = a3;
    LODWORD(v24) = 22;
    v21 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "setTimerWithInterval, %s, interval, %.1lf", (const char *)&v25, v24);
    sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
  }
  v16 = (PCPersistentTimer *)objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", *(_QWORD *)&self->_strIdentifier.__r_.var0, self, "bounce_timerFired:", 0, a3);
  self->_pcTimer = v16;
  -[PCPersistentTimer setMinimumEarlyFireProportion:](v16, "setMinimumEarlyFireProportion:", *(double *)&self->_wakeDevice);
  -[PCPersistentTimer setDisableSystemWaking:](self->_pcTimer, "setDisableSystemWaking:", LOBYTE(self->_strIdentifier.var0) == 0);
  -[PCPersistentTimer scheduleInRunLoop:](self->_pcTimer, "scheduleInRunLoop:", +[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
}

- (void)invalidate
{
  PCPersistentTimer *pcTimer;
  PCPersistentTimer *v4;
  NSObject *v5;
  void **v6;
  id v7;
  void **v8;
  char *v9;
  _QWORD v10[5];
  __int128 __p;
  uint64_t v12;
  void *__dst[2];
  uint64_t v14;
  int v15;
  void **v16;
  __int16 v17;
  PCPersistentTimer *v18;
  uint8_t buf[4];
  void **v20;
  __int16 v21;
  PCPersistentTimer *v22;

  -[CLSilo assertInside](self->_silo, "assertInside");
  pcTimer = self->_pcTimer;
  if (pcTimer)
  {
    v4 = pcTimer;
    self->_pcTimer = 0;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_100115CE4(__dst, self->_strIdentifier.__r_.__value_.var0.var1.__data_, self->_strIdentifier.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)self->_strIdentifier.__r_.__value_.var0.var0.__data_;
      v14 = *((_QWORD *)&self->_strIdentifier.__r_.__value_.var0.var1 + 2);
    }
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    v5 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      v6 = __dst;
      if (v14 < 0)
        v6 = (void **)__dst[0];
      *(_DWORD *)buf = 136315394;
      v20 = v6;
      v21 = 2048;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Scheduling invalidation, %s, %p", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021612F0);
      v8 = __dst;
      if (v14 < 0)
        v8 = (void **)__dst[0];
      v15 = 136315394;
      v16 = v8;
      v17 = 2048;
      v18 = v4;
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "Scheduling invalidation, %s, %p", (const char *)&v15, 22);
      sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal invalidate]", "%s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
    v7 = +[CLSilo main](CLSilo, "main");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3321888768;
    v10[2] = sub_10005BC40;
    v10[3] = &unk_1021612C0;
    if (SHIBYTE(v14) < 0)
    {
      sub_100115CE4(&__p, __dst[0], (unint64_t)__dst[1]);
    }
    else
    {
      __p = *(_OWORD *)__dst;
      v12 = v14;
    }
    v10[4] = v4;
    objc_msgSend(v7, "async:", v10);
    if (SHIBYTE(v12) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v14) < 0)
      operator delete(__dst[0]);
  }
}

- (void)setNextFireTime:(double)a3
{
  -[CLSilo assertInside](self->_silo, "assertInside");
  -[CLPersistentTimerInternal setTimerWithInterval:](self, "setTimerWithInterval:", a3 - CFAbsoluteTimeGetCurrent());
}

- (CLPersistentTimerInternal)initWithFireTime:(double)a3 timeInterval:(double)a4 serviceIdentifier:(const char *)a5 wakeDevice:(BOOL)a6 clTimer:(void *)a7 silo:(id)a8 minimumEarlyFireProportion:(double)a9
{
  char *v17;
  objc_super v19;

  objc_msgSend(a8, "assertInside");
  if (!a7)
    sub_101910610();
  v19.receiver = self;
  v19.super_class = (Class)CLPersistentTimerInternal;
  v17 = -[CLPersistentTimerInternal init](&v19, "init");
  if (v17)
  {
    *((_QWORD *)v17 + 7) = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a5, 4);
    std::string::assign((std::string *)(v17 + 32), a5);
    v17[64] = a6;
    *((_QWORD *)v17 + 2) = a7;
    *((_QWORD *)v17 + 3) = a8;
    *((double *)v17 + 9) = a4;
    *((double *)v17 + 10) = a9;
    if (a3 >= 0.0)
      a4 = a3 - CFAbsoluteTimeGetCurrent();
    objc_msgSend(v17, "setTimerWithInterval:", a4);
  }
  return (CLPersistentTimerInternal *)v17;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_pcTimer)
    sub_1019108E8();
  if (!self->_clTimer)
    sub_10191077C();

  *(_QWORD *)&self->_strIdentifier.__r_.var0 = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPersistentTimerInternal;
  -[CLPersistentTimerInternal dealloc](&v3, "dealloc");
}

- (void)bounce_timerFired:(id)a3
{
  CLSilo *silo;
  _QWORD v4[6];

  silo = self->_silo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100986018;
  v4[3] = &unk_10212BB30;
  v4[4] = self;
  v4[5] = a3;
  -[CLSilo async:](silo, "async:", v4);
}

- (void)timerFired:(id)a3
{
  NSObject *v5;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_strIdentifier;
  void *clTimer;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  void *v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint8_t buf[4];
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  -[CLSilo assertInside](self->_silo, "assertInside");
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021612F0);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      p_strIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_strIdentifier->__r_.__value_.var0.var1.__data_;
    clTimer = self->_clTimer;
    *(_DWORD *)buf = 136315650;
    v19 = p_strIdentifier;
    v20 = 2048;
    v21 = a3;
    v22 = 2048;
    v23 = clTimer;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "timerFired: timer, _clTimer, %s, %p, %p", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021612F0);
    data = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
    v9 = self->_clTimer;
    v12 = 136315650;
    v13 = data;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = v9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "timerFired: timer, _clTimer, %s, %p, %p", (const char *)&v12, 32);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLPersistentTimerInternal timerFired:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (self->_pcTimer == a3)
  {
    if (*(double *)&self->_serviceIdentifier != 1.79769313e308)
      -[CLPersistentTimerInternal setTimerWithInterval:](self, "setTimerWithInterval:");
    sub_100986258((uint64_t)self->_clTimer);
  }
}

- (void).cxx_destruct
{
  if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_strIdentifier.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0uLL;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
