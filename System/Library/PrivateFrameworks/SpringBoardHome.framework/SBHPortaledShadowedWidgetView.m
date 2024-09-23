@implementation SBHPortaledShadowedWidgetView

- (SBHPortaledShadowedWidgetView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHPortaledShadowedWidgetView;
  return -[SBHShadowedWidgetView initWithContentView:shadowView:perspectiveEnabled:](&v6, sel_initWithContentView_shadowView_perspectiveEnabled_, a3, a4, a5);
}

- (void)setHidesSourceViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBHShadowedWidgetView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesSourceView:", v3);

  -[SBHShadowedWidgetView shadowView](self, "shadowView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesSourceView:", v3);

}

- (BOOL)hidesSourceViews
{
  void *v2;
  char v3;

  -[SBHShadowedWidgetView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesSourceView");

  return v3;
}

@end
