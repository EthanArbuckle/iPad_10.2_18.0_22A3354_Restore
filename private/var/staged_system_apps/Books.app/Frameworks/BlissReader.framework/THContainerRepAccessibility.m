@implementation THContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THContainerRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDContainerRepAccessibility, a2);
}

- (id)childRepsForHitTesting
{
  objc_super v4;

  if (!+[THTSDRepAccessibility thaxRepShouldAllowHitTestingOfChildren:](THTSDRepAccessibility, "thaxRepShouldAllowHitTestingOfChildren:", self))return 0;
  v4.receiver = self;
  v4.super_class = (Class)THContainerRepAccessibility;
  return -[THTSDContainerRepAccessibility childRepsForHitTesting](&v4, "childRepsForHitTesting");
}

@end
