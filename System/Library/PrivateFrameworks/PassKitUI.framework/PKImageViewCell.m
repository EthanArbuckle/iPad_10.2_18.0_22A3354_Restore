@implementation PKImageViewCell

- (PKImageViewCell)initWithReuseIdentifier:(id)a3
{
  PKImageViewCell *v3;
  PKImageViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKImageViewCell;
  v3 = -[PKImageViewCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    -[PKImageViewCell setAccessoryType:](v3, "setAccessoryType:", 0);
    v5 = *MEMORY[0x1E0DC49E8];
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[PKImageViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], v6, v7, v8);
    -[PKImageViewCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[PKImageViewCell detailTextLabel](v4, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v13.receiver = v4;
    v13.super_class = (Class)PKImageViewCell;
    -[PKImageViewCell imageView](&v13, sel_imageView);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 1);
    objc_msgSend(v11, "setLayoutMargins:", v5, v6, v7, v8);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell layoutSubviews](&v7, sel_layoutSubviews);
  v6.receiver = self;
  v6.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v6, sel_imageView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "layoutMargins");

  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  PKSizeAspectFit();

  PKSizeAlignedInRect();
  objc_msgSend(v3, "setFrame:");

}

- (void)setImage:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKImageViewCell;
  v3 = a3;
  -[PKImageViewCell imageView](&v5, sel_imageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3, v5.receiver, v5.super_class);

}

- (UIImage)image
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v5, sel_imageView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIEdgeInsets)imageViewMargins
{
  void *v2;
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
  objc_super v15;
  UIEdgeInsets result;

  v15.receiver = self;
  v15.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v15, sel_imageView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setImageViewMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v8, sel_imageView);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", top, left, bottom, right);

}

- (double)imageViewCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v7, sel_imageView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (void)setImageViewCornerRadius:(double)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKImageViewCell;
  -[PKImageViewCell imageView](&v6, sel_imageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCornerRadius:", a3);
  objc_msgSend(v5, "setMasksToBounds:", a3 > 0.0);

}

@end
