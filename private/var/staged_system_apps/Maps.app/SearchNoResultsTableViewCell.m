@implementation SearchNoResultsTableViewCell

- (SearchNoResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SearchNoResultsTableViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchNoResultsTableViewCell;
  v4 = -[SearchNoResultsTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SearchNoResultsTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[SearchNoResultsTableViewCell setupSubviews](v4, "setupSubviews");
  }
  return v4;
}

- (void)setupSubviews
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;
  MapsThemeLabel *v6;
  void *v7;
  void *v8;
  void *v9;
  KeyboardAvoidingView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  UIButton *rapButton;
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
  MapsThemeLabel *v48;
  _QWORD v49[6];

  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  objc_msgSend(v3, "addSubview:", self->_stackView);
  v6 = objc_alloc_init(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("No results [autocomplete]"), CFSTR("localized string not found"), 0));
  -[MapsThemeLabel setText:](v6, "setText:", v8);

  v48 = v6;
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011E7A78);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeLabel setTextColor:](v6, "setTextColor:", v9);

  -[MapsThemeLabel setTextAlignment:](v6, "setTextAlignment:", 1);
  -[MapsThemeLabel setAllowsDefaultTighteningForTruncation:](v6, "setAllowsDefaultTighteningForTruncation:", 1);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v6, "setMinimumScaleFactor:", 0.699999988);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v6);
  v10 = -[KeyboardAvoidingView initWithContentView:]([KeyboardAvoidingView alloc], "initWithContentView:", v3);
  -[SearchNoResultsTableViewCell setKeyboardAvoidingView:](self, "setKeyboardAvoidingView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Add a Missing Place"), CFSTR("localized string not found"), 0));
  objc_msgSend(v14, "setTitle:", v16);

  v47 = v14;
  objc_msgSend(v14, "setTitleTextAttributesTransformer:", &stru_1011B5698);
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  rapButton = self->_rapButton;
  self->_rapButton = v17;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_rapButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_rapButton, "addTarget:action:forControlEvents:", self, "_didTapOnRAPButton", 64);
  -[UIButton setConfiguration:](self->_rapButton, "setConfiguration:", v14);
  v45 = v3;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_stackView, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v44));
  v49[0] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_stackView, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v49[1] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v49[2] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v49[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v49[4] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v49[5] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)clearHeightConstraint
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  -[SearchNoResultsTableViewCell setHeightConstraint:](self, "setHeightConstraint:", 0);
}

- (void)setHeightConstraint:(double)a3 withPriority:(float)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v7 = objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v9, "priority");
    if (v10 == a4)
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
      objc_msgSend(v11, "priority");
      v13 = v12;

      if (a4 == 1000.0 || v13 == 1000.0)
        -[SearchNoResultsTableViewCell clearHeightConstraint](self, "clearHeightConstraint");
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v15, "setConstant:", a3);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v16, "priority");
    v18 = v17;

    if (v18 == a4)
      return;
    v25 = (id)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    *(float *)&v19 = a4;
    objc_msgSend(v25, "setPriority:", v19);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", a3));
    -[SearchNoResultsTableViewCell setHeightConstraint:](self, "setHeightConstraint:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    *(float *)&v24 = a4;
    objc_msgSend(v23, "setPriority:", v24);

    v25 = (id)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v25, "setActive:", 1);
  }

}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  if (!self->_enableStructuredRAPAffordance || a3)
  {
    if (!self->_enableStructuredRAPAffordance && a3)
      -[SearchNoResultsTableViewCell _addRAPButton](self, "_addRAPButton");
  }
  else
  {
    -[SearchNoResultsTableViewCell _removeRAPButton](self, "_removeRAPButton");
  }
  self->_enableStructuredRAPAffordance = a3;
}

- (void)_addRAPButton
{
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_rapButton);
}

- (void)_removeRAPButton
{
  -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", self->_rapButton);
  -[UIButton removeFromSuperview](self->_rapButton, "removeFromSuperview");
}

- (void)_didTapOnRAPButton
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell delegate](self, "delegate"));
  objc_msgSend(v2, "didTapOnReportAnIssue");

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchNoResultsTableViewCell;
  -[SearchNoResultsTableViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchNoResultsTableViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  objc_msgSend(v3, "updateForKeyboardFrame");

}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (SearchNoResultsTableViewCellDelegate)delegate
{
  return (SearchNoResultsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (KeyboardAvoidingView)keyboardAvoidingView
{
  return self->_keyboardAvoidingView;
}

- (void)setKeyboardAvoidingView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardAvoidingView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIButton)rapButton
{
  return self->_rapButton;
}

- (void)setRapButton:(id)a3
{
  objc_storeStrong((id *)&self->_rapButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardAvoidingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
