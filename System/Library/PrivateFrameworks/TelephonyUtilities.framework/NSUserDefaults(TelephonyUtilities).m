@implementation NSUserDefaults(TelephonyUtilities)

+ (id)tu_defaults
{
  if (tu_defaults_onceToken != -1)
    dispatch_once(&tu_defaults_onceToken, &__block_literal_global_23);
  return (id)tu_defaults_tu_defaults;
}

+ (id)sb_defaults
{
  if (sb_defaults_onceToken != -1)
    dispatch_once(&sb_defaults_onceToken, &__block_literal_global_2);
  return (id)sb_defaults_sb_defaults;
}

- (uint64_t)BOOLForKey:()TelephonyUtilities withDefault:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(a1, "BOOLForKey:", v6);

  return a4;
}

@end
