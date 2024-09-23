@implementation _UIActivityIndicatorMessageLabel

+ (id)defaultRegularContentSizeTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 11.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)off_1E1678D90);

  +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)off_1E1678D98);

  return v2;
}

- (_UIActivityIndicatorMessageLabel)initWithRegularTextAttributes:(id)a3
{
  id v5;
  _UIActivityIndicatorMessageLabel *v6;
  _UIActivityIndicatorMessageLabel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityIndicatorMessageLabel;
  v6 = -[UILabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_regularTextAttributes, a3);
    objc_storeStrong((id *)&v7->_effectiveTextAttributes, a3);
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", 0);
    -[UIView setOpaque:](v7, "setOpaque:", 0);
    -[_UIActivityIndicatorMessageLabel _ensureCapableOfCalculatingBaselineOffsets](v7, "_ensureCapableOfCalculatingBaselineOffsets");
  }

  return v7;
}

- (double)verticalSpacingToSpinner
{
  double v3;
  double v4;
  double v5;

  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self, "_firstLineBaselineOffsetFromBoundsTop");
  v4 = v3;
  -[_UIActivityIndicatorMessageLabel _effectiveVerticalSpacingToSpinner](self, "_effectiveVerticalSpacingToSpinner");
  return v5 - v4;
}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  -[_UIActivityIndicatorMessageLabel setAttributedText:](self, "setAttributedText:", v6);
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[_UIActivityIndicatorMessageLabel _validatedAttributedString:](self, "_validatedAttributedString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityIndicatorMessageLabel effectiveTextAttributes](self, "effectiveTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "addAttributes:range:", v5, 0, objc_msgSend(v6, "length"));
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityIndicatorMessageLabel;
  -[UILabel setAttributedText:](&v7, sel_setAttributedText_, v6);
  -[_UIActivityIndicatorMessageLabel _ensureCapableOfCalculatingBaselineOffsets](self, "_ensureCapableOfCalculatingBaselineOffsets");

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActivityIndicatorMessageLabel;
  -[UILabel traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[_UIActivityIndicatorMessageLabel _effectiveAttributesDerivedFromRegularTextAttributes:](self, "_effectiveAttributesDerivedFromRegularTextAttributes:", self->_regularTextAttributes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityIndicatorMessageLabel setEffectiveTextAttributes:](self, "setEffectiveTextAttributes:", v4);

}

- (void)setEffectiveTextAttributes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[NSDictionary isEqual:](self->_effectiveTextAttributes, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveTextAttributes, a3);
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[UILabel text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v8);

    -[_UIActivityIndicatorMessageLabel setAttributedText:](self, "setAttributedText:", v7);
  }

}

- (id)_effectiveAttributesDerivedFromRegularTextAttributes:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;

  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = v4;
  if (IsAccessibilityCategory)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    v9 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(off_1E167A828, "systemFontOfSize:", 11.0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "pointSize");
    objc_msgSend(v13, "fontWithSize:", v14 + v14 + 2.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v9);

  }
  return v8;
}

- (double)_effectiveVerticalSpacingToSpinner
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  double result;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  result = 36.0;
  if (!IsAccessibilityCategory)
    return 18.0;
  return result;
}

- (id)_validatedAttributedString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    if (v3)
      v4 = objc_msgSend(v3, "mutableCopy");
    else
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E16EDF20);
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v5, "appendAttributedString:", v6);

    v3 = v5;
  }
  return v3;
}

- (void)_ensureCapableOfCalculatingBaselineOffsets
{
  void *v3;
  uint64_t v4;

  -[UILabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    -[_UIActivityIndicatorMessageLabel setText:](self, "setText:", CFSTR(" "));
  -[UIView sizeToFit](self, "sizeToFit");
  -[UILabel _invalidateLabelDisplay](self);
  -[UILabel _invalidateLabelMetrics]((uint64_t)self);
}

- (NSDictionary)regularTextAttributes
{
  return self->_regularTextAttributes;
}

- (void)setRegularTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (NSDictionary)effectiveTextAttributes
{
  return self->_effectiveTextAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTextAttributes, 0);
  objc_storeStrong((id *)&self->_regularTextAttributes, 0);
}

@end
