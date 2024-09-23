@implementation NSUserDefaults(RecorderExtensions)

+ (id)voiceMemosUserDefaults
{
  if (voiceMemosUserDefaults_onceToken != -1)
    dispatch_once(&voiceMemosUserDefaults_onceToken, &__block_literal_global_5);
  return (id)voiceMemosUserDefaults_voiceMemosUserDefaults;
}

@end
