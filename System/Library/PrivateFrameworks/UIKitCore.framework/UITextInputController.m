@implementation UITextInputController

- (UITextPosition)endOfDocument
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (_NSRange)_selectedRange
{
  id WeakRetained;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v4 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", self->_selectedTextRange);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

void __37__UITextInputController_textInRange___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  objc_msgSend(a2, "string");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v4);

  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  v7 = objc_msgSend(v6, "characterRangeForTextRange:", *(_QWORD *)(a1 + 40));
  v9 = v8;

  if ((int)v7 < 0)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10 + v7;
  if ((v11 & 0x80000000) != 0)
    v12 = 0;
  else
    v12 = v11;
  if (v12 > objc_msgSend(v24, "length"))
    v12 = objc_msgSend(v24, "length");
  if (v12 + v9 > objc_msgSend(v24, "length"))
    v9 = objc_msgSend(v24, "length") - v12;
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (v13
    && (objc_msgSend(v13, "attachment"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "attachmentRange"),
        v17 = v16,
        v14,
        v15 + v17 < (unint64_t)objc_msgSend(v24, "length")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 65532);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v15, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  v25 = v20;
  objc_msgSend(v20, "substringWithRange:", v12, v9);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

- (UITextRange)selectedTextRange
{
  id WeakRetained;
  UITextRange *v4;

  if (self->_markedTextRange.length)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", self->_markedTextSelection.location + self->_markedTextRange.location, self->_markedTextSelection.length);
    v4 = (UITextRange *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_selectedTextRange;
  }
  return v4;
}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__207;
  v16 = __Block_byref_object_dispose__207;
  v17 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__UITextInputController_textInRange___block_invoke;
  v9[3] = &unk_1E16E6738;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "coordinateReading:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_textStorage
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  _UITextLayoutController **p_textLayoutController;
  id v6;
  id v7;
  id WeakRetained;
  int64_t v9;

  p_textLayoutController = &self->_textLayoutController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  v9 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v7, v6);

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  _UITextLayoutController **p_textLayoutController;
  id v6;
  id WeakRetained;
  void *v8;

  p_textLayoutController = &self->_textLayoutController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  _UITextLayoutController **p_textLayoutController;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_textLayoutController = &self->_textLayoutController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (void)setDelegate:(id)a3
{
  UITextInputControllerDelegate **p_delegate;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  int v17;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFD | v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 64;
  else
    v7 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFBF | v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFB | v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFF7 | v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 16;
  else
    v10 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFEF | v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 128;
  else
    v11 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFF7F | v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 1024;
  else
    v12 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFBFF | v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = 512;
  else
    v13 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFDFF | v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 2048;
  else
    v14 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFF7FF | v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = 4096;
  else
    v15 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFEFFF | v15);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
    v17 = 256;
  else
    v17 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFEFF | v17);
}

- (_NSRange)markedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_markedTextRange.length;
  location = self->_markedTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldConsiderTextViewForGeometry:", v3);

  return v4;
}

- (BOOL)_shouldConsiderTextViewForGeometry:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isHiddenOrHasHiddenAncestor") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    objc_msgSend(WeakRetained, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 == v9;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_addToTypingAttributes:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[UITextInputController typingAttributes](self, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setValue:forKey:", v6, v7);
  -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", v9);

}

- (NSDictionary)typingAttributes
{
  UITextPlaceholder *textPlaceholder;
  void *v4;
  void *v5;
  NSDictionary *typingAttributes;
  uint64_t v8;
  uint64_t v9;

  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    -[UITextPlaceholder attachment](textPlaceholder, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typingAttributesBeforeInsertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", v5);

  }
  else
  {
    typingAttributes = self->_typingAttributes;
    if (typingAttributes)
      return typingAttributes;
    v8 = -[UITextInputController _selectedRange](self, "_selectedRange");
    -[UITextInputController _attributesForReplacementInRange:](self, "_attributesForReplacementInRange:", v8, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", v4);
  }

  typingAttributes = self->_typingAttributes;
  return typingAttributes;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_textInputTraits);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextInputController;
    -[UITextInputController forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)_textInputTraits
{
  return self->_textInputTraits;
}

- (UITextInputController)initWithTextLayoutController:(id)a3
{
  id v5;
  UITextInputController *v6;
  uint64_t v7;
  UITextInputTraits *textInputTraits;
  void *v9;
  uint64_t v10;
  void *v11;
  NSDictionary *markedTextStyle;
  void *v13;
  uint64_t v14;
  UITextRange *selectedTextRange;
  UITextCheckingController *v16;
  UITextCheckingController *textCheckingController;
  void *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UITextInputController;
  v6 = -[UITextInputController init](&v20, sel_init);
  if (v6)
  {
    +[UITextInputTraits defaultTextInputTraits](UITextInputTraits, "defaultTextInputTraits");
    v7 = objc_claimAutoreleasedReturnValue();
    textInputTraits = v6->_textInputTraits;
    v6->_textInputTraits = (UITextInputTraits *)v7;

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UITextInputController.m"), 340, CFSTR("UITextInputController requires a text layout controller!"));

    }
    -[UITextInputController setTextLayoutController:](v6, "setTextLayoutController:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)off_1E16791A8;
    objc_msgSend(v5, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__textStorageDidProcessEditing_, v10, v11);

    v6->_markedTextRange = (_NSRange)xmmword_186679030;
    markedTextStyle = v6->_markedTextStyle;
    v6->_markedTextStyle = 0;

    objc_msgSend(v5, "beginningOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emptyTextRangeAtPosition:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    selectedTextRange = v6->_selectedTextRange;
    v6->_selectedTextRange = (UITextRange *)v14;

    -[UITextInputController _updateFirstTextView](v6, "_updateFirstTextView");
    -[UITextInputController _updateEmptyStringAttributes](v6, "_updateEmptyStringAttributes");
    v6->_currentUndoGroupType = 0;
    v16 = -[UITextCheckingController initWithClient:]([UITextCheckingController alloc], "initWithClient:", v6);
    textCheckingController = v6->_textCheckingController;
    v6->_textCheckingController = v16;

  }
  return v6;
}

- (void)setTextLayoutController:(id)a3
{
  void *v5;
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UITextInputController *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;

  obj = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_textLayoutController = &self->_textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    if ((objc_msgSend(v8, "canAccessLayoutManager") & 1) != 0 || (objc_msgSend(obj, "canAccessLayoutManager") & 1) == 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v9, "textStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
      {
LABEL_7:
        objc_msgSend(v5, "removeObserver:name:object:", self, *(_QWORD *)off_1E167E218, 0);
        objc_storeWeak((id *)&self->_layoutManager, 0);
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputController.m"), 369, CFSTR("Cannot change the text storage after view is created"));
    }

    goto LABEL_7;
  }
LABEL_8:
  v12 = self;
  v13 = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(v13, "detachFromTextInputController");

  v14 = objc_storeWeak((id *)p_textLayoutController, obj);
  objc_msgSend(obj, "adoptTextInputController:", v12);

  if (objc_msgSend(obj, "canAccessLayoutManager"))
  {
    objc_msgSend(obj, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_layoutManager, v15);

    v16 = *(_QWORD *)off_1E167E218;
    v17 = objc_loadWeakRetained((id *)&v12->_layoutManager);
    objc_msgSend(v5, "addObserver:selector:name:object:", v12, sel__textContainerDidChangeView_, v16, v17);

  }
  -[UITextInputController _updateFirstTextView](v12, "_updateFirstTextView");
  -[UITextInputController _updateEmptyStringAttributes](v12, "_updateEmptyStringAttributes");

}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  void *v21;
  id v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  NSRange v44;
  CGRect v45;
  CGRect result;

  v4 = a3;
  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "editedRange");
  v8 = v7;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UITextPlaceholder attachment](self->_textPlaceholder, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(WeakRetained, "insertionRectForPosition:typingAttributes:placeholderAttachment:textContainer:", v4, v11, v9, &v43);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v43;

    v45.origin.x = v13;
    v45.origin.y = v15;
    v45.size.width = v17;
    v45.size.height = v19;
    if (CGRectIsNull(v45))
    {
      v13 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    }
    objc_msgSend(v20, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)&self->_tiFlags & 0x80) == 0
      || (v22 = objc_loadWeakRetained((id *)&self->_delegate),
          v23 = objc_msgSend(v22, "textInputShouldExtendCaretHeight:", self),
          v22,
          v23))
    {
      v15 = v15 + -1.0;
      UIRoundToViewScale(v21);
      v24 = v25 + 1.0;
    }
    objc_msgSend(v20, "textContainerOrigin", v24);
    v27 = v13 + v26;
    v29 = v15 + v28;
    objc_msgSend(v21, "_currentScreenScale");
    v31 = UIPointRoundToScale(v27, v29, v30);
    v33 = v32;
    UICeilToViewScale(v21);
    v35 = v34;
    UICeilToViewScale(v21);
    v37 = v36;
    if (v31 < 0.0)
      v31 = 0.0;

  }
  else
  {
    v31 = *MEMORY[0x1E0C9D628];
    v33 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v35 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v37 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v44.location = v6;
    v44.length = v8;
    NSStringFromRange(v44);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("requesting caretRectForPosition: while the NSTextStorage has oustanding changes %@"), v38);

  }
  v39 = v31;
  v40 = v33;
  v41 = v35;
  v42 = v37;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (void)_updateEmptyStringAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[UITextInputController _textStorage](self, "_textStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!objc_msgSend(v4, "count"))
      goto LABEL_10;
  }
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)off_1E16790E0);
  -[UITextInputController _setEmptyStringAttributes:](self, "_setEmptyStringAttributes:", v4);
  v5 = objc_msgSend(v7, "length");
  if (v4 && !v5)
    -[UITextInputController _invalidateTypingAttributes](self, "_invalidateTypingAttributes");
LABEL_10:

}

- (void)setTypingAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)_setEmptyStringAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)_invalidateTypingAttributes
{
  -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", 0);
}

- (void)_updateFirstTextView
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  UITextInputController *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v6)
  {

    v8 = 0;
LABEL_38:
    v8 = v8;
    v9 = v8;
    goto LABEL_39;
  }
  v7 = v6;
  v36 = self;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v46;
  v37 = *(_QWORD *)v46;
  v38 = v5;
  do
  {
    v11 = 0;
    v40 = v7;
    do
    {
      v12 = v8;
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v11), "textView", v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "superview");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      if (v12)
        v15 = v12;
      else
        v15 = v13;
      v8 = v15;

      objc_msgSend(v13, "bounds");
      objc_msgSend(v13, "convertRect:toView:", 0);
      if (!CGRectIsEmpty(v51))
      {
        v42 = v8;
        objc_msgSend(v13, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v39, "addObject:", v13);
          if (objc_msgSend(v3, "count"))
          {
            objc_msgSend(v3, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "superview");
            v18 = objc_claimAutoreleasedReturnValue();
            v41 = v9;
            if (v18)
            {
              v19 = (void *)v18;
              v20 = 0;
              while (1)
              {
                v21 = objc_msgSend(v3, "containsObject:", v19);
                v22 = v19;
                if (v21)
                  break;

                objc_msgSend(v22, "superview");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                v20 = v22;
                if (!v19)
                {
                  v20 = v22;
                  goto LABEL_23;
                }
              }

              v17 = v22;
            }
            else
            {
              v20 = 0;
LABEL_23:
              v22 = 0;
            }
            objc_msgSend(v17, "subviews");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "indexOfObjectIdenticalTo:", v20);

            objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "indexOfObject:", v17) - 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "subviews");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "indexOfObjectIdenticalTo:", v28);

            if (v27 <= v30)
            {
              v9 = v41;
              v5 = v38;
            }
            else
            {
              objc_msgSend(v3, "removeAllObjects");
              v31 = v13;

              objc_msgSend(v3, "addObject:", v31);
              objc_msgSend(v31, "superview");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v5 = v38;
              if (v32)
              {
                do
                {
                  objc_msgSend(v3, "addObject:", v32);
                  objc_msgSend(v32, "superview");
                  v33 = objc_claimAutoreleasedReturnValue();

                  v32 = (void *)v33;
                }
                while (v33);
              }
              v9 = v31;

              v22 = 0;
            }

            v10 = v37;
          }
          else
          {
            v23 = v13;
            objc_msgSend(v3, "addObject:", v23);
            objc_msgSend(v23, "superview");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              do
              {
                objc_msgSend(v3, "addObject:", v24);
                objc_msgSend(v24, "superview");
                v25 = objc_claimAutoreleasedReturnValue();

                v24 = (void *)v25;
              }
              while (v25);
            }
            v17 = v9;
            v9 = v23;
          }

          v7 = v40;
        }
        v8 = v42;
      }

      ++v11;
    }
    while (v11 != v7);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  }
  while (v7);

  self = v36;
  if (!v9)
    goto LABEL_38;
LABEL_39:

  v34 = objc_loadWeakRetained((id *)&self->_firstTextView);
  if (v34 != v9)
  {
    objc_storeWeak((id *)&self->_firstTextView, v9);
    v35 = -[UITextInputController _pasteController](self, "_pasteController");
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __45__UITextInputController__updateFirstTextView__block_invoke;
    v43[3] = &unk_1E16B1B28;
    v44 = v9;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v43);

  }
}

- (id)_pasteController
{
  UITextInput **p_firstTextView;
  id WeakRetained;
  id v4;
  UITextPasteController *v5;
  id v6;
  int v7;
  UITextPasteController *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  UITextPasteController *v13;
  void *v14;
  id v15;

  p_firstTextView = &self->_firstTextView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);

  if (!WeakRetained)
    goto LABEL_9;
  v4 = objc_loadWeakRetained((id *)p_firstTextView);
  objc_getAssociatedObject(v4, sel__pasteController);
  v5 = (UITextPasteController *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return v5;
  v6 = objc_loadWeakRetained((id *)p_firstTextView);
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE232F0);

  if (v7)
  {
    v8 = [UITextPasteController alloc];
    v9 = objc_loadWeakRetained((id *)p_firstTextView);
    v5 = -[UITextPasteController initWithSupportingView:](v8, "initWithSupportingView:", v9);
    goto LABEL_7;
  }
  v10 = objc_loadWeakRetained((id *)p_firstTextView);
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EDE232F0);

  if (!v12)
  {
LABEL_9:
    v5 = 0;
    return v5;
  }
  v13 = [UITextPasteController alloc];
  v9 = objc_loadWeakRetained((id *)p_firstTextView);
  objc_msgSend(v9, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITextPasteController initWithSupportingView:](v13, "initWithSupportingView:", v14);

LABEL_7:
  if (v5)
  {
    v15 = objc_loadWeakRetained((id *)p_firstTextView);
    objc_setAssociatedObject(v15, sel__pasteController, v5, (void *)1);

  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextInputController;
  if (-[UITextInputController respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3);
}

void __55__UITextInputController__textStorageDidProcessEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v6 = v5;
  if (objc_msgSend(v3, "length") && v4 + v6 >= objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "length") - 1;
    v6 = 1;
  }
  if (v4 < objc_msgSend(v3, "length"))
  {
    v14 = 0;
    v15 = 0;
    if (v6)
      objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", v4, &v14, v4, v6);
    else
      objc_msgSend(v3, "attributesAtIndex:effectiveRange:", v4, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
    objc_msgSend(WeakRetained, "keyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textFormattingCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v15 + v14;
    v12 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    objc_msgSend(v10, "setSelectedAttributes:isMultiple:", v7, v11 < v12 + v13);

  }
}

- (_NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger v3;
  _NSRange result;

  if (self->_markedTextRange.length)
  {
    length = self->_markedTextSelection.length;
    v3 = self->_markedTextSelection.location + self->_markedTextRange.location;
  }
  else
  {
    v3 = -[UITextInputController _selectedRange](self, "_selectedRange");
  }
  result.length = length;
  result.location = v3;
  return result;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  self->_continuousSpellCheckingEnabled = a3;
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

- (BOOL)_hasDictationPlaceholder
{
  return self->_textPlaceholder != 0;
}

- (void)_selectionGeometryChanged
{
  id v3;

  if (-[UITextInputController _mightHaveSelection](self, "_mightHaveSelection"))
  {
    -[UITextInputController interactionAssistant](self, "interactionAssistant");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsSelectionDisplayUpdate");

  }
}

- (BOOL)_mightHaveSelection
{
  UITextInput **p_firstTextView;
  id WeakRetained;
  char v4;
  id v5;
  char v6;

  p_firstTextView = &self->_firstTextView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  v5 = objc_loadWeakRetained((id *)p_firstTextView);
  v6 = objc_msgSend(v5, "_mightHaveSelection");

  return v6;
}

void __45__UITextInputController__updateFirstTextView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateDisplayedSelection");

}

void __60__UITextInputController__fixupTypingAttributeForAttributes___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v6) && (objc_msgSend(a1[5], "containsObject:", v6) & 1) == 0)
    objc_msgSend(a1[6], "setObject:forKey:", v5, v6);

}

- (void)_textStorageDidProcessEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  _QWORD v23[5];
  NSRange v24;

  -[_UITextInputControllerTokenizer invalidateTokenizer](self->_tokenizer, "invalidateTokenizer", a3);
  -[UITextInputController _updateEmptyStringAttributes](self, "_updateEmptyStringAttributes");
  -[UITextInputController _textStorage](self, "_textStorage");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "editedMask") & 2) == 0 || (*((_BYTE *)&self->_tiFlags + 1) & 0x80) != 0)
    goto LABEL_15;
  v4 = -[UITextInputController _selectedRange](self, "_selectedRange");
  v6 = v5;
  v24.length = objc_msgSend(v22, "length");
  v24.location = 0;
  length = NSIntersectionRange(v24, (NSRange)self[96]).length;
  -[UITextInputController markedTextRange](self, "markedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    if (length && length == self->_markedTextRange.length)
    {
      -[NSAttributedString string](self->_markedText, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UITextInputController _isInlineCompletionPresentedAsMarkedText:](self, "_isInlineCompletionPresentedAsMarkedText:", v10);

      if (v11)
        goto LABEL_10;
    }
    else
    {

    }
    -[UITextInputController _forceUnmarkTextDueToEditing](self, "_forceUnmarkTextDueToEditing");
  }
LABEL_10:
  -[UITextInputController _ensureSelectionValid](self, "_ensureSelectionValid");
  if (v4 != -[UITextInputController _selectedRange](self, "_selectedRange") || v6 != v12)
  {
    *(_DWORD *)&self->_tiFlags |= 0x10000u;
    -[UITextInputController interactionAssistant](self, "interactionAssistant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectionChanged");

  }
  v15 = objc_msgSend(v22, "editedRange");
  if (v15 <= -[UITextInputController _selectedRange](self, "_selectedRange"))
    -[UITextInputController _selectionGeometryChanged](self, "_selectionGeometryChanged");
LABEL_15:
  if (!-[UITextInputController supportLetterByLetterUndo](self, "supportLetterByLetterUndo")
    && (objc_msgSend(v22, "editedMask") & 2) != 0
    && (*((_BYTE *)&self->_tiFlags + 1) & 0xA0) == 0)
  {
    -[UITextInputController undoManager](self, "undoManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "groupingLevel");

    if (!v17)
    {
      -[UITextInputController undoManager](self, "undoManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeAllActions");

    }
  }
  if ((objc_msgSend(v22, "editedMask") & 2) != 0
    && !+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v19, "cancelDictationForTextStoreChangesInResponder:", WeakRetained);

  }
  -[UITextInputController _textStorage](self, "_textStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__UITextInputController__textStorageDidProcessEditing___block_invoke;
  v23[3] = &unk_1E16E6548;
  v23[4] = self;
  objc_msgSend(v21, "coordinateReading:", v23);

}

- (id)undoManager
{
  _UITextUndoManager *undoManager;
  _UITextUndoManager *v4;
  _UITextUndoManager *v5;
  void *v6;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = objc_alloc_init(_UITextUndoManager);
    v5 = self->_undoManager;
    self->_undoManager = v4;

    -[_UITextUndoManager setInputController:](self->_undoManager, "setInputController:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__undoManagerWillUndo_, *MEMORY[0x1E0CB33D0], self->_undoManager);

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (BOOL)supportLetterByLetterUndo
{
  return 0;
}

- (void)stopCoalescing
{
  _UITextUndoOperationTyping **p_undoOperationForCoalescing;
  id WeakRetained;

  p_undoOperationForCoalescing = &self->_undoOperationForCoalescing;
  WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);

  if (WeakRetained)
    objc_storeWeak((id *)p_undoOperationForCoalescing, 0);
}

- (BOOL)dontRemoveAllActions
{
  return self->_dontRemoveAllActionsCount != 0;
}

- (void)_ensureSelectionValid
{
  void *v3;
  unint64_t location;
  NSRange v5;
  NSUInteger length;
  uint64_t v7;
  NSRange v8;
  NSRange v9;

  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = objc_msgSend(v3, "length");

  if (-[UITextInputController _selectedRange](self, "_selectedRange") >= location)
  {
    length = 0;
  }
  else
  {
    v8.location = -[UITextInputController _selectedRange](self, "_selectedRange");
    v9.location = 0;
    v9.length = location;
    v5 = NSIntersectionRange(v8, v9);
    location = v5.location;
    length = v5.length;
  }
  if (-[UITextInputController _selectedRange](self, "_selectedRange") != location || v7 != length)
    -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", location, length);
}

- (UITextRange)markedTextRange
{
  id WeakRetained;
  void *v4;

  if (self->_markedTextRange.length)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", self->_markedTextRange.location, self->_markedTextRange.length);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UITextRange *)v4;
}

- (void)setAllowsEditingTextAttributes:(BOOL)a3
{
  self->_allowsEditingTextAttributes = a3;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

uint64_t __32__UITextInputController_hasText__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "length");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

- (id)_attributesForReplacementInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  length = a3.length;
  location = a3.location;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__207;
  v14 = __Block_byref_object_dispose__207;
  v15 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__UITextInputController__attributesForReplacementInRange___block_invoke;
  v9[3] = &unk_1E16E6828;
  v9[6] = location;
  v9[7] = length;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "coordinateReading:", v9);

  -[UITextInputController _fixupTypingAttributeForAttributes:](self, "_fixupTypingAttributeForAttributes:", v11[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_fixupTypingAttributeForAttributes:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = *(_QWORD *)off_1E1678F78;
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DDResultAttributeName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _allowedTypingAttributes](self, "_allowedTypingAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("mt_systemAttributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__UITextInputController__fixupTypingAttributeForAttributes___block_invoke;
  v17[3] = &unk_1E16BCB90;
  v18 = v9;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);

  if (v6)
    objc_msgSend(v11, "setObject:forKey:", v6, *(_QWORD *)off_1E1678D90);
  if (v7)
    objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)off_1E1678EB8);
  v14 = v20;
  v15 = v11;

  return v15;
}

- (NSSet)_allowedTypingAttributes
{
  NSSet *allowedTypingAttributes;

  allowedTypingAttributes = self->_allowedTypingAttributes;
  if (!allowedTypingAttributes)
  {
    if (qword_1ECD81C50 != -1)
      dispatch_once(&qword_1ECD81C50, &__block_literal_global_510_0);
    allowedTypingAttributes = (NSSet *)qword_1ECD81C48;
  }
  return allowedTypingAttributes;
}

- (void)setMarkedTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_markedTextStyle, a3);
}

void __58__UITextInputController__attributesForReplacementInRange___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSRange v5;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSRange v20;

  v19 = a2;
  v3 = objc_msgSend(v19, "length");
  if (v3)
  {
    v4 = v3;
    v20.location = 0;
    v20.length = v3;
    v5 = NSIntersectionRange(*(NSRange *)(a1 + 48), v20);
    if (v5 == 0uLL)
    {
      if (*(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56))
      {
        location = v4 - 1;
LABEL_11:
        v9 = v19;
LABEL_12:
        v10 = location;
LABEL_13:
        objc_msgSend(v9, "attributesAtIndex:effectiveRange:", v10, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;
        goto LABEL_14;
      }
      goto LABEL_21;
    }
    location = v5.location;
    if (v5.length)
      goto LABEL_11;
    if (!v5.location)
    {
LABEL_21:
      v9 = v19;
      v10 = 0;
      goto LABEL_13;
    }
    if (v5.location >= v4)
    {
      v15 = v5.location - 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5.location - 1;
      if (objc_msgSend(v13, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v5.location - 1)))
      {
        if (v5.location + 1 >= v4)
        {

          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "string");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", v5.location));

        v9 = v19;
        if ((v18 & 1) == 0)
          goto LABEL_12;
LABEL_25:
        v10 = v15;
        goto LABEL_13;
      }

    }
    v9 = v19;
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 32), "_emptyStringAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  if (!v7)

LABEL_14:
}

- (NSDictionary)_emptyStringAttributes
{
  return self->_emptyStringAttributes;
}

- (void)_invalidateEmptyStringAttributes
{
  -[UITextInputController _setEmptyStringAttributes:](self, "_setEmptyStringAttributes:", 0);
}

- (id)selectionRectsForRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[5];
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[5];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  -[UITextInputController interactionAssistant](self, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v8 = MEMORY[0x1E0C809B0];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __48__UITextInputController_selectionRectsForRange___block_invoke;
  v85[3] = &unk_1E16E6658;
  v85[4] = self;
  objc_msgSend(WeakRetained, "selectionRectsForRange:fromView:forContainerPassingTest:", v65, v6, v85);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0;
  v82 = (double *)&v81;
  v83 = 0x2020000000;
  v84 = 0;
  objc_msgSend(v65, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v63 = v9;
  }
  else
  {
    objc_msgSend(v65, "start");
    v63 = (id)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  -[UITextInputController typingAttributes](self, "typingAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v8;
  v80[1] = 3221225472;
  v80[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_2;
  v80[3] = &unk_1E16E6680;
  v80[4] = &v81;
  objc_msgSend(v11, "requestTextGeometryAtPosition:typingAttributes:resultBlock:", v63, v12, v80);

  v13 = (void *)objc_msgSend(v62, "mutableCopy");
  v64 = v13;
  if (!objc_msgSend(v13, "count"))
  {
    +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);
LABEL_35:

    goto LABEL_36;
  }
  if ((objc_msgSend(v65, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v13, "bs_firstObjectPassingTest:", &__block_literal_global_483);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v61 = v14;
    }
    else
    {
      objc_msgSend(v13, "firstObject");
      v61 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v13, "bs_firstObjectPassingTest:", &__block_literal_global_484);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v59 = v17;
    }
    else
    {
      objc_msgSend(v13, "lastObject");
      v59 = (id)objc_claimAutoreleasedReturnValue();
    }

    if ((*(_BYTE *)&self->_tiFlags & 0x80) == 0
      || (v19 = objc_loadWeakRetained((id *)&self->_delegate),
          v20 = objc_msgSend(v19, "textInputShouldExtendCaretHeight:", self),
          v19,
          v20))
    {
      v77[0] = v8;
      v77[1] = 3221225472;
      v77[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_6;
      v77[3] = &unk_1E16E66E8;
      v79 = &__block_literal_global_486;
      v78 = v61;
      objc_msgSend(v13, "indexesOfObjectsPassingTest:", v77);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectsAtIndexes:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v74[0] = v8;
      v74[1] = 3221225472;
      v74[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_7;
      v74[3] = &unk_1E16E66E8;
      v76 = &__block_literal_global_486;
      v75 = v59;
      objc_msgSend(v13, "indexesOfObjectsPassingTest:", v74);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectsAtIndexes:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v25 = v22;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v71 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            objc_msgSend(v29, "rect", v59);
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v37 = v36;
            objc_msgSend(v29, "setBaselineOffset:", v82[3]);
            objc_msgSend(v29, "setRect:fromView:", v6, v31, v33 + -1.0, v35, v37 + 1.0);
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
        }
        while (v26);
      }

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v38 = v24;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v67 != v40)
              objc_enumerationMutation(v38);
            v42 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
            objc_msgSend(v42, "rect", v59);
            v44 = v43;
            v46 = v45;
            v48 = v47;
            v50 = v49;
            v51 = objc_loadWeakRetained((id *)&self->_firstTextView);
            UIRoundToViewScale(v51);
            v53 = v52;

            objc_msgSend(v42, "setBaselineOffset:", v82[3]);
            objc_msgSend(v42, "setRect:fromView:", v6, v44, v46, v48, v50 + v53);
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
        }
        while (v39);
      }

    }
    if ((objc_msgSend(v61, "containsStart", v59) & 1) == 0)
    {
      objc_msgSend(v65, "start");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v54);

      UIFloorToViewScale(v6);
      +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setContainsStart:", 1);
      objc_msgSend(v55, "setBaselineOffset:", v82[3]);
      objc_msgSend(v64, "addObject:", v55);

    }
    if ((objc_msgSend(v60, "containsEnd") & 1) == 0)
    {
      objc_msgSend(v65, "end");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v56);

      UIFloorToViewScale(v6);
      +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setContainsEnd:", 1);
      objc_msgSend(v57, "setBaselineOffset:", v82[3]);
      objc_msgSend(v64, "addObject:", v57);

    }
    v16 = v61;
    goto LABEL_35;
  }
LABEL_36:

  _Block_object_dispose(&v81, 8);
  return v64;
}

- (UITextInteractionAssistant)interactionAssistant
{
  void *v2;
  void *v3;

  -[UITextInputController _firstTextView](self, "_firstTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInteractionAssistant *)v3;
}

- (id)_firstTextView
{
  UITextInput **p_firstTextView;
  id WeakRetained;
  void *v5;

  p_firstTextView = &self->_firstTextView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  objc_msgSend(WeakRetained, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[UITextInputController _updateFirstTextView](self, "_updateFirstTextView");
  return objc_loadWeakRetained((id *)p_firstTextView);
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a6;
  return result;
}

- (BOOL)hasText
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__UITextInputController_hasText__block_invoke;
  v4[3] = &unk_1E16B7418;
  v4[4] = &v5;
  objc_msgSend(v2, "coordinateReading:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  _UITextLayoutController **p_textLayoutController;
  id v6;
  id v7;
  id WeakRetained;
  int64_t v9;

  p_textLayoutController = &self->_textLayoutController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  v9 = objc_msgSend(WeakRetained, "offsetFromPosition:toPosition:", v7, v6);

  return v9;
}

- (UITextInputTokenizer)tokenizer
{
  _UITextInputControllerTokenizer *tokenizer;
  _UITextInputControllerTokenizer *v4;
  _UITextInputControllerTokenizer *v5;

  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    v4 = -[_UITextInputControllerTokenizer initWithTextInputController:]([_UITextInputControllerTokenizer alloc], "initWithTextInputController:", self);
    v5 = self->_tokenizer;
    self->_tokenizer = v4;

    tokenizer = self->_tokenizer;
  }
  return (UITextInputTokenizer *)tokenizer;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  UITextRange *selectedTextRange;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  selectedTextRange = self->_selectedTextRange;
  if (!selectedTextRange
    || !-[UITextRange isEmpty](selectedTextRange, "isEmpty")
    || (v8 = objc_loadWeakRetained((id *)&self->_textLayoutController),
        -[UITextRange start](self->_selectedTextRange, "start"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "comparePosition:toPosition:", v6, v9),
        v9,
        v8,
        v10))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    -[UITextInputController endOfDocument](self, "endOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v6, v12) | a4;

    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v14, "attributesAtPosition:inDirection:", v6, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_6;
LABEL_9:
      v16 = 0;
      goto LABEL_11;
    }
  }
  -[UITextInputController typingAttributes](self, "typingAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_9;
LABEL_6:
  if (dyld_program_sdk_at_least())
  {
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("UITextInputTextFontKey"));

    objc_msgSend(v15, "objectForKey:", *(_QWORD *)off_1E1678D98);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("UITextInputTextColorKey"));

    objc_msgSend(v15, "objectForKey:", *(_QWORD *)off_1E1678C50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("UITextInputTextBackgroundColorKey"));

  }
LABEL_11:

  return v16;
}

- (void)_detachFromLayoutManager
{
  void *v3;
  UITextCheckingController *textCheckingController;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_storeWeak((id *)&self->_layoutManager, 0);
  -[UITextCheckingController invalidate](self->_textCheckingController, "invalidate");
  textCheckingController = self->_textCheckingController;
  self->_textCheckingController = 0;

}

- (void)setInputDelegate:(id)a3
{
  UITextInputDelegate **p_inputDelegate;
  id v5;
  id v6;

  p_inputDelegate = &self->_inputDelegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_inputDelegate, v6);
  LOBYTE(p_inputDelegate) = objc_opt_respondsToSelector();

  self->_inputDelegateRespondsToInlineCompletionAsMarkedText = p_inputDelegate & 1;
}

void __49__UITextInputController__allowedTypingAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)off_1E1678D90, *(_QWORD *)off_1E1678F98, *(_QWORD *)off_1E1678D98, *(_QWORD *)off_1E1678C50, *(_QWORD *)off_1E1678EA0, *(_QWORD *)off_1E1678E60, *(_QWORD *)off_1E1679060, *(_QWORD *)off_1E1679240, *(_QWORD *)off_1E16790A8, *(_QWORD *)off_1E16790B0, *(_QWORD *)off_1E1679048, *(_QWORD *)off_1E1679118, *(_QWORD *)off_1E1678EB8, *(_QWORD *)off_1E1678C58, *(_QWORD *)off_1E1679238, *(_QWORD *)off_1E1679058, *(_QWORD *)off_1E1678F70,
         *(_QWORD *)off_1E1678D30,
         *(_QWORD *)off_1E16792C0,
         *(_QWORD *)off_1E16792B0,
         *(_QWORD *)off_1E1679170,
         *(_QWORD *)off_1E1679130,
         CFSTR("_UILastStoredDefaultTextAttributesName"),
         *(_QWORD *)off_1E16790F0,
         0);
  v1 = (void *)qword_1ECD81C48;
  qword_1ECD81C48 = v0;

}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  _UITextLayoutController **p_textLayoutController;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[7];

  p_textLayoutController = &self->_textLayoutController;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  v9 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v7);
  v11 = v10;

  -[UITextInputController _textStorage](self, "_textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke;
  v21[3] = &__block_descriptor_56_e23_v16__0__NSTextStorage_8l;
  v21[4] = v9;
  v21[5] = v11;
  v21[6] = a3;
  objc_msgSend(v12, "coordinateEditing:", v21);

  if (-[UITextInputController _selectedRange](self, "_selectedRange") == v9 && v13 == v11)
  {
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)off_1E1678F98;
    objc_msgSend(v14, "objectForKey:", *(_QWORD *)off_1E1678F98);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (id)objc_opt_new();
    v20 = v19;

    objc_msgSend(v20, "setBaseWritingDirection:", a3);
    -[UITextInputController _addToTypingAttributes:value:](self, "_addToTypingAttributes:value:", v15, v20);

  }
  -[UITextInputController _selectionGeometryChanged](self, "_selectionGeometryChanged");
}

void __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paragraphRangeForRange:", a1[4], a1[5]);
  v7 = v6;

  v8 = *(_QWORD *)off_1E1678F98;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke_2;
  v11[3] = &unk_1E16E6878;
  v9 = a1[6];
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0x100000, v11);

}

- (void)dealloc
{
  int has_internal_diagnostics;
  id WeakRetained;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  if (has_internal_diagnostics)
  {
    if (WeakRetained)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "NSLayoutManager was not detached before dealloc of UITextInputController", buf, 2u);
      }

    }
  }
  else if (WeakRetained)
  {
    v6 = dealloc___s_category_10;
    if (!dealloc___s_category_10)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&dealloc___s_category_10);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "NSLayoutManager was not detached before dealloc of UITextInputController", buf, 2u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UITextInputController;
  -[UITextInputController dealloc](&v8, sel_dealloc);
}

- (void)didEndEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  -[UITextInputController removeAllTextAlternatives](self, "removeAllTextAlternatives");
  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if ((*((_BYTE *)&self->_tiFlags + 2) & 4) != 0)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__UITextInputController_didEndEditing__block_invoke;
    v6[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
    v6[4] = 0;
    v6[5] = v4;
    objc_msgSend(v5, "coordinateEditing:", v6);

    *(_DWORD *)&self->_tiFlags &= ~0x40000u;
  }
}

- (void)removeAllTextAlternatives
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[6];

  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if ((*((_BYTE *)&self->_tiFlags + 2) & 2) != 0)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__UITextInputController_removeAllTextAlternatives__block_invoke;
      v12[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
      v12[4] = 0;
      v12[5] = v4;
      objc_msgSend(v7, "coordinateEditing:", v12);

      WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      v9 = *(_QWORD *)off_1E16790E8;
      v10 = WeakRetained;
      objc_msgSend(v10, "documentRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAnnotationAttribute:forRange:", v9, v11);

    }
  }
  *(_DWORD *)&self->_tiFlags &= ~0x20000u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSelectedTextRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_destroyWeak((id *)&self->_textLayoutController);
  objc_storeStrong((id *)&self->_emptyStringAttributes, 0);
  objc_storeStrong((id *)&self->_textPlaceholder, 0);
  objc_storeStrong((id *)&self->_allowedTypingAttributes, 0);
  objc_storeStrong((id *)&self->_textCheckingController, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_destroyWeak((id *)&self->_undoOperationForCoalescing);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_firstTextView);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_translateSession, 0);
  objc_storeStrong((id *)&self->_lookupSession, 0);
  objc_storeStrong((id *)&self->_shareSession, 0);
  objc_storeStrong((id *)&self->_learnSession, 0);
  objc_storeStrong((id *)&self->_observedScrollViews, 0);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
}

- (void)setSelectedTextRange:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;
  _QWORD v15[4];
  id v16;
  UITextInputController *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[7];
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  -[UITextInputController signalDictationSelectionTip:](self, "signalDictationSelectionTip:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v6 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v4);
  v8 = v7;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3010000000;
  v26 = &unk_18685B0AF;
  v27 = v6;
  v28 = v8;
  -[UITextInputController _textStorage](self, "_textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__UITextInputController_setSelectedTextRange___block_invoke;
  v22[3] = &unk_1E16E6850;
  v22[4] = self;
  v22[5] = &v23;
  objc_msgSend(v9, "coordinateReading:", v22);

  if (self->_markedTextRange.length)
  {
    v11 = -[UITextInputController _selectedRange](self, "_selectedRange");
    if (self->_markedTextSelection.location != v6 - v11 || self->_markedTextSelection.length != v8)
    {
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __46__UITextInputController_setSelectedTextRange___block_invoke_2;
      v21[3] = &unk_1E16B4E70;
      v21[4] = self;
      v21[5] = v6 - v11;
      v21[6] = v8;
      -[UITextInputController _coordinateSelectionChange:](self, "_coordinateSelectionChange:", v21);
    }
  }
  else
  {
    v12 = -[UITextInputController _selectedRange](self, "_selectedRange");
    tiFlags = self->_tiFlags;
    if (v12 != v24[4] || v13 != v24[5] || (*(_DWORD *)&tiFlags & 0x10000) != 0)
    {
      self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags & 0xFFFEFFFF);
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __46__UITextInputController_setSelectedTextRange___block_invoke_3;
      v15[3] = &unk_1E16DA780;
      v18 = &v23;
      v19 = v6;
      v20 = v8;
      v16 = v4;
      v17 = self;
      -[UITextInputController _coordinateSelectionChange:](self, "_coordinateSelectionChange:", v15);

    }
  }
  _Block_object_dispose(&v23, 8);

}

- (void)signalDictationSelectionTip:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    objc_msgSend(v10, "start");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UITextInputController offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v4, v5);

    if (v6 >= 1)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictationTipController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController textInRange:](self, "textInRange:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "signalDictationSelectionTip:", v9);

    }
  }

}

void __46__UITextInputController_setSelectedTextRange___block_invoke(uint64_t a1, void *a2)
{
  NSRange v3;
  uint64_t v4;
  NSRange v5;
  NSUInteger length;
  NSRange v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;

  v3.length = objc_msgSend(a2, "length");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5.location = *(_QWORD *)(v4 + 32);
  if (v5.location >= v3.length)
  {
    length = 0;
    *(_QWORD *)(v4 + 32) = v3.length;
  }
  else
  {
    v5.length = *(_QWORD *)(v4 + 40);
    v3.location = 0;
    v7 = NSIntersectionRange(v5, v3);
    length = v7.length;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v4 + 32) = v7.location;
  }
  *(_QWORD *)(v4 + 40) = length;
  v8 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v8 + 144) & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 248));
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v9, "_selectedRange");
    v12 = objc_msgSend(WeakRetained, "textInput:willChangeSelectionFromCharacterRange:toCharacterRange:", v9, v10, v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v13 + 32) = v12;
    *(_QWORD *)(v13 + 40) = v14;

  }
}

void __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  __int128 v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__207;
  v17[4] = __Block_byref_object_dispose__207;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__207;
  v15[4] = __Block_byref_object_dispose__207;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_18685B0AF;
  v14 = xmmword_186679030;
  v4 = objc_msgSend(v3, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke_2;
  v6[3] = &unk_1E16E69B0;
  v10 = v17;
  v11 = v15;
  v7 = *(id *)(a1 + 32);
  v12 = v13;
  v5 = v3;
  v8 = v5;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_UITextInputDictationResultMetadata"), 0, v4, 0x100000, v6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
}

void __44__UITextInputController__userEditedTextInfo__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[6];
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(v3, "length");
  v6 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __44__UITextInputController__userEditedTextInfo__block_invoke_2;
  v36[3] = &unk_1E16B15D0;
  v7 = v4;
  v37 = v7;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_UITextInputDictationResultMetadata"), 0, v5, 0x100000, v36);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3010000000;
  v35[4] = 0;
  v35[5] = 0;
  v35[3] = &unk_18685B0AF;
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __44__UITextInputController__userEditedTextInfo__block_invoke_3;
  v30[3] = &unk_1E16C8998;
  v30[4] = a1[4];
  v8 = v3;
  v31 = v8;
  v9 = a1[5];
  v33 = v35;
  v34 = v9;
  v10 = v7;
  v32 = v10;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v30);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");
  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
        v21 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        objc_msgSend(v8, "string", (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "rangeValue");
        objc_msgSend(v22, "substringWithRange:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appendString:", v25);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v17);
  }

  _Block_object_dispose(v35, 8);
}

- (id)metadataDictionariesForDictationResults
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UITextInputController _userEditedTextInfo](self, "_userEditedTextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke;
  v11[3] = &unk_1E16E69D8;
  v6 = v3;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v5, "coordinateReading:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)_userEditedTextInfo
{
  id v3;
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__207;
  v17 = __Block_byref_object_dispose__207;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__207;
  v11 = __Block_byref_object_dispose__207;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[UITextInputController _textStorage](self, "_textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__UITextInputController__userEditedTextInfo__block_invoke;
  v6[3] = &unk_1E16E6A70;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  objc_msgSend(v4, "coordinateReading:", v6);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8[5], CFSTR("userEditedText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14[5], CFSTR("userEditedTextRanges"));
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

- (void)_setAllowedTypingAttributes:(id)a3
{
  NSSet *v4;
  NSSet *allowedTypingAttributes;

  if (self->_allowedTypingAttributes != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    allowedTypingAttributes = self->_allowedTypingAttributes;
    self->_allowedTypingAttributes = v4;

  }
}

- (BOOL)_canHandleResponderAction:(SEL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v11;

  v4 = 1;
  if (sel_cut_ != a3
    && sel_copy_ != a3
    && sel_paste_ != a3
    && sel_pasteAndMatchStyle_ != a3
    && sel_alignLeft_ != a3
    && sel_alignCenter_ != a3
    && sel_alignJustified_ != a3
    && sel_alignRight_ != a3
    && sel_promptForReplace_ != a3
    && sel__promptForReplace_ != a3
    && sel__transliterateChinese_ != a3
    && sel_select_ != a3
    && sel_selectAll_ != a3
    && sel_makeTextWritingDirectionNatural_ != a3
    && sel_makeTextWritingDirectionRightToLeft_ != a3
    && sel_makeTextWritingDirectionLeftToRight_ != a3
    && sel_replace_ != a3
    && sel__insertDrawing_ != a3
    && sel_captureTextFromCamera_ != a3
    && sel_toggleBoldface_ != a3
    && sel_toggleItalics_ != a3
    && sel_toggleUnderline_ != a3
    && sel_increaseSize_ != a3
    && sel_decreaseSize_ != a3)
  {
    v4 = sel__startWritingTools_ == a3;
  }
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "userInterfaceIdiom") != 6 || objc_msgSend(v6, "_presentationSemanticContext") != 3;
  if (sel__define_ != a3 && sel__translate_ != a3 && sel__addShortcut_ != a3 && sel__share_ != a3)
    v7 = 0;
  v11 = v4 || v7;

  return v11;
}

- (UITextInputSuggestionDelegate)textInputSuggestionDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE925C8))
  {
    objc_msgSend(v2, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UITextInputSuggestionDelegate *)v4;
}

- (int64_t)_textInputSource
{
  void *v2;
  void *v3;
  int64_t v4;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return __UIPlatformFallbackInputSource;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lastEventSource");

  return v4;
}

- (void)set_textInputSource:(int64_t)a3
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  UITextInputController *v8;
  UITextInputController *v9;
  id v10;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_opt_respondsToSelector() & 1) != 0 && -[UITextInputController keyboardType](self, "keyboardType") == 122;
    if (a3 == 3 && v6)
      v7 = 2;
    else
      v7 = 5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = self;
    else
      v8 = 0;
    v9 = v8;
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateEventSource:options:responder:", a3, v7, v9);

  }
  else
  {
    __UIPlatformFallbackInputSource = a3;
  }
}

- (_NSRange)_selectedNSRange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[UITextInputController _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v5);
      v8 = v7;
    }
    else
    {
      v8 = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)_selectedRangeWithinMarkedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "markedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5
        || (objc_msgSend(v5, "start"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "start"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v7, v8),
            v8,
            v7,
            v9 < 0))
      {
        v12 = 0;
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v4, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "end");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v10, v11);

      }
    }
    else
    {
      v12 = 0;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v12 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v9;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

- (void)_selectAll
{
  void *v2;
  id v3;

  -[UITextInputController _selectableText](self, "_selectableText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fullRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedTextRange:", v2);

}

- (int)_indexForTextPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);

  return v7;
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UITextInputController _indexForTextPosition:](self, "_indexForTextPosition:", v6);

  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v8, v9);
  v11 = v7;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  length = a3.length;
  location = a3.location;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionFromPosition:offset:", v6, location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "endOfDocument");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v5, "positionFromPosition:offset:", v10, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v5, "endOfDocument");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unsigned)_characterAfterCaretSelection
{
  return -[UITextInputController _characterInRelationToCaretSelection:](self, "_characterInRelationToCaretSelection:", 0);
}

- (unsigned)_characterBeforeCaretSelection
{
  return -[UITextInputController _characterInRelationToCaretSelection:](self, "_characterInRelationToCaretSelection:", 0xFFFFFFFFLL);
}

- (unsigned)_characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)&a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "selectedTextRange"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEmpty"),
        v8,
        v7,
        v9))
  {
    v10 = -[UITextInputController _characterInRelationToRangedSelection:](self, "_characterInRelationToRangedSelection:", v3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)_characterInRelationToRangedSelection:(int)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;

  -[UITextInputController _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        objc_msgSend(v4, "positionFromPosition:offset:", v8, a3);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      if (!v8)
        goto LABEL_17;
LABEL_11:
      objc_msgSend(v4, "positionFromPosition:offset:", v8, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v4, "textRangeFromPosition:toPosition:", v8, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textInRange:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          if (objc_msgSend(v15, "length") == 2
            && (v16 = objc_msgSend(v15, "characterAtIndex:", 0),
                v17 = objc_msgSend(v15, "characterAtIndex:", 1),
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            v6 = v17 + (v16 << 10) - 56613888;
          }
          else
          {
            v6 = objc_msgSend(v15, "characterAtIndex:", 0);
          }
        }
        else
        {
          v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    objc_msgSend(v4, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:offset:", v11, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_17;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
LABEL_4:
  v6 = 0;
LABEL_22:

  return v6;
}

- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unsigned int v14;

  if (!a3)
    return 0;
  v6 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "positionFromPosition:offset:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInRange:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v11, "length") == 2
      && (v12 = objc_msgSend(v11, "characterAtIndex:", 0),
          v13 = objc_msgSend(v11, "characterAtIndex:", 1),
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      v14 = v13 + (v12 << 10) - 56613888;
    }
    else
    {
      v14 = objc_msgSend(v11, "characterAtIndex:", 0);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[UITextInputController _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      objc_msgSend(v3, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "textInRange:", v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)_fullText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "textInRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[UITextInputController _selectableText](self, "_selectableText");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "setSelectedTextRange:", v5);

  }
}

- (BOOL)_selectionAtWordStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  -[UITextInputController _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "comparePosition:toPosition:", v7, v9);

    v11 = v10 == 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_selectionAtDocumentStart
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "beginningOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "comparePosition:toPosition:", v5, v4) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_selectionAtDocumentEnd
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "endOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "comparePosition:toPosition:", v5, v4) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGRect)_selectionClipRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_isEmptySelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "comparePosition:toPosition:", v4, v5) == 0;

  return v6;
}

- (BOOL)_hasMarkedTextOrRangedSelection
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v2, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v2, "selectedTextRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEmpty") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)_extendCurrentSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = *(_QWORD *)&a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v15 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (v6)
    {
      objc_msgSend(v15, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)v3 < 1)
      {
        -[UITextInputController _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v8, v3);
        v13 = objc_claimAutoreleasedReturnValue();
        v12 = v8;
        v8 = (void *)v13;
      }
      else
      {
        -[UITextInputController _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v10, v3);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v10 = (void *)v11;
      }

      objc_msgSend(v15, "textRangeFromPosition:toPosition:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSelectedTextRange:", v14);

      v5 = v15;
    }
  }

}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v14 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (v6)
    {
      objc_msgSend(v14, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEmpty");

      if (v8)
      {
        objc_msgSend(v14, "selectedTextRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "selectedTextRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v3 < 1)
          v3 = (v3 + 1);
        else
          v3 = (v3 - 1);
      }
      -[UITextInputController _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v10, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "textRangeFromPosition:toPosition:", v12, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v14, "setSelectedTextRange:", v13);

      v5 = v14;
    }
  }

}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  id v24;

  -[UITextInputController _selectableText](self, "_selectableText");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v4 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v8 = &stru_1E16EDF20;
    if (v7)
      goto LABEL_4;
LABEL_18:
    v19 = 0;
    v10 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v24, "textInRange:", v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_18;
LABEL_4:
  v23 = a3;
  v9 = v7;
  v10 = v7;
  while (1)
  {
    v11 = v8;
    v12 = -[__CFString length](v11, "length");
    if (v12)
    {
      v13 = v12;
      -[__CFString _rangeOfBackwardDeletionClusterAtIndex:](v11, "_rangeOfBackwardDeletionClusterAtIndex:", -[__CFString length](v11, "length") - 1);
      v15 = v14;
      v16 = v13 - v14;

      if (v13 != v15)
      {
        v8 = v11;
        v19 = v9;
        goto LABEL_20;
      }
    }
    else
    {

      v16 = 0;
    }
    v19 = v10;

    objc_msgSend(v24, "positionFromPosition:offset:", v19, -1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v24, "textRangeFromPosition:toPosition:", v10, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v24, "textInRange:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    if (!objc_msgSend(v18, "length", v23))
      break;
    objc_msgSend(v18, "stringByAppendingString:", v11);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = v19;
    if (!v10)
      goto LABEL_20;
  }

  v10 = 0;
  v8 = v11;
LABEL_20:
  v20 = v24;
  if (v23 && v16 >= 1)
  {
    v21 = v10;

    -[__CFString substringToIndex:](v8, "substringToIndex:", v16);
    *v23 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    objc_msgSend(v20, "textRangeFromPosition:toPosition:", v19, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v24, "setSelectedTextRange:", v22);

  }
LABEL_29:

}

- (void)_expandSelectionToStartOfWordBeforeCaretSelection
{
  -[UITextInputController _expandSelectionToStartOfWordsBeforeCaretSelection:](self, "_expandSelectionToStartOfWordsBeforeCaretSelection:", 1);
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UITextInputController _selectableText](self, "_selectableText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && v4)
  {
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_positionAtStartOfWords:beforePosition:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelectedTextRange:", v9);

    }
  }

}

- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1)
  {
    objc_msgSend(v6, "start");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v7, "positionWithinRange:farthestInDirection:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "end");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

- (int64_t)_opposingDirectionFromDirection:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)a3 <= 5)
    return qword_1866818E8[a3];
  return result;
}

- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v8 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = -3;
    while (!__CFADD__(v10++, 1))
    {
      objc_msgSend(v9, "tokenizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v8, a4, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v17 = 0;
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v13, a4, a5))
      {

LABEL_11:
        v17 = v13;
        v8 = v17;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, -[UITextInputController _opposingDirectionFromDirection:](self, "_opposingDirectionFromDirection:", a5));

      v8 = v13;
      if (v16)
        goto LABEL_11;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 && v6)
  {
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeEnclosingPosition:withGranularity:inDirection:", v6, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "tokenizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:toBoundary:inDirection:", v6, 1, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v10 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v8, "tokenizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rangeEnclosingPosition:withGranularity:inDirection:", v19, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_13;
    }
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 >= 2)
    {
      v12 = a3 - 1;
      while (1)
      {
        objc_msgSend(v8, "tokenizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v11, 1, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          break;
        objc_msgSend(v8, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          break;

        v11 = v16;
        if (!--v12)
          goto LABEL_12;
      }
    }
    v16 = v11;
LABEL_12:
    v6 = v16;

    v10 = v6;
  }
  else
  {
    v6 = v6;
    v10 = v6;
  }
LABEL_13:

  return v10;
}

- (void)_setCaretSelectionAtEndOfSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textRangeFromPosition:toPosition:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedTextRange:", v6);

  }
}

- (void)_deleteByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[UITextInputController _selectableText](self, "_selectableText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v10);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v3, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_positionAtStartOfWords:beforePosition:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v10, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textDidChange:", v10);

}

- (void)_deleteForwardByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[UITextInputController _selectableText](self, "_selectableText");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v18);

  if (objc_msgSend(v3, "isEmpty"))
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "tokenizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_4;
      objc_msgSend(v6, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "positionFromPosition:toBoundary:inDirection:", v15, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "tokenizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rangeEnclosingPosition:withGranularity:inDirection:", v16, 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_4:
          objc_msgSend(v3, "start");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "end");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "textRangeFromPosition:toPosition:", v10, v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v12;
        }
      }
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v18, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textDidChange:", v18);

}

- (void)_deleteToStartOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UITextInputController _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v8, v7);

      if (v9 == 1)
      {
        objc_msgSend(v3, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v7, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteToEndOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UITextInputController _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v7, v8);

      if (v9 == 1)
      {
        objc_msgSend(v3, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v10, v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteToEndOfParagraph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UITextInputController _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v7, v8);

      if (v9 == 1)
      {
        objc_msgSend(v3, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v10, v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteTextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedTextRange:", v4);

  objc_msgSend(v9, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = v9;
      if (objc_msgSend(v8, "keyboardInputShouldDelete:", v8))
        objc_msgSend(v8, "deleteBackward");
      else
        objc_msgSend(v8, "setSelectedTextRange:", v5);

    }
    else
    {
      objc_msgSend(v9, "deleteBackward");
    }
  }

}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id v3;

  -[UITextInputController _keyInput](self, "_keyInput", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteBackward");

}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[UITextInputController _selectableText](self, "_selectableText", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textWillChange:", v14);

  if (objc_msgSend(v4, "isEmpty"))
  {
    objc_msgSend(v14, "tokenizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "positionFromPosition:toBoundary:inDirection:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "comparePosition:toPosition:", v8, v9);

      if (v10 == 1)
      {
        objc_msgSend(v4, "end");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textRangeFromPosition:toPosition:", v11, v8);
        v12 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v12;
      }
    }

  }
  -[UITextInputController _deleteTextRange:](self, "_deleteTextRange:", v4);
  objc_msgSend(v14, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textDidChange:", v14);

}

- (void)_transpose
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[UITextInputController _selectableText](self, "_selectableText");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v19, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textWillChange:", v19);

    objc_msgSend(v19, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v9)
    {
      objc_msgSend(v2, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRangeFromPosition:toPosition:", v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRangeFromPosition:toPosition:", v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v13)
      {
        objc_msgSend(v19, "textInRange:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textInRange:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textRangeFromPosition:toPosition:", v6, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v19, "replaceRange:withText:", v17, v16);

      }
    }
    objc_msgSend(v19, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textDidChange:", v19);

  }
}

- (void)_replaceCurrentWordWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "replaceRange:withText:", v7, v8);

}

- (void)_replaceDocumentWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _fullRange](self, "_fullRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
      objc_msgSend(v4, "replaceRange:withText:", v6, &stru_1E16EDF20);
    objc_msgSend(v4, "insertText:", v7);
  }

}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITextInputController _selectableText](self, "_selectableText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "performSelector:", sel__enclosingScrollerIncludingSelf);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
    objc_msgSend(v10, "scrollRectToVisible:animated:", v4);

  }
}

- (id)_normalizedStringForRangeComparison:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_stringByReplacingCharacter:withCharacter:", 160, 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringByReplacingCharacter:withCharacter:", 8217, 39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_stringByReplacingCharacter:withCharacter:", 8216, 39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v8, "_rangeOfEnclosingWord:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "textInRange:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v10, "isEqualToString:", v6))
    {
      v12 = v9;
      v11 = v12;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v8, "beginningOfDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "textInRange:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "length");
      if (v16 <= objc_msgSend(v6, "length"))
      {
        v12 = v14;
        v10 = v15;
LABEL_25:
        -[UITextInputController _normalizedStringForRangeComparison:](self, "_normalizedStringForRangeComparison:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputController _normalizedStringForRangeComparison:](self, "_normalizedStringForRangeComparison:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v22))
          v11 = v12;
        else
          v11 = 0;

        goto LABEL_29;
      }
      v17 = 0;
      while (1)
      {
        v18 = v13;
        objc_msgSend(v8, "positionFromPosition:offset:", v13, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        if (objc_msgSend(v8, "comparePosition:toPosition:", v13, v7) != -1)
        {

          break;
        }
        objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_24;
        objc_msgSend(v8, "textInRange:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v10, "length");
        if (v19 > objc_msgSend(v6, "length"))
        {
          v14 = v12;
          v15 = v10;
          if (v17++ < 9)
            continue;
        }
        goto LABEL_25;
      }

      v13 = 0;
    }
    else
    {
      v15 = v10;
    }
LABEL_24:

    v12 = 0;
    v10 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v11;
}

- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (v6)
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v7, "tokenizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_rangeOfEnclosingWord:(id)a3
{
  return -[UITextInputController _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 1, a3);
}

- (id)_rangeOfLineEnclosingPosition:(id)a3
{
  return -[UITextInputController _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 4, a3);
}

- (id)_rangeOfSentenceEnclosingPosition:(id)a3
{
  return -[UITextInputController _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 2, a3);
}

- (id)_rangeOfParagraphEnclosingPosition:(id)a3
{
  return -[UITextInputController _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 3, a3);
}

- (id)_fullRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  if (v6)
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v6, a3, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v11;
    if (!v11)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v6, a3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v15 = 0;
        goto LABEL_11;
      }
      v10 = 0;
    }
    objc_msgSend(v7, "tokenizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rangeEnclosingPosition:withGranularity:inDirection:", v12, a3, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v15, "start");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v7;
        v18 = v16;
        v19 = v6;
LABEL_13:
        objc_msgSend(v17, "textRangeFromPosition:toPosition:", v18, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_11:
    objc_msgSend(v15, "end");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v7;
      v18 = v6;
      v19 = v16;
      goto LABEL_13;
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)_range:(id)a3 containsRange:(id)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  NSRange v17;
  NSRange v18;

  v6 = a4;
  v7 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
  v12 = v11;

  if (!v12)
    return v10 >= v7 && v10 - v7 < v9;
  v17.location = v7;
  v17.length = v9;
  v18.location = v10;
  v18.length = v12;
  v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:(id)a3 intersectsRange:(id)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v14;
  NSRange v15;

  v6 = a4;
  v7 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
  v12 = v11;

  v14.location = v7;
  v14.length = v9;
  v15.location = v10;
  v15.length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (id)_intersectionOfRange:(id)a3 andRange:(id)a4
{
  id v6;
  id v7;
  UITextInputController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v6, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextInputController comparePosition:toPosition:](v8, "comparePosition:toPosition:", v9, v10) == 1)
    v11 = v6;
  else
    v11 = v7;
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextInputController comparePosition:toPosition:](v8, "comparePosition:toPosition:", v13, v14) == -1)
    v15 = v6;
  else
    v15 = v7;
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInputController textRangeFromPosition:toPosition:](v8, "textRangeFromPosition:toPosition:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_range:(id)a3 isEqualToRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  UITextInputController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      v10 = self;
      objc_msgSend(v6, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UITextInputController comparePosition:toPosition:](v10, "comparePosition:toPosition:", v11, v12);

      objc_msgSend(v6, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13 | -[UITextInputController comparePosition:toPosition:](v10, "comparePosition:toPosition:", v14, v15);

      v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 5)
  {
    -[UITextInputController _findDocumentBoundaryFromPosition:](self, "_findDocumentBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    -[UITextInputController _findPleasingWordBoundaryFromPosition:](self, "_findPleasingWordBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v4, 4, 0))
    goto LABEL_2;
  v9 = objc_msgSend(v6, "isPosition:withinTextUnit:inDirection:", v4, 1, 0);
  objc_msgSend(v5, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v15 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v4, 1, 1);

    if (!v15)
    {
      objc_msgSend(v5, "tokenizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v4, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_12;
      objc_msgSend(v5, "endOfDocument");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_2:
    v7 = v4;
LABEL_3:
    v8 = v7;
    goto LABEL_12;
  }
  objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v13, v4);

  if (v14 > 1)
    objc_msgSend(v12, "end");
  else
    objc_msgSend(v12, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)_findDocumentBoundaryFromPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);
  v9 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v4, v7);

  if (v8 <= v9)
    v10 = v6;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || !v10
    || (objc_msgSend(v8, "isEmpty") & 1) != 0
    || (objc_msgSend(v10, "isEmpty") & 1) != 0
    || (objc_msgSend(v8, "isEqual:", v10) & 1) != 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v8, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {

LABEL_9:
    objc_msgSend(v5, "selectionRectsForRange:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v8, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v13, "isEqual:", v14);

  if (v28)
    goto LABEL_9;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v4, "start");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v19;
  -[UITextInputController _updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:](self, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v19, v5);
  objc_msgSend(v8, "end");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 4, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    while ((objc_msgSend(v21, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v21, "end");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v22, 4, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "isEqual:", v21))
      {

        break;
      }
      objc_msgSend(v5, "selectionRectsForRange:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v24);

      v21 = v23;
      if (!v23)
        break;
    }

  }
  objc_msgSend(v10, "start");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[UITextInputController _updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:](self, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v27, v5);

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "textInRange:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v7, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v13, objc_msgSend(v12, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v9, "selectionRectsForRange:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v17);

      }
    }

  }
}

- (id)_rangeOfSmartSelectionIncludingRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;

  v4 = a3;
  if (v4)
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v5, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v60 = v4;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v5, "beginningOfDocument");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v6, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v12, v13);

    if (v14 >= 65)
    {
      objc_msgSend(v6, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v15, -64);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v16, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v6, "start");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v17, -64);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v18, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "start");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v5, "comparePosition:toPosition:", v12, v19);

      if (v20 == 1)
      {
        objc_msgSend(v6, "start");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v21, 0, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(v6, "start");
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        v12 = v25;
      }
    }
    objc_msgSend(v6, "end");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v26, 2, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(v5, "endOfDocument");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    objc_msgSend(v6, "end");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v31, v30);

    if (v32 >= 65)
    {
      objc_msgSend(v6, "end");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v33, 64);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v34, 1, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend(v6, "end");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v35, 64);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v36, 0, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "end");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v5, "comparePosition:toPosition:", v37, v30);

      if (v38 == 1)
      {
        objc_msgSend(v6, "end");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v39, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          v42 = v40;
        }
        else
        {
          objc_msgSend(v6, "end");
          v42 = (id)objc_claimAutoreleasedReturnValue();
        }
        v43 = v42;

        v30 = v43;
      }
    }
    v59 = v7;
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v12, v30);
    v44 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v45 = objc_msgSend(v5, "keyboardType"), v46 = 420, v45 != 3) && v45 != 10 && v45 != 120)
    {
      v46 = 428;
    }
    objc_msgSend(v5, "beginningOfDocument");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v12;
    v48 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v47, v12);

    v49 = -[UITextInputController _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
    v51 = v50;
    v57 = (void *)v44;
    objc_msgSend(v5, "textInRange:", v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = &v62;
    v64 = 0x3010000000;
    v65 = &unk_18685B0AF;
    v66 = xmmword_186679030;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __84__UITextInputController_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v61[3] = &unk_1E16D8F88;
    v61[4] = &v62;
    objc_msgSend(v53, "smartSelectionForTextInDocument:inRange:options:completion:", v52, v49 - v48, v51, v46, v61);

    v54 = v63[4];
    if (v54 != 0x7FFFFFFFFFFFFFFFLL && v63[5])
    {
      v63[4] = v54 + v48;
      -[UITextInputController _textRangeFromNSRange:](self, "_textRangeFromNSRange:");
      v55 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v55;
    }
    _Block_object_dispose(&v62, 8);

    v4 = v60;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __84__UITextInputController_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = a3;
  return result;
}

- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 < 1)
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "beginningOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "endOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = (id)v11;
      }
    }

    goto LABEL_10;
  }
  v10 = v6;
LABEL_10:

  return v10;
}

- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;

  length = a3.length;
  location = a3.location;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (location | length)
  {
    v9 = length + location;
    objc_msgSend(v6, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "end");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (location)
    {
      objc_msgSend(v5, "positionFromPosition:offset:", v10, location);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
      if (!v12)
      {
        if ((location & 0x8000000000000000) != 0)
          objc_msgSend(v5, "beginningOfDocument");
        else
          objc_msgSend(v5, "endOfDocument");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v9)
    {
      objc_msgSend(v5, "positionFromPosition:offset:", v11, v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
      if (!v13)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          v14 = v10;
        }
        else
        {
          objc_msgSend(v5, "endOfDocument");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v14;
      }
    }
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v7;
    v8 = v17;

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)_textColorForCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInputController textColorForCaretSelection](self, "textColorForCaretSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "end");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "endOfDocument");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && objc_msgSend(v4, "comparePosition:toPosition:", v7, v6) == -1)
        {
          v8 = v7;

          v6 = v8;
        }
        objc_msgSend(v4, "textStylingAtPosition:inDirection:", v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v10 = *(const __CFString **)off_1E1678D98;
      else
        v10 = CFSTR("UITextInputTextColorKey");
      objc_msgSend(v9, "objectForKey:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)_fontForCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInputController fontForCaretSelection](self, "fontForCaretSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "end");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "endOfDocument");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && objc_msgSend(v4, "comparePosition:toPosition:", v7, v6) == -1)
        {
          v8 = v7;

          v6 = v8;
        }
        objc_msgSend(v4, "textStylingAtPosition:inDirection:", v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v10 = *(const __CFString **)off_1E1678D90;
      else
        v10 = CFSTR("UITextInputTextFontKey");
      objc_msgSend(v9, "objectForKey:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSelectedTextRange:withAffinityDownstream:", v6, v4);

}

- (id)_setSelectionRangeWithHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  if (objc_msgSend(v4, "anchor") == 1)
  {
    objc_msgSend(v4, "cursor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(v4, "setEnd:", v7);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "anchor");
  objc_msgSend(v4, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStart:", v7);
  if (v8 != 2)
    goto LABEL_5;
LABEL_6:

  objc_msgSend(v4, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "comparePosition:toPosition:", v9, v10);

  if (v11 >= 1)
  {
    if (objc_msgSend(v4, "anchor") == 1)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v4, "setAnchor:", v12);
  }
  objc_msgSend(v4, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInputController _updateSelectionWithTextRange:withAffinityDownstream:](self, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, objc_msgSend(v4, "affinityDownstream"));
  if (objc_msgSend(v4, "anchor"))
  {
    if (objc_msgSend(v4, "anchor") == 1)
      objc_msgSend(v5, "_lastRectForRange:", v15);
    else
      objc_msgSend(v5, "firstRectForRange:", v15);
    objc_msgSend(v5, "_scrollRectToVisible:animated:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DD9898];
    -[UITextInputController webView](self, "webView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", v17, v18);

  }
LABEL_19:

  return v4;
}

- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  _BOOL4 v8;
  UITextInputArrowKeyHistory *v10;
  UITextInputArrowKeyHistory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = (UITextInputArrowKeyHistory *)a3;
  if (v10)
  {
    v11 = v10;
    if (!v8)
      -[UITextInputArrowKeyHistory setAnchor:](v10, "setAnchor:", 0);
  }
  else
  {
    v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  -[UITextInputController _selectableText](self, "_selectableText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setStart:](v11, "setStart:", v14);

  objc_msgSend(v12, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setEnd:](v11, "setEnd:", v16);

  v17 = -[UITextInputArrowKeyHistory anchor](v11, "anchor");
  objc_msgSend(v12, "selectedTextRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((_DWORD)v7 == 2)
  {
    if (v17 == 1)
    {
LABEL_7:
      objc_msgSend(v18, "end");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_7;
  }
  objc_msgSend(v18, "start");
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v21 = (void *)v20;
  -[UITextInputArrowKeyHistory setCursor:](v11, "setCursor:", v20);

  -[UITextInputArrowKeyHistory startPosition](v11, "startPosition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[UITextInputArrowKeyHistory cursor](v11, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputArrowKeyHistory setStartPosition:](v11, "setStartPosition:", v23);

    if (v8)
      goto LABEL_12;
LABEL_16:
    v7 = 0;
LABEL_17:
    -[UITextInputArrowKeyHistory setAnchor:](v11, "setAnchor:", v7);
    goto LABEL_18;
  }
  if (!v8)
    goto LABEL_16;
LABEL_12:
  if (!-[UITextInputArrowKeyHistory anchor](v11, "anchor")
    || -[UITextInputController _isEmptySelection](self, "_isEmptySelection"))
  {
    goto LABEL_17;
  }
LABEL_18:
  -[UITextInputArrowKeyHistory setAffinityDownstream:](v11, "setAffinityDownstream:", v6);

  return v11;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v26 = 0;
    v9 = v6;
    goto LABEL_9;
  }
  -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAmount:", 0);
  objc_msgSend(v7, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 1);

  if ((v12 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v7, "tokenizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_4:
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isPosition:withinTextUnit:inDirection:", v17, 1, 1);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "positionFromPosition:toBoundary:inDirection:", v20, 1, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v21);

    }
LABEL_7:
    objc_msgSend(v7, "tokenizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "positionFromPosition:toBoundary:inDirection:", v23, 1, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v24);

    objc_msgSend(v9, "cursor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v25);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "cursor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  while (1)
  {
    objc_msgSend(v7, "beginningOfDocument");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v7, "comparePosition:toPosition:", v29, v15);

    if (!v30)
      break;
    if (v28 && !objc_msgSend(v7, "comparePosition:toPosition:", v28, v15))
    {
      objc_msgSend(v7, "beginningOfDocument");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v35);

      objc_msgSend(v9, "cursor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartPosition:", v36);

      break;
    }
    v31 = v15;

    objc_msgSend(v7, "tokenizer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "positionFromPosition:toBoundary:inDirection:", v31, 3, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tokenizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isPosition:atBoundary:inDirection:", v15, 3, 1);

    v28 = v31;
    if ((v34 & 1) == 0)
    {
      objc_msgSend(v9, "setCursor:", v15);

      goto LABEL_4;
    }
  }
  -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v26;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 0);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v9, "setCursor:", v15);

    }
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v18);

    objc_msgSend(v9, "cursor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v7, "endOfDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v20);

    }
    objc_msgSend(v9, "cursor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v21);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
    v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 1) & 1) == 0)
    {
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7, "tokenizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v15, 4, 1);

        if ((v16 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

LABEL_10:
    objc_msgSend(v10, "cursor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartPosition:", v18);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v17 = 0;
  v10 = v6;
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 0) & 1) == 0)
    {
      if (v9)
      {

      }
      else
      {
        objc_msgSend(v7, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v16, 4, 0);

        if ((v17 & 1) != 0)
        {
LABEL_9:
          objc_msgSend(v10, "cursor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setStartPosition:", v18);

          -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

    goto LABEL_9;
  }
  v14 = 0;
  v10 = v6;
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 1);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 0);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "beginningOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "endOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    objc_msgSend(v7, "tokenizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isPosition:atBoundary:inDirection:", v13, 4, 3);

    if (v14)
      objc_msgSend(v9, "setAffinityDownstream:", 1);
    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = -[UITextInputController _selectionAffinity](self, "_selectionAffinity") == 0;
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginningOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "beginningOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = -[UITextInputController _selectionAffinity](self, "_selectionAffinity") == 0;
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "endOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || v4)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 3, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UITextInputController _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputController _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || v4)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 2, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    -[UITextInputController _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "positionFromPosition:inDirection:offset:", v9, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInputController setSelectedTextRange:withAffinityDownstream:](self, "setSelectedTextRange:withAffinityDownstream:", v7, v4);
  }
  else
  {
    -[UITextInputController _selectableText](self, "_selectableText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTextRange:", v7);

  }
}

- (int64_t)_selectionAffinity
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v2, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isPosition:atBoundary:inDirection:", v6, 3, 1))
    {

    }
    else
    {
      objc_msgSend(v2, "tokenizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "selectedTextRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isPosition:atBoundary:inDirection:", v9, 4, 2);

      if ((v10 & 1) != 0)
      {
        v3 = 1;
        goto LABEL_8;
      }
    }
    v3 = 0;
    goto LABEL_8;
  }
  v3 = objc_msgSend(v2, "selectionAffinity");
LABEL_8:

  return v3;
}

- (void)_setGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextPhraseBoundaryInteraction *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInputController _setInternalGestureRecognizers](self, "_setInternalGestureRecognizers");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markedTextOverlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "interactions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    -[UITextInputController _selectableText](self, "_selectableText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setGestureRecognizers");
    }
    else if (objc_msgSend(v10, "_hasMarkedText"))
    {
      if (objc_msgSend(v3, "hasEditableMarkedText"))
      {
        objc_msgSend(v10, "markedTextRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstRectForRange:", v13);
        objc_msgSend(v4, "setFrame:");

        objc_msgSend(v10, "textInputView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v4);

        v15 = -[UITextPhraseBoundaryInteraction initWithTextInput:]([UITextPhraseBoundaryInteraction alloc], "initWithTextInput:", v10);
        objc_msgSend(v4, "addInteraction:", v15);

      }
    }

  }
}

- (BOOL)_usesAsynchronousProtocol
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled");
  -[UITextInputController _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if ((objc_msgSend(v4, "conformsToProtocolCached:", &unk_1EE0CE228) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[UITextInputController _selectableText](self, "_selectableText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "conformsToProtocolCached:", &unk_1EE0CE288);

    }
  }
  else
  {
    v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE0CE648);
  }

  return v6;
}

- (BOOL)_hasMarkedText
{
  void *v2;
  char v3;
  void *v4;

  -[UITextInputController _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_usesAsynchronousProtocol")
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE288)|| objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE228)))
  {
    v3 = objc_msgSend(v2, "hasMarkedText");
  }
  else
  {
    objc_msgSend(v2, "markedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v7;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v7 = (objc_class *)MEMORY[0x1E0CB3498];
  v8 = a3;
  v9 = (id)objc_msgSend([v7 alloc], "initWithString:", v8);

  -[UITextInputController _setAttributedMarkedText:selectedRange:](self, "_setAttributedMarkedText:selectedRange:", v9, location, length);
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UITextInputController _selectableText](self, "_selectableText");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[UITextInputController _hasMarkedText](self, "_hasMarkedText");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v26, "setAttributedMarkedText:selectedRange:", v7, location, length);
  }
  else
  {
    objc_msgSend(v7, "string");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setMarkedText:selectedRange:", v9, location, length);
    v7 = (id)v9;
  }

  v10 = -[UITextInputController _hasMarkedText](self, "_hasMarkedText");
  if (v8 != v10)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v26, "_selectionDisplayInteraction");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v26;
      v13 = (void *)v11;
    }
    else
    {
      v13 = 0;
      v12 = v26;
    }
    objc_msgSend(v12, "_setGestureRecognizers");
    -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "interactionAssistant");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "interactionAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "externalInteractions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "interactionAssistant");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "deactivateSelection");

        objc_msgSend(v26, "_setSelectionDisplayInteraction:", v13);
      }
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (v10)
  {
    -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactionAssistant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "markedTextOverlay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "markedTextRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstRectForRange:", v17);
      objc_msgSend(v13, "setFrame:");

LABEL_15:
    }
  }

}

- (void)_unmarkText
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UITextInputController _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UITextInputController _hasMarkedText](self, "_hasMarkedText");
  objc_msgSend(v13, "unmarkText");
  if (v3)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v13, "_selectionDisplayInteraction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v13, "_setGestureRecognizers");
    -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionAssistant");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interactionAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalInteractions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[UITextInputController _textSelectingContainer](self, "_textSelectingContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "interactionAssistant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deactivateSelection");

        objc_msgSend(v13, "_setSelectionDisplayInteraction:", v4);
      }
    }
    else
    {

    }
  }

}

- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a5;
  v7 = a4;
  v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v5
    && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "autocorrectSpellingEnabled"),
        v10,
        !v11)
    || (objc_msgSend(v8, "_containsCJScriptsOnly") & 1) != 0)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (unint64_t)objc_msgSend(v13, "count") < 8;
LABEL_13:

  return v14;
}

- (_NSRange)_rangeAfterCancelDictationIfNecessaryForChangeInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  UITextPlaceholder *textPlaceholder;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSRange v15;
  _NSRange result;
  NSRange v17;

  length = a3.length;
  location = a3.location;
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    -[UITextPlaceholder attachment](textPlaceholder, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "attachmentRange");
    v10 = v9;

    if (location <= v8 && location + length <= v8 + v10)
    {
      if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cancelDictation");

      }
      if (!self->_textPlaceholder)
      {
        v15.location = location;
        v15.length = length;
        v17.location = v8;
        v17.length = v10;
        length -= NSIntersectionRange(v15, v17).length;
      }
    }
  }
  v12 = location;
  v13 = length;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)_senderForDelegateNotifications
{
  UITextInputController *v3;
  UITextInputController *v4;

  v3 = (UITextInputController *)objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextInputController _textSelectingContainer](v3, "_textSelectingContainer");
    v4 = (UITextInputController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
    if (!v3)
      v4 = self;
  }

  return v4;
}

- (void)_sendDelegateWillChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id WeakRetained;
  id v8;

  if ((*((_BYTE *)&self->_tiFlags + 1) & 0x20) == 0)
  {
    v4 = a3;
    -[UITextInputController _senderForDelegateNotifications](self, "_senderForDelegateNotifications", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
      objc_msgSend(WeakRetained, "textWillChange:", v8);

      v6 = v8;
    }

  }
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4 replacement:(id)a5 characterRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v11;
  char v12;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;
  id WeakRetained;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  length = a6.length;
  location = a6.location;
  v8 = a4;
  v9 = a3;
  v20 = a5;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "suppressDelegateTextInputDidChangeNotifications");

  tiFlags = self->_tiFlags;
  if ((*(_DWORD *)&tiFlags & 0x80000) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = WeakRetained;
    if (v8 && (*(_BYTE *)&self->_tiFlags & 8) != 0)
      objc_msgSend(WeakRetained, "textInputDidChangeSelection:", self);
    if (v9)
    {
      v16 = (*(_BYTE *)&self->_tiFlags & 4) != 0 ? v12 : 1;
      if ((v16 & 1) == 0)
        objc_msgSend(v15, "textInputDidChange:", self);
    }

    tiFlags = self->_tiFlags;
  }
  if ((*(_WORD *)&tiFlags & 0x2000) == 0)
  {
    -[UITextInputController _senderForDelegateNotifications](self, "_senderForDelegateNotifications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v18 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      objc_msgSend(v18, "textDidChange:", v17);

    }
    tiFlags = self->_tiFlags;
  }
  if (v20 && (*(_WORD *)&tiFlags & 0x800) != 0 && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UITextInputController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textInput:didApplyAttributedText:toCharacterRange:", self, v20, location, length);

  }
}

- (BOOL)_delegateShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", location, length);
  if ((*(_BYTE *)&self->_tiFlags & 2) != 0)
  {
    v11 = v8;
    v12 = v9;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_msgSend(WeakRetained, "textInput:shouldChangeCharactersInRange:replacementText:", self, v11, v12, v7);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_setInternalGestureRecognizers
{
  id v2;

  -[UITextInputController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearGestureRecognizers:", 1);

}

- (void)_selectionDidScroll:(id)a3
{
  id v3;

  -[UITextInputController interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsSelectionDisplayUpdate");

}

uint64_t __46__UITextInputController_setSelectedTextRange___block_invoke_2(uint64_t a1)
{
  void *v2;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_OWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionChanged");

  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateChangeNotificationsForText:selection:", 0, 1);
}

void __46__UITextInputController_setSelectedTextRange___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(v3 + 40);
  if (v5 != *(_QWORD *)(a1 + 56) || v4 != *(_QWORD *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 232));
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v8;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v2;
  v12 = v2;

  objc_msgSend(*(id *)(a1 + 40), "_invalidateTypingAttributes");
  objc_msgSend(*(id *)(a1 + 40), "interactionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionChanged");

  objc_msgSend(*(id *)(a1 + 40), "_sendDelegateChangeNotificationsForText:selection:", 0, 1);
}

- (void)_setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  UITextRange *v6;
  UITextRange *selectedTextRange;
  id WeakRetained;

  length = a3.length;
  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v6 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  selectedTextRange = self->_selectedTextRange;
  self->_selectedTextRange = v6;

}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id WeakRetained;

  length = a3.length;
  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setSelectedTextRange:](self, "setSelectedTextRange:", v6);

}

- (void)_coordinateSelectionChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__UITextInputController__coordinateSelectionChange___block_invoke;
  v7[3] = &unk_1E16E6570;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "coordinateReading:", v7);

}

void __52__UITextInputController__coordinateSelectionChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_ensureSelectionValid");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = WeakRetained;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) & 0x20) == 0)
    objc_msgSend(WeakRetained, "selectionWillChange:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_ensureSelectionValid");
  v6 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v8 = v7;
  if (objc_msgSend(v3, "length") && v6 + v8 >= objc_msgSend(v3, "length"))
  {
    v6 = objc_msgSend(v3, "length") - 1;
    v8 = 1;
  }
  if ((v6 & 0x8000000000000000) == 0 && v6 < objc_msgSend(v3, "length"))
  {
    v16 = 0;
    v17 = 0;
    if (v8)
      objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", v6, &v16, v6, v8);
    else
      objc_msgSend(v3, "attributesAtIndex:effectiveRange:", v6, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
    objc_msgSend(v10, "keyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFormattingCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v17 + v16;
    v14 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    objc_msgSend(v12, "setSelectedAttributes:isMultiple:", v9, v13 < v14 + v15);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) & 0x20) == 0)
    objc_msgSend(v5, "selectionDidChange:");

}

- (_NSRange)_rangeToReplaceWhenInsertingText
{
  void *v3;
  NSUInteger location;
  id WeakRetained;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    location = self->_markedTextRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      location = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v3);
      v7 = v6;

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    location = 0;
  }

  v8 = location;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)_insertText:(id)a3 fromKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  uint64_t v56;

  v4 = a4;
  v6 = a3;
  if (!-[UITextInputController isWritingToolsStreamingReplacements](self, "isWritingToolsStreamingReplacements"))
  {
    if (v4)
      v7 = 0x2000;
    else
      v7 = 0;
    self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | v7);
    v8 = -[UITextInputController _rangeToReplaceWhenInsertingText](self, "_rangeToReplaceWhenInsertingText");
    v10 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v8, v9);
    v12 = v11;
    -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
    if ((*((_BYTE *)&self->_tiFlags + 1) & 0x10) != 0)
    {
      -[UITextInputController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textInput:willChangeCharactersInRange:", self, v10, v12);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v10, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextCheckingController willReplaceTextInRange:withText:](self->_textCheckingController, "willReplaceTextInRange:withText:", v15, v6);
    v16 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v18 = v17;
    -[UITextInputController _textStorage](self, "_textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __50__UITextInputController__insertText_fromKeyboard___block_invoke;
    v53[3] = &unk_1E16E6598;
    v55 = v16;
    v56 = v18;
    v21 = v6;
    v54 = v21;
    objc_msgSend(v19, "coordinateReading:", v53);

    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__207;
    v51 = __Block_byref_object_dispose__207;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__207;
    v45 = __Block_byref_object_dispose__207;
    v46 = 0;
    -[UITextInputController _textStorage](self, "_textStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __50__UITextInputController__insertText_fromKeyboard___block_invoke_442;
    v35[3] = &unk_1E16E65C0;
    v35[4] = self;
    v37 = &v41;
    v39 = v10;
    v40 = v12;
    v36 = v21;
    v38 = &v47;
    objc_msgSend(v22, "coordinateEditing:", v35);

    -[_UITextInputControllerTokenizer invalidateTokenizer](self->_tokenizer, "invalidateTokenizer");
    v23 = -[UITextInputController selectionAffinity](self, "selectionAffinity");
    if (objc_msgSend((id)v48[5], "length"))
    {
      v24 = (void *)v48[5];
      v25 = objc_msgSend(v24, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v24, "length") - 1);
      objc_msgSend(v24, "substringWithRange:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "rangeOfCharacterFromSet:", v28);

      if (!v29)
        v23 = 0;

    }
    -[UITextRange start](self->_selectedTextRange, "start");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v31, "positionFromPosition:offset:affinity:", v30, objc_msgSend((id)v48[5], "length"), v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v33, "emptyTextRangeAtPosition:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController setSelectedTextRange:](self, "setSelectedTextRange:", v34);

    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v42[5], v10, v12);
    *(_DWORD *)&self->_tiFlags &= ~0x2000u;

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

  }
}

void __50__UITextInputController__insertText_fromKeyboard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v24 = v3;
  if (v4 < objc_msgSend(v3, "length")
    && (objc_msgSend(v24, "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), *(_QWORD *)(a1 + 40), 0), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40) - 1;
    v6 = 0;
    v7 = 0;
    if (v8 >= objc_msgSend(v24, "length") || (v8 & 0x8000000000000000) != 0)
      goto LABEL_36;
    objc_msgSend(v24, "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = 0;
      goto LABEL_36;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[UIDictationUtilities trackingPunctuations](UIDictationUtilities, "trackingPunctuations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v10)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("suffixPunctuationAdded"));
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", &stru_1E16EDF20))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("suffixPunctuationAdded"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    v6 = v11;
    if (v7)
      objc_msgSend(v11, "addEntriesFromDictionary:", v7);
    v12 = objc_msgSend(*(id *)(a1 + 32), "length") - *(_DWORD *)(a1 + 48);
    +[UIDictationUtilities updateCharacterModificationCount:delta:](UIDictationUtilities, "updateCharacterModificationCount:delta:", v6, v12);
    if ((_DWORD)v12 == -1)
    {
      if (*(_QWORD *)(a1 + 48) == 1)
        goto LABEL_30;
    }
    else
    {
      if ((_DWORD)v12 == 1)
      {
        if (!*(_QWORD *)(a1 + 48))
        {
          if (+[UIDictationUtilities characterDeletionCount:](UIDictationUtilities, "characterDeletionCount:", v6))
          {
            v13 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithDeletion:", v6);
          }
          else
          {
            v13 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithoutDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithoutDeletion:", v6);
          }
          if (+[UIDictationUtilities characterInsertionCount:](UIDictationUtilities, "characterInsertionCount:", v6) < v13)+[UIDictationUtilities trackInsertion:text:range:](UIDictationUtilities, "trackInsertion:text:range:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          +[UIDictationUtilities updateCharacterInsertionCount:delta:](UIDictationUtilities, "updateCharacterInsertionCount:delta:", v6, 1);
          goto LABEL_35;
        }
LABEL_24:
        v14 = +[UIDictationUtilities characterSubstitutionCount:](UIDictationUtilities, "characterSubstitutionCount:", v6);
        v15 = +[UIDictationUtilities maxLoggableLengthOfInsertionBySubstitution:](UIDictationUtilities, "maxLoggableLengthOfInsertionBySubstitution:", v6);
        v16 = v15 - v14;
        if (v15 != v14)
        {
          objc_msgSend(v24, "attributedSubstringFromRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(*(id *)(a1 + 32), "length");
          if (v19 >= v16)
            v20 = v16;
          else
            v20 = v19;
          objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", 0, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIDictationUtilities trackSubstitution:originalText:originalTextRange:replacementText:replacementTextRange:](UIDictationUtilities, "trackSubstitution:originalText:originalTextRange:replacementText:replacementTextRange:", v6, v18, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v21, 0, v20);

        }
        +[UIDictationUtilities updateCharacterSubstitutionCount:delta:](UIDictationUtilities, "updateCharacterSubstitutionCount:delta:", v6, objc_msgSend(*(id *)(a1 + 32), "length"));
        goto LABEL_35;
      }
      if ((v12 & 0x80000000) == 0)
        goto LABEL_24;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      goto LABEL_24;
LABEL_30:
    +[UIDictationUtilities updateCharacterDeletionCount:delta:](UIDictationUtilities, "updateCharacterDeletionCount:delta:", v6, -(int)v12);
    objc_msgSend(v24, "attributedSubstringFromRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationUtilities trackDeletion:text:range:](UIDictationUtilities, "trackDeletion:text:range:", v6, v23, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_35:

  }
LABEL_36:

}

void __50__UITextInputController__insertText_fromKeyboard___block_invoke_442(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[12];
  v12 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v5, v4[13], &stru_1E16EDF20);
    objc_msgSend(*(id *)(a1 + 32), "_clearMarkedText");
    v4 = *(_QWORD **)(a1 + 32);
  }
  v6 = objc_msgSend(v4, "_newAttributedStringForInsertionOfText:inRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "string");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (int64_t)_resolveNaturalDirection:(int64_t)a3
{
  int64_t v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = a3;
  if (a3 == -1)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__UITextInputController__resolveNaturalDirection___block_invoke;
    v6[3] = &unk_1E16B7418;
    v6[4] = &v7;
    objc_msgSend(v4, "coordinateReading:", v6);

    v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __50__UITextInputController__resolveNaturalDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "string");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "_isNaturallyRTL");

}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (BOOL)_isInlineCompletionPresentedAsMarkedText:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "length") && self->_inputDelegateRespondsToInlineCompletionAsMarkedText)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
    objc_msgSend(WeakRetained, "inlineCompletionAsMarkedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attributedSubstringForMarkedRange
{
  void *v3;
  NSAttributedString *markedText;
  NSAttributedString *v5;
  _BOOL4 v6;
  NSAttributedString *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSAttributedString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSUInteger length;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v22;
  unint64_t v23;

  -[UITextInputController markedTextRange](self, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = 0;
    goto LABEL_21;
  }
  markedText = self->_markedText;
  if (!markedText)
  {
    v6 = +[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled");
    -[UITextInputController attributedTextInRange:](self, "attributedTextInRange:", v3);
    v7 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v22 = 0;
    v23 = 0;
    if (v6)
    {
      v8 = *(_QWORD *)off_1E1679240;
      -[NSAttributedString attribute:atIndex:effectiveRange:](v7, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1679240, 0, &v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v23;
        if (v10 >= -[NSAttributedString length](v5, "length", v22))
          goto LABEL_20;
      }
      v11 = (NSAttributedString *)-[NSAttributedString mutableCopy](v5, "mutableCopy", v22);
      -[NSAttributedString beginEditing](v11, "beginEditing");
      -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", v8, &unk_1E1A9A8C0, 0, -[NSAttributedString length](v5, "length"));
      -[UITextInputController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[UITextInputController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tintColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", *(_QWORD *)off_1E1679238, v15, 0, -[NSAttributedString length](v5, "length"));

      }
      length = self->_markedTextSelection.length;
      if (length)
      {
        v17 = self->_markedTextSelection.location + length;
        if (v17 <= -[NSAttributedString length](v5, "length"))
          -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", CFSTR("NSMarkedTextSelectionAttributeName"), MEMORY[0x1E0C9AAB0], self->_markedTextSelection.location, self->_markedTextSelection.length);
      }
      -[NSAttributedString endEditing](v11, "endEditing");
    }
    else
    {
      v18 = *(_QWORD *)off_1E1678C50;
      -[NSAttributedString attribute:atIndex:effectiveRange:](v7, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C50, 0, &v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v19 = v23;
        if (v19 >= -[NSAttributedString length](v5, "length", v22))
          goto LABEL_20;
      }
      v11 = (NSAttributedString *)-[NSAttributedString mutableCopy](v5, "mutableCopy", v22);
      +[UIColor _markedTextBackgroundColor](UIColor, "_markedTextBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", v18, v20, 0, -[NSAttributedString length](v5, "length"));

    }
    v5 = v11;
LABEL_20:

    goto LABEL_21;
  }
  v5 = markedText;
LABEL_21:

  return v5;
}

- (BOOL)isEditable
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  v3 = objc_msgSend(WeakRetained, "isEditable");

  return v3;
}

- (BOOL)isEditing
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  v3 = objc_msgSend(WeakRetained, "isEditing");

  return v3;
}

- (void)removeAlternativesForCurrentWord
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  id v14;
  _QWORD v15[6];

  if ((*((_BYTE *)&self->_tiFlags + 2) & 2) != 0)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      -[UITextInputController beginningOfDocument](self, "beginningOfDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController positionFromPosition:offset:](self, "positionFromPosition:offset:", v5, -[UITextInputController selectedRange](self, "selectedRange"));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[UITextInputController tokenizer](self, "tokenizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v14, 1, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[UITextInputController nsRangeForTextRange:](self, "nsRangeForTextRange:", v7);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v8;
        v11 = v9;
        -[UITextInputController _textStorage](self, "_textStorage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __57__UITextInputController_removeAlternativesForCurrentWord__block_invoke;
        v15[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
        v15[4] = v10;
        v15[5] = v11;
        objc_msgSend(v12, "coordinateEditing:", v15);

        WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
        objc_msgSend(WeakRetained, "removeAnnotationAttribute:forRange:", *(_QWORD *)off_1E16790E8, v7);

      }
    }
  }
}

uint64_t __57__UITextInputController_removeAlternativesForCurrentWord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", *(_QWORD *)off_1E16790E0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)insertText:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger length;
  NSUInteger v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  if (+[UIDictationController shouldInsertText:](UIDictationController, "shouldInsertText:"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_graphicsQuality") == 100)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v23, "rangeOfCharacterFromSet:", v6) != 0x7FFFFFFFFFFFFFFFLL;

    }
    v7 = -[UITextInputController selectedRange](self, "selectedRange");
    v8 = v7;
    v10 = v9;
    length = self->_markedTextRange.length;
    if (length)
    {
      v12 = v7 - length;
      -[UITextInputController _textStorage](self, "_textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      v8 = (v12 & 0x80000000) != 0 ? 0 : v12;
      if (v8 + v10 > v14)
        v10 = v14 - v8;
    }
    -[UITextInputController _textStorage](self, "_textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "substringWithRange:", v8, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController signalDictationInputEvent:insertedText:](self, "signalDictationInputEvent:insertedText:", v17, v23);

    getUndoActionNameTyping();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v18, v8, v10, v23);

    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    -[UITextInputController selectedTextRange](self, "selectedTextRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "start");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "emptyTextRangeAtPosition:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController setPreviousSelectedTextRange:](self, "setPreviousSelectedTextRange:", v22);

    -[UITextInputController _insertText:fromKeyboard:](self, "_insertText:fromKeyboard:", v23, 1);
    if (v5)
      -[UITextInputController notifyTextCheckingControllerForSelectionChange](self, "notifyTextCheckingControllerForSelectionChange");
    -[UITextInputController removeAlternativesForCurrentWord](self, "removeAlternativesForCurrentWord");
  }

}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
  -[UITextInputController addTextAlternativesDisplayStyle:toRange:invalidatingDisplayInBoundingRect:](self, "addTextAlternativesDisplayStyle:toRange:invalidatingDisplayInBoundingRect:", a3, a4.location, a4.length, 1);
}

- (void)invalidateDisplayForRange:(uint64_t)a1
{
  id *v3;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  if (a1)
  {
    v3 = (id *)(a1 + 232);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "boundingRectForRange:", v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = objc_loadWeakRetained((id *)(a1 + 152));
    objc_msgSend(v14, "setNeedsDisplayInRect:", v7, v9, v11, v13);

  }
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4 invalidatingDisplayInBoundingRect:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  *(_DWORD *)&self->_tiFlags |= 0x20000u;
  p_textLayoutController = &self->_textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)p_textLayoutController);
  v13 = *(_QWORD *)off_1E16790E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnnotationAttribute:value:forRange:", v13, v14, v15);

  if (v5)
    -[UITextInputController invalidateDisplayForRange:]((uint64_t)self, v15);

}

- (void)insertAttributedText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  getUndoActionNameTyping();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITextInputController selectedRange](self, "selectedRange");
  v8 = v7;
  objc_msgSend(v4, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v5, v6, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emptyTextRangeAtPosition:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setPreviousSelectedTextRange:](self, "setPreviousSelectedTextRange:", v13);

  v14 = -[UITextInputController selectedRange](self, "selectedRange");
  v16 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v4, v14, v15);

  -[UITextInputController _insertAttributedText:fromKeyboard:](self, "_insertAttributedText:fromKeyboard:", v16, 1);
  if (_os_feature_enabled_impl())
    -[UITextInputController notifyTextCheckingControllerForSelectionChange](self, "notifyTextCheckingControllerForSelectionChange");

}

- (void)_insertAttributedText:(id)a3 fromKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[7];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a4;
  v20 = a3;
  if (!-[UITextInputController isWritingToolsStreamingReplacements](self, "isWritingToolsStreamingReplacements"))
  {
    if (v4)
      v6 = 0x2000;
    else
      v6 = 0;
    self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | v6);
    -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
    v7 = -[UITextInputController _rangeToReplaceWhenInsertingText](self, "_rangeToReplaceWhenInsertingText");
    v9 = v8;
    -[UITextInputController _selectedText](self, "_selectedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController signalDictationInputEvent:insertedText:](self, "signalDictationInputEvent:insertedText:", v10, v11);

    v12 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v7, v9);
    v14 = v13;
    if ((*((_BYTE *)&self->_tiFlags + 1) & 0x10) != 0)
    {
      -[UITextInputController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textInput:willChangeCharactersInRange:", self, v12, v14);

    }
    -[UITextInputController _textStorage](self, "_textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke;
    v22[3] = &unk_1E16E6608;
    v22[4] = self;
    v24 = v12;
    v25 = v14;
    v18 = v20;
    v23 = v18;
    objc_msgSend(v16, "coordinateEditing:", v22);

    v19 = *(_QWORD *)off_1E16790E0;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke_2;
    v21[3] = &unk_1E16E6630;
    v21[5] = v12;
    v21[6] = v14;
    v21[4] = self;
    objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, objc_msgSend(v18, "length"), 0, v21);
    -[UITextInputController setSelectedRange:](self, "setSelectedRange:", -[UITextInputController _selectedRange](self, "_selectedRange") + objc_msgSend(v18, "length"), 0);
    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v18, v12, v14);
    *(_DWORD *)&self->_tiFlags &= ~0x2000u;

  }
}

void __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 96);
  v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v5, *(_QWORD *)(v4 + 104), &stru_1E16EDF20);
    objc_msgSend(*(id *)(a1 + 32), "_clearMarkedText");
    v3 = v6;
  }
  objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

uint64_t __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke_2(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;

  if (a2)
  {
    v5 = result;
    v6 = *(void **)(result + 32);
    v7 = *(_QWORD *)(result + 40) + a3;
    v8 = a2;
    objc_msgSend(v6, "_textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR(" "));

    v13 = v7 + v12;
    LODWORD(v7) = objc_msgSend(v8, "isLowConfidence");

    return objc_msgSend(*(id *)(v5 + 32), "addTextAlternativesDisplayStyle:toRange:", v7, v13, a4 - v12);
  }
  return result;
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  getUndoActionNameTyping();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITextInputController selectedRange](self, "selectedRange");
  v7 = v6;
  objc_msgSend(v9, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v4, v5, v7, v8);

  -[UITextInputController _insertAttributedText:fromKeyboard:](self, "_insertAttributedText:fromKeyboard:", v9, 1);
}

- (NSAttributedString)filteredAttributedText
{
  _UITextLayoutController **p_textLayoutController;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  p_textLayoutController = &self->_textLayoutController;
  v4 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(v4, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(WeakRetained, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInputController attributedTextInRange:](self, "attributedTextInRange:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v9;
}

- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[UITextInputController selectedRange](self, "selectedRange");
  v10 = v9;
  objc_msgSend(v6, "string");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v7, v8, v10, v11);
}

- (_NSRange)_rangeForBackwardsDelete
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v3 = -[UITextInputController _selectedRange](self, "_selectedRange");
  length = v4;
  if (-[UITextInputController _hasMarkedText](self, "_hasMarkedText"))
  {
    location = self->_markedTextSelection.location;
    length = self->_markedTextSelection.length;
    v3 += location;
    if (!location)
      goto LABEL_7;
  }
  else if (!v3)
  {
    goto LABEL_7;
  }
  if (!length)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    v3 = objc_msgSend(WeakRetained, "rangeOfCharacterClusterAtIndex:type:", v3 - 1, 4);
    length = v8;

  }
LABEL_7:
  v9 = v3;
  v10 = length;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)_updateRangeForSmartDelete
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;

  v3 = -[UITextInputController selectedRange](self, "selectedRange");
  if (v4)
  {
    v5 = v3;
    v6 = v4;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "smartInsertDeleteIsEnabled");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DBDD20], "traitsForUITextInputTraits:", self->_textInputTraits);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDCC8]), "initWithTextInputTraits:", v9);
      objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0uLL;
      objc_msgSend(v10, "smartDeleteForDocumentState:outBeforeLength:outAfterLength:", v11, (char *)&v12 + 8, &v12);
      if (v12 != 0)
        -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v5 - *((_QWORD *)&v12 + 1), *((_QWORD *)&v12 + 1) + v6 + (_QWORD)v12);

    }
  }
}

- (unint64_t)textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  unint64_t v12;

  -[UITextInputController selectedRange](self, "selectedRange");
  if (!v3)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "smartInsertDeleteIsEnabled");

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x1E0DBDD20], "traitsForUITextInputTraits:", self->_textInputTraits);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDCC8]), "initWithTextInputTraits:", v6);
  objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  objc_msgSend(v7, "smartDeleteForDocumentState:outBeforeLength:outAfterLength:", v8, &v12, &v11);
  v9 = v12;

  if (!v9)
    return 0;
  return v9;
}

uint64_t __50__UITextInputController_removeAllTextAlternatives__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", *(_QWORD *)off_1E16790E0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __38__UITextInputController_didEndEditing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", CFSTR("_UITextInputDictationResultMetadata"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)deleteBackward
{
  uint64_t v4;
  _QWORD v5[6];

  if (-[UITextInputController _selectedRange](self, "_selectedRange")
    || (-[UITextInputController _selectedRange](self, "_selectedRange"), v4))
  {
    if (+[UIDictationController shouldDeleteBackward](UIDictationController, "shouldDeleteBackward"))
    {
      -[UITextInputController signalDictationDeletionTip](self, "signalDictationDeletionTip");
      *(_DWORD *)&self->_tiFlags |= 0x2000u;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __39__UITextInputController_deleteBackward__block_invoke;
      v5[3] = &unk_1E16B1888;
      v5[4] = self;
      v5[5] = a2;
      -[UITextInputController _performWhileSuppressingDelegateNotifications:](self, "_performWhileSuppressingDelegateNotifications:", v5);
      -[UITextInputController _insertText:fromKeyboard:](self, "_insertText:fromKeyboard:", &stru_1E16EDF20, 1);
      -[UITextInputController removeSpellingMarkersForCurrentWord](self, "removeSpellingMarkersForCurrentWord");
      -[UITextInputController removeAlternativesForCurrentWord](self, "removeAlternativesForCurrentWord");
      *(_DWORD *)&self->_tiFlags &= ~0x2000u;
    }
  }
}

void __39__UITextInputController_deleteBackward__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
  v2 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v2, "_updateRangeForSmartDelete");
    v4 = *(void **)(a1 + 32);
    getUndoActionNameTyping();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    objc_msgSend(v4, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v5, v6, v7, &stru_1E16EDF20);

LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "emptyTextRangeAtPosition:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPreviousSelectedTextRange:", v16);

    return;
  }
  v8 = objc_msgSend(v2, "_rangeForBackwardsDelete");
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = *(void **)(a1 + 32);
    getUndoActionNameTyping();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v13, v10, v11, &stru_1E16EDF20);

    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", v10, v11);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UITextInputController.m"), 1457, CFSTR("Failed to deleteBackward in a non-empty document."));

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) &= ~0x2000u;
}

- (void)checkSmartPunctuationForWordInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  id WeakRetained;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  char v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !-[UITextInputController isWritingToolsStreamingReplacements](self, "isWritingToolsStreamingReplacements"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "smartPunctuationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[UITextInputController selectedRange](self, "selectedRange");
      v32 = v8;
      -[UITextInputController textInRange:](self, "textInRange:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v10, "beginningOfDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "offsetFromPosition:toPosition:", v11, v12);

      objc_msgSend(v6, "smartPunctuationResultsForString:", v9);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v14)
      {
        v15 = v14;
        v28 = v7;
        v29 = v9;
        v30 = v6;
        v31 = v4;
        v33 = 0;
        v16 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "range", v28, v29, v30, v31);
            v21 = v20;
            v22 = v19 + v13;
            objc_msgSend(v18, "replacementString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[UITextInputController _delegateShouldChangeTextInRange:replacementText:](self, "_delegateShouldChangeTextInRange:replacementText:", v22, v21, v23);

            if (v24)
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
              objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v22, v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "replacementString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextInputController replaceRange:withText:](self, "replaceRange:withText:", v26, v27);

              v33 = 1;
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v15);
        v6 = v30;
        v4 = v31;
        v9 = v29;
        if ((v33 & 1) != 0)
          -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v28, v32);
      }

    }
  }

}

- (id)textChecker
{
  UITextChecker *textChecker;
  UITextChecker *v4;
  UITextChecker *v5;
  UITextChecker *v6;

  textChecker = self->_textChecker;
  if (!textChecker)
  {
    v4 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
    v5 = self->_textChecker;
    self->_textChecker = v4;

    textChecker = self->_textChecker;
  }
  if (-[UITextChecker _doneLoading](textChecker, "_doneLoading"))
    v6 = self->_textChecker;
  else
    v6 = 0;
  return v6;
}

- (void)preheatTextChecker
{
  UITextChecker *v3;
  UITextChecker *textChecker;

  if (!self->_textChecker)
  {
    v3 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
    textChecker = self->_textChecker;
    self->_textChecker = v3;

  }
}

- (void)checkSpellingForWordInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UITextInputController textInRange:](self, "textInRange:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController textChecker](self, "textChecker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_19:

      goto LABEL_20;
    }
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentInputMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "multilingualLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v8, "multilingualLanguages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "primaryLanguage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v8, "languageWithRegion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detectedLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "language");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
      {
        objc_msgSend(v11, "arrayByAddingObject:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_15:

        v11 = (void *)v19;
      }
    }
    else
    {
      if (v17 && (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
      {
        objc_msgSend(v11, "arrayByAddingObject:", v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v18 = 0;
        goto LABEL_15;
      }
      v18 = 0;
    }
    if (objc_msgSend(v6, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v5, 0, objc_msgSend(v5, "length"), 0, 0, v11) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UITextInputController beginningOfDocument](self, "beginningOfDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "start");
      v27 = v5;
      v21 = v8;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[UITextInputController offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v20, v22);

      objc_msgSend(v4, "start");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[UITextInputController offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v23, v24);

      v8 = v21;
      v5 = v27;

      -[UITextInputController addTextAlternativesDisplayStyle:toRange:](self, "addTextAlternativesDisplayStyle:toRange:", 2, v26, v25);
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (_NSRange)nsRangeForTextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  if (a3)
  {
    v4 = a3;
    -[UITextInputController beginningOfDocument](self, "beginningOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UITextInputController offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v5, v6);

    objc_msgSend(v4, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[UITextInputController offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v8, v9);
  }
  else
  {
    v10 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v11 = v7;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)textRangeForNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;
  void *v6;

  length = a3.length;
  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeSpellingMarkersFromWordInRange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;

  v23 = a3;
  v4 = -[UITextInputController nsRangeForTextRange:](self, "nsRangeForTextRange:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    v9 = *(_QWORD *)off_1E16790E8;
    objc_msgSend(v23, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "annotationAttribute:atPosition:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && objc_msgSend(v11, "integerValue") == 2)
    {
      v12 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v12, "removeAnnotationAttribute:forRange:", v9, v23);

      v13 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v13, "boundingRectForCharacterRange:", v6, v7);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v22 = objc_loadWeakRetained((id *)&self->_firstTextView);
      objc_msgSend(v22, "setNeedsDisplayInRect:", v15, v17, v19, v21);

    }
  }

}

- (void)removeSpellingMarkersForCurrentWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    -[UITextInputController tokenizer](self, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[UITextInputController tokenizer](self, "tokenizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UITextInputController removeSpellingMarkersFromWordInRange:](self, "removeSpellingMarkersFromWordInRange:", v6);

    v4 = v8;
  }

}

- (void)notifyTextCheckingControllerForSelectionChange
{
  UITextCheckingController *textCheckingController;
  id v3;

  textCheckingController = self->_textCheckingController;
  -[UITextInputController previousSelectedTextRange](self, "previousSelectedTextRange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextCheckingController didChangeSelectionFromRange:](textCheckingController, "didChangeSelectionFromRange:", v3);

}

- (void)checkSpellingForSelectionChangeIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (-[UITextInputController continuousSpellCheckingEnabled](self, "continuousSpellCheckingEnabled"))
  {
    -[UITextInputController previousSelectedTextRange](self, "previousSelectedTextRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "start");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UITextInputController tokenizer](self, "tokenizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 1, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[UITextInputController tokenizer](self, "tokenizer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 1, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v17 = 0;
    }
    -[UITextInputController beginningOfDocument](self, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController positionFromPosition:offset:](self, "positionFromPosition:offset:", v7, -[UITextInputController selectedRange](self, "selectedRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextInputController tokenizer](self, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[UITextInputController tokenizer](self, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = -[UITextInputController nsRangeForTextRange:](self, "nsRangeForTextRange:", v17);
    v14 = v13;
    if ((objc_msgSend(v17, "isEqual:", v10) & 1) == 0)
    {
      v15 = -[UITextInputController selectedRange](self, "selectedRange");
      if (v15 + v16 < v12 || -[UITextInputController selectedRange](self, "selectedRange") > v12 + v14)
      {
        -[UITextInputController checkSpellingForWordInRange:](self, "checkSpellingForWordInRange:", v17);
        -[UITextInputController removeSpellingMarkersFromWordInRange:](self, "removeSpellingMarkersFromWordInRange:", v10);
      }
    }

  }
}

- (BOOL)performFinalGrammarChecking
{
  return -[UITextCheckingController performFinalGrammarChecking](self->_textCheckingController, "performFinalGrammarChecking");
}

- (void)applyGrammarCheckingIndication
{
  -[UITextCheckingController applyGrammarCheckingIndication](self->_textCheckingController, "applyGrammarCheckingIndication");
}

- (void)beginSelectionChange
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  objc_msgSend(WeakRetained, "selectionWillChange:", self);

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setPreviousSelectedTextRange:](self, "setPreviousSelectedTextRange:", v4);

}

- (void)endSelectionChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  id WeakRetained;

  -[UITextInputController notifyTextCheckingControllerForSelectionChange](self, "notifyTextCheckingControllerForSelectionChange");
  -[UITextInputController previousSelectedTextRange](self, "previousSelectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (v5 && v6)
    {
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", 0);
  }
LABEL_9:
  -[UITextInputController changingContextWithTrigger:](self, "changingContextWithTrigger:", CFSTR("selectionChange"));
  +[UIKBAnalyticsDispatcher incrementAllowCursorMovementCount](UIKBAnalyticsDispatcher, "incrementAllowCursorMovementCount");
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  objc_msgSend(WeakRetained, "selectionDidChange:", self);

  +[UIKBAnalyticsDispatcher decrementAllowCursorMovementCount](UIKBAnalyticsDispatcher, "decrementAllowCursorMovementCount");
}

- (void)changingContextWithTrigger:(id)a3
{
  UITextInputDelegate **p_inputDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_inputDelegate = &self->_inputDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_inputDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    objc_msgSend(v7, "performSelector:withObject:", sel_changingContextWithTrigger_, v8);

  }
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsStart");
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsEnd");
}

BOOL __48__UITextInputController_selectionRectsForRange___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL8 v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = objc_msgSend(v4, "isVertical");
    if (v7 == objc_msgSend(v5, "isVertical"))
    {
      v8 = objc_msgSend(v4, "isVertical");
      objc_msgSend(v4, "rect");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v5, "rect");
      if (v8)
        v6 = v10 == v13;
      else
        v6 = v12 == v14;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (id)_rectsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController selectionRectsForRange:](self, "selectionRectsForRange:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_characterPositionForPoint:(CGPoint)a3
{
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v31;
  double v32;
  id v33;
  double v35;
  double v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  p_textLayoutController = &self->_textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v35 = v10;
    v36 = *MEMORY[0x1E0C9D538];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "textView", *(_QWORD *)&v35);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UITextInputController _shouldConsiderTextViewForGeometry:](self, "_shouldConsiderTextViewForGeometry:", v13))
        {
          v14 = objc_opt_respondsToSelector();
          v15 = v36;
          v16 = v10;
          if ((v14 & 1) != 0)
            objc_msgSend(v13, "textContainerOrigin", v36, v10);
          v17 = a3.x - v15;
          v18 = a3.y - v16;
          objc_msgSend(v13, "bounds");
          x = v45.origin.x;
          y = v45.origin.y;
          width = v45.size.width;
          height = v45.size.height;
          v44.x = v17;
          v44.y = v18;
          if (CGRectContainsPoint(v45, v44))
            goto LABEL_14;
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = width;
          v46.size.height = height;
          v23 = CGRectGetMinX(v46) - v17;
          v47.origin.x = x;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = height;
          v24 = fmin(v23, v17 - CGRectGetMaxX(v47));
          v48.origin.x = x;
          v48.origin.y = y;
          v48.size.width = width;
          v48.size.height = height;
          v25 = CGRectGetMinY(v48) - v18;
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = width;
          v49.size.height = height;
          v26 = fmin(v25, v18 - CGRectGetMaxY(v49));
          v27 = v24 * v24;
          v10 = v35;
          if (v27 + v26 * v26 < INFINITY)
          {
LABEL_14:
            objc_msgSend(v12, "size");
            if (y <= a3.y && a3.y <= y + height)
            {
              v31 = v10 + v29;
              if (v18 > v10 + v29)
              {
                objc_msgSend(v13, "_currentScreenScale");
                v18 = v31 + -1.0 / v32;
              }
              if (v18 < v10)
                v18 = v10;
            }
            v33 = objc_loadWeakRetained((id *)p_textLayoutController);
            objc_msgSend(v33, "cursorPositionAtPoint:inContainer:", v12, v17, v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v8)
        continue;
      break;
    }
  }

  v6 = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(v6, "endOfDocument");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v28;
}

- (unint64_t)_validCaretPositionFromCharacterIndex:(unint64_t)a3 downstream:(BOOL)a4
{
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = a3;
  -[UITextInputController _textStorage](self, "_textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__UITextInputController__validCaretPositionFromCharacterIndex_downstream___block_invoke;
  v9[3] = &unk_1E16E6710;
  v9[4] = self;
  v9[5] = &v11;
  v10 = a4;
  objc_msgSend(v6, "coordinateReading:", v9);

  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __74__UITextInputController__validCaretPositionFromCharacterIndex_downstream___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  CGRect v15;

  v14 = a2;
  objc_msgSend(v14, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4 != objc_msgSend(v3, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    v6 = objc_msgSend(WeakRetained, "rangeOfCharacterClusterAtIndex:type:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 3);
    v8 = v7;

    while (1)
    {
      if (*(_BYTE *)(a1 + 48))
        v9 = v8;
      else
        v9 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9 + v6;
      objc_msgSend(*(id *)(a1 + 32), "_caretRectForOffset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      if (!CGRectIsNull(v15))
        break;
      if (*(_BYTE *)(a1 + 48))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        if (v10 < objc_msgSend(v3, "length"))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = *(_QWORD *)(v11 + 24);
          if (*(_BYTE *)(a1 + 48))
            goto LABEL_15;
          goto LABEL_14;
        }
        if (*(_BYTE *)(a1 + 48))
          break;
      }
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(_QWORD *)(v11 + 24);
      if (!v12)
        break;
LABEL_14:
      --v12;
LABEL_15:
      *(_QWORD *)(v11 + 24) = v12;
      v6 = objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v8 = v13;
    }
  }

}

- (id)_parentScrollView
{
  void *v2;
  uint64_t v3;

  -[UITextInputController _firstTextView](self, "_firstTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)scrollRangeToVisible:(_NSRange)a3
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
  void *v13;
  id v14;

  -[UITextInputController _rectsForRange:](self, "_rectsForRange:", a3.location, a3.length);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[UITextInputController _parentScrollView](self, "_parentScrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrollRectToVisible:animated:", 1, v6, v8, v10, v12);

  }
}

- (void)_ensureSelectionVisible
{
  -[UITextInputController scrollRangeToVisible:](self, "scrollRangeToVisible:", -[UITextInputController _selectedRange](self, "_selectedRange"), 1);
}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__207;
  v16 = __Block_byref_object_dispose__207;
  v17 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__UITextInputController_attributedTextInRange___block_invoke;
  v9[3] = &unk_1E16E6738;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "coordinateReading:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__UITextInputController_attributedTextInRange___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSRange v28;
  NSRange v29;

  v27 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v4);

  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  v7 = objc_msgSend(v6, "characterRangeForTextRange:", *(_QWORD *)(a1 + 40));
  v9 = v8;

  if ((int)v7 < 0)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10 + v7;
  if ((v11 & 0x80000000) != 0)
    v12 = 0;
  else
    v12 = v11;
  if (v12 > objc_msgSend(v27, "length"))
    v12 = objc_msgSend(v27, "length");
  if (v12 + v9 > objc_msgSend(v27, "length"))
    v9 = objc_msgSend(v27, "length") - v12;
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (v13)
  {
    objc_msgSend(v13, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "attachmentRange");
    v17 = v16;

    v28.location = v12;
    v28.length = v9;
    v29.location = v15;
    v29.length = v17;
    v18 = NSIntersectionRange(v28, v29);
    if (v18.length)
    {
      objc_msgSend(v27, "attributedSubstringFromRange:", v12, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 65532);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "replaceCharactersInRange:withString:", v18.location - v12, v18.length, v21);

      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v20;

    }
  }
  objc_msgSend(v27, "attributedSubstringFromRange:", v12, v9);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = -[UITextInputController _selectedRange](self, "_selectedRange");
  v9 = -[UITextInputController _newAttributedStringForInsertionOfText:inRange:](self, "_newAttributedStringForInsertionOfText:inRange:", v6, v7, v8);

  v10 = -[UITextInputController _replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:](self, "_replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:", v11, v9, 0, 1);
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[UITextInputController _replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:](self, "_replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:", v8, v6, -[UITextInputController isWritingToolsStreamingReplacements](self, "isWritingToolsStreamingReplacements") ^ 1, 1);

}

- (id)replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[UITextInputController _replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:](self, "_replaceRange:withAttributedTextFromKeyboard:addingUnderlinesForAlternatives:updatingSelection:", v9, v8, -[UITextInputController isWritingToolsStreamingReplacements](self, "isWritingToolsStreamingReplacements") ^ 1, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_replaceRange:(id)a3 withAttributedTextFromKeyboard:(id)a4 addingUnderlinesForAlternatives:(BOOL)a5 updatingSelection:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  BOOL v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  unint64_t v40;
  NSObject *v41;
  const __CFString *v42;
  const __CFString *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _BYTE *v51;
  uint64_t *v52;
  BOOL v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t v60[128];
  _BYTE buf[24];
  const __CFString *v62;
  __int128 v63;
  uint64_t v64;

  v6 = a6;
  v7 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
  {
    v40 = _replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection____s_category;
    if (!_replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection____s_category)
    {
      v40 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v40, (unint64_t *)&_replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection____s_category);
    }
    v41 = *(NSObject **)(v40 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v10;
      if (v7)
        v43 = CFSTR("YES");
      else
        v43 = CFSTR("NO");
      if (v6)
        v42 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v62 = v43;
      LOWORD(v63) = 2112;
      *(_QWORD *)((char *)&v63 + 2) = v42;
      _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "replacing range, %@, with attributed text: %@\naddUnderlines? %@ updateSelection? %@", buf, 0x2Au);
    }
  }
  *(_DWORD *)&self->_tiFlags |= 0x2000u;
  v12 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3010000000;
  v62 = (const __CFString *)&unk_18685B0AF;
  v63 = xmmword_186679030;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__207;
  v58 = __Block_byref_object_dispose__207;
  v59 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke;
  v48[3] = &unk_1E16E6788;
  v48[4] = self;
  v51 = buf;
  v14 = v10;
  v49 = v14;
  v15 = v11;
  v53 = v7;
  v50 = v15;
  v52 = &v54;
  objc_msgSend(v13, "coordinateEditing:", v48);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = (id)v55[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v16);
        -[UITextInputController invalidateDisplayForRange:]((uint64_t)self, *(void **)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v17);
  }

  p_textLayoutController = &self->_textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(v14, "start", (_QWORD)v44);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v22, objc_msgSend(v15, "length"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v24 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v24, "emptyTextRangeAtPosition:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController setSelectedTextRange:](self, "setSelectedTextRange:", v25);

    -[UITextInputController interactionAssistant](self, "interactionAssistant");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "selectionChanged");

    v27 = -[UITextInputController selectedRange](self, "selectedRange");
    if (v27 + v28 >= v12)
      v29 = v27 + v28 - v12;
    else
      v29 = 0;
    if (v27 + v28 >= v12)
      v30 = v12;
    else
      v30 = v27 + v28;
    v31 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v31, "textRangeForCharacterRange:", v30, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextInputController checkSmartPunctuationForWordInRange:](self, "checkSmartPunctuationForWordInRange:", v32);
  }
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 32), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  *(_DWORD *)&self->_tiFlags &= ~0x2000u;
  objc_msgSend(v14, "start");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    v34 = v23 == 0;
  else
    v34 = 1;
  v35 = v34;

  if ((v35 & 1) != 0)
  {
    v36 = 0;
  }
  else
  {
    v37 = objc_loadWeakRetained((id *)p_textLayoutController);
    objc_msgSend(v14, "start");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textRangeFromPosition:toPosition:", v38, v23);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(buf, 8);
  return v36;
}

void __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  int8x16_t v38;

  v36 = a2;
  objc_msgSend(v36, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v5);

  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  v8 = objc_msgSend(v7, "characterRangeForTextRange:", *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = v10;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(_QWORD *)(v11 + 32);
  if ((int)v12 < 0)
    v13 = v6;
  else
    v13 = 0;
  *(_QWORD *)(v11 + 32) = v13 + v12;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(_QWORD *)(v14 + 32);
  if ((int)v15 < 0)
    v15 = 0;
  *(_QWORD *)(v14 + 32) = v15;
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  if (v16 <= objc_msgSend(v3, "length"))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(_QWORD *)(v18 + 32);
  }
  else
  {
    v17 = objc_msgSend(v3, "length");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_QWORD *)(v18 + 32) = v17;
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  if (v19 <= objc_msgSend(v3, "length"))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(_QWORD *)(v21 + 40);
  }
  else
  {
    v20 = objc_msgSend(v3, "length");
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = v20 - *(_QWORD *)(v21 + 32);
  }
  *(_QWORD *)(v21 + 40) = v22;
  v23 = *(void **)(a1 + 32);
  _UIKitBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Replace"), CFSTR("Replace"), CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  objc_msgSend(*(id *)(a1 + 48), "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v25, *(_QWORD *)(v26 + 32), *(_QWORD *)(v26 + 40), v27);

  v28 = objc_msgSend(*(id *)(a1 + 32), "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v29 + 32) = v28;
  *(_QWORD *)(v29 + 40) = v30;
  v31 = *(_BYTE **)(a1 + 32);
  if ((v31[145] & 0x10) != 0)
  {
    objc_msgSend(v31, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textInput:willChangeCharactersInRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  }
  objc_msgSend(v36, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 72))
  {
    v33 = *(void **)(a1 + 48);
    v34 = *(_QWORD *)off_1E16790E0;
    v35 = objc_msgSend(v33, "length");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke_2;
    v37[3] = &unk_1E16E6760;
    v38 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v37[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v33, "enumerateAttribute:inRange:options:usingBlock:", v34, 0, v35, 0, v37);
  }

}

void __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;

  v7 = a2;
  if (v7)
  {
    v16 = v7;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) + a3;
    objc_msgSend(*(id *)(a1 + 32), "addTextAlternativesDisplayStyle:toRange:invalidatingDisplayInBoundingRect:", objc_msgSend(v16, "isLowConfidence"), v11, a4, 0);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    WeakRetained = objc_loadWeakRetained((id *)(v12 + 232));
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v11, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    v7 = v16;
  }

}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  UITextInputController *v29;
  id v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v9 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v6);
  v11 = v10;

  if ((*((_BYTE *)&self->_tiFlags + 1) & 0x10) != 0)
  {
    -[UITextInputController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInput:willChangeCharactersInRange:", self, v9, v11);

  }
  getUndoActionNameTyping();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v13, v9, v11, &stru_1E16EDF20);

  getUndoActionNameTyping();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v14, v9, 0, v7);

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __82__UITextInputController_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke;
  v28 = &unk_1E16C1C58;
  v29 = self;
  v30 = v6;
  v16 = (const __CFString *)v7;
  v31 = (__CFString *)v16;
  v32 = v9;
  v33 = v11;
  v17 = v6;
  -[UITextInputController _performWhileSuppressingDelegateNotifications:](self, "_performWhileSuppressingDelegateNotifications:", &v25);
  if (v16)
    v18 = v16;
  else
    v18 = &stru_1E16EDF20;
  -[UITextInputController selectedTextRange](self, "selectedTextRange", v18, v25, v26, v27, v28, v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v15, "isEqual:", v19) ^ 1;
  v21 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[UITextInputController typingAttributes](self, "typingAttributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v24, v22);
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, v20, v23, v9, v11);

}

void __82__UITextInputController_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_insertText:fromKeyboard:", *(_QWORD *)(a1 + 48), 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  v3 = *(_QWORD *)(a1 + 56);
  v5 = v2 + v4 - v3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v3, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "checkSmartPunctuationForWordInRange:", v7);
}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "correctedTypedText:rangeOfReplacement:", v8, v6);

}

- (void)_performWhileSuppressingDelegateNotifications:(id)a3
{
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;

  tiFlags = self->_tiFlags;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x80000);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFF7FFFF | (((*(unsigned int *)&tiFlags >> 19) & 1) << 19));
}

- (int64_t)selectionAffinity
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  -[UITextRange end](self->_selectedTextRange, "end");

  return *(_OWORD *)&self->_markedTextRange.length != 0;
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 fromKeyboard:(BOOL)a5 useTextStyle:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id WeakRetained;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  id v40;
  NSUInteger v41;
  unint64_t v42;
  uint64_t v43;
  NSUInteger v44;
  void *v45;
  NSUInteger v46;
  NSUInteger v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = self->_markedTextRange.length;
  if (v11)
  {
    v12 = self->_markedTextRange.location;
  }
  else
  {
    v12 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v11 = v13;
  }
  v46 = length;
  if (v6)
  {
    -[UITextInputController markedTextStyle](self, "markedTextStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = v17;

    -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", v12, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addEntriesFromDictionary:", v20);

    v18 = (void *)objc_msgSend(v19, "copy");
  }
  else
  {
    -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", v12, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v10, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v18);

  objc_msgSend(v23, "beginEditing");
  v24 = objc_msgSend(v10, "length");
  v25 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke;
  v69[3] = &unk_1E16B1620;
  v26 = v23;
  v70 = v26;
  objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v69);
  if ((*(_BYTE *)&self->_tiFlags & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "textInput:prepareAttributedTextForInsertion:", self, v26);

  }
  objc_msgSend(v26, "endEditing", v46);
  v28 = (void *)objc_msgSend(v26, "copy");

  v29 = objc_msgSend(v28, "length");
  if (v29 || self->_markedTextRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_DWORD *)&self->_tiFlags |= 0x8000u;
    -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 1);
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3010000000;
    v63 = 0;
    v64 = 0;
    v62 = &unk_18685B0AF;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__207;
    v57 = __Block_byref_object_dispose__207;
    v58 = 0;
    -[UITextInputController _textStorage](self, "_textStorage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v25;
    v48[1] = 3221225472;
    v48[2] = __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke_2;
    v48[3] = &unk_1E16E67B0;
    v48[4] = self;
    v31 = v28;
    v49 = v31;
    v50 = &v53;
    v51 = &v59;
    v52 = &v65;
    objc_msgSend(v30, "coordinateEditing:", v48);

    -[UITextInputController _textStorage](self, "_textStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");

    if (v66[3] != v33)
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "string");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "substringWithRange:", self->_markedTextRange.location, self->_markedTextRange.length);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "string");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

      if ((v38 & 1) == 0)
      {
        v39 = v33 - v66[3];
        location += v39;
        self->_markedTextRange.location += v39;
      }
    }
    v40 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v40, "invalidateDisplayForCharacterRange:", self->_markedTextRange.location, self->_markedTextRange.length);

    -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", self->_markedTextRange.location, self->_markedTextRange.length);
    v41 = self->_markedTextRange.location;
    v42 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v44 = v47;
    if (v41 + location > v42 + v43 || v42 > v41 + location + v47)
    {
      v44 = 0;
      location = self->_markedTextRange.length;
    }
    self->_markedTextSelection.location = location;
    self->_markedTextSelection.length = v44;
    -[UITextInputController interactionAssistant](self, "interactionAssistant");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "selectionChanged");

    if (!v29)
      -[UITextInputController unmarkText](self, "unmarkText");
    *(_DWORD *)&self->_tiFlags &= ~0x8000u;
    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 1, v54[5], v60[4], v60[5]);

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v65, 8);
  }

}

uint64_t __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[13];
  if (!v4)
  {
    v3[12] = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
    v3[13] = v5;
    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[13];
  }
  v3[12] = objc_msgSend(v3, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v3[12], v4);
  v3[13] = v6;
  v7 = *(void **)(a1 + 32);
  getUndoActionNameTyping();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v8, *(_QWORD *)(v9 + 96), *(_QWORD *)(v9 + 104), v10);

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "_newAttributedStringForInsertionOfText:inRange:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v16 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v16 + 145) & 0x10) != 0)
  {
    objc_msgSend((id)v16, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textInput:willChangeCharactersInRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v16 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(v16 + 96), *(_QWORD *)(v16 + 104), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v18, "length");

}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSUInteger v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  id v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = self->_markedTextRange.length;
  v14 = v7;
  if (v8)
  {
    v9 = v7;
    v10 = self->_markedTextRange.location;
  }
  else
  {
    v11 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v9 = v14;
    v10 = v11;
    v8 = v12;
  }
  v13 = -[UITextInputController _newAttributedStringForInsertionOfText:inRange:](self, "_newAttributedStringForInsertionOfText:inRange:", v9, v10, v8);
  -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v13, location, length, 0, 1);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSUInteger v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  id v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = self->_markedTextRange.length;
  v14 = v7;
  if (v8)
  {
    v9 = v7;
    v10 = self->_markedTextRange.location;
  }
  else
  {
    v11 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v9 = v14;
    v10 = v11;
    v8 = v12;
  }
  v13 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v9, v10, v8);
  -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v13, location, length, 0, 1);

}

- (void)_clearMarkedText
{
  NSAttributedString *markedText;

  self->_markedTextRange = (_NSRange)xmmword_186679030;
  markedText = self->_markedText;
  self->_markedText = 0;

}

- (void)_forceUnmarkTextDueToEditing
{
  -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", -[UITextInputController _selectedRange](self, "_selectedRange") + self->_markedTextRange.location, 0);
  -[UITextInputController _clearMarkedText](self, "_clearMarkedText");
}

- (void)unmarkText
{
  -[UITextInputController unmarkText:](self, "unmarkText:", 1);
}

- (void)unmarkText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;

  if (self->_markedTextRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a3;
    -[UITextInputController markedTextStyle](self, "markedTextStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && self->_markedTextRange.length)
    {

      if (!v3)
      {
LABEL_7:
        -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 1);
        -[UITextInputController _clearMarkedText](self, "_clearMarkedText");
        WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
        v11 = -[UITextInputController _selectedRange](self, "_selectedRange");
        objc_msgSend(WeakRetained, "invalidateDisplayForCharacterRange:", v11, v12);

        -[UITextInputController setSelectedRange:](self, "setSelectedRange:", -[UITextInputController _selectedRange](self, "_selectedRange") + self->_markedTextSelection.location, 0);
        -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 1);
        return;
      }
      -[UITextInputController _textStorage](self, "_textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "substringWithRange:", self->_markedTextRange.location, self->_markedTextRange.length);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
      -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v9, objc_msgSend(v6, "length"), 0, 0, 0);

    }
    goto LABEL_7;
  }
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8;
  BOOL v9;
  BOOL v10;
  int64_t v11;
  BOOL v12;
  BOOL v13;
  id v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  UITextInputController *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id WeakRetained;
  char v27;
  id v28;
  void *v29;
  void *v30;
  double MinX;
  id v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v40;

  v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v9 = a4 == 3;
    v10 = a4 == 2;
    v11 = -[UITextInputController _resolveNaturalDirection:](self, "_resolveNaturalDirection:", -[UITextInputController baseWritingDirectionForPosition:inDirection:](self, "baseWritingDirectionForPosition:inDirection:", v8, 0));
    v12 = v11 == 1 && v10;
    v13 = v11 != 1 && v9;
    v14 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v14, "beginningOfDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "offsetFromPosition:toPosition:", v15, v8);

    if (a5 >= 1)
    {
      v17 = v13 || v12;
      do
      {
        if (v17)
        {
          if (!v16)
            break;
          v18 = v16 - 1;
          v19 = self;
          v20 = 0;
        }
        else
        {
          -[UITextInputController _textStorage](self, "_textStorage");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          if (v16 >= v22)
            break;
          v19 = self;
          v18 = v16;
          v20 = 1;
        }
        v16 = -[UITextInputController _validCaretPositionFromCharacterIndex:downstream:](v19, "_validCaretPositionFromCharacterIndex:downstream:", v18, v20);
        --a5;
      }
      while (a5);
    }
    v23 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v23, "beginningOfDocument");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutControllerBase positionFromPosition:offset:](v23, (uint64_t)v24, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) == 0)
      goto LABEL_20;
    v28 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextPlaceholder attachment](self->_textPlaceholder, "attachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "insertionRectForPosition:typingAttributes:placeholderAttachment:textContainer:", v8, v29, v30, 0);
    MinX = CGRectGetMinX(v40);

    v32 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v32, "positionFromPosition:inDirection:offset:affinity:anchorPositionOffset:", v8, a4, a5, -[UITextInputController selectionAffinity](self, "selectionAffinity"), MinX);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
LABEL_20:
      v33 = v8;
      -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v33);
      if (a5 < 1)
      {
        v25 = v33;
      }
      else
      {
        v35 = v34;
        do
        {
          -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v33);
          v38 = v37 + 1.0;
          if (a4 == 4)
            v38 = -1.0;
          -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", v35, v36 + v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = v25;
          --a5;
        }
        while (a5);
      }
    }
  }
  else
  {
    -[UITextInputController endOfDocument](self, "endOfDocument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 5 || a4 == 2)
  {
    objc_msgSend(v5, "end");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "start");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  uint64_t v4;
  _UITextLayoutController **p_textLayoutController;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;

  if (a4 == 3)
    v4 = -1;
  else
    v4 = 1;
  p_textLayoutController = &self->_textLayoutController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(v9, "textRangeFromPosition:toPosition:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_newAttributedStringForInsertionOfText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  v7 = (__CFString *)a3;
  if (v7)
    v8 = v7;
  else
    v8 = &stru_1E16EDF20;
  -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v8, v9);
  if ((*(_BYTE *)&self->_tiFlags & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "textInput:prepareAttributedTextForInsertion:", self, v10);

  }
  return v10;
}

- (id)_newAttributedStringForInsertionOfAttributedText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  _QWORD v13[4];
  id v14;
  id v15;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v9, "length");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__UITextInputController__newAttributedStringForInsertionOfAttributedText_inRange___block_invoke;
    v13[3] = &unk_1E16E67D8;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v13);

  }
  if ((*(_BYTE *)&self->_tiFlags & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "textInput:prepareAttributedTextForInsertion:", self, v9);

  }
  return v9;
}

void __82__UITextInputController__newAttributedStringForInsertionOfAttributedText_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = (id)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v9, a3, a4);
}

- (id)_newAttributedStringForReplacementOfAnnotatedText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id WeakRetained;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  length = a4.length;
  location = a4.location;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__207;
  v33 = __Block_byref_object_dispose__207;
  v34 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke;
  v28[3] = &unk_1E16E6800;
  v28[4] = &v29;
  v28[5] = location;
  v28[6] = length;
  objc_msgSend(v8, "coordinateReading:", v28);

  objc_msgSend((id)v30[5], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_msgSend((id)v30[5], "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UITextInputController validAnnotations](self, "validAnnotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "removeAttribute:range:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17++), 0, objc_msgSend(v13, "length"));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v15);
    }

    v18 = objc_msgSend(v7, "length");
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke_2;
    v22[3] = &unk_1E16B1620;
    v19 = v13;
    v23 = v19;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v18, 0, v22);
    if ((*(_BYTE *)&self->_tiFlags & 0x40) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "textInput:prepareAttributedTextForInsertion:", self, v19);

    }
  }
  else
  {
    v19 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v7, location, length);
  }
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "attributedSubstringFromRange:", a1[5], a1[6]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (id)_attributesForInsertionOfText:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  if (a3.location == -[UITextInputController _selectedRange](self, "_selectedRange") && length == v6)
  {
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInputController _attributesForReplacementInRange:](self, "_attributesForReplacementInRange:", location, length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v5;
  void *v6;
  int64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  -[UITextInputController _textStorage](self, "_textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke;
  v9[3] = &unk_1E16E6850;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "coordinateReading:", v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__207;
  v20 = __Block_byref_object_dispose__207;
  v21 = 0;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
    v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5, v6);
    v9 = v8;

    v10 = *(_QWORD *)off_1E1678F98;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke_2;
    v15[3] = &unk_1E16B6338;
    v15[4] = &v16;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v10, v7, v9, 0x100000, v15);
  }
  v11 = (void *)v17[5];
  if (v11)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v17[5];
  v17[5] = v13;

  v11 = (void *)v17[5];
  if (v11)
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "baseWritingDirection");
  _Block_object_dispose(&v16, 8);

}

void __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;

  v8 = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(_QWORD *)(v9 + 40);
  v10 = (id *)(v9 + 40);
  if (!v11)
  {
    v12 = v8;
    objc_storeStrong(v10, a2);
    v8 = v12;
    *a5 = 1;
  }

}

void __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = (void *)objc_msgSend(a2, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "mutableCopy");

  }
  objc_msgSend(v11, "setBaseWritingDirection:", *(_QWORD *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 != -1)
    objc_msgSend(v11, "setAlignment:", 2 * (v10 != 0));
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v11, a3, a4);

}

- (CGRect)firstRectForRange:(id)a3
{
  void *v3;
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
  double v15;
  double v16;
  CGRect result;

  -[UITextInputController selectionRectsForRange:](self, "selectionRectsForRange:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_caretRectForOffset:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
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
  double v19;
  CGRect result;

  v5 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutControllerBase positionFromPosition:offset:](v5, (uint64_t)v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_caretRect
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITextRange start](self->_selectedTextRange, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UITextInputController comparePosition:toPosition:](self, "comparePosition:toPosition:", v8, v9);

  if (v10 == -1)
  {
    objc_msgSend(v7, "start");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v7, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UITextInputController comparePosition:toPosition:](self, "comparePosition:toPosition:", v11, v8);

  if (v12 == -1)
  {
    objc_msgSend(v7, "end");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;

    v8 = v14;
  }

  return v8;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController tokenizer](self, "tokenizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 0, -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_undoManagerWillUndo:(id)a3
{
  if (!-[UITextInputController supportLetterByLetterUndo](self, "supportLetterByLetterUndo", a3))
    -[UITextInputController stopCoalescing](self, "stopCoalescing");
  -[UITextInputController unmarkText](self, "unmarkText");
}

- (void)coalesceInTextView:(id)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementRange:(_NSRange)a6 replacementText:(id)a7
{
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  _UITextUndoOperationTyping *v22;
  void *v23;
  NSUInteger length;
  id v25;
  id v26;

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  v26 = a3;
  v12 = a4;
  v25 = a7;
  objc_msgSend(v26, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  v16 = objc_msgSend(v13, "_shouldCoalesceTypingForText::", WeakRetained, v14);

  if (!v16
    || -[UITextInputController shouldStartNewUndoGroup:textGranularity:operationType:](self, "shouldStartNewUndoGroup:textGranularity:operationType:", v25, 2, 2))
  {
    goto LABEL_8;
  }
  v18 = objc_msgSend(v26, "selectedRange");
  v19 = self->_markedTextRange.location == 0x7FFFFFFFFFFFFFFFLL ? v17 : 0;
  v20 = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  v21 = objc_msgSend(v20, "coalesceAffectedRange:replacementRange:selectedRange:textStorage:", v9, v8, location, length, v18, v19, v14);

  if ((v21 & 1) == 0)
  {
LABEL_8:
    -[UITextInputController stopCoalescing](self, "stopCoalescing");
    v22 = -[_UITextUndoOperationTyping initWithAffectedRange:inputController:replacementRange:]([_UITextUndoOperationTyping alloc], "initWithAffectedRange:inputController:replacementRange:", v9, v8, self, location, length);
    -[UITextInputController _textStorage](self, "_textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerUndoWithTarget:selector:object:", v23, sel__UIUndoRedoTextOperation_, v22);

    objc_msgSend(v13, "setActionName:", v12);
    objc_storeWeak((id *)&self->_undoOperationForCoalescing, v22);

  }
}

- (BOOL)shouldStartNewUndoGroup:(id)a3 textGranularity:(int64_t)a4 operationType:(int)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  v8 = v7;
  if (a5 != 2)
    goto LABEL_6;
  if (a4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeOfCharacterFromSet:", v10);
    LOBYTE(v9) = v11 != 0;
LABEL_11:

    goto LABEL_12;
  }
  if (a4 == 2)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "nextInputWouldStartSentence"))
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(" ")) ^ 1;
    else
      LOBYTE(v9) = 0;
    goto LABEL_11;
  }
  if (a4 != 1)
  {
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_12;
  }
  LOBYTE(v9) = objc_msgSend(v7, "isEqualToString:", CFSTR(" "));
LABEL_12:

  return v9;
}

- (void)scheduleUndoOperationForType:(int)a3 actionName:(id)a4 previousSelectedRange:(_NSRange)a5 replacementText:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v10;
  __objc2_class *v11;
  _UITextUndoOperationSetAttributes *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  length = a5.length;
  location = a5.location;
  v8 = *(_QWORD *)&a3;
  v17 = a6;
  if (!-[UITextInputController _undoRedoInProgress](self, "_undoRedoInProgress"))
  {
    if ((_DWORD)v8 == 1)
    {
      v12 = [_UITextUndoOperationSetAttributes alloc];
      v13 = -[UITextInputController selectedRange](self, "selectedRange");
      v15 = -[_UITextUndoOperationSetAttributes initWithAffectedRange:inputController:](v12, "initWithAffectedRange:inputController:", v13, v14, self);
    }
    else
    {
      if ((_DWORD)v8 == 3)
      {
        v10 = objc_msgSend(v17, "length");
        v11 = _UITextUndoOperationReplace;
      }
      else
      {
        if ((_DWORD)v8 != 2)
        {
          v16 = 0;
LABEL_16:

          goto LABEL_17;
        }
        v10 = objc_msgSend(v17, "length");
        v11 = _UITextUndoOperationTyping;
      }
      v15 = objc_msgSend([v11 alloc], "initWithAffectedRange:inputController:replacementRange:", location, length, self, location, v10);
    }
    v16 = (void *)v15;
    if (v15)
    {
      if (-[UITextInputController shouldStartUndoGroup](self, "shouldStartUndoGroup"))
      {
        -[UITextInputController setCurrentUndoGroupType:](self, "setCurrentUndoGroupType:", v8);
        -[UITextInputController appendUndoOperation:newGroup:](self, "appendUndoOperation:newGroup:", v16, 1);
        -[UITextInputController setShouldStartUndoGroup:](self, "setShouldStartUndoGroup:", 0);
      }
      else
      {
        -[UITextInputController appendUndoOperation:newGroup:](self, "appendUndoOperation:newGroup:", v16, 0);
      }
      if (-[UITextInputController shouldStartNewUndoGroup:textGranularity:operationType:](self, "shouldStartNewUndoGroup:textGranularity:operationType:", v17, 2, v8))
      {
        -[UITextInputController setShouldStartUndoGroup:](self, "setShouldStartUndoGroup:", 1);
      }
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)registerUndoOperationForType:(int)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementText:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v12;
  _UITextUndoOperationSetAttributes *v13;
  uint64_t v14;
  uint64_t v15;
  _UITextUndoOperationReplace *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  length = a5.length;
  location = a5.location;
  v9 = *(_QWORD *)&a3;
  v22 = a4;
  v12 = a6;
  if (!+[UIDictationController isRunning](UIDictationController, "isRunning")
    || +[UIDictationController canUndoOrRedo](UIDictationController, "canUndoOrRedo"))
  {
    if (-[UITextInputController supportLetterByLetterUndo](self, "supportLetterByLetterUndo"))
    {
      -[UITextInputController scheduleUndoOperationForType:actionName:previousSelectedRange:replacementText:](self, "scheduleUndoOperationForType:actionName:previousSelectedRange:replacementText:", v9, v22, location, length, v12);
      goto LABEL_15;
    }
    if (-[UITextInputController _undoRedoInProgress](self, "_undoRedoInProgress"))
      goto LABEL_15;
    switch((_DWORD)v9)
    {
      case 3:
        v17 = objc_msgSend(v12, "length");
        -[UITextInputController stopCoalescing](self, "stopCoalescing");
        v16 = -[_UITextUndoOperationReplace initWithAffectedRange:inputController:replacementRange:]([_UITextUndoOperationReplace alloc], "initWithAffectedRange:inputController:replacementRange:", location, length, self, location, v17);
        break;
      case 2:
        -[UITextInputController coalesceInTextView:actionName:affectedRange:replacementRange:replacementText:](self, "coalesceInTextView:actionName:affectedRange:replacementRange:replacementText:", self, v22, location, length, location, objc_msgSend(v12, "length"), v12);
        goto LABEL_15;
      case 1:
        -[UITextInputController stopCoalescing](self, "stopCoalescing");
        v13 = [_UITextUndoOperationSetAttributes alloc];
        v14 = -[UITextInputController selectedRange](self, "selectedRange");
        v16 = -[_UITextUndoOperationSetAttributes initWithAffectedRange:inputController:](v13, "initWithAffectedRange:inputController:", v14, v15, self);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputController.m"), 3066, CFSTR("Unknown text undo operation type encountered"));
        goto LABEL_14;
    }
    v18 = v16;
    -[UITextInputController undoManager](self, "undoManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController _textStorage](self, "_textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerUndoWithTarget:selector:object:", v20, sel__UIUndoRedoTextOperation_, v18);

    -[UITextInputController undoManager](self, "undoManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActionName:", v22);

LABEL_14:
  }
LABEL_15:

}

- (void)undoWillChangeText
{
  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 1);
}

- (void)undoManagerDidFinishUndoRedo
{
  id v3;

  if ((*((_BYTE *)&self->_tiFlags + 1) & 4) != 0)
  {
    -[UITextInputController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInputDidFinishUndoRedoChanges:", self);

  }
}

- (void)undoManagerWillRemoveAllActions
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_tiFlags + 2) & 0x20) != 0)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v3 = undoManagerWillRemoveAllActions___s_category;
      if (!undoManagerWillRemoveAllActions___s_category)
      {
        v3 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&undoManagerWillRemoveAllActions___s_category);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)MEMORY[0x1E0CB3978];
        v6 = v4;
        objc_msgSend(v5, "callStackSymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "!!!! Undo manager is removing all actions. UITextInputController will prematurely end undo group for Writing Tools replacements\n%@", (uint8_t *)&v8, 0xCu);

      }
    }
    *(_DWORD *)&self->_tiFlags |= 0x400000u;
  }
}

- (void)undoDidReplaceRange:(_NSRange)a3 withAttributedText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  if ((*((_BYTE *)&self->_tiFlags + 1) & 2) != 0)
  {
    length = a3.length;
    location = a3.location;
    v7 = a4;
    -[UITextInputController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInput:undoRedoDidApplyAttributedText:toCharacterRange:", self, v7, location, length);

  }
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 1, a4);
}

- (void)_setUndoRedoInProgress:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFBFFF | v3);
}

- (BOOL)_undoRedoInProgress
{
  return (*((unsigned __int8 *)&self->_tiFlags + 1) >> 6) & 1;
}

- (BOOL)isCoalescing
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)changeWillBeUndone:(id)a3
{
  if (!-[UITextInputController supportLetterByLetterUndo](self, "supportLetterByLetterUndo", a3))
    -[UITextInputController stopCoalescing](self, "stopCoalescing");
  -[UITextInputController unmarkText](self, "unmarkText");
}

- (void)clearText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[UITextInputController unmarkText:](self, "unmarkText:", 0);
  -[UITextInputController selectAll](self, "selectAll");
  _UIKitBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DELETE_FOR_UNDO"), CFSTR("Delete"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v4, v5, v6, &stru_1E16EDF20);

  -[UITextInputController _insertText:fromKeyboard:](self, "_insertText:fromKeyboard:", &stru_1E16EDF20, 0);
}

- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(&sel_revealedSelectionByScrollingWebFrame_[16], "prefersEmojiImageTextAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UITextInputController replaceRange:withAttributedText:](self, "replaceRange:withAttributedText:", v6, v8);
  }
  else
  {
    objc_msgSend(v7, "adaptiveImageGlyph");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UITextInputController insertAdaptiveImageGlyph:replacementRange:](self, "insertAdaptiveImageGlyph:replacementRange:", v8, v6);
  }

}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 0x100000;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFEFFFFF | v3);
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return (*((_BYTE *)&self->_tiFlags + 2) & 0x10) == 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (-[UITextInputController supportsAdaptiveImageGlyph](self, "supportsAdaptiveImageGlyph"))
  {
    if (objc_msgSend(&sel_revealedSelectionByScrollingWebFrame_[16], "prefersTextAttachment"))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(v13, "nominalTextAttachment"), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v11 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v8 = (void *)v7;
      v9 = (void *)MEMORY[0x1E0CB3498];
      -[UITextInputController typingAttributes](self, "typingAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributedStringWithAttachment:attributes:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3498];
      -[UITextInputController typingAttributes](self, "typingAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributedStringWithAdaptiveImageGlyph:attributes:", v13, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v11)
      -[UITextInputController replaceRange:withAttributedText:](self, "replaceRange:withAttributedText:", v6, v11);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)setWritingToolsStreamingReplacements:(BOOL)a3
{
  _BOOL4 v3;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;
  void *v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  tiFlags = self->_tiFlags;
  if (((((*(_DWORD *)&tiFlags & 0x200000) == 0) ^ a3) & 1) != 0)
    goto LABEL_9;
  if (a3)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v8 = qword_1ECD81C58;
      if (!qword_1ECD81C58)
      {
        v8 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&qword_1ECD81C58);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, ">>>> UITextInputController will begin undo group for Writing Tools replacements", buf, 2u);
      }
    }
    *(_DWORD *)&self->_tiFlags &= ~0x400000u;
    -[UITextInputController undoManager](self, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginUndoGrouping");
  }
  else
  {
    if ((*(_DWORD *)&tiFlags & 0x400000) != 0)
      goto LABEL_9;
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v10 = qword_1ECD81C60;
      if (!qword_1ECD81C60)
      {
        v10 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD81C60);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "<<<< UITextInputController will end undo group for Writing Tools replacements", v12, 2u);
      }
    }
    -[UITextInputController undoManager](self, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endUndoGrouping");
  }

  tiFlags = self->_tiFlags;
LABEL_9:
  if (v3)
    v7 = 0x200000;
  else
    v7 = 0;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags & 0xFFDFFFFF | v7);
}

- (BOOL)isWritingToolsStreamingReplacements
{
  return (*((unsigned __int8 *)&self->_tiFlags + 2) >> 5) & 1;
}

- (BOOL)_isSystemAttachment:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4 replacingRange:(_NSRange)a5 resultLength:(unint64_t *)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  length = a5.length;
  location = a5.location;
  v11 = a4;
  v12 = a3;
  -[UITextInputController setSelectedRange:](self, "setSelectedRange:", location, length);
  *(_DWORD *)&self->_tiFlags |= 0x40000u;
  +[UIDictationUtilities attributedStringForDictationResult:andCorrectionIdentifier:capturePrefixAndPostfixWordCount:](UIDictationUtilities, "attributedStringForDictationResult:andCorrectionIdentifier:capturePrefixAndPostfixWordCount:", v12, v11, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (id)objc_msgSend(v13, "mutableCopy");
  -[UITextInputController typingAttributes](self, "typingAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v16)
      objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)off_1E16790E0);
    objc_msgSend(v16, "objectForKey:", CFSTR("_UITextInputDictationResultMetadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v16, "removeObjectForKey:", CFSTR("_UITextInputDictationResultMetadata"));
    objc_msgSend(v18, "addAttributes:range:", v16, 0, objc_msgSend(v18, "length"));

  }
  ++self->_dontRemoveAllActionsCount;
  -[UITextInputController _insertAttributedText:fromKeyboard:](self, "_insertAttributedText:fromKeyboard:", v18, 1);
  --self->_dontRemoveAllActionsCount;
  if (a6)
    *a6 = objc_msgSend(v18, "length");

}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;

  v6 = a3;
  v7 = a4;
  if ((*((_BYTE *)&self->_tiFlags + 1) & 0x20) == 0)
  {
    objc_msgSend(v6, "bestText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController _firstTextView](self, "_firstTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      goto LABEL_4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(WeakRetained, "keyboardInput:shouldInsertText:isMarkedText:", v13, v8, 0);

    if (v14)
    {
LABEL_4:
      v15 = -[UITextInputController selectedRange](self, "selectedRange");
      v17 = v16;
      v22 = 0;
      *(_DWORD *)&self->_tiFlags |= 0x2000u;
      -[UITextInputController _insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:](self, "_insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:", v6, v7, v15, v16, &v22);
      *(_DWORD *)&self->_tiFlags &= ~0x2000u;
      -[UITextInputController stopCoalescing](self, "stopCoalescing");
      _UIKitBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Dictation"), CFSTR("Dictation"), CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "length");
      if (v20 <= v22)
      {
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v19, v15, v17, v8);
      }
      else
      {
        objc_msgSend(v8, "substringToIndex:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v19, v15, v17, v21);

      }
      -[UITextInputController stopCoalescing](self, "stopCoalescing");
      -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v22 + v15, 0);
      -[UITextInputController _setSelectedRangeToEndIfNecessary](self, "_setSelectedRangeToEndIfNecessary");
    }

  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3 embeddingType:(int64_t)a4
{
  UITextPlaceholder **p_textPlaceholder;
  unint64_t v5;
  NSObject *v6;
  UITextPlaceholder *v7;
  double height;
  double width;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  UITextPlaceholder *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  UITextPlaceholder *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v41;
  _QWORD v42[4];
  id v43;
  id location;
  _QWORD v45[4];
  UITextPlaceholder *v46;
  UITextInputController *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[5];
  uint8_t buf[8];
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;

  p_textPlaceholder = &self->_textPlaceholder;
  if (self->_textPlaceholder)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v41, OS_LOG_TYPE_FAULT, "Multiple text placeholders", buf, 2u);
      }

    }
    else
    {
      v5 = insertTextPlaceholderWithSize_embeddingType____s_category;
      if (!insertTextPlaceholderWithSize_embeddingType____s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&insertTextPlaceholderWithSize_embeddingType____s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Multiple text placeholders", buf, 2u);
      }
    }
    v7 = *p_textPlaceholder;
  }
  else
  {
    height = a3.height;
    width = a3.width;
    *(_QWORD *)buf = 0;
    v52 = buf;
    v53 = 0x2020000000;
    v54 = 0;
    -[UITextInputController selectedTextRange](self, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[UITextInputController endOfDocument](self, "endOfDocument");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke;
    v50[3] = &unk_1E16E6680;
    v50[4] = buf;
    objc_msgSend(WeakRetained, "requestTextGeometryAtPosition:typingAttributes:resultBlock:", v16, v18, v50);

    v20 = objc_alloc_init(UITextPlaceholder);
    v21 = *((double *)v52 + 3);
    -[UITextPlaceholder attachment](v20, "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBounds:", 0.0, -(height - v21), width, height);

    -[UITextInputController typingAttributes](self, "typingAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextPlaceholder attachment](v20, "attachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTypingAttributesBeforeInsertion:", v23);

    v25 = -[UITextInputController _selectedRange](self, "_selectedRange");
    -[UITextPlaceholder attachment](v20, "attachment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAttachmentRange:", v25, 1);

    -[UITextPlaceholder attachment](v20, "attachment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImage:", 0);

    -[UITextPlaceholder attachment](v20, "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEmbeddingType:", a4);

    -[UITextInputController selectedTextRange](self, "selectedTextRange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "start");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v30);
    -[UITextPlaceholder setCaretRectBeforeInsertion:](v20, "setCaretRectBeforeInsertion:");

    objc_storeStrong((id *)p_textPlaceholder, v20);
    tiFlags = self->_tiFlags;
    self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x2000);
    -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
    v32 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v34 = v33;
    -[UITextInputController _textStorage](self, "_textStorage");
    v35 = objc_claimAutoreleasedReturnValue();
    v45[0] = v19;
    v45[1] = 3221225472;
    v45[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_2;
    v45[3] = &unk_1E16E6608;
    v36 = v20;
    v46 = v36;
    v47 = self;
    v48 = v32;
    v49 = v34;
    objc_msgSend((id)v35, "coordinateEditing:", v45);

    -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v32 + 1, 0);
    -[UITextInputController _setSelectedRangeToEndIfNecessary](self, "_setSelectedRangeToEndIfNecessary");
    -[UITextInputController interactionAssistant](self, "interactionAssistant");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "selectionChanged");

    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
    v38 = objc_loadWeakRetained((id *)&self->_layoutManager);
    LOBYTE(v35) = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      objc_initWeak(&location, self);
      v42[0] = v19;
      v42[1] = 3221225472;
      v42[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_3;
      v42[3] = &unk_1E16B3F40;
      objc_copyWeak(&v43, &location);
      v39 = objc_loadWeakRetained((id *)&self->_layoutManager);
      objc_msgSend(v39, "setDidCompleteLayoutObserverBlock:", v42);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | (((*(unsigned int *)&tiFlags >> 13) & 1) << 13));
    -[UITextInputController _updateRectsForPlaceholder](self, "_updateRectsForPlaceholder");
    v7 = *p_textPlaceholder;

    _Block_object_dispose(buf, 8);
  }
  return v7;
}

uint64_t __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke(uint64_t result, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a6;
  return result;
}

void __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB3498];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringWithAttachment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v8, 0, 1);

  objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v9);
}

void __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutManagerDidCompleteLayout");

}

- (void)_layoutManagerDidCompleteLayout
{
  void *v3;
  _QWORD v4[5];

  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke;
  v4[3] = &unk_1E16E6548;
  v4[4] = self;
  objc_msgSend(v3, "coordinateReading:", v4);

  -[UITextInputController _updateRectsForPlaceholder](self, "_updateRectsForPlaceholder");
}

void __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)off_1E1678C48;
  v4 = a2;
  v5 = objc_msgSend(v4, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke_2;
  v6[3] = &unk_1E16E68C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v5, 0, v6);

}

void __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;
  id v11;
  void *v12;

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v10 = a2;
  objc_msgSend(v9, "attachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachmentRange:", a3, a4);

    *a5 = 1;
  }
}

- (void)_updateRectsForPlaceholder
{
  UITextPlaceholder *textPlaceholder;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id WeakRetained;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UITextPlaceholder *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  UITextPlaceholder *v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    -[UITextPlaceholder attachment](textPlaceholder, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "attachmentRange");
    -[UITextInputController _rectsForRange:](self, "_rectsForRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v14, "rect", (_QWORD)v40);
          if (!CGRectIsEmpty(v49))
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v11);
    }

    -[UITextPlaceholder setRects:](self->_textPlaceholder, "setRects:", v8);
    -[UITextPlaceholder attachment](self->_textPlaceholder, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    if (CGRectIsEmpty(v50))
    {
      -[UITextPlaceholder attachment](self->_textPlaceholder, "attachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "attachmentRange");
      v27 = v26;

      WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v25, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "start");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[UITextInputController _resolveNaturalDirection:](self, "_resolveNaturalDirection:", -[UITextInputController baseWritingDirectionForPosition:inDirection:](self, "baseWritingDirectionForPosition:inDirection:", v30, 0));

      -[UITextInputController interactionAssistant](self, "interactionAssistant");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textInputView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextPlaceholder caretRectBeforeInsertion](self->_textPlaceholder, "caretRectBeforeInsertion");
      +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v34, (_QWORD)v40);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setWritingDirection:", v31);
      v46 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextPlaceholder setRects:](self->_textPlaceholder, "setRects:", v36);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->_textPlaceholder;
    v44 = CFSTR("UITextInputPlaceholderChangedPlaceholderKey");
    v45 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("UITextInputPlaceholderChangedNotification"), 0, v39);

  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;

  height = a3.height;
  width = a3.width;
  v6 = a3.height > 0.0;
  if (a3.height <= 0.0)
  {
    -[UITextInputController selectedTextRange](self, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v8);
    v10 = v9 + -2.0;

    height = fmax(v10, 1.0);
  }
  -[UITextInputController insertTextPlaceholderWithSize:embeddingType:](self, "insertTextPlaceholderWithSize:embeddingType:", v6, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (width <= 0.0 || height <= 0.0)
  {
    objc_msgSend(v11, "attachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", 0);

  }
  else
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFill");

    objc_msgSend(v12, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    UIRectFillUsingOperation(1, v15, v16, v17, v18);

    _UIGraphicsGetImageFromCurrentImageContext(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v19);

    UIGraphicsEndImageContext();
  }
  return v12;
}

- (id)insertDictationResultPlaceholder
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id result;

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController caretRectForPosition:](self, "caretRectForPosition:", v4);
  v6 = v5 + -1.0;

  +[UIDictationLandingView widthForLineHeight:](UIDictationLandingView, "widthForLineHeight:", v6);
  ++self->_dontRemoveAllActionsCount;
  result = -[UITextInputController insertTextPlaceholderWithSize:embeddingType:](self, "insertTextPlaceholderWithSize:embeddingType:", 0);
  --self->_dontRemoveAllActionsCount;
  return result;
}

- (CGRect)frameForTextPlaceholder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attachmentRange");
  -[UITextInputController _rectsForRange:](self, "_rectsForRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "rect", (_QWORD)v30);
        v39.origin.x = v17;
        v39.origin.y = v18;
        v39.size.width = v19;
        v39.size.height = v20;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v37 = CGRectUnion(v36, v39);
        x = v37.origin.x;
        y = v37.origin.y;
        width = v37.size.width;
        height = v37.size.height;
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  _UIMainBundleIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqual:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scale");
    v24 = v23;

    if (v24 <= 1.0)
      v25 = -1.0;
    else
      v25 = -0.5;
  }
  else
  {

    v25 = -1.0;
  }

  v26 = y + v25;
  v27 = height + 2.0;
  v28 = x;
  v29 = width;
  result.size.height = v27;
  result.size.width = v29;
  result.origin.y = v26;
  result.origin.x = v28;
  return result;
}

- (void)removeTextPlaceholder:(id)a3 notifyInputDelegate:(BOOL)a4
{
  _BOOL4 v4;
  UITextPlaceholder *v6;
  id WeakRetained;
  char v8;
  id v9;
  UITextPlaceholder *textPlaceholder;
  NSUInteger location;
  NSUInteger length;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  UITextPlaceholder *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  UITextPlaceholder *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a4;
  v6 = (UITextPlaceholder *)a3;
  if (self->_textPlaceholder == v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_layoutManager);
      objc_msgSend(v9, "setDidCompleteLayoutObserverBlock:", 0);

    }
    textPlaceholder = self->_textPlaceholder;
    self->_textPlaceholder = 0;

    location = self->_markedTextRange.location;
    length = self->_markedTextRange.length;
    v13 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v30 = 0;
    v31 = &v30;
    v32 = 0x3010000000;
    v34 = 0;
    v35 = 0;
    v33 = &unk_18685B0AF;
    -[UITextPlaceholder attachment](v6, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v14, "attachmentRange");
    v35 = v15;

    -[UITextInputController _textStorage](self, "_textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke;
    v27[3] = &unk_1E16E6850;
    v29 = &v30;
    v18 = v6;
    v28 = v18;
    objc_msgSend(v16, "coordinateReading:", v27);

    if (v31[4] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v4)
        -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 1);
      -[UITextInputController _textStorage](self, "_textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      v21 = v31[4];
      if (v21 < v20 && v31[5] + v21 <= v20)
      {
        -[UITextInputController _textStorage](self, "_textStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v17;
        v26[1] = 3221225472;
        v26[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_3;
        v26[3] = &unk_1E16E6910;
        v26[4] = &v30;
        objc_msgSend(v25, "coordinateEditing:", v26);

        v22 = v31[4];
        if (v13 > v22)
          v22 = v13 - v31[5];
      }
      else
      {
        v22 = v20 - 1;
      }
      -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v22, 0);
      -[UITextInputController _setSelectedRangeToEndIfNecessary](self, "_setSelectedRangeToEndIfNecessary");
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_markedTextRange.location = location;
        self->_markedTextRange.length = length;
        if (location > v31[4])
          self->_markedTextRange.location = location - 1;
      }
      -[UITextPlaceholder attachment](v18, "attachment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "typingAttributesBeforeInsertion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:", v24);

      if (v4)
        -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 1);
    }

    _Block_object_dispose(&v30, 8);
  }

}

void __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v12 = v3;
  v5 = objc_msgSend(v3, "length");
  v6 = *(_QWORD *)off_1E1678C48;
  if (v4 >= v5
    || (objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C48, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), 0), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(*(id *)(a1 + 32), "attachment"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7, v7 != v8))
  {
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = xmmword_186679030;
    v9 = objc_msgSend(v12, "length");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_2;
    v13[3] = &unk_1E16E68E8;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v15 = v11;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v9, 0x100000, v13);

  }
}

void __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "attachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

uint64_t __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &stru_1E16EDF20);
}

- (void)removeTextPlaceholder:(id)a3
{
  -[UITextInputController removeTextPlaceholder:notifyInputDelegate:](self, "removeTextPlaceholder:notifyInputDelegate:", a3, 1);
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags;

  ++self->_dontRemoveAllActionsCount;
  tiFlags = self->_tiFlags;
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x2000);
  -[UITextInputController removeTextPlaceholder:notifyInputDelegate:](self, "removeTextPlaceholder:notifyInputDelegate:", a3, !a4);
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | (((*(unsigned int *)&tiFlags >> 13) & 1) << 13));
  --self->_dontRemoveAllActionsCount;
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[UITextInputController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v7, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[UITextInputController nsRangeForTextRange:](self, "nsRangeForTextRange:", v11);

      v8 = 0;
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = v12;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x3032000000;
        v25 = __Block_byref_object_copy__207;
        v26 = __Block_byref_object_dispose__207;
        v27 = 0;
        v16 = 0;
        v17 = &v16;
        v18 = 0x3032000000;
        v19 = __Block_byref_object_copy__207;
        v20 = __Block_byref_object_dispose__207;
        v21 = 0;
        -[UITextInputController _textStorage](self, "_textStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __62__UITextInputController_rangeWithTextAlternatives_atPosition___block_invoke;
        v15[3] = &unk_1E16E6938;
        v15[6] = &v16;
        v15[7] = &v22;
        v15[4] = self;
        v15[5] = v28;
        objc_msgSend(v13, "coordinateReading:", v15);

        *a3 = objc_retainAutorelease((id)v17[5]);
        v8 = (id)v23[5];
        _Block_object_dispose(&v16, 8);

        _Block_object_dispose(&v22, 8);
      }
      _Block_object_dispose(v28, 8);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

void __62__UITextInputController_rangeWithTextAlternatives_atPosition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = a2;
  if (v3 == objc_msgSend(v4, "length"))
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v4, "attribute:atIndex:longestEffectiveRange:inRange:", *(_QWORD *)off_1E16790E0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), &v11, 0, objc_msgSend(v4, "length", v11, v12));
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textRangeForNSRange:", v11, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)addTextAlternatives:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  UITextInputController *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v18 = a3;
  v4 = -[UITextInputController _selectedRange](self, "_selectedRange");
  objc_msgSend(v18, "primaryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 >= v6)
  {
    v7 = -[UITextInputController _selectedRange](self, "_selectedRange");
    objc_msgSend(v18, "primaryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 - objc_msgSend(v8, "length");
    objc_msgSend(v18, "primaryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextInputController textInRange:](self, "textInRange:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __45__UITextInputController_addTextAlternatives___block_invoke;
      v19[3] = &unk_1E16E6960;
      v23 = v9;
      v24 = v11;
      v20 = v18;
      v21 = self;
      v22 = v13;
      objc_msgSend(v17, "coordinateEditing:", v19);

    }
  }

}

void __45__UITextInputController_addTextAlternatives___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  v23[0] = 0;
  v23[1] = 0;
  v5 = *(_QWORD *)off_1E16790E0;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", v5, v6, v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "primaryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E10];
      objc_msgSend(v9, "alternativeStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "orderedSetWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "alternativeStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      v17 = objc_alloc((Class)off_1E1679D20);
      objc_msgSend(v4, "primaryString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "initWithPrimaryString:alternativeStrings:isLowConfidence:", v18, v19, objc_msgSend(v4, "isLowConfidence"));

      v4 = (id)v20;
    }
  }
  objc_msgSend(v7, "removeAttribute:range:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 232));
  objc_msgSend(WeakRetained, "removeAnnotationAttribute:forRange:", *(_QWORD *)off_1E16790E8, *(_QWORD *)(a1 + 48));

  v24 = v5;
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttributes:range:", v22, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 40), "addTextAlternativesDisplayStyle:toRange:", objc_msgSend(v4, "isLowConfidence"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)removeEmojiAlternatives
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  if ((*((_BYTE *)&self->_tiFlags + 2) & 2) != 0)
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__UITextInputController_removeEmojiAlternatives__block_invoke;
      v6[3] = &unk_1E16E6408;
      v6[4] = self;
      objc_msgSend(v5, "coordinateEditing:", v6);

    }
  }
}

void __48__UITextInputController_removeEmojiAlternatives__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  id WeakRetained;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
  objc_msgSend(*(id *)(a1 + 32), "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - (v4 >= objc_msgSend(v5, "length"));

  v28 = 0;
  v29 = 0;
  v7 = *(_QWORD *)off_1E16790E0;
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E16790E0, v6, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v8, "alternativeStrings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "alternativeStrings", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v18, "_containsEmojiOnly") & 1) == 0)
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "removeAttribute:range:", v7, v28, v29);
    if (objc_msgSend(v12, "count"))
    {
      v19 = objc_alloc((Class)off_1E1679D20);
      objc_msgSend(v9, "primaryString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = (id)objc_msgSend(v19, "initWithPrimaryString:alternativeStrings:isLowConfidence:", v20, v12, objc_msgSend(v9, "isLowConfidence"));

      v30 = v7;
      v31 = WeakRetained;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addAttributes:range:", v22, v28, v29);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
      v23 = *(_QWORD *)off_1E16790E8;
      objc_msgSend(*(id *)(a1 + 32), "textRangeForNSRange:", v28, v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "removeAnnotationAttribute:forRange:", v23, v22);
    }

  }
}

- (id)_prefixTokensForDictationAttributedText:(id)a3 lastDictationAttributedTextRange:(_NSRange)a4 currentDictationAttributedTextRange:(_NSRange)a5
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  location = a5.location;
  length = a4.length;
  v7 = a4.location;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__207;
  v24 = __Block_byref_object_dispose__207;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = v7 + length;
  v10 = location - v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __134__UITextInputController__prefixTokensForDictationAttributedText_lastDictationAttributedTextRange_currentDictationAttributedTextRange___block_invoke;
  v15[3] = &unk_1E16E6988;
  v15[4] = &v16;
  v15[5] = &v20;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", v9, v10, 259, v15);
  if (!*((_DWORD *)v17 + 6))
  {
    v11 = (void *)v21[5];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v13 = (id)v21[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __134__UITextInputController__prefixTokensForDictationAttributedText_lastDictationAttributedTextRange_currentDictationAttributedTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v7;
  id v8;

  if ((int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 5)
    *a7 = 1;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (id)_postfixTokensForDictationAttributedText:(id)a3 currentDictationAttributedTextRange:(_NSRange)a4 nextDictationAttributedTextRange:(_NSRange)a5
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  location = a5.location;
  length = a4.length;
  v7 = a4.location;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__207;
  v24 = __Block_byref_object_dispose__207;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = v7 + length;
  v10 = location - v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __135__UITextInputController__postfixTokensForDictationAttributedText_currentDictationAttributedTextRange_nextDictationAttributedTextRange___block_invoke;
  v15[3] = &unk_1E16E6988;
  v15[4] = &v16;
  v15[5] = &v20;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", v9, v10, 3, v15);
  if (!*((_DWORD *)v17 + 6))
  {
    v11 = (void *)v21[5];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v13 = (id)v21[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __135__UITextInputController__postfixTokensForDictationAttributedText_currentDictationAttributedTextRange_nextDictationAttributedTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v7;
  id v8;

  if ((int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 5)
    *a7 = 1;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

void __44__UITextInputController__userEditedTextInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __44__UITextInputController__userEditedTextInfo__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;

  v39 = a2;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = objc_msgSend(v39, "rangeValue");
  objc_msgSend(v8, "_prefixTokensForDictationAttributedText:lastDictationAttributedTextRange:currentDictationAttributedTextRange:", v9, *(_QWORD *)(v10 + 32), *(_QWORD *)(v10 + 40), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v13);

  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v7, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v16);

  v17 = objc_msgSend(v39, "rangeValue");
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v18 + 32) = v17;
  *(_QWORD *)(v18 + 40) = v19;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v39);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 == a3)
  {
    v20 = objc_msgSend(v39, "rangeValue");
    objc_msgSend(v39, "rangeValue");
    v22 = v21 + v20;
    objc_msgSend(*(id *)(a1 + 40), "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v22 != v24)
    {
      objc_msgSend(*(id *)(a1 + 40), "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length") - v22;

      v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v22, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v28);

    }
    *a4 = 1;
  }
  else
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v39, "rangeValue");
    v34 = v33;
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 + 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "rangeValue");
    objc_msgSend(v30, "_postfixTokensForDictationAttributedText:currentDictationAttributedTextRange:nextDictationAttributedTextRange:", v31, v32, v34, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v38);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v29);
  }

}

void __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  if (!v8)
    goto LABEL_30;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_30;
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(id *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (v12 != v9)
  {
    objc_storeStrong(v11, a2);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = &stru_1E16EDF20;

    objc_msgSend(v9, "objectForKey:", CFSTR("insertion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("insertion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("insertion"));
      objc_msgSend(v9, "objectForKey:", CFSTR("insertions"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v9, "objectForKey:", CFSTR("insertions"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayWithArray:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "addObject:", v16);
      }
      else
      {
        v57[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("insertions"));

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("deletion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("deletion"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("deletion"));
      objc_msgSend(v9, "objectForKey:", CFSTR("deletions"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v9, "objectForKey:", CFSTR("deletions"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayWithArray:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "addObject:", v22);
      }
      else
      {
        v56 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "setObject:forKey:", v26, CFSTR("deletions"));

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v28 = *(_QWORD *)(v27 + 32);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"))
      v29 = 1;
    else
      v29 = a3 == 0;
    v30 = a4;
    v31 = a3;
    if (v29)
      goto LABEL_26;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "stringByAppendingString:", CFSTR("*"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    goto LABEL_25;
  }
  v31 = *(_QWORD *)(v27 + 40) + v28;
  v35 = a3 - v31;
  if (a3 - v31 >= +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithDeletion:", v9))
  {
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
        + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    v37 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithDeletion:", v9);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "substringWithRange:", v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35- +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithDeletion:", v9));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringByAppendingFormat:", CFSTR("%@(%@*)"), v39, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v42;

LABEL_25:
    v30 = a4;
    v31 = a3;
    goto LABEL_26;
  }
  v30 = v35 + a4;
LABEL_26:
  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(_QWORD *)(v45 + 32) = a3;
  *(_QWORD *)(v45 + 40) = a4;
  v46 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "substringWithRange:", v31, v30);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringByAppendingString:", v48);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v51 = *(void **)(v50 + 40);
  *(_QWORD *)(v50 + 40) = v49;

  objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("fullText"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recognizedTextInfo"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = *(void **)(a1 + 48);
  if (v52)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("userEditedText"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKey:", v54, CFSTR("userEditedText"));

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("userEditedTextRanges"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("userEditedTextRanges"));

  }
  else
  {
    v52 = (void *)objc_msgSend(v53, "mutableCopy");
  }
  objc_msgSend(v9, "setObject:forKey:", v52, CFSTR("recognizedTextInfo"));

LABEL_30:
}

- (id)dictationLanguageForSelectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInputController attributedTextInRange:](self, "attributedTextInRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__207;
  v18 = __Block_byref_object_dispose__207;
  v19 = 0;
  v7 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__UITextInputController_dictationLanguageForSelectedText__block_invoke;
  v11[3] = &unk_1E16E6A00;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __57__UITextInputController_dictationLanguageForSelectedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  char v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a2, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("_UITextInputDictationResultMetadata"));

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), a3, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dictationLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if ((v11 & 1) != 0 || (v13 = *(void **)(v12 + 40)) == 0)
    {
      objc_storeStrong((id *)(v12 + 40), v10);
    }
    else
    {
      *(_QWORD *)(v12 + 40) = 0;

      *a5 = 1;
    }

  }
  else
  {
    *a5 = 1;
  }
}

- (void)signalDictationInputEvent:(id)a3 insertedText:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    -[UITextInputController _selectedText](self, "_selectedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictationTipController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      -[UITextInputController _selectedText](self, "_selectedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "signalDictationReplacementTip:", v10);

    }
    else
    {
      objc_msgSend(v8, "signalDictationInsertionTip:", v13);
    }

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictationTipController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordDictationTipReplacementText:", v13);

  }
}

- (void)signalDictationDeletionTip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", self);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v25, "selectedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v25, "contextBeforeInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_lastGrapheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contextBeforeInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "length") - objc_msgSend(v6, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UITextInputController _selectedRange](self, "_selectedRange");
  objc_msgSend(v9, "markDictationTipDeletionEvent:deletedTextRange:", v4, v10, v11);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "consecutiveKeyboardDeleteEventCount") > 4)
  {
    v14 = 0;
  }
  else
  {
    -[UITextInputController _selectedText](self, "_selectedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length") == 0;

  }
  if (+[UIDictationController isRunning](UIDictationController, "isRunning") && !v14)
  {
    -[UITextInputController _selectedText](self, "_selectedText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      -[UITextInputController _selectedText](self, "_selectedText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      objc_msgSend(v25, "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictationTipController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v18 == v20)
      {
        objc_msgSend(v22, "signalDictationClearAllTip");
      }
      else
      {
        -[UITextInputController _selectedText](self, "_selectedText");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "signalDictationDeletionTip:", v24);

      }
    }
    else
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictationTipController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "signalDictationDeletionTip:", v4);
    }

  }
}

- (BOOL)_shouldHandleResponderAction:(SEL)a3
{
  _BOOL4 v5;
  BOOL v7;
  uint64_t *v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  char v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[7];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;

  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v5 = -[UITextInputController hasText](self, "hasText");
  if (sel_paste_ == a3 || sel_pasteAndMatchStyle_ == a3)
  {
    v7 = -[UITextInputController isEditing](self, "isEditing");
    *((_BYTE *)v50 + 24) = v7;
    if (-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
    {
LABEL_57:
      LOBYTE(v13) = *((_BYTE *)v50 + 24) != 0;
      goto LABEL_58;
    }
    v8 = v50;
    if (!*((_BYTE *)v50 + 24))
    {
LABEL_56:
      *((_BYTE *)v8 + 24) = 0;
      goto LABEL_57;
    }
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasStrings");
    *((_BYTE *)v50 + 24) = v10;
LABEL_9:

    goto LABEL_57;
  }
  if (sel_copy_ == a3)
  {
    if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
    {
LABEL_42:
      v14 = 0;
LABEL_52:
      *((_BYTE *)v50 + 24) = v14;
      goto LABEL_57;
    }
LABEL_51:
    -[UITextInputController selectedRange](self, "selectedRange");
    v14 = v18 != 0;
    goto LABEL_52;
  }
  if (sel_cut_ == a3)
  {
    if (!-[UITextInputController isEditing](self, "isEditing")
      || (-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
    {
      goto LABEL_42;
    }
    goto LABEL_51;
  }
  if (sel_promptForReplace_ == a3 || sel__promptForReplace_ == a3 || sel__transliterateChinese_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing"))
    {
      if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) == 0)
      {
        -[UITextInputController selectedRange](self, "selectedRange");
        if (v15)
        {
          -[UITextInputController _selectedAttributedText](self, "_selectedAttributedText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = +[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:](UIDictationMultilingualUtilities, "hasMultilingualAttributesForAttributedString:", v16);

          if (v17)
          {
            LOBYTE(v13) = 1;
          }
          else
          {
            -[UITextInputController _selectedText](self, "_selectedText");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[UITextInputController _shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:](self, "_shouldPerformUICalloutBarButtonReplaceAction:forText:checkAutocorrection:", a3, v22, 1);
            if (v13 && sel__transliterateChinese_ != a3)
            {
              -[UITextInputController interactionAssistant](self, "interactionAssistant");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v13) = objc_msgSend(v23, "hasReplacements");

            }
          }
          goto LABEL_58;
        }
      }
    }
    goto LABEL_91;
  }
  v11 = v5;
  if (sel_select_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing")
      && ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") | !v11) & 1) == 0)
    {
      goto LABEL_54;
    }
    goto LABEL_55;
  }
  if (sel_selectAll_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing") && v5)
    {
LABEL_54:
      -[UITextInputController _selectedText](self, "_selectedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "length");
      *((_BYTE *)v50 + 24) = v19 == 0;
      goto LABEL_9;
    }
LABEL_55:
    v8 = v50;
    goto LABEL_56;
  }
  if (sel_makeTextWritingDirectionRightToLeft_ == a3
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    || sel_makeTextWritingDirectionNatural_ == a3)
  {
    if (-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __54__UITextInputController__shouldHandleResponderAction___block_invoke;
      v48[3] = &unk_1E16E6A28;
      v48[4] = self;
      v48[5] = &v49;
      v48[6] = a3;
      objc_msgSend(v21, "coordinateReading:", v48);

    }
    goto LABEL_57;
  }
  if (sel_replace_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing"))
    {
      v14 = v11 & ~-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry");
      goto LABEL_52;
    }
    goto LABEL_42;
  }
  if (sel__share_ == a3)
  {
    if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) == 0)
    {
      if (qword_1ECD81C70 != -1)
        dispatch_once(&qword_1ECD81C70, &__block_literal_global_632);
      -[UITextInputController _selectedText](self, "_selectedText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByTrimmingCharactersInSet:", qword_1ECD81C68);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "length"))
      {
        -[UITextInputController _firstTextView](self, "_firstTextView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "_canShowTextServiceForType:", 8);
        *((_BYTE *)v50 + 24) = v27;

        goto LABEL_57;
      }

    }
    goto LABEL_91;
  }
  if (sel__define_ == a3)
  {
    if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
      goto LABEL_91;
    -[UITextInputController _firstTextView](self, "_firstTextView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v28, "_canShowTextServiceForType:", 2);

    if (!v13)
      goto LABEL_58;
LABEL_77:
    -[UITextInputController _selectedText](self, "_selectedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v12, "length") != 0;
    goto LABEL_78;
  }
  if (sel__translate_ == a3)
  {
    if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
      goto LABEL_91;
    -[UITextInputController _firstTextView](self, "_firstTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v29, "_canShowTextServiceForType:", 32);

    if (!v13)
      goto LABEL_58;
    goto LABEL_77;
  }
  if (sel__addShortcut_ == a3)
  {
    +[_UITextServiceSession textServiceSessionForType:](_UITextServiceSession, "textServiceSessionForType:", 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isDisplaying");

    if ((v31 & 1) == 0 && (-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) == 0)
    {
      -[UITextInputController selectedRange](self, "selectedRange");
      if (v32)
      {
        -[UITextInputController _firstTextView](self, "_firstTextView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v33, "_canShowTextServiceForType:", 4);

        if (!v13)
          goto LABEL_58;
        if (TIEnabledInputModesAllowOneToManyShortcuts())
        {
          -[UITextInputController _selectedText](self, "_selectedText");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v34, "_containsCJScripts");

          if (!v13)
            goto LABEL_58;
          -[UITextInputController _firstTextView](self, "_firstTextView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UITextInputController _firstTextView](self, "_firstTextView");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "_inPopover");

            if ((v37 & 1) != 0)
              goto LABEL_91;
          }
          else
          {

          }
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "userInterfaceIdiom");

          if ((v42 & 0xFFFFFFFFFFFFFFFBLL) != 1)
            goto LABEL_106;
          -[UITextInputController _firstTextView](self, "_firstTextView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "window");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextInputController _firstTextView](self, "_firstTextView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "keyboardSceneDelegate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "containerWindow");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44 != v47)
          {
LABEL_106:
            *((_BYTE *)v50 + 24) = 1;
            goto LABEL_57;
          }
        }
      }
    }
LABEL_91:
    LOBYTE(v13) = 0;
    goto LABEL_58;
  }
  if (sel_toggleBoldface_ == a3
    || sel_toggleItalics_ == a3
    || sel_toggleUnderline_ == a3
    || sel_alignLeft_ == a3
    || sel_alignRight_ == a3
    || sel_alignCenter_ == a3
    || sel_alignJustified_ == a3
    || sel_increaseSize_ == a3
    || sel_decreaseSize_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing"))
    {
      LOBYTE(v13) = -[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes");
      goto LABEL_58;
    }
    goto LABEL_91;
  }
  if (sel__insertDrawing_ == a3)
  {
    if (-[UITextInputController isEditing](self, "isEditing"))
    {
      -[UITextInputController _firstTextView](self, "_firstTextView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UITextInputController _firstTextView](self, "_firstTextView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v39, "_canInsertDrawing");

      }
      else
      {
        LOBYTE(v13) = 0;
      }

      goto LABEL_58;
    }
    goto LABEL_91;
  }
  if (sel_captureTextFromCamera_ != a3)
  {
    if (sel__startWritingTools_ == a3)
    {
      -[UITextInputController _firstTextView](self, "_firstTextView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v12, "_shouldDisplayWritingToolsCalloutBarItem");
LABEL_78:

      goto LABEL_58;
    }
    goto LABEL_55;
  }
  if (+[UIKeyboardCameraSession isEnabled](UIKeyboardCameraSession, "isEnabled")
    && -[UITextInputController isEditable](self, "isEditable"))
  {
    -[UITextInputController selectedRange](self, "selectedRange");
    v13 = v40 == 0;
  }
  else
  {
    v13 = 0;
  }
  if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 &= objc_msgSend(v12, "shouldSuppressSoftwareKeyboard") ^ 1;
    goto LABEL_78;
  }
LABEL_58:
  _Block_object_dispose(&v49, 8);
  return v13;
}

void __54__UITextInputController__shouldHandleResponderAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  char IsRightToLeftInputModeActive;
  uint64_t v20;
  char v21;
  char *v22;
  id v24;

  v24 = a2;
  v3 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)off_1E1678F98;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length") && !v6)
  {
    objc_msgSend(v24, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8, v9);
    v12 = v11;

    if (!v12)
    {
      v6 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v24, "attribute:atIndex:effectiveRange:", v5, v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6 && objc_msgSend(v6, "alignment") != 1)
  {
    v13 = objc_msgSend(v6, "baseWritingDirection");
    if (v13 == -1)
    {
      objc_msgSend(v24, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v14, "_isNaturallyRTL");

    }
    else
    {
      v3 = v13;
    }
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 32), "isEditing"))
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "keyboardType");
    if (v15 <= 0xB)
      v16 = (0x6CFu >> v15) & 1;
    else
      v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(_BYTE *)(v17 + 24);
  if (v18)
  {
    IsRightToLeftInputModeActive = UIKeyboardIsRightToLeftInputModeActive();
    if (v3 == 1)
      v18 = 1;
    else
      v18 = IsRightToLeftInputModeActive;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v17 + 24) = v18;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v21 = *(_BYTE *)(v20 + 24);
  if (v21)
  {
    v22 = *(char **)(a1 + 48);
    v21 = v22 == sel_makeTextWritingDirectionRightToLeft_ && v3 != 1
       || v22 == sel_makeTextWritingDirectionLeftToRight_ && v3
       || v22 == sel_makeTextWritingDirectionNatural_ && v3 != -1;
  }
  *(_BYTE *)(v20 + 24) = v21;

}

void __54__UITextInputController__shouldHandleResponderAction___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int16 v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  v5 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInString:", v2);
  v3 = objc_msgSend(v0, "copy");
  v4 = (void *)qword_1ECD81C68;
  qword_1ECD81C68 = v3;

}

- (id)_selectedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITextInputController selectedRange](self, "selectedRange");
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_selectedAttributedText
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[UITextInputController _textStorage](self, "_textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UITextInputController selectedRange](self, "selectedRange");
  objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)selectAll
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__UITextInputController_selectAll__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  -[UITextInputController _coordinateSelectionChange:](self, "_coordinateSelectionChange:", v2);
}

void __34__UITextInputController_selectAll__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(WeakRetained, "documentRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", v2);

}

- (void)replace:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  UITextCheckingController *textCheckingController;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputController.m"), 4194, 0);

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x3010000000;
  v39 = 0;
  v40 = 0;
  v38 = &unk_18685B0AF;
  v39 = -[UITextInputController _selectedRange](self, "_selectedRange");
  v40 = v6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__207;
  v33 = __Block_byref_object_dispose__207;
  v34 = 0;
  -[UITextInputController _textStorage](self, "_textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __33__UITextInputController_replace___block_invoke;
  v25[3] = &unk_1E16E6A70;
  v27 = &v35;
  v9 = v5;
  v26 = v9;
  v28 = &v29;
  objc_msgSend(v7, "coordinateReading:", v25);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v10, "replacementText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  textCheckingController = self->_textCheckingController;
  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextCheckingController willReplaceTextInRange:withText:](textCheckingController, "willReplaceTextInRange:withText:", v13, v11);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceText:", v9);

  if (v30[5])
  {
    if (v11)
    {
      v15 = v36[4];
      v16 = objc_msgSend(v11, "length");
      -[UITextInputController _textStorage](self, "_textStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v16 + v15 <= v18)
      {
        -[UITextInputController _textStorage](self, "_textStorage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __33__UITextInputController_replace___block_invoke_3;
        v21[3] = &unk_1E16E6A98;
        v23 = &v29;
        v24 = &v35;
        v22 = v11;
        objc_msgSend(v19, "coordinateEditing:", v21);

      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

void __33__UITextInputController_replace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v12 = v3;
  if (v4 < objc_msgSend(v3, "length")
    && (objc_msgSend(v12, "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), 0), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "valueForKey:", CFSTR("alternativesSelectedCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("alternativesSelectedCount"));

        objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E16790E0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "alternativeStrings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __33__UITextInputController_replace___block_invoke_2;
        v13[3] = &unk_1E16BD3E8;
        v14 = *(id *)(a1 + 32);
        v15 = v7;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
      }

    }
    else
    {
      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }

}

void __33__UITextInputController_replace___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v7, "replacementText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v12);

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "originalText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationUtilities logSpeechAlternativeReplacement:originalText:replacementText:index:](UIDictationUtilities, "logSpeechAlternativeReplacement:originalText:replacementText:index:", v10, v11, v12, a3);

    *a4 = 1;
  }

}

void __33__UITextInputController_replace___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32);
  v5 = a2;
  objc_msgSend(v5, "addAttribute:value:range:", CFSTR("_UITextInputDictationResultMetadata"), v3, v4, objc_msgSend(v2, "length"));

}

- (BOOL)_isSecureTextEntry
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UITextInputController isSecureTextEntry](self, "isSecureTextEntry");
  else
    return 0;
}

- (int64_t)writingDirectionAtPosition:(id)a3
{
  _UITextLayoutController **p_textLayoutController;
  id v4;
  id WeakRetained;
  int64_t v6;

  p_textLayoutController = &self->_textLayoutController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  v6 = objc_msgSend(WeakRetained, "baseWritingDirectionAtPosition:", v4);

  return v6;
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  id v4;

  -[UITextInputController selectedTextRange](self, "selectedTextRange", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setBaseWritingDirection:forRange:](self, "setBaseWritingDirection:forRange:", -1, v4);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4;

  -[UITextInputController selectedTextRange](self, "selectedTextRange", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setBaseWritingDirection:forRange:](self, "setBaseWritingDirection:forRange:", 1, v4);

}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4;

  -[UITextInputController selectedTextRange](self, "selectedTextRange", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController setBaseWritingDirection:forRange:](self, "setBaseWritingDirection:forRange:", 0, v4);

}

- (void)removeTextStylingFromString:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (!-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
  {
    v4 = objc_msgSend(v5, "length");
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678D90, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678F98, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678D98, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678C50, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1678C58, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1679048, 0, v4);
  }

}

+ (BOOL)_shouldUseStandardTextScaling:(id)a3
{
  id v3;
  char v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "usesStandardTextScaling");
  else
    v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom") == 5;

  }
  else
  {
    v6 = 0;
  }

  return v4 | v6;
}

- (void)_copySelectionToClipboard
{
  id v3;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _copySelectionToClipboard:](self, "_copySelectionToClipboard:", v3);

}

- (void)_copySelectionToClipboard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_dataOwnerForCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__UITextInputController__copySelectionToClipboard___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v6, v8);

}

void __51__UITextInputController__copySelectionToClipboard___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "_selectedNSRange");
  objc_msgSend(v2, "_itemProviderForCopyingRange:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setItemProviders:", v7);

  }
}

- (id)_itemProviderForCopyingRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  char v7;
  id v8;
  char v9;
  void *v10;
  _BOOL4 v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  UITextInputController *v22;
  id v23;
  NSUInteger v24;
  NSUInteger v25;
  _BOOL8 v26;
  char v27;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v7 = dyld_program_sdk_at_least();
  if ((-[UITextInputController isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7 ^ 1;
    -[UITextInputController _firstTextView](self, "_firstTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[UITextInputController _shouldUseStandardTextScaling:](UITextInputController, "_shouldUseStandardTextScaling:", v10);

    v12 = !v11;
    -[UITextInputController _textStorage](self, "_textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __54__UITextInputController__itemProviderForCopyingRange___block_invoke;
    v21 = &unk_1E16E6AC0;
    v24 = location;
    v25 = length;
    v27 = v9;
    v22 = self;
    v14 = v6;
    v23 = v14;
    v26 = v12;
    objc_msgSend(v13, "coordinateReading:", &v18);

    objc_msgSend(v14, "registeredTypeIdentifiers", v18, v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      v16 = v14;
    else
      v16 = 0;
    v8 = v16;

  }
  return v8;
}

void __54__UITextInputController__itemProviderForCopyingRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedSubstringFromRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "removeTextStylingFromString:", v6);
  v7 = objc_msgSend(v6, "length");
  if ((objc_msgSend(*(id *)(a1 + 32), "allowsEditingTextAttributes") & 1) != 0 || *(_BYTE *)(a1 + 72))
  {
    v8 = *(_QWORD *)off_1E1678CE8;
    v37 = *(_QWORD *)off_1E1678CE8;
    v38[0] = *(_QWORD *)off_1E1678DD0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_2;
      v31[3] = &unk_1E16B5178;
      v32 = v10;
      objc_msgSend(v11, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("Apple Web Archive pasteboard type"), 0, v31);

    }
    v12 = *(_QWORD *)off_1E1679000;
    v13 = *(_QWORD *)off_1E16791A0;
    v35[0] = v8;
    v35[1] = v13;
    v36[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_3;
      v29[3] = &unk_1E16B5178;
      v19 = v16;
      v30 = v19;
      objc_msgSend(v17, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v18, 0, v29);

    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v8 = *(_QWORD *)off_1E1678CE8;
  }
  v34[0] = *(_QWORD *)off_1E1678FA0;
  v20 = *(_QWORD *)off_1E1678C80;
  v33[0] = v8;
  v33[1] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = *(void **)(a1 + 40);
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_4;
    v27[3] = &unk_1E16B5178;
    v28 = v23;
    objc_msgSend(v24, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v25, 0, v27);

  }
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[UITextInputController _copySelectionToClipboard](self, "_copySelectionToClipboard", a3);
  -[UITextInputController changingContextWithTrigger:](self, "changingContextWithTrigger:", CFSTR("cut"));
  -[UITextInputController _updateRangeForSmartDelete](self, "_updateRangeForSmartDelete");
  _UIKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CUT_FOR_UNDO"), CFSTR("Cut"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v5, v6, v7, &stru_1E16EDF20);

  -[UITextInputController _insertText:fromKeyboard:](self, "_insertText:fromKeyboard:", &stru_1E16EDF20, 0);
}

- (void)paste:(id)a3
{
  -[UITextInputController _pasteAndMatchStyle:](self, "_pasteAndMatchStyle:", 0);
}

- (void)pasteAndMatchStyle:(id)a3
{
  -[UITextInputController _pasteAndMatchStyle:](self, "_pasteAndMatchStyle:", 1);
}

- (void)_pasteAndMatchStyle:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;

  -[UITextInputController changingContextWithTrigger:](self, "changingContextWithTrigger:", CFSTR("paste"));
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_dataOwnerForPaste");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__UITextInputController__pasteAndMatchStyle___block_invoke;
  v7[3] = &unk_1E16B1B78;
  v7[4] = self;
  v8 = a3;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v6, v7);

}

void __45__UITextInputController__pasteAndMatchStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pasteFromPasteboard:andMatchStyle:", v3, *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)_pasteFromPasteboard:(id)a3 andMatchStyle:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];
  _QWORD v42[4];

  v4 = a4;
  v42[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "itemProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
    {
      v21 = 0;
      v13 = 0;
      goto LABEL_17;
    }
    -[UITextInputController _firstTextView](self, "_firstTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[UITextInputController _shouldUseStandardTextScaling:](UITextInputController, "_shouldUseStandardTextScaling:", v10);

    objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataForPasteboardType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(id *)off_1E1679000;
    v15 = v14;
    if (v13)
    {
      if (v11)
      {
        v16 = *(_QWORD *)off_1E1678CE0;
        v41[0] = CFSTR("Timeout");
        v41[1] = v16;
        v42[0] = &unk_1E1A96290;
        v42[1] = v14;
        v41[2] = *(_QWORD *)off_1E16790C8;
        v42[2] = &unk_1E1A9A8D8;
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = v42;
        v19 = v41;
        v20 = 3;
LABEL_12:
        objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithData:options:documentAttributes:error:", v13, v25, 0, &v38);
        v21 = v38;
        if (v4)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v26, "string");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "initWithString:", v28);

          v26 = (void *)v29;
        }

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v6, "valueForPasteboardType:", CFSTR("Apple Web Archive pasteboard type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(id *)off_1E1678DD0;

      if (v13)
      {
        v15 = v22;
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForPasteboardType:", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = *(id *)off_1E1679008;
        if (!v13)
        {
          objc_msgSend(v6, "valueForPasteboardType:", *(_QWORD *)off_1E1678CF0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && (v35 = objc_msgSend(objc_alloc((Class)&off_1EE070640), "initWithData:", v13)) != 0)
          {
            v36 = (void *)v35;
            objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v35);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v6, "image");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = objc_alloc_init((Class)off_1E1679D28);
              objc_msgSend(v37, "setImage:", v36);

            }
            v26 = 0;
          }

          v21 = 0;
LABEL_15:

          if (v26)
          {
            v30 = 1;
            goto LABEL_19;
          }
LABEL_17:
          objc_msgSend(v6, "string");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            v9 = 0;
            goto LABEL_21;
          }
          v32 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v6, "string");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v32, "initWithString:", v33);

          v30 = 0;
LABEL_19:
          -[UITextInputController _pasteAttributedString:pasteAsRichText:](self, "_pasteAttributedString:pasteAsRichText:", v26, v30);

          v9 = 1;
LABEL_21:

          goto LABEL_22;
        }
      }
    }
    v24 = *(_QWORD *)off_1E1678CE0;
    v39[0] = CFSTR("Timeout");
    v39[1] = v24;
    v40[0] = &unk_1E1A96290;
    v40[1] = v15;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = v40;
    v19 = v39;
    v20 = 2;
    goto LABEL_12;
  }
  objc_msgSend(v6, "itemProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController pasteItemProviders:matchesStyle:](self, "pasteItemProviders:matchesStyle:", v8, v4);

  v9 = 1;
LABEL_22:

  return v9;
}

- (void)pasteItemProviders:(id)a3 matchesStyle:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[UITextInputController _pasteController](self, "_pasteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController selectedTextRange](self, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[UITextInputController beginningOfDocument](self, "beginningOfDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UITextInputController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v8, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "beginPastingItems:toRange:delegate:matchesTextStyles:", v11, v9, 0, v4);

}

- (void)pasteItemProviders:(id)a3
{
  -[UITextInputController pasteItemProviders:matchesStyle:](self, "pasteItemProviders:matchesStyle:", a3, 0);
}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_tiFlags & 0x40) != 0)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "textInput:prepareAttributedTextForInsertion:", self, v6);

    v5 = (void *)v6;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "smartInsertDeleteIsEnabled");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DBDD20], "traitsForUITextInputTraits:", self->_textInputTraits);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDCC8]), "initWithTextInputTraits:", v10);
    objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    objc_msgSend(v11, "smartInsertForDocumentState:stringToInsert:outBeforeString:outAfterString:", v12, v13, &v29, &v28);
    v14 = v29;
    v15 = v28;

    if ((*((_BYTE *)&self->_tiFlags + 1) & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = objc_msgSend(v16, "isSingleLineDocument");

      if (v17)
      {
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20);
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (id)v18;
        }
        if (objc_msgSend(v15, "length"))
        {
          objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20);
          v19 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v19;
        }
      }
    }
    if (objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
    {
      v20 = (void *)objc_msgSend(v5, "mutableCopy");
      if (objc_msgSend(v14, "length"))
      {
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "attributesAtIndex:effectiveRange:", 0, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          objc_msgSend(v22, "removeObjectForKey:", *(_QWORD *)off_1E1678C48);
        }
        else
        {
          v22 = 0;
        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, v22);
        objc_msgSend(v20, "insertAttributedString:atIndex:", v23, 0);

      }
      if (objc_msgSend(v15, "length"))
      {
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "attributesAtIndex:effectiveRange:", objc_msgSend(v20, "length") - 1, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

          objc_msgSend(v25, "removeObjectForKey:", *(_QWORD *)off_1E1678C48);
        }
        else
        {
          v25 = 0;
        }
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v25);
        objc_msgSend(v20, "appendAttributedString:", v26);

      }
      v5 = v20;
    }

  }
  return v5;
}

- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[UITextInputController _attributedStringForInsertionOfAttributedString:](self, "_attributedStringForInsertionOfAttributedString:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _pasteRawAttributedString:asRichText:](self, "_pasteRawAttributedString:asRichText:", v6, v4);

}

- (void)_pasteAttributedString:(id)a3 toRange:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, id);
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  -[UITextInputController _attributedStringForInsertionOfAttributedString:](self, "_attributedStringForInsertionOfAttributedString:", a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)&self->_firstTextView);
  objc_msgSend(v11, "_beginPinningInputViewsOnBehalfOfResponder:", v12);

  -[UITextInputController _pasteRawAttributedString:asRichText:](self, "_pasteRawAttributedString:asRichText:", v18, 1);
  objc_msgSend(v11, "_stopPinningInputViewsOnBehalfOfResponder:", WeakRetained);
  if (v9)
  {
    objc_msgSend(v8, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputController positionFromPosition:offset:](self, "positionFromPosition:offset:", v14, objc_msgSend(v18, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[UITextInputController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "end");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v13, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9[2](v9, v16, v18);

  }
}

- (void)_pasteRawAttributedString:(id)a3 asRichText:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  _UIKitBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASTE_FOR_UNDO"), CFSTR("Paste"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UITextInputController selectedRange](self, "selectedRange");
  v10 = v9;
  objc_msgSend(v19, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v7, v8, v10, v11);

  v12 = -[UITextInputController _selectedRange](self, "_selectedRange");
  v14 = v13;
  objc_msgSend(v19, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = -[UITextInputController _delegateShouldChangeTextInRange:replacementText:](self, "_delegateShouldChangeTextInRange:replacementText:", v12, v14, v15);

  if ((_DWORD)v12)
  {
    v16 = -[UITextInputController _selectedRange](self, "_selectedRange");
    -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v16, v17);
    if (v4)
    {
      -[UITextInputController _insertAttributedText:fromKeyboard:](self, "_insertAttributedText:fromKeyboard:", v19, 0);
    }
    else
    {
      objc_msgSend(v19, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController _insertText:fromKeyboard:](self, "_insertText:fromKeyboard:", v18, 0);

    }
  }

}

- (void)_adjustSizeByIncreasing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = a3;
  if (-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
  {
    _UIKitBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = CFSTR("Bigger");
    else
      v7 = CFSTR("Smaller");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[UITextInputController selectedRange](self, "selectedRange");
    -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v8, v9, v10, 0);
    -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__207;
    v35 = __Block_byref_object_dispose__207;
    v36 = 0;
    -[UITextInputController _textStorage](self, "_textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__UITextInputController__adjustSizeByIncreasing___block_invoke;
    v30[3] = &unk_1E16E6850;
    v30[4] = self;
    v30[5] = &v31;
    objc_msgSend(v11, "coordinateReading:", v30);

    objc_msgSend((id)v32[5], "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pointSize");
    v15 = 0.862068966;
    if (v3)
      v15 = 1.16;
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v13, fmax(v15 * v14, 7.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UITextInputController _selectedRange](self, "_selectedRange");
    v20 = v19;
    -[UITextInputController _textStorage](self, "_textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __49__UITextInputController__adjustSizeByIncreasing___block_invoke_2;
    v24[3] = &unk_1E16E6B10;
    v24[4] = self;
    v22 = v16;
    v25 = v22;
    v27 = v18;
    v28 = v20;
    v23 = v17;
    v26 = v23;
    v29 = v3;
    objc_msgSend(v21, "coordinateEditing:", v24);

    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
    _Block_object_dispose(&v31, 8);

  }
}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
  if (v4 && v3 < objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D90, objc_msgSend(*(id *)(a1 + 32), "_selectedRange"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fallbackFont");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v3 = a2;
  v4 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(*(id *)(a1 + 32), "_addToTypingAttributes:value:", *(_QWORD *)off_1E1678D90, *(_QWORD *)(a1 + 40));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__UITextInputController__adjustSizeByIncreasing___block_invoke_3;
  v9[3] = &unk_1E16E6AE8;
  v5 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 72);
  v10 = v5;
  v11 = v3;
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v4, v7, v6, 0x100000, v9);

}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v7 = a2;
  if (!v7)
    v7 = *(id *)(a1 + 32);
  v11 = v7;
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v8, fmax(v9 * dbl_186684990[*(_BYTE *)(a1 + 48) == 0], 7.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v10, a3, a4);

}

- (void)increaseSize:(id)a3
{
  -[UITextInputController _adjustSizeByIncreasing:](self, "_adjustSizeByIncreasing:", 1);
}

- (void)decreaseSize:(id)a3
{
  -[UITextInputController _adjustSizeByIncreasing:](self, "_adjustSizeByIncreasing:", 0);
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a3;
  if (-[UITextInputController allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
  {
    -[UITextInputController _selectedRange](self, "_selectedRange");
    if (v4)
    {
      _UIKitBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Set Font"), CFSTR("Set Font"), CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UITextInputController selectedRange](self, "selectedRange");
      -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v6, v7, v8, 0);

      -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
      v9 = -[UITextInputController _selectedRange](self, "_selectedRange");
      v11 = v10;
      -[UITextInputController _fallbackFont](self, "_fallbackFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputController _textStorage](self, "_textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke;
      v16[3] = &unk_1E16E6B60;
      v19 = v9;
      v20 = v11;
      v17 = v12;
      v18 = v15;
      v14 = v12;
      objc_msgSend(v13, "coordinateEditing:", v16);

      -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
    }
  }

}

void __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke_2;
  v8[3] = &unk_1E16E6B38;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", v6, v5, 0x100000, v8);

}

void __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v11, "valueForKey:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (!v8)
  {
    v9 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 32), v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v10, a3, a4);
  objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1678F78, a3, a4);

}

- (void)select:(id)a3
{
  id v3;

  -[UITextInputController interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectWord");

}

- (void)selectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextInputController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll:", v4);

}

- (void)_promptForReplace:(id)a3
{
  id v3;

  -[UITextInputController interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleReplacements");

}

- (void)_transliterateChinese:(id)a3
{
  id v3;

  -[UITextInputController interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleChineseTransliteration");

}

- (void)_removeShareController
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_shareSession, "dismissTextServiceAnimated:", 1);
}

- (void)_share:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _UITextServiceSession *v8;
  _UITextServiceSession *shareSession;
  _UITextServiceSession *v10;
  _QWORD v11[5];

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UITextInputController _removeShareController](self, "_removeShareController");
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_showServiceForType:withContext:", 8, v7);
  v8 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  shareSession = self->_shareSession;
  self->_shareSession = v8;

  v10 = self->_shareSession;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__UITextInputController__share___block_invoke;
  v11[3] = &unk_1E16E5888;
  v11[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v11);

}

void __32__UITextInputController__share___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;

}

- (void)_removeShortcutController
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_learnSession, "dismissTextServiceAnimated:", 1);
}

- (void)_define:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UITextServiceSession *v8;
  _UITextServiceSession *lookupSession;
  _UITextServiceSession *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  if (self->_lookupSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputController.m"), 4832, CFSTR("Shouldn't have a lookup session"));

  }
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 16, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_showServiceForType:withContext:", 16, v7);
  v8 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  lookupSession = self->_lookupSession;
  self->_lookupSession = v8;

  objc_initWeak(&location, self);
  v10 = self->_lookupSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__UITextInputController__define___block_invoke;
  v12[3] = &unk_1E16E6B88;
  objc_copyWeak(&v13, &location);
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __33__UITextInputController__define___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)_translate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UITextServiceSession *v8;
  _UITextServiceSession *translateSession;
  _UITextServiceSession *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  if (self->_translateSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputController.m"), 4848, CFSTR("Shouldn't have translate session"));

  }
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 32, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_showServiceForType:withContext:", 32, v7);
  v8 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  translateSession = self->_translateSession;
  self->_translateSession = v8;

  objc_initWeak(&location, self);
  v10 = self->_translateSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__UITextInputController__translate___block_invoke;
  v12[3] = &unk_1E16E6B88;
  objc_copyWeak(&v13, &location);
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __36__UITextInputController__translate___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[10];
    WeakRetained[10] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)_isDisplayingTextService
{
  return -[UITextInputController _isDisplayingShortcutViewController](self, "_isDisplayingShortcutViewController")
      || -[UITextInputController _isDisplayingReferenceLibraryViewController](self, "_isDisplayingReferenceLibraryViewController")|| -[UITextInputController _isDisplayingLookupViewController](self, "_isDisplayingLookupViewController")|| -[UITextInputController _isDisplayingShareViewController](self, "_isDisplayingShareViewController");
}

- (BOOL)_isDisplayingShortcutViewController
{
  return -[_UITextServiceSession isDisplaying](self->_learnSession, "isDisplaying");
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  return -[_UITextServiceSession isDisplaying](self->_lookupSession, "isDisplaying");
}

- (BOOL)_isDisplayingLookupViewController
{
  return -[_UITextServiceSession isDisplaying](self->_lookupSession, "isDisplaying");
}

- (BOOL)_isDisplayingShareViewController
{
  return -[_UITextServiceSession isDisplaying](self->_shareSession, "isDisplaying");
}

- (void)_clearSelectionUI
{
  void *v3;
  void *v4;
  id v5;

  -[UITextInputController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSelection");

  -[UITextInputController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDisplayedSelection");

}

- (void)_addShortcut:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _UITextServiceSession *v9;
  _UITextServiceSession *learnSession;
  _UITextServiceSession *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UITextInputController _removeShortcutController](self, "_removeShortcutController");
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showServiceForType:withContext:", 4, v8);
  v9 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  learnSession = self->_learnSession;
  self->_learnSession = v9;

  objc_msgSend(v7, "resignFirstResponder");
  objc_initWeak(&location, self);
  v11 = self->_learnSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__UITextInputController__addShortcut___block_invoke;
  v12[3] = &unk_1E16E6B88;
  objc_copyWeak(&v13, &location);
  -[_UITextServiceSession setDismissedHandler:](v11, "setDismissedHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __38__UITextInputController__addShortcut___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    v5 = WeakRetained;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    WeakRetained = v5;
    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v5, "_clearSelectionUI");
      WeakRetained = v5;
    }
  }

}

- (id)_fallbackFont
{
  void *v2;
  void *v3;

  -[UITextInputController typingAttributes](self, "typingAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_toggleFontTrait:(unsigned int)a3
{
  void *v5;
  _QWORD v6[5];
  unsigned int v7;

  -[UITextInputController _textStorage](self, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__UITextInputController__toggleFontTrait___block_invoke;
  v6[3] = &unk_1E16E6BD8;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "coordinateEditing:", v6);

}

void __42__UITextInputController__toggleFontTrait___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  int v21;
  int v22;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fallbackFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "symbolicTraits");

  v6 = *(_DWORD *)(a1 + 40);
  if ((v6 & v5) != 0)
    v7 = 0;
  else
    v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
  v8 = *(_QWORD *)off_1E1678D90;
  if (v9)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
    v12 = v11;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__UITextInputController__toggleFontTrait___block_invoke_2;
    v18[3] = &unk_1E16E6BB0;
    v19 = v3;
    v13 = *(_DWORD *)(a1 + 40);
    v21 = v7;
    v22 = v13;
    v20 = v17;
    objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v8, v10, v12, 0x100000, v18);

  }
  objc_msgSend(v3, "fontDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:mask:", v7, *(unsigned int *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addToTypingAttributes:value:", v8, v16);

}

void __42__UITextInputController__toggleFontTrait___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a2;
  if (!a2)
    v8 = *(void **)(a1 + 32);
  v9 = v8;
  v13 = a2;
  objc_msgSend(v9, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:mask:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "pointSize");
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1678F78, a3, a4);

  }
}

- (void)toggleBoldface:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  _UIKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BOLD_FOR_UNDO"), CFSTR("Bold"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
  -[UITextInputController _toggleFontTrait:](self, "_toggleFontTrait:", 2);
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
}

- (void)toggleItalics:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  _UIKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ITALIC_FOR_UNDO"), CFSTR("Italic"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
  -[UITextInputController _toggleFontTrait:](self, "_toggleFontTrait:", 1);
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
}

- (void)toggleUnderline:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  _UIKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNDERLINE_FOR_UNDO"), CFSTR("Underline"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITextInputController selectedRange](self, "selectedRange");
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
  -[UITextInputController _textStorage](self, "_textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__UITextInputController_toggleUnderline___block_invoke;
  v9[3] = &unk_1E16E6408;
  v9[4] = self;
  objc_msgSend(v8, "coordinateEditing:", v9);

  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
}

void __41__UITextInputController_toggleUnderline___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)off_1E1679240;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)off_1E1679240);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)v5;
  else
    v6 = &unk_1E1A9A8F0;
  if (objc_msgSend(v6, "intValue"))
    v7 = &unk_1E1A9A8F0;
  else
    v7 = &unk_1E1A9A908;
  objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
  if (v8)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
    objc_msgSend(v11, "addAttribute:value:range:", v4, v7, v9, v10);
  }
  objc_msgSend(*(id *)(a1 + 32), "_addToTypingAttributes:value:", v4, v7);

}

- (void)_changeTextAlignment:(int64_t)a3 undoString:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[8];

  -[UITextInputController _textStorage](self, "_textStorage", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UITextInputController _selectedRange](self, "_selectedRange");
  v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8, v9);
  v12 = v11;

  _UIKitBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Align Left"), CFSTR("Align Left"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v14, v10, v12, 0);

  -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](self, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
  -[UITextInputController _textStorage](self, "_textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__UITextInputController__changeTextAlignment_undoString___block_invoke;
  v16[3] = &unk_1E16E6C00;
  v16[4] = self;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = a3;
  objc_msgSend(v15, "coordinateEditing:", v16);

  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0);
}

void __57__UITextInputController__changeTextAlignment_undoString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)off_1E1678F98;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__UITextInputController__changeTextAlignment_undoString___block_invoke_2;
    v8[3] = &unk_1E16E6878;
    v10 = *(_QWORD *)(a1 + 56);
    v9 = v7;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0x100000, v8);

  }
  if (objc_msgSend(v5, "alignment") != *(_QWORD *)(a1 + 56))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setAlignment:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_addToTypingAttributes:value:", v4, v6);

  }
}

void __57__UITextInputController__changeTextAlignment_undoString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;

  v7 = a2;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "alignment") != *(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setAlignment:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v8, a3, a4);

  }
}

- (void)alignLeft:(id)a3
{
  void *v4;
  id v5;

  _UIKitBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Align Left"), CFSTR("Align Left"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _changeTextAlignment:undoString:](self, "_changeTextAlignment:undoString:", 0, v4);

}

- (void)alignCenter:(id)a3
{
  void *v4;
  id v5;

  _UIKitBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Center"), CFSTR("Center"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _changeTextAlignment:undoString:](self, "_changeTextAlignment:undoString:", 1, v4);

}

- (void)alignJustified:(id)a3
{
  void *v4;
  id v5;

  _UIKitBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Justify"), CFSTR("Justify"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _changeTextAlignment:undoString:](self, "_changeTextAlignment:undoString:", 3, v4);

}

- (void)alignRight:(id)a3
{
  void *v4;
  id v5;

  _UIKitBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Align Right"), CFSTR("Align Right"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputController _changeTextAlignment:undoString:](self, "_changeTextAlignment:undoString:", 2, v4);

}

- (void)_validateCommand:(id)a3 forFont:(id)a4 traits:(int)a5
{
  uint64_t v5;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "traits");
  LODWORD(a4) = v8 & v5;
  objc_msgSend(v12, "setState:", (v8 & v5) == (_DWORD)v5);
  if ((_DWORD)a4 != (_DWORD)v5)
  {
    objc_msgSend(v7, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:mask:", v5, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "pointSize");
      objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && (v5 & ~objc_msgSend(v11, "traits")) == 0)
        goto LABEL_8;
    }
    else
    {

      v11 = 0;
    }
    objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 1);
LABEL_8:

    v7 = v11;
  }

}

- (void)validateCommand:(id)a3
{
  char *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id WeakRetained;
  void *v37;
  id v38;

  v38 = a3;
  v4 = (char *)objc_msgSend(v38, "action");
  v5 = -[UITextInputController _canHandleResponderAction:](self, "_canHandleResponderAction:", v4);
  v6 = v38;
  if (!v5)
    goto LABEL_59;
  v8 = v4 == sel_makeTextWritingDirectionNatural_
    || v4 == sel_makeTextWritingDirectionLeftToRight_
    || v4 == sel_makeTextWritingDirectionRightToLeft_;
  if (-[UITextInputController _shouldHandleResponderAction:](self, "_shouldHandleResponderAction:", v4))
  {
    -[UITextInputController typingAttributes](self, "typingAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UITextInputController selectedRange](self, "selectedRange");
    -[UITextInputController _textStorage](self, "_textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    v13 = *(_QWORD *)off_1E1678F98;
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = 1;
    if (v4 != sel_alignLeft_ && v4 != sel_alignCenter_ && v4 != sel_alignJustified_)
      v16 = v4 == sel_alignRight_;
    v17 = v16 || v8;
    if (v9 || v10 >= v12)
    {
      if (v17)
      {
        if (!v14)
        {
LABEL_20:
          objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_21:
        v24 = objc_msgSend(v15, "alignment");
        v25 = objc_msgSend(v15, "baseWritingDirection");
        if (v16)
        {
          v26 = v38;
          if (v24 == 4)
          {
            if (v25 == -1)
            {
              v25 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", 0);
              v26 = v38;
            }
            v24 = 2 * (v25 == 1);
          }
          v27 = 3;
          if (v4 != sel_alignJustified_)
            v27 = 0;
          v28 = 2;
          if (v4 != sel_alignRight_)
            v28 = v27;
          if (v4 == sel_alignCenter_)
            v28 = 1;
          v29 = v28 == v24;
          v30 = v26;
        }
        else
        {
          v33 = 1;
          if (v4 != sel_makeTextWritingDirectionRightToLeft_)
            v33 = -1;
          if (v4 == sel_makeTextWritingDirectionLeftToRight_)
            v33 = 0;
          v29 = v33 == v25;
          v30 = v38;
        }
        objc_msgSend(v30, "setState:", v29);
        goto LABEL_56;
      }
    }
    else
    {
      -[UITextInputController _textStorage](self, "_textStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v18, "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "paragraphRangeForRange:", v10, 1);

        -[UITextInputController _textStorage](self, "_textStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "attribute:atIndex:effectiveRange:", v13, v21, 0);
        v23 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v15 = (void *)v23;
        if (!v23)
          goto LABEL_20;
        goto LABEL_21;
      }
      objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v10, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v4 == sel_toggleBoldface_ || v4 == sel_toggleItalics_)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        if (v4 == sel_toggleBoldface_)
          v34 = 2;
        else
          v34 = 1;
        -[UITextInputController _validateCommand:forFont:traits:](self, "_validateCommand:forFont:traits:", v38, v31, v34);
      }
    }
    else
    {
      if (v4 == sel_toggleUnderline_)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679240);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "integerValue") == 0;
      }
      else
      {
        if (v4 != sel_toggleSmartInsertDelete_)
        {
LABEL_56:

          goto LABEL_57;
        }
        -[UITextInputController _textInputTraits](self, "_textInputTraits");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "smartInsertDeleteType") == 1;
      }
      v35 = !v32;
      objc_msgSend(v38, "setState:", v35);
    }

    goto LABEL_56;
  }
LABEL_57:
  v6 = v38;
  if (v4 == sel_captureTextFromCamera_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    +[UIAction _textFromCameraTitleForResponder:](UIAction, "_textFromCameraTitleForResponder:", WeakRetained);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTitle:", v37);

    v6 = v38;
  }
LABEL_59:

}

- (id)validAnnotations
{
  return -[UITextCheckingController validAnnotations](self->_textCheckingController, "validAnnotations");
}

- (id)annotatedSubstringForRange:(id)a3
{
  _UITextLayoutController **p_textLayoutController;
  id v4;
  id WeakRetained;
  void *v6;

  p_textLayoutController = &self->_textLayoutController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  objc_msgSend(WeakRetained, "annotatedSubstringForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)replaceRange:(id)a3 withAnnotatedString:(id)a4 relativeReplacementRange:(_NSRange)a5
{
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSUInteger v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSUInteger v45;
  UITextInputController *v46;
  NSUInteger length;
  id v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  NSUInteger v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  NSUInteger v60;
  NSUInteger v61;
  _BYTE v62[128];
  uint64_t v63;

  length = a5.length;
  location = a5.location;
  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[UITextInputController _textStorage](self, "_textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "length");
  v12 = objc_msgSend(v10, "length");
  v46 = self;
  p_textLayoutController = &self->_textLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v15 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v8);
  v17 = v16;

  v49 = v15;
  v18 = v15 + v17;
  v19 = v10;
  if (v18 <= v12)
  {
    v20 = v11;
    if (location != 0x7FFFFFFFFFFFFFFFLL && location + length <= v17)
    {
      v21 = v11 + length - v17;
      if (v11 + length >= v17)
      {
        v22 = v49 + location;
        v41 = -[UITextInputController selectedRange](v46, "selectedRange");
        v38 = v23;
        v39 = v21;
        objc_msgSend(v9, "attributedSubstringFromRange:", location, v21);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[UITextInputController _newAttributedStringForReplacementOfAnnotatedText:inRange:](v46, "_newAttributedStringForReplacementOfAnnotatedText:inRange:");
        _UIKitBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Replace"), CFSTR("Replace"), CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "string");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](v46, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v25, v22, length, v26);

        -[UITextInputController _sendDelegateWillChangeNotificationsForText:selection:](v46, "_sendDelegateWillChangeNotificationsForText:selection:", 1, 0);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke;
        v58[3] = &unk_1E16E61C0;
        v60 = v22;
        v61 = length;
        v59 = v40;
        v27 = v40;
        objc_msgSend(v19, "coordinateEditing:", v58);
        if (v41 >= v22 + length && v39 != length)
          -[UITextInputController setSelectedRange:](v46, "setSelectedRange:", v39 - length + v41, v38);
        -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](v46, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v27, v22, length);

      }
    }
    v28 = objc_msgSend(v19, "length");
    if (v20 && v49 + v20 <= v28)
    {
      v44 = v9;
      v45 = v17;
      v48 = v8;
      v29 = objc_loadWeakRetained((id *)p_textLayoutController);
      v42 = v20;
      objc_msgSend(v29, "textRangeForCharacterRange:", v49, v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[UITextInputController validAnnotations](v46, "validAnnotations");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v55 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            v37 = objc_loadWeakRetained((id *)p_textLayoutController);
            objc_msgSend(v37, "removeAnnotationAttribute:forRange:", v36, v30);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v33);
      }

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_2;
      v50[3] = &unk_1E16E6C28;
      v52 = v49;
      v53 = v45;
      v50[4] = v46;
      v51 = v19;
      v9 = v44;
      objc_msgSend(v44, "enumerateAttributesInRange:options:usingBlock:", 0, v42, 0, v50);

      v8 = v48;
    }
  }

}

uint64_t __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], a1[4]);
}

void __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v15 = a2;
  v7 = *(_QWORD *)off_1E16790E0;
  objc_msgSend(v15, "objectForKey:", *(_QWORD *)off_1E16790E0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[6] + a3;
  v10 = v15;
  if (v8)
  {
    *(_DWORD *)(a1[4] + 144) |= 0x20000u;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_3;
    v16[3] = &unk_1E16E61C0;
    v17 = v8;
    v18 = v9;
    v19 = a4;
    objc_msgSend(v11, "coordinateEditing:", v16);
    objc_msgSend(v10, "removeObjectForKey:", v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v9, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)(a1[4] + 232));
  objc_msgSend(v14, "addRenderingAttributes:forRange:", v10, v13);

}

uint64_t __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "addAttribute:value:range:", *(_QWORD *)off_1E16790E0, a1[4], a1[5], a1[6]);
}

- (void)removeAnnotation:(id)a3 forRange:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  _UITextLayoutController **p_textLayoutController;
  id WeakRetained;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v18, "isEqualToString:", *(_QWORD *)off_1E16790E8))
  {
    -[UITextInputController removeSpellingMarkersFromWordInRange:](self, "removeSpellingMarkersFromWordInRange:", v6);
  }
  else
  {
    -[UITextInputController _textStorage](self, "_textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    p_textLayoutController = &self->_textLayoutController;
    WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
    v11 = objc_msgSend(WeakRetained, "characterRangeForTextRange:", v6);
    v13 = v12;

    if (v13 && v8 > v11)
    {
      if (v11 + v13 <= v8)
        v14 = v13;
      else
        v14 = v8 - v11;
      v15 = objc_loadWeakRetained((id *)p_textLayoutController);
      objc_msgSend(v15, "textRangeForCharacterRange:", v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_loadWeakRetained((id *)p_textLayoutController);
      objc_msgSend(v17, "removeAnnotationAttribute:forRange:", v18, v16);

    }
  }

}

- (void)captureTextFromCamera:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UITextInputController _firstTextView](self, "_firstTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardCameraSession sharedSession](UIKeyboardCameraSession, "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showForResponder:sender:rtiConfiguration:", v6, v4, 0);

}

- (_UITextLayoutController)textLayoutController
{
  return (_UITextLayoutController *)objc_loadWeakRetained((id *)&self->_textLayoutController);
}

- (BOOL)allowsEditingTextAttributes
{
  return self->_allowsEditingTextAttributes;
}

- (UITextInputControllerDelegate)delegate
{
  return (UITextInputControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)continuousSpellCheckingEnabled
{
  return self->_continuousSpellCheckingEnabled;
}

- (UITextRange)previousSelectedTextRange
{
  return self->_previousSelectedTextRange;
}

- (void)setPreviousSelectedTextRange:(id)a3
{
  objc_storeStrong((id *)&self->_previousSelectedTextRange, a3);
}

- (int)currentUndoGroupType
{
  return self->_currentUndoGroupType;
}

- (void)setCurrentUndoGroupType:(int)a3
{
  self->_currentUndoGroupType = a3;
}

- (BOOL)shouldStartUndoGroup
{
  return self->_shouldStartUndoGroup;
}

- (void)setShouldStartUndoGroup:(BOOL)a3
{
  self->_shouldStartUndoGroup = a3;
}

@end
