@implementation TIAppAutofillOSLogFacility

void __TIAppAutofillOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "TIAppAutofill");
  v1 = (void *)TIAppAutofillOSLogFacility_logFacility;
  TIAppAutofillOSLogFacility_logFacility = (uint64_t)v0;

}

@end
