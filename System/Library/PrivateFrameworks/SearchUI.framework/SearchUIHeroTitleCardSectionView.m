@implementation SearchUIHeroTitleCardSectionView

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  +[TLKLabel primaryLabel](SearchUILabel, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:isMacStyle:", *MEMORY[0x1E0DC4B58], TLKSnippetModernizationEnabled() ^ 1, 1, objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setAutoHideIfNoContent:", 1);
  -[SearchUIHeroTitleCardSectionView setTitleLabel:](self, "setTitleLabel:", v3);
  v5 = (void *)objc_opt_new();
  -[SearchUIHeroTitleCardSectionView setTitleImageView:](self, "setTitleImageView:", v5);
  v6 = (void *)objc_opt_new();
  v27[0] = v3;
  v27[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArrangedSubviews:", v7);

  objc_msgSend(v6, "setAlignment:", 1);
  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoHideIfNoContent:", 1);
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isIpad"))
  {
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

  }
  -[SearchUIHeroTitleCardSectionView setSubtitleLabel:](self, "setSubtitleLabel:", v8);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setShouldReverseButtonOrder:", 1);
  -[SearchUIHeroTitleCardSectionView setButtonItemStackView:](self, "setButtonItemStackView:", v10);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setAxis:", 1);
  v26[0] = v6;
  v26[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setArrangedSubviews:", v12);

  objc_msgSend(v11, "setAlignment:", 1);
  v13 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v14 = 3.0;
  if (v13)
    v14 = 2.0;
  objc_msgSend(v11, "setSpacing:", v14);
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_alloc(MEMORY[0x1E0DBDA08]);
  v25[0] = v11;
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithArrangedSubviews:", v22);

  objc_msgSend(v23, "setAlignment:", 3);
  objc_msgSend(v23, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);
  objc_msgSend(v23, "setSpacing:", 8.0);
  objc_msgSend(v23, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v23, "setLayoutMargins:", v16, v18, 12.0, v20);

  return v23;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SearchUIHeroTitleCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v21, sel_updateWithRowModel_, v4);
  -[SearchUICardSectionView section](self, "section", v21.receiver, v21.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIHeroTitleCardSectionView titleImageView](self, "titleImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithImage:", v8);

  -[SearchUIHeroTitleCardSectionView titleImageView](self, "titleImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8 == 0);

  -[SearchUIHeroTitleCardSectionView titleImageView](self, "titleImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCustomAlignmentRectInsets:", -2.0, 0.0, -8.0, 0.0);

  if (v8)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SearchUIHeroTitleCardSectionView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSfText:", v12);

  if (!v8)
  objc_msgSend(v5, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroTitleCardSectionView subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSfText:", v14);

  -[SearchUIHeroTitleCardSectionView buttonItemStackView](self, "buttonItemStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "maxVisibleButtonItems");
  if (v18)
    v19 = v18;
  else
    v19 = 2;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v17, v19, 1, v4, v20);

}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (SearchUIImageView)titleImageView
{
  return self->_titleImageView;
}

- (void)setTitleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_titleImageView, a3);
}

- (SearchUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
