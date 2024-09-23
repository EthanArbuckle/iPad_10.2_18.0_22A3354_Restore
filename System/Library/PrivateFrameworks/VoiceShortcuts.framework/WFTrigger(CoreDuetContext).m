@implementation WFTrigger(CoreDuetContext)

- (void)contextStoreKeyPathForCurrentState
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;

  getWFTriggersLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 136315394;
    v4 = "-[WFTrigger(CoreDuetContext) contextStoreKeyPathForCurrentState]";
    v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1C146A000, v0, OS_LOG_TYPE_ERROR, "%s Subclass MUST override, but %@ didn't", (uint8_t *)&v3, 0x16u);

  }
  __break(1u);
}

- (void)contextStorePredicate
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;

  getWFTriggersLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 136315394;
    v4 = "-[WFTrigger(CoreDuetContext) contextStorePredicate]";
    v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1C146A000, v0, OS_LOG_TYPE_ERROR, "%s Subclass MUST override, but %@ didn't", (uint8_t *)&v3, 0x16u);

  }
  __break(1u);
}

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (uint64_t)contextStoreRegistrationIsForWatch
{
  return 0;
}

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  return 1;
}

- (uint64_t)needsRegistrationAfterFiring
{
  return 0;
}

@end
