@implementation APRateLimitSettings

- (void)setRateLimitsObject:(id)a3
{
  id v4;
  id v5;

  v4 = sub_10002FBF8(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[APRateLimitSettings setRateLimits:](self, "setRateLimits:", v5);

}

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", v3);

  return v4;
}

- (APRateLimits)rateLimitsObject
{
  void *v2;
  id *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APRateLimitSettings rateLimits](self, "rateLimits"));
  if (v2)
    v3 = sub_1000028C0((id *)[APRateLimits alloc], v2);
  else
    v3 = 0;

  return (APRateLimits *)v3;
}

@end
