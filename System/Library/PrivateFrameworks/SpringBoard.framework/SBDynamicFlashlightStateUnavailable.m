@implementation SBDynamicFlashlightStateUnavailable

- (BOOL)isOn
{
  return 0;
}

- (BOOL)isUnavailable
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 == self)
    return 1;
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

- (NSString)description
{
  return (NSString *)CFSTR("<unavailable>");
}

@end
