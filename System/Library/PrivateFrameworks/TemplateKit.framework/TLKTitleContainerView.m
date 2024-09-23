@implementation TLKTitleContainerView

- (TLKTitleContainerView)init
{
  TLKTitleContainerView *v2;
  TLKTitleContainerView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKTitleContainerView;
  v2 = -[TLKTitleContainerView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKStackView setFlipsToVerticalAxisForAccessibilityContentSizes:](v2, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);
    -[TLKStackView setAlignment:](v3, "setAlignment:", 5);
    v4 = (void *)objc_opt_new();
    -[TLKTitleContainerView setTitleField:](v3, "setTitleField:", v4);

    -[TLKTitleContainerView titleField](v3, "titleField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRoundedCornerLabelSizeConfiguration:", 2);

    -[TLKTitleContainerView titleField](v3, "titleField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStackView addArrangedSubview:](v3, "addArrangedSubview:", v6);

  }
  return v3;
}

- (void)updateResultWithTitle:(id)a3 secondaryTitle:(id)a4 image:(id)a5 detached:(BOOL)a6 useCompactMode:(BOOL)a7 truncateMiddle:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  TLKTitleContainerView *v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke;
  v20[3] = &unk_1E5C07268;
  v21 = v14;
  v22 = v15;
  v23 = v16;
  v24 = self;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  -[TLKTitleContainerView performBatchUpdates:](self, "performBatchUpdates:", v20);

}

void __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  int v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  float v41;
  double v42;
  float v43;
  float v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  _QWORD v49[5];
  id v50;
  __int16 v51;
  char v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasContent") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "hasContent"))
  {
    v2 = (id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", 0);
  }
  else
  {
    v2 = (id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", v11 == 0);
    if (!v11)
      return;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "hasContent");
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = 16.0;
  if (!*(_BYTE *)(a1 + 64))
    v5 = 4.0;
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "setSpacing:", v5);
  objc_msgSend(*(id *)(a1 + 56), "titleField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke_2;
  v49[3] = &unk_1E5C07240;
  v49[4] = *(_QWORD *)(a1 + 56);
  v50 = *(id *)(a1 + 32);
  v51 = *(_WORD *)(a1 + 65);
  v52 = v3;
  objc_msgSend(v7, "performBatchUpdates:", v49);

  if (v3)
  {
    objc_msgSend(*v2, "secondaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v2, "setSecondaryLabel:", v9);

      if (TLKSnippetModernizationEnabled())
      {
        if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
          +[TLKFontUtilities cachedFontForMacTextStyle:](TLKFontUtilities, "cachedFontForMacTextStyle:", *MEMORY[0x1E0DC4A90]);
        else
          +[TLKFontUtilities cachedFontForTextStyle:](TLKFontUtilities, "cachedFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v10;
      objc_msgSend(*v2, "secondaryLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

      v14 = *v2;
      objc_msgSend(*v2, "secondaryLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertArrangedSubview:atIndex:", v15, 1);

    }
    objc_msgSend(*(id *)(a1 + 40), "setMaxLines:", 1);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "secondaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRichText:", v16);

  }
  objc_msgSend(*v2, "secondaryLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", v3 ^ 1u);

  if (v6)
  {
    objc_msgSend(*v2, "secondaryImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(*v2, "setSecondaryImageView:", v20);

      objc_msgSend(*v2, "secondaryLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "font");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v2, "secondaryImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSymbolFont:", v22);

      objc_msgSend(*v2, "secondaryImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setSymbolScale:", 1);

      v25 = objc_alloc(MEMORY[0x1E0CFAA98]);
      objc_msgSend(*v2, "secondaryImageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "initWithArrangedSubviews:", v27);
      objc_msgSend(*v2, "setSecondaryImageViewBoxView:", v28);

      objc_msgSend(*v2, "secondaryImageViewBoxView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHorizontalAlignment:", 1);

      objc_msgSend(*v2, "secondaryImageViewBoxView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = 1148846080;
      objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 0, v31);

      v32 = *v2;
      objc_msgSend(*v2, "secondaryImageViewBoxView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addArrangedSubview:", v33);

    }
    v34 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "secondaryImageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTlkImage:", v34);

  }
  objc_msgSend(*v2, "secondaryImageViewBoxView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setHidden:", v6 == 0);

  v37 = *v2;
  if (v4)
  {
    objc_msgSend(v37, "titleField");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "secondaryLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0.0;
  }
  else
  {
    objc_msgSend(v37, "secondaryLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "titleField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v41 = 0.0;
    else
      v41 = 1.0;
  }
  LODWORD(v40) = 1148813312;
  objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v40);
  LODWORD(v42) = 1148829696;
  objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 0, v42);
  v43 = 0.0;
  if (v4)
    v43 = 1.0;
  v44 = 1000.0 - v43;
  objc_msgSend(*v2, "titleField");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v46 = v44;
  objc_msgSend(v45, "setContentHuggingPriority:forAxis:", 0, v46);

  objc_msgSend(*v2, "secondaryLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v48 = 1000.0 - v41;
  objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 0, v48);

}

void __107__TLKTitleContainerView_updateResultWithTitle_secondaryTitle_image_detached_useCompactMode_truncateMiddle___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = objc_msgSend((id)objc_opt_class(), "hasNonBoldFormattingInRichText:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    if (!+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    {
      if (TLKBiggerSuggestionsLayoutEnabled())
        +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A88], 0, 1);
      else
        +[TLKFontUtilities cachedFontForTextStyle:isShort:fontWeight:](TLKFontUtilities, "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4A88], TLKSnippetModernizationEnabled() ^ 1, *MEMORY[0x1E0DC4B88]);
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_8:
    +[TLKFontUtilities cachedFontForMacTextStyle:](TLKFontUtilities, "cachedFontForMacTextStyle:", *MEMORY[0x1E0DC4A88]);
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v18 = (id)v3;
    goto LABEL_14;
  }
  v4 = v2;
  if (TLKSnippetModernizationEnabled() && +[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    goto LABEL_8;
  v5 = TLKSnippetModernizationEnabled();
  v6 = (id *)MEMORY[0x1E0DC4A88];
  if (!v5)
    v6 = (id *)MEMORY[0x1E0DC4B10];
  v7 = *v6;
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v7, TLKSnippetModernizationEnabled() ^ 1, v4 ^ 1u);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", 0);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v18);

  if (*(_BYTE *)(a1 + 49))
    v10 = 5;
  else
    v10 = 4;
  objc_msgSend(*(id *)(a1 + 32), "titleField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineBreakMode:", v10);

  v13 = +[TLKLayoutUtilities isSuperLargeAccessibilitySize](TLKLayoutUtilities, "isSuperLargeAccessibilitySize");
  if (*(_BYTE *)(a1 + 50) || (!*(_BYTE *)(a1 + 48) ? (v14 = 1) : (v14 = v13), v14 != 1))
    v15 = 1;
  else
    v15 = objc_msgSend(*(id *)(a1 + 40), "maxLines");
  objc_msgSend(*(id *)(a1 + 40), "setMaxLines:", v15);
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRichText:", v16);

}

+ (BOOL)hasNonBoldFormattingInRichText:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "formattedTextItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isBold") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)titleFont
{
  void *v2;
  void *v3;

  -[TLKTitleContainerView titleField](self, "titleField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[TLKTitleContainerView titleField](self, "titleField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForFirstBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;

  -[TLKTitleContainerView titleField](self, "titleField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForLastBaselineLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleLabelString
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKTitleContainerView titleField](self, "titleField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "richText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)secondaryTitleLabelString
{
  void *v2;
  void *v3;

  -[TLKTitleContainerView secondaryLabel](self, "secondaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleLabel
{
  void *v2;
  void *v3;

  -[TLKTitleContainerView titleField](self, "titleField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TLKRichTextField)titleField
{
  return self->_titleField;
}

- (void)setTitleField:(id)a3
{
  objc_storeStrong((id *)&self->_titleField, a3);
}

- (TLKLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (NUIContainerBoxView)secondaryImageViewBoxView
{
  return self->_secondaryImageViewBoxView;
}

- (void)setSecondaryImageViewBoxView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryImageViewBoxView, a3);
}

- (TLKImageView)secondaryImageView
{
  return self->_secondaryImageView;
}

- (void)setSecondaryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryImageView, 0);
  objc_storeStrong((id *)&self->_secondaryImageViewBoxView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
}

@end
