@implementation CAReportingClient

- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v5 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v26 = 136315650;
      v27 = "CAReportingClient.mm";
      v28 = 1024;
      v29 = 79;
      v30 = 2080;
      v31 = "-[CAReportingClient setServiceType:reporterID:]";
      _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v26, 0x1Cu);
    }
  }
  v8 = (id)gReportingClient;
  objc_sync_enter(v8);
  v9 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CAReportingUtilityGenerateServiceNameFromServiceType(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136315906;
    v27 = "CAReportingClient.mm";
    v28 = 1024;
    v29 = 1012;
    v30 = 2048;
    v31 = (const char *)a4;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_18F18F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set servicetype { careporter_id=%lli, serviceType=\"%@\" }", (uint8_t *)&v26, 0x26u);

  }
  GetLocalCAReporterObjectFromClient(self, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "serviceType");
    if (v13 != (_DWORD)v5)
    {
      objc_msgSend(v12, "cacheServiceType:", v5);
      objc_msgSend(v12, "perfObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setServiceType:", v5);

    }
    v15 = objc_msgSend(v12, "started") ^ 1;
    if (v13 == (_DWORD)v5)
      LOBYTE(v15) = 1;
    if ((v15 & 1) != 0)
    {
      v20 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        CAReportingUtilityGenerateServiceNameFromServiceType(v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 136316162;
        v27 = "CAReportingClient.mm";
        v28 = 1024;
        v29 = 1043;
        v30 = 2048;
        v31 = (const char *)a4;
        v32 = 2112;
        v33 = v21;
        v34 = 1024;
        v35 = v5;
        _os_log_impl(&dword_18F18F000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting new serviceType { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v26, 0x2Cu);

      }
      if (_os_feature_enabled_impl())
      {
        -[CAReportingClient connection](self, "connection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_unboostingRemoteObjectProxy");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithServiceType:for:", v5, a4);
      }
      else
      {
        -[CAReportingClient connection](self, "connection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_unboostingRemoteObjectProxy");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setServiceType:reportingSession:", v5, a4);
      }

    }
    else
    {
      v16 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 136315650;
        v27 = "CAReportingClient.mm";
        v28 = 1024;
        v29 = 1029;
        v30 = 2048;
        v31 = (const char *)a4;
        _os_log_impl(&dword_18F18F000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping while reconfiguring service { careporter_id=%lli }", (uint8_t *)&v26, 0x1Cu);
      }
      objc_msgSend(v12, "stop");
      if (_os_feature_enabled_impl())
      {
        -[CAReportingClient connection](self, "connection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_unboostingRemoteObjectProxy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setWithServiceType:for:", v5, a4);
      }
      else
      {
        -[CAReportingClient connection](self, "connection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_unboostingRemoteObjectProxy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setServiceType:reportingSession:", v5, a4);
      }

      v24 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CAReportingUtilityGenerateServiceNameFromServiceType(v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 136316162;
        v27 = "CAReportingClient.mm";
        v28 = 1024;
        v29 = 1038;
        v30 = 2048;
        v31 = (const char *)a4;
        v32 = 2112;
        v33 = v25;
        v34 = 1024;
        v35 = v5;
        _os_log_impl(&dword_18F18F000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting new serviceType { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v26, 0x2Cu);

      }
      objc_msgSend(v12, "start");
    }
  }
  else
  {
    v19 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315650;
      v27 = "CAReportingClient.mm";
      v28 = 1024;
      v29 = 1016;
      v30 = 2048;
      v31 = (const char *)a4;
      _os_log_impl(&dword_18F18F000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reporter not found! { careporter_id=%lli }", (uint8_t *)&v26, 0x1Cu);
    }
  }

  objc_sync_exit(v8);
}

- (int64_t)createReporterID:(unsigned int)a3
{
  NSObject *v5;
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315650;
      v15 = "CAReportingClient.mm";
      v16 = 1024;
      v17 = 79;
      v18 = 2080;
      v19 = "-[CAReportingClient createReporterID:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v14, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  v7 = a3;
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "processIdentifier");
  if (!a3)
    v7 = ++gReporterIDCount | (unint64_t)(v9 << 32);

  if (_os_feature_enabled_impl())
  {
    -[CAReportingClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unboostingRemoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createSessionWith:", v7);
  }
  else
  {
    -[CAReportingClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unboostingRemoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createReportingSession:", v7);
  }

  v12 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "CAReportingClient.mm";
    v16 = 1024;
    v17 = 661;
    v18 = 2048;
    v19 = (const char *)v7;
    _os_log_impl(&dword_18F18F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created reporter { careporter_id=%lli }", (uint8_t *)&v14, 0x1Cu);
  }
  objc_sync_exit(v6);

  return v7;
}

- (unsigned)getServiceTypeForReporterID:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned __int16 v31;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int64_t v40;
  _BYTE buf[12];
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  _BYTE *v46;
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CAReportingClient.mm";
      v42 = 1024;
      v43 = 79;
      v44 = 2080;
      v45 = "-[CAReportingClient getServiceTypeForReporterID:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  -[CAReportingClient clientReporters](self, "clientReporters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "serviceType");
    goto LABEL_34;
  }
  if (!_os_feature_enabled_impl())
  {
    v10 = -1;
    goto LABEL_34;
  }
  if (!_os_feature_enabled_impl())
  {
    -[CAReportingClient connection](self, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v20);

    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reporterID:valid:", a3, v22);

    v14 = v48;
    if (v47)
    {
      v23 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v47;
        objc_msgSend(v24, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 136315906;
        v34 = "CAReportingClient.mm";
        v35 = 1024;
        v36 = 1094;
        v37 = 2112;
        v38 = v25;
        v39 = 2048;
        v40 = a3;
        _os_log_impl(&dword_18F18F000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting service type { message=\"%@\", careporter_id=%lli }", (uint8_t *)&v33, 0x26u);

      }
    }

    v26 = v46;
    if (v46 == &buf[8])
    {
      v27 = 4;
      v26 = &buf[8];
    }
    else
    {
      if (!v46)
        goto LABEL_28;
      v27 = 5;
    }
    (*(void (**)(void))(*v26 + 8 * v27))();
    goto LABEL_28;
  }
  -[CAReportingClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v11);

  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "validateFor:completion:", a3, v13);

  v14 = v48;
  if (v47)
  {
    v15 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v47;
      objc_msgSend(v16, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 136315906;
      v34 = "CAReportingClient.mm";
      v35 = 1024;
      v36 = 1084;
      v37 = 2112;
      v38 = v17;
      v39 = 2048;
      v40 = a3;
      _os_log_impl(&dword_18F18F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting service type { message=\"%@\", careporter_id=%lli }", (uint8_t *)&v33, 0x26u);

    }
  }

  v18 = v46;
  if (v46 == &buf[8])
  {
    v19 = 4;
    v18 = &buf[8];
    goto LABEL_24;
  }
  if (v46)
  {
    v19 = 5;
LABEL_24:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
LABEL_28:

  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("reporterID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "longLongValue");

    objc_msgSend(v14, "objectForKey:", CFSTR("serviceType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "intValue");

    if (v29)
      v10 = v31;
    else
      v10 = -1;
  }
  else
  {
    v10 = -1;
  }

LABEL_34:
  objc_sync_exit(v6);

  return v10;
}

- (NSMutableDictionary)clientReporters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

+ (id)sharedInstance
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "CAReportingClient.mm";
      v11 = 1024;
      v12 = 79;
      v13 = 2080;
      v14 = "+[CAReportingClient sharedInstance]";
      _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v4 = a1;
  objc_sync_enter(v4);
  if (!gReportingClient)
  {
    v5 = objc_msgSend(objc_alloc((Class)v4), "initWithXPC:endpoint:", 1, 0);
    v6 = (void *)gReportingClient;
    gReportingClient = v5;

    v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "CAReportingClient.mm";
      v11 = 1024;
      v12 = 636;
      _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Registering appWillResignActive for UIApplicationWillResignActiveNotification", (uint8_t *)&v9, 0x12u);
    }
  }
  objc_sync_exit(v4);

  return (id)gReportingClient;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)addReporter:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 79;
      v19 = 2080;
      v20 = "-[CAReportingClient addReporter:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v4, "reporterID");
      *(_DWORD *)buf = 136315650;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 737;
      v19 = 2048;
      v20 = (const char *)v7;
      _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Adding reporter to client { careporter_id=%lli }", buf, 0x1Cu);
    }

    v8 = (id)gReportingClient;
    objc_sync_enter(v8);
    -[CAReportingClient clientReporters](self, "clientReporters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "reporterID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v11);

    objc_sync_exit(v8);
  }
  else
  {
    v12 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 733;
      _os_log_impl(&dword_18F18F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received nil reporter!", buf, 0x12u);
    }
  }

}

- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "CAReportingClient.mm";
      v12 = 1024;
      v13 = 79;
      v14 = 2080;
      v15 = "-[CAReportingClient setConfiguration:reporterID:]";
      _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v10, 0x1Cu);
    }
  }
  v8 = (id)gReportingClient;
  objc_sync_enter(v8);
  GetLocalCAReporterObjectFromClient(self, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConfiguration:", v6);

  objc_sync_exit(v8);
}

- (CAReportingClient)initWithXPC:(BOOL)a3 endpoint:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  CAReportingClient *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  CAReportingClient *v21;
  _QWORD v23[4];
  id v24;
  __CFString *v25;
  __CFString *v26;
  objc_super v27;
  _BYTE buf[12];
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[20];
  uint8_t v33[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (_os_feature_enabled_impl())
  {
    v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CAReportingClient.mm";
      v29 = 1024;
      v30 = 79;
      v31 = 2080;
      *(_QWORD *)v32 = "-[CAReportingClient initWithXPC:endpoint:]";
      _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v8 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = aNy[v4];
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "CAReportingClient.mm";
    v29 = 1024;
    v30 = 571;
    v31 = 1024;
    *(_DWORD *)v32 = v9;
    *(_WORD *)&v32[4] = 2112;
    *(_QWORD *)&v32[6] = v6;
    _os_log_impl(&dword_18F18F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating CAReportingClient { useXPC=\"%c\", endpoint=\"%@\" }", buf, 0x22u);
  }
  v27.receiver = self;
  v27.super_class = (Class)CAReportingClient;
  v10 = -[CAReportingClient init](&v27, sel_init);
  if (!v10)
    goto LABEL_26;
  v11 = (void *)objc_opt_new();
  -[CAReportingClient setClientReporters:](v10, "setClientReporters:", v11);

  if (!v4)
    goto LABEL_26;
  if (v6)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    -[CAReportingClient setConnection:](v10, "setConnection:", v12);
  }
  else
  {
    if (_os_feature_enabled_impl())
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.audioanalyticsd"), 4096);
    else
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.audio.toolbox.reporting.service"));
    -[CAReportingClient setConnection:](v10, "setConnection:", v12);
  }

  -[CAReportingClient connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    if (_os_feature_enabled_impl())
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A668);
    else
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A6C8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAReportingClient connection](v10, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRemoteObjectInterface:", v15);

    objc_initWeak((id *)buf, v10);
    -[CAReportingClient connection](v10, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __42__CAReportingClient_initWithXPC_endpoint___block_invoke;
    v23[3] = &unk_1E29338B8;
    objc_copyWeak(&v24, (id *)buf);
    objc_msgSend(v18, "setInterruptionHandler:", v23);

    -[CAReportingClient connection](v10, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInvalidationHandler:", &__block_literal_global);

    -[CAReportingClient connection](v10, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
LABEL_26:
    v21 = v10;
    goto LABEL_27;
  }
  if (_os_feature_enabled_impl())
  {
    v17 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v26 = CFSTR("com.apple.audioanalyticsd");
      caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>((std::string *)buf);
      *(_DWORD *)v33 = 136315650;
      v34 = "CAReportingClient.mm";
      v35 = 1024;
      v36 = 592;
      v37 = 2080;
      v38 = *(_QWORD *)&v32[12];
      _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection { servicename=\"%s\" }", v33, 0x1Cu);
      if (v32[4] && (v32[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);

    }
  }
  else
  {
    v17 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v25 = CFSTR("com.apple.audio.toolbox.reporting.service");
      caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>((std::string *)buf);
      *(_DWORD *)v33 = 136315650;
      v34 = "CAReportingClient.mm";
      v35 = 1024;
      v36 = 594;
      v37 = 2080;
      v38 = *(_QWORD *)&v32[12];
      _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection { servicename=\"%s\" }", v33, 0x1Cu);
      if (v32[4] && (v32[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);

    }
  }

  v21 = 0;
LABEL_27:

  return v21;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setClientReporters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)reconnectReporter:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "CAReportingClient.mm";
      v24 = 1024;
      v25 = 79;
      v26 = 2080;
      v27 = "-[CAReportingClient reconnectReporter:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v22, 0x1Cu);
    }
  }
  if (v4 && (objc_msgSend(v4, "connected") & 1) == 0)
  {
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v4, "reporterID");
      CAReportingUtilityGenerateServiceNameFromServiceType(objc_msgSend(v4, "serviceType"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "serviceType");
      v10 = aNy[objc_msgSend(v4, "started")];
      v22 = 136316418;
      v23 = "CAReportingClient.mm";
      v24 = 1024;
      v25 = 514;
      v26 = 2048;
      v27 = (const char *)v7;
      v28 = 2112;
      v29 = v8;
      v30 = 1024;
      v31 = v9;
      v32 = 1024;
      v33 = v10;
      _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reconnecting reporter { careporter_id=%lli, servicename=\"%@\", servicetype=%i, started=\"%c\" }", (uint8_t *)&v22, 0x32u);

    }
    if (_os_feature_enabled_impl())
    {
      -[CAReportingClient connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_unboostingRemoteObjectProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createSessionWith:", objc_msgSend(v4, "reporterID"));

      -[CAReportingClient connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_unboostingRemoteObjectProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithServiceType:for:", objc_msgSend(v4, "serviceType"), objc_msgSend(v4, "reporterID"));

      -[CAReportingClient connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_unboostingRemoteObjectProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithConfiguration:for:", v17, objc_msgSend(v4, "reporterID"));
    }
    else
    {
      -[CAReportingClient connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_unboostingRemoteObjectProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createReportingSession:", objc_msgSend(v4, "reporterID"));

      -[CAReportingClient connection](self, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_unboostingRemoteObjectProxy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setServiceType:reportingSession:", objc_msgSend(v4, "serviceType"), objc_msgSend(v4, "reporterID"));

      -[CAReportingClient connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_unboostingRemoteObjectProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConfiguration:forReporterID:", v17, objc_msgSend(v4, "reporterID"));
    }

    objc_msgSend(v4, "setConnected:", 1);
  }

}

- (void)destroyReporterWithID:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "CAReportingClient.mm";
      v18 = 1024;
      v19 = 79;
      v20 = 2080;
      v21 = "-[CAReportingClient destroyReporterWithID:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v16, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  if (a3)
  {
    -[CAReportingClient clientReporters](self, "clientReporters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CAReportingClient stopReporter:](self, "stopReporter:", a3);
      v10 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = "CAReportingClient.mm";
        v18 = 1024;
        v19 = 760;
        v20 = 2048;
        v21 = (const char *)a3;
        _os_log_impl(&dword_18F18F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removing reporter from client and server { careporter_id=%lli }", (uint8_t *)&v16, 0x1Cu);
      }
      objc_msgSend(v9, "setRemovedByClient:", 1);
      -[CAReportingClient clientReporters](self, "clientReporters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v12);

      if (objc_msgSend(v9, "connected"))
      {
        if (_os_feature_enabled_impl())
        {
          -[CAReportingClient connection](self, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_unboostingRemoteObjectProxy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "destroySessionFor:", a3);
        }
        else
        {
          -[CAReportingClient connection](self, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_unboostingRemoteObjectProxy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "destroyReportingSession:", a3);
        }

      }
    }
    else
    {
      v15 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315650;
        v17 = "CAReportingClient.mm";
        v18 = 1024;
        v19 = 773;
        v20 = 2048;
        v21 = (const char *)a3;
        _os_log_impl(&dword_18F18F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempted to remove a reporter not created by this client { careporter_id=%lli }", (uint8_t *)&v16, 0x1Cu);
      }
    }

  }
  objc_sync_exit(v6);

}

- (void)reconnectStartedReporters
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "CAReportingClient.mm";
      v21 = 1024;
      v22 = 79;
      v23 = 2080;
      v24 = "-[CAReportingClient reconnectStartedReporters]";
      _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v4 = (id)gReportingClient;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("started == YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAReportingClient clientReporters](self, "clientReporters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CAReportingClient startReporter:](self, "startReporter:", objc_msgSend(v13, "reporterID", (_QWORD)v14));
        -[CAReportingClient sendMessage:category:type:reporter:](self, "sendMessage:category:type:reporter:", &unk_1E2936610, 1, 0, objc_msgSend(v13, "reporterID"));
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (void)disconnectReporters
{
  NSObject *v3;
  NSObject *v4;
  CAReportingClient *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "CAReportingClient.mm";
      v20 = 1024;
      v21 = 79;
      v22 = 2080;
      v23 = "-[CAReportingClient disconnectReporters]";
      _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v4 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "CAReportingClient.mm";
    v20 = 1024;
    v21 = 555;
    _os_log_impl(&dword_18F18F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disconnecting reporters", buf, 0x12u);
  }
  v5 = self;
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CAReportingClient clientReporters](v5, "clientReporters", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "setConnected:", 0);
        objc_msgSend(v11, "perfObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "abandon");

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

void __42__CAReportingClient_initWithXPC_endpoint___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "CAReportingClient.mm";
    v8 = 1024;
    v9 = 608;
    _os_log_impl(&dword_18F18F000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d Interruption Handler: server exited or crashed.", (uint8_t *)&v6, 0x12u);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "disconnectReporters");

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "reconnectStartedReporters");

}

void __42__CAReportingClient_initWithXPC_endpoint___block_invoke_202()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315394;
    v2 = "CAReportingClient.mm";
    v3 = 1024;
    v4 = 615;
    _os_log_impl(&dword_18F18F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidation Handler: server exited", (uint8_t *)&v1, 0x12u);
  }
}

- (id)reporterWithID:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  CAReporter *v10;
  int v11;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int16 v28;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  _BYTE buf[12];
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  _BYTE *v40;
  id v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CAReportingClient.mm";
      v36 = 1024;
      v37 = 79;
      v38 = 2080;
      v39 = "-[CAReportingClient reporterWithID:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CAReportingClient.mm";
    v36 = 1024;
    v37 = 676;
    v38 = 2048;
    v39 = (const char *)a3;
    _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Finding reporter { careporter_id=%lli }", buf, 0x1Cu);
  }
  if (!a3)
    return 0;
  v7 = (id)gReportingClient;
  objc_sync_enter(v7);
  GetLocalCAReporterObjectFromClient(self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (_os_feature_enabled_impl())
    {
      -[CAReportingClient connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v13);

      caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
      v10 = (CAReporter *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAReporter validateFor:completion:](v10, "validateFor:completion:", a3, v14);

      v15 = v42;
      if (v41)
      {
        v10 = (CAReporter *)objc_retainAutorelease(*(id *)AA_ClientCategory());
        if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
        {
          v16 = v41;
          objc_msgSend(v16, "localizedDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 136315650;
          v30 = "CAReportingClient.mm";
          v31 = 1024;
          v32 = 699;
          v33 = 2112;
          v34 = v17;
          _os_log_impl(&dword_18F18F000, &v10->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating reporter { message=\"%@\" }", (uint8_t *)&v29, 0x1Cu);

        }
      }

      v18 = v40;
      if (v40 == &buf[8])
      {
        v19 = 4;
        v18 = &buf[8];
      }
      else
      {
        if (!v40)
          goto LABEL_30;
        v19 = 5;
      }
      (*(void (**)(void))(*v18 + 8 * v19))();
    }
    else
    {
      -[CAReportingClient connection](self, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v20);

      caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
      v10 = (CAReporter *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAReporter reporterID:valid:](v10, "reporterID:valid:", a3, v21);

      v15 = v42;
      if (v41)
      {
        v10 = (CAReporter *)objc_retainAutorelease(*(id *)AA_ClientCategory());
        if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
        {
          v22 = v41;
          objc_msgSend(v22, "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 136315650;
          v30 = "CAReportingClient.mm";
          v31 = 1024;
          v32 = 707;
          v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_18F18F000, &v10->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating reporter { message=\"%@\" }", (uint8_t *)&v29, 0x1Cu);

        }
      }

      v24 = v40;
      if (v40 == &buf[8])
      {
        v25 = 4;
        v24 = &buf[8];
      }
      else
      {
        if (!v40)
          goto LABEL_30;
        v25 = 5;
      }
      (*(void (**)(void))(*v24 + 8 * v25))();
    }
LABEL_30:

    if (!v15)
      goto LABEL_33;
    objc_msgSend(v15, "objectForKey:", CFSTR("reporterID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CAReporter *)objc_msgSend(v26, "longLongValue");

    objc_msgSend(v15, "objectForKey:", CFSTR("serviceType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "intValue");

    if (v10)
    {
      v10 = -[CAReporter initWithReporterID:serviceType:]([CAReporter alloc], "initWithReporterID:serviceType:", v10, v28);
      v11 = 1;
    }
    else
    {
LABEL_33:
      v11 = 0;
    }

    goto LABEL_35;
  }
  v10 = v8;
  v11 = 1;
LABEL_35:

  objc_sync_exit(v7);
  if (v11)
    return v10;
  else
    return 0;
}

- (void)requestMessageWithID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34[2];
  int v35;
  __int16 v36;
  uint64_t v37[2];
  int v38;
  __int16 v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE buf[12];
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  _BYTE v50[10];
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD))a6;
  if (_os_feature_enabled_impl())
  {
    v11 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CAReportingClient.mm";
      v45 = 1024;
      v46 = 79;
      v47 = 2080;
      v48 = "-[CAReportingClient requestMessageWithID:category:type:callback:]";
      _os_log_impl(&dword_18F18F000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v12 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CAReportingUtilityCategoryString(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CAReportingUtilityTypeString(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "CAReportingClient.mm";
    v45 = 1024;
    v46 = 786;
    v47 = 2048;
    v48 = (const char *)a3;
    v49 = 2112;
    *(_QWORD *)v50 = v13;
    *(_WORD *)&v50[8] = 1024;
    v51 = v7;
    v52 = 2112;
    v53 = v14;
    v54 = 1024;
    v55 = v6;
    _os_log_impl(&dword_18F18F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d requestMessageWithID called. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", buf, 0x3Cu);

  }
  if (!a3)
  {
    v15 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CAReportingUtilityCategoryString(v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CAReportingUtilityTypeString(v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "CAReportingClient.mm";
      v45 = 1024;
      v46 = 788;
      v47 = 2048;
      v48 = 0;
      v49 = 2112;
      *(_QWORD *)v50 = v16;
      *(_WORD *)&v50[8] = 1024;
      v51 = v7;
      v52 = 2112;
      v53 = v17;
      v54 = 1024;
      v55 = v6;
      _os_log_impl(&dword_18F18F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d requestMessageWithID: Invalid reporterID. Invoking callback. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", buf, 0x3Cu);

    }
    v10[2](v10, 0);
  }
  v18 = (id)gReportingClient;
  objc_sync_enter(v18);
  v19 = (void *)MEMORY[0x193FFFC54](v10);
  if (!_os_feature_enabled_impl())
  {
    -[CAReportingClient connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x193FFFC54](v19);
    v34[1] = a3;
    v35 = v7;
    v36 = v6;
    std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::function<-[CAReportingClient requestMessageWithID:category:type:callback:]::$_0,void>((uint64_t)v40, v34);
    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(buf, v23, (uint64_t)v40);
    v24 = v41;
    if (v41 == v40)
    {
      v25 = 4;
      v24 = v40;
    }
    else
    {
      if (!v41)
        goto LABEL_24;
      v25 = 5;
    }
    (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_24:

    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy((void **)buf);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "requestMessageForID:withCategory:andType:reply:", a3, v7, v6, v31);

    v32 = *(_QWORD **)&v50[2];
    if (*(_BYTE **)&v50[2] == &buf[8])
    {
      v33 = 4;
      v32 = &buf[8];
    }
    else
    {
      if (!*(_QWORD *)&v50[2])
      {
LABEL_32:

        goto LABEL_33;
      }
      v33 = 5;
    }
    (*(void (**)(void))(*v32 + 8 * v33))();
    goto LABEL_32;
  }
  -[CAReportingClient connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x193FFFC54](v19);
  v37[1] = a3;
  v38 = v7;
  v39 = v6;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::function<-[CAReportingClient requestMessageWithID:category:type:callback:]::$_0,void>((uint64_t)v42, v37);
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(buf, v20, (uint64_t)v42);
  v21 = v43;
  if (v43 == v42)
  {
    v22 = 4;
    v21 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_19;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_19:

  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy((void **)buf);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "requestMessageFor:category:type:reply:", a3, v7, v6, v27);

  v28 = *(_QWORD **)&v50[2];
  if (*(_BYTE **)&v50[2] == &buf[8])
  {
    v29 = 4;
    v28 = &buf[8];
    goto LABEL_28;
  }
  if (*(_QWORD *)&v50[2])
  {
    v29 = 5;
LABEL_28:
    (*(void (**)(void))(*v28 + 8 * v29))();
  }

LABEL_33:
  objc_sync_exit(v18);

}

- (uint64_t)requestMessageWithID:category:type:callback:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)listClientReporterIDs
{
  id v3;
  void *v4;
  void *v5;

  v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  -[CAReportingClient clientReporters](self, "clientReporters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v5;
}

- (id)listServerReporterIDs
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  void *v26;
  _BYTE v27[24];
  _BYTE *v28;
  id v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  if (!_os_feature_enabled_impl())
  {
    -[CAReportingClient connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(&v26, v11);

    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_proxy(&v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::reply((uint64_t)&v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getAllReporters:", v13);

    v5 = v30;
    if (v29)
    {
      v14 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = v29;
        objc_msgSend(v15, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 136315650;
        v21 = "CAReportingClient.mm";
        v22 = 1024;
        v23 = 844;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_18F18F000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d error listing reporters { message=\"%@\" }", (uint8_t *)&v20, 0x1Cu);

      }
    }

    v17 = v28;
    if (v28 == v27)
    {
      v18 = 4;
      v17 = v27;
    }
    else
    {
      if (!v28)
        goto LABEL_21;
      v18 = 5;
    }
    (*(void (**)(void))(*v17 + 8 * v18))();
    goto LABEL_21;
  }
  -[CAReportingClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(&v26, v4);

  v5 = v30;
  if (v29)
  {
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v29;
      objc_msgSend(v7, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "CAReportingClient.mm";
      v22 = 1024;
      v23 = 836;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d error listing reporters { message=\"%@\" }", (uint8_t *)&v20, 0x1Cu);

    }
  }

  v9 = v28;
  if (v28 == v27)
  {
    v10 = 4;
    v9 = v27;
    goto LABEL_17;
  }
  if (v28)
  {
    v10 = 5;
LABEL_17:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
LABEL_21:

  objc_sync_exit(v3);
  return v5;
}

- (void)startReporter:(int64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[12];
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  _BYTE *v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 136315650;
      *(_QWORD *)&v28[4] = "CAReportingClient.mm";
      v29 = 1024;
      v30 = 79;
      v31 = 2080;
      v32 = "-[CAReportingClient startReporter:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", v28, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 136315650;
    *(_QWORD *)&v28[4] = "CAReportingClient.mm";
    v29 = 1024;
    v30 = 861;
    v31 = 2048;
    v32 = (const char *)a3;
    _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting { careporter_id=%lli }", v28, 0x1Cu);
  }
  GetLocalCAReporterObjectFromClient(self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "reporterID");
    objc_msgSend(v9, "serviceType");
    kdebug_trace();
    -[CAReportingClient reconnectReporter:](self, "reconnectReporter:", v9);
    if ((objc_msgSend(v9, "started") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartDate:", v10);

      objc_msgSend(v9, "setStarted:", 1);
      v11 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      v12 = objc_msgSend(v9, "signpostID");
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        objc_msgSend(v9, "configuration");
        v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityRetrieveAppName(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v14;
        _os_signpost_emit_with_name_impl(&dword_18F18F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreAudioReportingSession", "Starting Application=%{public}@", v28, 0xCu);

      }
      if (objc_msgSend(v9, "serviceType") != 11 || !CAReportingUtilityIsInternalBuild())
      {
        if (_os_feature_enabled_impl())
        {
          -[CAReportingClient connection](self, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unboostingRemoteObjectProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "startSessionFor:", a3);
        }
        else
        {
          -[CAReportingClient connection](self, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unboostingRemoteObjectProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "startReportingSessionForID:", a3);
        }

        goto LABEL_32;
      }
      if (_os_feature_enabled_impl())
      {
        -[CAReportingClient connection](self, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message((uint64_t)v28, v15);

        caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_proxy((void **)v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startSessionFor:", a3);

        v17 = v33;
        if (v33 == &v28[8])
        {
          v18 = 4;
          v17 = &v28[8];
          goto LABEL_27;
        }
        if (v33)
        {
          v18 = 5;
LABEL_27:
          (*(void (**)(void))(*v17 + 8 * v18))();
        }
LABEL_31:

LABEL_32:
        objc_msgSend(v9, "perfObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "begin");

        goto LABEL_33;
      }
      -[CAReportingClient connection](self, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message((uint64_t)v28, v22);

      caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_proxy((void **)v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::reply((uint64_t)v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startReportingSessionForID:reply:", a3, v24);

      v25 = v33;
      if (v33 == &v28[8])
      {
        v26 = 4;
        v25 = &v28[8];
      }
      else
      {
        if (!v33)
          goto LABEL_31;
        v26 = 5;
      }
      (*(void (**)(void))(*v25 + 8 * v26))();
      goto LABEL_31;
    }
  }
  else
  {
    v19 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v28 = 136315650;
      *(_QWORD *)&v28[4] = "CAReportingClient.mm";
      v29 = 1024;
      v30 = 865;
      v31 = 2048;
      v32 = (const char *)a3;
      _os_log_impl(&dword_18F18F000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reporter not found { careporter_id=%lli }", v28, 0x1Cu);
    }
  }
LABEL_33:

  objc_sync_exit(v6);
}

- (void)stopReporter:(int64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSDictionary *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315650;
      v28 = "CAReportingClient.mm";
      v29 = 1024;
      v30 = 79;
      v31 = 2080;
      v32 = "-[CAReportingClient stopReporter:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v27, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315650;
    v28 = "CAReportingClient.mm";
    v29 = 1024;
    v30 = 909;
    v31 = 2048;
    v32 = (const char *)a3;
    _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping { careporter_id=%lli }", (uint8_t *)&v27, 0x1Cu);
  }
  GetLocalCAReporterObjectFromClient(self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (!objc_msgSend(v8, "started")
      || (objc_msgSend(v9, "startDate"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = v10 == 0,
          v10,
          v11))
    {
      v22 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v27 = 136315650;
        v28 = "CAReportingClient.mm";
        v29 = 1024;
        v30 = 917;
        v31 = 2048;
        v32 = (const char *)a3;
        _os_log_impl(&dword_18F18F000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d !reporter.started or reporter.startDate is nil { careporter_id=%lli }", (uint8_t *)&v27, 0x1Cu);
      }
    }
    else
    {
      objc_msgSend(v9, "reporterID");
      objc_msgSend(v9, "serviceType");
      kdebug_trace();
      v35 = CFSTR("session_duration");
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      objc_msgSend(v12, "numberWithDouble:", fabs(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAReportingClient sendMessage:category:type:reporter:](self, "sendMessage:category:type:reporter:", v16, 1, 0, a3);

      objc_msgSend(v9, "perfObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endAndReturnPerformanceMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_retainAutorelease(*(id *)AA_ClientCategory());
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v27 = 136315906;
          v28 = "CAReportingClient.mm";
          v29 = 1024;
          v30 = 925;
          v31 = 2048;
          v32 = (const char *)a3;
          v33 = 2112;
          v34 = v18;
          _os_log_impl(&dword_18F18F000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d gathered perf metrics { careporter_id=%lli, perfMetrics=\"%@\" }", (uint8_t *)&v27, 0x26u);
        }
        -[CAReportingClient sendMessage:category:type:reporter:](self, "sendMessage:category:type:reporter:", v18, 13, 0, a3);
      }

      if (objc_msgSend(v9, "connected"))
      {
        if (_os_feature_enabled_impl())
        {
          -[CAReportingClient connection](self, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unboostingRemoteObjectProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stopSessionFor:", a3);
        }
        else
        {
          -[CAReportingClient connection](self, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unboostingRemoteObjectProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stopReportingSessionForID:", a3);
        }

      }
      v23 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      v24 = objc_msgSend(v9, "signpostID");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        objc_msgSend(v9, "configuration");
        v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityRetrieveAppName(v25);
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v26;
        _os_signpost_emit_with_name_impl(&dword_18F18F000, v23, OS_SIGNPOST_INTERVAL_END, v24, "CoreAudioReportingSession", "Stopping Application=%{public}@", (uint8_t *)&v27, 0xCu);

      }
      objc_msgSend(v9, "setStarted:", 0);
      objc_msgSend(v9, "setStartDate:", 0);
    }
  }

  objc_sync_exit(v6);
}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reporter:(int64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  char *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  if (_os_feature_enabled_impl())
  {
    v11 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "CAReportingClient.mm";
      v24 = 1024;
      v25 = 79;
      v26 = 2080;
      v27 = "-[CAReportingClient sendMessage:category:type:reporter:]";
      _os_log_impl(&dword_18F18F000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  v12 = (id)gReportingClient;
  objc_sync_enter(v12);
  kdebug_trace();
  v13 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "CAReportingClient.mm";
    v24 = 1024;
    v25 = 955;
    v26 = 2112;
    v27 = v10;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_18F18F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Sending message { message=\"%@\", careporter_id=%lli }", buf, 0x26u);
  }
  if (-[CAReportingClient sendMessage:category:type:reporter:]::once != -1)
    dispatch_once(&-[CAReportingClient sendMessage:category:type:reporter:]::once, &__block_literal_global_205);
  if (!-[CAReportingClient sendMessage:category:type:reporter:]::gCAReportingIsDarwin)
  {
    if ((_DWORD)v8 == 7 && (_DWORD)v7 == 6 && CAReportingUtilityIsInternalBuild())
    {
      if (_os_feature_enabled_impl())
      {
        -[CAReportingClient connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "remoteObjectProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityAddDates((uint64_t)v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sendWithMessage:with:and:for:", v18, 7, 6, a6);
      }
      else
      {
        -[CAReportingClient connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "remoteObjectProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityAddDates((uint64_t)v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sendMessage:withCategory:andType:forReportingID:", v18, 7, 6, a6);
      }

    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        -[CAReportingClient connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_unboostingRemoteObjectProxy");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityAddDates((uint64_t)v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendWithMessage:with:and:for:", v20, v8, v7, a6);
      }
      else
      {
        -[CAReportingClient connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_unboostingRemoteObjectProxy");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        CAReportingUtilityAddDates((uint64_t)v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendMessage:withCategory:andType:forReportingID:", v20, v8, v7, a6);
      }

    }
    goto LABEL_25;
  }
  if (v10)
  {
    if ((_DWORD)v8 == 7 && (_DWORD)v7 == 6)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("issue_type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (!v15)
      {
        v21 = v10;
        AnalyticsSendEventLazy();
        v16 = v21;
LABEL_25:

      }
    }
  }
  objc_sync_exit(v12);

}

uint64_t __56__CAReportingClient_sendMessage_category_type_reporter___block_invoke()
{
  uint64_t result;

  result = os_variant_is_darwinos();
  -[CAReportingClient sendMessage:category:type:reporter:]::gCAReportingIsDarwin = result;
  return result;
}

id __56__CAReportingClient_sendMessage_category_type_reporter___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)getConfigurationForReporterID:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315650;
      v13 = "CAReportingClient.mm";
      v14 = 1024;
      v15 = 79;
      v16 = 2080;
      v17 = "-[CAReportingClient getConfigurationForReporterID:]";
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v12, 0x1Cu);
    }
  }
  v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  GetLocalCAReporterObjectFromClient(self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "configuration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;

  objc_sync_exit(v6);
  return v10;
}

+ (id)getClient
{
  NSObject *v2;
  id v3;
  id v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v2 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315650;
      v7 = "CAReportingClient.mm";
      v8 = 1024;
      v9 = 79;
      v10 = 2080;
      v11 = "+[CAReportingClient getClient]";
      _os_log_impl(&dword_18F18F000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v6, 0x1Cu);
    }
  }
  v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  v4 = (id)gReportingClient;
  objc_sync_exit(v3);

  return v4;
}

+ (void)destroyClient
{
  NSObject *v2;
  id v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v2 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315650;
      v6 = "CAReportingClient.mm";
      v7 = 1024;
      v8 = 79;
      v9 = 2080;
      v10 = "+[CAReportingClient destroyClient]";
      _os_log_impl(&dword_18F18F000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v5, 0x1Cu);
    }
  }
  v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  v4 = (void *)gReportingClient;
  gReportingClient = 0;

  objc_sync_exit(v3);
}

- (void)destroyService
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315650;
      v8 = "CAReportingClient.mm";
      v9 = 1024;
      v10 = 79;
      v11 = 2080;
      v12 = "-[CAReportingClient destroyService]";
      _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = (id)gReportingClient;
  objc_sync_enter(v4);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[CAReportingClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_unboostingRemoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "killService");

  }
  objc_sync_exit(v4);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "CAReportingClient.mm";
    v7 = 1024;
    v8 = 1182;
    _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroying client", buf, 0x12u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAReportingClient;
  -[CAReportingClient dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReporters, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)requestMessageWithID:category:type:callback:
{
}

- (_QWORD)requestMessageWithID:category:type:callback:
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = operator new(0x20uLL);
  *v2 = &off_1E2933378;
  v3 = MEMORY[0x193FFFC54](a1[1]);
  v4 = a1[2];
  v2[1] = v3;
  v2[2] = v4;
  *(_QWORD *)((char *)v2 + 22) = *(_QWORD *)((char *)a1 + 22);
  return v2;
}

@end
