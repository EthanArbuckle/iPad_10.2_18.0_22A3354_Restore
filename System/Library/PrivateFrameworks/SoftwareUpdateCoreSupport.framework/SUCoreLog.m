@implementation SUCoreLog

- (OS_os_log)oslog
{
  return self->_oslog;
}

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1)
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_4);
  return (id)sharedLogger_logger;
}

void __25__SUCoreLog_sharedLogger__block_invoke()
{
  SUCoreLog *v0;
  void *v1;

  v0 = -[SUCoreLog initWithCategory:]([SUCoreLog alloc], "initWithCategory:", CFSTR("SU"));
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;

}

- (SUCoreLog)initWithCategory:(id)a3
{
  id v5;
  SUCoreLog *v6;
  SUCoreLog *v7;
  void *v8;
  id v9;
  os_log_t v10;
  OS_os_log *oslog;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCoreLog;
  v6 = -[SUCoreLog init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commonDomain");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = os_log_create((const char *)objc_msgSend(v9, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    oslog = v7->_oslog;
    v7->_oslog = (OS_os_log *)v10;

  }
  return v7;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
}

@end
