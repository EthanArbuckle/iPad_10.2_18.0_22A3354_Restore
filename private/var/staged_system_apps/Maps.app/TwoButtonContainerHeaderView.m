@implementation TwoButtonContainerHeaderView

- (TwoButtonContainerHeaderView)initWithAdditionalCardButtonType:(unint64_t)a3 tintColor:(id)a4 buttonMenu:(id)a5
{
  id v8;
  id v9;
  TwoButtonContainerHeaderView *v10;
  CardButtonConfiguration *v11;
  CardButtonConfiguration *buttonConfig;
  CardButtonConfiguration *v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TwoButtonContainerHeaderView;
  v10 = -[ContainerHeaderView initWithCardButtonType:cardButtonTintColor:](&v15, "initWithCardButtonType:cardButtonTintColor:", 0, v8);
  if (v10)
  {
    v11 = objc_opt_new(CardButtonConfiguration);
    -[CardButtonConfiguration setType:](v11, "setType:", a3);
    -[CardButtonConfiguration setTintColor:](v11, "setTintColor:", v8);
    buttonConfig = v10->_buttonConfig;
    v10->_buttonConfig = v11;
    v13 = v11;

    objc_storeStrong((id *)&v10->_quickActionButtonMenu, a5);
    -[TwoButtonContainerHeaderView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("TwoButtonContainerHeader"));
    -[TwoButtonContainerHeaderView _customInitForSecondButton](v10, "_customInitForSecondButton");
  }

  return v10;
}

- (id)quickActionButtonView
{
  return self->_quickActionButtonView;
}

- (void)_customInitForSecondButton
{
  CardButton *v3;
  CardButton *quickActionButtonView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", self->_buttonConfig);
  quickActionButtonView = self->_quickActionButtonView;
  self->_quickActionButtonView = v3;

  -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](self->_quickActionButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton setMenu:](self->_quickActionButtonView, "setMenu:", self->_quickActionButtonMenu);
  -[TwoButtonContainerHeaderView addSubview:](self, "addSubview:", self->_quickActionButtonView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](self->_quickActionButtonView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoButtonContainerHeaderView trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton centerYAnchor](self->_quickActionButtonView, "centerYAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView buttonView](self, "buttonView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v13[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionButtonMenu, 0);
  objc_storeStrong((id *)&self->_buttonConfig, 0);
  objc_storeStrong((id *)&self->_quickActionButtonView, 0);
}

@end
