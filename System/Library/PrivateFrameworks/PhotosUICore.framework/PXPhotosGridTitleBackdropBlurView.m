@implementation PXPhotosGridTitleBackdropBlurView

- (PXPhotosGridTitleBackdropBlurView)initWithFrame:(CGRect)a3
{
  PXPhotosGridTitleBackdropBlurView *v3;
  void *v4;
  uint64_t v5;
  UIVisualEffectView *visualEffectView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosGridTitleBackdropBlurView;
  v3 = -[PXPhotosGridTitleBackdropBlurView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v5;

    -[PXPhotosGridTitleBackdropBlurView addSubview:](v3, "addSubview:", v3->_visualEffectView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  -[PXPhotosGridTitleBackdropBlurView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridTitleBackdropBlurView;
  -[PXPhotosGridTitleBackdropBlurView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setUserData:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *userData;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      userData = self->_userData;
      self->_userData = v6;

      -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", self->_userData);
    }
  }

}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (NSString)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
