@implementation UIImageSymbolConfiguration(SBUISystemApertureStyling)

+ (uint64_t)sbui_systemApertureDefaultConfiguration
{
  return objc_msgSend(a1, "configurationWithPointSize:weight:scale:", 4, -1, 32.0);
}

+ (uint64_t)sbui_systemApertureControlConfiguration
{
  return objc_msgSend(a1, "configurationWithPointSize:weight:scale:", 6, 3, 19.0);
}

@end
