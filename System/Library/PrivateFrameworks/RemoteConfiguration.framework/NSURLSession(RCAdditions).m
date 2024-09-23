@implementation NSURLSession(RCAdditions)

- (__CFString)rc_logIdentifier
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown");
  v4 = v2;

  return v4;
}

@end
