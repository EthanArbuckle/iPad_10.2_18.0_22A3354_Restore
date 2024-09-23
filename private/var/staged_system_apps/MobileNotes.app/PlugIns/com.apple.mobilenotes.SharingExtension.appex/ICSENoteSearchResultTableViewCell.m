@implementation ICSENoteSearchResultTableViewCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSENoteSearchResultTableViewCell;
  -[ICSENoteSearchResultTableViewCell awakeFromNib](&v6, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v4, "setTintColor:", v3);

  -[ICSENoteSearchResultTableViewCell updateFonts](self, "updateFonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSENoteSearchResultTableViewCell;
  -[ICSENoteSearchResultTableViewCell dealloc](&v4, "dealloc");
}

- (void)setItem:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
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
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "note"));
  if (!v5)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICSENoteSearchResultTableViewCell setItem:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folder"));
  if (!v6)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "-[ICSENoteSearchResultTableViewCell setItem:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "folder");
  if (objc_msgSend(v39, "isSelectable"))
    v7 = 1.0;
  else
    v7 = 0.5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell iconView](self, "iconView"));
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell iconView](self, "iconView"));
  objc_msgSend(v10, "setTintColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "image"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell iconView](self, "iconView"));
  objc_msgSend(v12, "setImage:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell noteTitleLabel](self, "noteTitleLabel"));
  objc_msgSend(v13, "setAlpha:", v7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell noteTitleLabel](self, "noteTitleLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v16, "setAlpha:", v7);

  if (objc_msgSend(v6, "isSharedViaICloud"))
    v17 = CFSTR("folder.badge.person.crop");
  else
    v17 = CFSTR("folder");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_largeSystemImageNamed:](UIImage, "ic_largeSystemImageNamed:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v19, "setImage:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v20, "setContentMode:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v21, "setAlpha:", v7);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v23, "setText:", v22);

  LODWORD(v23) = -[ICSENoteSearchResultTableViewCell showAccountName](self, "showAccountName");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  v25 = v24;
  if ((_DWORD)v23)
  {
    objc_msgSend(v24, "setAlpha:", v7);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accountName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
    objc_msgSend(v28, "setText:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dashContainerZeroWidthConstraint](self, "dashContainerZeroWidthConstraint"));
    LODWORD(v30) = 1.0;
    objc_msgSend(v29, "setPriority:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dashLabel](self, "dashLabel"));
    objc_msgSend(v31, "setAlpha:", v7);
  }
  else
  {
    objc_msgSend(v24, "setText:", &stru_1000DAF38);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dashContainerZeroWidthConstraint](self, "dashContainerZeroWidthConstraint"));
    LODWORD(v32) = 1148829696;
    objc_msgSend(v31, "setPriority:", v32);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v33, "setAlpha:", v7);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "secondaryTitle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v35, "setText:", v34);

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0
    && objc_msgSend(v39, "isChecked"))
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
      v36 = objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
    else
      v36 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v37 = (void *)v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell iconView](self, "iconView"));
    objc_msgSend(v38, "setTintColor:", v37);

  }
  objc_msgSend(v39, "seperatorInsets");
  -[ICSENoteSearchResultTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  -[ICSENoteSearchResultTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", 1);

}

- (void)contentSizeCategoryChanged:(id)a3
{
  -[ICSENoteSearchResultTableViewCell updateFonts](self, "updateFonts", a3);
  -[ICSENoteSearchResultTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[ICSENoteSearchResultTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSENoteSearchResultTableViewCell;
  -[ICSENoteSearchResultTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[ICSENoteSearchResultTableViewCell updateConstraints](self, "updateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell defaultConstraints](self, "defaultConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell defaultConstraints](self, "defaultConstraints"));
  }
  v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell iconView](self, "iconView"));
  objc_msgSend(v7, "setHidden:", ICAccessibilityAccessibilityLargerTextSizesEnabled(v7, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v9, "setHidden:", ICAccessibilityAccessibilityLargerTextSizesEnabled(v9, v10));

  v11.receiver = self;
  v11.super_class = (Class)ICSENoteSearchResultTableViewCell;
  -[ICSENoteSearchResultTableViewCell updateConstraints](&v11, "updateConstraints");
}

- (void)updateFonts
{
  void *v3;
  double v4;
  double v5;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v3, "_scaledValueForValue:", 17.0);
  v5 = floor(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v5, UIFontWeightMedium));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_fontWithSingleLineA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell noteTitleLabel](self, "noteTitleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_fontWithSingleLineA"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v13, "setTextColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_fontWithSingleLineA"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dashLabel](self, "dashLabel"));
  objc_msgSend(v16, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dashLabel](self, "dashLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ic_fontWithSingleLineA"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v21, "setFont:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  v25 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v24, "setTextColor:", v25);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  UIAccessibilityTraits v6;
  UIAccessibilityTraits v7;
  void *v8;
  unsigned int v9;
  UIAccessibilityTraits v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICSENoteSearchResultTableViewCell;
  v3 = -[ICSENoteSearchResultTableViewCell accessibilityTraits](&v12, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell item](self, "item"));
  v5 = objc_msgSend(v4, "isSelectable");

  v6 = UIAccessibilityTraitNotEnabled;
  if (v5)
    v6 = 0;
  v7 = v6 | v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell item](self, "item"));
  v9 = objc_msgSend(v8, "isChecked");

  v10 = UIAccessibilityTraitSelected;
  if (!v9)
    v10 = 0;
  return v7 | v10;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell item](self, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));

  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICSENoteSearchResultTableViewCell accessibilityLabel]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_briefFormattedDateForAccessibility"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteSearchResultTableViewCell accessibilitySharedViaICloudStringForNote:](self, "accessibilitySharedViaICloudStringForNote:", v4));
  if ((objc_msgSend(v4, "isSharedViaICloudFolder") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));

  }
  v11 = __ICAccessibilityStringForVariables(1, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (ICSETableViewItem)item
{
  return self->_item;
}

- (BOOL)showAccountName
{
  return self->_showAccountName;
}

- (void)setShowAccountName:(BOOL)a3
{
  self->_showAccountName = a3;
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (UILabel)noteTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_noteTitleLabel);
}

- (void)setNoteTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_noteTitleLabel, a3);
}

- (UIImageView)folderIconView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_folderIconView);
}

- (void)setFolderIconView:(id)a3
{
  objc_storeWeak((id *)&self->_folderIconView, a3);
}

- (UILabel)folderTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_folderTitleLabel);
}

- (void)setFolderTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_folderTitleLabel, a3);
}

- (UILabel)dashLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_dashLabel);
}

- (void)setDashLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dashLabel, a3);
}

- (UILabel)accountTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_accountTitleLabel);
}

- (void)setAccountTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_accountTitleLabel, a3);
}

- (UILabel)dateLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_dateLabel);
}

- (void)setDateLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dateLabel, a3);
}

- (NSLayoutConstraint)dashContainerZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_dashContainerZeroWidthConstraint);
}

- (void)setDashContainerZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_dashContainerZeroWidthConstraint, a3);
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConstraints, a3);
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_dashContainerZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_accountTitleLabel);
  objc_destroyWeak((id *)&self->_dashLabel);
  objc_destroyWeak((id *)&self->_folderTitleLabel);
  objc_destroyWeak((id *)&self->_folderIconView);
  objc_destroyWeak((id *)&self->_noteTitleLabel);
  objc_destroyWeak((id *)&self->_iconView);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
