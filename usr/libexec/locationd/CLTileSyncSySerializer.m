@implementation CLTileSyncSySerializer

- (id)dataFromChange:(id)a3
{
  uint64_t v4;
  char isKindOfClass;
  id v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[4];
  uint8_t buf[4];
  int v13;

  v4 = objc_opt_class(CLTileSyncSyChange, a2);
  isKindOfClass = objc_opt_isKindOfClass(a3, v4);
  v6 = objc_msgSend(objc_alloc(off_1022A1AF0()), "initWithProperties:", objc_msgSend(a3, "properties"));
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v7 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v13 = isKindOfClass & 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "@GtsSync, CsSerial, dataFromChange, isKind, %{public}d\n", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v11[0] = 67240192;
    v11[1] = isKindOfClass & 1;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, CsSerial, dataFromChange, isKind, %{public}d\n", v11, 8);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncSySerializer dataFromChange:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if ((isKindOfClass & 1) != 0)
    return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  else
    return 0;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  NSObject *v5;
  const char *v7;
  uint8_t *v8;
  int v9;
  int64_t v10;
  uint8_t buf[4];
  int64_t v12;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v5 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "@GtsWarn, GizmoSync, changeFromData, %ld, #CloneMe", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = 134217984;
    v10 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsWarn, GizmoSync, changeFromData, %ld, #CloneMe", &v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncSySerializer changeFromData:ofType:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  return 0;
}

@end
