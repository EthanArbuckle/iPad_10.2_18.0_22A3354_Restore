@implementation SSSoftwareDownload

- (SSSoftwareDownload)initWithJob:(id)a3
{
  id v5;
  id *v6;
  SSSoftwareDownload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSSoftwareDownload;
  v6 = -[SSEntity _initWithPersistentIdentifier:](&v9, sel__initWithPersistentIdentifier_, objc_msgSend(v5, "persistentID"));
  v7 = (SSSoftwareDownload *)v6;
  if (v6)
    objc_storeStrong(v6 + 12, a3);

  return v7;
}

- (SSSoftwareDownload)initWithPersistentIdentifier:(int64_t)a3
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v18 = 138543362;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v17);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
  return 0;
}

- (BOOL)isCancelable
{
  unint64_t v2;

  v2 = -[ASDJob phase](self->_job, "phase");
  return (v2 < 0xA) & (0x2CCu >> v2);
}

- (id)downloadPhaseIdentifier
{
  unint64_t v2;
  __CFString **v3;

  v2 = -[ASDJob phase](self->_job, "phase");
  if (v2 > 8)
    v3 = SSDownloadPhaseWaiting;
  else
    v3 = off_1E47C0B48[v2];
  return *v3;
}

- (id)failureError
{
  return (id)-[ASDJob failureError](self->_job, "failureError");
}

- (double)percentComplete
{
  double result;

  -[ASDJob percentComplete](self->_job, "percentComplete");
  return result;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("7")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ASDJob storeItemID](self->_job, "storeItemID"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("V")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASDJob type](self->_job, "type") == 3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("c")))
  {
    -[ASDJob bundleID](self->_job, "bundleID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("1")))
    {
      v6 = 0;
      goto LABEL_10;
    }
    v5 = CFSTR("software");
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (id)metadata
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)networkConstraints
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (void)setMetadata:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setNetworkConstraints:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setStatus:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (id)status
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)assetsForType:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v18 = 138543362;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v17);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
  return 0;
}

- (id)backgroundNetworkingJobGroupName
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (int64_t)bytesDownloaded
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (int64_t)bytesTotal
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)downloadPolicy
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (int64_t)downloadSizeLimit
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (double)estimatedSecondsRemaining
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return -1.0;
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (void)pause
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v15 = 138543362;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
}

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v17, v16);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
}

- (BOOL)removeAsset:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (void)resume
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v15 = 138543362;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
}

- (void)restart
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v15 = 138543362;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
}

- (void)setBackgroundNetworkingJobGroupName:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v17, v16);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
}

- (void)setDownloadPolicy:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setValuesWithStoreDownloadMetadata:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (ASDJob)job
{
  return self->_job;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job, 0);
}

@end
