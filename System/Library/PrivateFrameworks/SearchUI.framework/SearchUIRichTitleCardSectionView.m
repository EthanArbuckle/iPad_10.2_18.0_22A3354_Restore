@implementation SearchUIRichTitleCardSectionView

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
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SearchUIRichTitleCardSectionView setHeaderView:](self, "setHeaderView:", v3);
  v4 = (void *)MEMORY[0x1E0CFAAB0];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalContainerStackViewWithArrangedSubviews:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlignment:", 3);
  objc_msgSend(v6, "setLayoutMarginsRelativeArrangement:", 1);

  return v6;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)SearchUIRichTitleCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v35, sel_updateWithRowModel_, v4);
  v6 = objc_msgSend(v5, "isCentered");
  -[SearchUIRichTitleCardSectionView headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __55__SearchUIRichTitleCardSectionView_updateWithRowModel___block_invoke;
  v31[3] = &unk_1EA1F7420;
  v8 = v5;
  v32 = v8;
  v9 = v7;
  v33 = v9;
  v34 = v6;
  objc_msgSend(v9, "performBatchUpdates:", v31);
  objc_msgSend(v8, "buttonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      -[SearchUIRichTitleCardSectionView setButtonStackView:](self, "setButtonStackView:", v12);

      -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldReverseButtonOrder:", 1);

      -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v14);

      -[SearchUICardSectionView contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addArrangedSubview:", v16);

    }
    -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v10, 0, 1, v4, v18);

  }
  v19 = objc_msgSend(v10, "count");
  -[SearchUIRichTitleCardSectionView buttonStackView](self, "buttonStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v19 == 0);

  v21 = 0.0;
  if (TLKSnippetModernizationEnabled())
  {
    v22 = 0.0;
    if ((objc_msgSend(v8, "isCentered") & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
        v23 = 14.0;
      else
        v23 = 18.0;
      objc_msgSend(v9, "effectiveLayoutMargins");
      v25 = v24;
      v26 = 0.0;
      if (!v19)
        objc_msgSend(v9, "effectiveLayoutMargins");
      v22 = v23 - v25;
      v21 = v23 - v26;
    }
  }
  else
  {
    v22 = 0.0;
  }
  objc_msgSend(v9, "effectiveLayoutMargins");
  v28 = 8.0 - v27;
  -[SearchUICardSectionView contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSpacing:", v28);

  -[SearchUICardSectionView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDirectionalLayoutMargins:", 0.0, v22, 0.0, v21);

}

void __55__SearchUIRichTitleCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v2);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setMaxLines:", 2);
  if (objc_msgSend(*(id *)(a1 + 32), "isCentered"))
    v3 = 6;
  else
    v3 = 4;
  objc_msgSend(*(id *)(a1 + 32), "titleImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setImage:", v6);

  objc_msgSend(*(id *)(a1 + 40), "setTitle:", v22);
  objc_msgSend(*(id *)(a1 + 32), "richSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "richSubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DBD9D8];
    objc_msgSend(v8, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textWithString:", v9);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubtitle:", v11);

  objc_msgSend(*(id *)(a1 + 32), "reviewGlyph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubtitleImage:", v14);

  v15 = (void *)MEMORY[0x1E0DBD9C0];
  objc_msgSend(*(id *)(a1 + 32), "footnote");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFootnote:", v17);

  objc_msgSend(*(id *)(a1 + 40), "setSubtitleIsEmphasized:", objc_msgSend(*(id *)(a1 + 32), "subtitleIsEmphasized"));
  objc_msgSend(*(id *)(a1 + 32), "contentAdvisory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setRoundedBorderText:", v18);

  v19 = (void *)MEMORY[0x1E0DBD9C0];
  objc_msgSend(*(id *)(a1 + 32), "auxiliaryMiddleText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTrailingText:", v21);

  objc_msgSend(*(id *)(a1 + 40), "setAxis:", *(_QWORD *)(a1 + 48));
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIRichTitleCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  v6 = -[SearchUICardSectionView isCompactWidth](self, "isCompactWidth");
  -[SearchUIRichTitleCardSectionView headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseCompactWidth:", v6);

}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 5;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)objc_msgSend(a3, "title");
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  return (id)objc_msgSend(a3, "subtitle");
}

- (TLKHeaderView)headerView
{
  return (TLKHeaderView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setHeaderView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (SearchUIButtonItemStackView)buttonStackView
{
  return (SearchUIButtonItemStackView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setButtonStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
