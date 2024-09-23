@implementation TVUIKitLSMLogObject

void __TVUIKitLSMLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVUIKit", "LSM");
  v1 = (void *)TVUIKitLSMLogObject__TVUIKitLogObject;
  TVUIKitLSMLogObject__TVUIKitLogObject = (uint64_t)v0;

}

@end
