@implementation MFMessageSashHeaderBlock

- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3
{
  -[MFMessageSashHeaderBlock doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  __assert_rtn("-[MFMessageSashHeaderBlock initWithFrame:]", "MFMessageSashHeaderBlock.m", 59, "0");
}

- (MFMessageSashHeaderBlock)initWithCoder:(id)a3
{
  id v5;

  v5 = a3;
  -[MFMessageSashHeaderBlock doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageSashHeaderBlock initWithCoder:]", "MFMessageSashHeaderBlock.m", 63, "0");
}

- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3 accountsProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  MFMessageSashHeaderBlock *v11;
  MFMessageSashHeaderBlock *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFMessageSashHeaderBlock;
  v11 = -[MFMessageSashHeaderBlock initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountsProvider, a4);
    -[MFMessageSashHeaderBlock setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MFMessageSashHeaderBlock setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[MFMessageSashHeaderBlock setSeparatorDrawsFlushWithLeadingEdge:](v12, "setSeparatorDrawsFlushWithLeadingEdge:", 1);
    -[MFMessageSashHeaderBlock setSeparatorDrawsFlushWithTrailingEdge:](v12, "setSeparatorDrawsFlushWithTrailingEdge:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v12, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

  }
  return v12;
}

+ (id)titleFont
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor _preferredFontDescriptorWithTextStyle:weight:](UIFontDescriptor, "_preferredFontDescriptorWithTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightBold));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017E68;
  v7[3] = &unk_1000350C0;
  v4 = v2;
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedFont:forKey:", v7, CFSTR("messageSashHeaderBlock.titleFont")));

  return v5;
}

+ (double)heightForCurrentFontMetrics
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017F70;
  v11[3] = &unk_1000350E0;
  v11[4] = a1;
  objc_msgSend(v3, "cachedFloat:forKey:", v11, CFSTR("messageSashHeaderBlock.titleLabel.top"));
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017FC4;
  v10[3] = &unk_1000350E0;
  v10[4] = a1;
  objc_msgSend(v6, "cachedFloat:forKey:", v10, CFSTR("messageSashHeaderBlock.titleLabel.bottom"));
  v8 = v7;

  return v5 + v8;
}

- (void)createPrimaryViews
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double y;
  double width;
  double height;
  id v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MFMessageSashHeaderBlock;
  -[MFMessageSashHeaderBlock createPrimaryViews](&v27, "createPrimaryViews");
  -[MFMessageSashHeaderBlock setSeparatorIsHidden:](self, "setSeparatorIsHidden:", 1);
  v3 = objc_alloc((Class)UIView);
  -[MFMessageSashHeaderBlock bounds](self, "bounds");
  v4 = objc_msgSend(v3, "initWithFrame:");
  -[MFMessageSashHeaderBlock setBackgroundView:](self, "setBackgroundView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock backgroundView](self, "backgroundView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock backgroundView](self, "backgroundView"));
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock layer](self, "layer"));
  objc_msgSend(v8, "setAllowsGroupBlending:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock backgroundView](self, "backgroundView"));
  -[MFMessageSashHeaderBlock addSubview:](self, "addSubview:", v9);

  v10 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v14 = objc_msgSend(v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFMessageSashHeaderBlock setTitleLabel:](self, "setTitleLabel:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  LODWORD(v6) = UIContentSizeCategoryIsAccessibilityCategory(v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v17, "setNumberOfLines:", v6 ^ 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  -[MFMessageSashHeaderBlock addSubview:](self, "addSubview:", v21);

  v22 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFMessageSashHeaderBlock setIconImageView:](self, "setIconImageView:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  objc_msgSend(v24, "setContentMode:", 4);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  -[MFMessageSashHeaderBlock addSubview:](self, "addSubview:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v26, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChangeNotification:", UIContentSizeCategoryDidChangeNotification, 0);

  -[MFMessageSashHeaderBlock _updateFonts](self, "_updateFonts");
  -[MFMessageSashHeaderBlock setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewSashHeader);
}

- (void)initializePrimaryLayoutConstraints
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
  double v19;
  void *v20;
  id v21;
  void *v22;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[6];

  v48.receiver = self;
  v48.super_class = (Class)MFMessageSashHeaderBlock;
  -[MFMessageSashHeaderBlock initializePrimaryLayoutConstraints](&v48, "initializePrimaryLayoutConstraints");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock topAnchor](self, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  -[MFMessageSashHeaderBlock setTitleLabelTop:](self, "setTitleLabelTop:", v5);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v7));
  -[MFMessageSashHeaderBlock setTitleLabelBottom:](self, "setTitleLabelBottom:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
  objc_msgSend(v18, "capHeight");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v19 * -0.5));
  -[MFMessageSashHeaderBlock setIconVerticalConstraint:](self, "setIconVerticalConstraint:", v20);

  v21 = objc_alloc((Class)NSMutableArray);
  v50[0] = v47;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelTop](self, "titleLabelTop"));
  v50[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconVerticalConstraint](self, "iconVerticalConstraint"));
  v50[2] = v41;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 22.0));
  v50[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 22.0));
  v50[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelBottom](self, "titleLabelBottom"));
  v50[5] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 6));
  v44 = objc_msgSend(v21, "initWithArray:", v29);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  v49[0] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:constant:", v37, -14.0));
  v49[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
  objc_msgSend(v44, "addObjectsFromArray:", v39);

  v40 = objc_msgSend(v44, "copy");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  objc_super v24;
  _QWORD v25[2];

  v24.receiver = self;
  v24.super_class = (Class)MFMessageSashHeaderBlock;
  -[MFMessageSashHeaderBlock updateConstraints](&v24, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelTop](self, "titleLabelTop"));
  v25[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelBottom](self, "titleLabelBottom"));
  v25[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

  if (v5)
  {
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100018D10;
    v23[3] = &unk_100035108;
    v23[4] = self;
    objc_msgSend(v9, "cachedFloat:forKey:", v23, CFSTR("messageSashHeaderBlock.titleLabel.top"));
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelTop](self, "titleLabelTop"));
    objc_msgSend(v12, "setConstant:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100018D68;
    v22[3] = &unk_100035108;
    v22[4] = self;
    objc_msgSend(v13, "cachedFloat:forKey:", v22, CFSTR("messageSashHeaderBlock.titleLabel.bottom"));
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabelBottom](self, "titleLabelBottom"));
    objc_msgSend(v16, "setConstant:", v15);

  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
  objc_msgSend(v18, "capHeight");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconVerticalConstraint](self, "iconVerticalConstraint"));
  objc_msgSend(v21, "setConstant:", v20 * -0.5);

}

- (void)setDisplayMetrics:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageSashHeaderBlock;
  -[MFMessageSashHeaderBlock setDisplayMetrics:](&v6, "setDisplayMetrics:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock displayMetrics](self, "displayMetrics"));

  if (v5)
    -[MFMessageSashHeaderBlock _updateMailboxIcon](self, "_updateMailboxIcon");

}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  NSString *v5;
  id v6;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory", a3));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setNumberOfLines:", !IsAccessibilityCategory);

}

- (void)_updateFonts
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "titleFont");
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v5);

}

- (void)_updateMailboxIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailbox"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tinyDisplayIconWithColor:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  objc_msgSend(v5, "setImage:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
  objc_msgSend(v6, "setTintColor:", v8);

}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageSashHeaderBlock;
  -[MFMessageSashHeaderBlock displayMessageUsingViewModel:](&v12, "displayMessageUsingViewModel:", v4);
  if (-[MFMessageSashHeaderBlock shouldShowMailbox](self, "shouldShowMailbox"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock viewModel](self, "viewModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailbox"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock accountsProvider](self, "accountsProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "foundInDescriptionIncludingAccount:", objc_msgSend(v7, "isDisplayingMultipleAccounts")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock titleLabel](self, "titleLabel"));
    objc_msgSend(v9, "setText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
    objc_msgSend(v10, "setAlpha:", 1.0);

    -[MFMessageSashHeaderBlock _updateMailboxIcon](self, "_updateMailboxIcon");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageSashHeaderBlock iconImageView](self, "iconImageView"));
    objc_msgSend(v11, "setAlpha:", 0.0);

  }
  -[MFMessageSashHeaderBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (BOOL)shouldShowMailbox
{
  return self->_shouldShowMailbox;
}

- (void)setShouldShowMailbox:(BOOL)a3
{
  self->_shouldShowMailbox = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (NSLayoutConstraint)titleLabelTop
{
  return self->_titleLabelTop;
}

- (void)setTitleLabelTop:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTop, a3);
}

- (NSLayoutConstraint)titleLabelBottom
{
  return self->_titleLabelBottom;
}

- (void)setTitleLabelBottom:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBottom, a3);
}

- (NSLayoutConstraint)iconVerticalConstraint
{
  return self->_iconVerticalConstraint;
}

- (void)setIconVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconVerticalConstraint, a3);
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_iconVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBottom, 0);
  objc_storeStrong((id *)&self->_titleLabelTop, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
