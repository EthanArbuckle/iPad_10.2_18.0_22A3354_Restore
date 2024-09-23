@implementation TLKLabel

- (void)setFont:(id)a3
{
  -[TLKLabel setFont:keepOriginal:](self, "setFont:keepOriginal:", a3, 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKLabel;
  -[TLKLabel didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setFont:(id)a3 keepOriginal:(BOOL)a4
{
  id v6;
  id v7;
  UIFont *originalFont;
  void *v9;
  objc_super v10;

  v6 = a3;
  -[TLKLabel font](self, "font");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    if (!a4)
    {
      originalFont = self->_originalFont;
      self->_originalFont = 0;

    }
    v10.receiver = self;
    v10.super_class = (Class)TLKLabel;
    -[TLKLabel setFont:](&v10, sel_setFont_, v6);
    -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v6);

    -[TLKLabel updateAttributedText](self, "updateAttributedText");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TLKLabel;
  -[TLKLabel layoutSubviews](&v12, sel_layoutSubviews);
  -[TLKLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UILabel)overlayLabelForNonColoredGlyphs
{
  return self->_overlayLabelForNonColoredGlyphs;
}

void __36__TLKLabel_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  objc_msgSend(*(id *)(a1 + 32), "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "attributedTextExplicitelySet");
  objc_msgSend(*(id *)(a1 + 32), "updateWithAttributedString:", 0);
  v4 = objc_msgSend(*(id *)(a1 + 32), "useButtonColoring");
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(*(id *)(a1 + 32), "adjustedProminence");
  if (v4)
    objc_msgSend(v5, "buttonColorForProminence:", v6);
  else
    objc_msgSend(v5, "colorForProminence:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)TLKLabel;
  objc_msgSendSuper2(&v12, sel_setTextColor_, v7);

  objc_msgSend(*(id *)(a1 + 32), "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "overlayLabelForNonColoredGlyphs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithAttributedString:", v2);
  }
  else
  {
    objc_msgSend(v2, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithString:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateAttributedText");

}

- (void)setRichText:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
    -[TLKLabel updateWithAttributedString:](self, "updateWithAttributedString:", 0);
  v5 = -[TLKLabel adjustedProminence](self, "adjustedProminence");
  objc_storeStrong((id *)&self->_richText, a3);
  if (v13)
  {
    v6 = objc_msgSend(v13, "maxLines");
    if (!v6)
    {
      objc_msgSend(v13, "formattedTextItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 1)
      {
        objc_msgSend(v13, "formattedTextItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v13, "formattedTextItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "maxLines");

      }
      else
      {
        v6 = 0;
      }

    }
LABEL_11:
    -[TLKLabel setNumberOfLines:](self, "setNumberOfLines:", v6);
  }
  -[TLKLabel loadInlineImages](self, "loadInlineImages");
  -[TLKLabel updateAdjustedProminence](self, "updateAdjustedProminence");
  if (v5 == -[TLKLabel adjustedProminence](self, "adjustedProminence")
    || (-[TLKLabel window](self, "window"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    -[TLKLabel updateAttributedText](self, "updateAttributedText");
  }
  else
  {
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }

}

- (unint64_t)adjustedProminence
{
  return self->_adjustedProminence;
}

- (void)loadInlineImages
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  TLKLabel *v7;

  -[TLKLabel richText](self, "richText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__TLKLabel_loadInlineImages__block_invoke;
  v5[3] = &unk_1E5C06D50;
  v6 = v3;
  v7 = self;
  v4 = v3;
  +[TLKFontUtilities cacheInlineImagesForRichText:inView:updateHandler:](TLKFontUtilities, "cacheInlineImagesForRichText:inView:updateHandler:", v4, self, v5);

}

- (void)updateAdjustedProminence
{
  unint64_t v3;

  v3 = -[TLKLabel prominence](self, "prominence");
  if (!v3)
    v3 = -[TLKLabel hasEmphasizedFormattingInRichText](self, "hasEmphasizedFormattingInRichText");
  -[TLKLabel setAdjustedProminence:](self, "setAdjustedProminence:", v3);
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (void)setAdjustedProminence:(unint64_t)a3
{
  self->_adjustedProminence = a3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[TLKLabel textColor](self, "textColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[TLKLabel setHasCustomTextColor:](self, "setHasCustomTextColor:", v4 != 0);
    if (v4)
    {
      v9.receiver = self;
      v9.super_class = (Class)TLKLabel;
      -[TLKLabel setTextColor:](&v9, sel_setTextColor_, v4);
      -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextColor:", v4);

      }
      -[TLKLabel updateAttributedText](self, "updateAttributedText");
    }
    else
    {
      -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    }
  }

}

- (void)setNumberOfLines:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setNumberOfLines:](&v6, sel_setNumberOfLines_);
  -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", a3);

}

- (void)updateAttributedText
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int obj;
  id obja;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  objc_super v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  if (-[TLKLabel attributedTextUpdateDisabled](self, "attributedTextUpdateDisabled"))
  {
    -[TLKLabel setAttributedTextUpdateSkipped:](self, "setAttributedTextUpdateSkipped:", 1);
    return;
  }
  +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TLKLabel hasCustomTextColor](self, "hasCustomTextColor");
  -[TLKLabel richText](self, "richText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v4)
      goto LABEL_40;
LABEL_41:
    objc_msgSend(v3, "enableAppearanceForView:", self);
    goto LABEL_42;
  }
  v75 = v4;
  -[TLKLabel updateWithAttributedString:](self, "updateWithAttributedString:", 0);
  -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  v7 = objc_opt_new();
  v79 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = objc_opt_new();
  -[TLKLabel richText](self, "richText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TLKLabel adjustedProminence](self, "adjustedProminence");
  v12 = -[TLKLabel textAlignment](self, "textAlignment");
  -[TLKLabel font](self, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TLKLabel useButtonColoring](self, "useButtonColoring");
  -[TLKLabel effectiveScreenScale](self, "effectiveScreenScale");
  v16 = v15;
  BYTE1(v72) = objc_msgSend(v3, "isDark");
  LOBYTE(v72) = v14;
  v77 = (void *)v9;
  v80 = (void *)v7;
  +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:", v10, v3, v11, v12, v79, v7, v16, v8, v9, v13, v72);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v79;
  objc_msgSend(v8, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObjectsFromArray:", v19);

  obj = objc_msgSend(v3, "isVibrant");
  v20 = objc_msgSend(v17, "length");
  if (-[TLKLabel supportsColorGlyphs](self, "supportsColorGlyphs"))
  {
    v21 = objc_msgSend(v79, "count") ? 0 : obj;
    if (v21 == 1)
    {
      objc_msgSend(v17, "fixAttributesInRange:", 0, v20);
      objc_msgSend(v80, "removeAllObjects");
      v22 = *MEMORY[0x1E0DC32A0];
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __32__TLKLabel_updateAttributedText__block_invoke;
      v94[3] = &unk_1E5C07290;
      v95 = v79;
      v96 = v80;
      objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v20, 0, v94);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC33B8], "defaultParagraphStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "setLineBreakMode:", -[TLKLabel lineBreakMode](self, "lineBreakMode"));
  objc_msgSend(v24, "setAlignment:", -[TLKLabel textAlignment](self, "textAlignment"));
  -[TLKLabel unadjustedCustemAlignmentRectInsets](self, "unadjustedCustemAlignmentRectInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v78 = v3;
  if ((unint64_t)objc_msgSend(v17, "length") >= 2)
  {
    objc_msgSend(v17, "attributedSubstringFromRange:", 1, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_opt_class();
    objc_msgSend(v17, "string");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "stringStartsWithQuote:", v35) & 1) != 0)
    {
      objc_msgSend(v33, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v36, "rangeOfCharacterFromSet:", v37);

      v18 = v79;
      if (v73 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v17, "attributedSubstringFromRange:", 0, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "size");
        v40 = v39;
        objc_msgSend(v33, "size");
        +[TLKLayoutUtilities roundedValue:inView:](TLKLayoutUtilities, "roundedValue:inView:", self, v40 - v41);
        v28 = v42;

        objc_msgSend(v24, "setHeadIndent:", v28);
      }
    }
    else
    {

    }
    v3 = v78;
  }
  v93.receiver = self;
  v93.super_class = (Class)TLKLabel;
  -[TLKLabel setCustomAlignmentRectInsets:](&v93, sel_setCustomAlignmentRectInsets_, v26, v28, v30, v32);
  v99 = *MEMORY[0x1E0DC32C0];
  v100[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAttributes:range:", v43, 0, v20);

  if (objc_msgSend(v18, "count"))
    v44 = obj;
  else
    v44 = 0;
  if (v44 == 1)
  {
    v45 = v17;
    v46 = (void *)objc_msgSend(v45, "mutableCopy");
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __32__TLKLabel_updateAttributedText__block_invoke_2;
    v91[3] = &unk_1E5C072B8;
    v47 = v46;
    v92 = v47;
    v76 = v8;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v91);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obja = v18;
    v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v88;
      v51 = *MEMORY[0x1E0DC32A8];
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v88 != v50)
            objc_enumerationMutation(obja);
          v53 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v53, "rangeValue");
          objc_msgSend(v47, "addAttribute:value:range:", v51, v54, v55, v56);

        }
        v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      }
      while (v49);
    }
    v74 = v24;

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v57 = v80;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v84;
      v61 = *MEMORY[0x1E0DC32A8];
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v84 != v60)
            objc_enumerationMutation(v57);
          v63 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v63, "rangeValue");
          objc_msgSend(v45, "addAttribute:value:range:", v61, v64, v65, v66);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
      }
      while (v59);
    }

    -[TLKLabel updateWithAttributedString:](self, "updateWithAttributedString:", v45);
    -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v67)
    {
      v67 = (void *)objc_opt_new();
      objc_msgSend(v67, "setNumberOfLines:", -[TLKLabel numberOfLines](self, "numberOfLines"));
      objc_msgSend(v67, "setTextAlignment:", -[TLKLabel textAlignment](self, "textAlignment"));
      objc_msgSend(v67, "setLineBreakMode:", -[TLKLabel lineBreakMode](self, "lineBreakMode"));
      -[TLKLabel setOverlayLabelForNonColoredGlyphs:](self, "setOverlayLabelForNonColoredGlyphs:", v67);
    }
    -[TLKLabel font](self, "font");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setFont:", v68);

    objc_msgSend(v78, "colorForProminence:", -[TLKLabel adjustedProminence](self, "adjustedProminence"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setTextColor:", v69);

    -[TLKLabel addSubview:](self, "addSubview:", v67);
    objc_msgSend(v78, "enableAppearanceForView:", v67);
    objc_msgSend(v67, "setAttributedText:", v47);
    -[TLKLabel setNeedsLayout](self, "setNeedsLayout");

    v3 = v78;
    goto LABEL_40;
  }
  -[TLKLabel updateWithAttributedString:](self, "updateWithAttributedString:", v17);

  if (!v75)
    goto LABEL_41;
LABEL_40:
  objc_msgSend(v3, "disableAppearanceForView:", self);
LABEL_42:
  -[TLKLabel text](self, "text");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "length");

  if (!v71)
    -[TLKLabel updateWithString:](self, "updateWithString:", CFSTR(" "));

}

- (TLKRichText)richText
{
  return self->_richText;
}

- (BOOL)attributedTextUpdateDisabled
{
  return self->_attributedTextUpdateDisabled;
}

- (BOOL)hasCustomTextColor
{
  return self->_hasCustomTextColor;
}

- (void)updateWithAttributedString:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[TLKLabel autoHideIfNoContent](self, "autoHideIfNoContent"))
    -[TLKLabel setHidden:](self, "setHidden:", objc_msgSend(v4, "length") == 0);
  -[TLKLabel setAttributedTextExplicitelySet:](self, "setAttributedTextExplicitelySet:", v4 != 0);
  v5.receiver = self;
  v5.super_class = (Class)TLKLabel;
  -[TLKLabel setAttributedText:](&v5, sel_setAttributedText_, v4);

}

- (void)updateWithString:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TLKLabel setAttributedTextExplicitelySet:](self, "setAttributedTextExplicitelySet:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TLKLabel;
  -[TLKLabel setText:](&v5, sel_setText_, v4);

}

- (void)setAttributedTextExplicitelySet:(BOOL)a3
{
  self->_attributedTextExplicitelySet = a3;
}

- (BOOL)autoHideIfNoContent
{
  return self->_autoHideIfNoContent;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLKLabel;
  -[UIView tlk_updateForAppearance:](&v8, sel_tlk_updateForAppearance_, v4);
  -[TLKLabel superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForContainer:", v5);

  -[TLKLabel loadInlineImages](self, "loadInlineImages");
  if (!-[TLKLabel hasCustomTextColor](self, "hasCustomTextColor"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__TLKLabel_tlk_updateForAppearance___block_invoke;
    v6[3] = &unk_1E5C06D50;
    v6[4] = self;
    v7 = v4;
    -[TLKLabel performBatchUpdates:](self, "performBatchUpdates:", v6);

  }
}

- (void)setAttributedTextUpdateSkipped:(BOOL)a3
{
  self->_attributedTextUpdateSkipped = a3;
}

- (void)performBatchUpdates:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[TLKLabel setAttributedTextUpdateDisabled:](self, "setAttributedTextUpdateDisabled:", 1);
  v4[2](v4);

  -[TLKLabel setAttributedTextUpdateDisabled:](self, "setAttributedTextUpdateDisabled:", 0);
  if (-[TLKLabel attributedTextUpdateSkipped](self, "attributedTextUpdateSkipped"))
  {
    -[TLKLabel updateAttributedText](self, "updateAttributedText");
    -[TLKLabel setAttributedTextUpdateSkipped:](self, "setAttributedTextUpdateSkipped:", 0);
  }
}

- (void)setAttributedTextUpdateDisabled:(BOOL)a3
{
  self->_attributedTextUpdateDisabled = a3;
}

- (BOOL)attributedTextUpdateSkipped
{
  return self->_attributedTextUpdateSkipped;
}

- (BOOL)attributedTextExplicitelySet
{
  return self->_attributedTextExplicitelySet;
}

- (BOOL)supportsColorGlyphs
{
  return self->_supportsColorGlyphs;
}

- (void)setMultilineText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
  }
  else
  {
    v5 = v7;
    if (v7)
    {
      v4 = (id)objc_opt_new();
      v5 = v7;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    objc_msgSend(v4, "setMaxLines:", objc_msgSend(v7, "maxLines"));
  }
  -[TLKLabel setRichText:](self, "setRichText:", v4);

}

- (void)setText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TLKLabel updateWithString:](self, "updateWithString:", 0);
  if (v5)
  {
    +[TLKMultilineText textWithString:](TLKRichText, "textWithString:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "setMaxLines:", -[TLKLabel numberOfLines](self, "numberOfLines"));
  -[TLKLabel setRichText:](self, "setRichText:", v4);

}

- (BOOL)hasEmphasizedFormattingInRichText
{
  void *v2;
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
  -[TLKLabel richText](self, "richText", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedTextItems");
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
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isEmphasized") & 1) != 0)
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

- (TLKLabel)init
{
  return -[TLKLabel initWithProminence:](self, "initWithProminence:", 0);
}

+ (id)secondaryLabel
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProminence:", 1);
}

+ (id)tertiaryLabel
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProminence:", 2);
}

- (TLKLabel)initWithProminence:(unint64_t)a3
{
  TLKLabel *v4;
  TLKLabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TLKLabel;
  v4 = -[TLKLabel init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TLKLabel setOpaque:](v4, "setOpaque:", 0);
    v5->_prominence = a3;
    v5->_hasCustomTextColor = 0;
  }
  return v5;
}

- (void)setSupportsColorGlyphs:(BOOL)a3
{
  self->_supportsColorGlyphs = a3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    -[TLKLabel updateAdjustedProminence](self, "updateAdjustedProminence");
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setLineBreakMode:](&v6, sel_setLineBreakMode_);
  -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFont, 0);
  objc_storeStrong((id *)&self->_overlayLabelForNonColoredGlyphs, 0);
  objc_storeStrong((id *)&self->_richText, 0);
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
  v9.super_class = (Class)TLKLabel;
  -[TLKLabel traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKLabel traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

+ (id)primaryLabel
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProminence:", 0);
}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setTextAlignment:](&v6, sel_setTextAlignment_);
  -[TLKLabel overlayLabelForNonColoredGlyphs](self, "overlayLabelForNonColoredGlyphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", a3);

  -[TLKLabel updateAttributedText](self, "updateAttributedText");
}

- (TLKFormattedText)formattedText
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[TLKLabel richText](self, "richText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedTextItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[TLKLabel richText](self, "richText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "formattedTextItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7)
    {
      -[TLKLabel richText](self, "richText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKFormattedText formattedTextWithString:](TLKFormattedText, "formattedTextWithString:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    objc_msgSend(v10, "setMaxLines:", -[TLKRichText maxLines](self->_richText, "maxLines"));
  }
  return (TLKFormattedText *)v10;
}

- (void)setFormattedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_opt_new();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setFormattedTextItems:", v6);
  }
  else
  {
    v5 = 0;
  }
  -[TLKLabel setRichText:](self, "setRichText:", v5);

}

- (void)setAttributedText:(id)a3
{
  TLKRichText *richText;
  id v5;

  richText = self->_richText;
  self->_richText = 0;
  v5 = a3;

  -[TLKLabel updateWithAttributedString:](self, "updateWithAttributedString:", v5);
}

void __28__TLKLabel_loadInlineImages__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__TLKLabel_loadInlineImages__block_invoke_2;
  v4[3] = &unk_1E5C06D50;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  +[TLKUtilities dispatchMainIfNecessary:](TLKUtilities, "dispatchMainIfNecessary:", v4);

}

void __28__TLKLabel_loadInlineImages__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "richText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "updateAttributedText");
}

void __32__TLKLabel_updateAttributedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  __int16 v8;
  uint64_t v9;
  id v10;
  id v11;

  objc_msgSend(a2, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "symbolicTraits");
  v9 = 32;
  if ((v8 & 0x2000) == 0)
    v9 = 40;
  v10 = *(id *)(a1 + v9);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

void __32__TLKLabel_updateAttributedText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  +[TLKFontUtilities clearTextAttachmentForTextAttachment:](TLKFontUtilities, "clearTextAttachmentForTextAttachment:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *MEMORY[0x1E0DC3288];
  v8 = objc_msgSend(v5, "rangeValue");
  objc_msgSend(v6, "removeAttribute:range:", v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(v5, "rangeValue");
  v13 = v12;

  objc_msgSend(v10, "addAttribute:value:range:", v7, v14, v11, v13);
}

+ (BOOL)stringStartsWithQuote:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = stringStartsWithQuote__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringStartsWithQuote__onceToken, &__block_literal_global_5);
  v5 = (void *)stringStartsWithQuote__quoteCharacters;
  objc_msgSend(v4, "substringToIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __34__TLKLabel_stringStartsWithQuote___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5C16598);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringStartsWithQuote__quoteCharacters;
  stringStartsWithQuote__quoteCharacters = v0;

}

- (void)setCustomAlignmentRectInsets:(UIEdgeInsets)a3
{
  -[TLKLabel setUnadjustedCustemAlignmentRectInsets:](self, "setUnadjustedCustemAlignmentRectInsets:", a3.top, a3.left, a3.bottom, a3.right);
  -[TLKLabel updateAttributedText](self, "updateAttributedText");
}

- (void)setAutoHideIfNoContent:(BOOL)a3
{
  self->_autoHideIfNoContent = a3;
}

- (BOOL)useButtonColoring
{
  return self->_useButtonColoring;
}

- (void)setUseButtonColoring:(BOOL)a3
{
  self->_useButtonColoring = a3;
}

- (void)setOverlayLabelForNonColoredGlyphs:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLabelForNonColoredGlyphs, a3);
}

- (UIFont)originalFont
{
  return (UIFont *)objc_getProperty(self, a2, 840, 1);
}

- (void)setOriginalFont:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (void)setHasCustomTextColor:(BOOL)a3
{
  self->_hasCustomTextColor = a3;
}

- (UIEdgeInsets)unadjustedCustemAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_unadjustedCustemAlignmentRectInsets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setUnadjustedCustemAlignmentRectInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_unadjustedCustemAlignmentRectInsets, &v3, 32, 1, 0);
}

@end
