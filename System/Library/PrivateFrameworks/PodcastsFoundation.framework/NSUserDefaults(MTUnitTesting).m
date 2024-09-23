@implementation NSUserDefaults(MTUnitTesting)

+ (id)appUserDefaultsForUnitTesting
{
  return (id)sAppUserDefaultsForUnitTesting;
}

+ (void)setAppUserDefaultsForUnitTesting:()MTUnitTesting
{
  id v4;

  v4 = a3;
  if (NSClassFromString(CFSTR("XCTestCase")))
    objc_storeStrong((id *)&sAppUserDefaultsForUnitTesting, a3);

}

+ (void)setGroupUserDefaultsForUnitTesting:()MTUnitTesting
{
  id v4;

  v4 = a3;
  if (NSClassFromString(CFSTR("XCTestCase")))
    objc_storeStrong((id *)&sGroupUserDefaultsForUnitTesting, a3);

}

+ (id)groupUserDefaultsForUnitTesting
{
  return (id)sGroupUserDefaultsForUnitTesting;
}

@end
