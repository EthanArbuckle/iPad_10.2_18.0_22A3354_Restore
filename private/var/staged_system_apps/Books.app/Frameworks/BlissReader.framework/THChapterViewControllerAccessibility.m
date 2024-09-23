@implementation THChapterViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THChapterViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxDelegate
{
  return -[THChapterViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mDelegate"));
}

- (unint64_t)thaxChapterIndex
{
  return (unint64_t)-[THChapterViewControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("chapterIndex"));
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

@end
