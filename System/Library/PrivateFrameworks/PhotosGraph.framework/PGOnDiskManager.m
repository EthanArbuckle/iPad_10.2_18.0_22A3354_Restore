@implementation PGOnDiskManager

+ (Class)graphClass
{
  return (Class)objc_opt_class();
}

- (BOOL)requiresReadOnly
{
  return 1;
}

@end
