@implementation WKWebpagePreferences(SafariSharedUIExtras)

- (uint64_t)safari_areAdvancedPrivacyProtectionsEnabled
{
  return objc_msgSend(a1, "_networkConnectionIntegrityPolicy") & 1;
}

- (uint64_t)safari_setAdvancedPrivacyProtectionsEnabled:()SafariSharedUIExtras privateBrowsing:
{
  uint64_t v4;
  uint64_t v5;

  v4 = 321;
  if (a4)
    v4 = 449;
  if (a3)
    v5 = v4;
  else
    v5 = 0;
  return objc_msgSend(a1, "_setNetworkConnectionIntegrityPolicy:", v5);
}

@end
