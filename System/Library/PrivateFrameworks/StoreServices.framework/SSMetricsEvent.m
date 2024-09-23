@implementation SSMetricsEvent

+ (id)globalEventCanary
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_globalCanaryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_msgSend((id)_globalEventCanary, "copy");
  objc_msgSend(a1, "_globalCanaryLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

+ (id)_globalCanaryLock
{
  if (_globalCanaryLock_onceToken != -1)
    dispatch_once(&_globalCanaryLock_onceToken, &__block_literal_global_41);
  return (id)_globalCanaryLock__canaryLock;
}

- (id)millisecondsFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
}

uint64_t __35__SSMetricsEvent__globalCanaryLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_globalCanaryLock__canaryLock;
  _globalCanaryLock__canaryLock = (uint64_t)v0;

  return objc_msgSend((id)_globalCanaryLock__canaryLock, "setName:", CFSTR("com.StoreServices.globalEventCanaryLock"));
}

- (BOOL)requiresDiagnosticSendingPermission
{
  return 0;
}

- (BOOL)isFieldBlacklistEnabled
{
  return 1;
}

- (BOOL)isBlacklistedByConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SSMetricsEvent eventType](self, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEventTypeBlacklisted:", v5);

  return v6;
}

- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3 externalValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  int v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  int v69;
  void *v70;
  __int16 v71;
  _BYTE v72[18];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)MEMORY[0x1A8585BF8]();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_msgSend(v6, "disableEventDecoration") & 1) == 0)
  {
    objc_msgSend(v6, "eventFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  }
  -[SSMetricsEvent _dictionaryRepresentationOfBody](self, "_dictionaryRepresentationOfBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v9, "addEntriesFromDictionary:", v11);
  if ((objc_msgSend(v6, "disableEventDecoration") & 1) == 0 && objc_msgSend(v7, "count"))
    objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  objc_msgSend(v6, "blacklistedEventFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSMetricsEvent isFieldBlacklistEnabled](self, "isFieldBlacklistEnabled"))
  {
    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_msgSend(v9, "count");
      objc_msgSend(v9, "removeObjectsForKeys:", v12);
      v14 = objc_msgSend(v9, "count");
      if (v13 != v14)
      {
        v15 = v14;
        v60 = v8;
        v62 = v7;
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = objc_msgSend(v16, "shouldLog");
        if (objc_msgSend(v16, "shouldLogToDisk"))
          v17 |= 2u;
        objc_msgSend(v16, "OSLogObject");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          v17 &= 2u;
        if (v17)
        {
          v64 = v12;
          v19 = (void *)objc_opt_class();
          v20 = v13 - v15;
          v59 = v19;
          objc_msgSend(v9, "objectForKey:", CFSTR("eventType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 138412802;
          v70 = v19;
          v12 = v64;
          v71 = 1024;
          *(_DWORD *)v72 = v20;
          *(_WORD *)&v72[4] = 2112;
          *(_QWORD *)&v72[6] = v21;
          LODWORD(v58) = 28;
          v57 = &v69;
          v22 = (void *)_os_log_send_and_compose_impl();

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v69, v58);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            free(v22);
            SSFileLog(v16, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);

          }
        }
        else
        {

        }
        v8 = v60;
        v7 = v62;
      }
    }
  }
  if (objc_msgSend(v9, "count", v57))
  {
    v68 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v68);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v68;
    if (v30)
    {
      objc_msgSend(v67, "setObject:forKey:", v30, CFSTR("eventBody"));
LABEL_49:

      goto LABEL_50;
    }
    v63 = v7;
    v66 = v12;
    v61 = v8;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v43, "shouldLog");
    if (objc_msgSend(v43, "shouldLogToDisk"))
      v45 = v44 | 2;
    else
      v45 = v44;
    objc_msgSend(v43, "OSLogObject");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      v45 &= 2u;
    if (v45)
    {
      v47 = (void *)objc_opt_class();
      v69 = 138412802;
      v70 = v47;
      v71 = 2112;
      *(_QWORD *)v72 = v31;
      *(_WORD *)&v72[8] = 2112;
      *(_QWORD *)&v72[10] = v9;
      v48 = v47;
      LODWORD(v58) = 32;
      v49 = (void *)_os_log_send_and_compose_impl();

      v12 = v66;
      if (!v49)
      {
LABEL_48:

        v8 = v61;
        v7 = v63;
        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v49, 4, &v69, v58);
      v46 = objc_claimAutoreleasedReturnValue();
      free(v49);
      SSFileLog(v43, CFSTR("%@"), v50, v51, v52, v53, v54, v55, (uint64_t)v46);
    }

    goto LABEL_48;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = objc_msgSend(v31, "shouldLog");
  if (objc_msgSend(v31, "shouldLogToDisk"))
    v32 |= 2u;
  objc_msgSend(v31, "OSLogObject");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    v32 &= 2u;
  if (!v32)
    goto LABEL_49;
  v65 = v12;
  v33 = v8;
  v34 = (void *)objc_opt_class();
  v69 = 138412546;
  v70 = v34;
  v71 = 2112;
  *(_QWORD *)v72 = self;
  v35 = v34;
  LODWORD(v58) = 22;
  v36 = (void *)_os_log_send_and_compose_impl();

  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v36, 4, &v69, v58);
    v30 = objc_claimAutoreleasedReturnValue();
    free(v36);
    SSFileLog(v31, CFSTR("%@"), v37, v38, v39, v40, v41, v42, (uint64_t)v30);
    v8 = v33;
    v12 = v65;
    goto LABEL_49;
  }
  v8 = v33;
  v12 = v65;
LABEL_50:

  objc_autoreleasePoolPop(v8);
  return v67;
}

- (id)_dictionaryRepresentationOfBody
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSMetricsEvent appendPropertiesToBody:](self, "appendPropertiesToBody:", v3);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);
}

+ (void)setGlobalEventCanary:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "copy");
  objc_msgSend(a1, "_globalCanaryLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (void *)_globalEventCanary;
  _globalEventCanary = v4;

  objc_msgSend(a1, "_globalCanaryLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3
{
  return -[SSMetricsEvent allTableEntityPropertiesPermittedByConfiguration:externalValues:](self, "allTableEntityPropertiesPermittedByConfiguration:externalValues:", a3, 0);
}

- (double)timeIntervalFromMilliseconds:(id)a3
{
  return (double)objc_msgSend(a3, "longLongValue") / 1000.0;
}

- (id)decorateReportingURL:(id)a3
{
  return a3;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (BOOL)shouldSuppressDSIDHeader
{
  return self->_shouldSuppressDSIDHeader;
}

@end
