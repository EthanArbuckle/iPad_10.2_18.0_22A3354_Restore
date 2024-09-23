@implementation FlyoverBannerView

- (FlyoverBannerView)initWithDelegate:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  FlyoverBannerView *v8;
  FlyoverBannerView *v9;
  id v10;
  void *v11;
  UIVisualEffectView *v12;
  UIVisualEffectView *effectView;
  UILabel *v14;
  UILabel *textLabel;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIButton *stopButton;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  objc_super v54;
  _QWORD v55[10];

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FlyoverBannerView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[FlyoverBannerView initWithFrame:](&v54, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v4);
    -[FlyoverBannerView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("FlyoverBannerView"));
    v10 = objc_alloc((Class)UIVisualEffectView);
    v53 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
    v12 = (UIVisualEffectView *)objc_msgSend(v10, "initWithEffect:", v11);
    effectView = v9->_effectView;
    v9->_effectView = v12;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v9->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](v9->_effectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 13.0);
    -[UIVisualEffectView setAccessibilityIdentifier:](v9->_effectView, "setAccessibilityIdentifier:", CFSTR("FlyoverBannerEffectView"));
    -[FlyoverBannerView addSubview:](v9, "addSubview:", v9->_effectView);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textLabel = v9->_textLabel;
    v9->_textLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Flyover [banner title]"), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v9->_textLabel, "setText:", v17);

    -[UILabel setAccessibilityIdentifier:](v9->_textLabel, "setAccessibilityIdentifier:", CFSTR("FlyoverBannerEffectTextLabel"));
    -[FlyoverBannerView addSubview:](v9, "addSubview:", v9->_textLabel);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("multiply.circle.fill")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithRenderingMode:", 2));

    v19 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    stopButton = v9->_stopButton;
    v9->_stopButton = (UIButton *)v19;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v9->_stopButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](v9->_stopButton, "setTintColor:", v21);

    -[UIButton addTarget:action:forControlEvents:](v9->_stopButton, "addTarget:action:forControlEvents:", v9, "stopButtonPressed", 64);
    -[UIButton setImage:forState:](v9->_stopButton, "setImage:forState:", v52, 0);
    -[UIButton setAccessibilityIdentifier:](v9->_stopButton, "setAccessibilityIdentifier:", CFSTR("FlyoverBannerEffectStopButton"));
    -[FlyoverBannerView addSubview:](v9, "addSubview:", v9->_stopButton);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](v9->_effectView, "centerXAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView centerXAnchor](v9, "centerXAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
    v55[0] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](v9->_effectView, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView centerYAnchor](v9, "centerYAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v55[1] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](v9->_effectView, "heightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView heightAnchor](v9, "heightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v55[2] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](v9->_effectView, "widthAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView widthAnchor](v9, "widthAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
    v55[3] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v9->_textLabel, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView leadingAnchor](v9, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 13.0));
    v55[4] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v9->_textLabel, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView centerYAnchor](v9, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v55[5] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v9->_stopButton, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView trailingAnchor](v9, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -6.0));
    v55[6] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v9->_stopButton, "centerYAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView centerYAnchor](v9, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v55[7] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v9->_stopButton, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 20.0));
    v55[8] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v9->_stopButton, "widthAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 20.0));
    v55[9] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    v4 = v53;
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 360.0;
  v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLocationString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_locationString, a3);
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Flyover [banner title]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v7, v5));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Flyover [banner title]"), CFSTR("localized string not found"), 0));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView textLabel](self, "textLabel"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BD0B08;
  v11[3] = &unk_1011AC8B0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v11, 0, 0.300000012);

}

- (void)stopButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView delegate](self, "delegate"));
  objc_msgSend(v3, "stopFlyoverRequestedByBanner:", self);

}

- (NSString)locationString
{
  return self->_locationString;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (FlyoverBannerViewDelegate)delegate
{
  return (FlyoverBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
}

@end
