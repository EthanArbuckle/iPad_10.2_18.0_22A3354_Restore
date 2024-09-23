@implementation MTDynamicTypeLabel

- (MTDynamicTypeLabel)initWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  NSString *v6;
  MTDynamicTypeLabel *v7;
  MTDynamicTypeLabel *v8;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = (NSString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)MTDynamicTypeLabel;
  v7 = -[MTDynamicTypeLabel initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_textStyle = v6;
    v7->_symbolicTraits = v4;
    -[MTDynamicTypeLabel setAdjustsFontForContentSizeCategory:](v7, "setAdjustsFontForContentSizeCategory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:](UIFont, "mt_preferredFontForTextStyle:addingSymbolicTraits:", v6, v4));
    -[MTDynamicTypeLabel setFont:](v8, "setFont:", v9);

  }
  return v8;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[MTDynamicTypeLabel adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTDynamicTypeLabel;
    -[MTDynamicTypeLabel setAdjustsFontForContentSizeCategory:](&v5, "setAdjustsFontForContentSizeCategory:", v3);
    -[MTDynamicTypeLabel updateForCurrentContentSizeCategory](self, "updateForCurrentContentSizeCategory");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTDynamicTypeLabel;
  -[MTDynamicTypeLabel traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (-[MTDynamicTypeLabel adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDynamicTypeLabel traitCollection](self, "traitCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[MTDynamicTypeLabel updateForCurrentContentSizeCategory](self, "updateForCurrentContentSizeCategory");
  }

}

- (void)updateForCurrentContentSizeCategory
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:](UIFont, "mt_preferredFontForTextStyle:addingSymbolicTraits:", self->_textStyle, self->_symbolicTraits));
  -[MTDynamicTypeLabel setFont:](self, "setFont:", v3);

}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (unsigned)symbolicTraits
{
  return self->_symbolicTraits;
}

@end
