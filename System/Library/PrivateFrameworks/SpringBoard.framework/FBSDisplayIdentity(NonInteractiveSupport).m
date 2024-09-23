@implementation FBSDisplayIdentity(NonInteractiveSupport)

- (uint64_t)sb_physicalDisplaySupportingNonInteractiveDisplayMode
{
  uint64_t result;

  result = objc_msgSend(a1, "isRootIdentity");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "isAirPlayDisplay") & 1) != 0
      || (objc_msgSend(a1, "isRestrictedAirPlayDisplay") & 1) != 0
      || (objc_msgSend(a1, "isiPodOnlyDisplay") & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(a1, "isMusicOnlyDisplay");
    }
  }
  return result;
}

@end
