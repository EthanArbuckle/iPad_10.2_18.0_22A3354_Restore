@implementation SSObservableLogConfig

void __SSObservableLogConfig_block_invoke()
{
  uint64_t v0;
  void *v1;
  SSMutableLogConfig *v2;

  v2 = objc_alloc_init(SSMutableLogConfig);
  -[SSLogConfig setSubsystem:](v2, "setSubsystem:", CFSTR("com.apple.StoreServices"));
  -[SSLogConfig setCategory:](v2, "setCategory:", CFSTR("observable"));
  v0 = -[SSMutableLogConfig copy](v2, "copy");
  v1 = (void *)SSObservableLogConfig_logConfig;
  SSObservableLogConfig_logConfig = v0;

}

@end
