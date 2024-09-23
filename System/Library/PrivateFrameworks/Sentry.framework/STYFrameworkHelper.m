@implementation STYFrameworkHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_11);
  return (id)sharedHelper;
}

void __34__STYFrameworkHelper_sharedHelper__block_invoke()
{
  STYFrameworkHelper *v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_t v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  dispatch_queue_t v8;
  NSObject *attr;

  v0 = objc_alloc_init(STYFrameworkHelper);
  v1 = (void *)sharedHelper;
  sharedHelper = (uint64_t)v0;

  if (sharedHelper)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    attr = objc_claimAutoreleasedReturnValue();
    v2 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_UTILITY, -15);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, -15);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.Sentry.Framework", "STYFrameworkHelper");
    objc_msgSend((id)sharedHelper, "setLogHandle:", v5);

    v6 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Serial.utility", attr);
    objc_msgSend((id)sharedHelper, "setSharedSerialQueueAtUtility:", v6);

    v7 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Conc.utility", v3);
    objc_msgSend((id)sharedHelper, "setSharedConcurrentQueueAtUtility:", v7);

    v8 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Conc.backgorund", v4);
    objc_msgSend((id)sharedHelper, "setSharedConcurrentQueueAtBackground:", v8);

  }
}

- (id)subsystemForSignposts
{
  return CFSTR("com.apple.Sentry.FrameworkSignposts");
}

- (OS_dispatch_queue)sharedSerialQueueAtUtility
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedSerialQueueAtUtility:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)sharedConcurrentQueueAtUtility
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedConcurrentQueueAtUtility:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)sharedConcurrentQueueAtBackground
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSharedConcurrentQueueAtBackground:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_sharedConcurrentQueueAtBackground, 0);
  objc_storeStrong((id *)&self->_sharedConcurrentQueueAtUtility, 0);
  objc_storeStrong((id *)&self->_sharedSerialQueueAtUtility, 0);
}

@end
