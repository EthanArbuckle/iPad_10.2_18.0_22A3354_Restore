@implementation UIListContentTextProperties

- (UIListContentTextProperties)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIListContentTextProperties;
  v2 = -[UIListContentTextProperties init](&v8, sel_init);
  if (v2)
  {
    +[UILabel defaultFont](UILabel, "defaultFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    +[UILabel _defaultColor](UILabel, "_defaultColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    *(_OWORD *)(v2 + 56) = xmmword_1866845C0;
    *((_QWORD *)v2 + 10) = 1;
    *((_QWORD *)v2 + 12) = 0;
  }
  return (UIListContentTextProperties *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5;

    objc_storeStrong((id *)(v4 + 32), self->_font);
    objc_storeStrong((id *)(v4 + 40), self->_color);
    v7 = objc_msgSend(self->_colorTransformer, "copy");
    v8 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v7;

    *(_QWORD *)(v4 + 104) = self->_colorTransformerIdentifier;
    *(_QWORD *)(v4 + 56) = self->_alignment;
    *(_QWORD *)(v4 + 64) = self->_lineBreakMode;
    v9 = -[NSAttributedString copy](self->_attributedText, "copy");
    v10 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v9;

    *(_QWORD *)(v4 + 80) = self->_numberOfLines;
    *(_BYTE *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 88) = self->_minimumScaleFactor;
    *(_BYTE *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(_BYTE *)(v4 + 14) = self->_adjustsFontForContentSizeCategory;
    *(_BYTE *)(v4 + 15) = self->_showsExpansionTextWhenTruncated;
    *(_QWORD *)(v4 + 96) = self->_transform;
    *(_BYTE *)(v4 + 16) = self->__enablesMarqueeWhenAncestorFocused;
    *($AD363B418D562FE576C628EB910A463B *)(v4 + 8) = self->_textFlags;
  }
  return (id)v4;
}

- (void)_applyToLabel:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_24;
  v15 = v3;
  if (!*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(v3, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAttributed");

    v4 = v15;
    if (v6)
    {
      objc_msgSend(v15, "setAttributedText:", 0);
      v4 = v15;
    }
  }
  v7 = *(_QWORD *)(a1 + 96);
  switch(v7)
  {
    case 3:
      objc_msgSend(*(id *)(a1 + 24), "localizedCapitalizedString");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      objc_msgSend(*(id *)(a1 + 24), "localizedLowercaseString");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      objc_msgSend(*(id *)(a1 + 24), "localizedUppercaseString");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v9 = (void *)v8;
      objc_msgSend(v15, "setText:", v8);

      goto LABEL_13;
  }
  objc_msgSend(v4, "setText:", *(_QWORD *)(a1 + 24));
LABEL_13:
  v10 = *(id *)(a1 + 32);
  if (*(_BYTE *)(a1 + 14) && objc_msgSend(v15, "adjustsFontForContentSizeCategory"))
  {
    objc_msgSend(v15, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }
  objc_msgSend(v15, "setFont:", v10);
  objc_msgSend((id)a1, "resolvedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v13);

  objc_msgSend(v15, "setTextAlignment:", objc_msgSend((id)a1, "_effectiveTextAlignment"));
  if (*(_QWORD *)(a1 + 56))
  {
    v14 = 5;
  }
  else if (objc_msgSend(v15, "_shouldReverseLayoutDirection"))
  {
    v14 = 10;
  }
  else
  {
    v14 = 9;
  }
  objc_msgSend(v15, "setContentMode:", v14);
  objc_msgSend(v15, "setLineBreakMode:", *(_QWORD *)(a1 + 64));
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v15, "setAttributedText:");
  objc_msgSend(v15, "setNumberOfLines:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", *(unsigned __int8 *)(a1 + 12));
  objc_msgSend(v15, "setMinimumScaleFactor:", *(double *)(a1 + 88));
  objc_msgSend(v15, "setAllowsDefaultTighteningForTruncation:", *(unsigned __int8 *)(a1 + 13));
  objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", *(unsigned __int8 *)(a1 + 14));
  objc_msgSend(v15, "setShowsExpansionTextWhenTruncated:", *(unsigned __int8 *)(a1 + 15));

  v4 = v15;
LABEL_24:

}

- (UIColor)resolvedColor
{
  void (**colorTransformer)(id, UIColor *);
  UIColor *v4;

  colorTransformer = (void (**)(id, UIColor *))self->_colorTransformer;
  if (colorTransformer)
  {
    colorTransformer[2](colorTransformer, self->_color);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_color;
  }
  return v4;
}

- (int64_t)_effectiveTextAlignment
{
  int64_t alignment;
  int64_t v3;

  alignment = self->_alignment;
  v3 = 3;
  if (alignment != 2)
    v3 = 4;
  if (alignment == 1)
    return 1;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong(&self->_colorTransformer, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (UIFont)font
{
  return self->_font;
}

- (void)_configureWithConstants:(void *)a3 traitCollection:(uint64_t)a4 forSidebar:
{
  id v7;
  id v8;
  double v9;
  double v10;

  if (a1)
  {
    v7 = a3;
    v8 = a2;
    *(_QWORD *)(a1 + 80) = objc_msgSend(v8, "defaultLabelNumberOfLinesForSidebar:traitCollection:", a4, v7);
    *(_BYTE *)(a1 + 13) = objc_msgSend(v8, "defaultLabelAllowsTighteningForTruncationForSidebar:traitCollection:", a4, v7);
    objc_msgSend(v8, "defaultLabelMinimumScaleFactorForSidebar:traitCollection:", a4, v7);
    v10 = v9;

    *(_BYTE *)(a1 + 12) = v10 > 0.0;
    *(double *)(a1 + 88) = v10;
    *(_WORD *)(a1 + 14) = 257;
  }
}

- (uint64_t)_isEqualToProperties:(int)a3 compareText:
{
  unsigned __int8 *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v21;

  v5 = a2;
  if (a1)
  {
    if ((-[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](a1, v5, a3) & 1) != 0)
    {
      a1 = 1;
      goto LABEL_30;
    }
    if (a3)
    {
      v6 = (void *)*((_QWORD *)v5 + 3);
      v7 = *(id *)(a1 + 24);
      v8 = v6;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
          goto LABEL_28;
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_29;
      }
      v11 = (void *)*((_QWORD *)v5 + 9);
      v7 = *(id *)(a1 + 72);
      v12 = v11;
      if (v7 == v12)
      {

      }
      else
      {
        v9 = v12;
        if (!v7 || !v12)
          goto LABEL_28;
        v13 = objc_msgSend(v7, "isEqual:", v12);

        if (!v13)
          goto LABEL_29;
      }
    }
    v14 = (void *)*((_QWORD *)v5 + 4);
    v7 = *(id *)(a1 + 32);
    v15 = v14;
    if (v7 == v15)
    {

    }
    else
    {
      v9 = v15;
      if (!v7 || !v15)
        goto LABEL_28;
      v16 = objc_msgSend(v7, "isEqual:", v15);

      if (!v16)
        goto LABEL_29;
    }
    v17 = (void *)*((_QWORD *)v5 + 5);
    v7 = *(id *)(a1 + 40);
    v18 = v17;
    if (v7 == v18)
    {

      goto LABEL_32;
    }
    v9 = v18;
    if (v7 && v18)
    {
      v19 = objc_msgSend(v7, "isEqual:", v18);

      if (v19)
      {
LABEL_32:
        v21 = *(_QWORD *)(a1 + 104);
        if (v21 == *((_QWORD *)v5 + 13)
          && (v21 != 1 || *(_QWORD *)(a1 + 48) == *((_QWORD *)v5 + 6))
          && *(_QWORD *)(a1 + 56) == *((_QWORD *)v5 + 7)
          && *(_QWORD *)(a1 + 64) == *((_QWORD *)v5 + 8)
          && *(_QWORD *)(a1 + 80) == *((_QWORD *)v5 + 10)
          && *(unsigned __int8 *)(a1 + 12) == v5[12]
          && *(double *)(a1 + 88) == *((double *)v5 + 11)
          && *(unsigned __int8 *)(a1 + 13) == v5[13]
          && *(unsigned __int8 *)(a1 + 14) == v5[14]
          && *(unsigned __int8 *)(a1 + 15) == v5[15]
          && *(_QWORD *)(a1 + 96) == *((_QWORD *)v5 + 12))
        {
          a1 = *(unsigned __int8 *)(a1 + 16) == v5[16];
          goto LABEL_30;
        }
      }
LABEL_29:
      a1 = 0;
      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:

  return a1;
}

- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareText:
{
  _QWORD *v5;
  double *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;

  v5 = a2;
  v6 = (double *)v5;
  if (!a1)
    goto LABEL_34;
  if (v5 == (_QWORD *)a1)
  {
    a1 = 1;
    goto LABEL_34;
  }
  if (a3)
  {
    v7 = (void *)v5[3];
    v8 = *(id *)(a1 + 24);
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
        goto LABEL_16;
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_33;
    }
    v12 = (void *)*((_QWORD *)v6 + 9);
    v8 = *(id *)(a1 + 72);
    v13 = v12;
    if (v8 != v13)
    {
      v10 = v13;
      if (v8 && v13)
      {
        v14 = objc_msgSend(v8, "isEqual:", v13);

        if (!v14)
          goto LABEL_33;
        goto LABEL_18;
      }
LABEL_16:

LABEL_33:
      a1 = 0;
      goto LABEL_34;
    }

  }
LABEL_18:
  if (*(_QWORD *)(a1 + 32) != *((_QWORD *)v6 + 4))
    goto LABEL_33;
  if (*(_QWORD *)(a1 + 40) != *((_QWORD *)v6 + 5))
    goto LABEL_33;
  v15 = *(_QWORD *)(a1 + 104);
  if (v15 != *((_QWORD *)v6 + 13) || v15 == 1 && *(_QWORD *)(a1 + 48) != *((_QWORD *)v6 + 6))
    goto LABEL_33;
  if (*(_QWORD *)(a1 + 56) != *((_QWORD *)v6 + 7)
    || *(_QWORD *)(a1 + 64) != *((_QWORD *)v6 + 8)
    || *(_QWORD *)(a1 + 80) != *((_QWORD *)v6 + 10)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12)
    || *(double *)(a1 + 88) != v6[11]
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v6 + 13)
    || *(unsigned __int8 *)(a1 + 14) != *((unsigned __int8 *)v6 + 14)
    || *(unsigned __int8 *)(a1 + 15) != *((unsigned __int8 *)v6 + 15)
    || *(_QWORD *)(a1 + 96) != *((_QWORD *)v6 + 12))
  {
    goto LABEL_33;
  }
  a1 = *(unsigned __int8 *)(a1 + 16) == *((unsigned __int8 *)v6 + 16);
LABEL_34:

  return a1;
}

- (UIColor)color
{
  return self->_color;
}

- (UIListContentTextTransform)transform
{
  return self->_transform;
}

- (void)setFont:(UIFont *)font
{
  *(_WORD *)&self->_textFlags |= 1u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, font);
}

- (void)setColor:(UIColor *)color
{
  *(_WORD *)&self->_textFlags |= 2u;
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, color);
}

- (void)setTransform:(UIListContentTextTransform)transform
{
  *(_WORD *)&self->_textFlags |= 0x800u;
  self->_transform = transform;
}

- (void)setText:(_QWORD *)a1
{
  id v3;
  const char *v4;
  void *v5;
  id newValue;

  v3 = a2;
  if (a1)
  {
    newValue = v3;
    if (v3)
    {
      v5 = (void *)a1[9];
      a1[9] = 0;

    }
    objc_setProperty_nonatomic_copy(a1, v4, newValue, 24);
    v3 = newValue;
  }

}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3;
  __int16 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  id v18;

  v3 = a2;
  if (!a1)
    goto LABEL_55;
  v4 = *(_WORD *)(a1 + 8);
  v18 = v3;
  if ((v4 & 1) != 0)
  {
    if ((v4 & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v5 = (void *)*((_QWORD *)v3 + 4);
    else
      v5 = 0;
    objc_storeStrong((id *)(a1 + 32), v5);
    v4 = *(_WORD *)(a1 + 8);
    v3 = v18;
    if ((v4 & 2) != 0)
    {
LABEL_4:
      if ((v4 & 4) != 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  if (v3)
    v6 = (void *)*((_QWORD *)v3 + 5);
  else
    v6 = 0;
  objc_storeStrong((id *)(a1 + 40), v6);
  v4 = *(_WORD *)(a1 + 8);
  v3 = v18;
  if ((v4 & 4) != 0)
  {
LABEL_5:
    if ((v4 & 8) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_22:
  if (v3)
    v7 = (void *)*((_QWORD *)v3 + 6);
  else
    v7 = 0;
  -[UIListContentTextProperties _setColorTransformer:](a1, v7);
  v4 = *(_WORD *)(a1 + 8);
  v3 = v18;
  if ((v4 & 8) != 0)
  {
LABEL_6:
    if ((v4 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_25:
  if (v3)
    v8 = *((_QWORD *)v3 + 7);
  else
    v8 = 0;
  *(_QWORD *)(a1 + 56) = v8;
  if ((v4 & 0x10) != 0)
  {
LABEL_7:
    if ((v4 & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_28:
  if (v3)
    v9 = *((_QWORD *)v3 + 8);
  else
    v9 = 0;
  *(_QWORD *)(a1 + 64) = v9;
  if ((v4 & 0x20) != 0)
  {
LABEL_8:
    if ((v4 & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_31:
  if (v3)
    v10 = *((_QWORD *)v3 + 10);
  else
    v10 = 0;
  *(_QWORD *)(a1 + 80) = v10;
  if ((v4 & 0x40) != 0)
  {
LABEL_9:
    if ((v4 & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_34:
  if (v3)
    v11 = *((_BYTE *)v3 + 12) != 0;
  else
    v11 = 0;
  *(_BYTE *)(a1 + 12) = v11;
  if ((v4 & 0x80) != 0)
  {
LABEL_10:
    if ((v4 & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_37:
  if (v3)
    v12 = *((_QWORD *)v3 + 11);
  else
    v12 = 0;
  *(_QWORD *)(a1 + 88) = v12;
  if ((v4 & 0x100) != 0)
  {
LABEL_11:
    if ((v4 & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_40:
  if (v3)
    v13 = *((_BYTE *)v3 + 13) != 0;
  else
    v13 = 0;
  *(_BYTE *)(a1 + 13) = v13;
  if ((v4 & 0x200) != 0)
  {
LABEL_12:
    if ((v4 & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_43:
  if (v3)
    v14 = *((_BYTE *)v3 + 14) != 0;
  else
    v14 = 0;
  *(_BYTE *)(a1 + 14) = v14;
  if ((v4 & 0x400) != 0)
  {
LABEL_13:
    if ((v4 & 0x800) != 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_46:
  if (v3)
    v15 = *((_BYTE *)v3 + 15) != 0;
  else
    v15 = 0;
  *(_BYTE *)(a1 + 15) = v15;
  if ((v4 & 0x800) != 0)
  {
LABEL_14:
    if ((v4 & 0x1000) != 0)
      goto LABEL_55;
    goto LABEL_52;
  }
LABEL_49:
  if (v3)
    v16 = *((_QWORD *)v3 + 12);
  else
    v16 = 0;
  *(_QWORD *)(a1 + 96) = v16;
  if ((v4 & 0x1000) == 0)
  {
LABEL_52:
    if (v3)
      v17 = *((_BYTE *)v3 + 16) != 0;
    else
      v17 = 0;
    *(_BYTE *)(a1 + 16) = v17;
  }
LABEL_55:

}

- (void)_setColorTransformer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    *(_QWORD *)(a1 + 104) = _UIConfigurationIdentifierForColorTransformer(v3);
    v4 = objc_msgSend(v3, "copy");

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

  }
}

- (UIListContentTextAlignment)alignment
{
  return self->_alignment;
}

- (BOOL)_hasNonEmptyPlainTextOnly
{
  return !self->_attributedText && -[NSString length](self->_text, "length") != 0;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  *(_WORD *)&self->_textFlags |= 0x20u;
  self->_numberOfLines = numberOfLines;
}

- (void)setAttributedText:(_QWORD *)a1
{
  id v3;
  const char *v4;
  void *v5;
  id newValue;

  v3 = a2;
  if (a1)
  {
    newValue = v3;
    if (v3)
    {
      v5 = (void *)a1[3];
      a1[3] = 0;

    }
    objc_setProperty_nonatomic_copy(a1, v4, newValue, 72);
    v3 = newValue;
  }

}

- (void)setColorTransformer:(UIConfigurationColorTransformer)colorTransformer
{
  *(_WORD *)&self->_textFlags |= 4u;
  -[UIListContentTextProperties _setColorTransformer:]((uint64_t)self, colorTransformer);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentTextProperties)initWithCoder:(id)a3
{
  id v4;
  UIListContentTextProperties *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  UIFont *font;
  uint64_t v10;
  UIColor *color;
  uint64_t v12;
  NSAttributedString *attributedText;
  double v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UIListContentTextProperties;
  v5 = -[UIListContentTextProperties init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
    v8 = objc_claimAutoreleasedReturnValue();
    font = v5->_font;
    v5->_font = (UIFont *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v10;

    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("colorTransformerIdentifier")));
    v5->_alignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alignment"));
    v5->_lineBreakMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lineBreakMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedText"));
    v12 = objc_claimAutoreleasedReturnValue();
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v12;

    v5->_numberOfLines = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfLines"));
    v5->_adjustsFontSizeToFitWidth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adjustsFontSizeToFitWidth"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumScaleFactor"));
    v5->_minimumScaleFactor = v14;
    v5->_allowsDefaultTighteningForTruncation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDefaultTighteningForTruncation"));
    v5->_adjustsFontForContentSizeCategory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adjustsFontForContentSizeCategory"));
    v5->_showsExpansionTextWhenTruncated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsExpansionTextWhenTruncated"));
    v5->_transform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transform"));
    v5->__enablesMarqueeWhenAncestorFocused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("marqueeWhenAncestorFocused"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("color"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v16))
      v17 = 2;
    else
      v17 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFD | v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("colorTransformerIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v18))
      v19 = 4;
    else
      v19 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFB | v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("alignment"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v20))
      v21 = 8;
    else
      v21 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFF7 | v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v22))
      v23 = 16;
    else
      v23 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFEF | v23;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("numberOfLines"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v24))
      v25 = 32;
    else
      v25 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFDF | v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontSizeToFitWidth"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v26))
      v27 = 64;
    else
      v27 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFBF | v27;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumScaleFactor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v28))
      v29 = 128;
    else
      v29 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFF7F | v29;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("allowsDefaultTighteningForTruncation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v30))
      v31 = 256;
    else
      v31 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFEFF | v31;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontForContentSizeCategory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v32))
      v33 = 512;
    else
      v33 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFDFF | v33;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("showsExpansionTextWhenTruncated"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v34))
      v35 = 1024;
    else
      v35 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFBFF | v35;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("transform"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v36))
      v37 = 2048;
    else
      v37 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xF7FF | v37;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("marqueeWhenAncestorFocused"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v38))
      v39 = 4096;
    else
      v39 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xEFFF | v39;

  }
  return v5;
}

- (void)_setColorTransformerIdentifier:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    _UIConfigurationColorTransformerForIdentifier(a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

    if (*(_QWORD *)(a1 + 48))
      v6 = a2;
    else
      v6 = 0;
    *(_QWORD *)(a1 + 104) = v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_colorTransformerIdentifier, CFSTR("colorTransformerIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alignment, CFSTR("alignment"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lineBreakMode, CFSTR("lineBreakMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributedText, CFSTR("attributedText"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfLines, CFSTR("numberOfLines"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_adjustsFontSizeToFitWidth, CFSTR("adjustsFontSizeToFitWidth"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minimumScaleFactor"), self->_minimumScaleFactor);
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsDefaultTighteningForTruncation, CFSTR("allowsDefaultTighteningForTruncation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_adjustsFontForContentSizeCategory, CFSTR("adjustsFontForContentSizeCategory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsExpansionTextWhenTruncated, CFSTR("showsExpansionTextWhenTruncated"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transform, CFSTR("transform"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__enablesMarqueeWhenAncestorFocused, CFSTR("marqueeWhenAncestorFocused"));
  v6 = *(_WORD *)&self->_textFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_WORD *)&self->_textFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("color"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_textFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("colorTransformerIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_textFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("alignment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_textFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v14, v15);

  v16 = (*(_WORD *)&self->_textFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("numberOfLines"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v16, v17);

  v18 = (*(_WORD *)&self->_textFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontSizeToFitWidth"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v18, v19);

  v20 = (*(_WORD *)&self->_textFlags >> 7) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumScaleFactor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v20, v21);

  v22 = HIBYTE(*(_WORD *)&self->_textFlags) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("allowsDefaultTighteningForTruncation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v22, v23);

  v24 = (*(_WORD *)&self->_textFlags >> 9) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontForContentSizeCategory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v24, v25);

  v26 = (*(_WORD *)&self->_textFlags >> 10) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("showsExpansionTextWhenTruncated"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v26, v27);

  v28 = (*(_WORD *)&self->_textFlags >> 11) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("transform"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v28, v29);

  v30 = (*(_WORD *)&self->_textFlags >> 12) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("marqueeWhenAncestorFocused"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v30, v31);

}

- (BOOL)isEqual:(id)a3
{
  UIListContentTextProperties *v4;
  UIListContentTextProperties *v5;
  char v6;

  v4 = (UIListContentTextProperties *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self, v5, 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[UIFont hash](self->_font, "hash");
  return -[UIColor hash](self->_color, "hash") ^ v3;
}

- (id)description
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *text;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t colorTransformerIdentifier;
  void *v16;
  void *v17;
  void *v18;
  int64_t alignment;
  const __CFString *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_attributedText)
  {
    v4 = +[UIView _shouldRedactTextInDescription](UIView, "_shouldRedactTextInDescription");
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (v4)
    {
      -[NSAttributedString string](self->_attributedText, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewTextRedactedIfNecessaryForDescription(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("attributedText = %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

LABEL_15:
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attributedText = %@"), self->_attributedText);
LABEL_14:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);
    goto LABEL_15;
  }
  text = self->_text;
  if (text)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    _UIViewTextRedactedIfNecessaryForDescription(text);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("text = %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("font = %@"), self->_font);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color = %@"), self->_color);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  colorTransformerIdentifier = self->_colorTransformerIdentifier;
  if (colorTransformerIdentifier)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    _UIConfigurationColorTransformerIdentifierToString(colorTransformerIdentifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("colorTransformer = %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  alignment = self->_alignment;
  if (alignment)
  {
    if (alignment == 1)
      v20 = CFSTR("center");
    else
      v20 = CFSTR("justified");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alignment = %@"), v20);
    goto LABEL_14;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("numberOfLines = %ld"), self->_numberOfLines);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  if (self->_adjustsFontSizeToFitWidth)
    objc_msgSend(v3, "addObject:", CFSTR("adjustsFontSizeToFitWidth = YES"));
  if (self->_minimumScaleFactor != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("minimumScaleFactor = %g"), *(_QWORD *)&self->_minimumScaleFactor);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  if (self->_allowsDefaultTighteningForTruncation)
    objc_msgSend(v3, "addObject:", CFSTR("allowsDefaultTighteningForTruncation = YES"));
  if (self->_adjustsFontForContentSizeCategory)
    objc_msgSend(v3, "addObject:", CFSTR("adjustsFontForContentSizeCategory = YES"));
  if (self->_showsExpansionTextWhenTruncated)
    objc_msgSend(v3, "addObject:", CFSTR("showsExpansionTextWhenTruncated = YES"));
  v23 = self->_transform - 1;
  if (v23 <= 2)
    objc_msgSend(v3, "addObject:", off_1E16E4350[v23]);
  if (self->__enablesMarqueeWhenAncestorFocused)
    objc_msgSend(v3, "addObject:", CFSTR("enablesMarqueeWhenAncestorFocused = YES"));
  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v26, self, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)debugDescription
{
  return +[UIView _descriptionWithoutTextRedactionForObject:](UIView, "_descriptionWithoutTextRedactionForObject:", self);
}

- (__CFString)_shortDescription
{
  __CFString *v1;
  void *length;
  uint64_t info;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    length = (void *)a1->length;
    info = v1[2].info;
    if (length)
    {
      if (!info)
      {
        _UIViewTextRedactedIfNecessaryForDescription(length);
        v4 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v1 = (__CFString *)v4;
        return v1;
      }
    }
    else if (!info)
    {
      v1 = CFSTR("none");
      return v1;
    }
    v5 = +[UIView _shouldRedactTextInDescription](UIView, "_shouldRedactTextInDescription");
    v6 = (void *)v1[2].info;
    if (!v5)
    {
      objc_msgSend(v6, "description");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIViewTextRedactedIfNecessaryForDescription(v7);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (UIConfigurationColorTransformer)colorTransformer
{
  return _Block_copy(self->_colorTransformer);
}

- (void)setAlignment:(UIListContentTextAlignment)alignment
{
  *(_WORD *)&self->_textFlags |= 8u;
  self->_alignment = alignment;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  *(_WORD *)&self->_textFlags |= 0x10u;
  self->_lineBreakMode = lineBreakMode;
}

- (NSLineBreakMode)lineBreakMode
{
  return self->_lineBreakMode;
}

- (NSInteger)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  *(_WORD *)&self->_textFlags |= 0x40u;
  self->_adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  *(_WORD *)&self->_textFlags |= 0x80u;
  self->_minimumScaleFactor = minimumScaleFactor;
}

- (CGFloat)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
  *(_WORD *)&self->_textFlags |= 0x100u;
  self->_allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return self->_allowsDefaultTighteningForTruncation;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory
{
  *(_WORD *)&self->_textFlags |= 0x200u;
  self->_adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated
{
  *(_WORD *)&self->_textFlags |= 0x400u;
  self->_showsExpansionTextWhenTruncated = showsExpansionTextWhenTruncated;
}

- (BOOL)showsExpansionTextWhenTruncated
{
  return self->_showsExpansionTextWhenTruncated;
}

- (void)_setEnablesMarqueeWhenAncestorFocused:(BOOL)a3
{
  *(_WORD *)&self->_textFlags |= 0x1000u;
  self->__enablesMarqueeWhenAncestorFocused = a3;
}

- (BOOL)_enablesMarqueeWhenAncestorFocused
{
  return self->__enablesMarqueeWhenAncestorFocused;
}

@end
