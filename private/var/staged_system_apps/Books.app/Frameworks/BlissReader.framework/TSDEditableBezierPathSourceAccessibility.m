@implementation TSDEditableBezierPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDEditableBezierPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  id v3;

  v3 = -[TSDEditableBezierPathSourceAccessibility _tsaxBezierPath](self, "_tsaxBezierPath");
  -[TSDPathSourceAccessibility tsaxNaturalSize](self, "tsaxNaturalSize");
  return objc_msgSend(v3, "tsaxInferredLabelForSize:");
}

- (id)_tsaxBezierPath
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDBezierPathAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDEditableBezierPathSourceAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bezierPath")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
