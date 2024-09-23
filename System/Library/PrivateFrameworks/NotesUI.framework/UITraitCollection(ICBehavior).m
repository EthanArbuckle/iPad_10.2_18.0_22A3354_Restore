@implementation UITraitCollection(ICBehavior)

- (uint64_t)ic_behavior
{
  return objc_msgSend(a1, "valueForNSIntegerTrait:", objc_opt_class());
}

@end
