@implementation _MailActionCellTitleLabel

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MailActionCellTitleLabel text](self, "text"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MailActionCellTitleLabel;
    -[_MailActionCellTitleLabel setText:](&v9, "setText:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MailActionCellTitleLabel traitCollection](self, "traitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    -[_MailActionCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", v8);

  }
}

- (void)setUseActionSheetStyle:(BOOL)a3
{
  if (self->_useActionSheetStyle != a3)
  {
    self->_useActionSheetStyle = a3;
    -[_MailActionCellTitleLabel _updateStyle](self, "_updateStyle");
  }
}

- (void)_updateStyle
{
  void *v3;
  NSString *v4;
  _BOOL8 v5;
  uint64_t v6;

  if (-[_MailActionCellTitleLabel useActionSheetStyle](self, "useActionSheetStyle"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MailActionCellTitleLabel traitCollection](self, "traitCollection"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
    v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

    v6 = 4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  -[_MailActionCellTitleLabel setNumberOfLines:](self, "setNumberOfLines:", v5);
  -[_MailActionCellTitleLabel setLineBreakMode:](self, "setLineBreakMode:", v6);
}

- (void)updateFontWithSizeCategory:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = -[_MailActionCellTitleLabel isHorizontalTitle](self, "isHorizontalTitle", a3);
  v5 = (void *)objc_opt_class(self);
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredFontForHorizontalTitle"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredFontForDefaultTitle"));
  -[_MailActionCellTitleLabel setFont:](self, "setFont:", v6);

  -[_MailActionCellTitleLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MailActionCellTitleLabel;
  -[_MailActionCellTitleLabel traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MailActionCellTitleLabel traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    -[_MailActionCellTitleLabel _updateStyle](self, "_updateStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MailActionCellTitleLabel traitCollection](self, "traitCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
    -[_MailActionCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", v10);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[_MailActionCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", v7);
  v14.receiver = self;
  v14.super_class = (Class)_MailActionCellTitleLabel;
  -[_MailActionCellTitleLabel sizeThatFits:](&v14, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (id)preferredFontForHorizontalTitle
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead);
}

+ (id)preferredFontForDefaultTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  return v4;
}

- (BOOL)isHorizontalTitle
{
  return self->_isHorizontalTitle;
}

- (void)setIsHorizontalTitle:(BOOL)a3
{
  self->_isHorizontalTitle = a3;
}

- (BOOL)useActionSheetStyle
{
  return self->_useActionSheetStyle;
}

@end
