@implementation _UIMirrorNinePatchView

- (_UIMirrorNinePatchView)initWithFrame:(CGRect)a3
{
  _UIMirrorNinePatchView *v3;
  _UIMirrorNinePatchView *v4;
  unint64_t i;
  UIImageView *v6;
  double v7;
  double v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIMirrorNinePatchView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    for (i = 0; i != 4; ++i)
    {
      v6 = objc_alloc_init(UIImageView);
      -[UIImageView setContentMode:](v6, "setContentMode:", 0);
      -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1);
      memset(&v11, 0, sizeof(v11));
      if ((i & 1) != 0)
        v7 = -1.0;
      else
        v7 = 1.0;
      if (i >= 2)
        v8 = -1.0;
      else
        v8 = 1.0;
      CGAffineTransformMakeScale(&v11, v7, v8);
      v10 = v11;
      -[UIView setTransform:](v6, "setTransform:", &v10);
      -[UIView addSubview:](v4, "addSubview:", v6);
      v4->_imageViews[i] = v6;

    }
  }
  return v4;
}

- (void)setImage:(id)a3 withResizableCornerSize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  height = a4.height;
  width = a4.width;
  objc_storeStrong((id *)&self->_originalImage, a3);
  v8 = a3;
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  self->_insets.top = v12 - height;
  self->_insets.left = v10 - width;
  self->_insets.bottom = 0.0;
  self->_insets.right = 0.0;
  -[_UIMirrorNinePatchView _updateResizableImageAndViews](self, "_updateResizableImageAndViews");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  id *p_isa;
  double v3;
  double v4;
  double v5;
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
  double v20;

  p_isa = (id *)&self->super.super.super.isa;
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  *(float *)&v5 = v5 * 0.5;
  v9 = floorf(*(float *)&v5);
  *(float *)&v3 = v7 * 0.5;
  v10 = floorf(*(float *)&v3);
  v19 = v4 + 0.0;
  v20 = v11;
  v12 = v11 + 0.0;
  v18 = v6 - (v9 + 0.0);
  v13 = v7 - (v10 + 0.0);
  p_isa += 57;
  objc_msgSend(*p_isa, "setFrame:");
  v14 = v4 + v6 - v9;
  v15 = v6 - (v6 - v9 + 0.0);
  objc_msgSend(p_isa[1], "setFrame:", v14, v12, v15, v13);
  v16 = v20 + v8 - v10;
  v17 = v8 - (v8 - v10 + 0.0);
  objc_msgSend(p_isa[2], "setFrame:", v19, v16, v18, v17);
  objc_msgSend(p_isa[3], "setFrame:", v14, v16, v15, v17);
}

- (void)_updateResizableImageAndViews
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *originalImage;
  void *v7;
  uint64_t v8;
  UIImageView **imageViews;
  UIImage *v10;

  -[UIImage imageAsset](self->_originalImage, "imageAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTraitCollection:", v4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  originalImage = v5;
  if (!v5)
    originalImage = self->_originalImage;
  v10 = originalImage;

  -[UIImage resizableImageWithCapInsets:](v10, "resizableImageWithCapInsets:", self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  imageViews = self->_imageViews;
  do
    -[UIImageView setImage:](imageViews[v8++], "setImage:", v7);
  while (v8 != 4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImage, 0);
}

@end
