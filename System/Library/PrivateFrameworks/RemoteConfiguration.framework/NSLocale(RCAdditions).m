@implementation NSLocale(RCAdditions)

+ (id)rc_preferredLanguageCodes
{
  if (rc_preferredLanguageCodes_onceToken != -1)
    dispatch_once(&rc_preferredLanguageCodes_onceToken, &__block_literal_global_6);
  return (id)rc_preferredLanguageCodes_s_languageCodes;
}

@end
