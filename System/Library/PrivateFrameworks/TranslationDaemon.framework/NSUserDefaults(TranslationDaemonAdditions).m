@implementation NSUserDefaults(TranslationDaemonAdditions)

+ (id)lt_appGroupDefaults
{
  if (lt_appGroupDefaults_onceToken != -1)
    dispatch_once(&lt_appGroupDefaults_onceToken, &__block_literal_global_30);
  return (id)lt_appGroupDefaults_appGroupDefaults;
}

- (uint64_t)lt_isOnDeviceOnly
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("OnDeviceOnly"));
}

- (uint64_t)lt_hasAcceptedFirstUseConsent
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("FirstUseConsent"));
}

@end
