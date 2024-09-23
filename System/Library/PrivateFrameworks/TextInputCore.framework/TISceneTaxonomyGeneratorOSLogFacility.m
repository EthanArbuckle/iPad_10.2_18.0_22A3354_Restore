@implementation TISceneTaxonomyGeneratorOSLogFacility

void __TISceneTaxonomyGeneratorOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "TISceneTaxonomyGenerator");
  v1 = (void *)TISceneTaxonomyGeneratorOSLogFacility_logFacility;
  TISceneTaxonomyGeneratorOSLogFacility_logFacility = (uint64_t)v0;

}

@end
