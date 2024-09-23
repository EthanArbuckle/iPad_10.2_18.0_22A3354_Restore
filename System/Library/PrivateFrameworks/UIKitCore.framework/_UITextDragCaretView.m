@implementation _UITextDragCaretView

- (_UITextDragCaretView)initWithTextInputView:(id)a3
{
  _UITextDragCaretView *v4;
  id v5;
  uint64_t v6;
  CAShapeLayer *mask;
  objc_super v9;
  id location;

  objc_initWeak(&location, a3);
  v9.receiver = self;
  v9.super_class = (Class)_UITextDragCaretView;
  v4 = -[UIView init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_view, v5);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    mask = v4->_mask;
    v4->_mask = (CAShapeLayer *)v6;

    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)insertAtPosition:(id)a3
{
  -[_UITextDragCaretView _insertAtRangeOrPosition:animations:completion:animated:](self, "_insertAtRangeOrPosition:animations:completion:animated:", a3, 0, 0, 1);
}

- (void)insertAtPosition:(id)a3 animations:(id)a4 completion:(id)a5
{
  -[_UITextDragCaretView _insertAtRangeOrPosition:animations:completion:animated:](self, "_insertAtRangeOrPosition:animations:completion:animated:", a3, a4, a5, 1);
}

- (void)insertAtRange:(id)a3
{
  -[_UITextDragCaretView _insertAtRangeOrPosition:animations:completion:animated:](self, "_insertAtRangeOrPosition:animations:completion:animated:", a3, 0, 0, 1);
}

- (void)insertAtRange:(id)a3 animations:(id)a4 completion:(id)a5
{
  -[_UITextDragCaretView _insertAtRangeOrPosition:animations:completion:animated:](self, "_insertAtRangeOrPosition:animations:completion:animated:", a3, a4, a5, 1);
}

- (void)_insertAtRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id WeakRetained;
  id v14;
  char v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CAShapeLayer *v42;
  void *v43;
  CAShapeLayer *mask;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  id v52;
  BOOL IsEmpty;
  id v54;
  void *v55;
  uint64_t v56;
  CAShapeLayer *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  _QWORD v63[4];
  void (**v64)(_QWORD);
  _QWORD aBlock[5];
  CAShapeLayer *v66;
  id v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "addSubview:", self);

  v14 = v10;
  v15 = objc_opt_respondsToSelector();
  v62 = v6;
  v61 = v11;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v15 & 1) != 0)
      goto LABEL_6;
LABEL_7:
    v17 = objc_retainAutorelease(v14);
    goto LABEL_8;
  }
  v16 = objc_msgSend(v14, "isEmpty", v11);
  if ((v15 & 1) == 0)
    goto LABEL_7;
  if (!v16)
  {
LABEL_6:
    v18 = objc_retainAutorelease(v14);
    v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v14, "start");
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v19 = v17;
  v18 = 0;
LABEL_9:

  v20 = v18;
  v21 = v19;
  if (v21)
  {
    -[_UITextDragCaretView _caretColor](self, "_caretColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v22);

    v23 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v23, "caretRectForPosition:", v21);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v32 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v32, "textInputView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:fromView:", v33, v25, v27, v29, v31);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;

    v42 = 0;
  }
  else
  {
    -[_UITextDragCaretView _rangeColor](self, "_rangeColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v43);

    mask = self->_mask;
    -[_UITextDragCaretView _rectsForRange:](self, "_rectsForRange:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextDragCaretView _maskForRects:](self, "_maskForRects:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextDragCaretView _configureMask:withPath:](self, "_configureMask:withPath:", mask, v46);
    v35 = v47;
    v37 = v48;
    v39 = v49;
    v41 = v50;

    v42 = self->_mask;
  }
  v51 = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_msgSend(v51, "isFirstResponder") & 1) != 0)
  {
    v52 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v52, "_caretRect");
    IsEmpty = CGRectIsEmpty(v74);

    if (!IsEmpty)
    {
      v54 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v54, "_caretRect");
      -[UIView setFrame:](self, "setFrame:");

      -[UIView layer](self, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setMask:", 0);

      goto LABEL_17;
    }
  }
  else
  {

  }
  -[UIView setAlpha:](self, "setAlpha:", 0.0, v61);
  CGAffineTransformMakeScale(&v73, 2.0, 2.0);
  v72 = v73;
  -[UIView setTransform:](self, "setTransform:", &v72);
  -[UIView setFrame:](self, "setFrame:", v35, v37, v39, v41);
LABEL_17:
  v56 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke;
  aBlock[3] = &unk_1E16E5000;
  aBlock[4] = self;
  v68 = v35;
  v69 = v37;
  v70 = v39;
  v71 = v41;
  v57 = v42;
  v66 = v57;
  v58 = v61;
  v67 = v58;
  v59 = _Block_copy(aBlock);
  v60 = v59;
  if (!v12)
    v12 = (void (**)(_QWORD))&__block_literal_global_545;
  if (v62)
  {
    v63[0] = v56;
    v63[1] = 3221225472;
    v63[2] = __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke_3;
    v63[3] = &unk_1E16C0E38;
    v64 = v12;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v60, v63, 400.0, 35.0);

  }
  else
  {
    (*((void (**)(void *))v59 + 2))(v59);
    v12[2](v12);
  }

}

- (void)updateToPosition:(id)a3
{
  -[_UITextDragCaretView _updateToRangeOrPosition:animations:completion:animated:](self, "_updateToRangeOrPosition:animations:completion:animated:", a3, 0, 0, 1);
}

- (void)updateToPosition:(id)a3 animations:(id)a4 completion:(id)a5
{
  -[_UITextDragCaretView _updateToRangeOrPosition:animations:completion:animated:](self, "_updateToRangeOrPosition:animations:completion:animated:", a3, a4, a5, 1);
}

- (void)updateToRange:(id)a3
{
  -[_UITextDragCaretView _updateToRangeOrPosition:animations:completion:animated:](self, "_updateToRangeOrPosition:animations:completion:animated:", a3, 0, 0, 1);
}

- (void)updateToRange:(id)a3 animations:(id)a4 completion:(id)a5
{
  -[_UITextDragCaretView _updateToRangeOrPosition:animations:completion:animated:](self, "_updateToRangeOrPosition:animations:completion:animated:", a3, a4, a5, 1);
}

- (void)_updateToRangeOrPosition:(id)a3 animations:(id)a4 completion:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  UITextInput **p_view;
  id v24;
  _UITextDragCaretView *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id WeakRetained;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _UITextDragCaretView *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  id v67;
  _BOOL4 v68;
  id v69;
  CGRect v70;
  CGRect v71;

  v68 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
    v12 = v10;
  else
    v12 = &__block_literal_global_16_4;
  if (v11)
    v13 = v11;
  else
    v13 = &__block_literal_global_17_4;
  v69 = v9;
  v14 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v14 & 1) != 0)
      goto LABEL_12;
LABEL_13:
    v16 = objc_retainAutorelease(v69);
    goto LABEL_14;
  }
  v15 = objc_msgSend(v69, "isEmpty");
  if ((v14 & 1) == 0)
    goto LABEL_13;
  if (!v15)
  {
LABEL_12:
    v17 = objc_retainAutorelease(v69);
    v18 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v69, "start");
  v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v18 = v16;
  v17 = 0;
LABEL_15:

  v19 = v17;
  v20 = v18;
  if (v20)
  {
    v67 = v17;
    v21 = v18;
    v22 = objc_opt_new();
    p_view = &self->_view;
    v24 = objc_loadWeakRetained((id *)&self->_view);
    v25 = self;
    v26 = v19;
    v27 = v13;
    v28 = v12;
    v29 = v24;
    objc_msgSend(v24, "caretRectForPosition:", v20);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "textInputView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "convertRect:fromView:", v39, v31, v33, v35, v37);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    v12 = v28;
    v13 = v27;
    v19 = v26;
    self = v25;
    v48 = (void *)v22;
    v18 = v21;
    v17 = v67;
  }
  else
  {
    -[_UITextDragCaretView _rectsForRange:](self, "_rectsForRange:", v19);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextDragCaretView _maskForRects:](self, "_maskForRects:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "bounds");
    v41 = v50;
    v43 = v51;
    v45 = v52;
    v47 = v53;
  }
  -[UIView frame](self, "frame");
  v71.origin.x = v41;
  v71.origin.y = v43;
  v71.size.width = v45;
  v71.size.height = v47;
  if (!CGRectEqualToRect(v70, v71))
  {
    v54 = objc_opt_new();
    objc_storeStrong((id *)(v54 + 8), v18);
    objc_storeStrong((id *)(v54 + 16), v17);
    objc_storeStrong((id *)(v54 + 24), v48);
    v55 = _Block_copy(v12);
    v56 = *(void **)(v54 + 32);
    *(_QWORD *)(v54 + 32) = v55;

    v57 = _Block_copy(v13);
    v58 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v57;

    *(_BYTE *)(v54 + 48) = v68;
    if (!v20)
      goto LABEL_23;
    if (!v68)
      goto LABEL_23;
    v59 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v59, "tokenizer");
    v60 = v48;
    v61 = self;
    v62 = v19;
    v63 = v13;
    v64 = v12;
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isPosition:atBoundary:inDirection:", v20, 4, 1);

    v12 = v64;
    v13 = v63;
    v19 = v62;
    self = v61;
    v48 = v60;

    if (v66)
      -[_UITextDragCaretView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performUpdate_, v54, 0.5);
    else
LABEL_23:
      -[_UITextDragCaretView _performUpdate:](self, "_performUpdate:", v54);

  }
}

- (void)_performUpdate:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD aBlock[5];
  id v19;
  id v20;
  id v21;
  char v22;

  v4 = (unsigned __int8 *)a3;
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
  v5 = *((id *)v4 + 1);
  v6 = *((id *)v4 + 3);
  v7 = _Block_copy(*((const void **)v4 + 4));
  v8 = (void (**)(_QWORD))_Block_copy(*((const void **)v4 + 5));
  v9 = MEMORY[0x1E0C809B0];
  v10 = v4[48];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UITextDragCaretView__performUpdate___block_invoke;
  aBlock[3] = &unk_1E16BAD90;
  aBlock[4] = self;
  v11 = v5;
  v19 = v11;
  v12 = v6;
  v20 = v12;
  v22 = v10;
  v13 = v7;
  v21 = v13;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (v10)
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __39___UITextDragCaretView__performUpdate___block_invoke_2;
    v16[3] = &unk_1E16C0E38;
    v17 = v8;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v15, v16, 400.0, 35.0);

  }
  else
  {
    (*((void (**)(void *))v14 + 2))(v14);
    v8[2](v8);
  }

}

- (void)remove
{
  -[_UITextDragCaretView removeWithAnimations:completion:animated:](self, "removeWithAnimations:completion:animated:", 0, 0, 1);
}

- (void)removeWithAnimations:(id)a3 completion:(id)a4
{
  -[_UITextDragCaretView removeWithAnimations:completion:animated:](self, "removeWithAnimations:completion:animated:", a3, a4, 1);
}

- (void)removeWithAnimations:(id)a3 completion:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t *v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  void (**v17)(void *, uint64_t, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  _UITextDragCaretView *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[_UITextDragCaretView _isRemoveAnimatesBackToCaret](self, "_isRemoveAnimatesBackToCaret");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v25 = MEMORY[0x1E0C809B0];
    v12 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke;
    v13 = &v25;
  }
  else
  {
    v24 = MEMORY[0x1E0C809B0];
    v12 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_2;
    v13 = &v24;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_1E16B1D18;
  v13[4] = (uint64_t)self;
  v14 = v8;
  v13[5] = (uint64_t)v14;
  v15 = (void (**)(_QWORD))_Block_copy(v13);

  v18 = v11;
  v19 = 3221225472;
  v20 = __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_3;
  v21 = &unk_1E16E0030;
  v22 = self;
  v16 = v9;
  v23 = v16;
  v17 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v18);
  if (v5)
  {
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v15, v17, 400.0, 35.0, v18, v19, v20, v21, v22);
  }
  else
  {
    v15[2](v15);
    v17[2](v17, 1, 0);
  }

}

- (BOOL)_isRemoveAnimatesBackToCaret
{
  UITextInput **p_view;
  id WeakRetained;
  id v4;
  _BOOL4 v5;
  CGRect v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (objc_msgSend(WeakRetained, "isFirstResponder"))
  {
    v4 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v4, "_caretRect");
    v5 = !CGRectIsEmpty(v7);

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_caretColor
{
  UITextInput **p_view;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (v5 = objc_loadWeakRetained((id *)p_view),
        objc_msgSend(v5, "insertionPointColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_rangeColor
{
  UITextInput **p_view;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (v5 = objc_loadWeakRetained((id *)p_view),
        objc_msgSend(v5, "selectionHighlightColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_rectsForRange:(id)a3
{
  UITextInput **p_view;
  id v4;
  id WeakRetained;
  void *v6;

  p_view = &self->_view;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_maskForRects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  UITextInput **p_view;
  void *WeakRetained;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "rect");
        if (!CGRectIsEmpty(v55))
        {
          objc_msgSend(v11, "rect");
          +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendPath:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }

  if (-[_UITextDragCaretView rangesExcludeSelection](self, "rangesExcludeSelection"))
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "selectedTextRange");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v17, "selectedTextRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "_isCaret") & 1) != 0)
      {

      }
      else
      {
        v20 = objc_loadWeakRetained((id *)p_view);
        objc_msgSend(v20, "selectedTextRange");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v21, "isEmpty");

        if ((v43 & 1) != 0)
          goto LABEL_15;
        WeakRetained = (void *)objc_opt_new();
        v22 = objc_loadWeakRetained((id *)p_view);
        objc_msgSend(v22, "selectedTextRange");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "selectionRectsForRange:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v6 = v24;
        v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v45 != v27)
                objc_enumerationMutation(v6);
              v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v29, "rect");
              if (!CGRectIsEmpty(v56))
              {
                objc_msgSend(v29, "rect");
                +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "appendPath:", v30);

              }
            }
            v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v26);
        }

        objc_msgSend(v5, "bounds");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        objc_msgSend(WeakRetained, "bounds");
        v58.origin.x = v39;
        v58.origin.y = v40;
        v58.size.width = v41;
        v58.size.height = v42;
        v57.origin.x = v32;
        v57.origin.y = v34;
        v57.size.width = v36;
        v57.size.height = v38;
        if (CGRectIntersectsRect(v57, v58))
        {
          objc_msgSend(v5, "setUsesEvenOddFillRule:", 1);
          objc_msgSend(v5, "appendPath:", WeakRetained);
        }
      }
    }

  }
LABEL_15:

  return v5;
}

- (CGRect)_configureMask:(id)a3 withPath:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
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
  CGAffineTransform v28;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  CGAffineTransformMakeTranslation(&v28, -v7, -v9);
  objc_msgSend(v5, "applyTransform:", &v28);
  v15 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setPath:", objc_msgSend(v15, "CGPath"));
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v6, "setFrame:", v17, v19, v21, v23);
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v27 = v14;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)rangesExcludeSelection
{
  return self->_rangesExcludeSelection;
}

- (void)setRangesExcludeSelection:(BOOL)a3
{
  self->_rangesExcludeSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
