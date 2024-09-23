@implementation TSTConfigurationAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTConfiguration");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)tsaxSharedTableConfiguration
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTConfigurationAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(objc_msgSend(a1, "tsaxTargetClass"), "tsaxValueForKey:", CFSTR("sharedTableConfiguration")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxSupportsContainedTextEditing
{
  return -[TSTConfigurationAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("supportsContainedTextEditing"));
}

- (void)tsaxPerformBlockDisablingIgnoringBeginEditingOnSingleTap:(id)a3
{
  if (-[TSTConfigurationAccessibility _tsaxIgnoreBeginEditingOnSingleTap](self, "_tsaxIgnoreBeginEditingOnSingleTap"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[TSTConfigurationAccessibility _tsaxSetIgnoreBeginEditingOnSingleTap:](self, "_tsaxSetIgnoreBeginEditingOnSingleTap:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSTConfigurationAccessibility _tsaxSetIgnoreBeginEditingOnSingleTap:](self, "_tsaxSetIgnoreBeginEditingOnSingleTap:", 0);
  }
}

- (BOOL)_tsaxIgnoreBeginEditingOnSingleTap
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543879);
}

- (void)_tsaxSetIgnoreBeginEditingOnSingleTap:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543879, a3);
}

- (BOOL)beginEditingOnSingleTap
{
  objc_super v4;

  if (-[TSTConfigurationAccessibility _tsaxIgnoreBeginEditingOnSingleTap](self, "_tsaxIgnoreBeginEditingOnSingleTap"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTConfigurationAccessibility;
  return -[TSTConfigurationAccessibility beginEditingOnSingleTap](&v4, "beginEditingOnSingleTap");
}

@end
