@implementation RCTranscriptionFeatureFlagIsEnabled

uint64_t __RCTranscriptionFeatureFlagIsEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  RCTranscriptionFeatureFlagIsEnabled_transcriptionEnabled = result;
  return result;
}

@end
