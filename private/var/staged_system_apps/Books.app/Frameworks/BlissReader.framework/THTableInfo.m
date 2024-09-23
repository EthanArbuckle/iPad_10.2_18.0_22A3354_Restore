@implementation THTableInfo

- (Class)repClass
{
  return (Class)objc_opt_class(THTableRep, a2);
}

@end
