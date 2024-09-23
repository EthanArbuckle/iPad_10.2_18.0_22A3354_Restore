@implementation PKTextViewTableViewCell

- (PKTextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTextViewTableViewCell *v4;
  uint64_t v5;
  UITextView *textView;
  UITextView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKTextViewTableViewCell;
  v4 = -[PKTextViewTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = objc_claimAutoreleasedReturnValue();
    textView = v4->_textView;
    v4->_textView = (UITextView *)v5;

    v7 = v4->_textView;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v7, "setFont:", v8);

    -[PKTextViewTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_textView);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UITextView *textView;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)PKTextViewTableViewCell;
  -[PKTextViewTableViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PKTextViewTableViewCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[PKTextViewTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  textView = self->_textView;
  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  v15 = CGRectGetWidth(v17) + v4 * -2.0;
  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  -[UITextView setFrame:](textView, "setFrame:", v4, 0.0, v15, CGRectGetHeight(v18));
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTextViewTableViewCell;
  -[PKTextViewTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
  -[UITextView setDelegate:](self->_textView, "setDelegate:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[UITextView font](self->_textView, "font", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5 * 12.0;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
