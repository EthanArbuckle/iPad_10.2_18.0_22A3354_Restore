@implementation CIColor(UIKitAdditions)

- (uint64_t)initWithColor:()UIKitAdditions
{
  return objc_msgSend(a1, "initWithCGColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

@end
