@implementation WFHyperlinkFooterView

- (WFHyperlinkFooterView)init
{
  WFHyperlinkFooterView *v2;
  UITextView *v3;
  UITextView *textView;
  void *v5;

  v2 = -[WFHyperlinkFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v2)
  {
    v3 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
    textView = v2->_textView;
    v2->_textView = v3;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v2->_textView, "setBackgroundColor:", v5);

    -[UITextView setShowsVerticalScrollIndicator:](v2->_textView, "setShowsVerticalScrollIndicator:", 0);
    -[UITextView setEditable:](v2->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](v2->_textView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v2->_textView, "setScrollEnabled:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v2->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    -[WFHyperlinkFooterView addSubview:](v2, "addSubview:", v2->_textView);
  }
  return v2;
}

- (void)_linkify
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _NSRange *p_linkRange;
  uint64_t v10;
  NSURL *URL;
  void *v12;
  id v13;

  v3 = -[NSString length](self->_text, "length");
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", self->_text);
  v4 = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v4, v5, 0, v3);

  v6 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v6, v7, 0, v3);

  objc_msgSend(MEMORY[0x24BDF6950], "defaultHyperLinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_linkRange = &self->_linkRange;
  objc_msgSend(v13, "addAttribute:value:range:", v6, v8, self->_linkRange.location, self->_linkRange.length);

  v10 = *MEMORY[0x24BEBB388];
  URL = self->_URL;
  v12 = URL;
  if (!URL)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24DC36C30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "addAttribute:value:range:", v10, v12, p_linkRange->location, self->_linkRange.length);
  if (!URL)

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x24BEBB440], MEMORY[0x24BDBD1C0], p_linkRange->location, self->_linkRange.length);
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v13);
  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);

}

- (UIEdgeInsets)textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 12.0;
  v4 = 0.0;
  v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFHyperlinkFooterView;
  -[WFHyperlinkFooterView layoutSubviews](&v16, sel_layoutSubviews);
  -[WFHyperlinkFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[WFHyperlinkFooterView textInsets](self, "textInsets");
  v10 = v4 + v9;
  v12 = v6 + v11;
  v14 = v8 - (v9 + v13);
  -[UITextView frame](self->_textView, "frame");
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, 1.79769313e308);
  -[UITextView setFrame:](self->_textView, "setFrame:", v10, v12, v14, v15);
}

- (void)setText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_text != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_text, a3);
    -[UITextView setText:](self->_textView, "setText:", v6);
    if (self->_linkRange.length)
      -[WFHyperlinkFooterView _linkify](self, "_linkify");
    -[WFHyperlinkFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (NSString)text
{
  return self->_text;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
  if (self->_text)
    -[WFHyperlinkFooterView _linkify](self, "_linkify");
}

- (_NSRange)linkRange
{
  _NSRange *p_linkRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_linkRange = &self->_linkRange;
  location = self->_linkRange.location;
  length = p_linkRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_URL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_URL, a3);
    -[WFHyperlinkFooterView setNeedsLayout](self, "setNeedsLayout");
    -[WFHyperlinkFooterView _linkify](self, "_linkify");
    v5 = v6;
  }

}

- (NSURL)URL
{
  return self->_URL;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  uint64_t v6;
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
  CGSize result;

  width = a3.width;
  -[WFHyperlinkFooterView text](self, "text", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[WFHyperlinkFooterView textInsets](self, "textInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = width - (v9 + v13);
    -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v15, 1.79769313e308);
    v16 = v14 + v10 + v15;
    v18 = v12 + v8 + v17;
  }
  else
  {
    v16 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v18;
  result.width = v16;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[WFHyperlinkFooterView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;
  const char *v8;
  WFHyperlinkFooterView *v9;
  id v10;
  void (*v11)(id, const char *, WFHyperlinkFooterView *);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[WFHyperlinkFooterView target](self, "target", a3, a4, a5.location, a5.length, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[WFHyperlinkFooterView action](self, "action");
    v9 = self;
    v10 = v7;
    v11 = (void (*)(id, const char *, WFHyperlinkFooterView *))objc_msgSend(v10, "methodForSelector:", v8);
    objc_msgSend(v10, "methodSignatureForSelector:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "methodReturnLength");

    if (v9)
      v11(v10, v8, v9);
    else
      ((void (*)(id, const char *))v11)(v10, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

  }
  return v7 == 0;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
