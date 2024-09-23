@implementation ExtensionsPayView

- (ExtensionsPayView)initWithCoder:(id)a3
{
  ExtensionsPayView *v3;
  ExtensionsPayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsPayView;
  v3 = -[ExtensionsPayView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsPayView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsPayView)initWithFrame:(CGRect)a3
{
  ExtensionsPayView *v3;
  ExtensionsPayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsPayView;
  v3 = -[ExtensionsPayView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsPayView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  PaymentMethodView *v6;
  PaymentMethodView *paymentMethodView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  UIButton *v19;
  UIButton *changePaymentMethodButton;
  void *v21;
  UIButton *v22;
  void *v23;
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
  double v34;
  id v35;
  id v36;

  -[ExtensionsPayView setLeftHairlineInset:](self, "setLeftHairlineInset:", 16.0);
  -[ExtensionsPayView setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  -[ExtensionsPayView setHairlineColor:](self, "setHairlineColor:", v4);

  -[ExtensionsPayView setTopHairlineHidden:](self, "setTopHairlineHidden:", 0);
  -[ExtensionsPayView setBottomHairlineHidden:](self, "setBottomHairlineHidden:", 1);
  v36 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_alloc_init(PaymentMethodView);
  paymentMethodView = self->_paymentMethodView;
  self->_paymentMethodView = v6;

  -[PaymentMethodView setTranslatesAutoresizingMaskIntoConstraints:](self->_paymentMethodView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ExtensionsPayView addSubview:](self, "addSubview:", self->_paymentMethodView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView leadingAnchor](self->_paymentMethodView, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 16.0));
  objc_msgSend(v5, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView topAnchor](self->_paymentMethodView, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 5.0));
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView bottomAnchor](self->_paymentMethodView, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -5.0));
  objc_msgSend(v5, "addObject:", v16);

  LODWORD(v17) = 1148846080;
  -[PaymentMethodView setContentHuggingPriority:forAxis:](self->_paymentMethodView, "setContentHuggingPriority:forAxis:", 0, v17);
  LODWORD(v18) = 1148829696;
  -[PaymentMethodView setContentCompressionResistancePriority:forAxis:](self->_paymentMethodView, "setContentCompressionResistancePriority:forAxis:", 0, v18);
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  changePaymentMethodButton = self->_changePaymentMethodButton;
  self->_changePaymentMethodButton = v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_changePaymentMethodButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_changePaymentMethodButton, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v21, &stru_1011E7A38);

  v22 = self->_changePaymentMethodButton;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ChangePaymentButtonTitle"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v22, "setTitle:forState:", v24, 0);

  -[ExtensionsPayView addSubview:](self, "addSubview:", self->_changePaymentMethodButton);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_changePaymentMethodButton, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v5, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_changePaymentMethodButton, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -16.0));
  objc_msgSend(v5, "addObject:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView trailingAnchor](self->_paymentMethodView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_changePaymentMethodButton, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, -7.0));
  objc_msgSend(v5, "addObject:", v33);

  LODWORD(v34) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_changePaymentMethodButton, "setContentCompressionResistancePriority:forAxis:", 0, v34);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
  -[UIButton addTarget:action:forControlEvents:](self->_changePaymentMethodButton, "addTarget:action:forControlEvents:", self, "_change:", 0x2000);
  v35 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "callChangeBlock");
  -[ExtensionsPayView addGestureRecognizer:](self, "addGestureRecognizer:", v35);

}

- (void)callChangeBlock
{
  void *v3;
  void (**v4)(id, ExtensionsPayView *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView performChangeCommand](self, "performChangeCommand"));

  if (v3)
  {
    v4 = (void (**)(id, ExtensionsPayView *))objc_claimAutoreleasedReturnValue(-[ExtensionsPayView performChangeCommand](self, "performChangeCommand"));
    v4[2](v4, self);

  }
}

- (void)configureForTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  PaymentMethodView *paymentMethodView;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  paymentMethodView = self->_paymentMethodView;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView paymentTitleLabel](paymentMethodView, "paymentTitleLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = objc_msgSend(v16, "length") == 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView paymentSubtitleLabel](self->_paymentMethodView, "paymentSubtitleLabel"));
  objc_msgSend(v13, "setHidden:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView paymentSubtitleLabel](self->_paymentMethodView, "paymentSubtitleLabel"));
  objc_msgSend(v14, "setText:", v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView paymentMethodImageView](self->_paymentMethodView, "paymentMethodImageView"));
  objc_msgSend(v15, "setImage:", v9);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 75.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_change:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ExtensionsPayView performChangeCommand](self, "performChangeCommand", a3));
  if (v4)
  {
    v5 = v4;
    ((void (**)(_QWORD, ExtensionsPayView *))v4)[2](v4, self);
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (UIButton)changePaymentMethodButton
{
  return self->_changePaymentMethodButton;
}

- (void)setChangePaymentMethodButton:(id)a3
{
  objc_storeStrong((id *)&self->_changePaymentMethodButton, a3);
}

- (id)performChangeCommand
{
  return self->_performChangeCommand;
}

- (void)setPerformChangeCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PaymentMethodView)paymentMethodView
{
  return self->_paymentMethodView;
}

- (void)setPaymentMethodView:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodView, 0);
  objc_storeStrong(&self->_performChangeCommand, 0);
  objc_storeStrong((id *)&self->_changePaymentMethodButton, 0);
}

@end
