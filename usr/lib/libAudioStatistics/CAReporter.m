@implementation CAReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfObject, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_internalConfiguration, 0);
  objc_storeStrong((id *)&self->_swiftReporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)configuration
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  int64_t reporterID;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDictionary *)v4;
  }
  else
  {
    v6 = (id)gReportingClient;
    objc_sync_enter(v6);
    v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      v10 = 136315650;
      v11 = "CAReportingClient.mm";
      v12 = 1024;
      v13 = 368;
      v14 = 2048;
      v15 = reporterID;
      _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Getting configuration { careporter_id=%lli }", (uint8_t *)&v10, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_internalConfiguration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

    return (NSDictionary *)v9;
  }
}

- (BOOL)started
{
  return self->_started;
}

- (void)cacheServiceType:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v5;
  int64_t reporterID;
  void *v7;
  int serviceType;
  id obja;
  id obj;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "setServiceType:", v3);

  }
  else
  {
    obj = (id)gReportingClient;
    objc_sync_enter(obj);
    self->_serviceType = v3;
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      serviceType = self->_serviceType;
      *(_DWORD *)buf = 136316162;
      v12 = "CAReportingClient.mm";
      v13 = 1024;
      v14 = 298;
      v15 = 2048;
      v16 = reporterID;
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = serviceType;
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Caching service type { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);

    }
    objc_sync_exit(obj);

  }
}

- (CAReporter)initWithNewReporterID
{
  CAReporter *v3;
  uint64_t v4;
  AudioAnalyticsReporter *swiftReporter;
  AudioAnalyticsReporter *v6;
  CAReporter *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v14.receiver = self;
    v14.super_class = (Class)CAReporter;
    v3 = -[CAReporter init](&v14, sel_init);
    if (v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFEF80]), "initWithNewReporterID");
      swiftReporter = v3->_swiftReporter;
      v3->_swiftReporter = (AudioAnalyticsReporter *)v4;

      v6 = v3->_swiftReporter;
      if (!v6)
      {
        v7 = 0;
        goto LABEL_11;
      }
      v3->_reporterID = -[AudioAnalyticsReporter reporterID](v6, "reporterID");
      v3->_serviceType = -1;
    }
    v3 = v3;
    v7 = v3;
  }
  else
  {
    v8 = (id)gReportingClient;
    objc_sync_enter(v8);
    v9 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 194;
      _os_log_impl(&dword_18F18F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d CAReporter initWithNewReporterID called", buf, 0x12u);
    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "createReporterID:", 0);

    v12 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 196;
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_18F18F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d CAReporter initWithNewReporterID { newid=%lli }", buf, 0x1Cu);
    }
    v3 = -[CAReporter initWithReporterID:serviceType:](self, "initWithReporterID:serviceType:", v11, 0xFFFFLL);
    objc_sync_exit(v8);

    v7 = v3;
  }
LABEL_11:

  return v7;
}

- (CAReporter)initWithReporterID:(int64_t)a3 serviceType:(unsigned __int16)a4
{
  int v4;
  char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  CAReporter *v14;
  NSObject *v15;
  CAReportingPerformanceObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  CAReporter *v30;
  NSObject *v31;
  objc_super v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  _BYTE v40[20];
  int v41;
  _QWORD v42[2];

  v4 = a4;
  v42[1] = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
  {
    v10 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CAReportingUtilityGenerateServiceNameFromServiceType(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v36 = "CAReportingClient.mm";
      v37 = 1024;
      v38 = 145;
      v39 = 1024;
      *(_DWORD *)v40 = a3;
      *(_WORD *)&v40[4] = 2112;
      *(_QWORD *)&v40[6] = v11;
      *(_WORD *)&v40[14] = 1024;
      *(_DWORD *)&v40[16] = v4;
      _os_log_impl(&dword_18F18F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d initWithReporterID: serviceType: { reporterID=%i, servicename=\"%@\", servicetype=%i }", buf, 0x28u);

    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      if (a3)
      {
        v33.receiver = self;
        v33.super_class = (Class)CAReporter;
        v14 = -[CAReporter init](&v33, sel_init);
        v7 = (char *)v14;
        if (v14)
        {
          v14->_reporterID = a3;
          v15 = *(id *)AA_ClientCategory();
          *((_QWORD *)v7 + 8) = os_signpost_id_make_with_pointer(v15, v7 + 16);

          *((_WORD *)v7 + 6) = v4;
          *(_WORD *)(v7 + 9) = 256;
          v16 = [CAReportingPerformanceObject alloc];
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[CAReportingPerformanceObject initWithProcessIdentifiers:](v16, "initWithProcessIdentifiers:", v20);
          v22 = (void *)*((_QWORD *)v7 + 7);
          *((_QWORD *)v7 + 7) = v21;

          v23 = objc_opt_new();
          v24 = (void *)*((_QWORD *)v7 + 5);
          *((_QWORD *)v7 + 5) = v23;

          v25 = objc_retainAutorelease(*(id *)AA_ClientCategory());
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = *((_QWORD *)v7 + 2);
            CAReportingUtilityGenerateServiceNameFromServiceType(*((_WORD *)v7 + 6));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = *((unsigned __int16 *)v7 + 6);
            *(_DWORD *)buf = 136316162;
            v36 = "CAReportingClient.mm";
            v37 = 1024;
            v38 = 165;
            v39 = 2048;
            *(_QWORD *)v40 = v26;
            *(_WORD *)&v40[8] = 2112;
            *(_QWORD *)&v40[10] = v27;
            *(_WORD *)&v40[18] = 1024;
            v41 = v28;
            _os_log_impl(&dword_18F18F000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating CAReporter { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);

          }
          +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addReporter:", v7);

        }
        goto LABEL_13;
      }
      v31 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "CAReportingClient.mm";
        v37 = 1024;
        v38 = 151;
        _os_log_impl(&dword_18F18F000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d initWithReporterID: reporterID == CAReporterInvalidID, returning nil", buf, 0x12u);
      }
    }
    v30 = 0;
    v7 = (char *)self;
    goto LABEL_18;
  }
  v34.receiver = self;
  v34.super_class = (Class)CAReporter;
  v7 = -[CAReporter init](&v34, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFEF80]), "initWithReporterID:", a3);
    v9 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v8;

    if (!*((_QWORD *)v7 + 4))
    {
      v30 = 0;
      goto LABEL_18;
    }
    *((_QWORD *)v7 + 2) = a3;
    *((_WORD *)v7 + 6) = v4;
  }
LABEL_13:
  v7 = v7;
  v30 = (CAReporter *)v7;
LABEL_18:

  return v30;
}

- (unsigned)serviceType
{
  void *v3;
  unsigned __int16 v4;

  if (!_os_feature_enabled_impl())
    return self->_serviceType;
  -[CAReporter swiftReporter](self, "swiftReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  return v4;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int64_t reporterID;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    v6 = (id)gReportingClient;
    objc_sync_enter(v6);
    if (self->_removedByClient || !self->_reporterID)
    {
      v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315394;
        v26 = "CAReportingClient.mm";
        v27 = 1024;
        v28 = 316;
        v8 = "%25s:%-5d Unexpected state, configuration being set on reporter that has been removed or is invalid!";
LABEL_6:
        _os_log_impl(&dword_18F18F000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v25, 0x12u);
      }
    }
    else
    {
      if (v4 && objc_msgSend(v4, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MXHostApplicationDisplayID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MXHostApplicationDisplayID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("HostApplicationDisplayID"));

        }
        if (self->_internalConfiguration)
        {
          -[CAReporter internalConfiguration](self, "internalConfiguration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addEntriesFromDictionary:", v9);

          -[CAReporter perfObject](self, "perfObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setConfiguration:", self->_internalConfiguration);

          v14 = objc_retainAutorelease(*(id *)AA_ClientCategory());
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            reporterID = self->_reporterID;
            v25 = 136315906;
            v26 = "CAReportingClient.mm";
            v27 = 1024;
            v28 = 341;
            v29 = 2048;
            v30 = reporterID;
            v31 = 2112;
            v32 = v4;
            _os_log_impl(&dword_18F18F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting configuration { careporter_id=%lli, newConfiguration=\"%@\" }", (uint8_t *)&v25, 0x26u);
          }
          +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "connection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            v23 = objc_retainAutorelease(*(id *)AA_ClientCategory());
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = -[CAReporter reporterID](self, "reporterID");
              v25 = 136315650;
              v26 = "CAReportingClient.mm";
              v27 = 1024;
              v28 = 344;
              v29 = 2048;
              v30 = v24;
              _os_log_impl(&dword_18F18F000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClient XPC connection is nil { careporter_id=%lli }", (uint8_t *)&v25, 0x1Cu);
            }

          }
          else
          {
            if (_os_feature_enabled_impl())
            {
              +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "connection");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_unboostingRemoteObjectProxy");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setWithConfiguration:for:", v9, -[CAReporter reporterID](self, "reporterID"));
            }
            else
            {
              +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "connection");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_unboostingRemoteObjectProxy");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setConfiguration:forReporterID:", v9, -[CAReporter reporterID](self, "reporterID"));
            }

          }
        }
        else
        {
          v22 = objc_retainAutorelease(*(id *)AA_ClientCategory());
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315394;
            v26 = "CAReportingClient.mm";
            v27 = 1024;
            v28 = 335;
            _os_log_impl(&dword_18F18F000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d internalConfiguration found to be nil", (uint8_t *)&v25, 0x12u);
          }
        }

        goto LABEL_7;
      }
      v7 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315394;
        v26 = "CAReportingClient.mm";
        v27 = 1024;
        v28 = 322;
        v8 = "%25s:%-5d Incoming configuration nil or empty. Ignoring.";
        goto LABEL_6;
      }
    }
LABEL_7:
    objc_sync_exit(v6);

    goto LABEL_8;
  }
  -[CAReporter swiftReporter](self, "swiftReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

LABEL_8:
}

- (CAReportingPerformanceObject)perfObject
{
  return (CAReportingPerformanceObject *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)reporterID
{
  void *v3;
  int64_t v4;

  if (!_os_feature_enabled_impl())
    return self->_reporterID;
  -[CAReporter swiftReporter](self, "swiftReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reporterID");

  return v4;
}

- (NSMutableDictionary)internalConfiguration
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)stop
{
  id v3;
  NSObject *v4;
  int64_t reporterID;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostID;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

  }
  else
  {
    v3 = (id)gReportingClient;
    objc_sync_enter(v3);
    v4 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      v13 = "CAReportingClient.mm";
      v14 = 1024;
      v15 = 421;
      v16 = 2048;
      v17 = reporterID;
      _os_log_impl(&dword_18F18F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Stopping reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    v7 = v6;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      CAReportingUtilityRetrieveAppName(&self->_internalConfiguration->super);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_18F18F000, v7, OS_SIGNPOST_INTERVAL_END, signpostID, "CoreAudioReportingSession", "Stopping Application=%{public}@", buf, 0xCu);

    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopReporter:", -[CAReporter reporterID](self, "reporterID"));

    objc_sync_exit(v3);
  }
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)start
{
  id v3;
  NSObject *v4;
  int64_t reporterID;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostID;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "start");

  }
  else
  {
    v3 = (id)gReportingClient;
    objc_sync_enter(v3);
    v4 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      v13 = "CAReportingClient.mm";
      v14 = 1024;
      v15 = 385;
      v16 = 2048;
      v17 = reporterID;
      _os_log_impl(&dword_18F18F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Starting reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    v7 = v6;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      CAReportingUtilityRetrieveAppName(&self->_internalConfiguration->super);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_18F18F000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "CoreAudioReportingSession", "Starting Application=%{public}@", buf, 0xCu);

    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startReporter:", self->_reporterID);

    objc_sync_exit(v3);
  }
}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  int64_t reporterID;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:category:type:", v8, v6, v5);

  }
  else
  {
    v10 = (id)gReportingClient;
    objc_sync_enter(v10);
    v11 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      v14 = 136315650;
      v15 = "CAReportingClient.mm";
      v16 = 1024;
      v17 = 402;
      v18 = 2048;
      v19 = reporterID;
      _os_log_impl(&dword_18F18F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Sending message { careporter_id=%lli }", (uint8_t *)&v14, 0x1Cu);
    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendMessage:category:type:reporter:", v8, v6, v5, self->_reporterID);

    objc_sync_exit(v10);
  }

}

- (void)dealloc
{
  NSObject *v3;
  int64_t reporterID;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      v8 = "CAReportingClient.mm";
      v9 = 1024;
      v10 = 436;
      v11 = 2048;
      v12 = reporterID;
      _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Deallocing reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destroyReporterWithID:", self->_reporterID);

  }
  v6.receiver = self;
  v6.super_class = (Class)CAReporter;
  -[CAReporter dealloc](&v6, sel_dealloc);
}

- (void)setRemovedByClient:(BOOL)a3
{
  self->_removedByClient = a3;
}

+ (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v9 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CFEF80], "sendSessionlessMessage:category:type:", v9, v6, v5);
  }
  else
  {
    v7 = (id)gReportingClient;
    objc_sync_enter(v7);
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendMessage:category:type:reporter:", v9, v6, v5, 0);

    objc_sync_exit(v7);
  }

}

- (CAReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  CAReporter *v7;
  uint64_t v8;
  AudioAnalyticsReporter *swiftReporter;
  AudioAnalyticsReporter *v10;
  CAReporter *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (_os_feature_enabled_impl())
  {
    v15.receiver = self;
    v15.super_class = (Class)CAReporter;
    v7 = -[CAReporter init](&v15, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFEF80]), "initWithSessionID:serviceType:", v5, v4);
      swiftReporter = v7->_swiftReporter;
      v7->_swiftReporter = (AudioAnalyticsReporter *)v8;

      v10 = v7->_swiftReporter;
      if (!v10)
      {
        v11 = 0;
        goto LABEL_7;
      }
      v7->_reporterID = -[AudioAnalyticsReporter reporterID](v10, "reporterID");
      v7->_serviceType = v4;
    }
    v7 = v7;
    v11 = v7;
  }
  else
  {
    v12 = (id)gReportingClient;
    objc_sync_enter(v12);
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAReporter initWithReporterID:serviceType:](self, "initWithReporterID:serviceType:", objc_msgSend(v13, "createReporterID:", v5), v4);

    objc_sync_exit(v12);
    v11 = v7;
  }
LABEL_7:

  return v11;
}

- (void)updateWithReporterID:(int64_t)a3
{
  id obj;

  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setReporterID:", a3);
  }
  else
  {
    if (!a3)
      return;
    obj = (id)gReportingClient;
    objc_sync_enter(obj);
    self->_reporterID = a3;
    objc_sync_exit(obj);
  }

}

- (void)setServiceType:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  int64_t reporterID;
  void *v8;
  int serviceType;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setServiceType:", v3);

  }
  else
  {
    v5 = (id)gReportingClient;
    objc_sync_enter(v5);
    self->_serviceType = v3;
    v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      serviceType = self->_serviceType;
      *(_DWORD *)buf = 136316162;
      v13 = "CAReportingClient.mm";
      v14 = 1024;
      v15 = 281;
      v16 = 2048;
      v17 = reporterID;
      v18 = 2112;
      v19 = v8;
      v20 = 1024;
      v21 = serviceType;
      _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting service type { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);

    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServiceType:reporterID:", v3, -[CAReporter reporterID](self, "reporterID"));

    objc_sync_exit(v5);
  }
}

- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  int64_t reporterID;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (_os_feature_enabled_impl())
  {
    -[CAReporter swiftReporter](self, "swiftReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestMessageForCategory:type:callback:", v6, v5, v8);

  }
  else
  {
    v10 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      reporterID = self->_reporterID;
      CAReportingUtilityCategoryString(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CAReportingUtilityTypeString(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136316674;
      v16 = "CAReportingClient.mm";
      v17 = 1024;
      v18 = 455;
      v19 = 2048;
      v20 = reporterID;
      v21 = 2112;
      v22 = v12;
      v23 = 1024;
      v24 = v6;
      v25 = 2112;
      v26 = v13;
      v27 = 1024;
      v28 = v5;
      _os_log_impl(&dword_18F18F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Requesting messages from reporter. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v15, 0x3Cu);

    }
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestMessageWithID:category:type:callback:", self->_reporterID, v6, v5, v8);

  }
}

- (AudioAnalyticsReporter)swiftReporter
{
  return self->_swiftReporter;
}

- (void)setSwiftReporter:(id)a3
{
  objc_storeStrong((id *)&self->_swiftReporter, a3);
}

- (void)setInternalConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)removedByClient
{
  return self->_removedByClient;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setPerfObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
