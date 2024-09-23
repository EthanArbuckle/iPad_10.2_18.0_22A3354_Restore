@implementation _UINavigationBarModernPromptView

- (_UINavigationBarModernPromptView)initWithFrame:(CGRect)a3
{
  _UINavigationBarModernPromptView *v3;
  _UINavigationBarModernPromptView *v4;
  NSString *prompt;
  uint64_t v6;
  UIColor *textColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarModernPromptView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    prompt = v3->_prompt;
    v3->_prompt = (NSString *)&stru_1E16EDF20;

    +[UIColor labelColor](UIColor, "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v6;

    -[UIView _setHostsLayoutEngine:](v4, "_setHostsLayoutEngine:", 1);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
}

- (void)_updatePromptLabel
{
  UILabel *v3;
  UILabel *promptLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *prompt;
  void *v20;
  id v21;

  if (!self->_promptLabel && -[NSString length](self->_prompt, "length"))
  {
    v3 = objc_alloc_init(UILabel);
    promptLabel = self->_promptLabel;
    self->_promptLabel = v3;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_promptLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UIView addSubview:](self, "addSubview:", self->_promptLabel);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_promptLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView lastBaselineAnchor](self->_promptLabel, "lastBaselineAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 22.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[UIView centerXAnchor](self->_promptLabel, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UIView leadingAnchor](self->_promptLabel, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[UIView trailingAnchor](self->_promptLabel, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

  }
  -[UILabel setTextColor:](self->_promptLabel, "setTextColor:", self->_textColor);
  if (self->_prompt)
    prompt = (const __CFString *)self->_prompt;
  else
    prompt = &stru_1E16EDF20;
  -[UILabel setText:](self->_promptLabel, "setText:", prompt);
  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryL"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleFootnote"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_promptLabel, "setFont:", v20);

}

- (void)setPrompt:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *obj;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E16EDF20;
  obj = (__CFString *)v5;
  if (!-[NSString isEqualToString:](self->_prompt, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_prompt, obj);
    -[_UINavigationBarModernPromptView _updatePromptLabel](self, "_updatePromptLabel");
  }

}

- (void)setTextColor:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  if (!v4)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if (!-[UIColor isEqual:](self->_textColor, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_textColor, obj);
    -[_UINavigationBarModernPromptView _updatePromptLabel](self, "_updatePromptLabel");
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 34.0;
  v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 34.0;
  result.height = v3;
  return result;
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  if (a3)
    *((int64x2_t *)a3 + 2) = vdupq_n_s64(0x4041000000000000uLL);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (UIColor)textColor
{
  return self->_textColor;
}

@end
