@implementation CarNavigationSearchCategoryViewCell

- (CarNavigationSearchCategoryViewCell)initWithFrame:(CGRect)a3
{
  CarNavigationSearchCategoryViewCell *v3;
  void *v4;
  void *v5;
  id v6;
  UIImageView *v7;
  UIImageView *imageView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarNavigationSearchCategoryViewCell;
  v3 = -[CarNavigationSearchCategoryViewCell initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarNavigationSearchCategoryViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchCategoryViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = objc_alloc((Class)UIImageView);
    -[CarNavigationSearchCategoryViewCell bounds](v3, "bounds");
    v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v7;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchCategoryViewCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *imageView;
  CGAffineTransform *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CarNavigationSearchCategoryViewCell;
  -[CarNavigationSearchCategoryViewCell setHighlighted:](&v13, "setHighlighted:");
  if (v3)
  {
    CGAffineTransformMakeScale(&v12, 0.949999988, 0.949999988);
    imageView = self->_imageView;
    v11 = v12;
    v6 = &v11;
  }
  else
  {
    imageView = self->_imageView;
    v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9 = v7;
    v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v6 = (CGAffineTransform *)&v8;
  }
  -[UIImageView setTransform:](imageView, "setTransform:", v6, v8, v9, v10, *(_OWORD *)&v11.a, *(_OWORD *)&v11.c, *(_OWORD *)&v11.tx);
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
