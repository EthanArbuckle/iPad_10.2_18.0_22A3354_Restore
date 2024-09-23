@implementation CLFallTap2Radar

- (id)initInUniverse:(id)a3
{
  CLFallTap2Radar *v4;
  NSObject *v5;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  objc_super v10;
  uint8_t buf[1640];

  v10.receiver = self;
  v10.super_class = (Class)CLFallTap2Radar;
  v4 = -[CLFallTap2Radar init](&v10, "init");
  if (v4)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021982B8);
    v5 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Initializing CLFallTap2Radar instance", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021982B8);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Initializing CLFallTap2Radar instance", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLFallTap2Radar initInUniverse:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    v4->_universe = (CLIntersiloUniverse *)a3;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021982B8);
  v3 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down CLFallTap2Radar instance", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021982B8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Tearing down CLFallTap2Radar instance", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallTap2Radar dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)CLFallTap2Radar;
  -[CLFallTap2Radar dealloc](&v6, "dealloc");
}

- (BOOL)trigger:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6 response:(unsigned __int8)a7 resolution:(unsigned __int8)a8 isNearFall:(BOOL)a9 isFallSubmissionAllowed:(BOOL)a10 isNearFallSubmissionAllowed:(BOOL)a11
{
  NSObject *v11;
  const char *v12;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;

  sub_100197040();
  if (sub_10075D288())
  {
    if (a9 || a10)
    {
      if (a9 && !a11)
      {
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021982B8);
        v11 = qword_10229FD98;
        if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 68289026;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          v12 = "{\"msg%{public}.0s\":\"CLFallTap2Radar::trigger avoiding tap to radar as near fall submission is not allowed\"}";
          goto LABEL_14;
        }
      }
    }
    else
    {
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021982B8);
      v11 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v12 = "{\"msg%{public}.0s\":\"CLFallTap2Radar::trigger avoiding tap to radar as fall submission is not allowed\"}";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x12u);
      }
    }
  }
  return 0;
}

@end
