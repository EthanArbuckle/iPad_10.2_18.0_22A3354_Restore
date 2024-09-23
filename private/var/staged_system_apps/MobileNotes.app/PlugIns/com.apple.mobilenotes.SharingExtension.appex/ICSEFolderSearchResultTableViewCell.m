@implementation ICSEFolderSearchResultTableViewCell

- (void)awakeFromNib
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  -[ICSEFolderSearchResultTableViewCell awakeFromNib](&v7, "awakeFromNib");
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  else if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  }
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v5, "setTintColor:", v4);

  -[ICSEFolderSearchResultTableViewCell updateFonts](self, "updateFonts");
  -[ICSEFolderSearchResultTableViewCell setAccessoryType:](self, "setAccessoryType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  -[ICSEFolderSearchResultTableViewCell dealloc](&v4, "dealloc");
}

- (void)setItem:(id)a3
{
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
  unsigned int v16;
  __CFString *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  if (objc_msgSend(v19, "isSelectable"))
    v5 = 1.0;
  else
    v5 = 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v6, "setAlpha:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v7, "setAlpha:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v8, "setAlpha:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "folder"));
  if (!v9)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "-[ICSEFolderSearchResultTableViewCell setItem:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "systemImageName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_largeSystemImageNamed:](UIImage, "ic_largeSystemImageNamed:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v12, "setImage:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v13, "setContentMode:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = -[ICSEFolderSearchResultTableViewCell showAccountName](self, "showAccountName");
  if (v16)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountName"));
  }
  else
  {
    v17 = &stru_1000DAF38;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v18, "setText:", v17);

  if (v16)
  {

  }
  objc_msgSend(v19, "seperatorInsets");
  -[ICSEFolderSearchResultTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  -[ICSEFolderSearchResultTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", 1);

}

- (void)contentSizeCategoryChanged:(id)a3
{
  -[ICSEFolderSearchResultTableViewCell updateFonts](self, "updateFonts", a3);
  -[ICSEFolderSearchResultTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[ICSEFolderSearchResultTableViewCell setNeedsLayout](self, "setNeedsLayout");
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
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell defaultConstraints](self, "defaultConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell defaultConstraints](self, "defaultConstraints"));
  }
  v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderIconView](self, "folderIconView"));
  objc_msgSend(v7, "setHidden:", ICAccessibilityAccessibilityLargerTextSizesEnabled(v7, v8));

  v9.receiver = self;
  v9.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  -[ICSEFolderSearchResultTableViewCell updateConstraints](&v9, "updateConstraints");
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v3, "_scaledValueForValue:", 17.0);
  v5 = floor(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v5, UIFontWeightMedium));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_fontWithSingleLineA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell folderTitleLabel](self, "folderTitleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_fontWithSingleLineA"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v11, "setFont:", v10);

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(v12, v13))
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v16 = (id)v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderSearchResultTableViewCell accountTitleLabel](self, "accountTitleLabel"));
  objc_msgSend(v15, "setTextColor:", v16);

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

- (UILabel)accountTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_accountTitleLabel);
}

- (void)setAccountTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_accountTitleLabel, a3);
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
  objc_destroyWeak((id *)&self->_accountTitleLabel);
  objc_destroyWeak((id *)&self->_folderTitleLabel);
  objc_destroyWeak((id *)&self->_folderIconView);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
