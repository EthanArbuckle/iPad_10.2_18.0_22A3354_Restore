@implementation BSUIScreenshotCell

- (BSUIScreenshotCell)initWithFrame:(CGRect)a3
{
  BSUIScreenshotCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BSUIScreenshotCell;
  v3 = -[BSUIScreenshotCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    objc_msgSend((id)objc_opt_class(v3), "borderWidth");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v3->_imageView, "layer"));
    objc_msgSend(v8, "setBorderWidth:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v3->_imageView, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 5.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v3->_imageView, "layer"));
    objc_msgSend(v10, "setMasksToBounds:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell contentView](v3, "contentView"));
    objc_msgSend(v11, "setAutoresizingMask:", 18);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell contentView](v3, "contentView"));
    objc_msgSend(v12, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BSUIScreenshotCell;
  -[BSUIScreenshotCell layoutSubviews](&v12, "layoutSubviews");
  -[BSUIScreenshotCell _imageRectWithScreenshot:](self, "_imageRectWithScreenshot:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell imageView](self, "imageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIScreenshotCell;
  -[BSUIScreenshotCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell imageView](self, "imageView"));
  objc_msgSend(v3, "setImage:", 0);

}

- (void)configureWithScreenshot:(id)a3 image:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v6 = a4;
  -[BSUIScreenshotCell _imageRectWithScreenshot:](self, "_imageRectWithScreenshot:", a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell imageView](self, "imageView"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell imageView](self, "imageView"));
  objc_msgSend(v16, "setImage:", v6);

}

- (CGRect)_imageRectWithScreenshot:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double Height;
  void *v16;
  double Width;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell imageView](self, "imageView"));
    objc_msgSend(v10, "bounds");
    v7 = v11;
    v9 = v12;

  }
  v13 = v7 / v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell contentView](self, "contentView"));
  objc_msgSend(v14, "bounds");
  Height = CGRectGetHeight(v26);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCell contentView](self, "contentView"));
  objc_msgSend(v16, "bounds");
  Width = CGRectGetWidth(v27);

  v18 = Width / Height <= v13;
  v19 = Width / v13;
  if (Width / Height > v13)
    v20 = v13 * Height;
  else
    v20 = Width;
  if (v18)
    v21 = v19;
  else
    v21 = Height;

  v22 = (Width - v20) * 0.5;
  v23 = (Height - v21) * 0.5;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (double)topMargin
{
  return 71.0;
}

+ (double)minimumLineSpacingWithRegularPad:(BOOL)a3
{
  double result;

  result = 15.0;
  if (a3)
    return 30.0;
  return result;
}

+ (double)bottomMarginWithRegularPad:(BOOL)a3
{
  double result;

  result = 52.0;
  if (!a3)
    return 30.0;
  return result;
}

+ (UIEdgeInsets)sectionInsetForRegularPad:(BOOL)a3 maxSize:(CGSize)a4 artworkSize:(CGSize)a5
{
  double height;
  double width;
  _BOOL8 v7;
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
  UIEdgeInsets result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(a1, "itemSizeForRegularPad:maxSize:", a4.width, a4.height, a5.width, a5.height);
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "topMargin");
  v14 = height - (v13 + v12);
  if (v14 > v13)
  {
    objc_msgSend(a1, "topMargin");
    v16 = v15;
    objc_msgSend(a1, "bottomMarginWithRegularPad:", v7);
    v13 = (height - (v16 + v17) - v12) * 0.5;
    v14 = v13;
  }
  v18 = (width - v10) * 0.5;
  v19 = v18;
  result.right = v19;
  result.bottom = v14;
  result.left = v18;
  result.top = v13;
  return result;
}

+ (CGSize)itemSizeForRegularPad:(BOOL)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  _BOOL8 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(a1, "bottomMarginWithRegularPad:");
  v9 = v8;
  objc_msgSend(a1, "topMargin");
  v11 = height - (v9 + v10);
  objc_msgSend(a1, "minimumLineSpacingWithRegularPad:", v6);
  v13 = width - v12;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
