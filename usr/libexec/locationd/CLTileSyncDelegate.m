@implementation CLTileSyncDelegate

- (CLTileSyncDelegate)initWithSyncManager:(void *)a3 silo:(id)a4
{
  CLTileSyncDelegate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLTileSyncDelegate;
  result = -[CLTileSyncDelegate init](&v7, "init");
  if (result)
  {
    result->fManager = a3;
    result->fSilo = (CLSilo *)a4;
    result->fPsSession = 0;
  }
  return result;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7;
  int v8;
  double v10;
  NSObject *v11;
  const char *v13;
  uint8_t *v14;
  int v15;
  double v16;
  uint8_t buf[4];
  double v18;

  v7 = sub_10048919C((uint64_t)self->fManager, objc_msgSend(a4, "sessionMetadata", a3));
  v8 = *((unsigned __int8 *)self->fManager + 160);
  if (v8 == 82 || v8 == 73)
    v10 = 120.0;
  else
    v10 = 900.0;
  objc_msgSend(a4, "setMaxConcurrentMessages:", 1);
  objc_msgSend(a4, "setDelegate:", self);
  objc_msgSend(a4, "setSerializer:", objc_alloc_init(CLTileSyncSySerializer));
  objc_msgSend(a4, "setTargetQueue:", -[CLSilo queue](self->fSilo, "queue"));
  objc_msgSend(a4, "setSessionMetadata:", v7);
  objc_msgSend(a4, "setPerMessageTimeout:", 450.0);
  objc_msgSend(a4, "setFullSessionTimeout:", v10);
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v11 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, startSession, 2, timeout, %{public}.0f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v15 = 134349056;
    v16 = v10;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, CS, startSession, 2, timeout, %{public}.0f", &v15, 12);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:startSession:error:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v5 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, endSession, 6", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, CS, endSession, 6", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:sessionEnded:error:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)serviceDidPairDevice:(id)a3
{
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsService, serviceDidPairDevice, state, %{public}c", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v6 = *((char *)self->fManager + 160);
    v9[0] = 67240192;
    v9[1] = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, CsService, serviceDidPairDevice, state, %{public}c", v9, 8);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate serviceDidPairDevice:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)serviceDidUnpairDevice:(id)a3
{
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsService, serviceDidUnpairDevice, state, %{public}c", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v6 = *((char *)self->fManager + 160);
    v9[0] = 67240192;
    v9[1] = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, CsService, serviceDidUnpairDevice, state, %{public}c", v9, 8);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate serviceDidUnpairDevice:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v7 = objc_msgSend(objc_msgSend(a4, "userInfo", a3), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v8 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v17 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
    v18 = 2082;
    v19 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsError, 2, service, %{public}s, underlying, %{public}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = qword_1022A0058;
    v12 = 136446466;
    v13 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
    v14 = 2082;
    v15 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "@GtsSync, CsError, 2, service, %{public}s, underlying, %{public}s", &v12, 22);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:encounteredError:context:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  sub_100489ADC((uint64_t)self->fManager);
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  __int16 v7;
  NSObject *v8;
  NSObject *v9;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  _WORD v16[8];
  uint8_t buf[1640];

  v7 = sub_100489FA0((uint64_t)self->fManager, objc_msgSend(a3, "sessionMetadata"));
  if ((_BYTE)v7 && ((*((uint64_t (**)(id, _QWORD))a4 + 2))(a4, *((_QWORD *)self->fManager + 3)) & 1) == 0)
  {
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v8 = qword_1022A0058;
    if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, enqueue failed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0050 != -1)
        dispatch_once(&qword_1022A0050, &stru_10213D730);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, CsSession, enqueue failed", v16, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
  if ((v7 & 0xFF00) == 0)
    return 1;
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v9 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, enqueueComplete, 4", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v16[0] = 0;
    LODWORD(v15) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, CS, enqueueComplete, 4", v16, v15);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  return 2;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  uint64_t v18;
  int v19;
  id v20;
  uint8_t buf[4];
  id v22;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v8 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v22 = objc_msgSend(a4, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, applyChanges, %{public}lu\n", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v11 = qword_1022A0058;
    v19 = 134349056;
    v20 = objc_msgSend(a4, "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 1, "@GtsSync, CsSession, applyChanges, %{public}lu\n", &v19, 12);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  if ((unint64_t)objc_msgSend(a4, "count") >= 2)
  {
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = qword_1022A0058;
    if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(a4, "count");
      *(_DWORD *)buf = 134349056;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "@GtsSync, CsSession, More than 1 incoming change, %{public}lu, #CloneMe", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0050 != -1)
        dispatch_once(&qword_1022A0050, &stru_10213D730);
      v14 = qword_1022A0058;
      v15 = objc_msgSend(a4, "count");
      v19 = 134349056;
      v20 = v15;
      LODWORD(v18) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 16, "@GtsSync, CsSession, More than 1 incoming change, %{public}lu, #CloneMe", &v19, v18);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
  sub_10048A36C((uint64_t)self->fManager, objc_msgSend(a4, "objectAtIndexedSubscript:", 0));
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  _BYTE v21[10];
  id v22;
  uint8_t buf[4];
  _BYTE v24[10];
  id v25;

  v6 = objc_msgSend(objc_msgSend(a4, "userInfo", a3), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (a4)
  {
    v7 = v6;
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v8 = qword_1022A0058;
    if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v24 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
      *(_WORD *)&v24[8] = 2082;
      v25 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsError, 0, didEndWithError, %{public}s, underlying, %{public}s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0050 != -1)
        dispatch_once(&qword_1022A0050, &stru_10213D730);
      v14 = qword_1022A0058;
      v20 = 136446466;
      *(_QWORD *)v21 = objc_msgSend(objc_msgSend(a4, "localizedDescription"), "UTF8String");
      *(_WORD *)&v21[8] = 2082;
      v22 = objc_msgSend(objc_msgSend(v7, "localizedDescription"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 1, "@GtsSync, CsError, 0, didEndWithError, %{public}s, underlying, %{public}s", &v20, 22);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
  v9 = sub_10048AD8C((uint64_t)self->fManager, a4 != 0);
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v10 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v24 = a4 != 0;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, sessionDidEnd, 5, error, %{public}d, synctrap, %{public}d", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v20 = 67240448;
    *(_DWORD *)v21 = a4 != 0;
    *(_WORD *)&v21[4] = 1026;
    *(_DWORD *)&v21[6] = v9;
    LODWORD(v19) = 14;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, CS, sessionDidEnd, 5, error, %{public}d, synctrap, %{public}d", &v20, v19);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  if (v9)
  {
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v11 = qword_1022A0058;
    if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteTx, 2", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0050 != -1)
        dispatch_once(&qword_1022A0050, &stru_10213D730);
      LOWORD(v20) = 0;
      LODWORD(v19) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, PS, syncDidCompleteTx, 2", &v20, v19);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    -[PSYServiceSyncSession syncDidComplete](self->fPsSession, "syncDidComplete");
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, resetDataStoreWithError", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, CsSession, resetDataStoreWithError", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:resetDataStoreWithError:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  return 1;
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v8 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v17 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    v18 = 2082;
    v19 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsService, willSwitchPairing, old, %{public}s, new, %{public}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = qword_1022A0058;
    v12 = 136446466;
    v13 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    v14 = 2082;
    v15 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "@GtsSync, CsService, willSwitchPairing, old, %{public}s, new, %{public}s", &v12, 22);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:willSwitchFromPairingID:toPairingID:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  sub_10048B49C((uint64_t)self->fManager, a5);
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v8 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v17 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    v18 = 2082;
    v19 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsService, didSwitchPairing, old, %{public}s, new, %{public}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = qword_1022A0058;
    v12 = 136446466;
    v13 = objc_msgSend(objc_msgSend(a4, "UUIDString"), "UTF8String");
    v14 = 2082;
    v15 = objc_msgSend(objc_msgSend(a5, "UUIDString"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "@GtsSync, CsService, didSwitchPairing, old, %{public}s, new, %{public}s", &v12, 22);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:didSwitchFromPairingID:toPairingID:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  sub_10048B8E8((uint64_t)self->fManager, a4 == 0, a5 == 0);
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v7;
  NSObject *v8;
  CLSilo *fSilo;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  _QWORD v13[6];
  int v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v7 = a4;

  self->fPsSession = (PSYServiceSyncSession *)a4;
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v8 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v17 = objc_msgSend(objc_msgSend(a3, "activeSyncSession"), "syncSessionType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, beginSyncSession, %{public}lu", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v10 = qword_1022A0058;
    v14 = 134349056;
    v15 = objc_msgSend(objc_msgSend(a3, "activeSyncSession"), "syncSessionType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 1, "@GtsSync, PsCoord, beginSyncSession, %{public}lu", &v14, 12);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:beginSyncSession:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  fSilo = self->fSilo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10048BDD8;
  v13[3] = &unk_10212BB30;
  v13[4] = a3;
  v13[5] = self;
  -[CLSilo sync:](fSilo, "sync:", v13);
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint8_t buf[4];
  unsigned int v20;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v6 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v20 = objc_msgSend(a4, "syncSessionType");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, didInvalidateSyncSession, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v9 = qword_1022A0058;
    v17 = 67240192;
    v18 = objc_msgSend(a4, "syncSessionType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "@GtsSync, PsCoord, didInvalidateSyncSession, %{public}d", &v17, 8);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v7 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(a3, "syncRestriction");
    *(_DWORD *)buf = 67240192;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, didInvalidateSession, 3, restriction, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v12 = qword_1022A0058;
    v13 = objc_msgSend(a3, "syncRestriction");
    v17 = 67240192;
    v18 = v13;
    LODWORD(v16) = 8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 0, "@GtsFlow, PS, didInvalidateSession, 3, restriction, %{public}d", &v17, v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  NSObject *v5;
  CLSilo *fSilo;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[6];
  _DWORD v11[4];
  uint8_t buf[4];
  unsigned int v13;

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v5 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v13 = objc_msgSend(a3, "syncRestriction");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, syncCoordinatorDidChangeSyncRestriction, %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v7 = qword_1022A0058;
    v11[0] = 67240192;
    v11[1] = objc_msgSend(a3, "syncRestriction");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 1, "@GtsSync, PsCoord, syncCoordinatorDidChangeSyncRestriction, %{public}d", v11, 8);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinatorDidChangeSyncRestriction:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  fSilo = self->fSilo;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10048CCCC;
  v10[3] = &unk_10212BB30;
  v10[4] = a3;
  v10[5] = self;
  -[CLSilo sync:](fSilo, "sync:", v10);
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, initialSyncDidCompleteForPairingID", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, PsObserver, initialSyncDidCompleteForPairingID", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:initialSyncDidCompleteForPairingIdentifier:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  CLSilo *fSilo;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD v13[5];
  _WORD v14[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v5 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, syncDidCompleteForPairingID", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, PsObserver, syncDidCompleteForPairingID", v14, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v6 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteRx, 4", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v14[0] = 0;
    LODWORD(v12) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsFlow, PS, syncDidCompleteRx, 4", v14, v12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  fSilo = self->fSilo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10048D7E0;
  v13[3] = &unk_10212BB58;
  v13[4] = self;
  -[CLSilo sync:](fSilo, "sync:", v13);
}

- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v4 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, syncDidResetForPairingID", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, PsObserver, syncDidResetForPairingID", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidResetForPairingIdentifier:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0050 != -1)
    dispatch_once(&qword_1022A0050, &stru_10213D730);
  v3 = qword_1022A0058;
  if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, initialSyncStateObserverClientCanRetryFailedRequests", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 1, "@GtsSync, PsObserver, initialSyncStateObserverClientCanRetryFailedRequests", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserverClientCanRetryFailedRequests:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

@end
