@implementation NSSet(TelephonyUtilities)

- (id)tu_anyObjectPassingTest:()TelephonyUtilities
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectsPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)tu_containsObjectPassingTest:()TelephonyUtilities
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "tu_anyObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
