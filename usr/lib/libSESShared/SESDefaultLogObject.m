@implementation SESDefaultLogObject

void __SESDefaultLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seserviced", "default");
  v1 = (void *)SESDefaultLogObject_log;
  SESDefaultLogObject_log = (uint64_t)v0;

}

@end
