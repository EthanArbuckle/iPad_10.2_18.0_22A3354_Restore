@implementation _UILabelConfiguration

- (id)_internal
{
  if (a1)
    a1 = (id *)a1[20];
  return a1;
}

- (_UILabelConfiguration)initWithTraitCollection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  _UILabelContent *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UILabelConfiguration;
  v5 = -[_UILabelConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "displayScale");
    *((_QWORD *)v5 + 19) = v6;
    +[UILabel _defaultAttributes](UILabel, "_defaultAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      *((_QWORD *)v5 + 4) = objc_msgSend(v9, "lineBreakMode");
      *((_DWORD *)v5 + 42) |= 0x8000u;
      *((_QWORD *)v5 + 5) = objc_msgSend(v10, "lineBreakStrategy");
      *((_DWORD *)v5 + 42) |= 0x10000u;
      v11 = objc_msgSend(v10, "alignment");
      v12 = *((_DWORD *)v5 + 42);
    }
    else
    {
      v13 = *((_DWORD *)v5 + 42);
      *((_OWORD *)v5 + 2) = xmmword_186679340;
      v12 = v13 | 0x18000;
      v11 = 4;
    }
    *((_QWORD *)v5 + 3) = v11;
    *((_DWORD *)v5 + 42) = v12 | 0x4000;
    v14 = -[_UILabelContent initWithDefaultAttributes:]([_UILabelContent alloc], "initWithDefaultAttributes:", v8);
    v15 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v14;

    *((_DWORD *)v5 + 42) |= 0x80u;
  }

  return (_UILabelConfiguration *)v5;
}

+ (_UILabelConfiguration)new
{
  return (_UILabelConfiguration *)objc_alloc_init((Class)objc_opt_class());
}

- (_UILabelConfiguration)init
{
  void *v3;
  _UILabelConfiguration *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UILabelConfiguration initWithTraitCollection:](self, "initWithTraitCollection:", v3);

  return v4;
}

- (id)_initEmpty
{
  void *v3;
  _UILabelConfiguration *v4;
  _UILabelContent *v5;
  uint64_t v6;
  _UILabelContent *content;

  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UILabelConfiguration initWithTraitCollection:](self, "initWithTraitCollection:", v3);

  if (v4)
  {
    v5 = [_UILabelContent alloc];
    v6 = -[_UILabelContent initWithDefaultAttributes:](v5, "initWithDefaultAttributes:", MEMORY[0x1E0C9AA70]);
    content = v4->_content;
    v4->_content = (_UILabelContent *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILabelConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UILabelConfiguration *v5;
  _UILabelContent *content;
  void *v7;
  uint64_t v8;
  _UILabelContent *v9;
  _UILabelContent *v10;
  void *v11;
  uint64_t v12;
  _UILabelContent *v13;
  _UILabelContent *v14;
  void *v15;
  uint64_t v16;
  _UILabelContent *v17;
  uint64_t v18;
  UIColor *textColor;
  uint64_t v20;
  UIColor *highlightedTextColor;
  uint64_t v22;
  UIColor *textBackgroundColor;
  uint64_t v24;
  UIColor *backgroundColor;
  uint64_t v26;
  NSShadow *shadow;
  uint64_t v28;
  UIFont *font;
  float v30;
  int v31;
  int v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  float v37;
  int v38;
  int v39;
  uint64_t v40;
  _UILabelConfigurationInternal *internal;
  float v42;

  v4 = a3;
  v5 = -[_UILabelConfiguration _initEmpty](self, "_initEmpty");
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_defaultAttributes")))
    {
      content = v5->_content;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_hasCustomized_defaultAttributes"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelContent contentWithDefaultAttributes:](content, "contentWithDefaultAttributes:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_content;
      v5->_content = (_UILabelContent *)v8;

      *(_DWORD *)&v5->_configurationFlags |= 0x80u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_text")))
    {
      v10 = v5->_content;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_hasCustomized_text"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelContent contentWithString:](v10, "contentWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_content;
      v5->_content = (_UILabelContent *)v12;

      *(_DWORD *)&v5->_configurationFlags |= 0x20u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_attributedText")))
    {
      v14 = v5->_content;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_hasCustomized_attributedText"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelContent contentWithAttributedString:](v14, "contentWithAttributedString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_content;
      v5->_content = (_UILabelContent *)v16;

      *(_DWORD *)&v5->_configurationFlags |= 0x40u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_textColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_textColor"));
      v18 = objc_claimAutoreleasedReturnValue();
      textColor = v5->_textColor;
      v5->_textColor = (UIColor *)v18;

      *(_DWORD *)&v5->_configurationFlags |= 0x200u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_highlightedTextColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_highlightedTextColor"));
      v20 = objc_claimAutoreleasedReturnValue();
      highlightedTextColor = v5->_highlightedTextColor;
      v5->_highlightedTextColor = (UIColor *)v20;

      *(_DWORD *)&v5->_configurationFlags |= 0x400u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_textBackgroundColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_textBackgroundColor"));
      v22 = objc_claimAutoreleasedReturnValue();
      textBackgroundColor = v5->_textBackgroundColor;
      v5->_textBackgroundColor = (UIColor *)v22;

      *(_DWORD *)&v5->_configurationFlags |= 0x800u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_backgroundColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_backgroundColor"));
      v24 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v24;

      *(_DWORD *)&v5->_configurationFlags |= 0x2000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_shadow")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_shadow"));
      v26 = objc_claimAutoreleasedReturnValue();
      shadow = v5->_shadow;
      v5->_shadow = (NSShadow *)v26;

      *(_DWORD *)&v5->_configurationFlags |= 0x1000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_font")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabelConfiguration_font"));
      v28 = objc_claimAutoreleasedReturnValue();
      font = v5->_font;
      v5->_font = (UIFont *)v28;

      *(_DWORD *)&v5->_configurationFlags |= 0x100u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_lineBreakMode")))
    {
      v5->_lineBreakMode = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UILabelConfiguration_lineBreakMode"));
      *(_DWORD *)&v5->_configurationFlags |= 0x8000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_lineBreakStrategy")))
    {
      v5->_lineBreakStrategy = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UILabelConfiguration_lineBreakStrategy"));
      *(_DWORD *)&v5->_configurationFlags |= 0x10000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_textAlignment")))
    {
      v5->_textAlignment = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UILabelConfiguration_textAlignment"));
      *(_DWORD *)&v5->_configurationFlags |= 0x4000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_numberOfLines")))
    {
      v5->_numberOfLines = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UILabelConfiguration_numberOfLines"));
      *(_DWORD *)&v5->_configurationFlags |= 0x20000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_minimumScaleFactor")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelConfiguration_minimumScaleFactor"));
      v5->_minimumScaleFactor = v30;
      *(_DWORD *)&v5->_configurationFlags |= 0x80000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth")))v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_adjustsFontSizeToFitWidth")) | 0x40000);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_adjustsFontForContentSizeCategory")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_adjustsFontForContentSizeCategory")))v31 = 2097156;
      else
        v31 = 0x200000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFB | v31);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_allowsDefaultTighteningForTruncation")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_allowsDefaultTighteningForTruncation")))v32 = 1048578;
      else
        v32 = 0x100000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFD | v32);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_bounds")))
    {
      objc_msgSend(v4, "decodeRectForKey:", CFSTR("UILabelConfiguration_bounds"));
      v5->_bounds.origin.x = v33;
      v5->_bounds.origin.y = v34;
      v5->_bounds.size.width = v35;
      v5->_bounds.size.height = v36;
      *(_DWORD *)&v5->_configurationFlags |= 0x400000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_preferredMaxLayoutWidth")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelConfiguration_preferredMaxLayoutWidth"));
      v5->_preferredMaxLayoutWidth = v37;
      *(_DWORD *)&v5->_configurationFlags |= 0x800000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_semanticContentAttribute")))
    {
      v5->_semanticContentAttribute = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UILabelConfiguration_semanticContentAttribute"));
      *(_DWORD *)&v5->_configurationFlags |= 0x1000000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_isEnabled")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_isEnabled")))
        v38 = 33554440;
      else
        v38 = 0x2000000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFF7 | v38);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_isHighlighted")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_isHighlighted")))
        v39 = 67108880;
      else
        v39 = 0x4000000;
      v5->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFEF | v39);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_internal")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelConfiguration_internal"));
      v40 = objc_claimAutoreleasedReturnValue();
      internal = v5->_internal;
      v5->_internal = (_UILabelConfigurationInternal *)v40;

      *(_DWORD *)&v5->_configurationFlags |= 0x8000000u;
    }
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelConfiguration_displayScale"));
    v5->_displayScale = v42;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  $A04097B2114CAB6226B776567B655A1B configurationFlags;
  double displayScale;
  double minimumScaleFactor;
  double preferredMaxLayoutWidth;
  id v8;

  v8 = a3;
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x200) != 0)
  {
    objc_msgSend(v8, "encodeObject:forKey:", self->_textColor, CFSTR("UILabelConfiguration_textColor"));
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_textColor"));
    configurationFlags = self->_configurationFlags;
    if ((*(_WORD *)&configurationFlags & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&configurationFlags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v8, "encodeObject:forKey:", self->_highlightedTextColor, CFSTR("UILabelConfiguration_highlightedTextColor"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_highlightedTextColor"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v8, "encodeObject:forKey:", self->_textBackgroundColor, CFSTR("UILabelConfiguration_textBackgroundColor"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_textBackgroundColor"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v8, "encodeObject:forKey:", self->_shadow, CFSTR("UILabelConfiguration_shadow"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_shadow"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&configurationFlags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v8, "encodeObject:forKey:", self->_backgroundColor, CFSTR("UILabelConfiguration_backgroundColor"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_backgroundColor"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v8, "encodeObject:forKey:", self->_font, CFSTR("UILabelConfiguration_font"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_font"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v8, "encodeInt:forKey:", LODWORD(self->_lineBreakMode), CFSTR("UILabelConfiguration_lineBreakMode"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_lineBreakMode"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v8, "encodeInt:forKey:", LODWORD(self->_lineBreakStrategy), CFSTR("UILabelConfiguration_lineBreakStrategy"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_lineBreakStrategy"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v8, "encodeInt:forKey:", LODWORD(self->_textAlignment), CFSTR("UILabelConfiguration_textAlignment"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_textAlignment"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&configurationFlags & 0x80000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v8, "encodeInt:forKey:", LODWORD(self->_numberOfLines), CFSTR("UILabelConfiguration_numberOfLines"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_numberOfLines"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  minimumScaleFactor = self->_minimumScaleFactor;
  *(float *)&minimumScaleFactor = minimumScaleFactor;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("UILabelConfiguration_minimumScaleFactor"), minimumScaleFactor);
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_minimumScaleFactor"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&configurationFlags & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v8, "encodeBool:forKey:", *(_BYTE *)&configurationFlags & 1, CFSTR("UILabelConfiguration_adjustsFontSizeToFitWidth"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v8, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 1) & 1, CFSTR("UILabelConfiguration_allowsDefaultTighteningForTruncation"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_allowsDefaultTighteningForTruncation"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v8, "encodeBool:forKey:", *(_BYTE *)&configurationFlags & 1, CFSTR("UILabelConfiguration_adjustsFontSizeToFitWidth"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_adjustsFontSizeToFitWidth"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&configurationFlags & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v8, "encodeRect:forKey:", CFSTR("UILabelConfiguration_bounds"), self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_bounds"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&configurationFlags & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  *(float *)&preferredMaxLayoutWidth = preferredMaxLayoutWidth;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("UILabelConfiguration_preferredMaxLayoutWidth"), preferredMaxLayoutWidth);
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_preferredMaxLayoutWidth"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&configurationFlags & 0x2000000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v8, "encodeInt:forKey:", LODWORD(self->_semanticContentAttribute), CFSTR("UILabelConfiguration_semanticContentAttribute"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_semanticContentAttribute"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&configurationFlags & 0x4000000) == 0)
      goto LABEL_20;
LABEL_41:
    objc_msgSend(v8, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 4) & 1, CFSTR("UILabelConfiguration_isHighlighted"));
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_isHighlighted"));
    if ((*(_DWORD *)&self->_configurationFlags & 0x8000000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_40:
  objc_msgSend(v8, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 3) & 1, CFSTR("UILabelConfiguration_isEnabled"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_isEnabled"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x4000000) != 0)
    goto LABEL_41;
LABEL_20:
  if ((*(_DWORD *)&configurationFlags & 0x8000000) != 0)
  {
LABEL_21:
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_internal"));
    objc_msgSend(v8, "encodeObject:forKey:", self->_internal, CFSTR("UILabelConfiguration_internal"));
  }
LABEL_22:
  displayScale = self->_displayScale;
  *(float *)&displayScale = displayScale;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("UILabelConfiguration_displayScale"), displayScale);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CGSize size;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initEmpty");
  *(double *)(v5 + 152) = self->_displayScale;
  v6 = -[_UILabelContent copyWithZone:](self->_content, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[UIFont copyWithZone:](self->_font, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[UIColor copyWithZone:](self->_textColor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[UIColor copyWithZone:](self->_highlightedTextColor, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[UIColor copyWithZone:](self->_textBackgroundColor, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[UIColor copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  v18 = -[NSShadow copyWithZone:](self->_shadow, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  *(_QWORD *)(v5 + 32) = self->_lineBreakMode;
  *(_QWORD *)(v5 + 40) = self->_lineBreakStrategy;
  *(_QWORD *)(v5 + 24) = self->_textAlignment;
  *(_QWORD *)(v5 + 96) = self->_numberOfLines;
  *(double *)(v5 + 104) = self->_minimumScaleFactor;
  size = self->_bounds.size;
  *(CGPoint *)(v5 + 112) = self->_bounds.origin;
  *(CGSize *)(v5 + 128) = size;
  *(double *)(v5 + 144) = self->_preferredMaxLayoutWidth;
  *(_QWORD *)(v5 + 16) = self->_semanticContentAttribute;
  *($A04097B2114CAB6226B776567B655A1B *)(v5 + 168) = self->_configurationFlags;
  v21 = -[_UILabelConfigurationInternal copyWithZone:](self->_internal, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _UILabelConfiguration *v4;
  char v5;

  v4 = (_UILabelConfiguration *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ((*(_DWORD *)&self->_configurationFlags ^ *(_DWORD *)&v4->_configurationFlags) & 0x1F) != 0
      || v4->_numberOfLines != self->_numberOfLines
      || v4->_minimumScaleFactor != self->_minimumScaleFactor
      || v4->_lineBreakMode != self->_lineBreakMode
      || v4->_displayScale != self->_displayScale
      || v4->_lineBreakStrategy != self->_lineBreakStrategy
      || v4->_textAlignment != self->_textAlignment
      || v4->_semanticContentAttribute != self->_semanticContentAttribute
      || !CGRectEqualToRect(v4->_bounds, self->_bounds)
      || v4->_preferredMaxLayoutWidth != self->_preferredMaxLayoutWidth
      || !UIEqual(v4->_textColor, self->_textColor)
      || !UIEqual(v4->_highlightedTextColor, self->_highlightedTextColor)
      || !UIEqual(v4->_textBackgroundColor, self->_textBackgroundColor)
      || !UIEqual(v4->_backgroundColor, self->_backgroundColor)
      || !UIEqual(v4->_font, self->_font)
      || !UIEqual(v4->_content, self->_content)
      || !UIEqual(v4->_textColor, self->_textColor)
      || !UIEqual(v4->_textBackgroundColor, self->_textBackgroundColor)
      || !UIEqual(v4->_backgroundColor, self->_backgroundColor)
      || !UIEqual(v4->_shadow, self->_shadow))
    {
      v5 = 0;
      goto LABEL_27;
    }
    if ((*((_BYTE *)&self->_configurationFlags + 3) & 8) != 0 && (*((_BYTE *)&v4->_configurationFlags + 3) & 8) != 0)
    {
      v5 = UIEqual(v4->_internal, self->_internal);
      goto LABEL_27;
    }
  }
  v5 = 1;
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  int v4;

  v3 = -[_UILabelContent hash](self->_content, "hash");
  v4 = *(_DWORD *)&self->_configurationFlags << 24;
  return self->_numberOfLines ^ v3 ^ (16 * (int)(self->_displayScale * 100.0)) ^ ((int)(self->_minimumScaleFactor * 100.0) << 8) ^ (unint64_t)((int)(self->_preferredMaxLayoutWidth * 100.0) << 16) ^ v4 & 0x1000000 ^ (unint64_t)(v4 & 0x2000000) ^ v4 & 0x4000000 ^ v4 & 0x8000000 ^ v4 & 0x10000000;
}

- (NSString)text
{
  return (NSString *)-[_UILabelContent string](self->_content, "string");
}

- (void)setText:(id)a3
{
  _UILabelContent *v4;
  _UILabelContent *content;

  -[_UILabelContent contentWithString:](self->_content, "contentWithString:", a3);
  v4 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
  content = self->_content;
  self->_content = v4;

  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFF9F | 0x20);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[_UILabelContent attributedString](self->_content, "attributedString");
}

- (void)setAttributedText:(id)a3
{
  _UILabelContent *v4;
  _UILabelContent *content;

  -[_UILabelContent contentWithAttributedString:](self->_content, "contentWithAttributedString:", a3);
  v4 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
  content = self->_content;
  self->_content = v4;

  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFF9F | 0x40);
}

- (NSDictionary)_defaultAttributes
{
  return (NSDictionary *)-[_UILabelContent defaultAttributes](self->_content, "defaultAttributes");
}

- (void)_setDefaultAttributes:(id)a3
{
  _UILabelContent *v4;
  _UILabelContent *content;

  -[_UILabelContent contentWithDefaultAttributes:](self->_content, "contentWithDefaultAttributes:", a3);
  v4 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
  content = self->_content;
  self->_content = v4;

  *(_DWORD *)&self->_configurationFlags |= 0x80u;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x100u;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x200u;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x400u;
}

- (UIColor)textBackgroundColor
{
  return self->_textBackgroundColor;
}

- (void)setTextBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_textBackgroundColor, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x800u;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x1000u;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  *(_DWORD *)&self->_configurationFlags |= 0x2000u;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x4000u;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x8000u;
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  self->_lineBreakStrategy = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x10000u;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x20000u;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return *(_DWORD *)&self->_configurationFlags & 1;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFE | a3 | 0x40000);
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x80000u;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return (*(_BYTE *)&self->_configurationFlags >> 1) & 1;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048578;
  else
    v3 = 0x100000;
  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFD | v3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return (*(_BYTE *)&self->_configurationFlags >> 2) & 1;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097156;
  else
    v3 = 0x200000;
  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFFB | v3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x400000u;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x800000u;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  self->_semanticContentAttribute = a3;
  *(_DWORD *)&self->_configurationFlags |= 0x1000000u;
}

- (BOOL)isEnabled
{
  return (*(_BYTE *)&self->_configurationFlags >> 3) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554440;
  else
    v3 = 0x2000000;
  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFF7 | v3);
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_configurationFlags >> 4) & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 67108880;
  else
    v3 = 0x4000000;
  self->_configurationFlags = ($A04097B2114CAB6226B776567B655A1B)(*(_DWORD *)&self->_configurationFlags & 0xFFFFFFEF | v3);
}

- (UIColor)_resolvedTextColor
{
  void *v2;
  void *v3;
  UIColor *v4;
  uint64_t v5;
  id v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;

  if (!a1)
  {
    v10 = 0;
    return v10;
  }
  if (objc_msgSend(a1, "isEnabled"))
  {
    if (objc_msgSend(a1, "isHighlighted"))
    {
      objc_msgSend(a1, "highlightedTextColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2)
      {
        v4 = v2;
      }
      else
      {
        objc_msgSend(a1, "textColor");
        v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v4;

      if (!v8)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(a1, "textColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_16:
        +[UIColor labelColor](UIColor, "labelColor");
        v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
  }
  else
  {
    v5 = a1[20];
    if (v5 && (v6 = *(id *)(v5 + 16)) != 0)
    {
      v7 = (UIColor *)v6;
      v8 = v7;
    }
    else
    {
      v8 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.56, 1.0);
      v7 = 0;
    }

    if (!v8)
      goto LABEL_16;
  }
  v9 = v8;
LABEL_17:
  v10 = v9;

  return v10;
}

- (id)_resolvedStringDrawingContext
{
  id v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  if (a1)
  {
    v2 = objc_alloc_init((Class)off_1E1679CC0);
    v3 = objc_msgSend(a1, "numberOfLines");
    objc_msgSend(v2, "setWrapsForTruncationMode:", v3 != 1);
    objc_msgSend(v2, "setMaximumNumberOfLines:", v3);
    objc_msgSend(v2, "setCachesLayout:", 1);
    objc_msgSend(v2, "setLayout:", 0);
    v4 = a1[20];
    if (v4 && (v4[24] & 0x10) != 0)
    {
      objc_msgSend(v2, "setUsesSimpleTextEffects:", 1);
      v4 = a1[20];
    }
    -[_UILabelConfigurationInternal _resolvedCuiCatalog](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UILabelConfigurationInternal _resolvedCuiCatalog](a1[20]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setCuiCatalog:", v6);

    }
    -[_UILabelConfigurationInternal _resolvedCuiStyleEffectConfiguration](a1[20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UILabelConfigurationInternal _resolvedCuiStyleEffectConfiguration](a1[20]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setCuiStyleEffects:", v8);

      objc_msgSend(v2, "cuiStyleEffects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "useSimplifiedEffect");

      if (v10)
        objc_msgSend(v2, "setUsesSimpleTextEffects:", 1);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  $A04097B2114CAB6226B776567B655A1B configurationFlags;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  $A04097B2114CAB6226B776567B655A1B v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  CGRect v28;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  configurationFlags = self->_configurationFlags;
  if ((*(_BYTE *)&configurationFlags & 0x20) != 0)
  {
    -[_UILabelConfiguration text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" text=%@"), v6);

    configurationFlags = self->_configurationFlags;
    if ((*(_BYTE *)&configurationFlags & 0x40) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&configurationFlags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  -[_UILabelConfiguration attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" attributedText=%@"), v7);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x200) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  -[_UILabelConfiguration textColor](self, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" textColor=%@"), v8);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x400) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  -[_UILabelConfiguration highlightedTextColor](self, "highlightedTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" highlightedTextColor=%@"), v9);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  -[_UILabelConfiguration textBackgroundColor](self, "textBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" textBackgroundColor=%@"), v10);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&configurationFlags & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  -[_UILabelConfiguration backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" backgroundColor=%@"), v11);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  -[_UILabelConfiguration font](self, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" font=%@"), v12);

  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  -[_UILabelConfiguration shadow](self, "shadow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" shadow=%@"), v13);

  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "appendFormat:", CFSTR(" numberOfLines=%ld"), -[_UILabelConfiguration numberOfLines](self, "numberOfLines"));
  if ((*(_DWORD *)&self->_configurationFlags & 0x10000) == 0)
    goto LABEL_31;
LABEL_21:
  v14 = -[_UILabelConfiguration lineBreakStrategy](self, "lineBreakStrategy");
  if (v14 > 1)
  {
    if (v14 == 2)
    {
      v15 = CFSTR(" lineBreakStrategy=hangulWordPriority");
    }
    else
    {
      if (v14 != 0xFFFF)
        goto LABEL_31;
      v15 = CFSTR(" lineBreakStrategy=standard");
    }
  }
  else if (v14)
  {
    if (v14 != 1)
      goto LABEL_31;
    v15 = CFSTR(" lineBreakStrategy=pushOut");
  }
  else
  {
    v15 = CFSTR(" lineBreakStrategy=none");
  }
  objc_msgSend(v4, "appendFormat:", v15);
LABEL_31:
  if ((*((_BYTE *)&self->_configurationFlags + 1) & 0x80) != 0)
  {
    switch(-[_UILabelConfiguration lineBreakMode](self, "lineBreakMode"))
    {
      case 0:
        v16 = CFSTR(" lineBreakMode=wordWrapping");
        goto LABEL_40;
      case 1:
        v16 = CFSTR(" lineBreakMode=charWrapping");
        goto LABEL_40;
      case 2:
        v16 = CFSTR(" lineBreakMode=clipping");
        goto LABEL_40;
      case 3:
        v16 = CFSTR(" lineBreakMode=truncatingHead");
        goto LABEL_40;
      case 4:
        v16 = CFSTR(" lineBreakMode=truncatingTail");
        goto LABEL_40;
      case 5:
        v16 = CFSTR(" lineBreakMode=truncatingMiddle");
LABEL_40:
        objc_msgSend(v4, "appendString:", v16);
        break;
      default:
        objc_msgSend(v4, "appendFormat:", CFSTR(" lineBreakMode=%ld"), -[_UILabelConfiguration lineBreakMode](self, "lineBreakMode"));
        break;
    }
  }
  if ((*((_BYTE *)&self->_configurationFlags + 1) & 0x40) != 0)
  {
    switch(-[_UILabelConfiguration textAlignment](self, "textAlignment"))
    {
      case 0:
        objc_msgSend(v4, "appendString:", CFSTR(" textAlignment=left"));
        goto LABEL_44;
      case 1:
LABEL_44:
        v17 = CFSTR(" textAlignment=center");
        goto LABEL_49;
      case 2:
        v17 = CFSTR(" textAlignment=right");
        goto LABEL_49;
      case 3:
        v17 = CFSTR(" textAlignment=justified");
        goto LABEL_49;
      case 4:
        v17 = CFSTR(" textAlignment=natural");
LABEL_49:
        objc_msgSend(v4, "appendString:", v17);
        break;
      default:
        objc_msgSend(v4, "appendFormat:", CFSTR(" textAlignment=%ld"), -[_UILabelConfiguration textAlignment](self, "textAlignment"));
        break;
    }
  }
  v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x40000) != 0)
  {
    if (-[_UILabelConfiguration adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v4, "appendFormat:", CFSTR(" adjustsFontSizeToFitWidth=%@"), v19);
    v18 = self->_configurationFlags;
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v18 & 0x200000) == 0)
        goto LABEL_53;
      goto LABEL_63;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
    goto LABEL_52;
  }
  -[_UILabelConfiguration minimumScaleFactor](self, "minimumScaleFactor");
  objc_msgSend(v4, "appendFormat:", CFSTR(" minimumScaleFactor=%f"), v20);
  v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v18 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_67;
  }
LABEL_63:
  if (-[_UILabelConfiguration adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR(" adjustsFontForContentSizeCategory=%@"), v21);
  v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v18 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_71;
  }
LABEL_67:
  if (-[_UILabelConfiguration allowsDefaultTighteningForTruncation](self, "allowsDefaultTighteningForTruncation"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR(" allowsDefaultTighteningForTruncation=%@"), v22);
  v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x400000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v18 & 0x800000) == 0)
      goto LABEL_56;
LABEL_72:
    -[_UILabelConfiguration preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
    objc_msgSend(v4, "appendFormat:", CFSTR(" preferredMaxLayoutWidth=%f"), v24);
    if ((*(_DWORD *)&self->_configurationFlags & 0x1000000) == 0)
      goto LABEL_81;
    goto LABEL_73;
  }
LABEL_71:
  -[_UILabelConfiguration bounds](self, "bounds");
  NSStringFromCGRect(v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" bounds=%@"), v23);

  v18 = self->_configurationFlags;
  if ((*(_DWORD *)&v18 & 0x800000) != 0)
    goto LABEL_72;
LABEL_56:
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
    goto LABEL_81;
LABEL_73:
  switch(-[_UILabelConfiguration semanticContentAttribute](self, "semanticContentAttribute"))
  {
    case 0:
      v25 = CFSTR(" semanticContentAttribute=unspecified");
      goto LABEL_80;
    case 1:
      v25 = CFSTR(" semanticContentAttribute=playback");
      goto LABEL_80;
    case 2:
      v25 = CFSTR(" semanticContentAttribute=spatial");
      goto LABEL_80;
    case 3:
      v25 = CFSTR(" semanticContentAttribute=forceLeftToRight");
      goto LABEL_80;
    case 4:
      v25 = CFSTR(" semanticContentAttribute=forceRightToLeft");
LABEL_80:
      objc_msgSend(v4, "appendString:", v25);
      break;
    default:
      objc_msgSend(v4, "appendFormat:", CFSTR(" semanticContentAttribute=%ld"), -[_UILabelConfiguration semanticContentAttribute](self, "semanticContentAttribute"));
      break;
  }
LABEL_81:
  objc_msgSend(v4, "appendFormat:", CFSTR(" displayScale=%f"), *(_QWORD *)&self->_displayScale);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v26 = (void *)objc_msgSend(v4, "copy");

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
