@implementation RidesharingTippingOptionView

- (RidesharingTippingOptionView)initWithFrame:(CGRect)a3
{
  RidesharingTippingOptionView *v3;
  RidesharingTippingOptionView *v4;
  RidesharingTippingOptionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingOptionView;
  v3 = -[RidesharingTippingOptionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RidesharingTippingOptionView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (RidesharingTippingOptionView)initWithCoder:(id)a3
{
  RidesharingTippingOptionView *v3;
  RidesharingTippingOptionView *v4;
  RidesharingTippingOptionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingOptionView;
  v3 = -[RidesharingTippingOptionView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[RidesharingTippingOptionView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *tipLabel;
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
  id v19;

  self->_selected = 0;
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  tipLabel = self->_tipLabel;
  self->_tipLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tipLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RidesharingTippingOptionView addSubview:](self, "addSubview:", self->_tipLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_tipLabel, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView topAnchor](self, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 5.0));
  objc_msgSend(v7, "setActive:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_tipLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView leadingAnchor](self, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 10.0));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_tipLabel, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -5.0));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_tipLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:constant:", v15, -10.0));
  objc_msgSend(v16, "setActive:", 1);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_tipLabel, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView centerXAnchor](self, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

}

- (void)setAmount:(id)a3
{
  RideBookingCurrencyAmount **p_amount;
  id v6;
  id v7;
  void *v8;
  id v9;

  p_amount = &self->_amount;
  objc_storeStrong((id *)&self->_amount, a3);
  v6 = a3;
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount formattedString](*p_amount, "formattedString"));
  v9 = objc_msgSend(v7, "initWithString:", v8);

  -[UILabel setAttributedText:](self->_tipLabel, "setAttributedText:", v9);
  -[RidesharingTippingOptionView updateTheme](self, "updateTheme");

}

- (void)setOther:(BOOL)a3
{
  UILabel *tipLabel;
  id v5;
  void *v6;
  void *v7;
  id v8;

  self->_other = a3;
  tipLabel = self->_tipLabel;
  if (a3)
  {
    v5 = objc_alloc((Class)NSAttributedString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ridesharing.feedback.tippingOption.other"), CFSTR("localized string not found"), 0));
    v8 = objc_msgSend(v5, "initWithString:", v7);
    -[UILabel setAttributedText:](tipLabel, "setAttributedText:", v8);

  }
  else
  {
    -[UILabel setAttributedText:](self->_tipLabel, "setAttributedText:", 0);
  }
  -[RidesharingTippingOptionView updateTheme](self, "updateTheme");
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (self->_amount)
    -[RidesharingTippingOptionView setAmount:](self, "setAmount:");
  -[RidesharingTippingOptionView updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  RideBookingCurrencyAmount *amount;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t Log;
  char *v20;
  id v21;
  UILabel *tipLabel;
  id v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  id v27;
  NSAttributedStringKey v28;
  void *v29;
  NSAttributedStringKey v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ridesharingTippingOptionsBackgroundColor:", -[RidesharingTippingOptionView isSelected](self, "isSelected")));
  -[RidesharingTippingOptionView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_tipLabel, "attributedText"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v30 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ridesharingTippingOptionsForegroundColor:", -[RidesharingTippingOptionView isSelected](self, "isSelected")));
  v31 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  objc_msgSend(v6, "addAttributes:range:", v9, 0, objc_msgSend(v6, "length"));

  amount = self->_amount;
  if (amount)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingCurrencyAmount currencySymbol](amount, "currencySymbol"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
      v13 = objc_msgSend(v12, "rangeOfString:", v11);
      v15 = v14;

      v28 = NSForegroundColorAttributeName;
      v16 = objc_claimAutoreleasedReturnValue(-[RidesharingTippingOptionView theme](self, "theme"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ridesharingTippingOptionsForegroundCurrencyColor:](v16, "ridesharingTippingOptionsForegroundCurrencyColor:", -[RidesharingTippingOptionView isSelected](self, "isSelected")));
      v29 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      objc_msgSend(v6, "addAttributes:range:", v18, v13, v15);

    }
    else
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
      v16 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingTippingOptionView.m");
        v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Couldn't get range of currency symbol to apply styling. RideBookingCurrencyAmount: %@"), self->_amount);
        *(_DWORD *)buf = 136315394;
        v25 = v20;
        v26 = 2112;
        v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);

      }
    }

  }
  tipLabel = self->_tipLabel;
  v23 = objc_msgSend(v6, "copy");
  -[UILabel setAttributedText:](tipLabel, "setAttributedText:", v23);

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RidesharingTippingOptionView\nAmount:%@\n other?:%d"), self->_amount, self->_other);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isOther
{
  return self->_other;
}

- (RideBookingCurrencyAmount)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_tipLabel, 0);
}

@end
