@implementation NSObject(TPSCoreAdditions)

- (id)tps_safeValueForKey:()TPSCoreAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tps_safeValueForKeyPath:()TPSCoreAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
