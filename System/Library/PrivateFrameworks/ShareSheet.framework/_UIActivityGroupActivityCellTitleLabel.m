@implementation _UIActivityGroupActivityCellTitleLabel

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[_UIActivityGroupActivityCellTitleLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
    -[_UIActivityGroupActivityCellTitleLabel setText:](&v9, sel_setText_, v4);
    -[_UIActivityGroupActivityCellTitleLabel traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityGroupActivityCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", v8);

  }
}

- (void)updateFontWithSizeCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  -[_UIActivityGroupActivityCellTitleLabel _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIActivityGroupActivityCellFont(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityGroupActivityCellTitleLabel setFont:](self, "setFont:", v6);

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    -[_UIActivityGroupActivityCellTitleLabel setNumberOfLines:](self, "setNumberOfLines:", 2);
    LODWORD(v7) = 0.5;
    -[_UIActivityGroupActivityCellTitleLabel _setHyphenationFactor:](self, "_setHyphenationFactor:", v7);
    if (-[_UIActivityGroupActivityCellTitleLabel _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v8 = 2;
    else
      v8 = 0;
    -[_UIActivityGroupActivityCellTitleLabel setTextAlignment:](self, "setTextAlignment:", v8);
    -[_UIActivityGroupActivityCellTitleLabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 0);
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[_UIActivityGroupActivityCellTitleLabel text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69___UIActivityGroupActivityCellTitleLabel_updateFontWithSizeCategory___block_invoke;
    v13[3] = &unk_1E4003FB8;
    v13[5] = 0;
    v13[6] = v10;
    v13[4] = &v14;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v13);
    if (*((_BYTE *)v15 + 24))
      v11 = 1;
    else
      v11 = 2;
    -[_UIActivityGroupActivityCellTitleLabel setNumberOfLines:](self, "setNumberOfLines:", v11);
    LODWORD(v12) = 0;
    -[_UIActivityGroupActivityCellTitleLabel _setHyphenationFactor:](self, "_setHyphenationFactor:", v12);
    -[_UIActivityGroupActivityCellTitleLabel setTextAlignment:](self, "setTextAlignment:", 1);
    -[_UIActivityGroupActivityCellTitleLabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 1);

    _Block_object_dispose(&v14, 8);
  }
  -[_UIActivityGroupActivityCellTitleLabel setNeedsDisplay](self, "setNeedsDisplay");

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
  v10.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
  v4 = a3;
  -[_UIActivityGroupActivityCellTitleLabel traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[_UIActivityGroupActivityCellTitleLabel traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    -[_UIActivityGroupActivityCellTitleLabel traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityGroupActivityCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", v9);

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
  -[_UIActivityGroupActivityCellTitleLabel updateFontWithSizeCategory:](self, "updateFontWithSizeCategory:", a4);
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
  -[_UIActivityGroupActivityCellTitleLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

@end
