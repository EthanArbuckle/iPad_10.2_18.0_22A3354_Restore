@implementation NSBundle(PKADLoggingPrivacy)

- (__CFString)PKSanitizedBundleIdentifier
{
  __CFString *v1;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString hasPrefix:](v1, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {

    v1 = CFSTR("thirdparty");
  }
  return v1;
}

@end
