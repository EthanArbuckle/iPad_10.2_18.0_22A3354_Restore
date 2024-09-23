@implementation CLEEDMediaServiceHandler

- (CLEEDMediaServiceHandler)initWithUniverse:(id)a3 serviceCompletionCB:(id)a4 getMitigationCB:(id)a5 getUploadConfigCB:(id)a6 errorCB:(id)a7
{
  NSObject *v13;
  CLEEDMediaServiceHandler *v14;
  CLEEDMediaServiceHandler *v15;
  const char *v17;
  uint8_t *v18;
  objc_super v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v13 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v31 = "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]";
    v32 = 2114;
    v33 = a3;
    v34 = 2114;
    v35 = a4;
    v36 = 2114;
    v37 = a7;
    v38 = 2114;
    v39 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[universe:%{public}@,serviceCompletionCB:%{public}@,errorCB:%{public}@,getMitigationCB:%{public}@]", buf, 0x34u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v20 = 136447234;
    v21 = "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]";
    v22 = 2114;
    v23 = a3;
    v24 = 2114;
    v25 = a4;
    v26 = 2114;
    v27 = a7;
    v28 = 2114;
    v29 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s[universe:%{public}@,serviceCompletionCB:%{public}@,errorCB:%{public}@,getMitigationCB:%{public}@]", &v20, 52);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CLEEDMediaServiceHandler;
  v14 = -[CLEEDMediaServiceHandler init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    v14->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(objc_msgSend(a3, "silo"), "queue"));
    v15->fConnection = 0;
    v15->fCompletionCallback = _Block_copy(a4);
    v15->fErrorCallback = _Block_copy(a7);
    v15->fGetMitigationCallback = _Block_copy(a5);
    v15->fGetUploadConfigCallback = _Block_copy(a6);
    -[CLEEDMediaServiceHandler connectToMediaService](v15, "connectToMediaService");
  }
  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCConnection *fConnection;
  id fCompletionCallback;
  id fErrorCallback;
  id fGetMitigationCallback;
  id fGetUploadConfigCallback;
  const char *v9;
  uint8_t *v10;
  objc_super v11;
  int v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[CLEEDMediaServiceHandler dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v12 = 136446210;
    v13 = "-[CLEEDMediaServiceHandler dealloc]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s", &v12, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler dealloc]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  fConnection = self->fConnection;
  if (fConnection)
  {

    self->fConnection = 0;
  }
  fCompletionCallback = self->fCompletionCallback;
  if (fCompletionCallback)
  {
    _Block_release(fCompletionCallback);
    self->fCompletionCallback = 0;
  }
  fErrorCallback = self->fErrorCallback;
  if (fErrorCallback)
  {
    _Block_release(fErrorCallback);
    self->fErrorCallback = 0;
  }
  fGetMitigationCallback = self->fGetMitigationCallback;
  if (fGetMitigationCallback)
  {
    _Block_release(fGetMitigationCallback);
    self->fGetMitigationCallback = 0;
  }
  fGetUploadConfigCallback = self->fGetUploadConfigCallback;
  if (fGetUploadConfigCallback)
  {
    _Block_release(fGetUploadConfigCallback);
    self->fGetUploadConfigCallback = 0;
  }
  self->fUniverse = 0;
  v11.receiver = self;
  v11.super_class = (Class)CLEEDMediaServiceHandler;
  -[CLEEDMediaServiceHandler dealloc](&v11, "dealloc");
}

- (void)connectToMediaService
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *fConnection;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  id location;
  int v21;
  const char *v22;
  uint8_t buf[4];
  const char *v24;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v21 = 136446210;
    v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s", &v21, 12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (qword_10230E3E0 != -1)
    dispatch_once(&qword_10230E3E0, &stru_1021AFB08);
  if (!self->fConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.corelocation.eedmediaservice"));
    self->fConnection = v4;
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", qword_10230E3D0);
    -[NSXPCConnection setExportedInterface:](self->fConnection, "setExportedInterface:", qword_10230E3D8);
    -[NSXPCConnection setExportedObject:](self->fConnection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:](self->fConnection, "_setQueue:", objc_msgSend(-[CLIntersiloUniverse silo](self->fUniverse, "silo"), "queue"));
    -[NSXPCConnection setInvalidationHandler:](self->fConnection, "setInvalidationHandler:", &stru_1021AFB28);
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_101342C88;
    v18[3] = &unk_1021AFB50;
    objc_copyWeak(&v19, &location);
    v18[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->fConnection, "setInterruptionHandler:", v18);
    -[NSXPCConnection activate](self->fConnection, "activate");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, connection to EEDMediaService configured", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021AFB70);
      v21 = 136446210;
      v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      LODWORD(v16) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s, connection to EEDMediaService configured", &v21, v16);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v6 = (*((uint64_t (**)(void))self->fGetMitigationCallback + 2))();
    v7 = (*((uint64_t (**)(void))self->fGetUploadConfigCallback + 2))();
    fConnection = self->fConnection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_101343044;
    v17[3] = &unk_102143618;
    v17[4] = self;
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v17), "connectToMediaService:uploadConfig:", v6, v7);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v9 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v24 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, establishing connection to EEDMediaService", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021AFB70);
      v21 = 136446210;
      v22 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      LODWORD(v16) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s, establishing connection to EEDMediaService", &v21, v16);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  NSObject *v7;
  void (**fErrorCallback)(id, id);
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v21 = "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]";
    v22 = 1026;
    v23 = a4;
    v24 = 2114;
    v25 = objc_msgSend(a3, "localizedDescription");
    v26 = 2114;
    v27 = objc_msgSend(a3, "localizedFailureReason");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s[%{public}d]: %{public}@ %{public}@\n", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v9 = qword_1022A0088;
    v12 = 136446978;
    v13 = "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]";
    v14 = 1026;
    v15 = a4;
    v16 = 2114;
    v17 = objc_msgSend(a3, "localizedDescription");
    v18 = 2114;
    v19 = objc_msgSend(a3, "localizedFailureReason");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 16, "#EED2FWK,%{public}s[%{public}d]: %{public}@ %{public}@\n", &v12, 38);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  fErrorCallback = (void (**)(id, id))self->fErrorCallback;
  if (fErrorCallback)
    fErrorCallback[2](fErrorCallback, a3);
}

- (void)cleanup
{
  NSObject *v3;
  NSXPCConnection *fConnection;
  NSObject *v5;
  NSXPCConnection *v6;
  const char *v7;
  uint8_t *v8;
  NSXPCConnection *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSXPCConnection *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSXPCConnection *v20;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v18 = "-[CLEEDMediaServiceHandler cleanup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v13 = 136446210;
    v14 = "-[CLEEDMediaServiceHandler cleanup]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v13, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    -[NSXPCConnection invalidate](fConnection, "invalidate");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->fConnection;
      *(_DWORD *)buf = 136446466;
      v18 = "-[CLEEDMediaServiceHandler cleanup]";
      v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, client[%{public}@] disconnected from EEDMediaService", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021AFB70);
      v9 = self->fConnection;
      v13 = 136446466;
      v14 = "-[CLEEDMediaServiceHandler cleanup]";
      v15 = 2114;
      v16 = v9;
      LODWORD(v12) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2FWK,%{public}s, client[%{public}@] disconnected from EEDMediaService", &v13, v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)processMediaForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11
{
  NSObject *v15;
  NSXPCConnection *fConnection;
  const char *v17;
  uint8_t *v18;
  _QWORD v22[5];
  _QWORD v23[5];
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v15 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448259;
    v45 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    v46 = 2114;
    v47 = a3;
    v48 = 2114;
    v49 = a4;
    v50 = 2114;
    v51 = a5;
    v52 = 2113;
    v53 = a6;
    v54 = 2113;
    v55 = a7;
    v56 = 2113;
    v57 = a8;
    v58 = 2114;
    v59 = a10;
    v60 = 2114;
    v61 = a9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, requestID:%{public}@, callUUID:%{public}@, url:%{public}@, prefix:%{private}@, combinedsecret:%{private}@, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@", buf, 0x5Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v26 = 136448259;
    v27 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    v28 = 2114;
    v29 = a3;
    v30 = 2114;
    v31 = a4;
    v32 = 2114;
    v33 = a5;
    v34 = 2113;
    v35 = a6;
    v36 = 2113;
    v37 = a7;
    v38 = 2113;
    v39 = a8;
    v40 = 2114;
    v41 = a10;
    v42 = 2114;
    v43 = a9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, requestID:%{public}@, callUUID:%{public}@, url:%{public}@, prefix:%{private}@, combinedsecret:%{private}@, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@", &v26, 92);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  fConnection = self->fConnection;
  if (!fConnection)
  {
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("No valid connection");
    (*((void (**)(id, id))a11 + 2))(a11, objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.CLEEDMediaServiceHandler"), 8, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1)));
    fConnection = self->fConnection;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_101343974;
  v23[3] = &unk_102143618;
  v23[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1013439A8;
  v22[3] = &unk_102152378;
  v22[4] = a11;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v23), "processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:", a3, a4, a5, a6, a7, a8, a9, a10, v22);
}

- (void)notifyProcessingCompletion
{
  NSObject *v3;
  void (**fCompletionCallback)(void);
  const char *v5;
  uint8_t *v6;
  int v7;
  const char *v8;
  uint8_t buf[4];
  const char *v10;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[CLEEDMediaServiceHandler notifyProcessingCompletion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v7 = 136446210;
    v8 = "-[CLEEDMediaServiceHandler notifyProcessingCompletion]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v7, 12);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler notifyProcessingCompletion]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  fCompletionCallback = (void (**)(void))self->fCompletionCallback;
  if (fCompletionCallback)
    fCompletionCallback[2]();
}

- (void)processMediaForMitigations:(id)a3
{
  NSObject *v5;
  NSXPCConnection *fConnection;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD v13[5];
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    v20 = 2114;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, mitigation:%{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v14 = 136446466;
    v15 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    v16 = 2114;
    v17 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s, mitigation:%{public}@", &v14, 22);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1013440BC;
    v13[3] = &unk_102143618;
    v13[4] = self;
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v13), "processMediaServicesMitigations:", a3);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v19 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, No valid connection, skipping", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021AFB70);
      v14 = 136446210;
      v15 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      LODWORD(v12) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2FWK,%{public}s, No valid connection, skipping", &v14, v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)processMediaEndOfExtendedSessionNotification
{
  NSObject *v3;
  NSXPCConnection *fConnection;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD v11[5];
  int v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021AFB70);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v12 = 136446210;
    v13 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 2, "#EED2FWK,%{public}s", &v12, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_101344440;
    v11[3] = &unk_102143618;
    v11[4] = self;
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v11), "processMediaServicesEndOfExtendedSessionNotification");
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021AFB70);
    v5 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v15 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, No valid connection, skipping", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021AFB70);
      v12 = 136446210;
      v13 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      LODWORD(v10) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2FWK,%{public}s, No valid connection, skipping", &v12, v10);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

@end
