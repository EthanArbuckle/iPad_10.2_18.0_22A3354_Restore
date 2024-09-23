@implementation _UIApplicationInfo(SplashBoard)

- (uint64_t)xb_userInterfaceStyleForRequestedUserInterfaceStyle:()SplashBoard
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(a1, "supportedUserInterfaceStyle");
  if (result == 1)
    v5 = 1;
  else
    v5 = a3;
  if (result != 2)
    return v5;
  return result;
}

- (BOOL)xb_supportsUserInterfaceStyle:()SplashBoard
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "supportedUserInterfaceStyle");
  return v4 == a3 || v4 == 0;
}

@end
