@implementation NSString(PRUtilities)

- (uint64_t)pr_isSuitableForVerticalLayout
{
  return CTStringIsSuitableForVerticalLayout();
}

@end
