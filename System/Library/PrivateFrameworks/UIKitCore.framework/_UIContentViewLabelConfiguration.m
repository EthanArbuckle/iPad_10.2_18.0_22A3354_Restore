@implementation _UIContentViewLabelConfiguration

- (_UIContentViewLabelConfiguration)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContentViewLabelConfiguration;
  v2 = -[_UIContentViewLabelConfiguration init](&v8, sel_init);
  if (v2)
  {
    +[UILabel defaultFont](UILabel, "defaultFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    +[UILabel _defaultColor](UILabel, "_defaultColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(4uLL);
    *((_QWORD *)v2 + 8) = 1;
  }
  return (_UIContentViewLabelConfiguration *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIContentViewLabelConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIContentViewLabelConfiguration *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  UIFont *font;
  uint64_t v10;
  UIColor *textColor;
  uint64_t v12;
  NSAttributedString *attributedText;
  uint64_t v14;
  UIColor *highlightedTextColor;
  double v16;
  void *v17;
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
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UIContentViewLabelConfiguration;
  v5 = -[_UIContentViewLabelConfiguration init](&v35, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    textColor = v5->_textColor;
    v5->_textColor = (UIColor *)v10;

    v5->_textAlignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textAlignment"));
    v5->_lineBreakMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lineBreakMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedText"));
    v12 = objc_claimAutoreleasedReturnValue();
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highlightedTextColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    highlightedTextColor = v5->_highlightedTextColor;
    v5->_highlightedTextColor = (UIColor *)v14;

    v5->_numberOfLines = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfLines"));
    v5->_adjustsFontSizeToFitWidth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adjustsFontSizeToFitWidth"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumScaleFactor"));
    v5->_minimumScaleFactor = v16;
    v5->_allowsDefaultTighteningForTruncation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDefaultTighteningForTruncation"));
    v5->_adjustsFontForContentSizeCategory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adjustsFontForContentSizeCategory"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v17);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v18))
      v19 = 2;
    else
      v19 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textAlignment"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v20))
      v21 = 4;
    else
      v21 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v22))
      v23 = 8;
    else
      v23 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v23;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("numberOfLines"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v24))
      v25 = 16;
    else
      v25 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontSizeToFitWidth"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v26))
      v27 = 32;
    else
      v27 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v27;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumScaleFactor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v28))
      v29 = 64;
    else
      v29 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v29;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("allowsDefaultTighteningForTruncation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v30))
      v31 = 128;
    else
      v31 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v31;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontForContentSizeCategory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v32))
      v33 = 256;
    else
      v33 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v33;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_textColor, CFSTR("textColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_textAlignment, CFSTR("textAlignment"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lineBreakMode, CFSTR("lineBreakMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributedText, CFSTR("attributedText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highlightedTextColor, CFSTR("highlightedTextColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfLines, CFSTR("numberOfLines"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_adjustsFontSizeToFitWidth, CFSTR("adjustsFontSizeToFitWidth"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minimumScaleFactor"), self->_minimumScaleFactor);
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsDefaultTighteningForTruncation, CFSTR("allowsDefaultTighteningForTruncation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_adjustsFontForContentSizeCategory, CFSTR("adjustsFontForContentSizeCategory"));
  v6 = *(_WORD *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("font"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textAlignment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("lineBreakMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("numberOfLines"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v14, v15);

  v16 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontSizeToFitWidth"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v16, v17);

  v18 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("minimumScaleFactor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v18, v19);

  v20 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("allowsDefaultTighteningForTruncation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v20, v21);

  v22 = HIBYTE(*(_WORD *)&self->_configurationFlags) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("adjustsFontForContentSizeCategory"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v22, v23);

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
    objc_storeStrong((id *)(v4 + 32), self->_textColor);
    *(_QWORD *)(v4 + 40) = self->_textAlignment;
    *(_QWORD *)(v4 + 48) = self->_lineBreakMode;
    v7 = -[NSAttributedString copy](self->_attributedText, "copy");
    v8 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v7;

    objc_storeStrong((id *)(v4 + 80), self->_highlightedTextColor);
    *(_QWORD *)(v4 + 64) = self->_numberOfLines;
    *(_BYTE *)(v4 + 12) = self->_adjustsFontSizeToFitWidth;
    *(double *)(v4 + 72) = self->_minimumScaleFactor;
    *(_BYTE *)(v4 + 13) = self->_allowsDefaultTighteningForTruncation;
    *(_BYTE *)(v4 + 14) = self->_adjustsFontForContentSizeCategory;
    *($2BEF3EB2D24F442B8EABED39D3219975 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIContentViewLabelConfiguration *v4;
  _UIContentViewLabelConfiguration *v5;
  char v6;

  v4 = (_UIContentViewLabelConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToConfiguration:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  int v11;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;

  v3 = a2;
  if (a1)
  {
    if ((-[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](a1, v3) & 1) != 0)
    {
LABEL_3:
      a1 = 1;
      goto LABEL_17;
    }
    v4 = (void *)v3[3];
    v5 = *(id *)(a1 + 24);
    v6 = v4;
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      if (!v5 || !v6)
        goto LABEL_15;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
        goto LABEL_16;
    }
    v9 = (void *)v3[4];
    v5 = *(id *)(a1 + 32);
    v10 = v9;
    if (v5 == v10)
    {

LABEL_19:
      v13 = (void *)v3[10];
      v14 = *(id *)(a1 + 80);
      v15 = v13;
      if (v14 == v15)
      {

        goto LABEL_3;
      }
      v16 = v15;
      if (v14 && v15)
      {
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if (v17)
          goto LABEL_3;
      }
      else
      {

      }
LABEL_16:
      a1 = 0;
      goto LABEL_17;
    }
    v7 = v10;
    if (v5 && v10)
    {
      v11 = objc_msgSend(v5, "isEqual:", v10);

      if (!v11)
        goto LABEL_16;
      goto LABEL_19;
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

  return a1;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  _QWORD *v3;
  unsigned __int8 *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;

  v3 = a2;
  v4 = (unsigned __int8 *)v3;
  if (a1)
  {
    if (v3 == (_QWORD *)a1)
    {
      a1 = 1;
    }
    else
    {
      v5 = (void *)v3[2];
      v6 = *(id *)(a1 + 16);
      v7 = v5;
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        if (!v6 || !v7)
        {

LABEL_22:
          a1 = 0;
          goto LABEL_23;
        }
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if (!v9)
          goto LABEL_22;
      }
      if (*(_QWORD *)(a1 + 24) != *((_QWORD *)v4 + 3)
        || *(_QWORD *)(a1 + 32) != *((_QWORD *)v4 + 4)
        || *(_QWORD *)(a1 + 40) != *((_QWORD *)v4 + 5)
        || *(_QWORD *)(a1 + 48) != *((_QWORD *)v4 + 6)
        || !UIEqual(*(void **)(a1 + 56), *((void **)v4 + 7))
        || *(_QWORD *)(a1 + 80) != *((_QWORD *)v4 + 10)
        || *(_QWORD *)(a1 + 64) != *((_QWORD *)v4 + 8)
        || *(unsigned __int8 *)(a1 + 12) != v4[12]
        || *(double *)(a1 + 72) != *((double *)v4 + 9)
        || *(unsigned __int8 *)(a1 + 13) != v4[13])
      {
        goto LABEL_22;
      }
      a1 = *(unsigned __int8 *)(a1 + 14) == v4[14];
    }
  }
LABEL_23:

  return a1;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[UIFont hash](self->_font, "hash") ^ v3;
  v5 = -[UIColor hash](self->_textColor, "hash");
  return v4 ^ v5 ^ -[NSAttributedString hash](self->_attributedText, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;

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

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textColor = %@"), self->_textColor);
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
  if (self->_adjustsFontForContentSizeCategory)
    objc_msgSend(v3, "addObject:", CFSTR("adjustsFontForContentSizeCategory = YES"));
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v11, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (__CFString)_shortDescription
{
  uint64_t v1;
  void *v2;

  if (!a1)
    return (__CFString *)a1;
  v1 = a1[2];
  v2 = (void *)a1[7];
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

- (BOOL)_hasNonEmptyPlainTextOnly
{
  return !self->_attributedText && -[NSString length](self->_text, "length") != 0;
}

- (int64_t)_effectiveTextAlignment
{
  return self->_textAlignment;
}

- (void)applyToLabel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIFont *v7;
  void *v8;
  uint64_t v9;
  unint64_t textAlignment;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (!self->_attributedText)
  {
    objc_msgSend(v4, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAttributed");

    v4 = v12;
    if (v6)
    {
      objc_msgSend(v12, "setAttributedText:", 0);
      v4 = v12;
    }
  }
  objc_msgSend(v4, "setText:", self->_text);
  v7 = self->_font;
  if (self->_adjustsFontForContentSizeCategory && objc_msgSend(v12, "adjustsFontForContentSizeCategory"))
  {
    objc_msgSend(v12, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFont _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:](v7, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (UIFont *)v9;
  }
  objc_msgSend(v12, "setFont:", v7);
  objc_msgSend(v12, "setTextColor:", self->_textColor);
  objc_msgSend(v12, "setTextAlignment:", self->_textAlignment);
  textAlignment = self->_textAlignment;
  if (textAlignment >= 4)
  {
    if (objc_msgSend(v12, "_shouldReverseLayoutDirection"))
      v11 = 10;
    else
      v11 = 9;
  }
  else
  {
    v11 = qword_18667A958[textAlignment];
  }
  objc_msgSend(v12, "setContentMode:", v11);
  objc_msgSend(v12, "setLineBreakMode:", self->_lineBreakMode);
  if (self->_attributedText)
    objc_msgSend(v12, "setAttributedText:");
  objc_msgSend(v12, "setHighlightedTextColor:", self->_highlightedTextColor);
  objc_msgSend(v12, "setNumberOfLines:", self->_numberOfLines);
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", self->_adjustsFontSizeToFitWidth);
  objc_msgSend(v12, "setMinimumScaleFactor:", self->_minimumScaleFactor);
  objc_msgSend(v12, "setAllowsDefaultTighteningForTruncation:", self->_allowsDefaultTighteningForTruncation);
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);

}

- (void)_applyToTextField:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v9 = v3;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v3, "setAttributedText:", 0);
      v3 = v9;
    }
    objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 16));
    v4 = *(id *)(a1 + 24);
    if (*(_BYTE *)(a1 + 14) && objc_msgSend(v9, "adjustsFontForContentSizeCategory"))
    {
      objc_msgSend(v9, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    objc_msgSend(v9, "setFont:", v4);
    objc_msgSend(v9, "setTextColor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "setTextAlignment:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 40);
    if (v7 >= 4)
    {
      if (objc_msgSend(v9, "_shouldReverseLayoutDirection"))
        v8 = 10;
      else
        v8 = 9;
    }
    else
    {
      v8 = qword_18667A958[v7];
    }
    objc_msgSend(v9, "setContentMode:", v8);
    if (*(_QWORD *)(a1 + 56))
      objc_msgSend(v9, "setAttributedText:");
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", *(unsigned __int8 *)(a1 + 14));

    v3 = v9;
  }

}

- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1
{
  id v3;
  __int16 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  id v14;

  v3 = a2;
  if (!a1)
    goto LABEL_39;
  v4 = *(_WORD *)(a1 + 8);
  v14 = v3;
  if ((v4 & 1) != 0)
  {
    if ((v4 & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v5 = (void *)*((_QWORD *)v3 + 3);
    else
      v5 = 0;
    objc_storeStrong((id *)(a1 + 24), v5);
    v4 = *(_WORD *)(a1 + 8);
    v3 = v14;
    if ((v4 & 2) != 0)
    {
LABEL_4:
      if ((v4 & 4) != 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  if (v3)
    v6 = (void *)*((_QWORD *)v3 + 4);
  else
    v6 = 0;
  objc_storeStrong((id *)(a1 + 32), v6);
  v4 = *(_WORD *)(a1 + 8);
  v3 = v14;
  if ((v4 & 4) != 0)
  {
LABEL_5:
    if ((v4 & 8) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_18:
  if (v3)
    v7 = *((_QWORD *)v3 + 5);
  else
    v7 = 0;
  *(_QWORD *)(a1 + 40) = v7;
  if ((v4 & 8) != 0)
  {
LABEL_6:
    if ((v4 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_21:
  if (v3)
    v8 = *((_QWORD *)v3 + 6);
  else
    v8 = 0;
  *(_QWORD *)(a1 + 48) = v8;
  if ((v4 & 0x10) != 0)
  {
LABEL_7:
    if ((v4 & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_24:
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
    goto LABEL_30;
  }
LABEL_27:
  if (v3)
    v10 = *((_BYTE *)v3 + 12) != 0;
  else
    v10 = 0;
  *(_BYTE *)(a1 + 12) = v10;
  if ((v4 & 0x40) != 0)
  {
LABEL_9:
    if ((v4 & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_30:
  if (v3)
    v11 = *((_QWORD *)v3 + 9);
  else
    v11 = 0;
  *(_QWORD *)(a1 + 72) = v11;
  if ((v4 & 0x80) != 0)
  {
LABEL_10:
    if ((v4 & 0x100) != 0)
      goto LABEL_39;
    goto LABEL_36;
  }
LABEL_33:
  if (v3)
    v12 = *((_BYTE *)v3 + 13) != 0;
  else
    v12 = 0;
  *(_BYTE *)(a1 + 13) = v12;
  if ((v4 & 0x100) == 0)
  {
LABEL_36:
    if (v3)
      v13 = *((_BYTE *)v3 + 14) != 0;
    else
      v13 = 0;
    *(_BYTE *)(a1 + 14) = v13;
  }
LABEL_39:

}

- (void)setText:(id)a3
{
  id v4;
  const char *v5;
  NSAttributedString *attributedText;
  id newValue;

  v4 = a3;
  newValue = v4;
  if (v4)
  {
    attributedText = self->_attributedText;
    self->_attributedText = 0;

LABEL_4:
    objc_setProperty_nonatomic_copy(self, v5, newValue, 16);
    v4 = newValue;
    goto LABEL_5;
  }
  if (self)
    goto LABEL_4;
LABEL_5:

}

- (NSString)text
{
  return self->_text;
}

- (void)setFont:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)self, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setTextColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextAlignment:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_textAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setLineBreakMode:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_lineBreakMode = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  const char *v5;
  NSString *text;
  id newValue;

  v4 = a3;
  newValue = v4;
  if (v4)
  {
    text = self->_text;
    self->_text = 0;

LABEL_4:
    objc_setProperty_nonatomic_copy(self, v5, newValue, 56);
    v4 = newValue;
    goto LABEL_5;
  }
  if (self)
    goto LABEL_4;
LABEL_5:

}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setNumberOfLines:(int64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_numberOfLines = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  self->_adjustsFontSizeToFitWidth = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setMinimumScaleFactor:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_minimumScaleFactor = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_allowsDefaultTighteningForTruncation = a3;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return self->_allowsDefaultTighteningForTruncation;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
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
    *(_QWORD *)(a1 + 64) = objc_msgSend(v8, "defaultLabelNumberOfLinesForSidebar:traitCollection:", a4, v7);
    *(_BYTE *)(a1 + 13) = objc_msgSend(v8, "defaultLabelAllowsTighteningForTruncationForSidebar:traitCollection:", a4, v7);
    objc_msgSend(v8, "defaultLabelMinimumScaleFactorForSidebar:traitCollection:", a4, v7);
    v10 = v9;

    *(_BYTE *)(a1 + 12) = v10 > 0.0;
    *(double *)(a1 + 72) = v10;
    *(_BYTE *)(a1 + 14) = 1;
  }
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
