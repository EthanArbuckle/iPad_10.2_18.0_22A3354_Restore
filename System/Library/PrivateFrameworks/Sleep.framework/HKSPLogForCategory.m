@implementation HKSPLogForCategory

void __HKSPLogForCategory_block_invoke()
{
  unint64_t i;
  const char *v1;
  const char *v2;
  os_log_t v3;
  id v4;

  for (i = 0; i != 22; ++i)
  {
    v1 = (const char *)HKSPSleepLogSubsystem;
    v2 = HKSPLogCategoryForCategory(i);
    v3 = os_log_create(v1, v2);
    v4 = HKSPLogForCategory_logObjects[i];
    HKSPLogForCategory_logObjects[i] = v3;

  }
}

@end
