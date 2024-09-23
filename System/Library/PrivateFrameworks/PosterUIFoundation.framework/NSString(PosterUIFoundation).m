@implementation NSString(PosterUIFoundation)

- (uint64_t)pui_isSuitableForVerticalLayout
{
  return CTStringIsSuitableForVerticalLayout();
}

@end
