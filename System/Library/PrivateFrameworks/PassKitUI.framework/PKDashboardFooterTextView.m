@implementation PKDashboardFooterTextView

+ (double)defaultHorizontalInset
{
  return 16.0;
}

- (PKDashboardFooterTextView)initWithFrame:(CGRect)a3
{
  PKDashboardFooterTextView *v3;
  PKDashboardFooterTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardFooterTextView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_horizontalAlignment = 0;
    v3->_bottomInsetType = 1;
    -[PKDashboardFooterTextView createSubviews](v3, "createSubviews");
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v4, "setWantsCustomAppearance:", 1);
  }
  return v4;
}

- (void)createSubviews
{
  UITextView *v3;
  UITextView *textView;
  UITextView *v5;
  void *v6;
  UITextView *v7;
  uint64_t horizontalAlignment;
  int v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
  -[UITextView setUserInteractionEnabled:](self->_textView, "setUserInteractionEnabled:", 1);
  -[UITextView _setInteractiveTextSelectionDisabled:](self->_textView, "_setInteractiveTextSelectionDisabled:", 1);
  v5 = self->_textView;
  objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v5, "setTextColor:", v6);

  v7 = self->_textView;
  horizontalAlignment = self->_horizontalAlignment;
  v9 = -[PKDashboardFooterTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  switch((int)horizontalAlignment)
  {
    case 1:
      break;
    case 2:
      if (v9)
        horizontalAlignment = 0;
      else
        horizontalAlignment = 2;
      break;
    case 3:
      horizontalAlignment = 3;
      break;
    default:
      if (v9)
        horizontalAlignment = 2;
      else
        horizontalAlignment = 0;
      break;
  }
  -[UITextView setTextAlignment:](v7, "setTextAlignment:", horizontalAlignment);
  v10 = *MEMORY[0x1E0D67C18];
  -[PKDashboardFooterTextView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
  -[PKDashboardFooterTextView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_textView);

  -[PKDashboardFooterTextView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);
  -[PKDashboardFooterTextView resetFonts](self, "resetFonts");
}

- (void)resetFonts
{
  UITextView *textView;
  id v3;

  textView = self->_textView;
  if (self->_font)
  {
    -[UITextView setFont:](self->_textView, "setFont:");
  }
  else
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](textView, "setFont:", v3);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardFooterTextView;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardFooterTextView bounds](self, "bounds");
  -[PKDashboardFooterTextView _layoutWithBounds:templateLayout:](self, "_layoutWithBounds:templateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardFooterTextView _layoutWithBounds:templateLayout:](self, "_layoutWithBounds:templateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 templateLayout:(BOOL)a4
{
  double width;
  void *v7;
  void *v8;
  unint64_t bottomInsetType;
  double v10;
  double v11;
  double v12;
  double v13;
  UITextView *textView;
  double v15;
  double v16;
  CGSize result;

  width = a3.size.width;
  if (self->_removeContainerInsets)
    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  if (self->_maximumLines)
  {
    -[UITextView textContainer](self->_textView, "textContainer", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumNumberOfLines:", self->_maximumLines);

    -[UITextView textContainer](self->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

  }
  bottomInsetType = self->_bottomInsetType;
  if (bottomInsetType == 2)
  {
    -[UITextView textContainerInset](self->_textView, "textContainerInset", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
    v10 = 26.0;
  }
  else if (bottomInsetType == 1)
  {
    v10 = 10.0;
  }
  else
  {
    v10 = 0.0;
  }
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", width + v11 * -2.0, 3.40282347e38);
  v13 = v12;
  if (!a4)
  {
    textView = self->_textView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UITextView setFrame:](textView, "setFrame:");
  }
  v15 = v10 + v13 + 0.0;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)setFooterText:(id)a3
{
  NSString *v4;
  NSString *footerText;
  UIColor *linkTextColor;
  id action;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footerText = self->_footerText;
  self->_footerText = v4;

  -[UITextView setText:](self->_textView, "setText:", self->_footerText);
  linkTextColor = self->_linkTextColor;
  self->_linkTextColor = 0;

  self->_linkRange.location = 0;
  self->_linkRange.length = 0;
  action = self->_action;
  self->_action = 0;

  -[PKDashboardFooterTextView resetFonts](self, "resetFonts");
  -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[PKDashboardFooterTextView _updateText](self, "_updateText");
  }

}

- (void)setRemoveContainerInsets:(BOOL)a3
{
  if (self->_removeContainerInsets != a3)
  {
    self->_removeContainerInsets = a3;
    -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumLines:(int64_t)a3
{
  if (self->_maximumLines != a3)
  {
    self->_maximumLines = a3;
    -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLinkRange:(_NSRange)a3
{
  if (self->_linkRange.location != a3.location || self->_linkRange.length != a3.length)
  {
    self->_linkRange = a3;
    -[PKDashboardFooterTextView _updateText](self, "_updateText");
  }
}

- (void)setLinkTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    -[PKDashboardFooterTextView _updateText](self, "_updateText");
  }

}

- (void)setBottomInsetType:(unint64_t)a3
{
  if (self->_bottomInsetType != a3)
  {
    self->_bottomInsetType = a3;
    -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHorizontalAlignment:(unsigned int)a3
{
  UITextView *textView;

  if (self->_horizontalAlignment != a3)
  {
    self->_horizontalAlignment = a3;
    textView = self->_textView;
    -[PKDashboardFooterTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UITextView setTextAlignment:](textView, "setTextAlignment:");
    -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateText
{
  UIFont *font;
  UIFont *v4;
  UIFont *v5;
  void *v6;
  UIColor *linkTextColor;
  UIColor *v8;
  UIColor *v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  UITextView *textView;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  font = self->_font;
  if (font)
  {
    v4 = font;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 0);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    v8 = linkTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = -[NSString length](self->_footerText, "length");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", self->_footerText);
  v12 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v6, 0, v10);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v5, 0, v10);
  if (-[PKDashboardFooterTextView _isLinkRangeValid](self, "_isLinkRangeValid"))
  {
    v13 = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3E7D690);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAttribute:value:range:", v13, v14, self->_linkRange.location, self->_linkRange.length);

    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1248], MEMORY[0x1E0C9AAA0], self->_linkRange.location, self->_linkRange.length);
  }
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v11);
  textView = self->_textView;
  v17 = v12;
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](textView, "setLinkTextAttributes:", v16);

  -[PKDashboardFooterTextView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isLinkRangeValid
{
  NSUInteger location;
  NSUInteger length;

  location = self->_linkRange.location;
  return location != 0x7FFFFFFFFFFFFFFFLL
      && (length = self->_linkRange.length) != 0
      && length + location <= -[NSString length](self->_footerText, "length");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void (**action)(id, SEL, id, id, NSUInteger, NSUInteger, int64_t);

  action = (void (**)(id, SEL, id, id, NSUInteger, NSUInteger, int64_t))self->_action;
  if (action)
    action[2](action, a2, a3, a4, a5.location, a5.length, a6);
  return 0;
}

- (unint64_t)bottomInsetType
{
  return self->_bottomInsetType;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (unsigned)horizontalAlignment
{
  return self->_horizontalAlignment;
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

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)removeContainerInsets
{
  return self->_removeContainerInsets;
}

- (int64_t)maximumLines
{
  return self->_maximumLines;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
