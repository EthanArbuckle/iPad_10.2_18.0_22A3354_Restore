@implementation RBSProcessPredicateSuspendable

- (BOOL)matchesProcess:(id)a3
{
  return objc_msgSend(a3, "isLifecycleManaged");
}

@end
