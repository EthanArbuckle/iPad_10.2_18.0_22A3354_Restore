@implementation TSDContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDContainerRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSArray)tsaxChildReps
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("childReps")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
