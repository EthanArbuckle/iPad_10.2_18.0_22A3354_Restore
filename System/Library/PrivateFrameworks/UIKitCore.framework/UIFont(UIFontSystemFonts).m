@implementation UIFont(UIFontSystemFonts)

+ (uint64_t)defaultFontSize
{
  return objc_msgSend(off_1E167A828, "labelFontSize");
}

+ (uint64_t)systemMinimumFontSize
{
  return objc_msgSend(off_1E167A828, "systemFontSize");
}

@end
