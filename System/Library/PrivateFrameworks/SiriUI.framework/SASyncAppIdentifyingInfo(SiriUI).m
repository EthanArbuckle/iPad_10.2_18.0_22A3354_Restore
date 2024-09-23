@implementation SASyncAppIdentifyingInfo(SiriUI)

- (uint64_t)siriui_isSurfAppInfo
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ApplePayDisambiguationItem"));

  return v2;
}

- (__CFString)siriui_bundleId
{
  __CFString *v2;

  if ((objc_msgSend(a1, "siriui_isSurfAppInfo") & 1) != 0)
  {
    v2 = CFSTR("com.apple.MobileSMS");
  }
  else
  {
    objc_msgSend(a1, "bundleId");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
