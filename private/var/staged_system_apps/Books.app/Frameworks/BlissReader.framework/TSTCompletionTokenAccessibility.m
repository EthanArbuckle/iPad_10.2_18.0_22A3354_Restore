@implementation TSTCompletionTokenAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTCompletionToken");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSTWPTokenAttachmentAccessibility, a2);
}

- (NSString)tsaxCompletionText
{
  return (NSString *)-[TSTCompletionTokenAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("completionText"));
}

- (NSString)tsaxCompletionPrefixText
{
  id v3;
  id length;
  id v5;
  NSUInteger v6;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSRange v16;
  uint64_t v18;
  NSRange v19;
  NSRange v20;

  v3 = -[TSTCompletionTokenAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("completionText"));
  length = objc_msgSend(v3, "length");
  v5 = -[TSTCompletionTokenAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("prefixRange"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    location = 0;
  }
  else
  {
    v8 = (NSUInteger)v5;
    v9 = v6;
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (v8 + v9 > (unint64_t)length)
      {
        ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Completion token's prefix range property is bogus."), v11, v12, v13, v14, v15, v18))abort();
      }
    }
    v19.location = v8;
    v19.length = v9;
    v20.location = 0;
    v20.length = (NSUInteger)length;
    v16 = NSIntersectionRange(v19, v20);
    location = v16.location;
    length = (id)v16.length;
  }
  return (NSString *)objc_msgSend(v3, "substringWithRange:", location, length);
}

@end
