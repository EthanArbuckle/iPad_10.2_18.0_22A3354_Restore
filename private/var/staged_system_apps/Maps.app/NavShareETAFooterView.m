@implementation NavShareETAFooterView

- (NavShareETAFooterView)init
{
  void *v3;
  NavShareETAFooterView *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v4 = -[NavShareETAFooterView initWithTextColor:](self, "initWithTextColor:", v3);

  return v4;
}

- (NavShareETAFooterView)initWithTextColor:(id)a3
{
  id v4;
  NavShareETAFooterView *v5;
  NavShareETAFooterView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *textLabel;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[4];

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NavShareETAFooterView;
  v5 = -[NavShareETAFooterView initWithReuseIdentifier:](&v34, "initWithReuseIdentifier:", 0);
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NavShareETAFooterView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView contentView](v6, "contentView"));
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("NavShareETAFooterContent"));

    v11 = objc_opt_new(UILabel);
    textLabel = v6->_textLabel;
    v6->_textLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v6->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v6->_textLabel, "setTextAlignment:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    -[UILabel setFont:](v6->_textLabel, "setFont:", v13);

    -[UILabel setTextColor:](v6->_textLabel, "setTextColor:", v4);
    -[UILabel setAccessibilityIdentifier:](v6->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView contentView](v6, "contentView"));
    objc_msgSend(v14, "addSubview:", v6->_textLabel);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v6->_textLabel, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView layoutMarginsGuide](v6, "layoutMarginsGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v35[0] = v29;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v6->_textLabel, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView layoutMarginsGuide](v6, "layoutMarginsGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v35[1] = v25;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v6->_textLabel, "topAnchor"));
    v33 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView contentView](v6, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 16.0));
    v35[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v6->_textLabel, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavShareETAFooterView contentView](v6, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -10.0));
    v35[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    v4 = v33;
  }

  return v6;
}

- (void)setFooterText:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  NSString *v8;
  NSString *footerText;
  id v10;

  v4 = a3;
  v5 = self->_footerText;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v10 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v10;
    if ((v7 & 1) == 0)
    {
      v8 = (NSString *)objc_msgSend(v10, "copy");
      footerText = self->_footerText;
      self->_footerText = v8;

      -[UILabel setText:](self->_textLabel, "setText:", self->_footerText);
      v6 = (unint64_t)v10;
    }
  }

}

- (double)heightForWidth:(double)a3
{
  double v3;

  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", a3, 100.0);
  return v3 + 16.0 + 10.0;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
