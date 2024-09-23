@implementation UIColor(SBUISystemApertureStyling)

+ (uint64_t)sbui_inactiveColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.368627451, 1.0);
}

@end
