@implementation CHSWidget(PRAdditions)

- (uint64_t)pr_isWorldClockWidget
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extensionIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobiletimer.WorldClockWidget"));

  return v3;
}

@end
