@implementation SearchUIResolvedBackgroundColoring

- (NSArray)tintedUIColors
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTintedUIColors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)originalUIColors
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOriginalUIColors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TLKAppearance)bestForegroundAppearanceForBackgroundColors
{
  return (TLKAppearance *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBestForegroundAppearanceForBackgroundColors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SearchUIColorRequest)colorRequest
{
  return (SearchUIColorRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setColorRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)preferKeylineForShadowBasedViews
{
  return self->_preferKeylineForShadowBasedViews;
}

- (void)setPreferKeylineForShadowBasedViews:(BOOL)a3
{
  self->_preferKeylineForShadowBasedViews = a3;
}

- (int)tintStyle
{
  return self->_tintStyle;
}

- (void)setTintStyle:(int)a3
{
  self->_tintStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorRequest, 0);
  objc_storeStrong((id *)&self->_bestForegroundAppearanceForBackgroundColors, 0);
  objc_storeStrong((id *)&self->_originalUIColors, 0);
  objc_storeStrong((id *)&self->_tintedUIColors, 0);
}

@end
