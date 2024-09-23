@implementation _UIToolbarAppearanceStorage

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

+ (int64_t)typicalBarPosition
{
  return 1;
}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (void)setHidesShadow:(BOOL)a3
{
  self->_hidesShadow = a3;
}

- (UIImage)backgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 0);
}

- (UIImage)miniBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 1);
}

- (UIImage)topBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 2, 0);
}

- (UIImage)miniTopBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 2, 1);
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (void)setMiniBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_miniBackgroundImage, a3);
}

- (void)setTopBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_topBackgroundImage, a3);
}

- (void)setMiniTopBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_miniTopBackgroundImage, a3);
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImage, a3);
}

- (UIImage)topShadowImage
{
  return self->_topShadowImage;
}

- (void)setTopShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_topShadowImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topShadowImage, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_miniTopBackgroundImage, 0);
  objc_storeStrong((id *)&self->_topBackgroundImage, 0);
  objc_storeStrong((id *)&self->_miniBackgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end
