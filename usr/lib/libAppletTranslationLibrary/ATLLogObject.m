@implementation ATLLogObject

void __ATLLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.nfc", "atl");
  v1 = (void *)ATLLogObject_logObject;
  ATLLogObject_logObject = (uint64_t)v0;

}

@end
