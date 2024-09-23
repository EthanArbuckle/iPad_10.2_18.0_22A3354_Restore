@implementation TSUIReferenceLibraryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIReferenceLibraryViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3
{
  objc_super v7;

  if (UIAccessibilityIsVoiceOverRunning()
    && +[NSThread isMainThread](NSThread, "isMainThread")
    && byte_5439B6 != 0)
  {
    return 1;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TSUIReferenceLibraryViewControllerAccessibility;
  return objc_msgSendSuper2(&v7, "dictionaryHasDefinitionForTerm:", a3);
}

@end
