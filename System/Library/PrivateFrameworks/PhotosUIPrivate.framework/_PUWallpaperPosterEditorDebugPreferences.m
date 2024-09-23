@implementation _PUWallpaperPosterEditorDebugPreferences

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (void)setTimeFont:(id)a3
{
  objc_storeStrong((id *)&self->_timeFont, a3);
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeColor, a3);
}

- (UIColor)statusBarTintColor
{
  return self->_statusBarTintColor;
}

- (void)setStatusBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarTintColor, a3);
}

- (NSString)currentLookName
{
  return self->_currentLookName;
}

- (void)setCurrentLookName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)currentLookIndex
{
  return self->_currentLookIndex;
}

- (void)setCurrentLookIndex:(unint64_t)a3
{
  self->_currentLookIndex = a3;
}

- (unint64_t)numberOfLooks
{
  return self->_numberOfLooks;
}

- (void)setNumberOfLooks:(unint64_t)a3
{
  self->_numberOfLooks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLookName, 0);
  objc_storeStrong((id *)&self->_statusBarTintColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

@end
