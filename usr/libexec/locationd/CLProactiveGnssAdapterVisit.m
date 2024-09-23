@implementation CLProactiveGnssAdapterVisit

- (CLProactiveGnssAdapterVisit)initWithProactiveGnss:(void *)a3
{
  CLProactiveGnssAdapterVisit *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLProactiveGnssAdapterVisit;
  result = -[CLProactiveGnssAdapterVisit init](&v5, "init");
  if (result)
  {
    result->_valid = 0;
    if (a3)
    {
      result->_visitProactiveGnss = a3;
      result->_valid = 1;
    }
  }
  return result;
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  void *visitProactiveGnss;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A0070 != -1)
    dispatch_once(&qword_1022A0070, &stru_1021D3F80);
  v5 = qword_1022A0078;
  if (os_log_type_enabled((os_log_t)qword_1022A0078, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ProactiveGnss,onVisit", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0070 != -1)
      dispatch_once(&qword_1022A0070, &stru_1021D3F80);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0078, 2, "ProactiveGnss,onVisit", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLProactiveGnssAdapterVisit onVisit:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  visitProactiveGnss = self->_visitProactiveGnss;
  if (visitProactiveGnss)
    sub_101860A04((uint64_t)visitProactiveGnss, a3);
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
