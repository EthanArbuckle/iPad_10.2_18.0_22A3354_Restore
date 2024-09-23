@implementation THTSDContainerRepAccessibility

- (id)childRepsForHitTesting
{
  objc_super v4;

  if (!objc_msgSend((id)objc_opt_class(self), "thaxRepShouldAllowHitTestingOfChildren:", self))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THTSDContainerRepAccessibility;
  return -[THTSDContainerRepAccessibility childRepsForHitTesting](&v4, "childRepsForHitTesting");
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDContainerRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

@end
