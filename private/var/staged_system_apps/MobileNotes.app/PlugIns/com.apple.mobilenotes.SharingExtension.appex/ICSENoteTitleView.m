@implementation ICSENoteTitleView

- (void)awakeFromNib
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICSENoteTitleView;
  -[ICSENoteTitleView awakeFromNib](&v17, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
  -[ICSENoteTitleView setNote:folder:hasMultipleAccounts:](self, "setNote:folder:hasMultipleAccounts:", v3, v4, 0);

  -[ICSENoteTitleView updateFonts](self, "updateFonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView accountLabel](self, "accountLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView noteLabel](self, "noteLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderLabel](self, "folderLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView arrowImageView](self, "arrowImageView"));
  objc_msgSend(v12, "setTintColor:", v11);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  else if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  }
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIcon](self, "folderIcon"));
  objc_msgSend(v15, "setTintColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSENoteTitleView;
  -[ICSENoteTitleView dealloc](&v4, "dealloc");
}

- (void)setNote:(id)a3 folder:(id)a4 hasMultipleAccounts:(BOOL)a5
{
  ICNote *v8;
  ICFolder *v9;
  ICNote *note;
  ICNote *v11;
  ICFolder *folder;

  v8 = (ICNote *)a3;
  v9 = (ICFolder *)a4;
  note = self->_note;
  self->_note = v8;
  v11 = v8;

  folder = self->_folder;
  self->_folder = v9;

  self->_hasMultipleAccounts = a5;
  -[ICSENoteTitleView setupLabelsAndIcons](self, "setupLabelsAndIcons");
}

- (void)setupLabelsAndIcons
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  int v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView note](self, "note"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView note](self, "note"));
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView note](self, "note"));
    v6 = 0;
    v7 = 0;
    v8 = 1144766464;
    goto LABEL_11;
  }
  v31 = (id)objc_claimAutoreleasedReturnValue(+[ICNote defaultTitleForEmptyNote](ICNote, "defaultTitleForEmptyNote"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
  if (!v7)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
  v10 = objc_msgSend(v9, "isDefaultFolderForAccount");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedTitle"));

    if (v7)
    {
      v6 = objc_msgSend(v7, "length") != 0;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  v7 = 0;
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));

  if (!v12)
  {
    v8 = 1148043264;
LABEL_14:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "managedObjectContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v16));

    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedName"));
    goto LABEL_15;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
  v8 = 1148043264;
LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedName"));

  if (!v14)
    goto LABEL_14;
LABEL_15:
  if (!-[ICSENoteTitleView hasMultipleAccounts](self, "hasMultipleAccounts") || !v14)
  {

    v14 = &stru_1000DAF38;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folder](self, "folder"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "systemImageName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIcon](self, "folderIcon"));
  objc_msgSend(v21, "setImage:", v20);

  -[ICSENoteTitleView setFolderLabelVisible:](self, "setFolderLabelVisible:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView noteLabel](self, "noteLabel"));
  objc_msgSend(v22, "setText:", v31);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView noteLabel](self, "noteLabel"));
  LODWORD(v24) = v8;
  objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView accountLabel](self, "accountLabel"));
  objc_msgSend(v25, "setText:", v14);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderLabel](self, "folderLabel"));
  objc_msgSend(v26, "setText:", v7);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView arrowImageView](self, "arrowImageView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "image"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageFlippedForRightToLeftLayoutDirection"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView arrowImageView](self, "arrowImageView"));
  objc_msgSend(v30, "setImage:", v29);

}

- (void)setFolderLabelVisible:(BOOL)a3
{
  _BOOL4 v3;
  float v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  id v21;

  v3 = a3;
  v5 = 1.0;
  if (a3)
    v6 = 1.0;
  else
    v6 = 999.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderLabelZeroWidthConstraint](self, "folderLabelZeroWidthConstraint"));
  *(float *)&v8 = v6;
  objc_msgSend(v7, "setPriority:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView dashLabelZeroWidthConstraint](self, "dashLabelZeroWidthConstraint"));
  *(float *)&v10 = v6;
  objc_msgSend(v9, "setPriority:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIconZeroWidthConstraint](self, "folderIconZeroWidthConstraint"));
  *(float *)&v12 = v6;
  objc_msgSend(v11, "setPriority:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIconSpacingZeroWidthConstraint](self, "folderIconSpacingZeroWidthConstraint"));
  *(float *)&v14 = v6;
  objc_msgSend(v13, "setPriority:", v14);

  if (!v3)
  {
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled(v15, v16))
      v5 = 999.0;
    else
      v5 = 1.0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIconZeroHeightConstraint](self, "folderIconZeroHeightConstraint"));
  *(float *)&v18 = v5;
  objc_msgSend(v17, "setPriority:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderLabelZeroHeightConstraint](self, "folderLabelZeroHeightConstraint"));
  *(float *)&v20 = v5;
  objc_msgSend(v19, "setPriority:", v20);

  v21 = (id)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderIcon](self, "folderIcon"));
  objc_msgSend(v21, "setHidden:", !v3);

}

- (NSDictionary)itemTitleAttributes
{
  NSDictionary *itemTitleAttributes;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  NSAttributedStringKey v8;
  void *v9;

  itemTitleAttributes = self->_itemTitleAttributes;
  if (!itemTitleAttributes)
  {
    v8 = NSForegroundColorAttributeName;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
    v9 = v4;
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v6 = self->_itemTitleAttributes;
    self->_itemTitleAttributes = v5;

    itemTitleAttributes = self->_itemTitleAttributes;
  }
  return itemTitleAttributes;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[6];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSENoteTitleView;
  -[ICSENoteTitleView setHighlighted:](&v7, "setHighlighted:");
  v5 = 0.3;
  if (!v3)
    v5 = 1.0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000140CC;
  v6[3] = &unk_1000D6160;
  v6[4] = self;
  *(double *)&v6[5] = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.15);
}

+ (id)newNoteTitleView
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
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICSENoteTitleView newNoteTitleView]", 1, 0, CFSTR("Unable to load title view"), (_QWORD)v17);
  v15 = 0;
LABEL_12:
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (_QWORD)v17);

  return v15;
}

- (void)contentSizeCategoryChanged:(id)a3
{
  -[ICSENoteTitleView updateFonts](self, "updateFonts", a3);
  -[ICSENoteTitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[ICSENoteTitleView setNeedsLayout](self, "setNeedsLayout");
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
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v3, "_scaledValueForValue:", 17.0);
  v5 = floor(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v5, UIFontWeightRegular));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_fontWithSingleLineA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView noteLabel](self, "noteLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v5, UIFontWeightRegular));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_fontWithSingleLineA"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView folderLabel](self, "folderLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v5, UIFontWeightRegular));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_fontWithSingleLineA"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView dashLabel](self, "dashLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_fontWithSingleLineA"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView accountLabel](self, "accountLabel"));
  objc_msgSend(v17, "setFont:", v16);

  v19 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView accountLabel](self, "accountLabel"));
  objc_msgSend(v18, "setTextColor:", v19);

}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView defaultConstraints](self, "defaultConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView defaultConstraints](self, "defaultConstraints"));
  }
  v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

  v7.receiver = self;
  v7.super_class = (Class)ICSENoteTitleView;
  -[ICSENoteTitleView updateConstraints](&v7, "updateConstraints");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView noteLabel](self, "noteLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSENoteTitleView accountLabel](self, "accountLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v6 = __ICAccessibilityStringForVariables(1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (BOOL)hasMultipleAccounts
{
  return self->_hasMultipleAccounts;
}

- (void)setHasMultipleAccounts:(BOOL)a3
{
  self->_hasMultipleAccounts = a3;
}

- (UILabel)accountLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_accountLabel);
}

- (void)setAccountLabel:(id)a3
{
  objc_storeWeak((id *)&self->_accountLabel, a3);
}

- (UILabel)noteLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_noteLabel);
}

- (void)setNoteLabel:(id)a3
{
  objc_storeWeak((id *)&self->_noteLabel, a3);
}

- (UILabel)dashLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_dashLabel);
}

- (void)setDashLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dashLabel, a3);
}

- (UILabel)folderLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_folderLabel);
}

- (void)setFolderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_folderLabel, a3);
}

- (UIImageView)folderIcon
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_folderIcon);
}

- (void)setFolderIcon:(id)a3
{
  objc_storeWeak((id *)&self->_folderIcon, a3);
}

- (NSLayoutConstraint)folderLabelZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_folderLabelZeroWidthConstraint);
}

- (void)setFolderLabelZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_folderLabelZeroWidthConstraint, a3);
}

- (NSLayoutConstraint)dashLabelZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_dashLabelZeroWidthConstraint);
}

- (void)setDashLabelZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_dashLabelZeroWidthConstraint, a3);
}

- (NSLayoutConstraint)folderIconZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_folderIconZeroWidthConstraint);
}

- (void)setFolderIconZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_folderIconZeroWidthConstraint, a3);
}

- (NSLayoutConstraint)folderIconSpacingZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_folderIconSpacingZeroWidthConstraint);
}

- (void)setFolderIconSpacingZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_folderIconSpacingZeroWidthConstraint, a3);
}

- (NSLayoutConstraint)folderIconZeroHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_folderIconZeroHeightConstraint);
}

- (void)setFolderIconZeroHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_folderIconZeroHeightConstraint, a3);
}

- (NSLayoutConstraint)folderLabelZeroHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_folderLabelZeroHeightConstraint);
}

- (void)setFolderLabelZeroHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_folderLabelZeroHeightConstraint, a3);
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

- (UIImageView)arrowImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_arrowImageView);
}

- (void)setArrowImageView:(id)a3
{
  objc_storeWeak((id *)&self->_arrowImageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arrowImageView);
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_folderLabelZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_folderIconZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_folderIconSpacingZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderIconZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_dashLabelZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderLabelZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderIcon);
  objc_destroyWeak((id *)&self->_folderLabel);
  objc_destroyWeak((id *)&self->_dashLabel);
  objc_destroyWeak((id *)&self->_noteLabel);
  objc_destroyWeak((id *)&self->_accountLabel);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_itemTitleAttributes, 0);
}

@end
