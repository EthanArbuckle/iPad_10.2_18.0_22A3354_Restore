@implementation PKSoftwareUpdateTableView

- (PKSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PKSoftwareUpdateTableView *v4;
  uint64_t v5;
  UIColor *textColor;
  UIColor *linkColor;
  UIScrollView *v8;
  UIScrollView *scrollView;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  NSString *v16;
  UILabel *v17;
  void *v18;
  UITextView *v19;
  UITextView *messageView;
  UITextView *v21;
  void *v22;
  UITextView *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKSoftwareUpdateTableView;
  v4 = -[PKSoftwareUpdateTableView initWithFrame:style:](&v26, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v5 = objc_claimAutoreleasedReturnValue();
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v5;

    linkColor = v4->_linkColor;
    v4->_linkColor = 0;

    v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v4->_scrollView;
    v4->_scrollView = v8;

    -[PKSoftwareUpdateTableView addSubview:](v4, "addSubview:", v4->_scrollView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    v12 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    v14 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v4->_textColor);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("FAIL_FORWARD_UPDATE_TITLE"), 0);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = v4->_titleLabel;
    PKLocalizedPaymentString(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v17, "setText:", v18);

    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_titleLabel);
    v19 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    messageView = v4->_messageView;
    v4->_messageView = v19;

    v21 = v4->_messageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UITextView setEditable:](v4->_messageView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v4->_messageView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setAdjustsFontForContentSizeCategory:](v4->_messageView, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setDataDetectorTypes:](v4->_messageView, "setDataDetectorTypes:", 2);
    -[UITextView setScrollingEnabled:](v4->_messageView, "setScrollingEnabled:", 0);
    v23 = v4->_messageView;
    -[PKSoftwareUpdateTableView _messageAttributedStringWithTextColor:](v4, "_messageAttributedStringWithTextColor:", v4->_textColor);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v23, "setAttributedText:", v24);

    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_messageView);
    -[PKSoftwareUpdateTableView setContext:](v4, "setContext:", 0);

  }
  return v4;
}

- (void)setContext:(int64_t)a3
{
  int IsBridge;
  UILabel *titleLabel;
  void *v6;
  NSString *v7;

  self->_context = a3;
  IsBridge = PKPaymentSetupContextIsBridge();
  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("FAIL_FORWARD_UPDATE_TITLE"), IsBridge);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  PKLocalizedPaymentString(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v6);

  -[PKSoftwareUpdateTableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
  UITextView *messageView;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_textColor != v7)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);
    messageView = self->_messageView;
    -[PKSoftwareUpdateTableView _messageAttributedStringWithTextColor:](self, "_messageAttributedStringWithTextColor:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](messageView, "setAttributedText:", v6);

  }
}

- (void)setLinkColor:(id)a3
{
  UIColor *v5;
  UITextView *messageView;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  if (self->_linkColor != v5)
  {
    objc_storeStrong((id *)&self->_linkColor, a3);
    messageView = self->_messageView;
    if (v5)
    {
      v8 = *MEMORY[0x1E0DC1140];
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setLinkTextAttributes:](messageView, "setLinkTextAttributes:", v7);

    }
    else
    {
      -[UITextView setLinkTextAttributes:](messageView, "setLinkTextAttributes:", 0);
    }
  }

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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *titleLabel;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UILabel *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UITextView *messageView;
  double v35;
  double v36;
  double v37;
  UIScrollView *scrollView;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v39.receiver = self;
  v39.super_class = (Class)PKSoftwareUpdateTableView;
  -[PKSoftwareUpdateTableView layoutSubviews](&v39, sel_layoutSubviews);
  -[PKSoftwareUpdateTableView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel font](self->_titleLabel, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSoftwareUpdateTableView directionalLayoutMargins](self, "directionalLayoutMargins");
  v14 = v13;
  -[PKSoftwareUpdateTableView directionalLayoutMargins](self, "directionalLayoutMargins");
  v16 = v14 + v15;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  titleLabel = self->_titleLabel;
  -[PKSoftwareUpdateTableView bounds](self, "bounds");
  PKFloatRoundToPixel();
  -[UILabel pkui_sizeThatFits:forceWordWrap:](titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v12, "_bodyLeading");
  v23 = v9 - v16;
  if (v21 > v22 + v22)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v9 - v16, 1.79769313e308);
    v19 = v24;
    v21 = v25;
  }
  v26 = self->_titleLabel;
  PKFloatRoundToPixel();
  v28 = v27;
  objc_msgSend(v12, "ascender");
  PKFloatRoundToPixel();
  -[UILabel setFrame:](v26, "setFrame:", v28, v29, v19, v21);
  -[UITextView sizeThatFits:](self->_messageView, "sizeThatFits:", v23, 1.79769313e308);
  v31 = v30;
  v33 = v32;
  messageView = self->_messageView;
  PKFloatRoundToPixel();
  v36 = v35;
  -[UILabel frame](self->_titleLabel, "frame");
  CGRectGetMaxY(v40);
  objc_msgSend(v12, "descender");
  objc_msgSend(v12, "_bodyLeading");
  objc_msgSend(v12, "ascender");
  PKFloatRoundToPixel();
  -[UITextView setFrame:](messageView, "setFrame:", v36, v37, v31, v33);
  scrollView = self->_scrollView;
  -[UITextView frame](self->_messageView, "frame");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v9, CGRectGetMaxY(v41));

}

- (id)_messageAttributedStringWithTextColor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  v14[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC1140];
  v15[0] = v7;
  v15[1] = v4;
  v9 = *MEMORY[0x1E0DC1178];
  v14[1] = v8;
  v14[2] = v9;
  v15[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("FAIL_FORWARD_UPDATE_SETTINGS_MESSAGE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByParsingLinksInString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)context
{
  return self->_context;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkColor
{
  return self->_linkColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
