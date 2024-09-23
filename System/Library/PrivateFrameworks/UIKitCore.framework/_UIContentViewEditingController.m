@implementation _UIContentViewEditingController

- (_UIContentViewEditingController)initWithContentView:(id)a3 editableLabel:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIContentViewEditingController *v10;
  _UIContentViewEditingController *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentView != nil"));

    if (v9)
    {
LABEL_3:
      if (!objc_msgSend(v9, "isHidden"))
        goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editableLabel != nil && !editableLabel.hidden"));

LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)_UIContentViewEditingController;
  v10 = -[_UIContentViewEditingController init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_contentView, v7);
    objc_storeStrong((id *)&v11->_editableLabel, a4);
    v11->_hasEdits = 0;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p contentView: %@>"), v4, self, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)updateLabelConfiguration:(id)a3 editingConfiguration:(id)a4
{
  id v8;
  _UIContentViewEditingConfiguration **p_editingConfiguration;
  UITextField *textInputView;
  _UIContentViewEditingConfiguration *editingConfiguration;
  _BOOL4 v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  UITextField *v16;
  UILongPressGestureRecognizer *v17;
  UILongPressGestureRecognizer *longPressRecognizer;
  void *v19;
  id v20;
  _QWORD block[4];
  id v22;
  BOOL v23;

  v20 = a3;
  v8 = a4;
  p_editingConfiguration = &self->_editingConfiguration;
  objc_storeStrong((id *)&self->_editingConfiguration, a4);
  objc_storeStrong((id *)&self->_labelConfiguration, a3);
  textInputView = self->_textInputView;
  if (textInputView
    && !-[UIView isFirstResponder](textInputView, "isFirstResponder")
    && !-[_UIContentViewEditingConfiguration useTextInputAsLabel](*p_editingConfiguration, "useTextInputAsLabel"))
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  }
  editingConfiguration = *p_editingConfiguration;
  if (!*p_editingConfiguration)
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
LABEL_13:
    -[_UIContentViewEditingController removeGestureRecognizer]((uint64_t)self);
    goto LABEL_22;
  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingController.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labelConfiguration != nil"));

    editingConfiguration = self->_editingConfiguration;
  }
  v12 = -[_UIContentViewEditingConfiguration useTextInputAsLabel](editingConfiguration, "useTextInputAsLabel");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___UIContentViewEditingController_updateLabelConfiguration_editingConfiguration___block_invoke;
  block[3] = &unk_1E16B1B78;
  v23 = v12;
  v13 = v20;
  v14 = v13;
  v22 = v13;
  if (updateLabelConfiguration_editingConfiguration__once == -1)
  {
    v15 = v13;
  }
  else
  {
    dispatch_once(&updateLabelConfiguration_editingConfiguration__once, block);
    v15 = v22;
  }

  v16 = self->_textInputView;
  if (v16)
  {
    -[_UIContentViewLabelConfiguration _applyToTextField:]((uint64_t)self->_labelConfiguration, v16);
  }
  else if (v12)
  {
    -[_UIContentViewEditingController setupTextInputView]((uint64_t)self);
  }
  if (!v20 || !v14[2] && !v14[7])
    goto LABEL_13;
  if (!-[_UIContentViewEditingConfiguration useTextInputAsLabel](*p_editingConfiguration, "useTextInputAsLabel")
    && !self->_longPressRecognizer)
  {
    v17 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_longPressRecognizerChanged_);
    longPressRecognizer = self->_longPressRecognizer;
    self->_longPressRecognizer = v17;

    -[UIView addGestureRecognizer:](self->_editableLabel, "addGestureRecognizer:", self->_longPressRecognizer);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_longPressRecognizer, "setCancelsTouchesInView:", 1);
    -[UILabel setUserInteractionEnabled:](self->_editableLabel, "setUserInteractionEnabled:", 1);
  }
LABEL_22:

}

- (uint64_t)tearDownTextInputView
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    -[_UIContentViewEditingController tearDownPassthroughInteraction](result);
    objc_msgSend(*(id *)(v1 + 48), "setDelegate:", 0);
    objc_msgSend(*(id *)(v1 + 48), "removeFromSuperview");
    v2 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = 0;

    return objc_msgSend(*(id *)(v1 + 40), "setAlpha:", 1.0);
  }
  return result;
}

- (void)setupTextInputView
{
  double v2;
  double v3;
  double v4;
  double v5;
  _UIContentViewEditingTextField *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_setupTextInputView, a1, CFSTR("_UIContentViewEditingController.m"), 126, CFSTR("Attempting to set up a text input view while one already exists."));

    }
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v6 = -[UITextField initWithFrame:]([_UIContentViewEditingTextField alloc], "initWithFrame:", v2, v3, v4, v5);
    v7 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v6;

    objc_msgSend(*(id *)(a1 + 48), "setDelegate:", a1);
    -[_UIContentViewLabelConfiguration _applyToTextField:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "addSubview:", *(_QWORD *)(a1 + 48));

  }
}

- (uint64_t)removeGestureRecognizer
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 8), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeGestureRecognizer:", *(_QWORD *)(v1 + 8));

    return objc_msgSend(*(id *)(v1 + 40), "setUserInteractionEnabled:", 0);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UIContentViewEditingController;
  -[_UIContentViewEditingController dealloc](&v3, sel_dealloc);
}

- (void)longPressRecognizerChanged:(id)a3
{
  if (objc_msgSend(a3, "state") == 1
    && !-[UIView isFirstResponder](self->_textInputView, "isFirstResponder")
    && !-[_UIContentViewEditingController makeTextInputFirstResponderWithInitialLayoutBlock:](self, "makeTextInputFirstResponderWithInitialLayoutBlock:", &__block_literal_global_289))
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  }
}

- (void)tearDownPassthroughInteraction
{
  void *v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeInteraction:");
      v2 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

- (BOOL)makeTextInputFirstResponderWithInitialLayoutBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UITextField *textInputView;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (!self->_editingConfiguration)
  {
    LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  if (!self->_textInputView)
  {
    -[_UIContentViewEditingController setupTextInputView]((uint64_t)self);
    if (!v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v4)
LABEL_4:
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
LABEL_5:
  LODWORD(v6) = -[UITextField becomeFirstResponder](self->_textInputView, "becomeFirstResponder");
  if (-[_UIContentViewEditingConfiguration selectAllTextWhenEditingBegins](self->_editingConfiguration, "selectAllTextWhenEditingBegins")&& (_DWORD)v6)
  {
    textInputView = self->_textInputView;
    -[UITextField beginningOfDocument](textInputView, "beginningOfDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField endOfDocument](self->_textInputView, "endOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField textRangeFromPosition:toPosition:](textInputView, "textRangeFromPosition:toPosition:", v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setSelectedTextRange:](self->_textInputView, "setSelectedTextRange:", v6);

    LOBYTE(v6) = 1;
  }
LABEL_9:

  return (char)v6;
}

- (BOOL)isDisplayingEditedText
{
  if (self->_textInputView)
    return !-[_UIContentViewEditingConfiguration useTextInputAsLabel](self->_editingConfiguration, "useTextInputAsLabel");
  else
    return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  char v11;
  void (**v12)(_QWORD, _QWORD);
  _UIContentViewEditingState *v13;
  void *v14;
  _UIContentViewEditingState *v15;
  void *v16;
  void *v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("\t")))
  {
    objc_msgSend(v9, "resignFirstResponder");
    v11 = 0;
  }
  else
  {
    -[_UIContentViewEditingConfiguration shouldChangeHandler](self->_editingConfiguration, "shouldChangeHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = [_UIContentViewEditingState alloc];
      objc_msgSend(v9, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_UIContentViewEditingState initWithText:proposedReplacementText:proposedReplacementRange:](v13, "initWithText:proposedReplacementText:proposedReplacementRange:", v14, v10, location, length);

      ((void (**)(_QWORD, _UIContentViewEditingState *))v12)[2](v12, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_UIContentViewEditingState isEqual:](v15, "isEqual:", v16);
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v16, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", v17);

      }
    }
    else
    {
      v11 = 1;
    }

  }
  return v11;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  uint64_t v3;
  void *v4;
  char v5;

  -[_UIContentViewEditingConfiguration shouldBeginHandler](self->_editingConfiguration, "shouldBeginHandler", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  else
    v5 = 1;

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  _UIPassthroughScrollInteraction *v4;
  _UIPassthroughScrollInteraction *passthroughInteraction;
  void *v6;

  if (self)
  {
    if (self->_passthroughInteraction)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_setupPassthroughInteraction, self, CFSTR("_UIContentViewEditingController.m"), 179, CFSTR("Attempting to set up a passthrough interaction while one already exists"));

    }
    v4 = objc_alloc_init(_UIPassthroughScrollInteraction);
    passthroughInteraction = self->_passthroughInteraction;
    self->_passthroughInteraction = v4;

    -[_UIPassthroughScrollInteraction setDelegate:](self->_passthroughInteraction, "setDelegate:", self);
    -[UIView addInteraction:](self->_textInputView, "addInteraction:", self->_passthroughInteraction);
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  _UIContentViewEditingState *v6;
  void *v7;
  _UIContentViewEditingState *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v4 = a3;
  -[_UIContentViewEditingConfiguration shouldEndHandler](self->_editingConfiguration, "shouldEndHandler");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = [_UIContentViewEditingState alloc],
        objc_msgSend(v4, "text"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[_UIContentViewEditingState initWithText:](v6, "initWithText:", v7),
        v7,
        LODWORD(v7) = ((uint64_t (**)(_QWORD, _UIContentViewEditingState *))v5)[2](v5, v8),
        v8,
        !(_DWORD)v7))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContentViewLabelConfiguration text](self->_labelConfiguration, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v12 = 1;
    if ((v11 & 1) == 0)
      self->_hasEdits = 1;
  }

  return v12;
}

- (void)textFieldDidEndEditing:(id)a3
{
  _UIContentViewEditingConfiguration *v5;
  void (**v6)(_QWORD, _QWORD);
  _UIContentViewEditingState *v7;
  void *v8;
  _UIContentViewEditingState *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_UIContentViewEditingController tearDownPassthroughInteraction]((uint64_t)self);
  v5 = self->_editingConfiguration;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingController.m"), 264, CFSTR("Text field ended editing, but we no longer have an editing configuration."));

  }
  -[_UIContentViewEditingConfiguration didEndHandler](v5, "didEndHandler");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [_UIContentViewEditingState alloc];
    objc_msgSend(v11, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIContentViewEditingState initWithText:](v7, "initWithText:", v8);

    ((void (**)(_QWORD, _UIContentViewEditingState *))v6)[2](v6, v9);
  }
  if (!self->_hasEdits && !-[_UIContentViewEditingConfiguration useTextInputAsLabel](v5, "useTextInputAsLabel"))
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  self->_hasEdits = 0;

}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return !-[UIView pointInside:withEvent:](self->_textInputView, "pointInside:withEvent:", a5, a4.x, a4.y);
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return -[UITextField resignFirstResponder](self->_textInputView, "resignFirstResponder", a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (UILabel)editableLabel
{
  return self->_editableLabel;
}

- (UITextField)textInputView
{
  return self->_textInputView;
}

- (void)setTextInputView:(id)a3
{
  objc_storeStrong((id *)&self->_textInputView, a3);
}

- (_UIContentViewEditingConfiguration)editingConfiguration
{
  return self->_editingConfiguration;
}

- (_UIContentViewLabelConfiguration)labelConfiguration
{
  return self->_labelConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConfiguration, 0);
  objc_storeStrong((id *)&self->_editingConfiguration, 0);
  objc_storeStrong((id *)&self->_textInputView, 0);
  objc_storeStrong((id *)&self->_editableLabel, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end
