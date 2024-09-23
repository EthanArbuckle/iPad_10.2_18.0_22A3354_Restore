@implementation PKLabelViewController

- (PKLabelViewController)init
{

  return 0;
}

- (PKLabelViewController)initWithAttributedText:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKLabelViewController;
  v5 = -[PKLabelViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 122);
    *((_QWORD *)v5 + 122) = v6;

    v8 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v5 + 984) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v5 + 1000) = v8;
  }

  return (PKLabelViewController *)v5;
}

- (void)loadView
{
  UITextView *v3;
  UITextView *textView;
  UITextView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKLabelViewController;
  -[PKLabelViewController loadView](&v8, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", self->_attributedText);
  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 1);
  v5 = self->_textView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[PKLabelViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_textView);

}

- (void)viewWillLayoutSubviews
{
  UITextView *textView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKLabelViewController;
  -[PKLabelViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  textView = self->_textView;
  -[PKLabelViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITextView setFrame:](textView, "setFrame:", v5 + self->_contentInsets.left, v6 + self->_contentInsets.top, v7 - (self->_contentInsets.left + self->_contentInsets.right), v8 - (self->_contentInsets.top + self->_contentInsets.bottom));

}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToAttributedString:", self->_attributedText) & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v7, "copy");
    attributedText = self->_attributedText;
    self->_attributedText = v4;

    -[PKLabelViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  id v6;

  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[PKLabelViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
