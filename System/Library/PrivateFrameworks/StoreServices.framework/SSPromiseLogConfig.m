@implementation SSPromiseLogConfig

void __SSPromiseLogConfig_block_invoke()
{
  uint64_t v0;
  void *v1;
  SSMutableLogConfig *v2;

  v2 = objc_alloc_init(SSMutableLogConfig);
  -[SSLogConfig setSubsystem:](v2, "setSubsystem:", CFSTR("com.apple.StoreServices"));
  -[SSLogConfig setCategory:](v2, "setCategory:", CFSTR("promise"));
  v0 = -[SSMutableLogConfig copy](v2, "copy");
  v1 = (void *)SSPromiseLogConfig_logConfig;
  SSPromiseLogConfig_logConfig = v0;

}

@end
