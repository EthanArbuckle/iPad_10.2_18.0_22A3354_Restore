@implementation CarRouteGeniusSuggestionIconView

- (CarRouteGeniusSuggestionIconView)initWithImage:(id)a3
{
  id v4;
  CarRouteGeniusSuggestionIconView *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CarRouteGeniusSuggestionIconView;
  v5 = -[CarRouteGeniusSuggestionIconView initWithFrame:](&v20, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v4);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v5->_imageView, "setBackgroundColor:", v8);

    -[CarRouteGeniusSuggestionIconView addSubview:](v5, "addSubview:", v5->_imageView);
    LODWORD(v9) = 1148846080;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](v5->_imageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v5, 10.0, 0.0, 0.0, 0.0, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allConstraints"));
    v12 = objc_msgSend(v11, "mutableCopy");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_imageView, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 25.0));
    v21[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_imageView, "widthAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_imageView, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v21[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    objc_msgSend(v12, "addObjectsFromArray:", v18);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
  }

  return v5;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
