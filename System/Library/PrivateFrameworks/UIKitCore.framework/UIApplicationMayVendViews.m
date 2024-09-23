@implementation UIApplicationMayVendViews

uint64_t ___UIApplicationMayVendViews_block_invoke()
{
  uint64_t result;

  result = UISelfTaskHasEntitlement(CFSTR("com.apple.UIKit.vends-view-services"));
  byte_1EDDC7FFC = result;
  return result;
}

@end
