@implementation _UIEditMenuPlatformMetrics

- (_UIEditMenuPlatformMetrics)init
{
  _UIEditMenuPlatformMetrics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIEditMenuPlatformMetrics;
  v2 = -[_UIEditMenuPlatformMetrics init](&v14, sel_init);
  if (v2)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setMenuBackgroundEffect:](v2, "setMenuBackgroundEffect:", v3);
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v3, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setMenuHighlightBackgroundEffect:](v2, "setMenuHighlightBackgroundEffect:", v4);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setMenuHighlightBackgroundColor:](v2, "setMenuHighlightBackgroundColor:", v5);

    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v3, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setSeparatorEffect:](v2, "setSeparatorEffect:", v6);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setSeparatorEffectColor:](v2, "setSeparatorEffectColor:", v7);

    -[_UIEditMenuPlatformMetrics setShowsSeparatorBetweenItems:](v2, "setShowsSeparatorBetweenItems:", 1);
    -[_UIEditMenuPlatformMetrics setOverrideUserInterfaceStyle:](v2, "setOverrideUserInterfaceStyle:", 0);
    -[_UIEditMenuPlatformMetrics setShadowRadius:](v2, "setShadowRadius:", 12.0);
    -[_UIEditMenuPlatformMetrics setShadowOpacity:](v2, "setShadowOpacity:", 0.25);
    -[_UIEditMenuPlatformMetrics setShadowOffset:](v2, "setShadowOffset:", 0.0, 3.0);
    -[_UIEditMenuPlatformMetrics setHorizontalMenuMaximumWidth:](v2, "setHorizontalMenuMaximumWidth:", 768.0);
    -[_UIEditMenuPlatformMetrics setHorizontalMenuCornerRadius:](v2, "setHorizontalMenuCornerRadius:", 10.0);
    -[_UIEditMenuPlatformMetrics setVerticalMenuMaximumHeight:](v2, "setVerticalMenuMaximumHeight:", 1.79769313e308);
    -[_UIEditMenuPlatformMetrics setVerticalMenuCornerRadius:](v2, "setVerticalMenuCornerRadius:", 13.0);
    -[_UIEditMenuPlatformMetrics setArrowSize:](v2, "setArrowSize:", 16.0, 8.0);
    -[_UIEditMenuPlatformMetrics setArrowSideRadius:](v2, "setArrowSideRadius:", 3.0);
    -[_UIEditMenuPlatformMetrics setArrowTipRadius:](v2, "setArrowTipRadius:", 2.0);
    -[_UIEditMenuPlatformMetrics setMenuItemMargins:](v2, "setMenuItemMargins:", 11.0, 16.0, 11.0, 16.0);
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setDestructiveColor:](v2, "setDestructiveColor:", v8);

    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor labelColor](UIColor, "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBaseForegroundColor:", v11);

    objc_msgSend(v10, "setBackground:", v9);
    -[_UIEditMenuPlatformMetrics setPageButtonConfiguration:](v2, "setPageButtonConfiguration:", v10);
    +[UIShape rectShape](UIShape, "rectShape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPlatformMetrics setCellBackgroundShape:](v2, "setCellBackgroundShape:", v12);

  }
  return v2;
}

- (id)containerViewConfigurator
{
  return self->_containerViewConfigurator;
}

- (void)setContainerViewConfigurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)menuBackgroundConfigurator
{
  return self->_menuBackgroundConfigurator;
}

- (void)setMenuBackgroundConfigurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIVisualEffect)menuBackgroundEffect
{
  return self->_menuBackgroundEffect;
}

- (void)setMenuBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIVisualEffect)menuHighlightBackgroundEffect
{
  return self->_menuHighlightBackgroundEffect;
}

- (void)setMenuHighlightBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)menuHighlightBackgroundColor
{
  return self->_menuHighlightBackgroundColor;
}

- (void)setMenuHighlightBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void)setSeparatorEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)separatorEffectColor
{
  return self->_separatorEffectColor;
}

- (void)setSeparatorEffectColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)showsSeparatorBetweenItems
{
  return self->_showsSeparatorBetweenItems;
}

- (void)setShowsSeparatorBetweenItems:(BOOL)a3
{
  self->_showsSeparatorBetweenItems = a3;
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  self->_overrideUserInterfaceStyle = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)horizontalMenuMaximumWidth
{
  return self->_horizontalMenuMaximumWidth;
}

- (void)setHorizontalMenuMaximumWidth:(double)a3
{
  self->_horizontalMenuMaximumWidth = a3;
}

- (double)horizontalMenuCornerRadius
{
  return self->_horizontalMenuCornerRadius;
}

- (void)setHorizontalMenuCornerRadius:(double)a3
{
  self->_horizontalMenuCornerRadius = a3;
}

- (double)verticalMenuMaximumHeight
{
  return self->_verticalMenuMaximumHeight;
}

- (void)setVerticalMenuMaximumHeight:(double)a3
{
  self->_verticalMenuMaximumHeight = a3;
}

- (double)verticalMenuCornerRadius
{
  return self->_verticalMenuCornerRadius;
}

- (void)setVerticalMenuCornerRadius:(double)a3
{
  self->_verticalMenuCornerRadius = a3;
}

- (CGSize)arrowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_arrowSize.width;
  height = self->_arrowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArrowSize:(CGSize)a3
{
  self->_arrowSize = a3;
}

- (double)arrowSideRadius
{
  return self->_arrowSideRadius;
}

- (void)setArrowSideRadius:(double)a3
{
  self->_arrowSideRadius = a3;
}

- (double)arrowTipRadius
{
  return self->_arrowTipRadius;
}

- (void)setArrowTipRadius:(double)a3
{
  self->_arrowTipRadius = a3;
}

- (UIEdgeInsets)menuItemMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_menuItemMargins.top;
  left = self->_menuItemMargins.left;
  bottom = self->_menuItemMargins.bottom;
  right = self->_menuItemMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMenuItemMargins:(UIEdgeInsets)a3
{
  self->_menuItemMargins = a3;
}

- (UIShape)cellBackgroundShape
{
  return self->_cellBackgroundShape;
}

- (void)setCellBackgroundShape:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundShape, a3);
}

- (UIColor)destructiveColor
{
  return self->_destructiveColor;
}

- (void)setDestructiveColor:(id)a3
{
  objc_storeStrong((id *)&self->_destructiveColor, a3);
}

- (UIButtonConfiguration)pageButtonConfiguration
{
  return self->_pageButtonConfiguration;
}

- (void)setPageButtonConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_destructiveColor, 0);
  objc_storeStrong((id *)&self->_cellBackgroundShape, 0);
  objc_storeStrong((id *)&self->_separatorEffectColor, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_menuHighlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuHighlightBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_menuBackgroundEffect, 0);
  objc_storeStrong(&self->_menuBackgroundConfigurator, 0);
  objc_storeStrong(&self->_containerViewConfigurator, 0);
}

@end
