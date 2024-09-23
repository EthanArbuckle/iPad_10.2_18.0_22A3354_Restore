@implementation ICSETableViewCell

- (void)awakeFromNib
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];

  v51.receiver = self;
  v51.super_class = (Class)ICSETableViewCell;
  -[ICSETableViewCell awakeFromNib](&v51, "awakeFromNib");
  if (qword_1000ED6C8 != -1)
    dispatch_once(&qword_1000ED6C8, &stru_1000D5BC0);
  v3 = *(double *)&qword_1000ED6C0;
  -[ICSETableViewCell layoutMargins](self, "layoutMargins");
  v5 = v3 - v4;
  -[ICSETableViewCell layoutMargins](self, "layoutMargins");
  v7 = v5 - v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconViewContainerMinHeightConstraint](self, "iconViewContainerMinHeightConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ICSETableViewCell setBackgroundColor:](self, "setBackgroundColor:", v9);

    -[ICSETableViewCell setBackgroundView:](self, "setBackgroundView:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    -[ICSETableViewCell setBackgroundColor:](self, "setBackgroundColor:", v10);

    -[ICSETableViewCell setBackgroundView:](self, "setBackgroundView:", 0);
    v11 = objc_alloc_init((Class)UIView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintedSelectionColor](UIColor, "ICTintedSelectionColor"));
    objc_msgSend(v11, "setBackgroundColor:", v12);

    -[ICSETableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v11);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[ICSETableViewCell setStoredConstraintPriorities:](self, "setStoredConstraintPriorities:", v13);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell defaultConstraintsForRegularTextSizes](self, "defaultConstraintsForRegularTextSizes", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "priority");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell storedConstraintPriorities](self, "storedConstraintPriorities"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v16);
  }

  v23 = objc_alloc_init((Class)UIView);
  -[ICSETableViewCell setExpandCollapseHitView:](self, "setExpandCollapseHitView:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell expandCollapseHitView](self, "expandCollapseHitView"));
  -[ICSETableViewCell addSubview:](self, "addSubview:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell expandCollapseHitView](self, "expandCollapseHitView"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "setUserInteractionEnabled:", 0);
  v26 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "expandCollapseTapped:");
  objc_msgSend(v25, "addGestureRecognizer:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  objc_msgSend(v27, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  objc_msgSend(v27, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell topAnchor](self, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  objc_msgSend(v27, "addObject:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell bottomAnchor](self, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  objc_msgSend(v27, "addObject:", v40);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v42, "setTextColor:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v44, "setTextColor:", v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v46, "setTintColor:", v45);

}

- (void)prepareForReuse
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICSETableViewCell;
  -[ICSETableViewCell prepareForReuse](&v15, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v4, "setHidden:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v6, "setAlpha:", 1.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v7, "setAlpha:", 1.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v13, "setTintColor:", v12);

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    -[ICSETableViewCell setBackgroundColor:](self, "setBackgroundColor:", v14);

  }
  -[ICSETableViewCell setCollapsible:](self, "setCollapsible:", 0);
  -[ICSETableViewCell setCollapsed:](self, "setCollapsed:", 0);
}

- (void)setTableViewItem:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_tableViewItem, a3);
  v5 = a3;
  -[ICSETableViewCell setUpForTableViewItem:](self, "setUpForTableViewItem:", v5);

}

- (void)setUpForTableViewItem:(id)a3
{
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
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_fontWithSingleLineA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_fontWithSingleLineA"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "secondaryTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "image"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v15, "setImage:", v14);

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0
    && objc_msgSend(v37, "isInFolderList"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
    objc_msgSend(v17, "setTintColor:", v16);

  }
  if ((objc_msgSend(v37, "isInFolderList") & 1) != 0
    || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folder")), v18, v18))
  {
    v19 = 34.0;
  }
  else
  {
    v19 = 22.0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLeadingMargin](self, "titleLeadingMargin"));
  objc_msgSend(v20, "setConstant:", v19);

  if ((objc_msgSend(v37, "isAccountHeader") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folderListItem"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folderListItem"));
      v23 = (char *)objc_msgSend(v22, "level") - 1;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLeadingMargin](self, "titleLeadingMargin"));
      objc_msgSend(v24, "setConstant:", (double)(unint64_t)v23 * 33.0 + 34.0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconViewLeadingConstraint](self, "iconViewLeadingConstraint"));
      objc_msgSend(v25, "setConstant:", (double)(unint64_t)v23 * 33.0 + -5.0);

    }
  }
  if ((objc_msgSend(v37, "isAccountPicker") & 1) != 0)
    goto LABEL_11;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folder"));
  if (v26)
  {

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "account"));

    if (!v27)
    {
LABEL_11:
      -[ICSETableViewCell setCollapsible:](self, "setCollapsible:", 0);
      goto LABEL_17;
    }
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folderListItem"));
  -[ICSETableViewCell setCollapsible:](self, "setCollapsible:", objc_msgSend(v28, "isCollapsible"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folderListItem"));
  -[ICSETableViewCell setCollapsed:](self, "setCollapsed:", objc_msgSend(v29, "isCollapsed"));

LABEL_17:
  if (objc_msgSend(v37, "isHeader"))
  {
    -[ICSETableViewCell setUpForHeaderItem:](self, "setUpForHeaderItem:", v37);
  }
  else
  {
    if (objc_msgSend(v37, "isSelectable"))
      v30 = 1.0;
    else
      v30 = 0.5;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v31, "setAlpha:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
    objc_msgSend(v32, "setAlpha:", v30);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
    objc_msgSend(v33, "setAlpha:", v30);

    if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0
      && objc_msgSend(v37, "isChecked"))
    {
      if (UIAccessibilityDarkerSystemColorsEnabled())
        v34 = objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
      else
        v34 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
      v35 = (void *)v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
      objc_msgSend(v36, "setTintColor:", v35);

    }
  }
  -[ICSETableViewCell updateAccessoryView](self, "updateAccessoryView");

}

- (UIImageView)accountAccessoryImageView
{
  UIImageView *accountAccessoryImageView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;

  accountAccessoryImageView = self->_accountAccessoryImageView;
  if (!accountAccessoryImageView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageView ic_defaultListAccessoryViewImage](UIImageView, "ic_defaultListAccessoryViewImage"));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_accountAccessoryImageView;
    self->_accountAccessoryImageView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](self->_disclosureAccessoryImageView, "setTintColor:", v8);

    -[UIImageView setContentMode:](self->_accountAccessoryImageView, "setContentMode:", 4);
    accountAccessoryImageView = self->_accountAccessoryImageView;
  }
  return accountAccessoryImageView;
}

- (UIImageView)disclosureAccessoryImageView
{
  UIImageView *disclosureAccessoryImageView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;

  disclosureAccessoryImageView = self->_disclosureAccessoryImageView;
  if (!disclosureAccessoryImageView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageView ic_defaultListAccessoryViewImage](UIImageView, "ic_defaultListAccessoryViewImage"));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_disclosureAccessoryImageView;
    self->_disclosureAccessoryImageView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](self->_disclosureAccessoryImageView, "setTintColor:", v8);

    -[UIImageView setContentMode:](self->_disclosureAccessoryImageView, "setContentMode:", 4);
    disclosureAccessoryImageView = self->_disclosureAccessoryImageView;
  }
  return disclosureAccessoryImageView;
}

- (UIImageView)expansionAccessoryImageView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (UIAccessibilityShouldDifferentiateWithoutColor())
    v3 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accessibilityExpansionAccessoryImageView](self, "accessibilityExpansionAccessoryImageView"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell defaultExpansionAccessoryImageView](self, "defaultExpansionAccessoryImageView"));
  v4 = (void *)v3;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  v6 = (void *)v5;
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(v4, "setContentMode:", 4);
  return (UIImageView *)v4;
}

- (UIImageView)defaultExpansionAccessoryImageView
{
  UIImageView *defaultExpansionAccessoryImageView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  defaultExpansionAccessoryImageView = self->_defaultExpansionAccessoryImageView;
  if (!defaultExpansionAccessoryImageView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageView ic_defaultListAccessoryViewImage](UIImageView, "ic_defaultListAccessoryViewImage"));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_defaultExpansionAccessoryImageView;
    self->_defaultExpansionAccessoryImageView = v6;

    defaultExpansionAccessoryImageView = self->_defaultExpansionAccessoryImageView;
  }
  return defaultExpansionAccessoryImageView;
}

- (UIImageView)accessibilityExpansionAccessoryImageView
{
  UIImageView *accessibilityExpansionAccessoryImageView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  accessibilityExpansionAccessoryImageView = self->_accessibilityExpansionAccessoryImageView;
  if (!accessibilityExpansionAccessoryImageView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageView ic_accessibilityListAccessoryViewImage](UIImageView, "ic_accessibilityListAccessoryViewImage"));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_accessibilityExpansionAccessoryImageView;
    self->_accessibilityExpansionAccessoryImageView = v6;

    accessibilityExpansionAccessoryImageView = self->_accessibilityExpansionAccessoryImageView;
  }
  return accessibilityExpansionAccessoryImageView;
}

- (void)updateAccessoryView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));

  if (v4)
  {
    -[ICSETableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell expandCollapseHitView](self, "expandCollapseHitView"));
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
    if ((objc_msgSend(v5, "isHeader") & 1) != 0)
      v6 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accountAccessoryImageView](self, "accountAccessoryImageView"));
    else
      v6 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell expansionAccessoryImageView](self, "expansionAccessoryImageView"));
    v9 = (id)v6;

    if (-[ICSETableViewCell isCollapsible](self, "isCollapsible"))
    {
      -[ICSETableViewCell setAccessoryView:](self, "setAccessoryView:", v9);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell disclosureAccessoryImageView](self, "disclosureAccessoryImageView"));
      -[ICSETableViewCell setAccessoryView:](self, "setAccessoryView:", v7);

    }
    -[ICSETableViewCell updateCollapsedDisclosure](self, "updateCollapsedDisclosure");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell expandCollapseHitView](self, "expandCollapseHitView"));
    objc_msgSend(v8, "setUserInteractionEnabled:", -[ICSETableViewCell isCollapsible](self, "isCollapsible"));

  }
}

- (void)setCollapsible:(BOOL)a3
{
  if (self->_collapsible != a3)
  {
    self->_collapsible = a3;
    -[ICSETableViewCell updateAccessoryView](self, "updateAccessoryView");
  }
}

- (void)updateCollapsedDisclosure
{
  void *v3;
  unsigned int v4;
  __int128 v5;
  double v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accessoryView](self, "accessoryView"));

  if (v3)
  {
    v4 = -[ICSETableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v10.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v10.c = v5;
    *(_OWORD *)&v10.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (-[ICSETableViewCell isCollapsible](self, "isCollapsible")
      && !-[ICSETableViewCell isCollapsed](self, "isCollapsed"))
    {
      v6 = 1.57079633;
      if (v4)
        v6 = -1.57079633;
      CGAffineTransformMakeRotation(&v10, v6);
    }
    v9 = v10;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accessoryView](self, "accessoryView"));
    v8 = v9;
    objc_msgSend(v7, "setTransform:", &v8);

  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[ICSETableViewCell updateCollapsedDisclosure](self, "updateCollapsedDisclosure");
  }
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  if (a4)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000748C;
    v4[3] = &unk_1000D5BE8;
    v4[4] = self;
    v5 = a3;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v4, 0, 0.3, 0.0, 1.0, 0.0);
  }
  else
  {
    -[ICSETableViewCell setCollapsed:](self, "setCollapsed:", a3);
  }
}

- (void)expandCollapseTapped:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell delegate](self, "delegate", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell delegate](self, "delegate"));
    objc_msgSend(v5, "tableViewCell:setCollapsed:", self, -[ICSETableViewCell isCollapsed](self, "isCollapsed") ^ 1);

  }
  -[ICSETableViewCell setCollapsed:animated:](self, "setCollapsed:animated:", -[ICSETableViewCell isCollapsed](self, "isCollapsed") ^ 1, 1);
}

- (void)setUpForHeaderItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  id v31;

  v4 = a3;
  v6 = objc_opt_class(ICSETableViewHeaderItem, v5);
  v7 = ICDynamicCast(v6, v4);
  v31 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 13.0, UIFontWeightRegular));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scaledFontForFont:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_fontWithSingleLineA"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setFont:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setTextColor:", v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v17, "setFont:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v18, "setTextColor:", v8);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "image"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v20, "setImage:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v21, "setTintColor:", v8);

  if (objc_msgSend(v31, "headerType") == (id)2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLeadingMargin](self, "titleLeadingMargin"));
    objc_msgSend(v22, "setConstant:", 7.0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ic_fontWithSingleLineA"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v25, "setFont:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ic_fontWithSingleLineA"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
    objc_msgSend(v28, "setFont:", v27);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v31, "headerType") == (id)1)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLeadingMargin](self, "titleLeadingMargin"));
    objc_msgSend(v26, "setConstant:", 0.0);
    goto LABEL_5;
  }
LABEL_6:
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "backgroundColor"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "backgroundColor"));
      -[ICSETableViewCell setBackgroundColor:](self, "setBackgroundColor:", v30);

    }
  }

}

+ (id)newHeaderCell
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loadNibNamed:owner:options:", v5, a1, 0));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v18;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
      v14 = objc_opt_class(a1, v9);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (v15)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICSETableViewCell newHeaderCell]", 1, 0, CFSTR("Unable to load sharing extension header cell view"), (_QWORD)v17);
  v15 = 0;
LABEL_12:
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (_QWORD)v17);
  objc_msgSend(v15, "setNeedsUpdateConstraints");

  return v15;
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell defaultConstraintsForRegularTextSizes](self, "defaultConstraintsForRegularTextSizes"));
    -[ICSETableViewCell disableConstraintsBySettingPriority:](self, "disableConstraintsBySettingPriority:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
    -[ICSETableViewCell disableConstraintsBySettingPriority:](self, "disableConstraintsBySettingPriority:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSETableViewCell defaultConstraintsForRegularTextSizes](self, "defaultConstraintsForRegularTextSizes"));
  }
  v6 = (void *)v4;
  -[ICSETableViewCell enableConstraintsBySettingPriority:](self, "enableConstraintsBySettingPriority:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconView](self, "iconView"));
  objc_msgSend(v7, "setHidden:", ICAccessibilityAccessibilityLargerTextSizesEnabled(v7, v8));

  v9.receiver = self;
  v9.super_class = (Class)ICSETableViewCell;
  -[ICSETableViewCell updateConstraints](&v9, "updateConstraints");
}

- (void)disableConstraintsBySettingPriority:(id)a3
{
  id v3;
  id v4;
  double v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        LODWORD(v5) = 1.0;
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setPriority:", v5);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)enableConstraintsBySettingPriority:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell storedConstraintPriorities](self, "storedConstraintPriorities"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

        if (v12)
          v14 = (uint64_t)objc_msgSend(v12, "integerValue");
        else
          v14 = 999;
        *(float *)&v13 = (float)v14;
        objc_msgSend(v9, "setPriority:", v13);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)defaultConstraintsForRegularTextSizes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconViewBaselineConstraint](self, "iconViewBaselineConstraint"));
  v11[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabelBaselineConstraint](self, "titleLabelBaselineConstraint"));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabelCenterConstraint](self, "titleLabelCenterConstraint"));
  v11[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabelBaselineConstraint](self, "secondaryLabelBaselineConstraint"));
  v11[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabelLeadingConstraint](self, "secondaryLabelLeadingConstraint"));
  v11[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabelCenterVerticallyConstraint](self, "secondaryLabelCenterVerticallyConstraint"));
  v11[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 6));

  return v9;
}

- (id)alternateConstraintsForAXLargerTextSizes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabelTopConstraintForAXLargerTextSizes](self, "titleLabelTopConstraintForAXLargerTextSizes"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell iconViewCenterYConstraintForAXLargerTextSizes](self, "iconViewCenterYConstraintForAXLargerTextSizes"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes](self, "secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabelLeadingConstraintForAXLargerTextSizes](self, "secondaryLabelLeadingConstraintForAXLargerTextSizes"));
  v9[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v4 = objc_msgSend(v3, "isHeader");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = __ICAccessibilityStringForVariablesSentinel;
    v54 = v8;
    v56 = (void *)__ICAccessibilityStringForVariablesSentinel;
    v10 = __ICAccessibilityStringForVariables(1, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "note"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accessibilitySharedViaICloudStringForNote:](self, "accessibilitySharedViaICloudStringForNote:", v16));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folder"));
    if (v5)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "folder"));
      v28 = objc_msgSend(v27, "isSharedViaICloud");

      if (!v28)
      {
        v5 = 0;
        goto LABEL_6;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Shared folder"), &stru_1000DAF38, 0));
    }
  }

LABEL_6:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "note"));
  v19 = objc_msgSend(v18, "isPasswordProtected");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Locked"), &stru_1000DAF38, 0));

  }
  else
  {
    v6 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "note"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "note"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modificationDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ic_briefFormattedDateForAccessibility"));

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell secondaryLabel](self, "secondaryLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "text"));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v9 = __ICAccessibilityStringForVariablesSentinel;
  v58 = v7;
  v59 = __ICAccessibilityStringForVariablesSentinel;
  v54 = v5;
  v56 = v6;
  v30 = __ICAccessibilityStringForVariables(1, v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v30);

LABEL_16:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem", v54, v56));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "folder"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "folder"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "parent"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "title"));
    v37 = objc_msgSend(v36, "length");

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("subfolder of %@"), &stru_1000DAF38, 0));

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "parent"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "title"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v39, v41));

      v55 = v42;
      v57 = v9;
      v43 = __ICAccessibilityStringForVariables(1, v11);
      v44 = objc_claimAutoreleasedReturnValue(v43);

      v11 = (void *)v44;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "visibleNoteContainerChildren", v55, v57, v58, v59));
    v46 = objc_msgSend(v45, "count");

    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("NUM_SUBFOLDERS_%lu"), &stru_1000DAF38, 0));

      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "visibleNoteContainerChildren"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v48, objc_msgSend(v49, "count")));

      v51 = __ICAccessibilityStringForVariables(1, v11);
      v52 = objc_claimAutoreleasedReturnValue(v51);

      v11 = (void *)v52;
    }

  }
  return v11;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v8[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell accessibilityLabel](self, "accessibilityLabel"));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  UIAccessibilityTraits v7;
  void *v8;
  unsigned int v9;
  UIAccessibilityTraits v10;
  void *v11;
  unsigned int v12;
  UIAccessibilityTraits v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICSETableViewCell;
  v3 = -[ICSETableViewCell accessibilityTraits](&v15, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  if (objc_msgSend(v4, "isSelectable"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
    v6 = objc_msgSend(v5, "isHeader");

    v7 = UIAccessibilityTraitNotEnabled;
    if (v6)
      v7 = 0;
    v3 |= v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v9 = objc_msgSend(v8, "isChecked");

  if (v9)
    v10 = UIAccessibilityTraitSelected;
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewCell tableViewItem](self, "tableViewItem"));
  v12 = objc_msgSend(v11, "isHeader");

  v13 = UIAccessibilityTraitHeader;
  if (!v12)
    v13 = 0;
  return v10 | v3 | v13;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICSETableViewCell;
  v3 = -[ICSETableViewCell accessibilityCustomActions](&v14, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[ICSETableViewCell isCollapsible](self, "isCollapsible"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    if (!v5)
      v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
    v6 = -[ICSETableViewCell isCollapsed](self, "isCollapsed");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
      v9 = CFSTR("Expand");
    else
      v9 = CFSTR("Collapse");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1000DAF38, 0));

    v11 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v10, self, "expandCollapseTapped:");
    objc_msgSend(v5, "addObject:", v11);
    v12 = objc_msgSend(v5, "copy");

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)accessibilityHint
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (-[ICSETableViewCell isCollapsible](self, "isCollapsible"))
  {
    v3 = -[ICSETableViewCell isCollapsed](self, "isCollapsed");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    if (v3)
      v6 = CFSTR("Use the actions rotor to expand folder");
    else
      v6 = CFSTR("Use the actions rotor to collapse folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1000DAF38, 0));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (ICSETableViewItem)tableViewItem
{
  return self->_tableViewItem;
}

- (ICSETableViewCellDelegate)delegate
{
  return (ICSETableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAccessibilityExpansionAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityExpansionAccessoryImageView, a3);
}

- (void)setAccountAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accountAccessoryImageView, a3);
}

- (void)setDefaultExpansionAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultExpansionAccessoryImageView, a3);
}

- (void)setDisclosureAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureAccessoryImageView, a3);
}

- (void)setExpansionAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_expansionAccessoryImageView, a3);
}

- (UIView)expandCollapseHitView
{
  return self->_expandCollapseHitView;
}

- (void)setExpandCollapseHitView:(id)a3
{
  objc_storeStrong((id *)&self->_expandCollapseHitView, a3);
}

- (BOOL)isCollapsible
{
  return self->_collapsible;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_secondaryLabel);
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryLabel, a3);
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (NSLayoutConstraint)titleLeadingMargin
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_titleLeadingMargin);
}

- (void)setTitleLeadingMargin:(id)a3
{
  objc_storeWeak((id *)&self->_titleLeadingMargin, a3);
}

- (NSLayoutConstraint)iconViewContainerMinHeightConstraint
{
  return self->_iconViewContainerMinHeightConstraint;
}

- (void)setIconViewContainerMinHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewContainerMinHeightConstraint, a3);
}

- (NSLayoutConstraint)iconViewLeadingConstraint
{
  return self->_iconViewLeadingConstraint;
}

- (void)setIconViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)iconViewBaselineConstraint
{
  return self->_iconViewBaselineConstraint;
}

- (void)setIconViewBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewBaselineConstraint, a3);
}

- (NSLayoutConstraint)titleLabelBaselineConstraint
{
  return self->_titleLabelBaselineConstraint;
}

- (void)setTitleLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)titleLabelCenterConstraint
{
  return self->_titleLabelCenterConstraint;
}

- (void)setTitleLabelCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelCenterConstraint, a3);
}

- (NSLayoutConstraint)secondaryLabelBaselineConstraint
{
  return self->_secondaryLabelBaselineConstraint;
}

- (void)setSecondaryLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)secondaryLabelCenterVerticallyConstraint
{
  return self->_secondaryLabelCenterVerticallyConstraint;
}

- (void)setSecondaryLabelCenterVerticallyConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelCenterVerticallyConstraint, a3);
}

- (NSLayoutConstraint)secondaryLabelLeadingConstraint
{
  return self->_secondaryLabelLeadingConstraint;
}

- (void)setSecondaryLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTopConstraintForAXLargerTextSizes
{
  return self->_titleLabelTopConstraintForAXLargerTextSizes;
}

- (void)setTitleLabelTopConstraintForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraintForAXLargerTextSizes, a3);
}

- (NSLayoutConstraint)iconViewCenterYConstraintForAXLargerTextSizes
{
  return self->_iconViewCenterYConstraintForAXLargerTextSizes;
}

- (void)setIconViewCenterYConstraintForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewCenterYConstraintForAXLargerTextSizes, a3);
}

- (NSLayoutConstraint)secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes
{
  return self->_secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes;
}

- (void)setSecondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes, a3);
}

- (NSLayoutConstraint)secondaryLabelLeadingConstraintForAXLargerTextSizes
{
  return self->_secondaryLabelLeadingConstraintForAXLargerTextSizes;
}

- (void)setSecondaryLabelLeadingConstraintForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraintForAXLargerTextSizes, a3);
}

- (NSMutableDictionary)storedConstraintPriorities
{
  return self->_storedConstraintPriorities;
}

- (void)setStoredConstraintPriorities:(id)a3
{
  objc_storeStrong((id *)&self->_storedConstraintPriorities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedConstraintPriorities, 0);
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_iconViewCenterYConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelCenterVerticallyConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelCenterConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewContainerMinHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_titleLeadingMargin);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_secondaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_expandCollapseHitView, 0);
  objc_storeStrong((id *)&self->_expansionAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_disclosureAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_defaultExpansionAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_accountAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_accessibilityExpansionAccessoryImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewItem, 0);
}

@end
