@implementation UITraitCollection

- (int64_t)be_contentSupportInterfaceLevel
{
  return BEContentSupportInterfaceLevelForUIUserInterfaceLevel(-[UITraitCollection userInterfaceLevel](self, "userInterfaceLevel"));
}

@end
