@implementation CLOSTransaction

- (CLOSTransaction)initWithDescription:(const char *)a3
{
  CLOSTransaction *v4;
  NSObject *v5;
  NSString *description;
  NSString *v8;
  char *v9;
  objc_super v10;
  int v11;
  OS_os_transaction **v12;
  __int16 v13;
  NSString *v14;
  uint8_t buf[4];
  OS_os_transaction **p_transaction;
  __int16 v17;
  NSString *v18;

  v10.receiver = self;
  v10.super_class = (Class)CLOSTransaction;
  v4 = -[CLOSTransaction init](&v10, "init");
  if (v4)
  {
    v4->_description = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3);
    v4->_transaction = (OS_os_transaction *)os_transaction_create(a3);
    if (qword_1022A02B0 != -1)
      dispatch_once(&qword_1022A02B0, &stru_102161298);
    v5 = qword_1022A02B8;
    if (os_log_type_enabled((os_log_t)qword_1022A02B8, OS_LOG_TYPE_DEFAULT))
    {
      description = v4->_description;
      *(_DWORD *)buf = 134218242;
      p_transaction = &v4->_transaction;
      v17 = 2112;
      v18 = description;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction created: (%p) %@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02B0 != -1)
        dispatch_once(&qword_1022A02B0, &stru_102161298);
      v8 = v4->_description;
      v11 = 134218242;
      v12 = &v4->_transaction;
      v13 = 2112;
      v14 = v8;
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02B8, 0, "os_transaction created: (%p) %@", &v11, 22);
      sub_100512490("Generic", 1, 0, 2, "-[CLOSTransaction initWithDescription:]", "%s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *description;
  NSString *v5;
  char *v6;
  objc_super v7;
  int v8;
  OS_os_transaction **v9;
  __int16 v10;
  NSString *v11;
  uint8_t buf[4];
  OS_os_transaction **p_transaction;
  __int16 v14;
  NSString *v15;

  if (qword_1022A02B0 != -1)
    dispatch_once(&qword_1022A02B0, &stru_102161298);
  v3 = qword_1022A02B8;
  if (os_log_type_enabled((os_log_t)qword_1022A02B8, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 134218242;
    p_transaction = &self->_transaction;
    v14 = 2112;
    v15 = description;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "os_transaction released: (%p) %@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02B0 != -1)
      dispatch_once(&qword_1022A02B0, &stru_102161298);
    v5 = self->_description;
    v8 = 134218242;
    v9 = &self->_transaction;
    v10 = 2112;
    v11 = v5;
    v6 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02B8, 0, "os_transaction released: (%p) %@", &v8, 22);
    sub_100512490("Generic", 1, 0, 2, "-[CLOSTransaction dealloc]", "%s\n", v6);
    if (v6 != (char *)buf)
      free(v6);
  }

  self->_transaction = 0;
  self->_description = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLOSTransaction;
  -[CLOSTransaction dealloc](&v7, "dealloc");
}

@end
