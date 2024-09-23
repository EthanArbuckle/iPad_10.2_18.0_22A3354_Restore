@implementation CarSmallWidgetNoContentView

- (CarSmallWidgetNoContentView)initWithCoder:(id)a3
{
  CarSmallWidgetNoContentView *v3;
  CarSmallWidgetNoContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetNoContentView;
  v3 = -[CarSmallWidgetNoContentView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CarSmallWidgetNoContentView _commonInit](v3, "_commonInit");
  return v4;
}

- (CarSmallWidgetNoContentView)initWithFrame:(CGRect)a3
{
  CarSmallWidgetNoContentView *v3;
  CarSmallWidgetNoContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetNoContentView;
  v3 = -[CarSmallWidgetNoContentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarSmallWidgetNoContentView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *noContentLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CarSmallWidgetNoContentView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetNoContentView"));
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  noContentLabel = self->_noContentLabel;
  self->_noContentLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noContentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  -[UILabel setFont:](self->_noContentLabel, "setFont:", v5);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_noContentLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_noContentLabel, "setMinimumScaleFactor:", 0.600000024);
  -[UILabel setNumberOfLines:](self->_noContentLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_noContentLabel, "setTextAlignment:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_noContentLabel, "setTextColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_noContentLabel, "setAccessibilityIdentifier:", CFSTR("NoContentLabel"));
  -[CarSmallWidgetNoContentView addSubview:](self, "addSubview:", self->_noContentLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsForCenteringInView:edgeInsets:](self->_noContentLabel, "_maps_constraintsForCenteringInView:edgeInsets:", self, 6.0, 6.0, 6.0, 6.0));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CarPlay_Dashboard_NoContentLabel"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_noContentLabel, "setText:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentLabel, 0);
}

@end
