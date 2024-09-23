@implementation CRLUIReferenceLibraryViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIReferenceLibraryViewController");
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
  objc_opt_class(CRLUIReferenceLibraryViewControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3
{
  id v4;
  BOOL v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning()
    || (+[NSThread isMainThread](NSThread, "isMainThread") ? (v5 = byte_101415768 == 0) : (v5 = 1), v5))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CRLUIReferenceLibraryViewControllerAccessibility;
    v6 = objc_msgSendSuper2(&v8, "dictionaryHasDefinitionForTerm:", v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end
