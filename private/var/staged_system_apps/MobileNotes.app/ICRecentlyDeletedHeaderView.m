@implementation ICRecentlyDeletedHeaderView

- (ICRecentlyDeletedHeaderView)initWithFrame:(CGRect)a3
{
  ICRecentlyDeletedHeaderView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)ICRecentlyDeletedHeaderView;
  v3 = -[ICRecentlyDeletedHeaderView initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Notes are available here for %d days. After that time, notes will be permanently deleted. This may take up to %d days."), &stru_1005704B8, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, 30, 40));
    -[UILabel setText:](v3->_label, "setText:", v9);

    LODWORD(v10) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 1, v11);
    -[ICRecentlyDeletedHeaderView updateLabel](v3, "updateLabel");
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 4);
    -[ICRecentlyDeletedHeaderView addSubview:](v3, "addSubview:", v3->_label);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_label, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView topAnchor](v3, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 6.0));
    -[ICRecentlyDeletedHeaderView setTopLabelConstraint:](v3, "setTopLabelConstraint:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_label, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView bottomAnchor](v3, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -16.0));
    -[ICRecentlyDeletedHeaderView setBottomLabelConstraint:](v3, "setBottomLabelConstraint:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_label, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 11.0));
    -[ICRecentlyDeletedHeaderView setLeadingLabelConstraint:](v3, "setLeadingLabelConstraint:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_label, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -11.0));
    -[ICRecentlyDeletedHeaderView setTrailingLabelConstraint:](v3, "setTrailingLabelConstraint:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView topLabelConstraint](v3, "topLabelConstraint"));
    v33[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView bottomLabelConstraint](v3, "bottomLabelConstraint"));
    v33[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView leadingLabelConstraint](v3, "leadingLabelConstraint"));
    v33[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView trailingLabelConstraint](v3, "trailingLabelConstraint"));
    v33[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    -[ICRecentlyDeletedHeaderView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    -[ICRecentlyDeletedHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICRecentlyDeletedHeaderView registerForTraitChanges](v3, "registerForTraitChanges");
  }
  return v3;
}

- (void)updateLabel
{
  double v3;
  double v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  const UIFontTextStyle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;

  -[ICRecentlyDeletedHeaderView frame](self, "frame");
  v4 = v3;
  if (v3 < 600.0)
  {
    v5 = 0;
    v6 = 4;
  }
  else
  {
    v5 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
    if (v5)
      v6 = 1;
    else
      v6 = 4;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView label](self, "label"));
  objc_msgSend(v7, "setTextAlignment:", v6);

  v8 = &UIFontTextStyleSubheadline;
  if (!v5)
    v8 = &UIFontTextStyleFootnote;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForTextStyle:maxContentSizeCategory:](UIFont, "ic_preferredFontForTextStyle:maxContentSizeCategory:", *v8, UIContentSizeCategoryExtraExtraExtraLarge));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ic_fontWithSingleLineA"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView label](self, "label"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView topLabelConstraint](self, "topLabelConstraint"));
  objc_msgSend(v11, "setConstant:", 6.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView bottomLabelConstraint](self, "bottomLabelConstraint"));
  objc_msgSend(v12, "setConstant:", -16.0);

  if (v4 >= 600.0 && +[UIDevice ic_isiPhone](UIDevice, "ic_isiPhone"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView leadingLabelConstraint](self, "leadingLabelConstraint"));
    objc_msgSend(v13, "setConstant:", 80.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView trailingLabelConstraint](self, "trailingLabelConstraint"));
    v15 = v14;
    v16 = -80.0;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView leadingLabelConstraint](self, "leadingLabelConstraint"));
    objc_msgSend(v17, "setConstant:", 11.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICRecentlyDeletedHeaderView trailingLabelConstraint](self, "trailingLabelConstraint"));
    v15 = v14;
    v16 = -11.0;
  }
  objc_msgSend(v14, "setConstant:", v16);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICRecentlyDeletedHeaderView;
  -[ICRecentlyDeletedHeaderView layoutSubviews](&v3, "layoutSubviews");
  -[ICRecentlyDeletedHeaderView updateLabel](self, "updateLabel");
}

+ (id)sizingView
{
  if (qword_1005DDD48 != -1)
    dispatch_once(&qword_1005DDD48, &stru_100551918);
  return (id)qword_1005DDD50;
}

+ (double)heightForSuperview:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sizingView"));
  objc_msgSend(v4, "frame");
  objc_msgSend(v7, "setFrame:", 0.0, 0.0);
  objc_msgSend(v7, "updateLabel");
  objc_msgSend(v4, "layoutMargins");
  v9 = v6 + -22.0 - v8;
  objc_msgSend(v4, "layoutMargins");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "label"));
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9 - v11, 1.79769313e308, v13, v14);
  v16 = v15;

  return v16 + 6.0 + 16.0;
}

- (void)registerForTraitChanges
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection ic_traitsAffectingSize](UITraitCollection, "ic_traitsAffectingSize"));
  v3 = -[ICRecentlyDeletedHeaderView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, "updateLabel");

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)topLabelConstraint
{
  return self->_topLabelConstraint;
}

- (void)setTopLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLabelConstraint, a3);
}

- (NSLayoutConstraint)bottomLabelConstraint
{
  return self->_bottomLabelConstraint;
}

- (void)setBottomLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, a3);
}

- (NSLayoutConstraint)leadingLabelConstraint
{
  return self->_leadingLabelConstraint;
}

- (void)setLeadingLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingLabelConstraint, a3);
}

- (NSLayoutConstraint)trailingLabelConstraint
{
  return self->_trailingLabelConstraint;
}

- (void)setTrailingLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLabelConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
