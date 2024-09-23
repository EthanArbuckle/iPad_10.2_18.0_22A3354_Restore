@implementation SSMetricsEventTableEntity

+ (id)databaseTable
{
  return CFSTR("events");
}

- (void)dealloc
{
  NSDictionary *reportingDictionary;
  objc_super v4;

  reportingDictionary = self->_reportingDictionary;
  self->_reportingDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)SSMetricsEventTableEntity;
  -[SSMetricsEventTableEntity dealloc](&v4, sel_dealloc);
}

- (id)reportingCanaryIdentifier
{
  void *v2;
  void *v3;

  -[SSMetricsEventTableEntity reportingDictionary](self, "reportingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("canary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)reportingDictionary
{
  NSDictionary *reportingDictionary;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSDictionary *v24;
  NSDictionary *v25;
  NSDictionary *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  reportingDictionary = self->_reportingDictionary;
  if (reportingDictionary)
    return reportingDictionary;
  -[SSSQLiteEntity database](self, "database");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[SSSQLiteEntity persistentID](self, "persistentID");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1A8585BF8]();
      v36[0] = CFSTR("eventBody");
      v36[1] = CFSTR("timestampReported");
      v34 = 0;
      v35 = 0;
      -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v34, v36, 2);
      if (!objc_msgSend(v35, "intValue"))
      {
        if (v34)
        {
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v34, 2, 0, 0);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
        }
        v7 = (NSDictionary *)v22;
        goto LABEL_23;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v11 &= 2u;
      if (v11)
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        v28 = 138412802;
        v29 = v13;
        v30 = 2048;
        v31 = -[SSSQLiteEntity persistentID](self, "persistentID");
        v32 = 2112;
        v33 = v35;
        LODWORD(v27) = 32;
        v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
LABEL_17:

          v7 = 0;
LABEL_23:
          for (i = 1; i != -1; --i)

          objc_autoreleasePoolPop(v8);
          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v28, v27);
        v12 = objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v12);
      }

      goto LABEL_17;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_26:
  v24 = self->_reportingDictionary;
  self->_reportingDictionary = v7;
  v25 = v7;

  v26 = self->_reportingDictionary;
  return v26;
}

- (id)reportingJSON
{
  void *v3;
  void *v4;
  void *v5;
  SSMetricsEventTableEntity *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  id v33;
  int v34;
  id v35;
  __int16 v36;
  SSMetricsEventTableEntity *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A8585BF8](self, a2);
  -[SSMetricsEventTableEntity reportingDictionary](self, "reportingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v6 = (SSMetricsEventTableEntity *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (SSMetricsEventTableEntity *)objc_claimAutoreleasedReturnValue();
    }
    v20 = -[SSMetricsEventTableEntity shouldLog](v6, "shouldLog");
    if (-[SSMetricsEventTableEntity shouldLogToDisk](v6, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    -[SSMetricsEventTableEntity OSLogObject](v6, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      v21 &= 2u;
    if (v21)
    {
      v34 = 138412546;
      v35 = (id)objc_opt_class();
      v36 = 2112;
      v37 = self;
      v23 = v35;
      LODWORD(v32) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_26:
        v5 = 0;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v34, v32);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog(v6, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v22);
    }

    goto LABEL_26;
  }
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 1, &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SSMetricsEventTableEntity *)v33;
  if (!v5)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v34 = 138412802;
      v35 = v11;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v4;
      v12 = v11;
      LODWORD(v32) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v34, v32);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v10);
    }

    goto LABEL_14;
  }
LABEL_27:

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDictionary, 0);
}

@end
