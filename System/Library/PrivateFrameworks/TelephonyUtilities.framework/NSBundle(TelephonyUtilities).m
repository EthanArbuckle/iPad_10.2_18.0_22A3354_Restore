@implementation NSBundle(TelephonyUtilities)

- (id)tu_assumedIdentity
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "tu_assumedIdentityForBundleIdentifier:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)tu_assumedIdentityForBundleIdentifier:()TelephonyUtilities
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")))
    {
      v4 = "/System/Library/PrivateFrameworks/TelephonyUtilities.framework/callservicesd";
      v5 = 1;
    }
    else
    {
      v4 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v5 = 0;
    }
    v6 = (void *)tu_tcc_identity_create(v5, (uint64_t)v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
