@implementation _UIBasicHeaderFooterContentViewConfiguration

+ (id)defaultHeaderConfiguration
{
  id v2;
  void *v3;
  id *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _createDefaultLabelConfiguration(1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 1, 1, v2);

  if (v4)
    v4[3] = 0;

  return v4;
}

- (id)_initWithTextLabel:(uint64_t)a3 isHeader:(int)a4 resetsVerticalLayoutMargins:(void *)a5 traitCollection:
{
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v10 = a2;
  v11 = a5;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_UIBasicHeaderFooterContentViewConfiguration;
    v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 4, a2);
      -[_UIBasicHeaderFooterContentViewConfiguration _configureForResetsVerticalLayoutMargins:isHeader:withTraitCollection:]((uint64_t)a1, a4, a3, v11);
    }
  }

  return a1;
}

+ (id)defaultFooterConfiguration
{
  id v2;
  void *v3;
  id *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _createDefaultLabelConfiguration(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 0, 1, v2);

  if (v4)
    v4[3] = (id)1;

  return v4;
}

+ (id)defaultGroupedHeaderConfiguration
{
  id v2;
  void *v3;
  id *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _createDefaultLabelConfiguration(1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 1, 0, v2);

  if (v4)
    v4[3] = (id)2;

  return v4;
}

+ (id)defaultGroupedFooterConfiguration
{
  id v2;
  void *v3;
  id *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _createDefaultLabelConfiguration(0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIBasicHeaderFooterContentViewConfiguration _initWithTextLabel:isHeader:resetsVerticalLayoutMargins:traitCollection:]((id *)[_UIBasicHeaderFooterContentViewConfiguration alloc], v3, 0, 0, v2);

  if (v4)
    v4[3] = (id)3;

  return v4;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return -[_UIBasicHeaderFooterContentViewConfiguration updatedConfigurationForState:traitCollection:](self, "updatedConfigurationForState:traitCollection:", a3, 0);
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v5;
  uint64_t v6;
  int64_t defaultStyle;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char configurationFlags;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v5 = a4;
  v6 = -[_UIBasicHeaderFooterContentViewConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  v8 = v5;
  v9 = (void *)objc_opt_self();
  v10 = v8;
  if (!v8)
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  switch(defaultStyle)
  {
    case 0:
      objc_msgSend(v9, "defaultHeaderConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(v9, "defaultFooterConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(v9, "defaultGroupedHeaderConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(v9, "defaultGroupedFooterConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = v11;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v9, CFSTR("_UIBasicHeaderFooterContentView.m"), 160, CFSTR("Unknown style: %ld"), defaultStyle);

      v13 = 0;
      break;
  }

  objc_msgSend((id)v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v14, v15);

  configurationFlags = (char)self->_configurationFlags;
  if ((configurationFlags & 1) == 0)
  {
    if (v13)
    {
      v17 = *(_QWORD *)(v13 + 16);
      if (!v6)
        goto LABEL_14;
      goto LABEL_13;
    }
    v17 = 0;
    if (v6)
    {
LABEL_13:
      *(_QWORD *)(v6 + 16) = v17;
      configurationFlags = (char)self->_configurationFlags;
    }
  }
LABEL_14:
  if ((configurationFlags & 2) == 0)
  {
    if (!v13)
    {
      v18 = 0uLL;
      v19 = 0uLL;
      if (!v6)
        goto LABEL_18;
      goto LABEL_17;
    }
    v18 = *(_OWORD *)(v13 + 40);
    v19 = *(_OWORD *)(v13 + 56);
    if (v6)
    {
LABEL_17:
      *(_OWORD *)(v6 + 40) = v18;
      *(_OWORD *)(v6 + 56) = v19;
    }
  }
LABEL_18:

  return (id)v6;
}

- (void)_configureForResetsVerticalLayoutMargins:(uint64_t)a3 isHeader:(void *)a4 withTraitCollection:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;

  v7 = a4;
  if (a1)
  {
    if (!v7)
    {
      +[UITraitCollection _fallbackTraitCollection]();
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v7;
    _UITableConstantsForTraitCollection(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", a2 ^ 1u, a3, 0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_msgSend(v20, "layoutDirection");
    if (v17 == 1)
      v18 = v16;
    else
      v18 = v12;
    if (v17 == 1)
      v19 = v12;
    else
      v19 = v16;
    *(_QWORD *)(a1 + 40) = v10;
    *(double *)(a1 + 48) = v18;
    *(_QWORD *)(a1 + 56) = v14;
    *(double *)(a1 + 64) = v19;
    *(_QWORD *)(a1 + 16) = 1;
  }
  else
  {
    v20 = v7;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBasicHeaderFooterContentViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIBasicHeaderFooterContentViewConfiguration *v5;
  uint64_t v6;
  _UIContentViewLabelConfiguration *textLabel;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIBasicHeaderFooterContentViewConfiguration;
  v5 = -[_UIBasicHeaderFooterContentViewConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v6;

    v5->_axesPreservingSuperviewLayoutMargins = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axesPreservingSuperviewLayoutMargins"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("directionalLayoutMargins"));
    v5->_directionalLayoutMargins.top = v8;
    v5->_directionalLayoutMargins.leading = v9;
    v5->_directionalLayoutMargins.bottom = v10;
    v5->_directionalLayoutMargins.trailing = v11;
    v5->_defaultStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultStyle"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v12);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v13))
      v14 = 2;
    else
      v14 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFD | v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _UIContentViewLabelConfiguration *textLabel;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  textLabel = self->_textLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", textLabel, CFSTR("textLabel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_axesPreservingSuperviewLayoutMargins, CFSTR("axesPreservingSuperviewLayoutMargins"));
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", CFSTR("directionalLayoutMargins"), self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultStyle, CFSTR("defaultStyle"));
  v6 = *(_BYTE *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_BYTE *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

}

- (id)createContentView
{
  return -[_UIBasicHeaderFooterContentView initWithConfiguration:]([_UIBasicHeaderFooterContentView alloc], "initWithConfiguration:", self);
}

- (void)applyToContentView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicHeaderFooterContentView.m"), 247, CFSTR("Unable to apply %@ to content view %@"), self, v6);

  }
  objc_msgSend(v6, "setConfiguration:", self);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[_UIContentViewLabelConfiguration copy](self->_textLabel, "copy");
    v6 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v5;

    *(_QWORD *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    v7 = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 40) = v7;
    *(_QWORD *)(v4 + 24) = self->_defaultStyle;
    *($2400C692209B9E3F2F06EF33CF4A9920 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIBasicHeaderFooterContentViewConfiguration *v4;
  _UIBasicHeaderFooterContentViewConfiguration *v5;
  _UIBasicHeaderFooterContentViewConfiguration *v6;
  _UIBasicHeaderFooterContentViewConfiguration *v7;

  v4 = (_UIBasicHeaderFooterContentViewConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    if (self)
    {
      if (self->_defaultStyle == v6->_defaultStyle
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v6->_textLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins)
      {
        LOBYTE(self) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL)));
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  void **v3;
  void **v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      LOBYTE(a1) = 1;
    }
    else if (*(void **)(a1 + 24) == v3[3]
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 32), v3[4])&& *(void **)(a1 + 16) == v4[2])
    {
      LOBYTE(a1) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(v4 + 5)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)(v4 + 7)))), 0xFuLL)));
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }

  return a1 & 1;
}

- (unint64_t)hash
{
  return -[_UIContentViewLabelConfiguration hash](self->_textLabel, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;
  unint64_t defaultStyle;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIContentViewLabelConfiguration *textLabel;
  void *v11;
  void *v12;
  void *v13;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v18;
  void *v19;
  void *v20;
  unint64_t axesPreservingSuperviewLayoutMargins;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UIBasicHeaderFooterContentViewConfigurationStyleToString(_UIBasicHeaderFooterContentViewConfigurationStyle)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIBasicHeaderFooterContentView.m"), 36, CFSTR("Unknown style: %ld"), defaultStyle);

    v6 = 0;
  }
  else
  {
    v6 = off_1E16B51C0[defaultStyle];
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Base Style = %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  textLabel = self->_textLabel;
  if (textLabel && (textLabel->_text || textLabel->_attributedText))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[_UIContentViewLabelConfiguration _shortDescription](textLabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("textLabel = %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  top = self->_directionalLayoutMargins.top;
  leading = self->_directionalLayoutMargins.leading;
  bottom = self->_directionalLayoutMargins.bottom;
  trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("directionalLayoutMargins = %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("axesPreservingSuperviewLayoutMargins = %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v27, self, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v29;
}

- (void)setResetsVerticalLayoutMargins:(BOOL)a3
{
  -[_UIBasicHeaderFooterContentViewConfiguration _configureForResetsVerticalLayoutMargins:isHeader:withTraitCollection:]((uint64_t)self, a3, (self->_defaultStyle & 0xFFFFFFFFFFFFFFFDLL) == 0, 0);
}

- (BOOL)resetsVerticalLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins == 1;
}

- (void)setAxesPreservingSuperviewLayoutMargins:(unint64_t)a3
{
  *(_BYTE *)&self->_configurationFlags |= 1u;
  self->_axesPreservingSuperviewLayoutMargins = a3;
}

- (unint64_t)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  *(_BYTE *)&self->_configurationFlags |= 2u;
  self->_directionalLayoutMargins = a3;
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_directionalLayoutMargins.top;
  leading = self->_directionalLayoutMargins.leading;
  bottom = self->_directionalLayoutMargins.bottom;
  trailing = self->_directionalLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
