@implementation HODataSyncingTextView

- (HODataSyncingTextView)init
{
  HODataSyncingTextView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  UILabel *v6;
  UILabel *descriptionLabel;
  void *v8;
  void *v9;
  UIActivityIndicatorView *v10;
  UIActivityIndicatorView *spinner;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HODataSyncingTextView;
  v2 = -[HODataSyncingTextView init](&v13, "init");
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView boldFontForStyle:](v2, "boldFontForStyle:", UIFontTextStyleTitle1));
    -[UILabel setFont:](v2->_titleLabel, "setFont:", v5);

    -[UILabel setNumberOfLines:](v2->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_titleLabel, "setTextAlignment:", 1);
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    descriptionLabel = v2->_descriptionLabel;
    v2->_descriptionLabel = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView boldFontForStyle:](v2, "boldFontForStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](v2->_descriptionLabel, "setFont:", v8);

    -[UILabel setNumberOfLines:](v2->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_descriptionLabel, "setTextAlignment:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v2->_descriptionLabel, "setTextColor:", v9);

    v10 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    spinner = v2->_spinner;
    v2->_spinner = v10;

    -[UIActivityIndicatorView setHidesWhenStopped:](v2->_spinner, "setHidesWhenStopped:", 1);
    -[HODataSyncingTextView addSubview:](v2, "addSubview:", v2->_titleLabel);
    -[HODataSyncingTextView addSubview:](v2, "addSubview:", v2->_descriptionLabel);
    -[HODataSyncingTextView addSubview:](v2, "addSubview:", v2->_spinner);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v2->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v2;
}

- (void)setDataSyncState:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;

  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      v4 = sub_10000D228(CFSTR("HODataSyncingTitleGeneric"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView titleLabel](self, "titleLabel"));
      objc_msgSend(v6, "setText:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinner](self, "spinner"));
      objc_msgSend(v7, "startAnimating");

      -[HODataSyncingTextView _configureForSpinnerLayout](self, "_configureForSpinnerLayout");
      break;
    case 1uLL:
      return;
    case 2uLL:
      v15 = sub_10000D228(CFSTR("HODataSyncingTitleKeychain"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView titleLabel](self, "titleLabel"));
      objc_msgSend(v17, "setText:", v16);

      if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
        v11 = CFSTR("HODataSyncingDescriptionEnableKeychain_iosMac");
      else
        v11 = CFSTR("HODataSyncingDescriptionEnableKeychain");
      goto LABEL_10;
    case 3uLL:
    case 6uLL:
      v8 = sub_10000D228(CFSTR("HODataSyncingTitleiCloud"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView titleLabel](self, "titleLabel"));
      objc_msgSend(v10, "setText:", v9);

      v11 = CFSTR("HODataSyncingDescriptionEnableiCloud");
LABEL_10:
      v18 = sub_10000D228(v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView descriptionLabel](self, "descriptionLabel"));
      objc_msgSend(v20, "setText:", v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinner](self, "spinner"));
      objc_msgSend(v21, "stopAnimating");

      -[HODataSyncingTextView _configureForTwoLabelLayout](self, "_configureForTwoLabelLayout");
      break;
    default:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unhandled dataSyncState %lu"), a3));
      v13 = HFLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000788FC((uint64_t)v12, v14);

      NSLog(CFSTR("%@"), v12);
      break;
  }
}

- (void)_configureForTwoLabelLayout
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView buttonLayoutConstraints](self, "buttonLayoutConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView titleLabel](self, "titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView descriptionLabel](self, "descriptionLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView _createConstraintsForFirstItem:secondItem:](self, "_createConstraintsForFirstItem:secondItem:", v4, v5));
    -[HODataSyncingTextView setButtonLayoutConstraints:](self, "setButtonLayoutConstraints:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinner](self, "spinner"));
  objc_msgSend(v7, "setHidden:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v8, "setHidden:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView buttonLayoutConstraints](self, "buttonLayoutConstraints"));

  if (v9 != v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView buttonLayoutConstraints](self, "buttonLayoutConstraints"));
    -[HODataSyncingTextView setActiveConstraints:](self, "setActiveConstraints:", v12);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
}

- (void)_configureForSpinnerLayout
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinnerLayoutConstraints](self, "spinnerLayoutConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinner](self, "spinner"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView _createConstraintsForFirstItem:secondItem:](self, "_createConstraintsForFirstItem:secondItem:", v4, v5));
    -[HODataSyncingTextView setSpinnerLayoutConstraints:](self, "setSpinnerLayoutConstraints:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinner](self, "spinner"));
  objc_msgSend(v7, "setHidden:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v8, "setHidden:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinnerLayoutConstraints](self, "spinnerLayoutConstraints"));

  if (v9 != v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView spinnerLayoutConstraints](self, "spinnerLayoutConstraints"));
    -[HODataSyncingTextView setActiveConstraints:](self, "setActiveConstraints:", v12);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView activeConstraints](self, "activeConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
}

- (id)_createConstraintsForFirstItem:(id)a3 secondItem:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  -[NSMutableArray addObject:](v8, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView centerXAnchor](self, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v8, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView leadingAnchor](self, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16));
  -[NSMutableArray addObject:](v8, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v8, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -10.0));
  -[NSMutableArray addObject:](v8, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView centerXAnchor](self, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v8, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView leadingAnchor](self, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  -[NSMutableArray addObject:](v8, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView trailingAnchor](self, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  -[NSMutableArray addObject:](v8, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingTextView bottomAnchor](self, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  -[NSMutableArray addObject:](v8, "addObject:", v35);

  return v8;
}

- (id)boldFontForStyle:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 2, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (NSArray)spinnerLayoutConstraints
{
  return self->_spinnerLayoutConstraints;
}

- (void)setSpinnerLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLayoutConstraints, a3);
}

- (NSArray)buttonLayoutConstraints
{
  return self->_buttonLayoutConstraints;
}

- (void)setButtonLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLayoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_spinnerLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
