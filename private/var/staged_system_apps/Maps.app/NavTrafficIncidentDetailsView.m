@implementation NavTrafficIncidentDetailsView

- (NavTrafficIncidentDetailsView)initWithFrame:(CGRect)a3
{
  NavTrafficIncidentDetailsView *v3;
  NavTrafficIncidentDetailsView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavTrafficIncidentDetailsView;
  v3 = -[NavTrafficIncidentDetailsView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NavTrafficIncidentDetailsView _setupViews](v3, "_setupViews");
    -[NavTrafficIncidentDetailsView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("NavTrafficIncidentDetailsView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentDetailsView _initialConstraints](v4, "_initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

  }
  return v4;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *primaryLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *secondaryLabel;
  void *v13;
  void *v14;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 20.0));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v9);

  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakStrategy:](self->_primaryLabel, "setLineBreakStrategy:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v10);

  -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[NavTrafficIncidentDetailsView addSubview:](self, "addSubview:", self->_primaryLabel);
  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 20.0));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v13);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakStrategy:](self->_secondaryLabel, "setLineBreakStrategy:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v14);

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[NavTrafficIncidentDetailsView addSubview:](self, "addSubview:", self->_secondaryLabel);
}

- (id)_initialConstraints
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
  _QWORD v26[7];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentDetailsView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 21.0));
  v26[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentDetailsView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -16.0));
  v26[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v26[2] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v26[3] = v14;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentDetailsView topAnchor](self, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 40.0));
  v26[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 44.0));
  v26[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentDetailsView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 35.0));
  v26[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 7));

  return v12;
}

- (NSString)primaryLabelText
{
  return -[UILabel text](self->_primaryLabel, "text");
}

- (NSString)secondaryLabelText
{
  return -[UILabel text](self->_secondaryLabel, "text");
}

- (void)setPrimaryLabelText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  NSAttributedStringKey v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 20.0));
    objc_msgSend(v6, "lineHeight");
    objc_msgSend(v5, "setLineSpacing:", 24.0 - v7);

    v8 = objc_alloc((Class)NSAttributedString);
    v11 = NSParagraphStyleAttributeName;
    v12 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = objc_msgSend(v8, "initWithString:attributes:", v4, v9);
    -[UILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v10);

  }
  else
  {
    -[UILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", 0);
  }

}

- (void)setSecondaryLabelText:(id)a3
{
  -[UILabel setText:](self->_secondaryLabel, "setText:", a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
