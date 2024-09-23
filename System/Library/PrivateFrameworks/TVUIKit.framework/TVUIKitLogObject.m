@implementation TVUIKitLogObject

void __TVUIKitLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVUIKit", "System");
  v1 = (void *)TVUIKitLogObject__TVUIKitLogObject;
  TVUIKitLogObject__TVUIKitLogObject = (uint64_t)v0;

}

@end
