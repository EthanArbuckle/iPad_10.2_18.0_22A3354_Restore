@implementation CLCompanionNotifierCompanionAdapter

- (CLCompanionNotifierCompanionAdapter)initWithCompanionNotifierCompanion:(void *)a3
{
  CLCompanionNotifierCompanionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLCompanionNotifierCompanionAdapter;
  result = -[CLCompanionNotifierCompanionAdapter init](&v5, "init");
  if (result)
  {
    result->_companionNotifierCompanion = a3;
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
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;

  sub_100E71728((uint64_t)self->_companionNotifierCompanion, a3);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10218D350);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "filteredPressure");
    *(_DWORD *)buf = 134217984;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "received filtered pressure in CompanionNotifierCompanion,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10218D350);
    v6 = qword_10229FE88;
    objc_msgSend(a3, "filteredPressure");
    v10 = 134217984;
    v11 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "received filtered pressure in CompanionNotifierCompanion,%f", COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionNotifierCompanionAdapter onAbsoluteAltitudeUpdate:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
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
