@implementation CLEEDHelperService

- (CLEEDHelperService)initWithUniverse:(id)a3 pendingRequestsCB:(id)a4 streamingRequestCB:(id)a5 uploadRequestCB:(id)a6 streamingEndCB:(id)a7 uploadListCB:(id)a8 handleResponseCB:(id)a9 mitigationsCB:(id)a10
{
  uint64_t *v17;
  NSObject *v18;
  CLEEDHelperService *v19;
  NSXPCListener *v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint8_t *v24;
  NSObject *v25;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v32;
  objc_super v33;
  int v34;
  const char *v35;
  uint8_t buf[4];
  const char *v37;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v17 = &qword_1022A0000;
  v18 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v34 = 136446210;
    v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v34, 12);
    v28 = (uint8_t *)v27;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v27);
    if (v28 != buf)
      free(v28);
    v17 = &qword_1022A0000;
  }
  v33.receiver = self;
  v33.super_class = (Class)CLEEDHelperService;
  v19 = -[CLEEDHelperService init](&v33, "init");
  if (v19)
  {
    v19->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(objc_msgSend(a3, "silo"), "queue"));
    v19->fPendingRequestsCB = _Block_copy(a4);
    v19->fStreamingRequestCB = _Block_copy(a5);
    v19->fUploadRequestCB = _Block_copy(a6);
    v19->fStreamingEndCB = _Block_copy(a7);
    v19->fUploadListCB = _Block_copy(a8);
    v19->fHandleResponseCB = _Block_copy(a9);
    v19->fFetchMitigationsCB = _Block_copy(a10);
    v20 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationd.eedhelper"));
    v19->fListener = v20;
    if (v20)
    {
      -[NSXPCListener _setQueue:](v20, "_setQueue:", objc_msgSend(-[CLIntersiloUniverse silo](v19->fUniverse, "silo"), "queue"));
      -[NSXPCListener setDelegate:](v19->fListener, "setDelegate:", v19);
      -[NSXPCListener activate](v19->fListener, "activate");
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v21 = v17[17];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, Listener activated", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_1021B7800);
        v22 = v17[17];
        v34 = 136446210;
        v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        LODWORD(v32) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v22, 2, "#EED2FWK,%{public}s, Listener activated", &v34, v32);
        v24 = (uint8_t *)v23;
        sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v23);
        if (v24 != buf)
          free(v24);
      }
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v25 = v17[17];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Could not establish listener", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_1021B7800);
        v29 = v17[17];
        v34 = 136446210;
        v35 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        LODWORD(v32) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v29, 16, "#EED2FWK,%{public}s, Could not establish listener", &v34, v32);
        v31 = (uint8_t *)v30;
        sub_100512490("Generic", 1, 0, 0, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v30);
        if (v31 != buf)
          free(v31);
      }

      return 0;
    }
  }
  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  int v7;
  const char *v8;
  uint8_t buf[4];
  const char *v10;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[CLEEDHelperService dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v7 = 136446210;
    v8 = "-[CLEEDHelperService dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v7, 12);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[NSMutableArray removeAllObjects](self->fConnections, "removeAllObjects");

  self->fConnections = 0;
  -[NSXPCListener invalidate](self->fListener, "invalidate");

  self->fListener = 0;
  _Block_release(self->fPendingRequestsCB);
  self->fPendingRequestsCB = 0;
  _Block_release(self->fStreamingRequestCB);
  self->fStreamingRequestCB = 0;
  _Block_release(self->fUploadRequestCB);
  self->fUploadRequestCB = 0;
  _Block_release(self->fStreamingEndCB);
  self->fStreamingEndCB = 0;
  _Block_release(self->fUploadListCB);
  self->fUploadListCB = 0;
  _Block_release(self->fHandleResponseCB);
  self->fHandleResponseCB = 0;
  _Block_release(self->fFetchMitigationsCB);
  self->fFetchMitigationsCB = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLEEDHelperService;
  -[CLEEDHelperService dealloc](&v6, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSMutableArray *fConnections;
  NSObject *v11;
  unsigned int v12;
  _BOOL4 v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id from;
  id location;
  int v36;
  const char *v37;
  __int16 v38;
  unsigned int v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  unsigned int v43;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v6 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    v42 = 1024;
    v43 = objc_msgSend(a4, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, client[%d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v16 = qword_1022A0088;
    v36 = 136446466;
    v37 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    v38 = 1024;
    v39 = objc_msgSend(a4, "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 0, "#EED2FWK,%{public}s, client[%d]", &v36, 18);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  if (qword_10230F1B0 != -1)
    dispatch_once(&qword_10230F1B0, &stru_1021B76C8);
  v8 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.eedhelperservice"));
  if (v8
    && (v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && objc_msgSend(v8, "BOOLValue"))
  {
    fConnections = self->fConnections;
    if (!fConnections)
    {
      fConnections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->fConnections = fConnections;
    }
    -[NSMutableArray addObject:](fConnections, "addObject:", a4);
    objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
    objc_msgSend(a4, "setExportedInterface:", qword_10230F1A0);
    objc_msgSend(a4, "setExportedObject:", self);
    objc_msgSend(a4, "setRemoteObjectInterface:", qword_10230F1A8);
    objc_initWeak(&location, self);
    objc_initWeak(&from, a4);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10145E660;
    v31[3] = &unk_1021B76F0;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    objc_msgSend(a4, "setInvalidationHandler:", v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10145E870;
    v29[3] = &unk_10213D3A8;
    objc_copyWeak(&v30, &from);
    objc_msgSend(a4, "setInterruptionHandler:", v29);
    objc_msgSend(a4, "activate");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v11 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(a4, "processIdentifier");
      *(_DWORD *)buf = 136446466;
      v41 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      v42 = 1026;
      v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, New connection resumed with pid:%{public}d", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v23 = qword_1022A0088;
      v24 = objc_msgSend(a4, "processIdentifier");
      v36 = 136446466;
      v37 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      v38 = 1026;
      v39 = v24;
      LODWORD(v28) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "#EED2FWK,%{public}s, New connection resumed with pid:%{public}d", &v36, v28);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    LOBYTE(v13) = 1;
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v14 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      v15 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
      *(_DWORD *)buf = 136446466;
      v41 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      v42 = 1024;
      v43 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Error in entilement check. Client[%d] does not have entitlement", buf, 0x12u);
    }
    v13 = sub_1001BFF7C(115, 0);
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v19 = qword_1022A0088;
      v20 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
      v36 = 136446466;
      v37 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      v38 = 1024;
      v39 = v20;
      LODWORD(v28) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 16, "#EED2FWK,%{public}s, Error in entilement check. Client[%d] does not have entitlement", &v36, v28);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)connectToEEDHelper
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unsigned int v13;

  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v2 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[CLEEDHelperService connectToEEDHelper]";
    v12 = 1026;
    v13 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d], client connected to CLEEDHelperService", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v3 = qword_1022A0088;
    v6 = 136446466;
    v7 = "-[CLEEDHelperService connectToEEDHelper]";
    v8 = 1026;
    v9 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v3, 2, "#EED2FWK,%{public}s[client:%{public}d], client connected to CLEEDHelperService", &v6, 18);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService connectToEEDHelper]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)fetchAllPendingRequestsWithCompletion:(id)a3
{
  NSObject *v5;
  void (**fPendingRequestsCB)(id, _QWORD *);
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[6];
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    v19 = 1026;
    v20 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v7 = qword_1022A0088;
    v13 = 136446466;
    v14 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    v15 = 1026;
    v16 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v13, 18);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fPendingRequestsCB = (void (**)(id, _QWORD *))self->fPendingRequestsCB;
  if (fPendingRequestsCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10145EF0C;
    v10[3] = &unk_1021B7718;
    v10[4] = self;
    v10[5] = a3;
    fPendingRequestsCB[2](fPendingRequestsCB, v10);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3
{
  NSObject *v5;
  void (**fUploadRequestCB)(id, _QWORD *);
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[6];
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    v19 = 1026;
    v20 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v7 = qword_1022A0088;
    v13 = 136446466;
    v14 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    v15 = 1026;
    v16 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v13, 18);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fUploadRequestCB = (void (**)(id, _QWORD *))self->fUploadRequestCB;
  if (fUploadRequestCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10145F3D8;
    v10[3] = &unk_1021B7740;
    v10[4] = self;
    v10[5] = a3;
    fUploadRequestCB[2](fUploadRequestCB, v10);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3
{
  NSObject *v5;
  void (**fStreamingRequestCB)(id, _QWORD *);
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[6];
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    v19 = 1026;
    v20 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v7 = qword_1022A0088;
    v13 = 136446466;
    v14 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    v15 = 1026;
    v16 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v13, 18);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fStreamingRequestCB = (void (**)(id, _QWORD *))self->fStreamingRequestCB;
  if (fStreamingRequestCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10145F8AC;
    v10[3] = &unk_1021B7768;
    v10[4] = self;
    v10[5] = a3;
    fStreamingRequestCB[2](fStreamingRequestCB, v10);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)fetchMitigationsWithCompletion:(id)a3
{
  NSObject *v5;
  void (**fFetchMitigationsCB)(id, _QWORD *);
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[6];
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    v19 = 1026;
    v20 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v7 = qword_1022A0088;
    v13 = 136446466;
    v14 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    v15 = 1026;
    v16 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v13, 18);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService fetchMitigationsWithCompletion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fFetchMitigationsCB = (void (**)(id, _QWORD *))self->fFetchMitigationsCB;
  if (fFetchMitigationsCB)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10145FD78;
    v10[3] = &unk_1021B7790;
    v10[4] = self;
    v10[5] = a3;
    fFetchMitigationsCB[2](fFetchMitigationsCB, v10);
  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  void (**fUploadListCB)(id, id, id, _QWORD *);
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD v18[6];
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    v29 = 1026;
    LODWORD(v30) = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v12 = qword_1022A0088;
    v21 = 136446466;
    v22 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    v23 = 1026;
    LODWORD(v24) = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v21, 18);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v10 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446723;
    v28 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    v29 = 2113;
    v30 = a3;
    v31 = 2114;
    v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received mediaUploadList:%{private}@ forRequestID:%{public}@", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v21 = 136446723;
    v22 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    v23 = 2113;
    v24 = a3;
    v25 = 2114;
    v26 = a4;
    LODWORD(v17) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, received mediaUploadList:%{private}@ forRequestID:%{public}@", &v21, v17);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
  fUploadListCB = (void (**)(id, id, id, _QWORD *))self->fUploadListCB;
  if (fUploadListCB)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1014603DC;
    v18[3] = &unk_1021B77B8;
    v18[4] = self;
    v18[5] = a5;
    fUploadListCB[2](fUploadListCB, a3, a4, v18);
  }
  else
  {
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, id))a5 + 2))(a5, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
  }
}

- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  void (**fStreamingEndCB)(id, id, _QWORD *);
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD v16[6];
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    v25 = 1026;
    LODWORD(v26) = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v10 = qword_1022A0088;
    v19 = 136446466;
    v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    v21 = 1026;
    LODWORD(v22) = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v19, 18);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v8 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    v25 = 2114;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received streamingSessionEndedForRequestID:%{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v19 = 136446466;
    v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    v21 = 2114;
    v22 = a3;
    LODWORD(v15) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, received streamingSessionEndedForRequestID:%{public}@", &v19, v15);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  fStreamingEndCB = (void (**)(id, id, _QWORD *))self->fStreamingEndCB;
  if (fStreamingEndCB)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_101460A00;
    v16[3] = &unk_1021B77B8;
    v16[4] = self;
    v16[5] = a4;
    fStreamingEndCB[2](fStreamingEndCB, a3, v16);
  }
  else
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, id))a4 + 2))(a4, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
  }
}

- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  _BOOL8 v7;
  NSObject *v9;
  NSObject *v10;
  void (**fHandleResponseCB)(id, _BOOL8, id, _QWORD *);
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD v18[6];
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  int v21;
  const char *v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  id v32;

  v7 = a3;
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    v29 = 1026;
    v30 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v12 = qword_1022A0088;
    v21 = 136446466;
    v22 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    v23 = 1026;
    v24 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "#EED2FWK,%{public}s[client:%{public}d]", &v21, 18);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v10 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    v29 = 1026;
    v30 = v7;
    v31 = 2114;
    v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received handleResponse:%{public}u forRequestID:%{public}@", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v21 = 136446722;
    v22 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    v23 = 1026;
    v24 = v7;
    v25 = 2114;
    v26 = a4;
    LODWORD(v17) = 28;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, received handleResponse:%{public}u forRequestID:%{public}@", &v21, v17);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
  fHandleResponseCB = (void (**)(id, _BOOL8, id, _QWORD *))self->fHandleResponseCB;
  if (fHandleResponseCB)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_101461048;
    v18[3] = &unk_1021B77E0;
    v18[4] = self;
    v18[5] = a5;
    fHandleResponseCB[2](fHandleResponseCB, v7, a4, v18);
  }
  else
  {
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("EED is unable to service this request");
    (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
  }
}

- (BOOL)notifyNewRequestAvailable
{
  NSObject *v3;
  NSMutableArray *fConnections;
  NSObject *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  id v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v29 = 136446210;
    v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v29, 12);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)-[NSMutableArray count](fConnections, "count");
    if (fConnections)
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v5 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received notifyNewRequestAvailable request from EED", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_1021B7800);
        v29 = 136446210;
        v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, received notifyNewRequestAvailable request from EED", &v29, v23);
        v21 = (uint8_t *)v20;
        sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v20);
        if (v21 != buf)
          free(v21);
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = self->fConnections;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v26;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v10);
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_101461810;
            v24[3] = &unk_102143618;
            v24[4] = v11;
            v12 = objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
            if (v12)
            {
              v13 = v12;
              if (qword_1022A0080 != -1)
                dispatch_once(&qword_1022A0080, &stru_1021B7800);
              v14 = qword_1022A0088;
              if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                v37 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                v38 = 2114;
                v39 = v11;
                v40 = 2114;
                v41 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", buf, 0x20u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1022A0080 != -1)
                  dispatch_once(&qword_1022A0080, &stru_1021B7800);
                v29 = 136446722;
                v30 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                v31 = 2114;
                v32 = v11;
                v33 = 2114;
                v34 = v13;
                LODWORD(v23) = 32;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", &v29, v23);
                v16 = (uint8_t *)v15;
                sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v15);
                if (v16 != buf)
                  free(v16);
              }
              objc_msgSend(v13, "notifyNewRequestAvailable");
            }
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
          v8 = v17;
        }
        while (v17);
      }
      LOBYTE(fConnections) = 1;
    }
  }
  return (char)fConnections;
}

- (BOOL)notifyMitigationNeeded:(id)a3
{
  NSObject *v4;
  NSMutableArray *fConnections;
  NSObject *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  id v18;
  const char *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v24;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021B7800);
  v4 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021B7800);
    v31 = 136446210;
    v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v31, 12);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)-[NSMutableArray count](fConnections, "count");
    if (fConnections)
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021B7800);
      v6 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        v40 = 2114;
        v41 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received notifyMitigationNeeded:%{public}@ from EED", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_1021B7800);
        v31 = 136446466;
        v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        v33 = 2114;
        v34 = a3;
        LODWORD(v24) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, received notifyMitigationNeeded:%{public}@ from EED", &v31, v24);
        v22 = (uint8_t *)v21;
        sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v21);
        if (v22 != buf)
          free(v22);
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = self->fConnections;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v28;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v28 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_101462054;
            v26[3] = &unk_102143618;
            v26[4] = v12;
            v13 = objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v26);
            if (v13)
            {
              v14 = v13;
              if ((objc_opt_respondsToSelector(v13, "notifyMitigationNeeded:") & 1) != 0)
              {
                if (qword_1022A0080 != -1)
                  dispatch_once(&qword_1022A0080, &stru_1021B7800);
                v15 = qword_1022A0088;
                if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446722;
                  v39 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  v40 = 2114;
                  v41 = v12;
                  v42 = 2114;
                  v43 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", buf, 0x20u);
                }
                if (sub_1001BFF7C(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1022A0080 != -1)
                    dispatch_once(&qword_1022A0080, &stru_1021B7800);
                  v31 = 136446722;
                  v32 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  v33 = 2114;
                  v34 = v12;
                  v35 = 2114;
                  v36 = v14;
                  LODWORD(v24) = 32;
                  _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", &v31, v24);
                  v17 = (uint8_t *)v16;
                  sub_100512490("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v16);
                  if (v17 != buf)
                    free(v17);
                }
                objc_msgSend(v14, "notifyMitigationNeeded:", a3);
              }
            }
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          v9 = v18;
        }
        while (v18);
      }
      LOBYTE(fConnections) = 1;
    }
  }
  return (char)fConnections;
}

@end
