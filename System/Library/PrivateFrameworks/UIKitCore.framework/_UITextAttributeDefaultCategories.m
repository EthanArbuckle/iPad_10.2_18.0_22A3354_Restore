@implementation _UITextAttributeDefaultCategories

- (_UITextAttributeDefaults)_label
{
  return self->_label;
}

- (_UITextAttributeDefaults)_textView
{
  return self->_textView;
}

- (_UITextAttributeDefaults)_textField
{
  return self->_textField;
}

- (_UITextAttributeDefaultCategories)initWithUserInterfaceIdiom:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UITextAttributeDefaultCategories *v8;
  uint64_t v9;
  _UITextAttributeDefaults *generic;
  uint64_t v11;
  _UITextAttributeDefaults *label;
  uint64_t v13;
  _UITextAttributeDefaults *textField;
  uint64_t v15;
  _UITextAttributeDefaults *textView;
  void *v17;
  void *v18;
  objc_super v20;

  if (qword_1ECD7CED8 != -1)
    dispatch_once(&qword_1ECD7CED8, &__block_literal_global_91);
  v5 = (void *)_MergedGlobals_979;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UITextAttributeDefaultCategories;
    v8 = -[_UITextAttributeDefaultCategories init](&v20, sel_init);
    if (v8)
    {
      +[_UITextAttributeDefaults _getFontSizesForUserInterfaceIdiom:labelFontSize:buttonFontSize:systemFontSize:smallSystemFontSize:](_UITextAttributeDefaults, "_getFontSizesForUserInterfaceIdiom:labelFontSize:buttonFontSize:systemFontSize:smallSystemFontSize:", a3, &v8->_labelFontSize, &v8->_buttonFontSize, &v8->_systemFontSize, &v8->_smallSystemFontSize);
      -[_UITextAttributeDefaultCategories _genericDefaults:](v8, "_genericDefaults:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      generic = v8->_generic;
      v8->_generic = (_UITextAttributeDefaults *)v9;

      -[_UITextAttributeDefaultCategories _labelDefaults:](v8, "_labelDefaults:", a3);
      v11 = objc_claimAutoreleasedReturnValue();
      label = v8->_label;
      v8->_label = (_UITextAttributeDefaults *)v11;

      -[_UITextAttributeDefaultCategories _textFieldDefaults:](v8, "_textFieldDefaults:", a3);
      v13 = objc_claimAutoreleasedReturnValue();
      textField = v8->_textField;
      v8->_textField = (_UITextAttributeDefaults *)v13;

      -[_UITextAttributeDefaultCategories _textViewDefaults:](v8, "_textViewDefaults:", a3);
      v15 = objc_claimAutoreleasedReturnValue();
      textView = v8->_textView;
      v8->_textView = (_UITextAttributeDefaults *)v15;

      v17 = (void *)_MergedGlobals_979;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, v18);

    }
  }

  return v8;
}

- (id)_labelDefaults:(int64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = -[_UITextAttributeDefaults _initWithFallback:]([_UITextAttributeDefaults alloc], "_initWithFallback:", self->_generic);
  if (a3 == 8 || a3 == 2)
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", self->_labelFontSize);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "_setFont:", v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setShadowOffset:", 0.0, -1.0);
  objc_msgSend(v8, "setShadowColor:", 0);
  objc_msgSend(v8, "setShadowBlurRadius:", 0.0);
  objc_msgSend(v5, "_setShadow:", v8);

  return v5;
}

- (id)_textFieldDefaults:(int64_t)a3
{
  id v3;

  v3 = -[_UITextAttributeDefaults _initWithFallback:]([_UITextAttributeDefaults alloc], "_initWithFallback:", self->_label);
  objc_msgSend(v3, "_setShadow:", 0);
  return v3;
}

- (id)_textViewDefaults:(int64_t)a3
{
  id v3;
  void *v4;

  v3 = -[_UITextAttributeDefaults _initWithFallback:]([_UITextAttributeDefaults alloc], "_initWithFallback:", self->_generic);
  objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Helvetica"), 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setFont:", v4);

  return v3;
}

- (id)_genericDefaults:(int64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = -[_UITextAttributeDefaults _init]([_UITextAttributeDefaults alloc], "_init");
  if (a3 == 8 || a3 == 2)
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", self->_labelFontSize);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "_setFont:", v6);

  +[UIColor labelColor](UIColor, "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTextColor:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLineBreakMode:", 4);
  objc_msgSend(v9, "setLineBreakStrategy:", 0xFFFFLL);
  if (+[UIView _enableRTL](UIView, "_enableRTL"))
    v10 = 4;
  else
    v10 = 0;
  objc_msgSend(v9, "setAlignment:", v10);
  v11 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v5, "_setParagraphStyle:", v11);
  return v5;
}

- (NSString)description
{
  _UITextAttributeDefaults *label;
  _UITextAttributeDefaults *v4;
  _UITextAttributeDefaults *v5;
  _UITextAttributeDefaults *v6;
  BOOL v7;
  BOOL v8;
  _UITextAttributeDefaults *v9;
  _UITextAttributeDefaults *generic;
  _UITextAttributeDefaults *v11;
  _UITextAttributeDefaults *v12;
  _UITextAttributeDefaults *v13;
  BOOL v14;
  _UITextAttributeDefaults *textField;
  _UITextAttributeDefaults *v16;
  _UITextAttributeDefaults *v17;
  _UITextAttributeDefaults *v18;
  _UITextAttributeDefaults *v19;
  BOOL v20;
  _UITextAttributeDefaults *textView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[5];
  id v33[6];

  v33[5] = *(id *)MEMORY[0x1E0C80C00];
  label = self->_label;
  v33[0] = self->_generic;
  v32[0] = CFSTR("generic");
  v32[1] = CFSTR("label");
  v4 = label;
  v5 = (_UITextAttributeDefaults *)v33[0];
  v6 = v5;
  if (v4 == v5)
  {

LABEL_10:
    v9 = (_UITextAttributeDefaults *)CFSTR("generic");
    goto LABEL_12;
  }
  if (v5)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {

  }
  else
  {
    v8 = -[_UITextAttributeDefaults isEqual:](v4, "isEqual:", v5);

    if (v8)
      goto LABEL_10;
  }
  v9 = self->_label;
LABEL_12:
  v33[1] = v9;
  v32[2] = CFSTR("textField");
  generic = self->_generic;
  v11 = self->_textField;
  v12 = generic;
  if (v11 == v12)
  {

    goto LABEL_18;
  }
  v13 = v12;
  if (v11 && v12)
  {
    v14 = -[_UITextAttributeDefaults isEqual:](v11, "isEqual:", v12);

    if (!v14)
      goto LABEL_20;
LABEL_18:
    textField = (_UITextAttributeDefaults *)CFSTR("generic");
    goto LABEL_21;
  }

LABEL_20:
  textField = self->_textField;
LABEL_21:
  v33[2] = textField;
  v32[3] = CFSTR("textView");
  v16 = self->_generic;
  v17 = self->_textView;
  v18 = v16;
  if (v17 == v18)
  {

  }
  else
  {
    v19 = v18;
    if (!v17 || !v18)
    {

LABEL_29:
      textView = self->_textView;
      goto LABEL_30;
    }
    v20 = -[_UITextAttributeDefaults isEqual:](v17, "isEqual:", v18);

    if (!v20)
      goto LABEL_29;
  }
  textView = (_UITextAttributeDefaults *)CFSTR("generic");
LABEL_30:
  v33[3] = textView;
  v32[4] = CFSTR("fontSizeDefaults");
  v30[0] = CFSTR("label");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_labelFontSize);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v22;
  v30[1] = CFSTR("button");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_buttonFontSize);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  v30[2] = CFSTR("system");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_systemFontSize);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v24;
  v30[3] = CFSTR("smallSystem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smallSystemFontSize);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v28;
}

- (_UITextAttributeDefaults)_generic
{
  return self->_generic;
}

- (double)_labelFontSize
{
  return self->_labelFontSize;
}

- (double)_buttonFontSize
{
  return self->_buttonFontSize;
}

- (double)_systemFontSize
{
  return self->_systemFontSize;
}

- (double)_smallSystemFontSize
{
  return self->_smallSystemFontSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_generic, 0);
}

@end
