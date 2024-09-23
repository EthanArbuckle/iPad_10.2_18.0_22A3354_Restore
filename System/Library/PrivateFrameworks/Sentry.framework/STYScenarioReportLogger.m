@implementation STYScenarioReportLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_0 != -1)
    dispatch_once(&sharedLogger_onceToken_0, &__block_literal_global_4);
  return (id)logger_0;
}

void __39__STYScenarioReportLogger_sharedLogger__block_invoke()
{
  STYScenarioReportLogger *v0;
  void *v1;
  os_log_t v2;

  v0 = objc_alloc_init(STYScenarioReportLogger);
  v1 = (void *)logger_0;
  logger_0 = (uint64_t)v0;

  v2 = os_log_create("com.apple.Sentry.Framework", "STYScenarioReport");
  objc_msgSend((id)logger_0, "setLogHandle:", v2);

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
