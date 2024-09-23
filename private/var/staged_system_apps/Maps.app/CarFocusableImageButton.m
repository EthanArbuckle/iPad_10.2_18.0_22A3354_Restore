@implementation CarFocusableImageButton

- (CarFocusableImageButton)initWithFrame:(CGRect)a3
{
  return -[CarFocusableImageButton initWithImage:](self, "initWithImage:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CarFocusableImageButton)initWithImage:(id)a3
{
  return -[CarFocusableImageButton initWithImage:edgeInsets:](self, "initWithImage:edgeInsets:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
}

- (CarFocusableImageButton)initWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  CarFocusableImageButton *v10;
  CarFocusableImageButton *v11;
  UIImageView *v12;
  UIImageView *imageView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CarFocusableImageButton;
  v10 = -[CarFocusableBlurControl initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    -[CarFocusableBlurControl setRoundedCornerRadius:](v10, "setRoundedCornerRadius:", 14.0);
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v9);
    imageView = v11->_imageView;
    v11->_imageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v11->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v11->_imageView, "setContentMode:", 1);
    -[CarFocusableControl addSubview:](v11, "addSubview:", v11->_imageView);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v11->_imageView, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton centerXAnchor](v11, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v36[0] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v11->_imageView, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton centerYAnchor](v11, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v36[1] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v11->_imageView, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton topAnchor](v11, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:constant:", v27, top));
    v36[2] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v11->_imageView, "leftAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton leftAnchor](v11, "leftAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v24, left));
    v36[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton rightAnchor](v11, "rightAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v11->_imageView, "rightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v16, right));
    v36[4] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton bottomAnchor](v11, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v11->_imageView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, bottom));
    v36[5] = v20;
    v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    v9 = v21;
  }

  return v11;
}

- (CGSize)intrinsicContentSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[CarFocusableBlurControl roundedCorners](self, "roundedCorners");
  v3 = 28.0;
  if (v2 != -1)
    v3 = 33.0;
  v4 = 28.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setSemanticContentAttributeForImage:(int64_t)a3
{
  if (self->_semanticContentAttributeForImage != a3)
  {
    self->_semanticContentAttributeForImage = a3;
    -[UIImageView setSemanticContentAttribute:](self->_imageView, "setSemanticContentAttribute:");
  }
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  objc_super v5;

  if (-[CarFocusableBlurControl roundedCorners](self, "roundedCorners") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CarFocusableImageButton;
    -[CarFocusableBlurControl setRoundedCorners:](&v5, "setRoundedCorners:", a3);
    -[CarFocusableImageButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[CarFocusableImageButton setNeedsLayout](self, "setNeedsLayout");
  -[CarFocusableImageButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)semanticContentAttributeForImage
{
  return self->_semanticContentAttributeForImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
