@implementation SearchUIMiniCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SearchUIMiniCardSectionView setImageView:](self, "setImageView:", v3);

  -[SearchUIMiniCardSectionView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, "setLayoutSize:withContentPriority:", 45.0, 45.0, v5);

  -[SearchUIMiniCardSectionView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v6);

  v7 = (void *)objc_opt_new();
  -[SearchUIMiniCardSectionView setTitleLabel:](self, "setTitleLabel:", v7);

  v8 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], TLKSnippetModernizationEnabled() ^ 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMiniCardSectionView titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[SearchUIMiniCardSectionView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customAlignmentRectInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SearchUIMiniCardSectionView titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCustomAlignmentRectInsets:", -1.0, v13, v15, v17);

  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMiniCardSectionView setSubtitleLabel:](self, "setSubtitleLabel:", v19);

  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", v8, TLKSnippetModernizationEnabled() ^ 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMiniCardSectionView subtitleLabel](self, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  v22 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUIMiniCardSectionView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  -[SearchUIMiniCardSectionView subtitleLabel](self, "subtitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v25);

  objc_msgSend(v26, "setAxis:", 1);
  objc_msgSend(v26, "setSpacing:", 2.0);
  v27 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUIMiniCardSectionView imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  v32[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithArrangedSubviews:", v29);

  objc_msgSend(v30, "setAlignment:", 1);
  objc_msgSend(v30, "setSpacing:", 10.0);
  objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v30);

  return v30;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUIMiniCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v13, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaxLines:", 1);

  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMiniCardSectionView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSfText:", v7);

  objc_msgSend(v5, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMiniCardSectionView subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSfText:", v9);

  -[SearchUIMiniCardSectionView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithImage:", v12);

}

- (void)updateImplicitVisibilityForWatchNowCardSection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  int v8;
  double v9;
  _QWORD v10[6];

  v4 = a4;
  v6 = a3;
  v7 = 0.0;
  -[SearchUIMiniCardSectionView setAlpha:](self, "setAlpha:", 0.0);
  v8 = objc_msgSend(v6, "isPlaceholder");

  if (!v8)
    v7 = 1.0;
  -[SearchUIMiniCardSectionView alpha](self, "alpha");
  if (v7 != v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__SearchUIMiniCardSectionView_updateImplicitVisibilityForWatchNowCardSection_animated___block_invoke;
    v10[3] = &unk_1EA1F6E50;
    v10[4] = self;
    *(double *)&v10[5] = v7;
    +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v10, v4);
  }
}

uint64_t __87__SearchUIMiniCardSectionView_updateImplicitVisibilityForWatchNowCardSection_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 0;
}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 800, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 808, 1);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
