@implementation PLGrabberView

- (double)weighting
{
  double result;

  -[PLGrabberView _configureMaterialViewIfNecessary](self, "_configureMaterialViewIfNecessary");
  -[MTMaterialView weighting](self->_materialView, "weighting");
  return result;
}

- (void)setWeighting:(double)a3
{
  double v5;

  -[PLGrabberView weighting](self, "weighting");
  if (v5 != a3)
    -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", a3);
}

- (PLGrabberView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  PLGrabberView *v12;
  PLGrabberView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    -[PLGrabberView intrinsicContentSize](self, "intrinsicContentSize");
    BSRectWithSize();
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v15.receiver = self;
  v15.super_class = (Class)PLGrabberView;
  v12 = -[PLGrabberView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
    -[PLGrabberView setWeighting:](v12, "setWeighting:", 1.0);
  return v13;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[PLGrabberView _defaultContainerSize](self, "_defaultContainerSize");
  -[PLGrabberView _intrinsicContentSizeWithContainerSize:](self, "_intrinsicContentSizeWithContainerSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  MTMaterialView *materialView;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)PLGrabberView;
  -[PLGrabberView layoutSubviews](&v4, sel_layoutSubviews);
  -[PLGrabberView _configureMaterialViewIfNecessary](self, "_configureMaterialViewIfNecessary");
  materialView = self->_materialView;
  -[PLGrabberView bounds](self, "bounds");
  -[MTMaterialView _setContinuousCornerRadius:](materialView, "_setContinuousCornerRadius:", CGRectGetHeight(v5) * 0.5);
}

- (CGSize)_defaultContainerSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[PLGrabberView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_intrinsicContentSizeWithContainerSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = round(a3.width * 0.11971831);
  v4 = 10.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_configureMaterialViewIfNecessary
{
  void *v3;
  void *v4;
  MTMaterialView *v5;
  MTMaterialView *materialView;
  MTMaterialView *v7;

  if (!self->_materialView)
  {
    v3 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "materialViewWithRecipe:compatibleWithTraitCollection:", 19, v4);
    v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    materialView = self->_materialView;
    self->_materialView = v5;

    -[MTMaterialView setRecipeDynamic:](self->_materialView, "setRecipeDynamic:", 0);
    v7 = self->_materialView;
    -[PLGrabberView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v7, "setFrame:");
    -[PLGrabberView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_materialView, 0);
    -[MTMaterialView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
