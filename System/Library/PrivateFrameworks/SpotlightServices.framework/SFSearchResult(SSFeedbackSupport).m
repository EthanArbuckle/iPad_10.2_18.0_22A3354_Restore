@implementation SFSearchResult(SSFeedbackSupport)

- (uint64_t)isAppClip
{
  return 0;
}

- (uint64_t)isWebClip
{
  return 0;
}

- (__CFString)feedbackSectionIdentifier
{
  __CFString *v2;
  uint64_t v3;

  if ((objc_msgSend(a1, "isAppClip") & 1) != 0)
  {
    v2 = CFSTR("com.apple.app-clips");
  }
  else if ((objc_msgSend(a1, "isLocalApplicationResult") & 1) != 0)
  {
    v2 = CFSTR("com.apple.application");
  }
  else
  {
    objc_msgSend(a1, "sectionBundleIdentifier");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    objc_msgSend(a1, "resultBundleId");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
  return v2;
}

@end
