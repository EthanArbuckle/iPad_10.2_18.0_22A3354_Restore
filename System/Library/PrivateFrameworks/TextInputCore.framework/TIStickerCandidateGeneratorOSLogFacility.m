@implementation TIStickerCandidateGeneratorOSLogFacility

void __TIStickerCandidateGeneratorOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "TIStickerCandidateGenerator");
  v1 = (void *)TIStickerCandidateGeneratorOSLogFacility_logFacility;
  TIStickerCandidateGeneratorOSLogFacility_logFacility = (uint64_t)v0;

}

@end
