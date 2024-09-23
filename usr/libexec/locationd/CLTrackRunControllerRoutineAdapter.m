@implementation CLTrackRunControllerRoutineAdapter

- (CLTrackRunControllerRoutineAdapter)initWithTrackRunController:(void *)a3
{
  CLTrackRunControllerRoutineAdapter *v4;
  CLTrackRunControllerRoutineAdapter *v5;
  NSObject *v6;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  objc_super v11;
  uint8_t buf[1640];

  v11.receiver = self;
  v11.super_class = (Class)CLTrackRunControllerRoutineAdapter;
  v4 = -[CLTrackRunControllerRoutineAdapter init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->_trcEncloser = a3;
    v4->_valid = a3 != 0;
  }
  if (qword_10229FC50 != -1)
    dispatch_once(&qword_10229FC50, &stru_1021B27D8);
  v6 = qword_10229FC58;
  if (os_log_type_enabled((os_log_t)qword_10229FC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#cltrm,initWithTrackRunController", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC50 != -1)
      dispatch_once(&qword_10229FC50, &stru_1021B27D8);
    v10[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC58, 0, "#cltrm,initWithTrackRunController", v10, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackRunControllerRoutineAdapter initWithTrackRunController:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  return v5;
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FC50 != -1)
    dispatch_once(&qword_10229FC50, &stru_1021B27D8);
  v5 = qword_10229FC58;
  if (os_log_type_enabled((os_log_t)qword_10229FC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#cltrm,onVisit", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC50 != -1)
      dispatch_once(&qword_10229FC50, &stru_1021B27D8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC58, 0, "#cltrm,onVisit", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackRunControllerRoutineAdapter onVisit:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  sub_10139FCF4((uint64_t)self->_trcEncloser, a3);
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
