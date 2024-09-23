@implementation UIFieldEditor

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");

  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  -[UIScrollView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v9;

  if ((*(_WORD *)&self->_feFlags & 0x80) == 0)
  {
    y = a3.y;
    x = a3.x;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (x != v7 || y != v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)UIFieldEditor;
      -[UIScrollView setContentOffset:](&v9, sel_setContentOffset_, x, y);
    }
  }
}

- (id)text
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor beginningOfDocument](self, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor endOfDocument](self, "endOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UITextPosition)endOfDocument
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "comparePosition:toPosition:", v7, v6);

  return v9;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_textInputController
{
  UITextInputController *textInputController;
  UITextInputController *v4;
  UITextInputController *v5;
  UITextInputController *v6;

  textInputController = self->__textInputController;
  if (!textInputController)
  {
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v4 = (UITextInputController *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutControllerBase textInputController](v4);
    v5 = (UITextInputController *)objc_claimAutoreleasedReturnValue();
    v6 = self->__textInputController;
    self->__textInputController = v5;

    -[UITextInputController setDelegate:](self->__textInputController, "setDelegate:", self);
    textInputController = self->__textInputController;
  }
  return textInputController;
}

- (UITextPosition)beginningOfDocument
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (_NSRange)markedRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "markedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  if (-[UIFieldEditor respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3);
}

- (void)_updateLayoutManagerStyleEffectConfiguration
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "_cuiStyleEffectConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyleEffectConfiguration:", v3);

}

- (CGPoint)textContainerOrigin
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIFieldEditor _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "_ui_resolvedTextAlignment");
  }
  else
  {
    -[UIFieldEditor typingAttributes](self, "typingAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "_ui_resolvedTextAlignment");

  }
  -[UIFieldEditor textContainerOriginForTextAlignment:](self, "textContainerOriginForTextAlignment:", v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)textContainerOriginForTextAlignment:(int64_t)a3
{
  id v3;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double Width;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;
  CGRect v31;
  CGRect v32;

  WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);

  if (!WeakRetained)
  {
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    goto LABEL_18;
  }
  -[UIView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (v3 = objc_loadWeakRetained((id *)&self->_textField), objc_msgSend(v3, "_tvHasFloatingFieldEditor")))
  {
    v9 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v12 = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(v12, "_originForTextFieldLabel:", 0);
    v9 = v13;
    v8 = v14;

    if (!v7)
      goto LABEL_8;
  }

LABEL_8:
  if (a3 == 2)
  {
    -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v32);
    -[UIFieldEditor _textContainer](self, "_textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v9 = Width - v20;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = CGRectGetWidth(v31);
    -[UIFieldEditor _textContainer](self, "_textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v9 = (v16 - v18) * 0.5;
LABEL_12:

  }
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "baselineOffsetForFirstGlyph");
  v23 = v22;

  UIRoundToViewScale(self);
  v25 = v8 + v24 - v23;
  -[UIFieldEditor _contentInsetsFromFonts](self, "_contentInsetsFromFonts");
  v28 = v27;
  v10 = v9 - v29;
  if (a3 == 2)
    v10 = v9 + v26;
  if (a3 == 1)
    v10 = v9;
  v11 = v25 - v28;
LABEL_18:
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)_textLayoutController
{
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  p_textLayoutController = &self->__textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);

  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(v5, "textLayoutController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_textLayoutController, v6);

    v7 = objc_loadWeakRetained((id *)p_textLayoutController);
    LODWORD(v6) = objc_msgSend(v7, "canAccessLayoutManager");

    if ((_DWORD)v6)
    {
      v8 = objc_loadWeakRetained((id *)p_textLayoutController);
      objc_msgSend(v8, "setLayoutManagerDelegate:", self);

    }
    v9 = -[UIFieldEditor _textContainer](self, "_textContainer");
  }
  return objc_loadWeakRetained((id *)p_textLayoutController);
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIFieldEditor _fullContentInsetsFromFonts](self, "_fullContentInsetsFromFonts");
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_fullContentInsetsFromFonts
{
  UIEdgeInsets *p_contentInsetsFromFonts;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if ((*(_WORD *)&self->_feFlags & 0x100) == 0)
  {
    p_contentInsetsFromFonts = &self->_contentInsetsFromFonts;
    *(_OWORD *)&self->_contentInsetsFromFonts.top = 0u;
    *(_OWORD *)&self->_contentInsetsFromFonts.bottom = 0u;
    +[UILabel _tooBigChars]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v4);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      p_contentInsetsFromFonts->top = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v5, v8, self);
      p_contentInsetsFromFonts->left = v9;
      p_contentInsetsFromFonts->bottom = v10;
      p_contentInsetsFromFonts->right = v11;

      *(_WORD *)&self->_feFlags |= 0x100u;
    }

  }
  top = self->_contentInsetsFromFonts.top;
  left = self->_contentInsetsFromFonts.left;
  bottom = self->_contentInsetsFromFonts.bottom;
  right = self->_contentInsetsFromFonts.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)_textStorage
{
  id *p_textStorage;
  _UICascadingTextStorage *textStorage;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;

  p_textStorage = (id *)&self->__textStorage;
  textStorage = self->__textStorage;
  if (!textStorage)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);
    objc_msgSend(WeakRetained, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if (!v7)
        goto LABEL_7;
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)&self->_textField);
      objc_msgSend(v8, "_textStorage");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_7:

        textStorage = (_UICascadingTextStorage *)*p_textStorage;
        return textStorage;
      }
    }
    objc_storeStrong(p_textStorage, v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__textStorageDidProcessEditing_, *(_QWORD *)off_1E16791A8, v7);

    goto LABEL_7;
  }
  return textStorage;
}

- (NSDictionary)typingAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _textContainer](self, "_textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributesForExtraLineFragment:", v4);

  objc_msgSend(v3, "typingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)_textContainer
{
  NSTextContainer **p_textContainer;
  id WeakRetained;
  id v5;
  void *v6;

  p_textContainer = &self->__textContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(v5, "_textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)p_textContainer, v6);
    objc_msgSend(v6, "setTextView:", self);
    objc_msgSend(v6, "setLineFragmentPadding:", 0.0);
    -[UIFieldEditor _applyCorrectTextContainerSize:](self, "_applyCorrectTextContainerSize:", v6);

  }
  return objc_loadWeakRetained((id *)p_textContainer);
}

- (void)_applyCorrectTextContainerSize:(id)a3
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v16;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL IsNull;
  id v27;
  id v28;
  CGRect v29;

  v28 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v8 = 40000.0;
LABEL_5:

    goto LABEL_6;
  }
  -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v10;
    v7 = v11;
    goto LABEL_5;
  }
  v8 = 40000.0;
  v7 = 40000.0;
LABEL_6:
  objc_msgSend(v28, "size");
  v13 = v28;
  if (v8 != v14 || v7 != v12)
  {
    objc_msgSend(v28, "setSize:", v8, v7);
    v16 = objc_loadWeakRetained((id *)&self->__textLayoutController);
    if (v16)
    {
      v17 = objc_loadWeakRetained((id *)&self->__textLayoutController);
      objc_msgSend(v17, "updateLayoutForSizeChangeOfTextContainer:", v28);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

    }
    else
    {
      v19 = *MEMORY[0x1E0C9D628];
      v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

    v29.origin.x = v19;
    v29.origin.y = v21;
    v29.size.width = v23;
    v29.size.height = v25;
    IsNull = CGRectIsNull(v29);
    v13 = v28;
    if (!IsNull)
    {
      -[UIFieldEditor textContainerUsageDidChangeToSize:](self, "textContainerUsageDidChangeToSize:", v23, v25);
      v27 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v27, "setNeedsDisplay");

      v13 = v28;
    }
  }

}

- (id)_textCanvasView
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(v6, "_textCanvasView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
  self->_desiredContentWidth = ceil(a3.width);
  -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caretRectForPosition:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
  {
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unobscuredRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEmpty");

    if (v16)
    {
      -[UIFieldEditor font](self, "font");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lineHeight");
      v13 = v18;

    }
  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_shouldObscureInput
{
  void *v3;
  int v4;
  id WeakRetained;

  -[UIFieldEditor _textInputTraits](self, "_textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSecureTextEntry")
    && (objc_msgSend(v3, "displaySecureTextUsingPlainText") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    v4 = objc_msgSend(WeakRetained, "_shouldUnobscureTextWithContentCover") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_textInputTraits
{
  UITextInputController *v3;
  UITextField **p_textField;
  id WeakRetained;
  UITextInputController *v6;
  id v7;

  v3 = self->__textInputController;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  -[UITextInputController takeTraitsFrom:](v3, "takeTraitsFrom:", WeakRetained);

  if (v3)
  {
    v6 = v3;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_textField);
    objc_msgSend(v7, "textInputTraits");
    v6 = (UITextInputController *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)layoutOrientation
{
  return 0;
}

- (BOOL)textInputShouldExtendCaretHeight:(id)a3
{
  UIFieldEditor *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "fieldEditorShouldExtendCaretHeight:", v3);

  return (char)v3;
}

- (BOOL)_hasDictationPlaceholder
{
  void *v2;
  char v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasDictationPlaceholder");

  return v3;
}

- (UIView)textInputView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)_applyCorrectTextContainerSize
{
  NSTextContainer **p_textContainer;
  id WeakRetained;
  id v5;
  id v6;

  p_textContainer = &self->__textContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_textContainer);
    -[UIFieldEditor _applyCorrectTextContainerSize:](self, "_applyCorrectTextContainerSize:", v6);

  }
  else
  {
    v5 = -[UIFieldEditor _textContainer](self, "_textContainer");
  }
}

- (BOOL)_mightHaveSelection
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v3 = objc_msgSend(WeakRetained, "isFirstResponder");

  return v3;
}

- (UITextInteractionAssistant)interactionAssistant
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInteractionAssistant *)v3;
}

- (void)layoutSubviews
{
  double *v3;
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
  void *v16;
  void *v17;
  id WeakRetained;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  CGRect v47;

  v3 = (double *)MEMORY[0x1E0C9D648];
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIFieldEditor _invalidateAfterObscuredRangeChangeIfNeeded](self, "_invalidateAfterObscuredRangeChangeIfNeeded");
  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  if (CGRectIsEmpty(v47))
  {
    v12 = v3[2];
    v13 = v3[3];
LABEL_10:
    -[UIView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMask:", 0);

    LOBYTE(v28) = 1;
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    goto LABEL_11;
  }
  v14 = *v3;
  v15 = v3[1];
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _textContainer](self, "_textContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ensureLayoutForTextContainer:", v17);

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "_padding");
  v20 = v19 + self->_desiredContentWidth;
  v21 = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(v21, "_padding");
  v23 = v20 + v22;

  v12 = fmax(v23, v9);
  -[UIFieldEditor _contentInsetsFromFonts](self, "_contentInsetsFromFonts");
  if (v25 == 0.0 && v24 == 0.0 && v27 == 0.0 && v26 == 0.0)
  {
    v28 = 1;
    v13 = v11;
  }
  else
  {
    v14 = v14 + v25;
    v15 = v15 + v24;
    v12 = v12 - (v25 + v27);
    v13 = v11 - (v24 + v26);
    v28 = !-[UIFieldEditor setUpClippingWithMaskForBounds:contentFrame:](self, "setUpClippingWithMaskForBounds:contentFrame:", v5, v7, v9, v11, v14, v15, v12, v13);
  }
  v29 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v29, "setFrame:", v14, v15, v12, v13);

  if (v28)
    goto LABEL_10;
LABEL_11:
  v31 = fmax(v9, v12);
  v32 = fmax(v11, v13);
  -[UIScrollView contentSize](self, "contentSize");
  if (v34 != v31 || v33 != v32)
  {
    -[UIScrollView setContentSize:](self, "setContentSize:", v31, v32);
    -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNeedsSelectionDisplayUpdate");

  }
  -[UIScrollView contentOffset](self, "contentOffset");
  v38 = v37 - (v31 - v9);
  if (v38 > 0.0)
  {
    -[UIFieldEditor setContentOffset:](self, "setContentOffset:");
    if ((v28 & 1) == 0)
    {
      -[UIView layer](self, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "mask");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "position");
      v42 = v41;
      v44 = v43;

      -[UIView layer](self, "layer");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "mask");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setPosition:", v42 - v38, v44);

    }
  }
}

- (void)_invalidateAfterObscuredRangeChangeIfNeeded
{
  __int16 feFlags;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  feFlags = (__int16)self->_feFlags;
  if ((feFlags & 0x40) != 0)
  {
    *(_WORD *)&self->_feFlags = feFlags & 0xFFBF;
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateLayoutForRange:", v4);
    -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsDisplay");

    -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDisplayedSelection");

  }
}

- (UIFieldEditor)initWithTextField:(id)a3
{
  id v4;
  UIFieldEditor *v5;
  UIFieldEditor *v6;
  id v7;
  id WeakRetained;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIFieldEditor;
  v5 = -[UIScrollView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[UIScrollView setScrollEnabled:](v5, "setScrollEnabled:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](v6, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    v6->_active = 0;
    v7 = objc_storeWeak((id *)&v6->_textField, v4);
    *(_WORD *)&v6->_feFlags = *(_WORD *)&v6->_feFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_textField);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *(_WORD *)&v6->_feFlags = *(_WORD *)&v6->_feFlags & 0xFFFD | v9;

    v10 = objc_loadWeakRetained((id *)&v6->_textField);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4;
    else
      v11 = 0;
    *(_WORD *)&v6->_feFlags = *(_WORD *)&v6->_feFlags & 0xFFFB | v11;

    v12 = objc_loadWeakRetained((id *)&v6->_textField);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 8;
    else
      v13 = 0;
    *(_WORD *)&v6->_feFlags = *(_WORD *)&v6->_feFlags & 0xFFF7 | v13;

    -[UIView setOpaque:](v6, "setOpaque:", 0);
    -[UIScrollView _autoScrollAssistant](v6, "_autoScrollAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowedDirections:", 6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSTimer *obscureAllTextTimer;
  objc_super v5;

  if (self->__textStorage)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)off_1E16791A8, self->__textStorage);

  }
  -[NSTimer invalidate](self->_obscureAllTextTimer, "invalidate");
  obscureAllTextTimer = self->_obscureAllTextTimer;
  self->_obscureAllTextTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  -[UIScrollView dealloc](&v5, sel_dealloc);
}

- (UITextRange)selectedTextRange
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (UITextRange)markedTextRange
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (id)textField
{
  return objc_loadWeakRetained((id *)&self->_textField);
}

- (UITextInputDelegate)inputDelegate
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputDelegate *)v3;
}

- (_NSRange)selectionRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setTextContainer:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  id WeakRetained;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (has_internal_diagnostics)
  {
    if (WeakRetained != v4)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "unexpected different text container", buf, 2u);
      }

    }
  }
  else if (WeakRetained != v4)
  {
    v8 = setTextContainer____s_category;
    if (!setTextContainer____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&setTextContainer____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "unexpected different text container", v10, 2u);
    }
  }
}

- (void)setMarkedTextStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMarkedTextStyle:", v4);

}

- (void)_deactivateSelectionView
{
  void *v3;
  id v4;

  -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectionDisplayVisible:", 0);

  -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateSelection");

}

- (void)activateEditor
{
  UITextField **p_textField;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  NSAttributedString *v8;
  NSAttributedString *originalAttributedString;
  void *v10;
  NSDictionary *v11;
  NSDictionary *originalDefaultAttributes;
  id v13;
  void *v14;
  id v15;
  __int16 v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_contentView);

    if (!v6)
    {
      -[UIFieldEditor _textStorage](self, "_textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSAttributedString *)objc_msgSend(v7, "copy");
      originalAttributedString = self->_originalAttributedString;
      self->_originalAttributedString = v8;

      objc_msgSend(v7, "defaultAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSDictionary *)objc_msgSend(v10, "copy");
      originalDefaultAttributes = self->_originalDefaultAttributes;
      self->_originalDefaultAttributes = v11;

      v13 = objc_loadWeakRetained((id *)p_textField);
      objc_msgSend(v13, "_textCanvasView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_contentView, v14);

      v15 = objc_loadWeakRetained((id *)&self->_contentView);
      -[UIView addSubview:](self, "addSubview:", v15);

      if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
        v16 = 32;
      else
        v16 = 0;
      *(_WORD *)&self->_feFlags = *(_WORD *)&self->_feFlags & 0xFFDF | v16;
      -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
      -[UIFieldEditor _deactivateSelectionView](self, "_deactivateSelectionView");
      -[UIFieldEditor _resetTypingAttributes](self, "_resetTypingAttributes");
      -[UIFieldEditor _handleObscuredTextAfterActivationChange](self, "_handleObscuredTextAfterActivationChange");
      v17 = objc_loadWeakRetained((id *)&self->_contentView);
      self->_cachedUserInteractionEnabled = objc_msgSend(v17, "isUserInteractionEnabled");

      v18 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v18, "setUserInteractionEnabled:", 1);

      v19 = objc_loadWeakRetained((id *)p_textField);
      v20 = objc_msgSend(v19, "_textInputSource");

      v21 = objc_loadWeakRetained((id *)p_textField);
      v22 = objc_msgSend(v21, "isFirstResponder");

      if (v22 && v20 != 3)
        -[UIFieldEditor _updateTextSelectionFromBehavior](self, "_updateTextSelectionFromBehavior");
      -[UIFieldEditor _applyCorrectTextContainerSize](self, "_applyCorrectTextContainerSize");
      v23 = objc_loadWeakRetained((id *)p_textField);
      v24 = objc_msgSend(v23, "isFirstResponder");

      if (v24)
      {
        -[UIFieldEditor _textStorage](self, "_textStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (!v26)
        {
          v27 = (void *)objc_opt_new();
          v28 = objc_loadWeakRetained((id *)p_textField);
          objc_msgSend(v27, "setAlignment:", objc_msgSend(v28, "textAlignment"));

          objc_msgSend(v27, "setLineBreakMode:", 2);
          v33[0] = *(_QWORD *)off_1E1678D90;
          -[UIFieldEditor font](self, "font");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = v29;
          v33[1] = *(_QWORD *)off_1E1678D98;
          -[UIFieldEditor textColor](self, "textColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v33[2] = *(_QWORD *)off_1E1678F98;
          v34[1] = v30;
          v34[2] = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIFieldEditor _textInputController](self, "_textInputController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTypingAttributes:", v31);

        }
      }
      -[UIFieldEditor _updateLayoutManagerStyleEffectConfiguration](self, "_updateLayoutManagerStyleEffectConfiguration");
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
      -[UIFieldEditor scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);

    }
  }
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _scrollRangeToVisible:animated:](self, "_scrollRangeToVisible:animated:", objc_msgSend(v5, "selectedRange"), 0, v3);

}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger location;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;

  v4 = a4;
  location = a3.location;
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController", a3.location, a3.length);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "documentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ensureLayoutForRange:", v7);

  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  objc_msgSend(v30, "positionWithOffset:affinity:", location, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor caretRectForPosition:](self, "caretRectForPosition:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v31.origin.x = v10;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v16;
  v32 = CGRectInset(v31, -fmax(10.0 - v14, 0.0), 0.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  -[UIFieldEditor textInputView](self, "textInputView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v21, x, y, width, height);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v4, v23, v25, v27, v29);
}

- (void)_unobscureAllText
{
  void *v3;
  id v4;

  -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnobscuredRange:", v3);

  -[UIFieldEditor _setNeedsInvalidateAfterObscuredRangeChange](self, "_setNeedsInvalidateAfterObscuredRangeChange");
}

- (void)_setNeedsInvalidateAfterObscuredRangeChange
{
  __int16 feFlags;
  id WeakRetained;

  feFlags = (__int16)self->_feFlags;
  if ((feFlags & 0x40) == 0)
  {
    *(_WORD *)&self->_feFlags = feFlags | 0x40;
    -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)_cancelObscureAllTextTimer
{
  NSTimer *obscureAllTextTimer;
  NSTimer *v4;

  obscureAllTextTimer = self->_obscureAllTextTimer;
  if (obscureAllTextTimer)
  {
    -[NSTimer invalidate](obscureAllTextTimer, "invalidate");
    v4 = self->_obscureAllTextTimer;
    self->_obscureAllTextTimer = 0;

  }
}

- (id)textColor
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)font
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(off_1E167A828, "systemMinimumFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_updateTextSelectionFromBehavior
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__UIFieldEditor__updateTextSelectionFromBehavior__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_resetTypingAttributes
{
  id v2;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTypingAttributes:", 0);
  objc_msgSend(v2, "_invalidateEmptyStringAttributes");

}

- (void)_handleObscuredTextAfterActivationChange
{
  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
  else
    -[UIFieldEditor _setNeedsInvalidateAfterObscuredRangeChange](self, "_setNeedsInvalidateAfterObscuredRangeChange");
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasText
{
  void *v2;
  char v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasText");

  return v3;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "offsetFromPosition:toPosition:", v7, v6);

  return v9;
}

- (UITextInputTokenizer)tokenizer
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokenizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputTokenizer *)v3;
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput", a3))
  {
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnobscuredRange:", 0);

    -[UIFieldEditor _setNeedsInvalidateAfterObscuredRangeChange](self, "_setNeedsInvalidateAfterObscuredRangeChange");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsDisplay");

  -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

  *(_WORD *)&self->_feFlags &= ~0x100u;
}

- (void)setInputDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputDelegate:", v4);

}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  id v11;

  v6 = a4;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseWritingDirection:forRange:", a3, v6);

  -[UIFieldEditor _textStorage](self, "_textStorage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    v9 = objc_msgSend(WeakRetained, "_shouldIgnoreBaseWritingDirectionChanges");

    if (v9)
    {
      -[UIFieldEditor _textInputController](self, "_textInputController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_updateEmptyStringAttributes");

    }
    else
    {
      objc_msgSend(v11, "setDefaultBaseWritingDirection:", a3);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollAnimationEndedAction, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_obscureAllTextTimer, 0);
  objc_storeStrong((id *)&self->__textStorage, 0);
  objc_destroyWeak((id *)&self->__textLayoutController);
  objc_destroyWeak((id *)&self->__textContainer);
  objc_storeStrong((id *)&self->__textInputController, 0);
  objc_storeStrong((id *)&self->_originalDefaultAttributes, 0);
  objc_storeStrong((id *)&self->_originalAttributedString, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_destroyWeak((id *)&self->_textField);
}

void __49__UIFieldEditor__updateTextSelectionFromBehavior__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_textInputTraits");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  v4 = objc_msgSend(v12, "textSelectionBehavior");
  if ((v4 - 2) < 2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "beginningOfDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    if (v10)
      objc_msgSend(v11, "setSelectedTextRange:", v10);
    else
      objc_msgSend(v11, "setSelection:", 0, v3);

  }
  else
  {
    if (!v4)
    {
      v5 = *(void **)(a1 + 32);
      v6 = v3;
      goto LABEL_8;
    }
    if (v4 == 1)
    {
      v5 = *(void **)(a1 + 32);
      v6 = 0;
LABEL_8:
      objc_msgSend(v5, "setSelection:", v6, 0);
    }
  }

}

- (void)setSelection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id WeakRetained;

  length = a3.length;
  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor setSelectedTextRange:](self, "setSelectedTextRange:", v6);

}

- (void)setSelectedTextRange:(id)a3
{
  UITextField **p_textField;
  id v5;
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  p_textField = &self->_textField;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v7 = objc_msgSend(WeakRetained, "_isPasscodeStyle");

  if (v7)
  {
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "emptyTextRangeAtPosition:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[UIFieldEditor _textInputController](self, "_textInputController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelectedTextRange:", v11);

    if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
      -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
    -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionChanged");
  }
  else
  {
    -[UIFieldEditor _textInputController](self, "_textInputController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedTextRange:", v5);
  }

}

- (id)metadataDictionariesForDictationResults
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataDictionariesForDictationResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isFirstResponder
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v3 = objc_msgSend(WeakRetained, "isFirstResponder");

  return v3;
}

- (void)deactivateEditorDiscardingEdits:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSAttributedString *originalAttributedString;
  NSDictionary *originalDefaultAttributes;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_contentView);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("UITextSelectionDidScroll"), self);

      if (a3)
      {
        -[UIFieldEditor _textStorage](self, "_textStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDefaultAttributes:", self->_originalDefaultAttributes);

        -[UIFieldEditor _textStorage](self, "_textStorage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAttributedString:", self->_originalAttributedString);

      }
      originalAttributedString = self->_originalAttributedString;
      self->_originalAttributedString = 0;

      originalDefaultAttributes = self->_originalDefaultAttributes;
      self->_originalDefaultAttributes = 0;

      -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
      -[UIFieldEditor _deactivateSelectionView](self, "_deactivateSelectionView");
      -[UIFieldEditor _resetTypingAttributes](self, "_resetTypingAttributes");
      -[UIFieldEditor _inputController](self, "_inputController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didEndEditing");

      -[UIFieldEditor _handleObscuredTextAfterActivationChange](self, "_handleObscuredTextAfterActivationChange");
      v14 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v14, "setUserInteractionEnabled:", 0);

      objc_storeWeak((id *)&self->_contentView, 0);
      -[UIFieldEditor _applyCorrectTextContainerSize](self, "_applyCorrectTextContainerSize");
    }
  }
}

- (BOOL)_shouldIgnoreAutofillSave
{
  return 1;
}

- (id)_scrollAnimationEndedAction
{
  return self->_scrollAnimationEndedAction;
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[7];

  if (a3)
  {
    -[UIFieldEditor deleteBackward](self, "deleteBackward");
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__UIFieldEditor_UITextInputAdditions___deleteBackwardAndNotify___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    -[UIFieldEditor _performWhileSuppressingDelegateNotifications:](self, "_performWhileSuppressingDelegateNotifications:", v5);
  }
}

uint64_t __64__UIFieldEditor_UITextInputAdditions___deleteBackwardAndNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackward");
}

+ (id)sharedFieldEditor
{
  return 0;
}

+ (id)activeFieldEditor
{
  return 0;
}

- (UIFieldEditor)initWithFrame:(CGRect)a3
{
  return -[UIFieldEditor initWithTextField:](self, "initWithTextField:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSLayoutManager)layoutManager
{
  void *v3;
  void *v4;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  -[UIFieldEditor _textContainer](self, "_textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return (NSLayoutManager *)0;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UIFieldEditor.layoutManager should no longer be accessed", buf, 2u);
    }

  }
  else
  {
    v6 = layoutManager___s_category;
    if (!layoutManager___s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&layoutManager___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "UIFieldEditor.layoutManager should no longer be accessed", v11, 2u);
    }
  }
  -[UIFieldEditor _textContainer](self, "_textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLayoutManager *)v9;
}

- (BOOL)setUpClippingWithMaskForBounds:(CGRect)a3 contentFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  UITextField **p_textField;
  id WeakRetained;
  char v13;
  id v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  CGFloat v50;
  CGFloat v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.width;
  v9 = a3.origin.x;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v13 = objc_msgSend(WeakRetained, "clipsToBounds");

  if ((v13 & 1) != 0)
    return 0;
  v15 = objc_loadWeakRetained((id *)p_textField);
  objc_msgSend(v15, "bounds");
  v50 = x;
  v51 = width;
  v16 = v9;
  v18 = v17;
  v20 = v19;
  v21 = v8;
  v22 = height;
  v23 = y;
  v25 = v24;
  v27 = v26;
  v28 = objc_loadWeakRetained((id *)p_textField);
  v29 = v18;
  v30 = v16;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v28, v29, v20, v25, v27);
  v32 = v31;
  v34 = v33;

  v52.origin.x = v16;
  v52.origin.y = v32;
  v35 = v23;
  v36 = v22;
  v37 = v21;
  v52.size.width = v21;
  v52.size.height = v34;
  v54.origin.x = v50;
  v54.size.width = v51;
  v54.origin.y = v35;
  v54.size.height = v36;
  v38 = CGRectContainsRect(v52, v54);
  if (!v38)
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
    -[UIView layer](self, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "mask");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v40, "frame");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setMask:", v40);

      objc_msgSend(v40, "frame");
      if (!v40)
      {
LABEL_12:

        return !v38;
      }
    }
    v55.origin.x = v41;
    v55.origin.y = v42;
    v46 = v43;
    v47 = v44;
    v53.origin.x = v30;
    v53.origin.y = v35;
    v53.size.width = v37;
    v53.size.height = v36;
    v55.size.width = v46;
    v55.size.height = v47;
    if (!CGRectEqualToRect(v53, v55))
    {
      v48 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      if (v37 != v46 || v36 != v47)
      {
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, v37, v36, *(_QWORD *)&v50, *(_QWORD *)&v51);
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v40, "setPath:", objc_msgSend(v49, "CGPath"));

      }
      objc_msgSend(v40, "setFrame:", v30, v35, v37, v36, *(_QWORD *)&v50, *(_QWORD *)&v51);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v48);
    }
    goto LABEL_12;
  }
  return !v38;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  UITextField **p_textField;
  id WeakRetained;
  char v12;
  id v13;
  char v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_textField);
    v14 = objc_msgSend(v13, "keyboardInput:shouldInsertText:isMarkedText:", v8, v9, v5);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  UITextField **p_textField;
  id WeakRetained;
  char v13;
  id v14;
  char v15;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)p_textField);
    v15 = objc_msgSend(v14, "keyboardInput:shouldReplaceTextInRange:replacementText:", v9, location, length, v10);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4;
  UITextField **p_textField;
  id WeakRetained;
  char v7;
  id v8;
  char v9;

  v4 = a3;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_textField);
    v9 = objc_msgSend(v8, "keyboardInputShouldDelete:", v4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4;
  UITextField **p_textField;
  id WeakRetained;
  char v7;
  id v8;
  char v9;

  v4 = a3;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_textField);
    v9 = objc_msgSend(v8, "keyboardInputChanged:", v4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  UITextField **p_textField;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_textField);
    objc_msgSend(v7, "keyboardInputChangedSelection:", v8);

  }
}

- (void)textInputDidChange:(id)a3
{
  id WeakRetained;

  if ((*(_WORD *)&self->_feFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(WeakRetained, "fieldEditorDidChange:", self);

  }
}

- (void)textInputDidChangeSelection:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if ((*(_WORD *)&self->_feFlags & 0x10) == 0 && !-[UIAutoscroll active](self->_autoscroll, "active"))
    -[UIFieldEditor scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 0);
  if ((*(_WORD *)&self->_feFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(WeakRetained, "fieldEditorDidChangeSelection:", self);

  }
}

- (_NSRange)textInput:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id WeakRetained;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v11 = objc_msgSend(WeakRetained, "fieldEditor:willChangeSelectionFromCharacterRange:toCharacterRange:", self, v8, v7, location, length);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  UITextField **p_textField;
  id v9;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  p_textField = &self->_textField;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  LOBYTE(length) = objc_msgSend(WeakRetained, "fieldEditor:shouldInsertText:replacingRange:", self, v9, location, length);

  return length;
}

- (void)textInput:(id)a3 prepareAttributedTextForInsertion:(id)a4
{
  UITextField **p_textField;
  id v5;
  void *v6;
  id WeakRetained;

  p_textField = &self->_textField;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  objc_msgSend(v5, "mutableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_sanitizeText:", v6);
}

- (void)textInputWillAnimatePaste:(id)a3
{
  *(_WORD *)&self->_feFlags |= 0x80u;
}

- (void)textInputDidAnimatePaste:(id)a3
{
  *(_WORD *)&self->_feFlags &= ~0x80u;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  id WeakRetained;

  self->_padding = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

- (void)selectAll
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "selectAll");

}

- (id)_responderForBecomeFirstResponder
{
  return objc_loadWeakRetained((id *)&self->_textField);
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  objc_super v19;
  CGRect result;

  v4 = a3;
  -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dynamicCaretView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", v6);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)UIFieldEditor;
    -[UIView _responderExternalTouchRectForWindow:](&v19, sel__responderExternalTouchRectForWindow_, v4);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_textSelectingContainer
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (id)textInputTraits
{
  UITextField **p_textField;
  id WeakRetained;
  char v5;
  id v6;
  UIFieldEditor *v7;

  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_textField);
    objc_msgSend(v6, "textInputTraits");
    v7 = (UIFieldEditor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
    -[UIFieldEditor setToDefaultValues](v7, "setToDefaultValues");
  }
  return v7;
}

- (id)textColorForCaretSelection
{
  UITextField **p_textField;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_textField);
    objc_msgSend(v5, "textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  UIAutoscroll *v6;
  UIAutoscroll *autoscroll;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  float v20;
  UIFieldEditor *v21;
  CGRect v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  if (!self->_autoscroll)
  {
    v6 = objc_alloc_init(UIAutoscroll);
    autoscroll = self->_autoscroll;
    self->_autoscroll = v6;

  }
  v21 = self;
  -[UIFieldEditor _selectionClipRect](v21, "_selectionClipRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView contentSize](v21, "contentSize");
  v17 = v16;
  v18 = -[UIFieldEditor scrollXOffset](v21, "scrollXOffset");
  if (v18 >= 1)
  {
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    if (x < CGRectGetMinX(v22) + 16.0)
    {
      v19 = 1;
LABEL_9:
      -[UIAutoscroll startAutoscroll:scrollContainer:point:directions:repeatInterval:](self->_autoscroll, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", v21, v21, v19, x, y, 0.075);
      goto LABEL_13;
    }
  }
  v20 = v17 - v13;
  if ((float)v18 < v20)
  {
    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = v13;
    v23.size.height = v15;
    if (x > CGRectGetMaxX(v23) + -16.0)
    {
      v19 = 2;
      goto LABEL_9;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIFieldEditor autoscrollWillNotStart](v21, "autoscrollWillNotStart");
  -[UIFieldEditor cancelAutoscroll](v21, "cancelAutoscroll");
LABEL_13:

}

- (void)updateAutoscroll:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_textField);
    objc_msgSend(v6, "interactionAssistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[UIFieldEditor scrollXOffset](self, "scrollXOffset");
      v9 = -[UIFieldEditor scrollYOffset](self, "scrollYOffset");
      if ((unint64_t)objc_msgSend(v30, "count") > 4)
        v10 = 10;
      else
        v10 = (int)(1.0 / (double)(unint64_t)(6 - objc_msgSend(v30, "count")) * 10.0);
      v11 = objc_msgSend(v30, "directions");
      v12 = v11;
      if ((v11 & 1) != 0)
      {
        if ((int)v8 > 0)
        {
          v13 = 0;
          v8 = (v8 - v10);
          goto LABEL_18;
        }
        v13 = 0;
        if ((v11 & 0xFFFFFFFE) != 0)
          goto LABEL_18;
      }
      else
      {
        if ((v11 & 2) == 0)
        {
          v13 = 0;
          if (!v11)
            goto LABEL_16;
LABEL_18:
          -[UIFieldEditor setScrollXOffset:scrollYOffset:adjustForPurpleCaret:](self, "setScrollXOffset:scrollYOffset:adjustForPurpleCaret:", v8, v9, v13);
          objc_msgSend(v7, "setAutoscrolled:", 1);
          -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activeSelection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIFieldEditor textInputView](self, "textInputView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "autoscrollUntransformedExtentPoint");
          objc_msgSend(v20, "convertPoint:fromView:", 0);
          v22 = v21;
          v24 = v23;

          objc_msgSend(v19, "selectedRange");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEmpty");

          if (v26)
          {
            objc_msgSend(v19, "setSelectionWithPoint:", v22, v24);
            objc_msgSend(v19, "commit");
          }
          else
          {
            objc_msgSend(v19, "selectedRange");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "updateSelectionWithPoint:", v22, v24);

              -[UIFieldEditor interactionAssistant](self, "interactionAssistant");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "updateDisplayedSelection");

            }
          }

          goto LABEL_23;
        }
        v14 = objc_loadWeakRetained((id *)&self->_textField);
        objc_msgSend(v14, "bounds");
        objc_msgSend(v14, "editingRectForBounds:");
        v16 = v15;

        -[UIScrollView contentSize](self, "contentSize");
        v13 = 1;
        if (v17 - v16 > (double)(int)v8)
        {
          v8 = (v10 + v8);
          goto LABEL_18;
        }
        if ((v12 & 0xFFFFFFFD) != 0)
          goto LABEL_18;
      }
LABEL_16:
      -[UIFieldEditor cancelAutoscroll](self, "cancelAutoscroll");
LABEL_23:

      goto LABEL_24;
    }
  }
  -[UIFieldEditor cancelAutoscroll](self, "cancelAutoscroll");
LABEL_24:

}

- (void)cancelAutoscroll
{
  -[UIAutoscroll invalidate](self->_autoscroll, "invalidate");
}

- (CGRect)contentFrameForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_tvUpdateTextColor
{
  UITextField **p_textField;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  p_textField = &self->_textField;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_textField);
    objc_msgSend(v7, "visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultTextColorForKeyboardAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFieldEditor setTextColor:](self, "setTextColor:", v6);

  }
}

- (void)_setValue:(id)a3 forTextAttribute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKey:", v7, v6);
  objc_msgSend(v11, "setTypingAttributes:", v9);
  -[UIFieldEditor _textStorage](self, "_textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginEditing");
  objc_msgSend(v10, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v10, "length"));

  objc_msgSend(v10, "endEditing");
}

- (_NSRange)_unobscuredSecureRange
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unobscuredRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "characterRangeForTextRange:", v3);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4
{
  UITextField **p_textField;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_textField = &self->_textField;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_textField);
  objc_msgSend(WeakRetained, "_cuiCatalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(WeakRetained) = objc_msgSend(v7, "hasStylePresetWithName:", v5);
  if ((_DWORD)WeakRetained)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setTextColor:(id)a3
{
  -[UIFieldEditor _setValue:forTextAttribute:](self, "_setValue:forTextAttribute:", a3, *(_QWORD *)off_1E1678D98);
}

- (void)setFont:(id)a3
{
  -[UIFieldEditor _setValue:forTextAttribute:](self, "_setValue:forTextAttribute:", a3, *(_QWORD *)off_1E1678D90);
}

- (void)setTypingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTypingAttributes:", v4);

  -[UIFieldEditor _textContainer](self, "_textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributesForExtraLineFragment:", v4);

  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
}

- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  __CFString *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = (__CFString *)a4;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typingAttributes");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3778]);
  if (v9)
    v12 = v9;
  else
    v12 = &stru_1E16EDF20;
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v14);

  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", location, length, v13, v5);
  -[UIFieldEditor scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 0);

}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor text](self, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _setTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, objc_msgSend(v5, "length"), v4, 1);

}

- (void)setText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIFieldEditor text](self, "text");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _setTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, objc_msgSend(v7, "length"), v6, v4);

}

- (void)setTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  -[UIFieldEditor _setTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setTextInRange:replacementText:andSetCaretSelectionAfterText:", a3.location, a3.length, a4, 1);
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textRangeForCharacterRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)off_1E16790E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnnotationAttribute:value:forRange:", v9, v10, v8);

  objc_msgSend(v11, "boundingRectForCharacterRange:", location, length);
  -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

}

- (void)_setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  UIFieldEditor *WeakRetained;
  UIFieldEditor *v15;
  UIFieldEditor *v16;
  UIFieldEditor *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  UIFieldEditor *v34;
  NSUInteger v35;
  NSUInteger v36;
  _QWORD v37[4];
  id v38;
  NSUInteger v39;
  NSUInteger v40;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v31 = a4;
  -[UIFieldEditor attributedText](self, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedSubstringFromRange:", location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v31);

  if ((v11 & 1) == 0)
  {
    if (location)
    {
      v12 = 0;
    }
    else
    {
      -[UIFieldEditor _textStorage](self, "_textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = length == objc_msgSend(v13, "length");

    }
    WeakRetained = (UIFieldEditor *)objc_loadWeakRetained((id *)&self->_textField);
    v15 = WeakRetained;
    if (WeakRetained)
      v16 = WeakRetained;
    else
      v16 = self;
    v17 = v16;

    -[UIFieldEditor inputDelegate](self, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textWillChange:", v17);
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    if (!v12)
    {

      if (v20 < location + length)
        goto LABEL_14;
      -[UIFieldEditor _textStorage](self, "_textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      -[UIFieldEditor _textStorage](self, "_textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "length");
      if (v22 > location)
      {
        v20 = v23 - location;
      }
      else
      {
        location = v23;
        v20 = 0;
      }
    }

    length = v20;
LABEL_14:
    -[UIFieldEditor _textInputController](self, "_textInputController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke;
    v37[3] = &unk_1E16E61C0;
    v39 = location;
    v40 = length;
    v27 = v31;
    v38 = v27;
    objc_msgSend(v25, "coordinateEditing:", v37);

    if (v27)
    {
      if (!v5)
      {
LABEL_17:
        objc_msgSend(v18, "textDidChange:", v17);
        v29 = *(_QWORD *)off_1E16790E0;
        v30 = objc_msgSend(v27, "length");
        v32[0] = v26;
        v32[1] = 3221225472;
        v32[2] = __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke_2;
        v32[3] = &unk_1E16E61E8;
        v35 = location;
        v36 = length;
        v33 = v27;
        v34 = self;
        v31 = v33;
        objc_msgSend(v33, "enumerateAttribute:inRange:options:usingBlock:", v29, 0, v30, 0, v32);

        goto LABEL_18;
      }
    }
    else
    {
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
      if (!v5)
        goto LABEL_17;
    }
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSelectedRange:", objc_msgSend(v28, "length"), 0);

    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], a1[4]);
}

uint64_t __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  unsigned int v7;

  if (a2)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 48);
    v4 = *(void **)(result + 32);
    v5 = a2;
    v6 = objc_msgSend(v4, "length");
    v7 = objc_msgSend(v5, "isLowConfidence");

    return objc_msgSend(*(id *)(v2 + 40), "addTextAlternativesDisplayStyle:toRange:", v7, v3, v6);
  }
  return result;
}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor attributedText](self, "attributedText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, objc_msgSend(v5, "length"), v4, 1);

}

- (void)setAttributedText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIFieldEditor attributedText](self, "attributedText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, objc_msgSend(v7, "length"), v6, v4);

}

- (void)setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", a3.location, a3.length, a4, 1);
}

- (int)scrollXOffset
{
  double v2;

  -[UIScrollView contentOffset](self, "contentOffset");
  return (int)v2;
}

- (int)scrollYOffset
{
  double v2;

  -[UIScrollView contentOffset](self, "contentOffset");
  return (int)v2;
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4
{
  -[UIFieldEditor setScrollXOffset:scrollYOffset:adjustForPurpleCaret:](self, "setScrollXOffset:scrollYOffset:adjustForPurpleCaret:", *(_QWORD *)&a3, *(_QWORD *)&a4, 1);
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForPurpleCaret:(BOOL)a5
{
  -[UIFieldEditor setContentOffset:](self, "setContentOffset:", (double)a3, (double)a4);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)hasMarkedText
{
  return 0;
}

- (void)_performWhileSuppressingDelegateNotifications:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_performWhileSuppressingDelegateNotifications:", v4);

}

+ (id)excludedElementsForHTML
{
  if (qword_1ECD7ADD0 != -1)
    dispatch_once(&qword_1ECD7ADD0, &__block_literal_global_568);
  return (id)_MergedGlobals_9_8;
}

void __40__UIFieldEditor_excludedElementsForHTML__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("P"), CFSTR("STYLE"), CFSTR("HTML"), CFSTR("APPLET"), CFSTR("OBJECT"), CFSTR("BASEFONT"), CFSTR("CENTER"), CFSTR("DIR"), CFSTR("FONT"), CFSTR("ISINDEX"), CFSTR("MENU"), CFSTR("S"), CFSTR("XML"), CFSTR("BODY"), CFSTR("HEAD"), CFSTR("META"), 0);
  v1 = (void *)_MergedGlobals_9_8;
  _MergedGlobals_9_8 = v0;

}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(id, _BOOL8);

  v4 = a4;
  -[UIFieldEditor _scrollAnimationEndedAction](self, "_scrollAnimationEndedAction", a3);
  v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIFieldEditor _setScrollAnimationEndedAction:](self, "_setScrollAnimationEndedAction:", 0);
    v6[2](v6, v4);
  }

}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  if ((*(_WORD *)&self->_feFlags & 0x80) == 0)
  {
    v4 = a4;
    y = a3.y;
    x = a3.x;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (x != v9 || y != v8)
    {
      v11.receiver = self;
      v11.super_class = (Class)UIFieldEditor;
      -[UIScrollView setContentOffset:animated:](&v11, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)nonEditingLinebreakMode
{
  void *v2;
  int64_t v3;

  -[UIFieldEditor _textStorage](self, "_textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lineBreakMode");

  return v3;
}

- (void)setNonEditingLinebreakMode:(int64_t)a3
{
  id v4;

  -[UIFieldEditor _textStorage](self, "_textStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", a3);

}

- (double)_passcodeStyleAlpha
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "_passcodeStyleAlpha");
  v4 = v3;

  return v4;
}

- (BOOL)_clearOnEditIfNeeded
{
  $C662668F73BD8D46A89588BCE30BB128 feFlags;
  void *v4;

  feFlags = self->_feFlags;
  if ((*(_BYTE *)&feFlags & 0x20) != 0)
  {
    -[UIFieldEditor _textInputController](self, "_textInputController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasText"))
      objc_msgSend(v4, "clearText");
    *(_WORD *)&self->_feFlags &= ~0x20u;

  }
  return (*(unsigned int *)&feFlags >> 5) & 1;
}

- (void)_handleObscuredTextInputIfNecessaryWithEditingBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSRange v13;
  __CFString *v14;
  CFRange RangeOfComposedCharactersAtIndex;
  id v16;
  NSRange v17;
  NSRange v18;

  v4 = (void (**)(id, id))a3;
  if (!-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
  {
    -[UIFieldEditor _textInputController](self, "_textInputController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);

    goto LABEL_8;
  }
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetFontForExtraBulletRendering");

  -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  v9 = v8;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "selectedRange");

  if (!-[UIFieldEditor _shouldObscureNextInput](self, "_shouldObscureNextInput"))
  {
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v18.length = objc_msgSend(v16, "length");
    v17.location = v7 + v9;
    v17.length = v12 - (v7 + v9);
    v18.location = 0;
    v13 = NSIntersectionRange(v17, v18);
    if (v13.length)
    {
      if (-[UIFieldEditor isFirstResponder](self, "isFirstResponder"))
      {
        objc_msgSend(v16, "string");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v14, v13.length + v13.location - 1);

        if (RangeOfComposedCharactersAtIndex.length)
        {
          -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", RangeOfComposedCharactersAtIndex.location, RangeOfComposedCharactersAtIndex.length, 1);
LABEL_8:

          return;
        }
      }
    }

  }
  -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
  if (-[UIFieldEditor _shouldObscureNextInput](self, "_shouldObscureNextInput"))
    -[UIFieldEditor set_shouldObscureNextInput:](self, "set_shouldObscureNextInput:", 0);
}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  int v7;
  void *v8;
  UITextField **p_textField;
  id v10;
  char v11;
  id v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSUInteger v19;
  NSUInteger v20;
  _QWORD v21[4];
  id v22;
  _NSRange result;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("\n"));
  if ((*(_WORD *)&self->_feFlags & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    v7 = objc_msgSend(WeakRetained, "fieldEditor:shouldReplaceWithText:", self, v4);

    if (v7)
    {
      -[UIFieldEditor text](self, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFieldEditor setSelection:](self, "setSelection:", 0, objc_msgSend(v8, "length"));

    }
  }
  if (v5)
  {
    p_textField = &self->_textField;
    v10 = objc_loadWeakRetained((id *)p_textField);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)p_textField);
      objc_msgSend(v12, "_sendActionsForEvents:withEvent:", 0x80000, 0);

    }
    v13 = objc_loadWeakRetained((id *)p_textField);
    v14 = objc_msgSend(v13, "_shouldResignOnEditingDidEndOnExit");

    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)p_textField);
      objc_msgSend(v15, "resignFirstResponder");

    }
    v16 = 0;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[UIFieldEditor _clearOnEditIfNeeded](self, "_clearOnEditIfNeeded");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __36__UIFieldEditor_insertFilteredText___block_invoke;
    v21[3] = &unk_1E16E6210;
    v18 = v4;
    v22 = v18;
    -[UIFieldEditor _handleObscuredTextInputIfNecessaryWithEditingBlock:](self, "_handleObscuredTextInputIfNecessaryWithEditingBlock:", v21);
    v16 = objc_msgSend(v18, "length");

    v17 = 0;
  }

  v19 = v17;
  v20 = v16;
  result.length = v20;
  result.location = v19;
  return result;
}

uint64_t __36__UIFieldEditor_insertFilteredText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertText:", *(_QWORD *)(a1 + 32));
}

- (void)_unobscureTextInRange:(_NSRange)a3 settingTimerToReobscure:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  void *v8;
  NSRange v9;
  void *v10;
  NSTimer *v11;
  NSTimer *obscureAllTextTimer;
  id v13;
  NSRange v14;
  NSRange v15;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  -[UIFieldEditor _textStorage](self, "_textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.length = objc_msgSend(v8, "length");
  v14.location = location;
  v14.length = length;
  v15.location = 0;
  v9 = NSIntersectionRange(v14, v15);

  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textRangeForCharacterRange:", v9.location, v9.length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnobscuredRange:", v10);
  objc_msgSend(v13, "invalidateLayoutForRange:", v10);
  if (v4)
  {
    -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__obscureAllText, 0, 0, 2.0);
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    obscureAllTextTimer = self->_obscureAllTextTimer;
    self->_obscureAllTextTimer = v11;

  }
  -[UIFieldEditor _setNeedsInvalidateAfterObscuredRangeChange](self, "_setNeedsInvalidateAfterObscuredRangeChange");

}

- (void)_ephemerallyUnobscureCharacterAtIndex:(unint64_t)a3
{
  __CFString *v5;
  CFRange RangeOfComposedCharactersAtIndex;
  id v7;

  -[UIFieldEditor _textStorage](self, "_textStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "string");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v5, a3);

    if (RangeOfComposedCharactersAtIndex.length >= 1)
      -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", RangeOfComposedCharactersAtIndex.location, RangeOfComposedCharactersAtIndex.length, 1);
  }

}

- (void)_ephemerallyUnobscureTextInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", location, length, 1);

  }
}

- (void)_obscureAllText
{
  void *v3;

  -[UIFieldEditor _cancelObscureAllTextTimer](self, "_cancelObscureAllTextTimer");
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnobscuredRange:", 0);

  -[UIFieldEditor _setNeedsInvalidateAfterObscuredRangeChange](self, "_setNeedsInvalidateAfterObscuredRangeChange");
}

- (void)deleteBackward
{
  void *v3;

  if (!-[UIFieldEditor _clearOnEditIfNeeded](self, "_clearOnEditIfNeeded"))
  {
    -[UIFieldEditor _textInputController](self, "_textInputController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteBackward");

  }
  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
}

- (void)insertAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertAttributedText:", v4);

}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedTextInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRange:withText:", v7, v6);

}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRange:withAttributedText:", v7, v6);

}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__UIFieldEditor_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke;
  v10[3] = &unk_1E16E6238;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[UIFieldEditor _handleObscuredTextInputIfNecessaryWithEditingBlock:](self, "_handleObscuredTextInputIfNecessaryWithEditingBlock:", v10);

}

uint64_t __74__UIFieldEditor_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceRangeWithTextWithoutClosingTyping:replacementText:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)clearText
{
  id v2;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearText");

}

- (NSDictionary)markedTextStyle
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UIFieldEditor markedTextRange](self, "markedTextRange");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[UIFieldEditor markedTextRange](self, "markedTextRange"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEmpty"),
        v10,
        v9,
        v11))
  {
    -[UIFieldEditor _clearOnEditIfNeeded](self, "_clearOnEditIfNeeded");
  }
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMarkedText:selectedRange:", v7, location, length);

  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedMarkedText:selectedRange:", v7, location, length);

  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
}

- (void)unmarkText
{
  id v2;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unmarkText");

}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "positionFromPosition:inDirection:offset:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionWithinRange:farthestInDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characterRangeByExtendingPosition:inDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  v11 = a5;
  v12 = a3;
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v12, v11, a6, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "baseWritingDirectionForPosition:inDirection:", v6, a4);

  return v8;
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstRectForRange:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestPositionToPoint:withinRange:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterRangeAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEditing
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  v3 = objc_msgSend(WeakRetained, "isFirstResponder");

  return v3;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__UIFieldEditor_insertDictationResult_withCorrectionIdentifier___block_invoke;
  v10[3] = &unk_1E16E6238;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[UIFieldEditor _handleObscuredTextInputIfNecessaryWithEditingBlock:](self, "_handleObscuredTextInputIfNecessaryWithEditingBlock:", v10);

}

uint64_t __64__UIFieldEditor_insertDictationResult_withCorrectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertDictationResult:withCorrectionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)insertDictationResultPlaceholder
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertDictationResultPlaceholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameForDictationResultPlaceholder:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDictationResultPlaceholder:willInsertResult:", v6, v4);

}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertTextPlaceholderWithSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTextPlaceholder:", v4);

}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangeWithTextAlternatives:atPosition:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)beginSelectionChange
{
  id v2;

  *(_WORD *)&self->_feFlags |= 0x10u;
  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginSelectionChange");

}

- (void)endSelectionChange
{
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSelectionChange");

  *(_WORD *)&self->_feFlags &= ~0x10u;
}

- (unint64_t)layoutManager:(id)a3 shouldGenerateGlyphs:(const unsigned __int16 *)a4 properties:(const int64_t *)a5 characterIndexes:(const unint64_t *)a6 font:(id)a7 forGlyphRange:(_NSRange)a8
{
  id v13;
  id v14;
  void *v15;
  id WeakRetained;
  int v17;
  const unsigned __int16 *v18;
  const int64_t *v19;
  const unint64_t *v20;
  unint64_t obscuredSecureLength;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  int64_t v27;
  void *v28;
  id v30;

  v13 = a3;
  v14 = a7;
  -[UIFieldEditor _textInputTraits](self, "_textInputTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isSecureTextEntry"))
  {
    if ((objc_msgSend(v15, "displaySecureEditsUsingPlainText") & 1) != 0
      || (WeakRetained = objc_loadWeakRetained((id *)&self->_textField),
          v17 = objc_msgSend(WeakRetained, "_shouldUnobscureTextWithContentCover"),
          WeakRetained,
          v17))
    {
      v30 = v14;
      v18 = a4;
      v19 = a5;
      v20 = a6;
      obscuredSecureLength = self->_obscuredSecureLength;
      v22 = v13;
      objc_msgSend(v13, "textStorage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length") - self->_obscuredSecureLength;
LABEL_7:

      a6 = v20;
      a5 = v19;
      a4 = v18;
      v14 = v30;
      v13 = v22;
      goto LABEL_9;
    }
  }
  if (-[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput"))
  {
    v22 = v13;
    v30 = v14;
    v18 = a4;
    v19 = a5;
    v20 = a6;
    -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unobscuredRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    obscuredSecureLength = objc_msgSend(v23, "characterRangeForTextRange:", v25);
    v24 = v26;

    goto LABEL_7;
  }
  v24 = 0;
  obscuredSecureLength = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
  if (obscuredSecureLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0;
  }
  else
  {
    v27 = objc_msgSend(v13, "_generateBulletGlyphs:properties:characterIndexes:font:forGlyphRange:unobscuredRange:", a4, a5, a6, v14, a8.location, a8.length, obscuredSecureLength, v24);
    if (v27 >= 1)
    {
      -[UIFieldEditor _textInputController](self, "_textInputController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_selectionGeometryChanged");

    }
  }

  return v27;
}

- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v8 = a3;
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unobscuredRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "characterRangeForTextRange:", v10);
  v13 = v12;

  if (a4 == 1)
  {
    if (a5 < v11 || a5 - v11 >= v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", a5));

      if (v17)
        a4 = 1;
      else
        a4 = 2;
    }
    else
    {
      a4 = 1;
    }
  }

  return a4;
}

- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v10 = a3;
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unobscuredRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "characterRangeForTextRange:", v12);
  v15 = v14;

  objc_msgSend(v10, "_boundingBoxForBulletAtCharIndex:inUnobscuredRange:", a8, v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  if (a4)
    objc_msgSend(a3, "_completeBulletRenderingForTextContainer:", a4);
}

- (CGRect)visibleRect
{
  void *v2;
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
  CGRect result;

  -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIEdgeInsets)textContainerInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UIFieldEditor textContainerOriginForTextAlignment:](self, "textContainerOriginForTextAlignment:", 0);
  v3 = v2;
  v5 = v4;
  v6 = v3;
  v7 = v5;
  result.right = v3;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)setConstrainedFrameSize:(CGSize)a3
{
  void *v4;

  self->_desiredContentWidth = ceil(a3.width);
  -[UIFieldEditor _textCanvasView](self, "_textCanvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)minSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)isHorizontallyResizable
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsDisplayInRect:", x, y, width, height);

}

- (id)linkTextAttributes
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "linkTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributedSubstringForMarkedRange
{
  void *v2;
  void *v3;

  -[UIFieldEditor _textInputController](self, "_textInputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedSubstringForMarkedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  __int16 feFlags;
  id WeakRetained;

  v3 = a3;
  -[UIFieldEditor _textInputTraits](self, "_textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecureTextEntry:", v3);

  v6 = -[UIFieldEditor _shouldObscureInput](self, "_shouldObscureInput");
  feFlags = (__int16)self->_feFlags;
  if (v6)
  {
    *(_WORD *)&self->_feFlags = feFlags | 0x20;
    -[UIFieldEditor _obscureAllText](self, "_obscureAllText");
  }
  else
  {
    *(_WORD *)&self->_feFlags = feFlags & 0xFFDF;
    -[UIFieldEditor _unobscureAllText](self, "_unobscureAllText");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsDisplay");

  -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UIFieldEditor _textInputTraits](self, "_textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplaySecureEditsUsingPlainText:", v3);

  if (v3)
  {
    -[UIFieldEditor _textStorage](self, "_textStorage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    self->_obscuredSecureLength = objc_msgSend(v6, "length");

  }
  else
  {
    *(_WORD *)&self->_feFlags &= ~0x20u;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[UIFieldEditor _textInputTraits](self, "_textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIFieldEditor;
    -[UIFieldEditor forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)allowsAttachments
{
  return self->_allowsAttachments;
}

- (void)setAllowsAttachments:(BOOL)a3
{
  self->_allowsAttachments = a3;
}

- (void)_setScrollAnimationEndedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2264);
}

- (CGPoint)autoscrollContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_autoscrollContentOffset.x;
  y = self->_autoscrollContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAutoscrollContentOffset:(CGPoint)a3
{
  self->_autoscrollContentOffset = a3;
}

- (BOOL)_shouldObscureNextInput
{
  return self->__shouldObscureNextInput;
}

- (void)set_shouldObscureNextInput:(BOOL)a3
{
  self->__shouldObscureNextInput = a3;
}

@end
