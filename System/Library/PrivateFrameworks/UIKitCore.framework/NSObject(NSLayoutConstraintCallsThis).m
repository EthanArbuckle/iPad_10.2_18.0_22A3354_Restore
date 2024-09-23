@implementation NSObject(NSLayoutConstraintCallsThis)

- (NSString)className
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
