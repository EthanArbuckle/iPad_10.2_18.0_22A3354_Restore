@implementation THWLabelControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWLabelControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (id)tsaxDescription
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_labelLayer")), "tsaxValueForKey:", CFSTR("string")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
