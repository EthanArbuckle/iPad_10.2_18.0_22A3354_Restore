@implementation THiOSThemeProvider

- (void)updateWithTheme:(id)a3 traitCollection:(id)a4
{
  id v7;
  id v8;
  id v9;

  -[THiOSThemeProvider setThemeIdentifier:](self, "setThemeIdentifier:", objc_msgSend(a3, "themeIdentifier"));
  v7 = objc_msgSend(a3, "themeIdentifier");
  if ((objc_msgSend(v7, "isEqualToString:", kIMThemeIdentifierGrayPageTheme) & 1) != 0)
  {
    v8 = &dword_0 + 1;
  }
  else
  {
    v9 = objc_msgSend(a3, "themeIdentifier");
    v8 = objc_msgSend(v9, "isEqualToString:", kIMThemeIdentifierNightPageTheme);
  }
  -[THiOSThemeProvider setForceThemeColors:](self, "setForceThemeColors:", v8);
  -[THiOSThemeProvider setShouldInvertContent:](self, "setShouldInvertContent:", objc_msgSend(a3, "shouldInvertContent"));
  -[THiOSThemeProvider setUiBackgroundColor:](self, "setUiBackgroundColor:", objc_msgSend(a3, "backgroundColorForTraitCollection:", a4));
  -[THiOSThemeProvider setUiTextColor:](self, "setUiTextColor:", objc_msgSend(objc_msgSend(a3, "contentTextColor"), "resolvedColorWithTraitCollection:", a4));
  -[THiOSThemeProvider setAnnotationPageTheme:](self, "setAnnotationPageTheme:", objc_msgSend(a3, "annotationPageTheme"));
  -[THiOSThemeProvider setAnnotationBlendMode:](self, "setAnnotationBlendMode:", objc_msgSend(a3, "annotationBlendMode"));
  -[THiOSThemeProvider setUserInterfaceStyle:](self, "setUserInterfaceStyle:", objc_msgSend(a3, "userInterfaceStyle"));
}

- (void)dealloc
{
  objc_super v3;

  self->_themeIdentifier = 0;
  self->_uiBackgroundColor = 0;

  self->_uiTextColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSThemeProvider;
  -[THThemeProvider dealloc](&v3, "dealloc");
}

- (CGColor)backgroundColor
{
  return -[UIColor CGColor](-[THiOSThemeProvider uiBackgroundColor](self, "uiBackgroundColor"), "CGColor");
}

- (CGColor)textColor
{
  return -[UIColor CGColor](-[THiOSThemeProvider uiTextColor](self, "uiTextColor"), "CGColor");
}

- (NSString)themeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setThemeIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)forceThemeColors
{
  return self->_forceThemeColors;
}

- (void)setForceThemeColors:(BOOL)a3
{
  self->_forceThemeColors = a3;
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (UIColor)uiBackgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUiBackgroundColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UIColor)uiTextColor
{
  return (UIColor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUiTextColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)annotationPageTheme
{
  return self->_annotationPageTheme;
}

- (void)setAnnotationPageTheme:(int64_t)a3
{
  self->_annotationPageTheme = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

@end
