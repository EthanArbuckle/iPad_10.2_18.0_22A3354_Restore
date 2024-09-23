@implementation SFImageContext

- (double)uiScale
{
  return self->_uiScale;
}

- (void)setUiScale:(double)a3
{
  self->_uiScale = a3;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  self->_hasDarkAppearance = a3;
}

- (BOOL)ignoreImageDataCache
{
  return self->_ignoreImageDataCache;
}

- (void)setIgnoreImageDataCache:(BOOL)a3
{
  self->_ignoreImageDataCache = a3;
}

@end
