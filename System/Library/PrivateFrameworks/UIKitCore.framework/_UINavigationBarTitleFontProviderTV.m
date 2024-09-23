@implementation _UINavigationBarTitleFontProviderTV

- (id)defaultTitleFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedTitle2"));
}

- (id)defaultInlineTitleFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedTitle2"));
}

@end
