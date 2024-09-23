@implementation SHCustomBackgroundCompatiblePalette

- (CGColor)listeningButtonBackgroundColor
{
  return +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", CFSTR("customBackgroundListeningButtonBackgroundColor"));
}

- (CGColor)listeningCircleColor
{
  return +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", CFSTR("customBackgroundListeningCircleColor"));
}

- (CGColor)listeningButtonBackgroundTransparentColor
{
  return +[SHPalette sh_colorNamed:](SHPalette, "sh_colorNamed:", CFSTR("customBackgroundListeningButtonBackgroundTransparentColor"));
}

@end
