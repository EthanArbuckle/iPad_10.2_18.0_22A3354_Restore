@implementation VUILabel

- (double)topMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel topMarginWithBaselineMargin:maximumContentSizeCategory:](self, "topMarginWithBaselineMargin:maximumContentSizeCategory:", -[VUITextLayout maximumContentSizeCategory](self->_textLayout, "maximumContentSizeCategory"), a3);
  return result;
}

+ (VUILabel)labelWithString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  __int128 v35;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  v12 = objc_msgSend(v8, "fadesOutTextTruncation");
  objc_msgSend(v11, "computationLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(v11, "computationLabel");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v17 = (void *)v15;

    objc_msgSend(v17, "setVuiNumberOfLines:", 0);
    objc_msgSend(v17, "setVuiAlpha:", 0.0);
    objc_msgSend(v11, "setComputationLabel:", v17);
    objc_msgSend(v11, "addSubview:", v17);
  }
  else
  {
    objc_msgSend(v13, "removeFromSuperview");

    objc_msgSend(v11, "setComputationLabel:", 0);
    objc_msgSend(v11, "setTruncationMask:", 0);
    objc_msgSend(v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMask:", 0);

    v17 = 0;
  }
  objc_msgSend(v17, "setTextLayout:", v8);
  objc_msgSend(v11, "setTextLayout:", v8);
  objc_msgSend(v11, "setPreferredVibrancy:", objc_msgSend(v8, "preferredVibrancy"));
  objc_msgSend(v11, "setVuiNumberOfLines:", +[VUILabel _numberOfLinesForLayout:](VUILabel, "_numberOfLinesForLayout:", v8));
  objc_msgSend(v8, "padding");
  objc_msgSend(v11, "setPadding:");
  objc_msgSend(v11, "setHighlightedTextColor:", 0);
  objc_msgSend(v8, "fontSize");
  objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", v18 == 0.0);
  objc_msgSend(v8, "fontSize");
  objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", v19 == 0.0);
  objc_msgSend(v8, "minimumScaleFactor");
  if (v20 > 0.0)
  {
    objc_msgSend(v8, "minimumScaleFactor");
    objc_msgSend(v11, "setMinimumScaleFactor:");
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v8, "minimumScaleFactor");
    objc_msgSend(v17, "setMinimumScaleFactor:");
    objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", 1);
  }
  objc_msgSend(v8, "attributedStringWithString:view:", v7, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "vuiIsRTL") && objc_msgSend(v21, "length"))
  {
    v35 = xmmword_1DA1C1A80;
    v22 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v21, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0DC1178], 0, &v35, 0, objc_msgSend(v21, "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    if ((_QWORD)v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = (void *)objc_msgSend(v21, "mutableCopy");
      objc_msgSend(v24, "setBaseWritingDirection:", 1);
      objc_msgSend(v25, "addAttribute:value:range:", v22, v24, v35);

      v21 = v25;
    }

  }
  objc_msgSend(v11, "setVuiAttributedText:", v21);
  objc_msgSend(v8, "shadow");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    v28 = objc_msgSend(v8, "appliesShadowToContainer");

    if (v28)
    {
      objc_msgSend(v8, "shadow");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shadowColor");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v30, "setShadowColor:", objc_msgSend(v31, "CGColor"));

      objc_msgSend(v29, "shadowBlurRadius");
      objc_msgSend(v30, "setShadowRadius:");
      objc_msgSend(v29, "shadowOffset");
      objc_msgSend(v30, "setShadowOffset:");
      objc_msgSend(v30, "setMasksToBounds:", 0);

    }
  }
  if (v21 && objc_msgSend(v21, "length"))
  {
    objc_msgSend(v21, "attributesAtIndex:effectiveRange:", 0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "defaultAttributesForLabel:", v11);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;
  objc_msgSend(v11, "_setDefaultAttributes:", v32);
  objc_msgSend(v17, "_setDefaultAttributes:", v33);
  objc_msgSend(v11, "_updateCompositingFilter");
  objc_msgSend(v11, "_configureAlignmentIfNeeded");
  if (objc_msgSend(v8, "enableAXUnderlineButtonShape"))
    objc_msgSend(v11, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
  objc_msgSend(v11, "_updateTextColor");

  return (VUILabel *)v11;
}

- (void)setVuiAttributedText:(id)a3
{
  id v4;

  v4 = a3;
  -[VUILabel setAttributedText:](self, "setAttributedText:", v4);
  -[VUILabel setAttributedText:](self->_computationLabel, "setAttributedText:", v4);

}

- (void)setTruncationMask:(id)a3
{
  objc_storeStrong((id *)&self->_truncationMask, a3);
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (self->_padding.left != a3.left
    || self->_padding.top != a3.top
    || self->_padding.right != a3.right
    || self->_padding.bottom != a3.bottom)
  {
    self->_padding = a3;
    -[VUILabel _clearCachedValues](self, "_clearCachedValues");
  }
}

- (void)setNumberOfLines:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setNumberOfLines:](&v4, sel_setNumberOfLines_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setComputationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_computationLabel, a3);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VUITextLayout *textLayout;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  VUILabel *v33;
  id obj;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (UIAccessibilityDarkerSystemColorsEnabled() || UIAccessibilityIsReduceTransparencyEnabled())
  {
    v6 = *MEMORY[0x1E0DC1140];
    v7 = objc_msgSend(v4, "length");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __30__VUILabel_setAttributedText___block_invoke;
    v40[3] = &unk_1E9F9DE60;
    v40[4] = self;
    v41 = v5;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v40);

  }
  -[VUILabel _rangeOfStringExcludingAttachments:](self, "_rangeOfStringExcludingAttachments:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  textLayout = self->_textLayout;
  if (textLayout
    && -[VUITextLayout appliesDirectionalIsolates](textLayout, "appliesDirectionalIsolates")
    && objc_msgSend(v8, "count"))
  {
    v31 = v4;
    v33 = self;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(obj);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "rangeValue", v29, v31);
          v16 = v15;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁨"));
          objc_msgSend(v5, "insertAttributedString:atIndex:", v17, v14);

          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁩"));
          objc_msgSend(v5, "insertAttributedString:atIndex:", v18, v14 + v16);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v11);
    }

    self = v33;
    v19 = -[VUILabel effectiveUserInterfaceLayoutDirection](v33, "effectiveUserInterfaceLayoutDirection");
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v19 == 1)
      v21 = CFSTR("⁧");
    else
      v21 = CFSTR("⁦");
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21, v29, v31);
    objc_msgSend(v5, "insertAttributedString:atIndex:", v22, 0);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁩"));
    objc_msgSend(v5, "appendAttributedString:", v23);

    v8 = v30;
    v4 = v32;
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "languageStringHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(v5, "copy");
  -[VUILabel defaultParagraphStyle](self, "defaultParagraphStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "makeLanguageAwareAttributedString:defaultParagraphStyle:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v35.receiver = self;
  v35.super_class = (Class)VUILabel;
  -[VUILabel setAttributedText:](&v35, sel_setAttributedText_, v28);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");

}

- (id)_rangeOfStringExcludingAttachments:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v3)
  {
    v5 = v4;
    v6 = 0;
    if (objc_msgSend(v3, "containsAttachmentsInRange:", 0, v4))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__VUILabel__rangeOfStringExcludingAttachments___block_invoke;
      v9[3] = &unk_1E9F9BCD8;
      v6 = v7;
      v10 = v6;
      objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_clearCachedValues
{
  CGPoint v2;
  CGSize v3;
  CGSize v4;

  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_cachedTextRectForBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_cachedTextRectForBounds.size = v3;
  self->_previousBounds.origin = v2;
  self->_previousBounds.size = v3;
  self->_previousNumberOfLines = 0;
  v4 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E0C9D820];
  self->_previousTargetSize = v4;
}

- (id)defaultParagraphStyle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", -[VUILabel textAlignment](self, "textAlignment"));
  objc_msgSend(v4, "setLineBreakMode:", -[VUILabel lineBreakMode](self, "lineBreakMode"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)_updateTextColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;

  -[VUITextLayout color](self->_textLayout, "color");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[VUITextLayout highContrastTintColor](self->_textLayout, "highContrastTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      v6 = v16;
    }
    else
    {
      -[VUILabel _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v16);
      v7 = objc_claimAutoreleasedReturnValue();
      v6 = v16;
      v5 = (id)v7;
    }

    v16 = v5;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v16, "colorByRemovingTransparency");
    v8 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v8;
  }
  if ((-[VUILabel isEnabled](self, "isEnabled") & 1) == 0)
  {
    -[VUITextLayout disabledColor](self->_textLayout, "disabledColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[VUITextLayout disabledColor](self->_textLayout, "disabledColor");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v13 = (void *)v10;

      v16 = v13;
      goto LABEL_18;
    }
  }
  if (self->_lastSelectedOrHighlighted)
  {
    -[VUITextLayout highlightOrSelectedColor](self->_textLayout, "highlightOrSelectedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[VUITextLayout highlightOrSelectedColor](self->_textLayout, "highlightOrSelectedColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  if (-[VUILabel vuiUserInterfaceStyle](self, "vuiUserInterfaceStyle") == 2)
  {
    -[VUITextLayout darkColor](self->_textLayout, "darkColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[VUITextLayout darkColor](self->_textLayout, "darkColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
LABEL_18:
  if (-[VUITextLayout appliesColorToStringAttachments](self->_textLayout, "appliesColorToStringAttachments")
    || (v14 = -[VUILabel _updateTextColorExcludingAttachments:](self, "_updateTextColorExcludingAttachments:", v16),
        v15 = v16,
        !v14))
  {
    -[VUILabel setTextColor:](self, "setTextColor:", v16);
    v15 = v16;
  }

}

- (void)setTextColor:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[VUILabel _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v4, "colorByRemovingTransparency");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUILabel;
  -[VUILabel setTextColor:](&v6, sel_setTextColor_, v4);

}

- (BOOL)_updateTextColorExcludingAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUILabel attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILabel _rangeOfStringExcludingAttachments:](self, "_rangeOfStringExcludingAttachments:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[VUILabel vuiAttributedText](self, "vuiAttributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v11 = v10 != 0;
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v20;
      v14 = *MEMORY[0x1E0DC1140];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v9);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "rangeValue", (_QWORD)v19);
          objc_msgSend(v8, "addAttribute:value:range:", v14, v4, v16, v17);
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)attributedText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILabel;
  -[VUILabel attributedText](&v3, sel_attributedText);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateCompositingFilter
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  VUITextLayout *textLayout;
  void *v9;
  id v10;

  -[VUITextLayout darkCompositingFilter](self->_textLayout, "darkCompositingFilter");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[VUITextLayout compositingFilter](self->_textLayout, "compositingFilter"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[VUILabel traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    textLayout = self->_textLayout;
    if (v7 == 2)
      -[VUITextLayout darkCompositingFilter](textLayout, "darkCompositingFilter");
    else
      -[VUITextLayout compositingFilter](textLayout, "compositingFilter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[VUILabel layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v10);

  }
  else
  {
    -[VUILabel layer](self, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", 0);
  }

}

- (void)_configureAlignmentIfNeeded
{
  VUITextLayout *textLayout;

  textLayout = self->_textLayout;
  if (textLayout
    && -[VUITextLayout allowsTextAlignmentOverride](textLayout, "allowsTextAlignmentOverride")
    && -[VUILabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1
    && -[VUITextLayout alignment](self->_textLayout, "alignment") == 4)
  {
    -[VUILabel setVuiTextAlignment:](self, "setVuiTextAlignment:", 2);
  }
}

+ (unint64_t)_numberOfLinesForLayout:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1E0DC3BF8];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "numberOfLinesForTraitCollection:", v6);
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUILabel padding](self, "padding");
  v7 = v6;
  v9 = v8;
  v35 = v11;
  v36 = v10;
  v12 = fmax(width - (v6 + v8), 0.0);
  v13 = fmax(height - (v10 + v11), 0.0);
  -[VUILabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v15 = v14;
  v17 = v16;
  -[VUILabel previousTargetSize](self, "previousTargetSize");
  v19 = v18;
  v21 = v20;
  -[VUILabel previousTraitCollection](self, "previousTraitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIView vui_shouldRecomputeCachedSizeThatFits:previousTargetSize:previousTraitCollection:newTargetSize:](self, "vui_shouldRecomputeCachedSizeThatFits:previousTargetSize:previousTraitCollection:newTargetSize:", v22, v15, v17, v19, v21, v12, v13);

  if (v23)
  {
    v37.receiver = self;
    v37.super_class = (Class)VUILabel;
    -[VUILabel sizeThatFits:](&v37, sel_sizeThatFits_, v12, v13);
    v25 = v24;
    VUICeilValue();
    v27 = v26;
    VUICeilValue();
    -[VUILabel setCachedSizeThatFits:](self, "setCachedSizeThatFits:", v27, v28);
    if (v12 <= 0.0)
      v25 = v12;
    -[VUILabel vuiTraitCollection](self, "vuiTraitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILabel setPreviousTraitCollection:](self, "setPreviousTraitCollection:", v29);

    -[VUILabel setPreviousTargetSize:](self, "setPreviousTargetSize:", v25, v13);
  }
  -[VUILabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v31 = v9 + v7 + v30;
  -[VUILabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v33 = v35 + v36 + v32;
  v34 = v31;
  result.height = v33;
  result.width = v34;
  return result;
}

- (CGSize)cachedSizeThatFits
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedSizeThatFits.width;
  height = self->_cachedSizeThatFits.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_previousTraitCollection, a3);
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (UITraitCollection)previousTraitCollection
{
  return self->_previousTraitCollection;
}

- (CGSize)previousTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousTargetSize.width;
  height = self->_previousTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v7 = (void *)MEMORY[0x1E0DC69B0];
  -[VUILabel vuiTraitCollection](self, "vuiTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v8, a4, a3);
  v10 = v9;

  -[VUILabel baselineHeight](self, "baselineHeight");
  return v10 - v11;
}

- (double)vuiBaselineHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  -[VUILabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
  v4 = v3;
  if (v3 <= 0.0)
  {
    -[VUILabel font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUILabel font](self, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "baselineHeight");
      v4 = v7;

    }
  }
  return v4;
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect result;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VUILabel previousBounds](self, "previousBounds");
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectEqualToRect(v15, v18)
    || -[VUILabel previousNumberOfLines](self, "previousNumberOfLines") != a4
    || (-[VUILabel cachedTextRectForBounds](self, "cachedTextRectForBounds"),
        CGRectEqualToRect(v16, *MEMORY[0x1E0C9D648])))
  {
    v14.receiver = self;
    v14.super_class = (Class)VUILabel;
    -[VUILabel textRectForBounds:limitedToNumberOfLines:](&v14, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    -[VUILabel setCachedTextRectForBounds:](self, "setCachedTextRectForBounds:");
    -[VUILabel setPreviousBounds:](self, "setPreviousBounds:", x, y, width, height);
    -[VUILabel setPreviousNumberOfLines:](self, "setPreviousNumberOfLines:", a4);
  }
  -[VUILabel cachedTextRectForBounds](self, "cachedTextRectForBounds");
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)cachedTextRectForBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedTextRectForBounds.origin.x;
  y = self->_cachedTextRectForBounds.origin.y;
  width = self->_cachedTextRectForBounds.size.width;
  height = self->_cachedTextRectForBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)previousBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousBounds.origin.x;
  y = self->_previousBounds.origin.y;
  width = self->_previousBounds.size.width;
  height = self->_previousBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousNumberOfLines:(int64_t)a3
{
  self->_previousNumberOfLines = a3;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (void)setCachedTextRectForBounds:(CGRect)a3
{
  self->_cachedTextRectForBounds = a3;
}

- (VUILabel)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v7;
  VUILabel *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;
  void *v25;
  _QWORD v26[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VUILabel;
  v7 = -[VUILabel initWithFrame:](&v24, sel_initWithFrame_);
  v8 = (VUILabel *)v7;
  if (v7)
  {
    *((CGFloat *)v7 + 119) = x;
    *((CGFloat *)v7 + 120) = y;
    *((CGFloat *)v7 + 121) = width;
    *((CGFloat *)v7 + 122) = height;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v7 + 984) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v7 + 1000) = v9;
    *((_QWORD *)v7 + 108) = 0;
    *((CGFloat *)v7 + 111) = width;
    *((CGFloat *)v7 + 112) = height;
    *(_OWORD *)(v7 + 904) = *MEMORY[0x1E0C9D820];
    objc_msgSend(v7, "setPreferredVibrancy:", 0);
    objc_initWeak(&location, v8);
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __26__VUILabel_initWithFrame___block_invoke;
    v21[3] = &unk_1E9F99F98;
    objc_copyWeak(&v22, &location);
    -[VUILabel vui_registerForTraitChanges:withHandler:](v8, "vui_registerForTraitChanges:withHandler:", v12, v21);

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __26__VUILabel_initWithFrame___block_invoke_2;
    v19[3] = &unk_1E9F99F98;
    objc_copyWeak(&v20, &location);
    -[VUILabel vui_registerForTraitChanges:withHandler:](v8, "vui_registerForTraitChanges:withHandler:", v15, v19);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_contrastSettingsDidChange, *MEMORY[0x1E0DC4508], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_transparencySettingsDidChange, *MEMORY[0x1E0DC45B8], 0);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __47__VUILabel__rangeOfStringExcludingAttachments___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DC10F8]);

  if ((v8 & 1) == 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

void __26__VUILabel_initWithFrame___block_invoke_2(uint64_t a1)
{
  void *v1;
  int v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "shouldUpdateTextColor");

  if (v2)
    objc_msgSend(WeakRetained, "_updateTextColor");
  objc_msgSend(WeakRetained, "_updateCompositingFilter");

}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6;
  int HasExuberatedLineHeight;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = a3;
  if (v6)
  {
    HasExuberatedLineHeight = CTFontHasExuberatedLineHeight();
    -[VUILabel languageAwareSystemSpacingMultiplier](self, "languageAwareSystemSpacingMultiplier");
    v9 = v8;
    if (-[VUILabel useLanguageAwareMarginScaling](self, "useLanguageAwareMarginScaling") && HasExuberatedLineHeight)
    {
      -[VUILabel font](self, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_scaledValueForValue:useLanguageAwareScaling:", 1, a4);
      v12 = v11;

LABEL_13:
      -[VUILabel baselineHeight](self, "baselineHeight");
      v20 = v12 - v19;
      objc_msgSend(v6, "vui_baselineOffsetFromBottom");
      v15 = v20 - v21;
      goto LABEL_14;
    }
    if (v9 > 0.0)
      v14 = HasExuberatedLineHeight;
    else
      v14 = 0;
    if (v14 != 1)
    {
      v16 = (void *)MEMORY[0x1E0DC69B0];
      -[VUILabel traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v17, -[VUITextLayout maximumContentSizeCategory](self->_textLayout, "maximumContentSizeCategory"), a4);
      v12 = v18;

      goto LABEL_13;
    }
    -[VUILabel _systemSpacingBelowView:multiplier:](self, "_systemSpacingBelowView:multiplier:", v6, v9);
  }
  else
  {
    -[VUILabel topMarginWithBaselineMargin:](self, "topMarginWithBaselineMargin:", a4);
  }
  v15 = v13;
LABEL_14:

  return v15;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILabel;
  -[VUILabel tintColorDidChange](&v6, sel_tintColorDidChange);
  if (-[VUILabel tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILabel textColor](self, "textColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v3)
    {
      -[VUILabel setAdjustmentModeNormalTintColor:](self, "setAdjustmentModeNormalTintColor:", v3);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILabel setTextColor:](self, "setTextColor:", v5);

    }
  }
  else if (self->_adjustmentModeNormalTintColor)
  {
    -[VUILabel setTextColor:](self, "setTextColor:");
    -[VUILabel setAdjustmentModeNormalTintColor:](self, "setAdjustmentModeNormalTintColor:", 0);
  }
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setLabelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (void)setFont:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setFont:](&v4, sel_setFont_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  -[VUILabel setEnabled:](&v5, sel_setEnabled_, a3);
  v4 = (-[VUILabel isHighlighted](self, "isHighlighted") & 1) != 0 || self->_selected;
  -[VUILabel _updateTextColor:](self, "_updateTextColor:", v4);
}

- (void)setAttributedTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setAdjustsFontSizeToFitWidth:](&v4, sel_setAdjustsFontSizeToFitWidth_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (BOOL)requiresMoreThanOneLineForTextWidth:(double)a3
{
  return -[VUILabel numberOfLinesRequiredForTextWidth:](self, "numberOfLinesRequiredForTextWidth:", a3) > 1;
}

- (int64_t)previousNumberOfLines
{
  return self->_previousNumberOfLines;
}

- (unint64_t)numberOfLinesRequiredForTextWidth:(double)a3
{
  unint64_t result;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  double v16;

  -[VUILabel attributedText](self, "attributedText");
  result = objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v6 = (void *)result;
    -[VUILabel attributedText](self, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[UIView vui_sizeThatFits:layout:](self, "vui_sizeThatFits:layout:", 0, a3, 0.0);
      v10 = v9;
      -[VUILabel font](self, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lineHeight");
      v13 = v12;

      if (v13 == 0.0)
      {
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[VUILabel numberOfLinesRequiredForTextWidth:].cold.1(self, v14);

        return 1;
      }
      else
      {
        v15 = floor(v10 / v13);
        v16 = ceil(v10 / v13);
        if (v10 / v13 - v15 <= 0.9)
          return (int)v15;
        return (int)v16;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILabel;
  -[VUILabel layoutSubviews](&v3, sel_layoutSubviews);
  -[VUILabel _updateTruncationMask](self, "_updateTruncationMask");
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)drawTextInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VUILabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VUILabel padding](self, "padding");
  v23.origin.x = v9 + v16;
  v23.origin.y = v11 + v17;
  v23.size.width = v13 - (v16 + v18);
  v23.size.height = v15 - (v17 + v19);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectIntersection(v21, v23);
  v20.receiver = self;
  v20.super_class = (Class)VUILabel;
  -[VUILabel drawTextInRect:](&v20, sel_drawTextInRect_, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4508], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  -[VUILabel dealloc](&v5, sel_dealloc);
}

- (double)bottomMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v7 = (void *)MEMORY[0x1E0DC69B0];
  -[VUILabel vuiTraitCollection](self, "vuiTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v8, a4, a3);
  v10 = v9;

  -[VUILabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
  return v10 - v11;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  double result;

  -[VUILabel bottomMarginWithBaselineMargin:maximumContentSizeCategory:](self, "bottomMarginWithBaselineMargin:maximumContentSizeCategory:", -[VUITextLayout maximumContentSizeCategory](self->_textLayout, "maximumContentSizeCategory"), a3);
  return result;
}

- (void)_updateTruncationMask
{
  double v3;
  double v4;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  if (-[VUITextLayout fadesOutTextTruncation](self->_textLayout, "fadesOutTextTruncation"))
  {
    -[VUILabel bounds](self, "bounds");
    if (v4 != *MEMORY[0x1E0C9D820] || v3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      if (-[VUILabel _isTruncatedForTruncationMask](self, "_isTruncatedForTruncationMask"))
      {
        if (!self->_truncationMask)
          -[VUILabel _setupTruncationMask](self, "_setupTruncationMask");
        -[VUILabel bounds](self, "bounds");
        v7 = v6;
        -[VUILabel bounds](self, "bounds");
        -[CALayer setFrame:](self->_truncationMask, "setFrame:");
        -[CALayer sublayers](self->_truncationMask, "sublayers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        -[VUILabel numberOfLinesRequiredForTextWidth:](self, "numberOfLinesRequiredForTextWidth:", v7);
        -[VUILabel bounds](self, "bounds");
        -[VUILabel vuiIsRTL](self, "vuiIsRTL");
        VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
        objc_msgSend(v10, "setFrame:");
        -[VUILabel layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMask:", self->_truncationMask);

      }
      else
      {
        -[VUILabel layer](self, "layer");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMask:", 0);
      }

    }
  }
}

- (void)_updateTextColor:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  id v16;

  v3 = a3;
  if (self->_lastSelectedOrHighlighted != a3 || (-[VUILabel isEnabled](self, "isEnabled") & 1) == 0)
  {
    -[VUITextLayout color](self->_textLayout, "color");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[VUITextLayout shouldUpdateTextColor](self->_textLayout, "shouldUpdateTextColor");

      if (v7)
      {
        self->_lastSelectedOrHighlighted = v3;
        -[VUITextLayout color](self->_textLayout, "color");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (-[VUILabel vuiUserInterfaceStyle](self, "vuiUserInterfaceStyle") == 2)
        {
          -[VUITextLayout darkColor](self->_textLayout, "darkColor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[VUITextLayout darkColor](self->_textLayout, "darkColor");
            v9 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v9;
          }
        }
        if (v3)
        {
          -[VUITextLayout highlightOrSelectedColor](self->_textLayout, "highlightOrSelectedColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            -[VUITextLayout highlightOrSelectedColor](self->_textLayout, "highlightOrSelectedColor");
            v11 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v11;
          }
        }
        if ((-[VUILabel isEnabled](self, "isEnabled") & 1) == 0)
        {
          -[VUITextLayout disabledColor](self->_textLayout, "disabledColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            -[VUITextLayout disabledColor](self->_textLayout, "disabledColor");
            v13 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v13;
          }
        }
        if (-[VUITextLayout appliesColorToStringAttachments](self->_textLayout, "appliesColorToStringAttachments")
          || (v14 = -[VUILabel _updateTextColorExcludingAttachments:](self, "_updateTextColorExcludingAttachments:", v16), v15 = v16, !v14))
        {
          -[VUILabel setTextColor:](self, "setTextColor:", v16);
          v15 = v16;
        }

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, 0);
  objc_storeStrong((id *)&self->_previousTraitCollection, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
  objc_storeStrong((id *)&self->_truncationMask, 0);
  objc_storeStrong(&self->_attributedTextProvider, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

+ (VUILabel)labelWithAttributedString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  v12 = objc_msgSend(v7, "fadesOutTextTruncation");
  objc_msgSend(v11, "computationLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(v11, "computationLabel");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v17 = (void *)v15;

    objc_msgSend(v17, "setVuiNumberOfLines:", 0);
    objc_msgSend(v17, "setVuiAlpha:", 0.0);
    objc_msgSend(v11, "setComputationLabel:", v17);
    objc_msgSend(v11, "addSubview:", v17);
  }
  else
  {
    objc_msgSend(v13, "removeFromSuperview");

    objc_msgSend(v11, "setComputationLabel:", 0);
    objc_msgSend(v11, "setTruncationMask:", 0);
    objc_msgSend(v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMask:", 0);

    v17 = 0;
  }
  objc_msgSend(v17, "setTextLayout:", v7);
  objc_msgSend(v11, "setTextLayout:", v7);
  objc_msgSend(v11, "setVuiNumberOfLines:", +[VUILabel _numberOfLinesForLayout:](VUILabel, "_numberOfLinesForLayout:", v7));
  objc_msgSend(v11, "setPreferredVibrancy:", objc_msgSend(v7, "preferredVibrancy"));
  objc_msgSend(v11, "setHighlightedTextColor:", 0);
  objc_msgSend(v7, "fontSize");
  objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", v18 == 0.0);
  objc_msgSend(v7, "fontSize");
  objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", v19 == 0.0);
  objc_msgSend(v7, "minimumScaleFactor");
  if (v20 > 0.0)
  {
    objc_msgSend(v7, "minimumScaleFactor");
    objc_msgSend(v11, "setMinimumScaleFactor:");
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "minimumScaleFactor");
    objc_msgSend(v17, "setMinimumScaleFactor:");
    objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", 1);
  }
  objc_msgSend(v7, "attributedStringWithAttributedString:view:updateTextColor:", v9, v11, objc_msgSend(v7, "shouldUpdateTextColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setVuiAttributedText:", v21);
  objc_msgSend(v11, "_updateCompositingFilter");
  objc_msgSend(v11, "_configureAlignmentIfNeeded");
  if (objc_msgSend(v7, "enableAXUnderlineButtonShape"))
    objc_msgSend(v11, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);

  return (VUILabel *)v11;
}

void __26__VUILabel_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "textLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfLinesForTraitCollection:", v1);

  objc_msgSend(WeakRetained, "setVuiNumberOfLines:", v3);
  objc_msgSend(WeakRetained, "textLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "attributedTextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (objc_msgSend(WeakRetained, "attributedTextProvider"),
          v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(),
          v6[2](),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      objc_msgSend(WeakRetained, "textLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "attributedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (const __CFString *)v10;
      else
        v12 = &stru_1E9FF3598;
      objc_msgSend(v8, "attributedStringWithString:view:", v12, WeakRetained);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(WeakRetained, "setAttributedText:", v7);
    if ((objc_msgSend(WeakRetained, "isEnabled") & 1) != 0
      || (objc_msgSend(WeakRetained, "textLayout"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "disabledColor"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14))
    {
      if (!WeakRetained[809])
        goto LABEL_15;
      objc_msgSend(WeakRetained, "textLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "highlightOrSelectedColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_15;
      objc_msgSend(WeakRetained, "textLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "highlightOrSelectedColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(WeakRetained, "textLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "disabledColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v16;
    objc_msgSend(WeakRetained, "setTextColor:", v16);

LABEL_15:
  }

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)VUILabel;
  -[VUILabel vui_layoutSubviews:computationOnly:](&v16, sel_vui_layoutSubviews_computationOnly_);
  if (v4)
  {
    -[VUILabel sizeThatFits:](self, "sizeThatFits:", width, height);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = v8;
    v13 = v9;
    -[VUILabel layoutSubviews](self, "layoutSubviews");
  }
  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setVuiText:(id)a3
{
  id v4;

  v4 = a3;
  -[VUILabel setText:](self, "setText:", v4);
  -[VUILabel setText:](self->_computationLabel, "setText:", v4);

}

void __30__VUILabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v16;
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "highContrastTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_accessibilityHigherContrastTintColorForColor:", v9);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      v9 = v13;
    }
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      objc_msgSend(v9, "colorByRemovingTransparency");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }
    v15 = *MEMORY[0x1E0DC1140];
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v15, v9, a3, a4);

    v8 = v16;
  }

}

- (void)useExtremeSizingOnTallScripts
{
  if (CTFontHasExuberatedLineHeight())
    -[VUILabel _setExtremeSizingEnabled:](self, "_setExtremeSizingEnabled:", 1);
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setText:](&v4, sel_setText_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setLineBreakMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setLineBreakMode:](&v4, sel_setLineBreakMode_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setBaselineAdjustment:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  -[VUILabel setBaselineAdjustment:](&v4, sel_setBaselineAdjustment_, a3);
  -[VUILabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)_setupTruncationMask
{
  CALayer *v3;
  CALayer *truncationMask;
  CALayer *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (CALayer *)objc_opt_new();
  truncationMask = self->_truncationMask;
  self->_truncationMask = v3;

  v5 = self->_truncationMask;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[0] = objc_msgSend(v8, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[1] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColors:", v10);

  if (-[VUILabel vuiIsRTL](self, "vuiIsRTL"))
    v11 = 1.0;
  else
    v11 = 0.0;
  objc_msgSend(v7, "setStartPoint:", v11, 0.5);
  if (-[VUILabel vuiIsRTL](self, "vuiIsRTL"))
    v12 = 0.0;
  else
    v12 = 1.0;
  objc_msgSend(v7, "setEndPoint:", v12, 0.5);
  objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
  -[CALayer addSublayer:](self->_truncationMask, "addSublayer:", v7);

}

- (BOOL)_isTruncatedForTruncationMask
{
  VUILabel *computationLabel;
  double v4;
  double v5;
  double v6;
  double v7;

  computationLabel = self->_computationLabel;
  if (!computationLabel)
    return 0;
  -[VUILabel bounds](self, "bounds");
  -[UIView vui_sizeThatFits:](computationLabel, "vui_sizeThatFits:", v4, 0.0);
  v6 = v5;
  -[VUILabel bounds](self, "bounds");
  return v6 > v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  -[VUILabel setHighlighted:](&v5, sel_setHighlighted_);
  -[VUILabel vui_setHighlighted:](self, "vui_setHighlighted:", v3);
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  -[VUILabel setHighlighted:](&v5, sel_setHighlighted_, a3);
  v4 = (-[VUILabel isHighlighted](self, "isHighlighted") & 1) != 0 || self->_selected;
  -[VUILabel _updateTextColor:](self, "_updateTextColor:", v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_selected = a3;
  -[VUILabel vui_setSelected:animated:withAnimationCoordinator:](self, "vui_setSelected:animated:withAnimationCoordinator:");
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  uint64_t v6;

  if (self->_selected)
    v6 = 1;
  else
    v6 = -[VUILabel isHighlighted](self, "isHighlighted", a3, a4, a5);
  -[VUILabel _updateTextColor:](self, "_updateTextColor:", v6, a4, a5);
}

- (id)attributedTextProvider
{
  return self->_attributedTextProvider;
}

- (BOOL)useLanguageAwareMarginScaling
{
  return self->_useLanguageAwareMarginScaling;
}

- (void)setUseLanguageAwareMarginScaling:(BOOL)a3
{
  self->_useLanguageAwareMarginScaling = a3;
}

- (double)languageAwareSystemSpacingMultiplier
{
  return self->_languageAwareSystemSpacingMultiplier;
}

- (void)setLanguageAwareSystemSpacingMultiplier:(double)a3
{
  self->_languageAwareSystemSpacingMultiplier = a3;
}

- (CALayer)truncationMask
{
  return self->_truncationMask;
}

- (UIColor)adjustmentModeNormalTintColor
{
  return self->_adjustmentModeNormalTintColor;
}

- (void)setAdjustmentModeNormalTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, a3);
}

- (void)numberOfLinesRequiredForTextWidth:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "%@ line height is 0.0", (uint8_t *)&v4, 0xCu);

}

@end
