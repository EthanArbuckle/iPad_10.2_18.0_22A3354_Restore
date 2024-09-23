@implementation SUControllerLogger

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1)
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global);
  return (id)sharedLogger_logger;
}

void __34__SUControllerLogger_sharedLogger__block_invoke()
{
  SUControllerLogger *v0;
  void *v1;

  v0 = objc_alloc_init(SUControllerLogger);
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;

}

- (SUControllerLogger)init
{
  SUControllerLogger *v2;
  SUControllerLogger *v3;
  os_log_t v4;
  OS_os_log *logInfo;
  os_log_t v6;
  OS_os_log *logNotice;
  os_log_t v8;
  OS_os_log *logError;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUControllerLogger;
  v2 = -[SUControllerLogger init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_logLevel = 2;
    v4 = os_log_create("com.apple.sucontroller", "Info");
    logInfo = v3->_logInfo;
    v3->_logInfo = (OS_os_log *)v4;

    v6 = os_log_create("com.apple.sucontroller", "Notice");
    logNotice = v3->_logNotice;
    v3->_logNotice = (OS_os_log *)v6;

    v8 = os_log_create("com.apple.sucontroller", "Error");
    logError = v3->_logError;
    v3->_logError = (OS_os_log *)v8;

  }
  return v3;
}

- (void)setLoglevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void)logAtLevel:(int64_t)a3 label:(const char *)a4 format:(id)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *logError;
  NSObject *logNotice;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *logInfo;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v21);

  if (a3 == 1)
  {
    logNotice = self->_logNotice;
    if (!os_log_type_enabled(logNotice, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136446466;
    v17 = a4;
    v18 = 2114;
    v19 = v10;
    v13 = logNotice;
    v14 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
    _os_log_impl(&dword_247695000, v13, v14, "%{public}s: %{public}@", buf, 0x16u);
    goto LABEL_10;
  }
  if (a3)
  {
    logInfo = self->_logInfo;
    if (!os_log_type_enabled(logInfo, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    *(_DWORD *)buf = 136446466;
    v17 = a4;
    v18 = 2114;
    v19 = v10;
    v13 = logInfo;
    v14 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  logError = self->_logError;
  if (os_log_type_enabled(logError, OS_LOG_TYPE_ERROR))
    -[SUControllerLogger logAtLevel:label:format:].cold.1((uint64_t)a4, (uint64_t)v10, logError);
LABEL_10:

}

- (int64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logError, 0);
  objc_storeStrong((id *)&self->_logNotice, 0);
  objc_storeStrong((id *)&self->_logInfo, 0);
}

- (void)logAtLevel:(uint64_t)a1 label:(uint64_t)a2 format:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_247695000, log, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
