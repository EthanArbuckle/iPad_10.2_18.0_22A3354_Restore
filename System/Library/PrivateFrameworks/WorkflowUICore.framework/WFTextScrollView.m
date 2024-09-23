@implementation WFTextScrollView

- (WFTextScrollView)initWithTextView:(id)a3
{
  id v5;
  WFTextScrollView *v6;
  WFTextScrollView *v7;
  void *v8;
  double v9;
  WFTextScrollView *v10;

  v5 = a3;
  v6 = -[WFTextScrollView init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textView, a3);
    v7->_adjustmentEnabled = 1;
    objc_msgSend(v5, "setDelegate:", v7);
    -[WFTextScrollView addSubview:](v7, "addSubview:", v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_textUpdated, *MEMORY[0x24BEBE988], v5);

    -[WFTextScrollView setScrollEnabled:](v7, "setScrollEnabled:", 0);
    -[WFTextScrollView setScrollsToTop:](v7, "setScrollsToTop:", 0);
    LODWORD(v9) = 1132068864;
    -[WFTextScrollView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE988], self->_textView);

  v4.receiver = self;
  v4.super_class = (Class)WFTextScrollView;
  -[WFTextScrollView dealloc](&v4, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return -[UITextView canBecomeFirstResponder](self->_textView, "canBecomeFirstResponder");
}

- (BOOL)canBecomeFocused
{
  return -[UITextView canBecomeFocused](self->_textView, "canBecomeFocused");
}

- (BOOL)becomeFirstResponder
{
  return -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[UITextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[WFTextScrollView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double v17;
  double v18;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31.receiver = self;
  v31.super_class = (Class)WFTextScrollView;
  -[WFTextScrollView layoutSubviews](&v31, sel_layoutSubviews);
  if (!self->_adjustmentEnabled)
  {
    -[WFTextScrollView frame](self, "frame");
    -[WFTextScrollView setContentSize:](self, "setContentSize:", v25, v26);
    -[WFTextScrollView frame](self, "frame");
    v28 = v27;
    -[WFTextScrollView frame](self, "frame");
    v30 = v29;
    -[WFTextScrollView textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    v21 = 0.0;
    v22 = 0.0;
    v23 = v28;
    v24 = v30;
    goto LABEL_13;
  }
  -[WFTextScrollView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[WFTextScrollView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextScrollView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 + 10.0;

  if (v11 >= v4)
    v12 = v11;
  else
    v12 = v4;
  v32.size.width = ceil(v12);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.height = v6;
  v33 = CGRectIntegral(v32);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  -[WFTextScrollView contentSize](self, "contentSize");
  if (width != v18 || v6 != v17)
    -[WFTextScrollView setContentSize:](self, "setContentSize:", width, v6);
  objc_msgSend(v7, "frame");
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (!CGRectEqualToRect(v34, v35))
  {
    v20 = v7;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
LABEL_13:
    objc_msgSend(v20, "setFrame:", v21, v22, v23, v24);
  }

}

- (void)textUpdated
{
  -[WFTextScrollView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if (self->_adjustmentEnabled)
  {
    -[WFTextScrollView setNeedsLayout](self, "setNeedsLayout");
    -[WFTextScrollView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textViewDidChangeSelection:", v18);

  }
  if (self->_adjustmentEnabled)
  {
    v7 = -[WFTextScrollView selectedRange](self, "selectedRange");
    v8 = objc_msgSend(v18, "selectedRange");
    -[WFTextScrollView setSelectedRange:](self, "setSelectedRange:", v8, v9);
    v10 = -[WFTextScrollView selectedRange](self, "selectedRange");
    objc_msgSend(v18, "selectedTextRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 >= v7)
    {
      objc_msgSend(v11, "end");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:offset:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(v18, "selectedTextRange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "end");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v11, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:offset:", v13, -1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(v18, "selectedTextRange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "start");
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v14 = (void *)v16;

      }
    }
    objc_msgSend(v18, "caretRectForPosition:", v14);
    -[WFTextScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0);

    goto LABEL_12;
  }
  -[WFTextScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
LABEL_12:

}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textViewDidEndEditing:", v7);

  }
  if (-[WFTextScrollView isFirstResponder](self, "isFirstResponder"))
    -[WFTextScrollView resignFirstResponder](self, "resignFirstResponder");

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFTextScrollView;
    -[WFTextScrollView methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTextScrollView;
  if (-[WFTextScrollView respondsToSelector:](&v8, sel_respondsToSelector_, objc_msgSend(v4, "selector")))
  {
    objc_msgSend(v4, "invokeWithTarget:", self);
  }
  else
  {
    -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selector");
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[WFTextScrollView textViewDelegate](self, "textViewDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invokeWithTarget:", v7);

    }
  }

}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)isAdjustmentEnabled
{
  return self->_adjustmentEnabled;
}

- (void)setAdjustmentEnabled:(BOOL)a3
{
  self->_adjustmentEnabled = a3;
}

- (UITextViewDelegate)textViewDelegate
{
  return (UITextViewDelegate *)objc_loadWeakRetained((id *)&self->_textViewDelegate);
}

- (void)setTextViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textViewDelegate, a3);
}

- (_NSRange)selectedRange
{
  _NSRange *p_selectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRange = &self->_selectedRange;
  location = self->_selectedRange.location;
  length = p_selectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textViewDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
