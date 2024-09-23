@implementation ExtensionsPrimaryDetailsView

- (void)contentViewDidLoad
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
  void *v19;
  void *v20;
  objc_super v21;
  NSLayoutConstraint *heightConstraint;

  v21.receiver = self;
  v21.super_class = (Class)ExtensionsPrimaryDetailsView;
  -[NibView contentViewDidLoad](&v21, "contentViewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView titleLabel](self, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v9, &stru_1011E7BB8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView subtitleLabel](self, "subtitleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v10, &stru_1011E7A78);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setLineBreakMode:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView titleLabel](self, "titleLabel"));
  objc_msgSend(v12, "setNumberOfLines:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v13, "setLineBreakMode:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "setNumberOfLines:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v15, "setLineBreakMode:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v16, "setNumberOfLines:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "updateLayout", UIContentSizeCategoryDidChangeNotification, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView heightAnchor](self, "heightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToConstant:", 147.0));
  -[ExtensionsPrimaryDetailsView setHeightConstraint:](self, "setHeightConstraint:", v19);

  -[ExtensionsPrimaryDetailsView _updateTertiaryLabelContent](self, "_updateTertiaryLabelContent");
  heightConstraint = self->_heightConstraint;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &heightConstraint, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)configureWithActionButtons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v4 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedSubviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v11)
  {
    v12 = v11;
    v34 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v34)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
        +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v15, &stru_1011E7C18);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 50.0));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v17, &stru_1011E7C18, 50.0));
        v43 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
        objc_msgSend(v20, "addArrangedSubview:", v14);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v12);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackViewBottomConstraint](self, "actionButtonStackViewBottomConstraint"));
  v22 = objc_msgSend(v21, "isActive");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "arrangedSubviews"));
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    if ((v22 & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackViewHeightConstraint](self, "actionButtonStackViewHeightConstraint"));
      objc_msgSend(v26, "setConstant:", 40.0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackViewBottomConstraint](self, "actionButtonStackViewBottomConstraint"));
      objc_msgSend(v27, "setActive:", 1);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView heightConstraint](self, "heightConstraint"));
      v29 = v28;
      v30 = 147.0;
LABEL_20:
      objc_msgSend(v28, "setConstant:", v30);

      -[ExtensionsPrimaryDetailsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
  else if (v22)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackViewHeightConstraint](self, "actionButtonStackViewHeightConstraint"));
    objc_msgSend(v31, "setConstant:", 0.0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackViewBottomConstraint](self, "actionButtonStackViewBottomConstraint"));
    objc_msgSend(v32, "setActive:", 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView heightConstraint](self, "heightConstraint"));
    v29 = v28;
    v30 = 100.0;
    goto LABEL_20;
  }
  -[ExtensionsPrimaryDetailsView updateLayout](self, "updateLayout");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionsPrimaryDetailsView;
  -[ExtensionsPrimaryDetailsView layoutSubviews](&v3, "layoutSubviews");
  -[ExtensionsPrimaryDetailsView updateLayout](self, "updateLayout");
}

- (id)_buttonFont
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_actionButtonStackView, "arrangedSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = objc_opt_class(UIButton);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_actionButtonStackView, "arrangedSubviews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)updateLayout
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrangedSubviews"));
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    -[ExtensionsPrimaryDetailsView frame](self, "frame");
    if (floor(v5) <= 320.0)
    {

LABEL_9:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
      v12 = v11;
      v13 = 1;
      goto LABEL_10;
    }
  }
  v6 = objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView _buttonFont](self, "_buttonFont"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView _buttonFont](self, "_buttonFont"));
    objc_msgSend(v8, "pointSize");
    v10 = v9;

    if (v10 > 21.0)
      goto LABEL_9;
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView actionButtonStackView](self, "actionButtonStackView"));
  v12 = v11;
  v13 = 0;
LABEL_10:
  objc_msgSend(v11, "setAxis:", v13);

  -[ExtensionsPrimaryDetailsView _updateTertiaryLabelContent](self, "_updateTertiaryLabelContent");
}

- (void)setTertiaryText:(id)a3 badge:(id)a4
{
  RidesharingSpecialPricingBadge *v6;
  NSString *v7;
  NSString *tertiaryText;
  RidesharingSpecialPricingBadge *badge;

  v6 = (RidesharingSpecialPricingBadge *)a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  tertiaryText = self->_tertiaryText;
  self->_tertiaryText = v7;

  badge = self->_badge;
  self->_badge = v6;

  -[ExtensionsPrimaryDetailsView _updateTertiaryLabelContent](self, "_updateTertiaryLabelContent");
}

- (void)_updateTertiaryLabelContent
{
  void *v3;
  id v4;
  const __CFString *tertiaryText;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSAttributedStringKey v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
  v4 = objc_alloc((Class)NSAttributedString);
  if (self->_tertiaryText)
    tertiaryText = (const __CFString *)self->_tertiaryText;
  else
    tertiaryText = &stru_1011EB268;
  v10 = NSFontAttributeName;
  v11 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v7 = objc_msgSend(v4, "initWithString:attributes:", tertiaryText, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_attributedStringByAppendingRidesharingSpecialPricingBadge:representativeContentFont:", self->_badge, v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPrimaryDetailsView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v9, "setAttributedText:", v8);

}

- (UIImageView)appIconImageView
{
  return self->_appIconImageView;
}

- (void)setAppIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_appIconImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (UIStackView)actionButtonStackView
{
  return self->_actionButtonStackView;
}

- (void)setActionButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonStackView, a3);
}

- (NSLayoutConstraint)actionButtonStackViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_actionButtonStackViewBottomConstraint);
}

- (void)setActionButtonStackViewBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_actionButtonStackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)actionButtonStackViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_actionButtonStackViewHeightConstraint);
}

- (void)setActionButtonStackViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_actionButtonStackViewHeightConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_actionButtonStackViewHeightConstraint);
  objc_destroyWeak((id *)&self->_actionButtonStackViewBottomConstraint);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
}

@end
