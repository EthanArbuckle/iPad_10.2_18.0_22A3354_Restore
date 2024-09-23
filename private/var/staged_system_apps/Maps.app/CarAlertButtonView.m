@implementation CarAlertButtonView

- (CarAlertButtonView)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  CarAlertButtonView *v11;
  CarAlertButtonView *v12;
  UIImageView *v13;
  UIImageView *imageView;
  UILabel *v15;
  UILabel *titleLabel;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CarAlertButtonView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[CarAlertButtonView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[CarAlertButtonView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("CarAlertButton"));
    v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    imageView = v12->_imageView;
    v12->_imageView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v12->_imageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v12->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    objc_storeStrong((id *)&v12->_image, a4);
    -[CarAlertButtonView addSubview:](v12, "addSubview:", v12->_imageView);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setText:](v12->_titleLabel, "setText:", v6);
    -[UILabel setAccessibilityIdentifier:](v12->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[CarAlertButtonView addSubview:](v12, "addSubview:", v12->_titleLabel);
    -[CarAlertButtonView _setupConstraints](v12, "_setupConstraints");
    -[CarAlertButtonView setHighlighted:](v12, "setHighlighted:", 0);
  }

  return v12;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[9];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 12.0));
  v31[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView topAnchor](self, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 28.0));
  v31[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView bottomAnchor](self, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 14.0));
  v31[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 12.0));
  v31[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 12.0));
  v31[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_imageView, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView centerYAnchor](self, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v31[5] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView trailingAnchor](self, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_imageView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v4, 12.0));
  v31[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_imageView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:constant:", v7, 8.0));
  v31[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_imageView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 8.0));
  v31[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  UIImageView *imageView;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  v5 = (void *)v4;
  -[CarAlertButtonView setBackgroundColor:](self, "setBackgroundColor:", v4);
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);
  imageView = self->_imageView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _flatImageWithColor:](self->_image, "_flatImageWithColor:", v8));
  -[UIImageView setImage:](imageView, "setImage:", v7);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CarAlertButtonView *v5;

  v5 = (CarAlertButtonView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  -[CarAlertButtonView setHighlighted:](self, "setHighlighted:", v5 == self);

}

- (void)_setHighlightsForHitView:(id)a3
{
  if (a3 == self)
    objc_msgSend(a3, "setHighlighted:", 1);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarAlertButtonView;
  -[CarAlertButtonView touchesBegan:withEvent:](&v14, "touchesBegan:withEvent:", v6, v7);
  if (sub_1008EEF48(v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    objc_msgSend(v8, "locationInView:", self);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v10, v12));
    -[CarAlertButtonView _setHighlightsForHitView:](self, "_setHighlightsForHitView:", v13);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarAlertButtonView;
  -[CarAlertButtonView touchesMoved:withEvent:](&v14, "touchesMoved:withEvent:", v6, v7);
  if (sub_1008EEF48(v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    objc_msgSend(v8, "locationInView:", self);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v10, v12));
    -[CarAlertButtonView _setHighlightsForHitView:](self, "_setHighlightsForHitView:", v13);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonView;
  v6 = a3;
  -[CarAlertButtonView touchesCancelled:withEvent:](&v7, "touchesCancelled:withEvent:", v6, a4);
  LODWORD(a4) = sub_1008EEF48(v6);

  if ((_DWORD)a4)
    -[CarAlertButtonView setHighlighted:](self, "setHighlighted:", 0, v7.receiver, v7.super_class);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonView;
  v6 = a3;
  -[CarAlertButtonView touchesEnded:withEvent:](&v7, "touchesEnded:withEvent:", v6, a4);
  LODWORD(a4) = sub_1008EEF48(v6);

  if ((_DWORD)a4)
    -[CarAlertButtonView setHighlighted:](self, "setHighlighted:", 0, v7.receiver, v7.super_class);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
