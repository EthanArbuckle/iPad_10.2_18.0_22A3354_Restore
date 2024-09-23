@implementation NSUserDefaults(ThirdPartyApplicationSettingsAdditions)

+ (id)userDefaultsWithSuiteName:()ThirdPartyApplicationSettingsAdditions container:
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSuiteName:container:", v6, v5);

  return v7;
}

@end
