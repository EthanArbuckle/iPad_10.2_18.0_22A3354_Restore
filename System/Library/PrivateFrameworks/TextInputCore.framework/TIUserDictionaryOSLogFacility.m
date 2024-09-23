@implementation TIUserDictionaryOSLogFacility

void __TIUserDictionaryOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "UserDictionary");
  v1 = (void *)TIUserDictionaryOSLogFacility_logFacility;
  TIUserDictionaryOSLogFacility_logFacility = (uint64_t)v0;

}

@end
