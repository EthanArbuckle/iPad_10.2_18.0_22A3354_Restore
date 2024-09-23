@implementation SKUITabBarBackgroundView

- (SKUITabBarBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUITabBarBackgroundView *v8;
  SKUITabBarBackgroundView *v9;
  uint64_t v10;
  _UIBackdropView *backdropView;
  UIView *v12;
  UIView *borderView;
  UIView *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITabBarBackgroundView initWithFrame:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITabBarBackgroundView;
  v8 = -[SKUITabBarBackgroundView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUITabBarBackgroundView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[SKUITabBarBackgroundView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 10060);
    backdropView = v9->_backdropView;
    v9->_backdropView = (_UIBackdropView *)v10;

    -[SKUITabBarBackgroundView addSubview:](v9, "addSubview:", v9->_backdropView);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v9->_borderView;
    v9->_borderView = v12;

    v14 = v9->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[SKUITabBarBackgroundView addSubview:](v9, "addSubview:", v9->_borderView);
  }
  return v9;
}

- (NSString)backdropGroupName
{
  return (NSString *)-[_UIBackdropView groupName](self->_backdropView, "groupName");
}

- (void)setBackdropGroupName:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[SKUITabBarBackgroundView backdropGroupName](self, "backdropGroupName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:", v5);

}

- (void)setBackdropStyle:(int64_t)a3
{
  UIView *borderView;
  void *v6;

  borderView = self->_borderView;
  if (a3 == 11050)
    objc_msgSend(MEMORY[0x1E0DC3658], "_barStyleBlackHairlineShadowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v6);

  -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarBackgroundView;
  -[SKUITabBarBackgroundView layoutSubviews](&v8, sel_layoutSubviews);
  -[SKUITabBarBackgroundView bounds](self, "bounds");
  v4 = v3;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  -[UIView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, v4, v7);
}

- (id)_currentCustomBackground
{
  return 0;
}

- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3
{
  return 0;
}

- (_UINavigationBarAppearanceStorage)appearanceStorage
{
  return self->appearanceStorage;
}

- (void)setAppearanceStorage:(id)a3
{
  objc_storeStrong((id *)&self->appearanceStorage, a3);
}

- (int64_t)barStyle
{
  return self->barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->barStyle = a3;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->barTintColor, a3);
}

- (BOOL)barWantsAdaptiveBackdrop
{
  return self->barWantsAdaptiveBackdrop;
}

- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3
{
  self->barWantsAdaptiveBackdrop = a3;
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (BOOL)isTranslucent
{
  return self->translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->translucent = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->barTintColor, 0);
  objc_storeStrong((id *)&self->appearanceStorage, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITabBarBackgroundView initWithFrame:]";
}

@end
