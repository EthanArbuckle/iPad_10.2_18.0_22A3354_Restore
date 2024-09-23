@implementation PXShadowView

- (PXShadowView)initWithFrame:(CGRect)a3
{
  PXShadowView *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXShadowView;
  v3 = -[PXShadowView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[PXShadowView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)setCastingFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_castingFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_castingFrame = &self->_castingFrame;
  if (!CGRectEqualToRect(self->_castingFrame, a3))
  {
    p_castingFrame->origin.x = x;
    p_castingFrame->origin.y = y;
    p_castingFrame->size.width = width;
    p_castingFrame->size.height = height;
    -[PXShadowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShadow:(id)a3
{
  NSShadow *v4;
  char v5;
  NSShadow *v6;
  NSShadow *shadow;
  NSShadow *v8;

  v8 = (NSShadow *)a3;
  v4 = self->_shadow;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSShadow isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSShadow *)-[NSShadow copy](v8, "copy");
      shadow = self->_shadow;
      self->_shadow = v6;

      -[PXShadowView _invalidateResizableShadowImage](self, "_invalidateResizableShadowImage");
    }
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXShadowView _invalidateResizableShadowImage](self, "_invalidateResizableShadowImage");
  }
}

- (void)_invalidateResizableShadowImage
{
  self->_resizableShadowImageNeedsUpdate = 1;
  -[PXShadowView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  UIImage *v10;
  UIImage *resizableShadowImage;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXShadowView;
  -[PXShadowView layoutSubviews](&v16, sel_layoutSubviews);
  -[PXShadowView shadow](self, "shadow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resizableShadowImageNeedsUpdate)
  {
    +[PXShadowImageCache sharedInstance](PXShadowImageCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXShadowView cornerRadius](self, "cornerRadius");
    v6 = v5;
    -[PXShadowView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v4, "stretchableShadowImageFor:cornerRadius:screenScale:", v3, v6, v9);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    resizableShadowImage = self->_resizableShadowImage;
    self->_resizableShadowImage = v10;

    self->_resizableShadowImageNeedsUpdate = 0;
  }
  -[UIImageView setImage:](self->_imageView, "setImage:", self->_resizableShadowImage);
  if (v3)
  {
    -[PXShadowView castingFrame](self, "castingFrame");
    -[UIImageView setFrame:](self->_imageView, "setFrame:", PXGResizableShadowImageFrameForCastingFrame(v3, v12, v13, v14, v15));
  }

}

- (CGRect)castingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_castingFrame.origin.x;
  y = self->_castingFrame.origin.y;
  width = self->_castingFrame.size.width;
  height = self->_castingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_resizableShadowImage, 0);
}

@end
