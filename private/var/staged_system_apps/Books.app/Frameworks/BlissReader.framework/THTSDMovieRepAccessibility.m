@implementation THTSDMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMovieRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THTSDMovieRepAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("TSDMovieRepAccessibility"));
}

@end
