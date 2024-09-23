@implementation VUIFocusableTextView

- (VUIFocusableTextView)initWithFrame:(CGRect)a3
{
  VUIFocusableTextView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VUIFocusableTextView;
  v3 = -[TVFocusableTextView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__VUIFocusableTextView_initWithFrame___block_invoke;
    v10[3] = &unk_1E9F99F98;
    objc_copyWeak(&v11, &location);
    -[VUIFocusableTextView vui_registerForTraitChanges:withHandler:](v3, "vui_registerForTraitChanges:withHandler:", v4, v10);

    v14 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __38__VUIFocusableTextView_initWithFrame___block_invoke_2;
    v8[3] = &unk_1E9F99F98;
    objc_copyWeak(&v9, &location);
    -[VUIFocusableTextView vui_registerForTraitChanges:withHandler:](v3, "vui_registerForTraitChanges:withHandler:", v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__VUIFocusableTextView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "numberOfLinesForTraitCollection:", v2);

  objc_msgSend(WeakRetained, "setMaximumNumberOfLines:", v3);
}

void __38__VUIFocusableTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTextColor");

}

+ (id)textViewWithString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  return (id)objc_msgSend(a1, "textViewWithString:textLayout:titleString:titleLayout:existingTextView:", a3, a4, 0, 0, a5);
}

+ (id)textViewWithString:(id)a3 textLayout:(id)a4 titleString:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  VUIFocusableTextView *v16;
  VUIFocusableTextView *v17;
  VUIFocusableTextView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (VUIFocusableTextView *)v14;
  }
  else
  {
    v17 = [VUIFocusableTextView alloc];
    v16 = -[VUIFocusableTextView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v18 = v16;
  -[VUIFocusableTextView setTextLayout:](v16, "setTextLayout:", v11);
  -[VUIFocusableTextView computationLabel](v18, "computationLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("Lorem"), v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIFocusableTextView setComputationLabel:](v18, "setComputationLabel:", v20);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVFocusableTextView setMaximumNumberOfLines:](v18, "setMaximumNumberOfLines:", objc_msgSend(v11, "numberOfLinesForTraitCollection:", v22));
  -[VUIFocusableTextView _updateTextColor](v18, "_updateTextColor");
  objc_msgSend(v11, "attributedStringWithString:view:", v15, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length") && v23)
  {
    objc_msgSend(v13, "attributedStringWithString:view:", v12, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_msgSend(v25, "appendAttributedString:", v23);

    v23 = v25;
  }
  -[TVFocusableTextView setDescriptionText:](v18, "setDescriptionText:", v23);
  -[TVFocusableTextView setDescriptionTextAlignment:](v18, "setDescriptionTextAlignment:", objc_msgSend(v11, "alignment"));
  -[TVFocusableTextView setAlwaysFocusable:](v18, "setAlwaysFocusable:", objc_msgSend(v11, "alwaysFocusable"));
  objc_msgSend(v11, "seeMoreHorizontalMargin");
  -[TVFocusableTextView setMoreHorizontalMargin:](v18, "setMoreHorizontalMargin:");

  return v18;
}

+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 titleElement:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v12, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tv_valueForStyle:", *MEMORY[0x1E0DB1900]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v12, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "tv_maxTextLines");

    objc_msgSend(v13, "setNumberOfLines:", v20);
    objc_msgSend(v13, "setNumberOfLinesAXSmall:", v20);
    objc_msgSend(v13, "setNumberOfLinesAXLarge:", v20);
  }
  objc_msgSend(v12, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "string");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "textViewWithString:textLayout:titleString:titleLayout:existingTextView:", v22, v13, v24, v15, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "transferLayoutStylesFromElement:", v12);
  v26 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke;
  v32[3] = &unk_1E9F9EC20;
  v27 = v12;
  v33 = v27;
  objc_msgSend(v25, "setSelectionHandler:", v32);
  v30[0] = v26;
  v30[1] = 3221225472;
  v30[2] = __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke_2;
  v30[3] = &unk_1E9F9EC20;
  v31 = v27;
  v28 = v27;
  objc_msgSend(v25, "setPlayHandler:", v30);

  return v25;
}

uint64_t __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", *MEMORY[0x1E0DB18E8], 1, 1, 0, 0, 0);
}

uint64_t __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", *MEMORY[0x1E0DB18E0], 1, 1, 0, 0, 0);
}

+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  return (id)objc_msgSend(a1, "textViewWithElement:textLayout:titleElement:titleLayout:existingTextView:", a3, a4, 0, 0, a5);
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  double result;

  if (a3)
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_computationLabel, "topMarginToLabel:withBaselineMargin:", a4);
  else
    -[VUIFocusableTextView topMarginWithBaselineMargin:](self, "topMarginWithBaselineMargin:", a4);
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  double result;

  -[VUILabel vui_baselineOffsetFromBottom](self->_computationLabel, "vui_baselineOffsetFromBottom");
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel topMarginWithBaselineMargin:](self->_computationLabel, "topMarginWithBaselineMargin:", a3);
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel bottomMarginWithBaselineMargin:](self->_computationLabel, "bottomMarginWithBaselineMargin:", a3);
  return result;
}

- (void)_updateTextColor
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[VUITextLayout color](self->_textLayout, "color");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout seeMoreTextColor](self->_textLayout, "seeMoreTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[VUITextLayout highlightOrSelectedColor](self->_textLayout, "highlightOrSelectedColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIFocusableTextView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 == 2)
  {
    -[VUITextLayout darkColor](self->_textLayout, "darkColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VUITextLayout darkColor](self->_textLayout, "darkColor");
      v9 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v9;
    }
    -[VUITextLayout darkSeeMoreTextColor](self->_textLayout, "darkSeeMoreTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUITextLayout darkSeeMoreTextColor](self->_textLayout, "darkSeeMoreTextColor");
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v11;
    }
    -[VUITextLayout darkHighlightOrSelectedColor](self->_textLayout, "darkHighlightOrSelectedColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[VUITextLayout darkHighlightOrSelectedColor](self->_textLayout, "darkHighlightOrSelectedColor");
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
    }
  }
  if (!v5)
  {
    v5 = v14;
    if (v3)
      goto LABEL_15;
LABEL_17:
    v3 = v14;
    goto LABEL_15;
  }
  if (!v3)
    goto LABEL_17;
LABEL_15:
  -[TVFocusableTextView setDescriptionTextColor:](self, "setDescriptionTextColor:", v14);
  -[TVFocusableTextView setMoreLabelTextColor:](self, "setMoreLabelTextColor:", v3);
  -[TVFocusableTextView setDescriptionTextHighlightColor:](self, "setDescriptionTextHighlightColor:", v5);

}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)setComputationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_computationLabel, a3);
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (void)setTitleTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
}

@end
