@implementation _UIActivityActionCellTitleLabel

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[_UIActivityActionCellTitleLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIActivityActionCellTitleLabel;
    -[_UIActivityActionCellTitleLabel setText:](&v9, sel_setText_, v4);
    -[_UIActivityActionCellTitleLabel traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellTitleLabel _updateFontWithSizeCategory:](self, "_updateFontWithSizeCategory:", v8);

  }
}

- (void)_updateFontWithSizeCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC37E8];
  v5 = (void *)MEMORY[0x1E0DC37F0];
  -[_UIActivityActionCellTitleLabel textStyle](self, "textStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v6, 0x8000, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityActionCellTitleLabel setFont:](self, "setFont:", v8);

  -[_UIActivityActionCellTitleLabel setNumberOfLines:](self, "setNumberOfLines:", 0);
  -[_UIActivityActionCellTitleLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIActivityActionCellTitleLabel;
  v4 = a3;
  -[_UIActivityActionCellTitleLabel traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[_UIActivityActionCellTitleLabel traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    -[_UIActivityActionCellTitleLabel traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellTitleLabel _updateFontWithSizeCategory:](self, "_updateFontWithSizeCategory:", v9);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4
{
  double height;
  double width;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIActivityActionCellTitleLabel _updateFontWithSizeCategory:](self, "_updateFontWithSizeCategory:", a4);
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityActionCellTitleLabel;
  -[_UIActivityActionCellTitleLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)textStyle
{
  if (self->_textStyle)
    return self->_textStyle;
  else
    return (NSString *)(id)*MEMORY[0x1E0DC4A88];
}

- (void)setTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_textStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
}

@end
