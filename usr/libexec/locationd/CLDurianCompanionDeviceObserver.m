@implementation CLDurianCompanionDeviceObserver

- (CLDurianCompanionDeviceObserver)init
{
  -[CLDurianCompanionDeviceObserver doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianCompanionDeviceObserver)initWithUniverse:(id)a3
{
  CLDurianCompanionDeviceObserver *v4;
  CLDurianCompanionDeviceObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLDurianCompanionDeviceObserver;
  v4 = -[CLDurianCompanionDeviceObserver init](&v7, "init");
  v5 = v4;
  if (v4)
    -[CLDurianCompanionDeviceObserver registerForCompanionConnectionUpdateWithUniverse:](v4, "registerForCompanionConnectionUpdateWithUniverse:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDurianCompanionDeviceObserver unregisterForCompanionConnectionUpdate](self, "unregisterForCompanionConnectionUpdate");
  v3.receiver = self;
  v3.super_class = (Class)CLDurianCompanionDeviceObserver;
  -[CLDurianCompanionDeviceObserver dealloc](&v3, "dealloc");
}

- (void)registerForCompanionConnectionUpdateWithUniverse:(id)a3
{
  NSObject *v4;
  Client *value;
  uint64_t v6;
  __int16 v7;
  const char *v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC518);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 68289026;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update registration\"}", (uint8_t *)&v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (!value)
    sub_1001B6924();
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 5, 0, v6);
}

- (void)unregisterForCompanionConnectionUpdate
{
  NSObject *v3;
  Client *value;
  Client *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC518);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    v5 = self->_companionClient.__ptr_.__value_;
    self->_companionClient.__ptr_.__value_ = 0;
    if (v5)
      (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  }
}

- (void)onCompanionNotification:(int)a3 data:(unsigned __int8 *)a4
{
  int v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  if (a3 == 5)
  {
    v5 = *a4;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC518);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 1025;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update\", \"companionIsNearby\":%{private}d}", buf, 0x18u);
    }
    v7 = objc_msgSend(a1, "delegate");
    if (v5)
      v8 = 1;
    else
      v8 = 2;
    objc_msgSend(v7, "onCompanionObservationWithType:", v8);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC518);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#durian #companion received unhandled companion notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC518);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 17, "#durian #companion received unhandled companion notification", v12, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLDurianCompanionDeviceObserver onCompanionNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (CLDurianCompanionObservationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianCompanionObservationDelegate *)a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_companionClient.__ptr_.__value_;
  self->_companionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
