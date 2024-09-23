@implementation UIApplicationHasAppLinkEntitlements

uint64_t ___UIApplicationHasAppLinkEntitlements_block_invoke()
{
  uint64_t result;

  result = UISelfTaskHasEntitlement(CFSTR("com.apple.private.canGetAppLinkInfo"));
  if ((_DWORD)result)
    result = UISelfTaskHasEntitlement(CFSTR("com.apple.private.canModifyAppLinkPermissions"));
  _MergedGlobals_1277 = result;
  return result;
}

@end
