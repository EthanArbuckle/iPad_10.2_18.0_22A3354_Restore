@implementation UITextCursorDropPositionAnimator

- (UITextCursorDropPositionAnimator)initWithTextCursorView:(id)a3 textInput:(id)a4
{
  id v7;
  id v8;
  UITextCursorDropPositionAnimator *v9;
  UITextCursorDropPositionAnimator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextCursorDropPositionAnimator;
  v9 = -[UITextCursorDropPositionAnimator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cursorView, a3);
    objc_storeStrong((id *)&v10->_textInput, a4);
  }

  return v10;
}

- (id)_hostView
{
  return (id)-[UITextCursorView superview](self->_cursorView, "superview");
}

- (void)_performWithAnimation:(BOOL)a3 :(id)a4
{
  -[UITextCursorDropPositionAnimator _performWithAnimation::completion:](self, "_performWithAnimation::completion:", a3, a4, 0);
}

- (void)_performWithAnimation:(BOOL)a3 :(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  uint64_t v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  void (**v17)(_QWORD);
  void (**v18)(_QWORD);
  _QWORD v19[4];
  void (**v20)(_QWORD);
  void (**v21)(_QWORD);
  _QWORD v22[5];
  _QWORD aBlock[5];

  v6 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_2;
  v22[3] = &unk_1E16B1B28;
  v22[4] = self;
  v12 = (void (**)(_QWORD))_Block_copy(v22);
  if (v6)
  {
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_3;
    v19[3] = &unk_1E16B6740;
    v20 = v8;
    v21 = v11;
    v13 = v10;
    v14 = 3221225472;
    v15 = __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_4;
    v16 = &unk_1E16E0748;
    v17 = v9;
    v18 = v12;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v19, &v13, 400.0, 35.0);

  }
  else
  {
    v8[2](v8);
    v11[2](v11);
    v12[2](v12);
    if (v9)
      v9[2](v9);
  }
  -[NSMutableArray removeAllObjects](self->_alongsideAnimations, "removeAllObjects", v13, v14, v15, v16);
  -[NSMutableArray removeAllObjects](self->_alongsideCompletions, "removeAllObjects");

}

void __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __70__UITextCursorDropPositionAnimator__performWithAnimation::completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)animateAlongsideChanges:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableArray *alongsideAnimations;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  NSMutableArray *alongsideCompletions;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    alongsideAnimations = self->_alongsideAnimations;
    if (!alongsideAnimations)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = self->_alongsideAnimations;
      self->_alongsideAnimations = v8;

      alongsideAnimations = self->_alongsideAnimations;
    }
    v10 = (void *)objc_msgSend(v17, "copy");
    v11 = _Block_copy(v10);
    -[NSMutableArray addObject:](alongsideAnimations, "addObject:", v11);

  }
  if (v6)
  {
    alongsideCompletions = self->_alongsideCompletions;
    if (!alongsideCompletions)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = self->_alongsideCompletions;
      self->_alongsideCompletions = v13;

      alongsideCompletions = self->_alongsideCompletions;
    }
    v15 = (void *)objc_msgSend(v6, "copy");
    v16 = _Block_copy(v15);
    -[NSMutableArray addObject:](alongsideCompletions, "addObject:", v16);

  }
}

- (void)placeCursorAtPosition:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[9];

  v4 = a4;
  v6 = a3;
  if (!-[UITextCursorDropPositionAnimator _hasActiveCaretSelection](self, "_hasActiveCaretSelection"))
  {
    if (self->_didPerformInitialUpdate)
      v4 = v4;
    else
      v4 = 0;
  }
  self->_didPerformInitialUpdate = 1;
  -[UITextInput caretRectForPosition:](self->_textInput, "caretRectForPosition:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UITextCursorDropPositionAnimator _hostView](self, "_hostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textInputView](self->_textInput, "textInputView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__UITextCursorDropPositionAnimator_placeCursorAtPosition_animated___block_invoke;
  v25[3] = &unk_1E16B20D8;
  v25[4] = self;
  v25[5] = v18;
  v25[6] = v20;
  v25[7] = v22;
  v25[8] = v24;
  -[UITextCursorDropPositionAnimator _performWithAnimation::](self, "_performWithAnimation::", v4, v25);
}

uint64_t __67__UITextCursorDropPositionAnimator_placeCursorAtPosition_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setCursorVisible:(BOOL)a3 animated:(BOOL)a4
{
  UITextCursorView *cursorView;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  CGAffineTransform v10;
  CGAffineTransform v11;

  if (self->_isCursorVisible != a3)
  {
    self->_isCursorVisible = a3;
    if (a4)
    {
      if (a3)
      {
        -[UITextCursorView setHidden:](self->_cursorView, "setHidden:", 0);
        -[UITextCursorView setAlpha:](self->_cursorView, "setAlpha:", 0.0);
        if (-[UITextCursorDropPositionAnimator _hasActiveCaretSelection](self, "_hasActiveCaretSelection"))
        {
          -[UITextCursorDropPositionAnimator _currentCaretRect](self, "_currentCaretRect");
          -[UITextCursorView setFrame:](self->_cursorView, "setFrame:");
        }
        CGAffineTransformMakeScale(&v11, 2.0, 2.0);
        cursorView = self->_cursorView;
        v10 = v11;
        -[UITextCursorView setTransform:](cursorView, "setTransform:", &v10);
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke;
        v9[3] = &unk_1E16B1B28;
        v9[4] = self;
        -[UITextCursorDropPositionAnimator _performWithAnimation::](self, "_performWithAnimation::", 1, v9);
        goto LABEL_8;
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke_2;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      -[UITextCursorDropPositionAnimator _performWithAnimation::](self, "_performWithAnimation::", 1, v8);
    }
    else
    {
      -[UITextCursorView setHidden:](self->_cursorView, "setHidden:", !a3);
      if (a3)
      {
LABEL_8:
        -[UITextCursorDropPositionAnimator _cursorColor](self, "_cursorColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextCursorView setTintColor:](self->_cursorView, "setTintColor:", v7);

        return;
      }
    }
    self->_didPerformInitialUpdate = 0;
  }
}

uint64_t __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 1.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __62__UITextCursorDropPositionAnimator_setCursorVisible_animated___block_invoke_2(uint64_t a1)
{
  int v2;
  id *v3;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_dismissalAnimatesBackToCurrentCursorPosition");
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_currentCaretRect");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:");
  }
  else
  {
    objc_msgSend(v3[4], "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v7, 0.8, 0.8);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6 = v7;
    return objc_msgSend(v5, "setTransform:", &v6);
  }
}

- (CGRect)_currentCaretRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UITextInput _caretRect](self->_textInput, "_caretRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_hasActiveCaretSelection
{
  int v3;
  CGRect v5;

  v3 = -[UITextInput isFirstResponder](self->_textInput, "isFirstResponder");
  if (v3)
  {
    -[UITextCursorDropPositionAnimator _currentCaretRect](self, "_currentCaretRect");
    LOBYTE(v3) = !CGRectIsEmpty(v5);
  }
  return v3;
}

- (id)_cursorColor
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[UITextInput insertionPointColor](self->_textInput, "insertionPointColor"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (UITextCursorView)cursorView
{
  return self->_cursorView;
}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInput, 0);
  objc_storeStrong((id *)&self->_cursorView, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end
