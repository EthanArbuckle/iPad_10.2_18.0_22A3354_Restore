@implementation SearchUILargeTitleDetailedRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  +[TLKLabel primaryLabel](SearchUILabel, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
  {
    v5 = 0.0;
    v6 = 2.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(v3, "setCustomAlignmentRectInsets:", v6, v5, v7, v8);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "setMinimumScaleFactor:", 0.6);
  -[SearchUILargeTitleDetailedRowCardSectionView setTitleLabel:](self, "setTitleLabel:", v3);
  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x1E0DBD940];
  v11 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v12 = (_QWORD *)MEMORY[0x1E0DC4A90];
  if (!v11)
    v12 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  objc_msgSend(v10, "cachedFontForTextStyle:", *v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v13);

  objc_msgSend(v9, "setProminence:", 2);
  objc_msgSend(v9, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 2);

  objc_msgSend(v9, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineBreakMode:", 4);

  -[SearchUILargeTitleDetailedRowCardSectionView setSubtitleButton:](self, "setSubtitleButton:", v9);
  v16 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  v25[0] = v3;
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithArrangedSubviews:", v17);

  objc_msgSend(v18, "setAxis:", 1);
  objc_msgSend(v18, "setAlignment:", 1);
  objc_msgSend(v18, "setDistribution:", 0);
  objc_msgSend(v18, "setSpacing:", 4.0);
  objc_msgSend(v18, "setDelegate:", self);
  v19 = (void *)objc_opt_new();
  -[SearchUILargeTitleDetailedRowCardSectionView setButtonStackView:](self, "setButtonStackView:", v19);
  v20 = objc_alloc(MEMORY[0x1E0DBDA08]);
  v24[0] = v18;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithArrangedSubviews:", v21);

  objc_msgSend(v22, "setAlignment:", 3);
  objc_msgSend(v22, "setDistribution:", 3);
  objc_msgSend(v22, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);
  objc_msgSend(v22, "setSpacing:", *MEMORY[0x1E0DBDA70]);

  return v22;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SearchUILargeTitleDetailedRowCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v37, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaxLines:", 1);
  -[SearchUILargeTitleDetailedRowCardSectionView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSfText:", v6);

  objc_msgSend(v5, "subtitleButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "subtitleButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

    objc_msgSend(v10, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    objc_msgSend(v10, "command");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsMenuAsPrimaryAction:", v14 == 0);

    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitleButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuForRowModel:buttonItem:commandEnvironment:", v4, v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMenu:", v20);

    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:", self, sel_didSelectSubtitleItem);

  }
  else
  {
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);
  }

  objc_msgSend(v5, "trailingButtonItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count") != 1)
  {
    v31 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "trailingButtonItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = objc_opt_isKindOfClass();

  if ((v26 & 1) != 0)
  {
    objc_msgSend(v5, "trailingButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "person");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "emailAddresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "length") != 0;

LABEL_8:
    goto LABEL_10;
  }
  v31 = 0;
LABEL_10:
  -[SearchUILargeTitleDetailedRowCardSectionView buttonStackView](self, "buttonStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setShouldReverseButtonOrder:", v31);

  -[SearchUILargeTitleDetailedRowCardSectionView buttonStackView](self, "buttonStackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingButtonItems");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    v35 = 2;
  else
    v35 = 3;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v34, v35, 1, v4, v36);

}

- (void)didSelectSubtitleItem
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subtitleButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "subtitleButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SearchUICardSectionView rowModel](self, "rowModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v7, v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "command");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "performCommand:triggerEvent:environment:", v13, 3, v9);

    }
    v6 = v14;
  }

}

- (UIEdgeInsets)layoutMargins
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v3 = 12.0;
  if (v2)
    v4 = 12.0;
  else
    v4 = 16.0;
  v5 = 18.0;
  if (v2)
    v5 = 16.0;
  else
    v3 = 18.0;
  v6 = v3;
  result.right = v5;
  result.bottom = v6;
  result.left = v3;
  result.top = v4;
  return result;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[SearchUILargeTitleDetailedRowCardSectionView subtitleButton](self, "subtitleButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effectiveLayoutSizeFittingSize:", width, height);
    v10 = v14;
    v11 = v15;

  }
  else
  {
    v10 = *MEMORY[0x1E0CFAA88];
    v11 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }
  v16 = v10;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TLKTextButton)subtitleButton
{
  return self->_subtitleButton;
}

- (void)setSubtitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleButton, a3);
}

- (SearchUIButtonItemStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_subtitleButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
