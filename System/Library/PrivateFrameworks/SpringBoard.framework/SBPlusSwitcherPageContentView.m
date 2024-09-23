@implementation SBPlusSwitcherPageContentView

- (SBPlusSwitcherPageContentView)initWithFrame:(CGRect)a3
{
  SBPlusSwitcherPageContentView *v3;
  uint64_t v4;
  MTMaterialView *materialView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *plusImageView;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBPlusSwitcherPageContentView;
  v3 = -[SBPlusSwitcherPageContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:", 53, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    materialView = v3->_materialView;
    v3->_materialView = (MTMaterialView *)v4;

    -[SBPlusSwitcherPageContentView addSubview:](v3, "addSubview:", v3->_materialView);
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 3, 34.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("plus"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithImage:", v9);
    plusImageView = v3->_plusImageView;
    v3->_plusImageView = (UIImageView *)v10;

    -[MTMaterialView visualStylingProviderForCategory:](v3->_materialView, "visualStylingProviderForCategory:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "automaticallyUpdateView:withStyle:", v3->_plusImageView, 1);

    -[SBPlusSwitcherPageContentView addSubview:](v3, "addSubview:", v3->_plusImageView);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPlusSwitcherPageContentView setBackgroundColor:](v3, "setBackgroundColor:", v13);

  }
  return v3;
}

- (void)layoutSubviews
{
  MTMaterialView *materialView;
  UIImageView *plusImageView;
  UIImageView *v5;
  CGAffineTransform v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPlusSwitcherPageContentView;
  -[SBPlusSwitcherPageContentView layoutSubviews](&v7, sel_layoutSubviews);
  materialView = self->_materialView;
  -[SBPlusSwitcherPageContentView bounds](self, "bounds");
  -[MTMaterialView setFrame:](materialView, "setFrame:");
  -[UIImageView sizeToFit](self->_plusImageView, "sizeToFit");
  plusImageView = self->_plusImageView;
  -[SBPlusSwitcherPageContentView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIImageView setCenter:](plusImageView, "setCenter:");
  v5 = self->_plusImageView;
  CGAffineTransformMakeScale(&v6, 10.0, 10.0);
  -[UIImageView setTransform:](v5, "setTransform:", &v6);
}

- (void)setCornerRadius:(double)a3
{
  -[MTMaterialView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:", a3);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4;

  -[MTMaterialView layer](self->_materialView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (unint64_t)maskedCorners
{
  void *v2;
  unint64_t v3;

  -[MTMaterialView layer](self->_materialView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (double)cornerRadius
{
  return self->cornerRadius;
}

- (int64_t)orientation
{
  return self->orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->orientation = a3;
}

- (BOOL)contentRequiresGroupOpacity
{
  return self->contentRequiresGroupOpacity;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isVisible
{
  return self->visible;
}

- (void)setVisible:(BOOL)a3
{
  self->visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
