@implementation TCVegaLogger

+ (id)instance
{
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_0);
  return (id)instance_log;
}

void __24__TCVegaLogger_instance__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.turi", "vega_renderer");
  v1 = (void *)instance_log;
  instance_log = (uint64_t)v0;

}

@end
