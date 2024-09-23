@implementation TSDPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)_tsaxStoredLabel
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_54388A);
}

- (void)_tsaxSetStoredLabel:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_54388A, a3);
}

+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v6;
  void *v8;
  id v9;
  Class v10;
  Class v11;
  objc_super v13;
  char v14;

  height = a4.height;
  width = a4.width;
  v6 = *(_QWORD *)&a3;
  v14 = 0;
  v8 = (void *)objc_opt_class(TSDPathSourceAccessibility);
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___TSDPathSourceAccessibility;
  v9 = objc_msgSendSuper2(&v13, "pathSourceForShapeType:naturalSize:", v6, width, height);
  v10 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v9, 1, &v14);
  if (v14)
    abort();
  v11 = v10;
  -[objc_class _tsaxUpdatePathSourceLabelForType:](v10, "_tsaxUpdatePathSourceLabelForType:", v6);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDPathSourceAccessibility;
  v4 = -[TSDPathSourceAccessibility copyWithZone:](&v7, "copyWithZone:", a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_23A678;
  v6[3] = &unk_426E28;
  v6[4] = v4;
  v6[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  return v4;
}

- (NSString)tsaxLabel
{
  NSString *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[TSDPathSourceAccessibility _tsaxStoredLabel](self, "_tsaxStoredLabel");
  if (!v3)
  {
    v3 = -[TSDPathSourceAccessibility _tsaxInferredLabel](self, "_tsaxInferredLabel");
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (!v3)
      {
        ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("_tsaxInferredLabel did not return an inferred label for object: %@"), v5, v6, v7, v8, v9, (uint64_t)self))abort();
        return 0;
      }
    }
  }
  return v3;
}

- (CGSize)tsaxNaturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[TSDPathSourceAccessibility tsaxCGSizeValueForKey:](self, "tsaxCGSizeValueForKey:", CFSTR("naturalSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_tsaxInferredLabel
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Class should override _tsaxInferredLabel: %@"), v6, v7, v8, v9, v10, (uint64_t)v5))abort();
  }
  return 0;
}

- (void)_tsaxUpdatePathSourceLabelForType:(int)a3
{
  NSString *v4;

  if ((a3 - 1) > 0x12)
    v4 = 0;
  else
    v4 = TSAccessibilityLocalizedString((uint64_t)off_43BD70[a3 - 1]);
  -[TSDPathSourceAccessibility _tsaxSetStoredLabel:](self, "_tsaxSetStoredLabel:", v4);
}

@end
