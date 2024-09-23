@implementation _UITabBarVisualProvider

- (id)defaultTintColor
{
  return 0;
}

- (double)defaultAnimationDuration
{
  return 0.2;
}

- (id)_shim_shadowView
{
  return 0;
}

- (_UITabBarVisualProvider)initWithTabBar:(id)a3
{
  _UITabBarVisualProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarVisualProvider;
  result = -[_UITabBarVisualProvider init](&v5, sel_init);
  if (result)
    result->_tabBar = (UITabBar *)a3;
  return result;
}

- (void)teardown
{
  self->_tabBar = 0;
}

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
  -[_UITabBarVisualProvider changeItemsTo:removingItems:selectedItem:animate:](self, "changeItemsTo:removingItems:selectedItem:animate:", a3, a4, a5, a7);
}

- (id)exchangeItem:(id)a3 withItem:(id)a4
{
  return -[UITabBar items](self->_tabBar, "items", a3, a4);
}

- (double)backgroundTransitionProgress
{
  return 0.0;
}

- (BOOL)useModernAppearance
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (double)minimumWidthForHorizontalLayout
{
  return 0.0;
}

- (id)createViewForTabBarItem:(id)a3
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  return a4;
}

- (BOOL)wantsFocus
{
  return 0;
}

- (id)preferredFocusedView
{
  return 0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (id)_shim_compatibilityBackgroundView
{
  return 0;
}

- (id)_shim_accessoryView
{
  return 0;
}

- (double)_shim_shadowAlpha
{
  return 1.0;
}

- (BOOL)_shim_shadowHidden
{
  return 0;
}

- (double)_shim_heightForCustomizingItems
{
  double v2;

  -[UIView bounds](self->_tabBar, "bounds");
  return v2;
}

@end
