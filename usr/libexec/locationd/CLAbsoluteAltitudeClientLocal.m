@implementation CLAbsoluteAltitudeClientLocal

- (CLAbsoluteAltitudeClientLocal)initWithElevationSubscription:(void *)a3
{
  CLAbsoluteAltitudeClientLocal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLAbsoluteAltitudeClientLocal;
  result = -[CLAbsoluteAltitudeClientLocal init](&v5, "init");
  if (result)
  {
    result->_elevationSubscription = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onAbsoluteAltitudeUpdate:(id)a3
{
  sub_100872D04((uint64_t)self->_elevationSubscription, a3);
}

- (void)onElevationThresold:(float)a3 direction:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  double v10;
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  _BOOL4 v16;

  v4 = a4;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102158628);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = a3;
    v15 = 1024;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "elevation threshold alert,threshold,%f,above,%d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102158628);
    v9 = 134218240;
    v10 = a3;
    v11 = 1024;
    v12 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "elevation threshold alert,threshold,%f,above,%d", COERCE_DOUBLE(&v9), 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLAbsoluteAltitudeClientLocal onElevationThresold:direction:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
