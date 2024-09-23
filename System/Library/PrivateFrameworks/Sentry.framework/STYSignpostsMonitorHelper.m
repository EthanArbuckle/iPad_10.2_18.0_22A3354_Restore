@implementation STYSignpostsMonitorHelper

- (STYSignpostsMonitorHelper)init
{
  STYSignpostsMonitorHelper *v2;
  STYSignpostsMonitorHelper *v3;
  const char *ClassName;
  dispatch_queue_t v5;
  OS_dispatch_queue *processingQueue;
  objc_super v8;
  char __str[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)STYSignpostsMonitorHelper;
  v2 = -[STYSignpostsMonitorHelper init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    ClassName = object_getClassName(v2);
    snprintf(__str, 0x80uLL, "com.apple.sentry.signpostsMonitor.%s", ClassName);
    v5 = dispatch_queue_create(__str, 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (void)takeTransaction
{
  void *v3;
  const char *ClassName;
  void *v5;
  char __str[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[STYSignpostsMonitorHelper osTransaction](self, "osTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    ClassName = object_getClassName(self);
    snprintf(__str, 0x80uLL, "com.apple.sentry.signpostsMonitor.%s", ClassName);
    v5 = (void *)os_transaction_create();
    -[STYSignpostsMonitorHelper setOsTransaction:](self, "setOsTransaction:", v5);

  }
}

- (BOOL)wantsAnimationFrameRate
{
  return 0;
}

- (void)willStartMonitoring
{
  -[STYSignpostsMonitorHelper setIsEnabled:](self, "setIsEnabled:", 1);
  -[STYSignpostsMonitorHelper resetState](self, "resetState");
  -[STYSignpostsMonitorHelper takeTransaction](self, "takeTransaction");
}

- (void)didEndMonitoring
{
  -[STYSignpostsMonitorHelper setOsTransaction:](self, "setOsTransaction:", 0);
  -[STYSignpostsMonitorHelper resetState](self, "resetState");
  -[STYSignpostsMonitorHelper setIsEnabled:](self, "setIsEnabled:", 0);
}

- (BOOL)needsEnablementChange
{
  BOOL v3;

  v3 = -[STYSignpostsMonitorHelper isEnabled](self, "isEnabled");
  return v3 ^ -[STYSignpostsMonitorHelper shouldBeEnabled](self, "shouldBeEnabled");
}

- (NSString)name
{
  void *v3;
  NSObject *v4;

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[STYSignpostsMonitorHelper name].cold.1(self);

  return (NSString *)CFSTR("Unnamed signpost monitor helper");
}

- (SignpostSupportSubsystemCategoryAllowlist)allowList
{
  void *v3;
  NSObject *v4;

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[STYSignpostsMonitorHelper name].cold.1(self);

  return 0;
}

- (BOOL)shouldBeEnabled
{
  return self->_shouldBeEnabled;
}

- (void)setShouldBeEnabled:(BOOL)a3
{
  self->_shouldBeEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcessingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_transaction)osTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOsTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)name
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  object_getClassName(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15(&dword_1CB87B000, v1, v2, "allowList need to be overridden by %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
