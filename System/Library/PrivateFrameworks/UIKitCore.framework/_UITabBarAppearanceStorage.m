@implementation _UITabBarAppearanceStorage

- (UIColor)unselectedImageTintColor
{
  return self->_unselectedImageTintColor;
}

- (UIImage)backgroundImage
{
  return self->backgroundImage;
}

- (UIImage)selectionIndicatorImage
{
  return self->selectionIndicatorImage;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (UIColor)selectedImageTintColor
{
  return self->selectedImageTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->barTintColor, a3);
}

- (UIImage)shadowImage
{
  return self->shadowImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->backgroundImage, a3);
}

- (void)setTabItemAppearanceStorage:(id)a3
{
  objc_storeStrong((id *)&self->tabItemAppearanceStorage, a3);
}

- (_UITabBarItemAppearanceStorage)tabItemAppearanceStorage
{
  _UITabBarItemAppearanceStorage *tabItemAppearanceStorage;
  _UITabBarItemAppearanceStorage *v4;
  _UITabBarItemAppearanceStorage *v5;

  tabItemAppearanceStorage = self->tabItemAppearanceStorage;
  if (!tabItemAppearanceStorage)
  {
    v4 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    v5 = self->tabItemAppearanceStorage;
    self->tabItemAppearanceStorage = v4;

    tabItemAppearanceStorage = self->tabItemAppearanceStorage;
  }
  return tabItemAppearanceStorage;
}

- (id)_tabItemAppearanceStorage
{
  return self->tabItemAppearanceStorage;
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->shadowImage, a3);
}

- (void)setSelectionIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->selectionIndicatorImage, a3);
}

- (void)setSelectedImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->selectedImageTintColor, a3);
}

- (void)setUnselectedImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedImageTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedImageTintColor, 0);
  objc_storeStrong((id *)&self->tabItemAppearanceStorage, 0);
  objc_storeStrong((id *)&self->selectedImageTintColor, 0);
  objc_storeStrong((id *)&self->barTintColor, 0);
  objc_storeStrong((id *)&self->selectionIndicatorImage, 0);
  objc_storeStrong((id *)&self->shadowImage, 0);
  objc_storeStrong((id *)&self->backgroundImage, 0);
}

@end
