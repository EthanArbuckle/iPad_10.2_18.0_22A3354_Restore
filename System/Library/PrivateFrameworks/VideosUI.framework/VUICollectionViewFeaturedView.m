@implementation VUICollectionViewFeaturedView

- (VUICollectionViewFeaturedView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUICollectionViewFeaturedView;
  return -[VUICollectionViewFeaturedView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUICollectionViewFeaturedView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_imageView);
  if (self->_imageView != v5)
    objc_storeStrong((id *)&self->_imageView, a3);
  -[VUICollectionViewFeaturedView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setOverlayView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUICollectionViewFeaturedView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_overlayView);
  if (self->_overlayView != v5)
    objc_storeStrong((id *)&self->_overlayView, a3);
  -[VUICollectionViewFeaturedView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  v20.receiver = self;
  v20.super_class = (Class)VUICollectionViewFeaturedView;
  -[VUICollectionViewFeaturedView vui_layoutSubviews:computationOnly:](&v20, sel_vui_layoutSubviews_computationOnly_, a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  if (!a4)
  {
    -[VUICollectionViewFeaturedView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView setFrame:](self->_imageView, "setFrame:");
    -[UIView setFrame:](self->_overlayView, "setFrame:", v11, v13, v15, v17);
    if (self->_overlayView)
      -[VUICollectionViewFeaturedView vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:");
  }
  v18 = v7;
  v19 = v9;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
