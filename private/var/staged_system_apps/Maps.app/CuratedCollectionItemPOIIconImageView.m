@implementation CuratedCollectionItemPOIIconImageView

- (CuratedCollectionItemPOIIconImageView)initWithFrame:(CGRect)a3
{
  CuratedCollectionItemPOIIconImageView *v3;
  CuratedCollectionItemPOIIconImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemPOIIconImageView;
  v3 = -[CuratedCollectionItemPOIIconImageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CuratedCollectionItemPOIIconImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (CuratedCollectionItemPOIIconImageView)initWithCoder:(id)a3
{
  CuratedCollectionItemPOIIconImageView *v3;
  CuratedCollectionItemPOIIconImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemPOIIconImageView;
  v3 = -[CuratedCollectionItemPOIIconImageView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CuratedCollectionItemPOIIconImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CuratedCollectionItemPOIIconImageView setImageView:](self, "setImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  objc_msgSend(v5, "setContentMode:", 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  -[CuratedCollectionItemPOIIconImageView addSubview:](self, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v7, "userInterfaceIdiom") == (id)5)
    v8 = 24.0;
  else
    v8 = 30.0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v9, "userInterfaceIdiom") == (id)5)
    v10 = -2.0;
  else
    v10 = 0.0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v11, "userInterfaceIdiom") == (id)5)
    v12 = 10.0;
  else
    v12 = 8.0;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView topAnchor](self, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v10));
  v32[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView leadingAnchor](self, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v32[1] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v12));
  v32[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", v8));
  v32[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", v8));
  v32[4] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)setImage:(id)a3
{
  id *p_image;
  id v6;
  void *v7;
  id v8;

  p_image = (id *)&self->_image;
  v8 = a3;
  if ((objc_msgSend(*p_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    v6 = *p_image;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemPOIIconImageView imageView](self, "imageView"));
    objc_msgSend(v7, "setImage:", v6);

  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
