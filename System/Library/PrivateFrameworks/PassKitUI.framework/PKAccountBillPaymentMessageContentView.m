@implementation PKAccountBillPaymentMessageContentView

- (PKAccountBillPaymentMessageContentView)initWithFrame:(CGRect)a3
{
  PKAccountBillPaymentMessageContentView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountBillPaymentMessageContentView;
  v3 = -[PKAccountBillPaymentMessageContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentMessageContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKAccountBillPaymentMessageContentView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[PKAccountBillPaymentMessageContentView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 14.0);
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  }
  return v3;
}

- (void)setSystemImage:(id)a3
{
  id *p_systemImage;
  void *imageView;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  p_systemImage = (id *)&self->_systemImage;
  v10 = a3;
  if ((objc_msgSend(*p_systemImage, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_systemImage, a3);
    if (*p_systemImage)
    {
      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
      imageView = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", imageView, -1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v10, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentMessageContentView imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v8);

    }
    else
    {
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
      imageView = self->_imageView;
      self->_imageView = 0;
    }

    -[PKAccountBillPaymentMessageContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMessage:(id)a3
{
  NSString **p_message;
  NSAttributedString *attributedMessage;
  void *messageTextView;
  id v8;

  p_message = &self->_message;
  v8 = a3;
  if (!-[NSString isEqualToString:](*p_message, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_message, a3);
    attributedMessage = self->_attributedMessage;
    self->_attributedMessage = 0;

    if (-[NSString length](*p_message, "length"))
    {
      -[PKAccountBillPaymentMessageContentView messageTextView](self, "messageTextView");
      messageTextView = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(messageTextView, "setText:", v8);
    }
    else
    {
      -[UITextView removeFromSuperview](self->_messageTextView, "removeFromSuperview");
      messageTextView = self->_messageTextView;
      self->_messageTextView = 0;
    }

    -[PKAccountBillPaymentMessageContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAttributedMessage:(id)a3
{
  NSAttributedString **p_attributedMessage;
  NSString *message;
  UITextView *messageTextView;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  p_attributedMessage = &self->_attributedMessage;
  v14 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_attributedMessage, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedMessage, a3);
    message = self->_message;
    self->_message = 0;

    if (-[NSAttributedString length](*p_attributedMessage, "length"))
    {
      messageTextView = (UITextView *)objc_msgSend(v14, "mutableCopy");
      v8 = objc_msgSend(v14, "length");
      v9 = *MEMORY[0x1E0DC1138];
      -[PKAccountBillPaymentMessageContentView _messageFont](self, "_messageFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView addAttribute:value:range:](messageTextView, "addAttribute:value:range:", v9, v10, 0, v8);

      v11 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView addAttribute:value:range:](messageTextView, "addAttribute:value:range:", v11, v12, 0, v8);

      -[PKAccountBillPaymentMessageContentView messageTextView](self, "messageTextView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAttributedText:", messageTextView);

    }
    else
    {
      -[UITextView removeFromSuperview](self->_messageTextView, "removeFromSuperview");
      messageTextView = self->_messageTextView;
      self->_messageTextView = 0;
    }

    -[PKAccountBillPaymentMessageContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)messageTextView
{
  UITextView *messageTextView;
  UITextView *v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  UITextView *v8;
  void *v9;

  messageTextView = self->_messageTextView;
  if (!messageTextView)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_messageTextView;
    self->_messageTextView = v4;

    -[UITextView setDelegate:](self->_messageTextView, "setDelegate:", self);
    -[UITextView setTextContainerInset:](self->_messageTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setEditable:](self->_messageTextView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_messageTextView, "setSelectable:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_messageTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setUserInteractionEnabled:](self->_messageTextView, "setUserInteractionEnabled:", 1);
    v6 = self->_messageTextView;
    -[PKAccountBillPaymentMessageContentView _messageFont](self, "_messageFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v6, "setFont:", v7);

    v8 = self->_messageTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v8, "setTextColor:", v9);

    -[PKAccountBillPaymentMessageContentView addSubview:](self, "addSubview:", self->_messageTextView);
    messageTextView = self->_messageTextView;
  }
  return messageTextView;
}

- (id)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    -[PKAccountBillPaymentMessageContentView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentMessageContentView;
  -[PKAccountBillPaymentMessageContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAccountBillPaymentMessageContentView bounds](self, "bounds");
  -[PKAccountBillPaymentMessageContentView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKAccountBillPaymentMessageContentView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  CGRectEdge v10;
  UIImageView *imageView;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  UITextView *messageTextView;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect remainder;
  CGSize result;
  CGRect v25;

  width = a3.size.width;
  memset(&v22, 0, sizeof(v22));
  v7 = a3.origin.x + 16.0;
  v8 = a3.origin.y + 10.0;
  remainder.origin.x = a3.origin.x + 16.0;
  remainder.origin.y = a3.origin.y + 10.0;
  v9 = a3.size.height + -20.0;
  remainder.size.width = a3.size.width + -32.0;
  remainder.size.height = a3.size.height + -20.0;
  if (-[PKAccountBillPaymentMessageContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v10 = CGRectMaxXEdge;
  else
    v10 = CGRectMinXEdge;
  imageView = self->_imageView;
  v12 = 0.0;
  v13 = 0.0;
  if (imageView)
  {
    -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", width + -32.0, v9);
    v15 = v14;
    v13 = v16;
    v25.origin.x = v7;
    v25.origin.y = v8;
    v25.size.width = width + -32.0;
    v25.size.height = v9;
    CGRectDivide(v25, &v22, &remainder, v15, v10);
    PKSizeAlignedInRect();
    if (!a4)
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
    CGRectDivide(remainder, &v22, &remainder, 16.0, v10);
  }
  messageTextView = self->_messageTextView;
  if (messageTextView)
  {
    -[UITextView sizeThatFits:](messageTextView, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v12 = v18;
    CGRectDivide(remainder, &v22, &remainder, v19, v10);
    if (!a4)
      -[UITextView setFrame:](self->_messageTextView, "setFrame:", *(_OWORD *)&v22.origin, *(_OWORD *)&v22.size);
  }
  v20 = fmax(v12, v13) + 0.0 + 20.0;
  v21 = width;
  result.height = v20;
  result.width = v21;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
}

- (id)_messageFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
}

- (NSString)systemImage
{
  return self->_systemImage;
}

- (NSString)message
{
  return self->_message;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_systemImage, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
