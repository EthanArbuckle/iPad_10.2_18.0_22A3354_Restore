@implementation CLDiagnosticManager

+ (BOOL)isSupported
{
  return 1;
}

- (CLDiagnosticManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDiagnosticManager;
  return -[CLDiagnosticManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDiagnosticManagerServiceProtocol, &OBJC_PROTOCOL___CLDiagnosticManagerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  NSFileManager *v4;
  NSXPCListener *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager beginService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#diagnosticManager beginService", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  self->_registeredFiles = objc_opt_new(NSMutableSet);
  v4 = objc_opt_new(NSFileManager);
  self->_fileManager = v4;
  -[NSFileManager setDelegate:](v4, "setDelegate:", self);
  v5 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationd.diagnostic"));
  self->_listener = v5;
  -[NSXPCListener setDelegate:](v5, "setDelegate:", self);
  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", objc_msgSend(objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo"), "queue"));
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)endService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#diagnosticManager endService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#diagnosticManager endService", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager endService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }

  self->_fileManager = 0;
  -[NSXPCListener invalidate](self->_listener, "invalidate");

  self->_listener = 0;
  self->_registeredFiles = 0;
}

- (void)registerFileForCollection:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Add file to #diagnosticManager: %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v12 = 138543362;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "Add file to #diagnosticManager: %{public}@", &v12, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  if (a3)
  {
    -[NSMutableSet addObject:](-[CLDiagnosticManager registeredFiles](self, "registeredFiles"), "addObject:", a3);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to register a nil NSURL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102158C68);
      LOWORD(v12) = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "Trying to register a nil NSURL", &v12, v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLDiagnosticManager registerFileForCollection:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)unregisterFileForCollection:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remove file to #diagnosticManager: %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v12 = 138543362;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "Remove file to #diagnosticManager: %{public}@", &v12, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  if (a3)
  {
    -[NSMutableSet removeObject:](-[CLDiagnosticManager registeredFiles](self, "registeredFiles"), "removeObject:", a3);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Trying to unregister a nil NSURL", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102158C68);
      LOWORD(v12) = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "Trying to unregister a nil NSURL", &v12, v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLDiagnosticManager unregisterFileForCollection:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)copyRegisteredFilesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  id v18;
  id v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  NSMutableArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  int v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v5 = -[CLDiagnosticManager pathForDate:withBasePath:](self, "pathForDate:withBasePath:", +[NSDate date](NSDate, "date"), -[CLDiagnosticManager mobileCrashReporterPath](self, "mobileCrashReporterPath"));
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client requested #diagnosticManager file copy to dest: %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v31 = 138412290;
    v32 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "Client requested #diagnosticManager file copy to dest: %@", &v31, 12);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  v29 = 0;
  -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](-[CLDiagnosticManager fileManager](self, "fileManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 0, 0, 0);
  v24 = objc_opt_new(NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = -[CLDiagnosticManager registeredFiles](self, "registeredFiles");
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v23 = a3;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(v12, "lastPathComponent"));
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102158C68);
        v14 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v34 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "diagnosticManager trying to copy file: %@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102158C68);
          v31 = 138412290;
          v32 = v12;
          LODWORD(v22) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "diagnosticManager trying to copy file: %@", &v31, v22);
          v17 = (uint8_t *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager copyRegisteredFilesWithHandler:]", "%s\n", v16);
          if (v17 != buf)
            free(v17);
        }
        -[NSFileManager copyItemAtURL:toURL:error:](-[CLDiagnosticManager fileManager](self, "fileManager"), "copyItemAtURL:toURL:error:", v12, v13, &v29);
        if (v29)
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102158C68);
          v15 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289794;
            *(_DWORD *)v34 = 0;
            *(_WORD *)&v34[4] = 2082;
            *(_QWORD *)&v34[6] = "";
            v35 = 2114;
            v36 = v12;
            v37 = 2114;
            v38 = v13;
            v39 = 2114;
            v40 = v29;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Failed to copy diagnostic file\", \"srcURL\":%{public, location:escape_only}@, \"dstURL\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x30u);
          }
        }
        else
        {
          -[NSMutableArray addObject:](v24, "addObject:", v13);
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v9 = v18;
    }
    while (v18);
    v19 = v29;
    a3 = v23;
  }
  else
  {
    v19 = 0;
  }
  (*((void (**)(id, NSMutableArray *, id))a3 + 2))(a3, v24, v19);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint8_t *v24;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  int v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  const char *v34;
  __int16 v35;
  unsigned int v36;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#diagnosticManager received new XPC Connection request", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    LOWORD(v29) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#diagnosticManager received new XPC Connection request", &v29, 2);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  if (a4)
  {
    v7 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.diagnostic"));
    if (v7)
    {
      v9 = v7;
      v10 = objc_opt_class(NSNumber, v8);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10087CE74;
        v28[3] = &unk_10212BB58;
        v28[4] = self;
        objc_msgSend(a4, "setInterruptionHandler:", v28);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10087D01C;
        v27[3] = &unk_10212BB58;
        v27[4] = self;
        objc_msgSend(a4, "setInvalidationHandler:", v27);
        objc_msgSend(a4, "_setQueue:", objc_msgSend(objc_msgSend(-[CLDiagnosticManager universe](self, "universe"), "silo"), "queue"));
        objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLDiagnosticManagerXPCServerInterface));
        objc_msgSend(a4, "setExportedObject:", self);
        -[CLDiagnosticManager setConnection:](self, "setConnection:", a4);
        objc_msgSend(a4, "resume");
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102158C68);
        v11 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v32 = a4;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#diagnosticManager Resuming XPC Connection: %@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102158C68);
          v29 = 138412290;
          v30 = a4;
          LODWORD(v26) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#diagnosticManager Resuming XPC Connection: %@", &v29, v26);
          v24 = (uint8_t *)v23;
          sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v23);
          if (v24 != buf)
            free(v24);
        }
        LOBYTE(v12) = 1;
        return v12;
      }
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_102158C88);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_msgSend(a4, "processIdentifier");
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2082;
      *(_QWORD *)&v32[6] = "";
      v33 = 2082;
      v34 = "com.apple.locationd.diagnostic";
      v35 = 1026;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#diagnosticManager missing entitlement\", \"entitlement\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_102158C88);
    }
    v15 = qword_1022A01C8;
    v12 = os_signpost_enabled((os_log_t)qword_1022A01C8);
    if (v12)
    {
      v16 = objc_msgSend(a4, "processIdentifier");
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2082;
      *(_QWORD *)&v32[6] = "";
      v33 = 2082;
      v34 = "com.apple.locationd.diagnostic";
      v35 = 1026;
      v36 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#diagnosticManager missing entitlement", "{\"msg%{public}.0s\":\"#diagnosticManager missing entitlement\", \"entitlement\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
LABEL_23:
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Why didn't we get a connection?", buf, 2u);
    }
    v18 = sub_1001BFF7C(115, 0);
    LOBYTE(v12) = 0;
    if (v18)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102158C68);
      LOWORD(v29) = 0;
      LODWORD(v26) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "Why didn't we get a connection?", &v29, v26);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLDiagnosticManager listener:shouldAcceptNewConnection:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
      goto LABEL_23;
    }
  }
  return v12;
}

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  NSObject *v7;
  std::string *v8;
  NSURL *v9;
  unsigned __int8 v10;
  NSObject *v11;
  const char *v13;
  std::string *v14;
  const char *v15;
  std::string *v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  std::string buf[68];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102158C68);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(buf[0].__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#diagnosticManager fileManager asking if should copy from %@ to %@", (uint8_t *)buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v18 = 138412546;
    v19 = a4;
    v20 = 2112;
    v21 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#diagnosticManager fileManager asking if should copy from %@ to %@", &v18, 22);
    v14 = (std::string *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  sub_100584F4C(0, buf);
  if ((buf[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = buf;
  else
    v8 = (std::string *)buf[0].__r_.__value_.__r.__words[0];
  v9 = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf[0].__r_.__value_.__l.__data_);
  v10 = objc_msgSend(objc_msgSend(a4, "absoluteString"), "hasPrefix:", -[NSURL absoluteString](v9, "absoluteString"));
  if ((v10 & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102158C68);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Trying to move a file that is not in our cache directory: %@", (uint8_t *)buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102158C68);
      v18 = 138412290;
      v19 = a4;
      LODWORD(v17) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "Trying to move a file that is not in our cache directory: %@", &v18, v17);
      v16 = (std::string *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLDiagnosticManager fileManager:shouldCopyItemAtURL:toURL:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
  return v10;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6
{
  return 0;
}

- (NSURL)mobileCrashReporterPath
{
  if (qword_102304F78 != -1)
    dispatch_once(&qword_102304F78, &stru_102158C28);
  return (NSURL *)qword_102304F70;
}

- (id)pathForDate:(id)a3 withBasePath:(id)a4
{
  if (qword_102304F88 != -1)
    dispatch_once(&qword_102304F88, &stru_102158C48);
  return objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend((id)qword_102304F80, "stringFromDate:", a3));
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableSet)registeredFiles
{
  return self->_registeredFiles;
}

- (void)setRegisteredFiles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
