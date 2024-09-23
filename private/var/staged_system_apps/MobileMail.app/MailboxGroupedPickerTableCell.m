@implementation MailboxGroupedPickerTableCell

- (MailboxGroupedPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  MailboxGroupedPickerTableCell *v7;
  MailboxGroupedPickerTableCell *v8;
  MailboxGroupedPickerTableCell *v9;
  _QWORD v11[4];
  MailboxGroupedPickerTableCell *v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MailboxGroupedPickerTableCell;
  v7 = -[MailboxGroupedPickerTableCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C3D54;
    v11[3] = &unk_10051D9C0;
    v9 = v7;
    v12 = v9;
    -[MailboxGroupedPickerTableCell mf_updateContentConfigurationWithBlock:](v9, "mf_updateContentConfigurationWithBlock:", v11);
    -[MailboxGroupedPickerTableCell setIndentationWidth:](v9, "setIndentationWidth:", 30.0);

  }
  return v8;
}

- (id)_mailboxTextFont
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (+[UIScreen mui_isLargeFormatPad](UIScreen, "mui_isLargeFormatPad"))
    v2 = 0;
  else
    v2 = 2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));

  return v4;
}

- (void)setMailboxType:(int64_t)a3
{
  NSString *v5;
  BOOL IsAccessibilityCategory;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    v10 = 0;
  }
  else
  {
    v7 = sub_1001D6E84();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[MFMailboxUid iconFromBundle:forType:](MFMailboxUid, "iconFromBundle:forType:", v8, a3));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", a3));
  -[MailboxGroupedPickerTableCell _setText:image:](self, "_setText:image:", v9, v10);

}

- (void)_setText:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C4068;
  v8[3] = &unk_10051D9E8;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[MailboxGroupedPickerTableCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v8);

}

- (id)nameForMailbox:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "mailboxType") == (id)7)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayNameUsingSpecialNames"));
  else
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
  v5 = (void *)v4;

  return v5;
}

- (void)setMailbox:(id)a3
{
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v11, "mailboxType") == (id)8)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountImageForAccounts:](MailAccount, "accountImageForAccounts:", v8));

    }
    else
    {
      v9 = sub_1001D6E84();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iconFromBundle:", v7));
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxGroupedPickerTableCell nameForMailbox:](self, "nameForMailbox:", v11));
  -[MailboxGroupedPickerTableCell _setText:image:](self, "_setText:image:", v10, v6);

  -[MailboxGroupedPickerTableCell setIndentationLevel:](self, "setIndentationLevel:", -[MailboxGroupedPickerTableCell levelForMailbox:](self, "levelForMailbox:", v11));
}

- (int)levelForMailbox:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "mailboxType"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "level");

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MailboxGroupedPickerTableCell;
  -[MailboxGroupedPickerTableCell dealloc](&v4, "dealloc");
}

- (BOOL)isCellEnabled
{
  return (*((_BYTE *)self + 8) & 1) == 0;
}

- (void)setCellEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFE | !a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000C4424;
  v3[3] = &unk_10051DA08;
  v4 = a3;
  -[MailboxGroupedPickerTableCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v3);
}

- (void)setCurrentMailbox:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (!a3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellEligibleColor](UIColor, "tableCellEligibleColor"))) == 0)
  {
    if (-[MailboxGroupedPickerTableCell isCellEnabled](self, "isCellEnabled"))
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellEligibleColor](UIColor, "tableCellEligibleColor"));
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellIneligibleColor](UIColor, "tableCellIneligibleColor"));
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C45AC;
  v6[3] = &unk_10051D9C0;
  v7 = v4;
  v5 = v4;
  -[MailboxGroupedPickerTableCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v6);

}

@end
