@implementation TSKEditableTextViewCell

- (TSKEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSKEditableTextViewCell *v4;
  TSKPlaceholderTextView *v5;
  TSKPlaceholderTextView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSKEditableTextViewCell;
  v4 = -[TSKEditableTextViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    -[TSKEditableTextViewCell setFont:](v4, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
    v5 = [TSKPlaceholderTextView alloc];
    v6 = -[TSKPlaceholderTextView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v4->mTextView = v6;
    -[TSKPlaceholderTextView setTextAlignment:](v6, "setTextAlignment:", 2);
    -[TSKPlaceholderTextView setFont:](v4->mTextView, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
    -[TSKPlaceholderTextView setTextColor:](v4->mTextView, "setTextColor:", -[TSKEditableTextViewCell tintColor](v4, "tintColor"));
    -[TSKPlaceholderTextView setReturnKeyType:](v4->mTextView, "setReturnKeyType:", 9);
    -[TSKPlaceholderTextView setUserInteractionEnabled:](v4->mTextView, "setUserInteractionEnabled:", 0);
    -[TSKPlaceholderTextView setScrollEnabled:](v4->mTextView, "setScrollEnabled:", 0);
    -[TSKPlaceholderTextView setOpaque:](v4->mTextView, "setOpaque:", 0);
    -[TSKPlaceholderTextView setBackgroundColor:](v4->mTextView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_textFieldDidEndEditing_, *MEMORY[0x24BDF7F60], v4->mTextView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSKEditableTextViewCell;
  -[TSKEditableTextViewCell dealloc](&v3, sel_dealloc);
}

- (void)tintColorDidChange
{
  -[TSKPlaceholderTextView setTextColor:](self->mTextView, "setTextColor:", -[TSKEditableTextViewCell tintColor](self, "tintColor"));
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18.receiver = self;
  v18.super_class = (Class)TSKEditableTextViewCell;
  -[TSKEditableTextViewCell layoutSubviews](&v18, sel_layoutSubviews);
  objc_msgSend((id)-[TSKEditableTextViewCell contentView](self, "contentView"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)-[TSKEditableTextViewCell textLabel](self, "textLabel");
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  objc_msgSend(v11, "setFrame:", v13, v15, CGRectGetMaxX(v19) + -160.0, v17);
  objc_msgSend(v11, "setAdjustsLetterSpacingToFitWidth:", 1);
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v11, "setMinimumFontSize:", 12.0);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v21.origin.x = CGRectGetMaxX(v20) + -170.0;
  v21.size.width = 160.0;
  v21.origin.y = 3.0;
  v21.size.height = 29.0;
  v22 = CGRectIntegral(v21);
  -[TSKPlaceholderTextView setFrame:](self->mTextView, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  if (!-[TSKPlaceholderTextView superview](self->mTextView, "superview"))
    objc_msgSend((id)-[TSKEditableTextViewCell contentView](self, "contentView"), "addSubview:", self->mTextView);
}

- (NSString)string
{
  return (NSString *)-[TSKPlaceholderTextView text](self->mTextView, "text");
}

- (void)p_parseText:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->mNumberHasDecimal = 0;
  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (objc_msgSend(a3, "characterAtIndex:", v7) != 46)
    {
      if (v6 == ++v7)
        return;
    }
    self->mNumberHasDecimal = 1;
  }
}

- (void)setString:(id)a3
{
  -[TSKEditableTextViewCell p_parseText:](self, "p_parseText:");
  -[TSKPlaceholderTextView setText:](self->mTextView, "setText:", a3);
}

- (void)setInputView:(id)a3
{
  UIView *mInputView;

  mInputView = self->mInputView;
  if (mInputView != a3)
  {

    self->mInputView = (UIView *)a3;
  }
}

- (void)setPlaceholder:(id)a3
{
  -[TSKPlaceholderTextView setPlaceholder:](self->mTextView, "setPlaceholder:", a3);
}

- (void)setTextTag:(int64_t)a3
{
  -[TSKPlaceholderTextView setTag:](self->mTextView, "setTag:", a3);
}

- (void)setTextDelegate:(id)a3
{
  -[TSKPlaceholderTextView setDelegate:](self->mTextView, "setDelegate:", a3);
}

- (void)beginEditing
{
  void *v3;
  uint64_t v4;

  -[TSKPlaceholderTextView setInputView:](self->mTextView, "setInputView:", self->mInputView);
  -[TSKPlaceholderTextView setUserInteractionEnabled:](self->mTextView, "setUserInteractionEnabled:", 1);
  if (self->mSavedDelegate)
  {
    -[TSKPlaceholderTextView setDelegate:](self->mTextView, "setDelegate:");
    self->mSavedDelegate = 0;
  }
  -[TSKPlaceholderTextView becomeFirstResponder](self->mTextView, "becomeFirstResponder");
  if ((-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell beginEditing]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 321, CFSTR("We just tried to begin text view editing, but did not become a first responder."));
  }
}

- (void)endEditing
{
  void *v3;
  uint64_t v4;

  -[TSKPlaceholderTextView setInputView:](self->mTextView, "setInputView:", 0);
  -[TSKPlaceholderTextView setUserInteractionEnabled:](self->mTextView, "setUserInteractionEnabled:", 0);
  -[TSKPlaceholderTextView resignFirstResponder](self->mTextView, "resignFirstResponder");
  self->mSavedDelegate = (UITextViewDelegate *)-[TSKPlaceholderTextView delegate](self->mTextView, "delegate");
  -[TSKPlaceholderTextView setDelegate:](self->mTextView, "setDelegate:", self);
  if (-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell endEditing]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 336, CFSTR("We just tried to end text view editing, but did not resign the first responder."));
  }
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return -[TSKPlaceholderTextView isUserInteractionEnabled](self->mTextView, "isUserInteractionEnabled", a3);
}

- (void)textFieldDidEndEditing:(id)a3
{
  -[TSKPlaceholderTextView setUserInteractionEnabled:](self->mTextView, "setUserInteractionEnabled:", 0);
}

- (void)p_insertString:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = -[TSKPlaceholderTextView selectedRange](self->mTextView, "selectedRange");
  v7 = v6;
  if (!-[TSKEditableTextViewCell isNegative](self, "isNegative") || v5)
  {
    v9 = (id)-[NSString mutableCopy](-[TSKEditableTextViewCell string](self, "string"), "mutableCopy");
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v5, v7, a3);
    v8 = objc_msgSend(a3, "length") + v5;
    -[TSKEditableTextViewCell setString:](self, "setString:", v9);
    -[TSKPlaceholderTextView setSelectedRange:](self->mTextView, "setSelectedRange:", v8, 0);

  }
}

- (void)parseText
{
  -[TSKEditableTextViewCell p_parseText:](self, "p_parseText:", -[TSKEditableTextViewCell string](self, "string"));
}

- (BOOL)isNegative
{
  NSString *v2;
  uint64_t v3;

  v2 = -[TSKEditableTextViewCell string](self, "string");
  v3 = -[NSString length](v2, "length");
  if (v3)
    LOBYTE(v3) = -[NSString characterAtIndex:](v2, "characterAtIndex:", 0) == 45;
  return v3;
}

- (void)insertNumber:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
  if ((-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell insertNumber:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 392, CFSTR("The current cell is not the first responder!"));
  }
  -[TSKEditableTextViewCell p_insertString:](self, "p_insertString:", v4);
}

- (void)insertDecimalSeparator
{
  void *v3;
  uint64_t v4;

  if (!self->mNumberHasDecimal)
  {
    if ((-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder") & 1) == 0)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell insertDecimalSeparator]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 403, CFSTR("The current cell is not the first responder!"));
    }
    -[TSKEditableTextViewCell p_insertString:](self, "p_insertString:", objc_msgSend(MEMORY[0x24BEB3CC8], "currentLocaleDecimalSeparator"));
    self->mNumberHasDecimal = 1;
  }
}

- (void)deleteBackward
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if ((-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell deleteBackward]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 415, CFSTR("The current cell is not the first responder!"));
  }
  v10 = (id)-[NSString mutableCopy](-[TSKEditableTextViewCell string](self, "string"), "mutableCopy");
  if (objc_msgSend(v10, "length"))
  {
    v5 = -[TSKPlaceholderTextView selectedRange](self->mTextView, "selectedRange");
    v7 = (v6 == 0) & (v5 != 0);
    if (v6 == 0 && v5 != 0)
      v8 = 1;
    else
      v8 = v6;
    v9 = v5 - v7;
    objc_msgSend(v10, "deleteCharactersInRange:", v5 - v7, v8);
    -[TSKEditableTextViewCell setString:](self, "setString:", v10);
    -[TSKPlaceholderTextView setSelectedRange:](self->mTextView, "setSelectedRange:", v9, 0);
  }

}

- (void)toggleNegative
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((-[TSKPlaceholderTextView isFirstResponder](self->mTextView, "isFirstResponder") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKEditableTextViewCell toggleNegative]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKEditableTextViewCell.m"), 442, CFSTR("The current cell is not the first responder!"));
  }
  v5 = -[TSKEditableTextViewCell string](self, "string");
  v6 = -[TSKPlaceholderTextView selectedRange](self->mTextView, "selectedRange");
  v8 = v7;
  if (-[TSKEditableTextViewCell isNegative](self, "isNegative"))
  {
    v9 = -[NSString substringFromIndex:](v5, "substringFromIndex:", 1);
    v10 = -1;
  }
  else
  {
    v9 = objc_msgSend(CFSTR("-"), "stringByAppendingString:", v5);
    v10 = 1;
  }
  v11 = v6 + v10;
  -[TSKEditableTextViewCell setString:](self, "setString:", v9);
  -[TSKPlaceholderTextView setSelectedRange:](self->mTextView, "setSelectedRange:", v11, v8);
}

@end
