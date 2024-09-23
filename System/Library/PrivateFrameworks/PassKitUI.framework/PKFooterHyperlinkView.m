@implementation PKFooterHyperlinkView

- (PKFooterHyperlinkView)initWithReuseIdentifier:(id)a3
{
  PKFooterHyperlinkView *v3;
  PKHyperlinkTextView *v4;
  PKHyperlinkTextView *textView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKFooterHyperlinkView;
  v3 = -[PKFooterHyperlinkView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(PKHyperlinkTextView);
    textView = v3->_textView;
    v3->_textView = v4;

    -[PKFooterHyperlinkView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
    -[PKFooterHyperlinkView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_textView);

  }
  return v3;
}

- (id)action
{
  return -[PKHyperlinkTextView action](self->_textView, "action");
}

- (void)setAction:(id)a3
{
  -[PKHyperlinkTextView setAction:](self->_textView, "setAction:", a3);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[PKHyperlinkTextView attributedText](self->_textView, "attributedText");
}

- (void)setAttributedText:(id)a3
{
  id v4;

  -[PKFooterHyperlinkView addFooterStyleAttributes:](self, "addFooterStyleAttributes:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKHyperlinkTextView setAttributedText:](self->_textView, "setAttributedText:", v4);

}

- (UIColor)linkTextColor
{
  return -[PKHyperlinkTextView linkForegroundColor](self->_textView, "linkForegroundColor");
}

- (void)setLinkTextColor:(id)a3
{
  -[PKHyperlinkTextView setLinkForegroundColor:](self->_textView, "setLinkForegroundColor:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
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
  v22.super_class = (Class)PKFooterHyperlinkView;
  -[PKFooterHyperlinkView layoutSubviews](&v22, sel_layoutSubviews);
  -[PKFooterHyperlinkView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v3, "_shouldReverseLayoutDirection");
  objc_msgSend(v3, "layoutMargins");
  v14 = v5 + v13;
  v15 = v7 + 0.0;
  v17 = v9 - (v13 + v16);
  -[PKHyperlinkTextView sizeThatFits:](self->_textView, "sizeThatFits:", v17, v11);
  v20 = v19;
  v21 = v14 + v17 - v19;
  if (!v12)
    v21 = v14;
  -[PKHyperlinkTextView setFrame:](self->_textView, "setFrame:", v21, v15, v20, v18);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
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
  CGSize result;

  -[PKFooterHyperlinkView contentView](self, "contentView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "frame");
  v10 = v9 - (v6 + v8);
  -[PKHyperlinkTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, 1.79769313e308);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)addFooterStyleAttributes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    v5 = (void *)MEMORY[0x1E0C99E08];
    v12[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend((id)objc_opt_class(), "_defaultFontForTableViewStyle:isSectionHeader:", 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v12[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend((id)objc_opt_class(), "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, objc_msgSend(v3, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v10);
    objc_msgSend(v4, "addAttributes:range:", v9, 0, objc_msgSend(v3, "length"));

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (id)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
