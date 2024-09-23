@implementation _PBFImageView

- (_PBFImageView)init
{
  char *v2;
  _PBFImageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PBFImageView;
  v2 = -[_PBFImageView init](&v5, sel_init);
  v3 = (_PBFImageView *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 424) = *MEMORY[0x1E0C9D820];
    objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (BOOL)updateImage:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  UIImageView *imageView;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v15;
  id v16;
  UIImageView *v17;
  UIImageView *v18;
  UIImageView *v19;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC3890]);
    BSRectWithSize();
    v17 = (UIImageView *)objc_msgSend(v16, "initWithFrame:");
    v18 = self->_imageView;
    self->_imageView = v17;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    -[_PBFImageView addSubview:](self, "addSubview:", self->_imageView);
LABEL_12:
    -[_PBFImageView setNeedsLayout](self, "setNeedsLayout");
    -[_PBFImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v15 = 1;
    goto LABEL_13;
  }
  -[UIImageView image](imageView, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v7))
  {

LABEL_11:
    -[UIImageView setImage:](self->_imageView, "setImage:", v7);
    v19 = self->_imageView;
    -[UIImageView frame](v19, "frame");
    -[UIImageView setFrame:](v19, "setFrame:");
    self->_imageSize.width = width;
    self->_imageSize.height = height;
    goto LABEL_12;
  }
  -[UIImageView frame](self->_imageView, "frame");
  v11 = v10;
  v13 = v12;

  if (v11 != width || v13 != height)
    goto LABEL_11;
  v15 = 0;
LABEL_13:

  return v15;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *imageView;
  UIImageView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PBFImageView;
  -[_PBFImageView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIImageView frame](self->_imageView, "frame");
  if (v4 != self->_imageSize.width || v3 != self->_imageSize.height)
  {
    imageView = self->_imageView;
    -[UIImageView frame](imageView, "frame");
    -[UIImageView setFrame:](imageView, "setFrame:");
  }
  v7 = self->_imageView;
  -[_PBFImageView center](self, "center");
  -[UIImageView setCenter:](v7, "setCenter:");
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
