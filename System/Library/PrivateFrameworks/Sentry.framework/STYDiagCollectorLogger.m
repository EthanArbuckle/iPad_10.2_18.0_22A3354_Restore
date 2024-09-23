@implementation STYDiagCollectorLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global);
  return (id)logger;
}

void __38__STYDiagCollectorLogger_sharedLogger__block_invoke()
{
  STYDiagCollectorLogger *v0;
  void *v1;
  os_log_t v2;

  v0 = objc_alloc_init(STYDiagCollectorLogger);
  v1 = (void *)logger;
  logger = (uint64_t)v0;

  v2 = os_log_create("com.apple.Sentry.Framework", "PerfChecker");
  objc_msgSend((id)logger, "setLogHandle:", v2);

}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
}

@end
