@implementation TLKTextView

- (TLKTextView)init
{
  TLKTextView *v2;
  TLKTextView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TLKTextView;
  v2 = -[TLKTextView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKTextView setBackgroundColor:](v2, "setBackgroundColor:", 0);
    -[TLKTextView setTextContainerInset:](v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[TLKTextView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    -[TLKTextView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[TLKTextView textContainer](v3, "textContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLineFragmentPadding:", 0.0);

    -[TLKTextView textContainer](v3, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", 4);

    -[TLKTextView setEditable:](v3, "setEditable:", 0);
    -[TLKTextView setSelectable:](v3, "setSelectable:", 1);
  }
  return v3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setText:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    +[TLKMultilineText textWithString:](TLKMultilineText, "textWithString:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[TLKTextView textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxLines:", objc_msgSend(v4, "maximumNumberOfLines"));

  -[TLKTextView setMultilineText:](self, "setMultilineText:", v5);
}

- (void)setMultilineText:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  objc_storeStrong((id *)&self->_multilineText, a3);
  v5 = a3;
  -[TLKTextView loadInlineImages](self, "loadInlineImages");
  -[TLKTextView updateAttributedString](self, "updateAttributedString");
  v6 = objc_msgSend(v5, "maxLines");

  -[TLKTextView textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumNumberOfLines:", v6);

  -[TLKTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)loadInlineImages
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLKTextView *v8;

  -[TLKTextView multilineText](self, "multilineText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TLKTextView multilineText](self, "multilineText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__TLKTextView_loadInlineImages__block_invoke;
  v6[3] = &unk_1E5C06D50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  +[TLKFontUtilities cacheInlineImagesForRichText:inView:updateHandler:](TLKFontUtilities, "cacheInlineImagesForRichText:inView:updateHandler:", v5, self, v6);

}

void __31__TLKTextView_loadInlineImages__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__TLKTextView_loadInlineImages__block_invoke_2;
  v4[3] = &unk_1E5C06D50;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  +[TLKUtilities dispatchMainIfNecessary:](TLKUtilities, "dispatchMainIfNecessary:", v4);

}

void __31__TLKTextView_loadInlineImages__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "multilineText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "updateAttributedString");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKTextView;
  -[TLKTextView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKTextView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKTextView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKTextView;
  -[TLKTextView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)urlify
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  TLKTextView *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TLKTextView textStorage](self, "textStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 1, 1);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:range:configuration:", v3, 0, objc_msgSend(v3, "length"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v18 = self;
      v19 = v4;
      v20 = v3;
      v8 = 0;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x1E0DC32B8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "url", v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "scheme");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("http")) & 1) != 0
            || objc_msgSend(v15, "isEqualToString:", CFSTR("https")))
          {
            if (!v8)
              v8 = (void *)objc_msgSend(v21, "mutableCopy");
            v16 = objc_msgSend(v12, "urlificationRange");
            objc_msgSend(v8, "addAttribute:value:range:", v10, v13, v16, v17);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);

      if (!v8)
      {
        v3 = v20;
        goto LABEL_20;
      }
      v22.receiver = v18;
      v22.super_class = (Class)TLKTextView;
      -[TLKTextView setText:](&v22, sel_setText_, &stru_1E5C079F8);
      -[TLKTextView textStorage](v18, "textStorage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendAttributedString:", v8);
      v3 = v20;
    }
    else
    {

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
LABEL_20:

}

- (void)tlk_updateForAppearance:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TLKTextView;
  -[UIView tlk_updateForAppearance:](&v4, sel_tlk_updateForAppearance_, a3);
  -[TLKTextView loadInlineImages](self, "loadInlineImages");
  -[TLKTextView updateAttributedString](self, "updateAttributedString");
}

- (void)updateAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;

  +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextView attributedText](self, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v33.receiver = self;
  v33.super_class = (Class)TLKTextView;
  -[TLKTextView setText:](&v33, sel_setText_, &stru_1E5C079F8);
  -[TLKTextView multilineText](self, "multilineText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[TLKTextView multilineText](self, "multilineText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    -[TLKTextView textStorage](self, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TLKTextView prominence](self, "prominence");
    v12 = -[TLKTextView textAlignment](self, "textAlignment");
    -[TLKTextView font](self, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextView effectiveScreenScale](self, "effectiveScreenScale");
    v15 = v14;
    LOBYTE(v30) = objc_msgSend(v3, "isDark");
    +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:", v9, v3, v11, v12, v13, 0, v15, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", v16);

    -[TLKTextView attributedText](self, "attributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (!v18)
    {
      objc_msgSend(v9, "text");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = &stru_1E5C079F8;
      v32.receiver = self;
      v32.super_class = (Class)TLKTextView;
      -[TLKTextView setText:](&v32, sel_setText_, v21);

    }
    if (-[TLKTextView automaticUrlification](self, "automaticUrlification"))
    {
      -[TLKTextView textStorage](self, "textStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v5, "isEqual:", v22);

      if ((v23 & 1) == 0)
        -[TLKTextView urlify](self, "urlify");
    }

  }
  else
  {

    if (v9)
    {
      -[TLKTextView multilineText](self, "multilineText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31.receiver = self;
      v31.super_class = (Class)TLKTextView;
      -[TLKTextView setText:](&v31, sel_setText_, v25);

      if (-[TLKTextView automaticUrlification](self, "automaticUrlification"))
      {
        -[TLKTextView textStorage](self, "textStorage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v5, "isEqual:", v26);

        if ((v27 & 1) == 0)
          -[TLKTextView urlify](self, "urlify");
      }
    }
    else
    {
      -[TLKTextView textStorage](self, "textStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAttributedString:", v5);

    }
  }
  objc_msgSend(v3, "colorForProminence:", -[TLKTextView prominence](self, "prominence"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextView setTextColor:](self, "setTextColor:", v29);

  objc_msgSend(v3, "enableAppearanceForView:", self);
}

- (BOOL)allowsVibrancy
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[TLKTextView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextView layoutManager](self, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ensureLayoutForTextContainer:", v3);
  objc_msgSend(v4, "usedRectForTextContainer:", v3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  double v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKTextView;
  -[TLKTextView effectiveFirstBaselineOffsetFromTop](&v8, sel_effectiveFirstBaselineOffsetFromTop);
  if (v3 != 0.0)
    return v3;
  -[TLKTextView font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ascender");
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
  v6 = v5;

  return v6;
}

- (double)effectiveBaselineOffsetFromBottom
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TLKTextView;
  -[TLKTextView effectiveBaselineOffsetFromBottom](&v9, sel_effectiveBaselineOffsetFromBottom);
  if (v3 != 0.0)
    return v3;
  -[TLKTextView font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, -v5);
  v7 = v6;

  return v7;
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (TLKMultilineText)multilineText
{
  return self->_multilineText;
}

- (BOOL)automaticUrlification
{
  return self->_automaticUrlification;
}

- (void)setAutomaticUrlification:(BOOL)a3
{
  self->_automaticUrlification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilineText, 0);
}

@end
