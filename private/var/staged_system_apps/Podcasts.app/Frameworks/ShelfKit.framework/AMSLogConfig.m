@implementation AMSLogConfig

+ (id)ask_generalLogConfig
{
  if (ask_generalLogConfig_onceToken != -1)
    dispatch_once(&ask_generalLogConfig_onceToken, &__block_literal_global_3);
  return (id)ask_generalLogConfig_logConfig;
}

void __46__AMSLogConfig_ShelfKit__ask_generalLogConfig__block_invoke(id a1)
{
  id v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init((Class)AMSMutableLogConfig);
  objc_msgSend(v3, "setSubsystem:", CFSTR("com.apple.ShelfKit"));
  objc_msgSend(v3, "setCategory:", CFSTR("ASK General"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)ask_generalLogConfig_logConfig;
  ask_generalLogConfig_logConfig = (uint64_t)v1;

}

@end
