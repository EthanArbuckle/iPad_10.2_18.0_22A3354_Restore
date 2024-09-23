@implementation UIVectorLabel

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIVectorLabel)initWithFrame:(CGRect)a3
{
  UIVectorLabel *v3;
  UIVectorLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIVectorLabel;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIVectorLabel setNumberOfLines:](v3, "setNumberOfLines:", 1);
  return v4;
}

+ (id)_defaultFont
{
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

+ (id)_defaultAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__UIVectorLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_7_14 != -1)
    dispatch_once(&_MergedGlobals_7_14, block);
  return (id)qword_1ECD7B408;
}

void __35__UIVectorLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = *(_QWORD *)off_1E1678D90;
  objc_msgSend(*(id *)(a1 + 32), "_defaultFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v5[1] = *(_QWORD *)off_1E1678D98;
  +[UIColor blackColor](UIColor, "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECD7B408;
  qword_1ECD7B408 = v3;

}

- (void)_mergeDefaultAttributesForDowngradingContent:(id)a3
{
  NSMutableDictionary *defaultAttributes;
  id v5;
  _UILabelContent *v6;
  void *content;
  NSMutableDictionary *v8;

  defaultAttributes = self->_defaultAttributes;
  v5 = a3;
  if (-[NSMutableDictionary count](defaultAttributes, "count"))
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_defaultAttributes, "addEntriesFromDictionary:", v5);

    -[_UILabelContent contentWithDefaultAttributes:](self->_content, "contentWithDefaultAttributes:", self->_defaultAttributes);
    v6 = (_UILabelContent *)objc_claimAutoreleasedReturnValue();
    content = self->_content;
    self->_content = v6;
  }
  else
  {
    v8 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");

    content = self->_defaultAttributes;
    self->_defaultAttributes = v8;
  }

}

- (id)_defaultAttributes
{
  NSMutableDictionary *defaultAttributes;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  defaultAttributes = self->_defaultAttributes;
  if (!defaultAttributes)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    v6 = self->_defaultAttributes;
    self->_defaultAttributes = v5;

    defaultAttributes = self->_defaultAttributes;
  }
  return defaultAttributes;
}

- (_UILabelContent)_content
{
  _UILabelContent *content;
  _UILabelContent *v4;
  void *v5;
  _UILabelContent *v6;
  _UILabelContent *v7;

  content = self->_content;
  if (!content)
  {
    v4 = [_UILabelContent alloc];
    -[UIVectorLabel _defaultAttributes](self, "_defaultAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UILabelContent initWithDefaultAttributes:](v4, "initWithDefaultAttributes:", v5);
    v7 = self->_content;
    self->_content = v6;

    content = self->_content;
  }
  return content;
}

- (void)_setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)_setTextColor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIVectorLabel _content](self, "_content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)off_1E1678D98;
  if ((objc_msgSend(v4, "isAttribute:uniformlyEqualToValue:", *(_QWORD *)off_1E1678D98, v7) & 1) == 0)
  {
    objc_msgSend(v4, "contentByApplyingAttributeToEntireRange:value:", v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVectorLabel _setContent:](self, "_setContent:", v6);

    -[NSMutableDictionary setObject:forKey:](self->_defaultAttributes, "setObject:forKey:", v7, v5);
    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
  }

}

- (UIColor)textColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIVectorLabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultValueForAttribute:", *(_QWORD *)off_1E1678D98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIColor *)v6;
}

- (void)setFont:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultFont");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIVectorLabel _content](self, "_content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)off_1E1678D90;
  if ((objc_msgSend(v4, "isAttribute:uniformlyEqualToValue:", *(_QWORD *)off_1E1678D90, v7) & 1) == 0)
  {
    objc_msgSend(v4, "contentByApplyingAttributeToEntireRange:value:", v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVectorLabel _setContent:](self, "_setContent:", v6);

    -[NSMutableDictionary setObject:forKey:](self->_defaultAttributes, "setObject:forKey:", v7, v5);
    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
  }

}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[UIVectorLabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultValueForAttribute:", *(_QWORD *)off_1E1678D90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIVectorLabel _content](self, "_content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
  {
    objc_msgSend(v4, "contentWithString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVectorLabel _setContent:](self, "_setContent:", v5);

    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
  }

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[UIVectorLabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setAttributedText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIVectorLabel _content](self, "_content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToAttributedString:", v6) & 1) == 0)
  {
    objc_msgSend(v4, "contentWithAttributedString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVectorLabel _setContent:](self, "_setContent:", v5);

    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
  }

}

- (id)_materializedAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIVectorLabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVectorLabel _setContent:](self, "_setContent:", v4);

  -[UIVectorLabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
  -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  int v5;

  v5 = -[UIVectorLabel _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  *(_BYTE *)&self->_labelFlags = *(_BYTE *)&self->_labelFlags & 0xFE | (a3 != 0.0);
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_preferredMaxLayoutWidth = a3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UIVectorLabel;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UIVectorLabel;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[UIVectorLabel _setNeedsUpdateLayerIfNeeded](self, "_setNeedsUpdateLayerIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[UIVectorLabel _ensureSizingLayout](self, "_ensureSizingLayout");
  -[_UIVectorTextLayout size](self->_sizingLayout, "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_ensureSizingLayout
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;

  -[UIVectorLabel _preferredMaxLayoutWidth](self, "_preferredMaxLayoutWidth");
  if (v3 <= 0.0)
  {
    v6 = 1.79769313e308;
  }
  else
  {
    v4 = v3;
    v5 = -[UIVectorLabel numberOfLines](self, "numberOfLines");
    v6 = 1.79769313e308;
    if (v5 != 1)
      v6 = v4;
  }
  -[UIVectorLabel _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", v6, 1.79769313e308);
}

- (void)_ensureVisualLayout
{
  double v3;
  double v4;
  void *v5;
  char v6;
  _UIVectorTextLayout **p_sizingLayout;
  _UIVectorTextLayout *sizingLayout;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  _UIVectorTextLayout *v14;
  uint64_t v15;
  double v16;
  double v17;
  _UIVectorTextLayout *visualLayout;
  id v19;

  if (!self->_visualLayout)
  {
    p_sizingLayout = &self->_sizingLayout;
    if (!self->_sizingLayout)
      goto LABEL_11;
    goto LABEL_7;
  }
  -[UIView bounds](self, "bounds");
  -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIVectorTextLayout parameters](self->_visualLayout, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToParameters:", v19);

  if ((v6 & 1) == 0)
  {
    p_sizingLayout = &self->_sizingLayout;
    sizingLayout = self->_sizingLayout;
    if (!sizingLayout)
      goto LABEL_10;
    v9 = (uint64_t)v19;
    if (v19)
    {
LABEL_8:
      v19 = (id)v9;
      -[_UIVectorTextLayout parameters](sizingLayout, "parameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToParameters:", v19);

      if (v13)
      {
        v14 = *p_sizingLayout;
LABEL_13:
        visualLayout = self->_visualLayout;
        self->_visualLayout = v14;

        goto LABEL_14;
      }
LABEL_10:
      v15 = (uint64_t)v19;
      if (v19)
      {
LABEL_12:
        v19 = (id)v15;
        v14 = -[_UIVectorTextLayout initWithTextParameters:]([_UIVectorTextLayout alloc], "initWithTextParameters:", v15);
        goto LABEL_13;
      }
LABEL_11:
      -[UIView bounds](self, "bounds");
      -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v16, v17);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_7:
    -[UIView bounds](self, "bounds");
    -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v10, v11);
    v9 = objc_claimAutoreleasedReturnValue();
    sizingLayout = *p_sizingLayout;
    goto LABEL_8;
  }
LABEL_14:

}

- (id)_layoutParametersWithinSize:(CGSize)a3 forSizing:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setWithinSize:", width, height);
  objc_msgSend(v8, "setNumberOfLines:", -[UIVectorLabel numberOfLines](self, "numberOfLines"));
  if (a4)
    -[UIVectorLabel _attributedTextCompatibleForSizing](self, "_attributedTextCompatibleForSizing");
  else
    -[UIVectorLabel _attributedText](self, "_attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v9);

  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTraitCollection:", v10);

  return v8;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width;
  unint64_t v5;
  double v7;
  _UIVectorTextLayout *sizingLayout;
  void *v9;
  void *v10;
  char v11;
  _UIVectorTextLayout *v12;
  _UIVectorTextLayout *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  _UIVectorTextLayout *v21;
  void *v22;
  double v23;
  double v24;
  _QWORD v25[6];
  _QWORD v26[7];
  CGSize result;

  width = a3.width;
  v5 = -[UIVectorLabel numberOfLines](self, "numberOfLines", a3.width, a3.height);
  if (width <= 0.0 || v5 == 1)
    v7 = 1.79769313e308;
  else
    v7 = width;
  sizingLayout = self->_sizingLayout;
  -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (sizingLayout)
  {
    -[_UIVectorTextLayout parameters](self->_sizingLayout, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToParameters:", v9);

    if ((v11 & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }
  }
  if (v9)
  {
    v12 = -[_UIVectorTextLayout initWithTextParameters:]([_UIVectorTextLayout alloc], "initWithTextParameters:", v9);
    v13 = v12;
    if (self->_sizingLayout
      && (-[_UIVectorTextLayout firstLineBaseline](v12, "firstLineBaseline"),
          v15 = v14,
          -[_UIVectorTextLayout firstLineBaseline](self->_sizingLayout, "firstLineBaseline"),
          v15 == v16))
    {
      -[_UIVectorTextLayout lastLineBaseline](v13, "lastLineBaseline");
      v19 = v18;
      -[_UIVectorTextLayout lastLineBaseline](self->_sizingLayout, "lastLineBaseline");
      v17 = v19 == v20;
    }
    else
    {
      v17 = 0;
    }
    v21 = self->_sizingLayout;
    self->_sizingLayout = v13;

    if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0 && !v17)
    {
      -[UIView _layoutEngine](self, "_layoutEngine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = ___UIViewEnumerateLayoutConstraintsAndAdjustForConstantChangeForSelectedAttributes_block_invoke;
        v25[3] = &unk_1E16E9928;
        v25[4] = self;
        v25[5] = _UILayoutAttributeIsBaselineAttribute;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = ___UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables_block_invoke;
        v26[3] = &unk_1E16E9900;
        v26[4] = self;
        v26[5] = v25;
        v26[6] = &__block_literal_global_94_2;
        -[UIView _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:](self, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v26);
      }

    }
    goto LABEL_19;
  }
LABEL_20:
  -[_UIVectorTextLayout size](self->_sizingLayout, "size");
  result.height = v24;
  result.width = v23;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  void *v5;
  _UIVectorTextLayout *v6;
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
  CGRect result;

  -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 1, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", a4);
  v6 = -[_UIVectorTextLayout initWithTextParameters:]([_UIVectorTextLayout alloc], "initWithTextParameters:", v5);
  -[_UIVectorTextLayout boundingRect](v6, "boundingRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)_baselineOffsetFromBottom
{
  double v3;
  double v4;
  double v5;
  double v6;
  double MaxY;
  double v8;
  CGRect v10;

  -[UIVectorLabel _ensureSizingLayout](self, "_ensureSizingLayout");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIVectorTextLayout size](self->_sizingLayout, "size");
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", v3, v4, v5, v6);
  MaxY = CGRectGetMaxY(v10);
  -[_UIVectorTextLayout lastLineBaseline](self->_sizingLayout, "lastLineBaseline");
  return MaxY - v8;
}

- (double)_firstBaselineOffsetFromTop
{
  double result;

  -[UIVectorLabel _ensureSizingLayout](self, "_ensureSizingLayout");
  -[_UIVectorTextLayout firstLineBaseline](self->_sizingLayout, "firstLineBaseline");
  return result;
}

- (double)_firstLineBaseline
{
  double result;

  -[UIVectorLabel _ensureSizingLayout](self, "_ensureSizingLayout");
  -[_UIVectorTextLayout firstLineBaseline](self->_sizingLayout, "firstLineBaseline");
  return result;
}

- (double)_lastLineBaseline
{
  double result;

  -[UIVectorLabel _ensureSizingLayout](self, "_ensureSizingLayout");
  -[_UIVectorTextLayout lastLineBaseline](self->_sizingLayout, "lastLineBaseline");
  return result;
}

- (double)_preferredMaxLayoutWidth
{
  double result;

  if ((*(_BYTE *)&self->_labelFlags & 1) != 0)
    return self->_preferredMaxLayoutWidth;
  result = 0.0;
  if ((*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(_QWORD *)&self->super._viewFlags & 0x20000000000000) != 0
      && -[UIVectorLabel numberOfLines](self, "numberOfLines") != 1
      && (*(_BYTE *)&self->_labelFlags & 1) == 0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UIVectorLabel;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UIVectorLabel;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIVectorLabel;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("textLayout"));

  return v5;
}

- (void)_setNeedsUpdateLayerIfNeeded
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  -[UIView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");

    if (v5)
    {
      -[UIView _deferredAnimationForKey:](self, "_deferredAnimationForKey:", CFSTR("textLayout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAnimationFrameForValue:", MEMORY[0x1E0C9AAB0]);

    }
  }
  -[UIView _invalidateIntrinsicContentSizeNeedingLayout:](self, "_invalidateIntrinsicContentSizeNeedingLayout:", 1);
}

- (void)layoutSubviews
{
  _UIVectorTextLayout *visualLayout;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIVectorLabel;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIVectorLabel _ensureVisualLayout](self, "_ensureVisualLayout");
  visualLayout = self->_visualLayout;
  -[UIVectorLabel _labelLayer](self, "_labelLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextLayout:", visualLayout);

}

- (void)_generateDeferredAnimations:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("textLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    -[UIVectorLabel _ensureVisualLayout](self, "_ensureVisualLayout");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    v4 = v6;
  }

}

- (id)_attributedTextCompatibleForSizing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  -[UIVectorLabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[UIVectorLabel _content](self, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedString");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[UIVectorLabel _defaultAttributes](self, "_defaultAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithString:attributes:", CFSTR("x"), v5);
  }
  v8 = (void *)v6;

  return v8;
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualLayout, 0);
  objc_storeStrong((id *)&self->_sizingLayout, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
