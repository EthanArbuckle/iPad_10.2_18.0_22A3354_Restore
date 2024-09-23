@implementation WFTableViewFooterLinkView

- (WFTableViewFooterLinkView)initWithReuseIdentifier:(id)a3
{
  WFTableViewFooterLinkView *v3;
  UITextView *v4;
  void *v5;
  void *v6;
  UITextView *textView;
  UITextView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFTableViewFooterLinkView *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WFTableViewFooterLinkView;
  v3 = -[WFTableViewFooterLinkView initWithReuseIdentifier:](&v28, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x24BEBDA88]);
    -[UITextView setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UITextView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[UITextView setEditable:](v4, "setEditable:", 0);
    -[UITextView setSelectable:](v4, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[UITextView textContainer](v4, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

    -[UITextView setDelegate:](v4, "setDelegate:", v3);
    textView = v3->_textView;
    v3->_textView = v4;
    v8 = v4;

    -[WFTableViewFooterLinkView updateLinkColor](v3, "updateLinkColor");
    -[WFTableViewFooterLinkView contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);
    v20 = (void *)MEMORY[0x24BDD1628];
    -[UITextView topAnchor](v8, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    -[UITextView leadingAnchor](v8, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    -[UITextView trailingAnchor](v8, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v11, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v12;
    -[UITextView bottomAnchor](v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

    v17 = v3;
  }

  return v3;
}

- (void)setText:(id)a3 URL:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[WFTableViewFooterLinkView setText:URL:linkRange:](self, "setText:URL:linkRange:", v7, v6, 0, objc_msgSend(v7, "length"));

}

- (void)setText:(id)a3 URL:(id)a4 linkRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSString *v11;
  NSString *text;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  v11 = (NSString *)objc_msgSend(v9, "copy");
  text = self->_text;
  self->_text = v11;

  objc_storeStrong((id *)&self->_URL, a4);
  self->_linkRange.location = location;
  self->_linkRange.length = length;
  v13 = v10;
  v14 = (objc_class *)MEMORY[0x24BDD1688];
  v22 = v9;
  v15 = (void *)objc_msgSend([v14 alloc], "initWithString:", v22);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.42745098, 0.42745098, 0.447058824, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v22, "length");

  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v16, 0, v18);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v17, 0, v18);
  v19 = *MEMORY[0x24BEBB388];
  if (v13)
  {
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB388], v13, location, length);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E605650);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, location, length);

  }
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB440], MEMORY[0x24BDBD1C0], location, length);

  -[WFTableViewFooterLinkView textView](self, "textView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedText:", v15);

}

- (void)updateLinkColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BEBB368];
  -[WFTableViewFooterLinkView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewFooterLinkView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLinkTextAttributes:", v4);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTableViewFooterLinkView;
  -[WFTableViewFooterLinkView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[WFTableViewFooterLinkView updateLinkColor](self, "updateLinkColor");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  char v9;

  v7 = a4;
  -[WFTableViewFooterLinkView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0)
    objc_msgSend(v8, "footerLinkView:didTapURL:", self, v7);

  return (v9 & 1) == 0;
}

- (WFTableViewFooterLinkViewDelegate)delegate
{
  return (WFTableViewFooterLinkViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)URL
{
  return self->_URL;
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

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
