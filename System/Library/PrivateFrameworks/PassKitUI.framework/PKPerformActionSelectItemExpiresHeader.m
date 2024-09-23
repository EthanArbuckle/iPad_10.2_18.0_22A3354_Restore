@implementation PKPerformActionSelectItemExpiresHeader

- (PKPerformActionSelectItemExpiresHeader)init
{
  PKPerformActionSelectItemExpiresHeader *v2;
  UILabel *v3;
  UILabel *leadingLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  uint64_t v8;
  void *v9;
  UILabel *v10;
  UILabel *trailingLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPerformActionSelectItemExpiresHeader;
  v2 = -[PKPerformActionSelectItemExpiresHeader init](&v17, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    leadingLabel = v2->_leadingLabel;
    v2->_leadingLabel = v3;

    v5 = v2->_leadingLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    v7 = v2->_leadingLabel;
    v8 = *MEMORY[0x1E0DC4AB8];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v9);

    -[PKPerformActionSelectItemExpiresHeader addSubview:](v2, "addSubview:", v2->_leadingLabel);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    trailingLabel = v2->_trailingLabel;
    v2->_trailingLabel = v10;

    v12 = v2->_trailingLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v2->_trailingLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    -[PKPerformActionSelectItemExpiresHeader addSubview:](v2, "addSubview:", v2->_trailingLabel);
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPerformActionSelectItemExpiresHeader;
  -[PKPerformActionSelectItemExpiresHeader layoutSubviews](&v9, sel_layoutSubviews);
  v3 = PKTableViewCellTextInset();
  -[UILabel sizeToFit](self->_leadingLabel, "sizeToFit");
  -[UILabel frame](self->_leadingLabel, "frame");
  -[UILabel setFrame:](self->_leadingLabel, "setFrame:", v3, 22.0);
  -[UILabel sizeToFit](self->_trailingLabel, "sizeToFit");
  -[UILabel frame](self->_trailingLabel, "frame");
  v5 = v4;
  -[PKPerformActionSelectItemExpiresHeader bounds](self, "bounds");
  v7 = v6 - v3;
  -[UILabel frame](self->_trailingLabel, "frame");
  -[UILabel setFrame:](self->_trailingLabel, "setFrame:", v7 - v8, 22.0, v5, 22.0);
}

- (void)setLeadingString:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_leadingLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__PKPerformActionSelectItemExpiresHeader_setLeadingString___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v10, "animateWithDuration:animations:", v11, 0.0);

  }
LABEL_9:

}

uint64_t __59__PKPerformActionSelectItemExpiresHeader_setLeadingString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setText:", *(_QWORD *)(a1 + 40));
}

- (void)setTrailingString:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_trailingLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKPerformActionSelectItemExpiresHeader_setTrailingString___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v10, "animateWithDuration:animations:", v11, 0.0);

  }
LABEL_9:

}

uint64_t __60__PKPerformActionSelectItemExpiresHeader_setTrailingString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setText:", *(_QWORD *)(a1 + 40));
}

- (NSString)leadingString
{
  return self->_leadingString;
}

- (NSString)trailingString
{
  return self->_trailingString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingString, 0);
  objc_storeStrong((id *)&self->_leadingString, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

@end
