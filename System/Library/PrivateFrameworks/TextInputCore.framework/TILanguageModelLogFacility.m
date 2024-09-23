@implementation TILanguageModelLogFacility

void __TILanguageModelLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "LanguageModel");
  v1 = (void *)TILanguageModelLogFacility_logFacility;
  TILanguageModelLogFacility_logFacility = (uint64_t)v0;

}

@end
