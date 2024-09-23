@implementation MacRAPLookAroundImageCell

- (MacRAPLookAroundImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MacRAPLookAroundImageCell *v4;
  MacRAPLookAroundImageCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacRAPLookAroundImageCell;
  v4 = -[MacRAPLookAroundImageCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MacRAPLookAroundImageCell _setupSubviews](v4, "_setupSubviews");
    -[MacRAPLookAroundImageCell _setupConstraints](v5, "_setupConstraints");
    -[MacRAPLookAroundImageCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  return v5;
}

- (void)setLookAroundImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_lookAroundImage != v6)
  {
    objc_storeStrong((id *)&self->_lookAroundImage, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MacRAPLookAroundImageCell setLookAroundImageView:](self, "setLookAroundImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  objc_msgSend(v5, "setContentMode:", 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  objc_msgSend(v6, "setClipsToBounds:", 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v27[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v27[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v27[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v27[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPLookAroundImageCell lookAroundImageView](self, "lookAroundImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 235.0));
  v27[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("MacRAPLookAroundImageCell");
}

- (UIImage)lookAroundImage
{
  return self->_lookAroundImage;
}

- (UIImageView)lookAroundImageView
{
  return self->_lookAroundImageView;
}

- (void)setLookAroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundImageView, 0);
  objc_storeStrong((id *)&self->_lookAroundImage, 0);
}

@end
