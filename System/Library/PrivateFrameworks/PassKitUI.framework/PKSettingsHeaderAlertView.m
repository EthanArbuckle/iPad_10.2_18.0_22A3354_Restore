@implementation PKSettingsHeaderAlertView

- (PKSettingsHeaderAlertView)initWithSpecifier:(id)a3
{
  id v4;
  PKSettingsHeaderAlertView *v5;
  UITextView *v6;
  UITextView *textView;
  uint64_t v8;
  NSString *headerText;
  uint64_t v10;
  NSString *descriptionText;
  void *v12;
  UITextView *v13;
  void *v14;
  UITextView *v15;
  void *v16;
  UITextView *v17;
  void *v18;

  v4 = a3;
  v5 = -[PKSettingsHeaderAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v5->_textView;
    v5->_textView = v6;

    objc_msgSend(v4, "propertyForKey:", CFSTR("settingsAlertHeaderText"));
    v8 = objc_claimAutoreleasedReturnValue();
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v8;

    objc_msgSend(v4, "propertyForKey:", CFSTR("settingsAlertDescriptionText"));
    v10 = objc_claimAutoreleasedReturnValue();
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v5->_headerText, v5->_descriptionText);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setText:](v5->_textView, "setText:", v12);
    v13 = v5->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[UITextView setShowsVerticalScrollIndicator:](v5->_textView, "setShowsVerticalScrollIndicator:", 0);
    -[UITextView setEditable:](v5->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](v5->_textView, "setSelectable:", 0);
    -[UITextView setScrollEnabled:](v5->_textView, "setScrollEnabled:", 0);
    v15 = v5->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkRedColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v15, "setTextColor:", v16);

    v17 = v5->_textView;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v17, "setFont:", v18);

    -[PKSettingsHeaderAlertView addSubview:](v5, "addSubview:", v5->_textView);
  }

  return v5;
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
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKSettingsHeaderAlertView;
  -[PKSettingsHeaderAlertView layoutSubviews](&v22, sel_layoutSubviews);
  PSTextViewInsets();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  PSTableSectionFooterTopPad();
  v10 = v9 - v4;
  PreferencesTableViewCellLeftPad();
  v12 = v11 - v6;
  PSTableSectionFooterBottomPad();
  PreferencesTableViewCellRightPad();
  v14 = v13 - v8;
  -[PKSettingsHeaderAlertView bounds](self, "bounds");
  v16 = v12 + v15;
  v18 = v10 + v17;
  v20 = v19 - (v12 + v14);
  -[UITextView frame](self->_textView, "frame");
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v20, 1.79769313e308);
  -[UITextView setFrame:](self->_textView, "setFrame:", v16, v18, v20, v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  float v5;
  float v6;
  float v7;
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
  CGSize result;

  width = a3.width;
  PreferencesTableViewCellLeftPad();
  v6 = v5;
  PreferencesTableViewCellRightPad();
  v8 = (float)(v6 + v7);
  PSTableSectionFooterTopPad();
  v10 = v9;
  PSTableSectionFooterBottomPad();
  v12 = v10 + v11;
  v13 = width - v8;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v12 + v14;
  PSTableSectionFooterTopPad();
  v17 = v16 + v15;
  v18 = v13 + v8;
  result.height = v17;
  result.width = v18;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[PKSettingsHeaderAlertView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_headerText, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
