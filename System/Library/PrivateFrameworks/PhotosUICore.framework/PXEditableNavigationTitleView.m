@implementation PXEditableNavigationTitleView

- (PXEditableNavigationTitleView)initWithFrame:(CGRect)a3
{
  PXEditableNavigationTitleView *v3;
  _PXEditableNavigationTitleTextField *v4;
  _PXEditableNavigationTitleTextField *textField;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXEditableNavigationTitleView;
  v3 = -[PXEditableNavigationTitleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_PXEditableNavigationTitleTextField);
    textField = v3->_textField;
    v3->_textField = v4;

    -[_PXEditableNavigationTitleTextField setDelegate:](v3->_textField, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXEditableNavigationTitleTextField setFont:](v3->_textField, "setFont:", v6);

    -[_PXEditableNavigationTitleTextField setPadding:](v3->_textField, "setPadding:", 8.0, 12.0, 8.0, 12.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__textFieldTextDidChange_, *MEMORY[0x1E0DC54D0], v3->_textField);

    -[PXEditableNavigationTitleView addSubview:](v3, "addSubview:", v3->_textField);
    v3->_needsUpdateFlags.textColor = 1;
  }
  return v3;
}

- (PXEditableNavigationTitleView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditableNavigationTitleView.m"), 55, CFSTR("%s is not available as initializer"), "-[PXEditableNavigationTitleView initWithCoder:]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXEditableNavigationTitleView;
  -[PXEditableNavigationTitleView dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $D8410F2E85B2B0D9082EFFD1427453DA *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->validateNewText = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didEndEditing = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *text;
  void *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_text;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v9, "copy");
      text = self->_text;
      self->_text = v6;

      -[PXEditableNavigationTitleView textField](self, "textField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v9);

      -[PXEditableNavigationTitleView sizeToFit](self, "sizeToFit");
    }
  }

}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[PXEditableNavigationTitleView _invalidateTextColor](self, "_invalidateTextColor");
  }
}

- (void)endEditing
{
  id v2;

  -[PXEditableNavigationTitleView textField](self, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXEditableNavigationTitleView textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
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
  id v11;

  -[PXEditableNavigationTitleView _updateIfNeeded](self, "_updateIfNeeded");
  -[PXEditableNavigationTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXEditableNavigationTitleView textField](self, "textField");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXEditableNavigationTitleView;
  -[PXEditableNavigationTitleView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PXEditableNavigationTitleView _invalidateTextColor](self, "_invalidateTextColor");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.textColor;
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingUpdates)
    -[PXEditableNavigationTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXEditableNavigationTitleView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXEditableNavigationTitleView _updateTextColorIfNeeded](self, "_updateTextColorIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_invalidateTextColor
{
  self->_needsUpdateFlags.textColor = 1;
  -[PXEditableNavigationTitleView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateTextColorIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.textColor)
  {
    self->_needsUpdateFlags.textColor = 0;
    if (-[PXEditableNavigationTitleView isEditing](self, "isEditing"))
    {
      v4 = 0;
    }
    else
    {
      -[PXEditableNavigationTitleView tintColor](self, "tintColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[PXEditableNavigationTitleView textField](self, "textField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v4);

  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  -[PXEditableNavigationTitleView setEditing:](self, "setEditing:", 1);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "endEditing:", 0);
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;

  v6 = a3;
  -[PXEditableNavigationTitleView setEditing:](self, "setEditing:", 0);
  if (!a4)
  {
    -[PXEditableNavigationTitleView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXEditableNavigationTitleView textField](self, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E5149688;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    if (!self->_delegateRespondsTo.validateNewText
      || (objc_msgSend(v7, "editableNavigationTitleView:validateNewText:", self, v12),
          v13 = objc_claimAutoreleasedReturnValue(),
          v12,
          (v12 = (__CFString *)v13) != 0))
    {
      -[PXEditableNavigationTitleView text](self, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v12);

      if ((v15 & 1) == 0)
      {
        -[PXEditableNavigationTitleView setText:](self, "setText:", v12);
        if (self->_delegateRespondsTo.didEndEditing)
          objc_msgSend(v7, "editableNavigationTitleViewDidEndEditing:", self);
      }
    }

  }
  -[PXEditableNavigationTitleView text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v16);

  -[PXEditableNavigationTitleView sizeToFit](self, "sizeToFit");
}

- (PXEditableNavigationTitleViewDelegate)delegate
{
  return (PXEditableNavigationTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)text
{
  return self->_text;
}

- (_PXEditableNavigationTitleTextField)textField
{
  return self->_textField;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
