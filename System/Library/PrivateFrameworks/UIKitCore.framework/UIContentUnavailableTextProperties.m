@implementation UIContentUnavailableTextProperties

- (void)_applyToLabel:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v3, "_content");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isAttributed");

      v3 = v7;
      if (v5)
      {
        objc_msgSend(v7, "setAttributedText:", 0);
        v3 = v7;
      }
    }
    objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 16));
    objc_msgSend(v7, "setFont:", *(_QWORD *)(a1 + 24));
    objc_msgSend(v7, "setTextColor:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 72))
      v6 = 4;
    else
      v6 = 1;
    objc_msgSend(v7, "setTextAlignment:", v6);
    objc_msgSend(v7, "setContentMode:", 5);
    objc_msgSend(v7, "setLineBreakMode:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v7, "setAttributedText:");
    objc_msgSend(v7, "setNumberOfLines:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", *(unsigned __int8 *)(a1 + 12));
    objc_msgSend(v7, "setMinimumScaleFactor:", *(double *)(a1 + 64));
    objc_msgSend(v7, "setAllowsDefaultTighteningForTruncation:", *(unsigned __int8 *)(a1 + 13));
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
    v3 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v5;

    objc_storeStrong((id *)(v4 + 24), self->_font);
    objc_storeStrong((id *)(v4 + 32), self->_color);
    *(_QWORD *)(v4 + 40) = self->_lineBreakMode;
    v7 = -[NSAttributedString copy](self->_attributedText, "copy");
    v8 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v7;

    *(_QWORD *)(v4 + 56) = self->_numberOfLines;
    *(_BYTE *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 64) = self->_minimumScaleFactor;
    *(_BYTE *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(_QWORD *)(v4 + 72) = self->_alignment;
    *($14BB99B994CAB2479A3B1BA6E34B7634 *)(v4 + 8) = self->_textFlags;
  }
  return (id)v4;
}

- (UIContentUnavailableTextProperties)init
{
  UIContentUnavailableTextProperties *v2;
  uint64_t v3;
  UIFont *font;
  uint64_t v5;
  UIColor *color;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIContentUnavailableTextProperties;
  v2 = -[UIContentUnavailableTextProperties init](&v8, sel_init);
  if (v2)
  {
    +[UILabel defaultFont](UILabel, "defaultFont");
    v3 = objc_claimAutoreleasedReturnValue();
    font = v2->_font;
    v2->_font = (UIFont *)v3;

    +[UILabel _defaultColor](UILabel, "_defaultColor");
    v5 = objc_claimAutoreleasedReturnValue();
    color = v2->_color;
    v2->_color = (UIColor *)v5;

    v2->_lineBreakMode = 4;
    v2->_numberOfLines = 0;
    v2->_alignment = 0;
  }
  return v2;
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3;
  const char *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  id v15;

  v3 = a2;
  if (!a1)
    goto LABEL_39;
  v5 = *(_WORD *)(a1 + 8);
  v15 = v3;
  if ((v5 & 1) != 0)
  {
    if ((v5 & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v6 = (void *)*((_QWORD *)v3 + 2);
    else
      v6 = 0;
    objc_setProperty_nonatomic_copy((id)a1, v4, v6, 16);
    v5 = *(_WORD *)(a1 + 8);
    v3 = v15;
    if ((v5 & 2) != 0)
    {
LABEL_4:
      if ((v5 & 4) != 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  if (v3)
    v7 = (void *)*((_QWORD *)v3 + 3);
  else
    v7 = 0;
  objc_storeStrong((id *)(a1 + 24), v7);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v15;
  if ((v5 & 4) != 0)
  {
LABEL_5:
    if ((v5 & 8) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_18:
  if (v3)
    v8 = (void *)*((_QWORD *)v3 + 4);
  else
    v8 = 0;
  objc_storeStrong((id *)(a1 + 32), v8);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v15;
  if ((v5 & 8) != 0)
  {
LABEL_6:
    if ((v5 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_21:
  if (v3)
    v9 = *((_QWORD *)v3 + 5);
  else
    v9 = 0;
  *(_QWORD *)(a1 + 40) = v9;
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    if ((v5 & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_24:
  if (v3)
    v10 = (void *)*((_QWORD *)v3 + 6);
  else
    v10 = 0;
  objc_setProperty_nonatomic_copy((id)a1, v4, v10, 48);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v15;
  if ((v5 & 0x20) != 0)
  {
LABEL_8:
    if ((v5 & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_27:
  if (v3)
    v11 = *((_QWORD *)v3 + 7);
  else
    v11 = 0;
  *(_QWORD *)(a1 + 56) = v11;
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    if ((v5 & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_30:
  if (v3)
    v12 = *((_BYTE *)v3 + 12) != 0;
  else
    v12 = 0;
  *(_BYTE *)(a1 + 12) = v12;
  if ((v5 & 0x80) != 0)
  {
LABEL_10:
    if ((v5 & 0x100) != 0)
      goto LABEL_39;
    goto LABEL_36;
  }
LABEL_33:
  if (v3)
    v13 = *((_QWORD *)v3 + 8);
  else
    v13 = 0;
  *(_QWORD *)(a1 + 64) = v13;
  if ((v5 & 0x100) == 0)
  {
LABEL_36:
    if (v3)
      v14 = *((_BYTE *)v3 + 13) != 0;
    else
      v14 = 0;
    *(_BYTE *)(a1 + 13) = v14;
  }
LABEL_39:

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

  v5 = a2;
  if (a1)
  {
    if ((-[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](a1, v5, a3) & 1) != 0)
    {
      a1 = 1;
      goto LABEL_30;
    }
    if (a3)
    {
      v6 = (void *)*((_QWORD *)v5 + 2);
      v7 = *(id *)(a1 + 16);
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
      v11 = (void *)*((_QWORD *)v5 + 6);
      v7 = *(id *)(a1 + 48);
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
    v14 = (void *)*((_QWORD *)v5 + 3);
    v7 = *(id *)(a1 + 24);
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
    v17 = (void *)*((_QWORD *)v5 + 4);
    v7 = *(id *)(a1 + 32);
    v18 = v17;
    if (v7 == v18)
    {

LABEL_32:
      if (*(_QWORD *)(a1 + 40) == *((_QWORD *)v5 + 5)
        && *(_QWORD *)(a1 + 56) == *((_QWORD *)v5 + 7)
        && *(unsigned __int8 *)(a1 + 12) == v5[12]
        && *(double *)(a1 + 64) == *((double *)v5 + 8)
        && *(unsigned __int8 *)(a1 + 13) == v5[13])
      {
        a1 = *(_QWORD *)(a1 + 72) == *((_QWORD *)v5 + 9);
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    v9 = v18;
    if (v7 && v18)
    {
      v19 = objc_msgSend(v7, "isEqual:", v18);

      if (v19)
        goto LABEL_32;
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

  v5 = a2;
  v6 = (double *)v5;
  if (!a1)
    goto LABEL_27;
  if (v5 == (_QWORD *)a1)
  {
    a1 = 1;
    goto LABEL_27;
  }
  if (a3)
  {
    v7 = (void *)v5[2];
    v8 = *(id *)(a1 + 16);
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
        goto LABEL_26;
    }
    v12 = (void *)*((_QWORD *)v6 + 6);
    v8 = *(id *)(a1 + 48);
    v13 = v12;
    if (v8 != v13)
    {
      v10 = v13;
      if (v8 && v13)
      {
        v14 = objc_msgSend(v8, "isEqual:", v13);

        if (!v14)
          goto LABEL_26;
        goto LABEL_18;
      }
LABEL_16:

LABEL_26:
      a1 = 0;
      goto LABEL_27;
    }

  }
LABEL_18:
  if (*(_QWORD *)(a1 + 24) != *((_QWORD *)v6 + 3)
    || *(_QWORD *)(a1 + 32) != *((_QWORD *)v6 + 4)
    || *(_QWORD *)(a1 + 40) != *((_QWORD *)v6 + 5)
    || *(_QWORD *)(a1 + 56) != *((_QWORD *)v6 + 7)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12)
    || *(double *)(a1 + 64) != v6[8]
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v6 + 13))
  {
    goto LABEL_26;
  }
  a1 = *(_QWORD *)(a1 + 72) == *((_QWORD *)v6 + 9);
LABEL_27:

  return a1;
}

- (void)setText:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  id newValue;

  v3 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 8) |= 1u;
    newValue = v3;
    if (v3)
    {
      v5 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
    objc_setProperty_nonatomic_copy((id)a1, v4, newValue, 16);
    v3 = newValue;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableTextProperties)initWithCoder:(id)a3
{
  id v4;
  UIContentUnavailableTextProperties *v5;
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
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIContentUnavailableTextProperties;
  v5 = -[UIContentUnavailableTextProperties init](&v33, sel_init);
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
    v5->_alignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alignment"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("text"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v16))
      v17 = 2;
    else
      v17 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFD | v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("color"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v18))
      v19 = 4;
    else
      v19 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFFB | v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v20))
      v21 = 8;
    else
      v21 = 0;
    *(_WORD *)&v5->_textFlags = *(_WORD *)&v5->_textFlags & 0xFFF7 | v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("attributedText"));
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

  }
  return v5;
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
  id v23;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lineBreakMode, CFSTR("lineBreakMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributedText, CFSTR("attributedText"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfLines, CFSTR("numberOfLines"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_adjustsFontSizeToFitWidth, CFSTR("adjustsFontSizeToFitWidth"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minimumScaleFactor"), self->_minimumScaleFactor);
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsDefaultTighteningForTruncation, CFSTR("allowsDefaultTighteningForTruncation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alignment, CFSTR("alignment"));
  v6 = *(_WORD *)&self->_textFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_WORD *)&self->_textFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_textFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("color"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_textFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_textFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("attributedText"));
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
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v22, v23);

}

- (BOOL)isEqual:(id)a3
{
  UIContentUnavailableTextProperties *v4;
  UIContentUnavailableTextProperties *v5;
  char v6;

  v4 = (UIContentUnavailableTextProperties *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self, v5, 0);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_attributedText)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attributedText = %@"), self->_attributedText);
  }
  else
  {
    if (self->_text)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("text = %@"), self->_text);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("font = %@"), self->_font);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color = %@"), self->_color);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("numberOfLines = %ld"), self->_numberOfLines);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  if (self->_adjustsFontSizeToFitWidth)
    objc_msgSend(v3, "addObject:", CFSTR("adjustsFontSizeToFitWidth = YES"));
  if (self->_minimumScaleFactor != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("minimumScaleFactor = %g"), *(_QWORD *)&self->_minimumScaleFactor);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (self->_allowsDefaultTighteningForTruncation)
    objc_msgSend(v3, "addObject:", CFSTR("allowsDefaultTighteningForTruncation = YES"));
  if (self->_alignment)
    v9 = CFSTR("natural");
  else
    v9 = CFSTR("center");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alignment = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v13, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (__CFString)_shortDescription
{
  uint64_t v1;
  void *v2;

  if (!a1)
    return (__CFString *)a1;
  v1 = a1[2];
  v2 = (void *)a1[6];
  if (!v1)
  {
    if (!v2)
      return CFSTR("none");
    goto LABEL_6;
  }
  if (v2)
  {
LABEL_6:
    objc_msgSend(v2, "description");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    return (__CFString *)a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v1);
  a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  return (__CFString *)a1;
}

- (void)setFont:(UIFont *)font
{
  *(_WORD *)&self->_textFlags |= 2u;
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)self, font);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setColor:(UIColor *)color
{
  *(_WORD *)&self->_textFlags |= 4u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, color);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  *(_WORD *)&self->_textFlags |= 8u;
  self->_lineBreakMode = lineBreakMode;
}

- (NSLineBreakMode)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setAttributedText:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  id newValue;

  v3 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 8) |= 0x10u;
    newValue = v3;
    if (v3)
    {
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
    objc_setProperty_nonatomic_copy((id)a1, v4, newValue, 48);
    v3 = newValue;
  }

}

- (id)attributedText
{
  if (a1)
    a1 = (id *)a1[6];
  return a1;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  *(_WORD *)&self->_textFlags |= 0x20u;
  self->_numberOfLines = numberOfLines;
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

@end
