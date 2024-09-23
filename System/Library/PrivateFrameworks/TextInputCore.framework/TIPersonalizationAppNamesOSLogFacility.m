@implementation TIPersonalizationAppNamesOSLogFacility

void __TIPersonalizationAppNamesOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "PersonalizationAppNames");
  v1 = (void *)TIPersonalizationAppNamesOSLogFacility_logFacility;
  TIPersonalizationAppNamesOSLogFacility_logFacility = (uint64_t)v0;

}

@end
