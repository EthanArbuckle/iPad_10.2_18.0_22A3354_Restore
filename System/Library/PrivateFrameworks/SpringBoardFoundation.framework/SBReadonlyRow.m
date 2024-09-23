@implementation SBReadonlyRow

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

@end
