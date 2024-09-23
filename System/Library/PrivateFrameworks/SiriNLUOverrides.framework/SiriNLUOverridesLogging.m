@implementation SiriNLUOverridesLogging

+ (void)SiriNLUOverridesLogInitIfNeeded
{
  if (SiriNLUOverridesLogInitIfNeeded_once[0] != -1)
    dispatch_once(SiriNLUOverridesLogInitIfNeeded_once, &__block_literal_global);
}

+ (BOOL)debugEnabled
{
  return os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG);
}

void __58__SiriNLUOverridesLogging_SiriNLUOverridesLogInitIfNeeded__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)OverridesLoggingSubsystem, (const char *)OverridesLoggingCategory);
  v1 = (void *)OverridesLogContext;
  OverridesLogContext = (uint64_t)v0;

}

@end
