@implementation PKHyperlinkTextView

- (void)setLinkForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkForegroundColor, a3);
  -[PKHyperlinkTextView updateLinkTextAttributes](self, "updateLinkTextAttributes");
}

- (void)setIsLinkUnderlined:(BOOL)a3
{
  self->_isLinkUnderlined = a3;
  -[PKHyperlinkTextView updateLinkTextAttributes](self, "updateLinkTextAttributes");
}

- (void)updateLinkTextAttributes
{
  UIColor *linkForegroundColor;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0DC1140];
  linkForegroundColor = self->_linkForegroundColor;
  v4 = linkForegroundColor;
  if (!linkForegroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v4;
  v7[1] = *MEMORY[0x1E0DC1248];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLinkUnderlined);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHyperlinkTextView setLinkTextAttributes:](self, "setLinkTextAttributes:", v6);

  if (!linkForegroundColor)
}

- (PKHyperlinkTextView)initWithFrame:(CGRect)a3
{
  PKHyperlinkTextView *v3;
  uint64_t v4;
  UIColor *linkForegroundColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKHyperlinkTextView;
  v3 = -[PKHyperlinkTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_styleTextView:", v3);
    -[PKHyperlinkTextView setEditable:](v3, "setEditable:", 0);
    -[PKHyperlinkTextView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    -[PKHyperlinkTextView _setInteractiveTextSelectionDisabled:](v3, "_setInteractiveTextSelectionDisabled:", 1);
    -[PKHyperlinkTextView setDataDetectorTypes:](v3, "setDataDetectorTypes:", 2);
    -[PKHyperlinkTextView setDelegate:](v3, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v4 = objc_claimAutoreleasedReturnValue();
    linkForegroundColor = v3->_linkForegroundColor;
    v3->_linkForegroundColor = (UIColor *)v4;

    v3->_isLinkUnderlined = 0;
    -[PKHyperlinkTextView updateLinkTextAttributes](v3, "updateLinkTextAttributes");
    -[PKHyperlinkTextView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CF8]);
  }
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);

  v7 = a4;
  -[PKHyperlinkTextView action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKHyperlinkTextView action](self, "action");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v7);

  }
  return 0;
}

- (UIColor)linkForegroundColor
{
  return self->_linkForegroundColor;
}

- (BOOL)isLinkUnderlined
{
  return self->_isLinkUnderlined;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2800);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_linkForegroundColor, 0);
}

@end
