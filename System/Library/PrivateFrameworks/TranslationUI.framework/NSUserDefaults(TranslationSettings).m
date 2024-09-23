@implementation NSUserDefaults(TranslationSettings)

+ (id)translationAppGroupDefaults
{
  if (translationAppGroupDefaults_onceToken[0] != -1)
    dispatch_once(translationAppGroupDefaults_onceToken, &__block_literal_global);
  return (id)translationAppGroupDefaults_userDefaults;
}

@end
