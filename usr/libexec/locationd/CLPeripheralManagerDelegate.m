@implementation CLPeripheralManagerDelegate

- (CLPeripheralManagerDelegate)initWithSilo:(id)a3 provider:(void *)a4
{
  CLPeripheralManagerDelegate *v6;
  CLPeripheralManagerDelegate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLPeripheralManagerDelegate;
  v6 = -[CLPeripheralManagerDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLPeripheralManagerDelegate setSilo:](v6, "setSilo:", a3);
    -[CLPeripheralManagerDelegate setProvider:](v7, "setProvider:", a4);
  }
  return v7;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  _DWORD v14[4];
  uint8_t buf[4];
  unsigned int v16;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    v16 = objc_msgSend(a3, "state");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iB: BT Peripheral manager state update: %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
    v8 = qword_1022A0038;
    v14[0] = 67240192;
    v14[1] = objc_msgSend(a3, "state");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "iB: BT Peripheral manager state update: %{public}d", v14, 8);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (objc_msgSend(a3, "state") == (id)5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "iB: Attempt start", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
      LOWORD(v14[0]) = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0038, 2, "iB: Attempt start", v14, v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLSilo assertInside](-[CLPeripheralManagerDelegate silo](self, "silo"), "assertInside");
    v7 = -[CLPeripheralManagerDelegate provider](self, "provider");
    (*(void (**)(void *))(*(_QWORD *)v7 + 264))(v7);
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  _QWORD v13[204];

  if (a4)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380675;
      v13[0] = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning BT Peripheral manager error on advertising start attempt, %{private}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
      v6 = qword_1022A0038;
      v10 = 136380675;
      v11 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "#Warning BT Peripheral manager error on advertising start attempt, %{private}s", &v10, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidStartAdvertising:error:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021ABCC8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      LODWORD(v13[0]) = 0;
      WORD2(v13[0]) = 2082;
      *(_QWORD *)((char *)v13 + 6) = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: BT Peripheral manager started advertising\"}", buf, 0x12u);
    }
  }
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

@end
