@implementation THTSDCanvasAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCanvas");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDCanvasAccessibility, a2);
}

- (void)thaxInvalidateLayers
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2547A4;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

@end
