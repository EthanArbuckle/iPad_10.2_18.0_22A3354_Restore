@implementation CRLSubselectionAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLSubselection");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLSubselectionAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSSet)crlaxInfos
{
  Protocol *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v3 = NSProtocolFromString(CFSTR("CRLCanvasSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CRLSubselectionAccessibility conformsToProtocol:](self, "conformsToProtocol:", v4);

  if (!v5)
  {
    if (!CRLAccessibilityShouldPerformValidationChecks()
      || (ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          v14 = objc_opt_class(self, v13),
          !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("%@ does not implement CRLCanvasSelection protocol, we should not be asking it for infos"), v15, v16, v17, v18, v19, v14)))
    {
      v11 = 0;
      return (NSSet *)v11;
    }
LABEL_8:
    abort();
  }
  v21 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSubselectionAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("infos")));
  v8 = (objc_class *)objc_opt_class(NSSet, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v21);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v21)
    goto LABEL_8;
  v11 = (void *)v10;

  return (NSSet *)v11;
}

- (NSSet)crlaxUnlockedInfos
{
  Protocol *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v3 = NSProtocolFromString(CFSTR("CRLCanvasSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CRLSubselectionAccessibility conformsToProtocol:](self, "conformsToProtocol:", v4);

  if (!v5)
  {
    if (!CRLAccessibilityShouldPerformValidationChecks()
      || (ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          v14 = objc_opt_class(self, v13),
          !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("%@ does not implement CRLCanvasSelection protocol, we should not be asking it for infos"), v15, v16, v17, v18, v19, v14)))
    {
      v11 = 0;
      return (NSSet *)v11;
    }
LABEL_8:
    abort();
  }
  v21 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSubselectionAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("unlockedInfos")));
  v8 = (objc_class *)objc_opt_class(NSSet, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v21);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v21)
    goto LABEL_8;
  v11 = (void *)v10;

  return (NSSet *)v11;
}

@end
