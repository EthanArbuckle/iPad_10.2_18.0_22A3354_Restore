@implementation ReservationButtonView

- (ReservationButtonView)initWithFrame:(CGRect)a3
{
  ReservationButtonView *v3;
  ReservationButtonView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIButton *button;
  UIButton *v10;
  UIButton *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ReservationButtonView;
  v3 = -[ReservationButtonView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView theme](v3, "theme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hairlineColor"));
    -[ReservationButtonView setHairlineColor:](v4, "setHairlineColor:", v6);

    -[ReservationButtonView setBottomHairlineHidden:](v4, "setBottomHairlineHidden:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _mapsui_filledButtonConfiguration](UIButtonConfiguration, "_mapsui_filledButtonConfiguration"));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
      button = v4->_button;
      v4->_button = (UIButton *)v8;

      -[UIButton setConfiguration:](v4->_button, "setConfiguration:", v7);
    }
    else
    {
      v10 = +[OverridenBackgroundColorButton newChromeBlueButton](OverridenBackgroundColorButton, "newChromeBlueButton");
      v11 = v4->_button;
      v4->_button = v10;

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView button](v4, "button"));
    -[ReservationButtonView addSubview:](v4, "addSubview:", v12);

    -[ReservationButtonView setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupConstraints
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
  _QWORD v20[5];

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView leadingAnchor](self, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 15.0));
  v20[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, -15.0));
  v20[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_button, "topAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView topAnchor](self, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v3, 15.0));
  v20[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -15.0));
  v20[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationButtonView button](self, "button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 44.0));
  v20[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
