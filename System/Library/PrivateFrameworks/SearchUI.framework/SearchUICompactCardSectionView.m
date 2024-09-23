@implementation SearchUICompactCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4A88], TLKSnippetModernizationEnabled() ^ 1, *MEMORY[0x1E0DC1438]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setLineBreakMode:", 4);
  -[SearchUICompactCardSectionView setTitleLabel:](self, "setTitleLabel:", v3);
  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setLineBreakMode:", 5);
  -[SearchUICompactCardSectionView setSubtitleLabel:](self, "setSubtitleLabel:", v5);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDisableCornerRounding:", 1);
  objc_msgSend(v7, "setProminence:", 0);
  objc_msgSend(v3, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSymbolFont:", v8);

  objc_msgSend(v7, "setSymbolScale:", 0);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v7, "setLayoutSize:withContentPriority:", 24.0, 24.0, v9);
  -[SearchUICompactCardSectionView setImageView:](self, "setImageView:", v7);
  v10 = objc_alloc(MEMORY[0x1E0CFAAA8]);
  v30[0] = v7;
  v30[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v11;
  v29[0] = v7;
  v29[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithArrangedSubviewRows:", v13);

  objc_msgSend(v14, "setVerticalAlignment:", 3);
  v15 = (void *)MEMORY[0x1E0DBD9B0];
  objc_msgSend(v3, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scaledValueForValue:withFont:view:", v16, self, 19.0);
  objc_msgSend(v14, "setRowSpacing:");

  objc_msgSend(v14, "setColumnSpacing:", 8.0);
  objc_msgSend(v14, "setBaselineRelativeArrangement:", 1);
  objc_msgSend(v14, "setBaselineRelativeLayoutMarginsForArrangement:", 1);
  v17 = (void *)MEMORY[0x1E0DBD9B0];
  objc_msgSend(v3, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scaledValueForValue:withFont:view:", v18, self, 25.0);
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0DBDA48], "standardTableCellContentInset");
  v22 = v21;
  v23 = (void *)MEMORY[0x1E0DBD9B0];
  objc_msgSend(v5, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:withFont:view:", v24, self, 13.0);
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0DBDA48], "standardTableCellContentInset");
  objc_msgSend(v14, "setLayoutMargins:", v20, v22, v26, v27);

  return v14;
}

- (id)richTextForSearchUIText:(id)a3 withMaxLines:(unint64_t)a4
{
  void *v5;

  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxLines:", a4);
  return v5;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SearchUICompactCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v18, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection", v18.receiver, v18.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICompactCardSectionView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithImage:", v7);

  objc_msgSend(v5, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columnAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8 == 0);

  if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize"))
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompactCardSectionView richTextForSearchUIText:withMaxLines:](self, "richTextForSearchUIText:withMaxLines:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompactCardSectionView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRichText:", v13);

  objc_msgSend(v5, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompactCardSectionView richTextForSearchUIText:withMaxLines:](self, "richTextForSearchUIText:withMaxLines:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompactCardSectionView subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRichText:", v16);

}

+ (BOOL)hasLeadingImageForCardSection:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (SearchUIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (SearchUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
