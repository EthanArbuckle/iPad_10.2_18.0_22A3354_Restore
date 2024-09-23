@implementation THThemeProvider

- (THThemeProvider)init
{
  THThemeProvider *v2;
  CGColorSpace *DeviceRGB;
  objc_super v5;
  CGFloat v6[2];
  __int128 v7;
  CGFloat components[2];
  __int128 v9;

  v5.receiver = self;
  v5.super_class = (Class)THThemeProvider;
  v2 = -[THThemeProvider init](&v5, "init");
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_314A60;
    v9 = unk_314A70;
    v2->_backgroundColor = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v6 = xmmword_314A80;
    v7 = unk_314A90;
    v2->_textColor = CGColorCreate(DeviceRGB, v6);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_textColor);
  v3.receiver = self;
  v3.super_class = (Class)THThemeProvider;
  -[THThemeProvider dealloc](&v3, "dealloc");
}

- (BOOL)forceThemeColors
{
  return 0;
}

- (BOOL)shouldInvertContent
{
  return 0;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)annotationPageTheme
{
  return 4;
}

- (int)annotationBlendMode
{
  return 0;
}

@end
