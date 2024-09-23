@implementation _UITextFloatingCursorSession

- (_UITextFloatingCursorSession)initWithCursorView:(id)a3 selectionManager:(id)a4
{
  id v6;
  id v7;
  _UITextFloatingCursorSession *v8;
  _UITextFloatingCursorSession *v9;
  uint64_t v10;
  UIStandardTextCursorView *floatingCursorView;
  void *v12;
  uint64_t v13;
  UITextCursorAssertion *ghostCursorAssertion;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UITextFloatingCursorSession;
  v8 = -[_UITextFloatingCursorSession init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v7);
    v9->_isValid = 1;
    objc_msgSend(v6, "_createFloatingCursorView");
    v10 = objc_claimAutoreleasedReturnValue();
    floatingCursorView = v9->_floatingCursorView;
    v9->_floatingCursorView = (UIStandardTextCursorView *)v10;

    -[_UITextFloatingCursorSession _selectionContainerView](v9, "_selectionContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v9->_floatingCursorView);

    objc_msgSend(v7, "_obtainGhostCursorAssertion");
    v13 = objc_claimAutoreleasedReturnValue();
    ghostCursorAssertion = v9->_ghostCursorAssertion;
    v9->_ghostCursorAssertion = (UITextCursorAssertion *)v13;

    objc_msgSend(v6, "frame");
    v17 = v16 + v15 * 0.5;
    v20 = v19 + v18 * 0.5;
    objc_msgSend(v6, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](v9, "updateWithPoint:inContainer:animated:", v21, 0, v17, v20);

  }
  return v9;
}

- (void)updateWithPoint:(CGPoint)a3 inContainer:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[7];

  if (self->_isValid)
  {
    v5 = a5;
    y = a3.y;
    x = a3.x;
    v9 = a4;
    -[_UITextFloatingCursorSession _selectionContainerView](self, "_selectionContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v9, x, y);

    -[_UITextFloatingCursorSession floatingCursorPositionForPoint:lineSnapping:](self, "floatingCursorPositionForPoint:lineSnapping:", 1, x, y);
    v13 = v11;
    v14 = v12;
    if (v5)
    {
      -[_UITextFloatingCursorSession _springAnimation](self, "_springAnimation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke;
      v17[3] = &unk_1E16B4E70;
      v17[4] = self;
      v17[5] = v13;
      v17[6] = v14;
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v15, 0, v17, 0);

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke_2;
      v16[3] = &unk_1E16B4E70;
      v16[4] = self;
      v16[5] = v11;
      v16[6] = v12;
      +[UIView _animateByRetargetingAnimations:completion:](UIView, "_animateByRetargetingAnimations:completion:", v16, 0);
    }
    -[_UITextFloatingCursorSession _updateCursorFadedHiddenForFloatingCursorAtPoint:](self, "_updateCursorFadedHiddenForFloatingCursorAtPoint:", x, y);
  }
}

- (void)_invalidateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  self->_isValid = 0;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "cursorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextFloatingCursorSession _springAnimation](self, "_springAnimation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_2;
    v14[3] = &unk_1E16B1B50;
    v14[4] = self;
    v15 = v9;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_3;
    v12[3] = &unk_1E16C0E38;
    v13 = v7;
    v11 = v9;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v10, 0, v14, v12);

  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

}

- (void)_invalidate
{
  -[_UITextFloatingCursorSession _invalidateAnimated:](self, "_invalidateAnimated:", 1);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isValid)
    -[_UITextFloatingCursorSession _invalidateAnimated:](self, "_invalidateAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UITextFloatingCursorSession;
  -[_UITextFloatingCursorSession dealloc](&v3, sel_dealloc);
}

- (id)_springAnimation
{
  return +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.18);
}

- (void)_updateCursorFadedHiddenForFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextSelectionDisplayInteraction **p_manager;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL8 v15;
  id v16;

  y = a3.y;
  x = a3.x;
  p_manager = &self->_manager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "cursorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = v9 + v8 * 0.5;
  v13 = v12 + v11 * 0.5;

  v14 = vabdd_f64(v10, x) < 15.0;
  v15 = vabdd_f64(v13, y) < 30.0 && v14;
  v16 = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(v16, "_setCursorFadedHiddenForFloatingCursor:animated:", v15, 1);

}

- (id)_selectionContainerView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "_hostViewAboveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  UITextSelectionDisplayInteraction **p_manager;
  id WeakRetained;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGPoint result;
  CGRect v56;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  p_manager = &self->_manager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  v12 = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(v12, "textInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v13, "selectionClipRect");
LABEL_5:
    v20 = v15;
    v21 = v16;
    v22 = v17;
    v23 = v18;

    goto LABEL_7;
  }
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_manager);
    objc_msgSend(v12, "textInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_selectionClipRect");
    goto LABEL_5;
  }
  v20 = *MEMORY[0x1E0C9D628];
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_7:
  v24 = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(v24, "textInput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "textInputView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v56.origin.x = v20;
  v56.origin.y = v21;
  v56.size.width = v22;
  v56.size.height = v23;
  if (CGRectIsNull(v56))
  {
    objc_msgSend(v26, "bounds");
    v20 = v27;
    v21 = v28;
    v22 = v29;
    v23 = v30;
  }
  -[_UITextFloatingCursorSession _selectionContainerView](self, "_selectionContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "convertRect:fromView:", v26, v20, v21, v22, v23);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  -[UIView bounds](self->_floatingCursorView, "bounds");
  v41 = v40 * 0.5;
  -[UIView bounds](self->_floatingCursorView, "bounds");
  v43 = v42 * 0.5;
  v44 = v37 - (v41 + v41);
  v45 = v39 - (v43 + v43);
  if (v44 >= 0.0)
  {
    if (x >= v33 + v41)
    {
      v46 = v33 + v41 + v44;
      if (x > v46)
        x = v46;
    }
    else
    {
      x = v33 + v41;
    }
  }
  if (v45 >= 0.0)
  {
    v47 = v35 + v43;
    if (y >= v47)
    {
      v48 = v47 + v45;
      if (y > v48)
        y = v48;
    }
    else
    {
      y = v47;
    }
  }
  if (v4)
  {
    v49 = objc_loadWeakRetained((id *)p_manager);
    objc_msgSend(v49, "_cursorView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "frame");
    y = v52 + v51 * 0.5 + (y - (v52 + v51 * 0.5)) * 0.3;

  }
  v53 = x;
  v54 = y;
  result.y = v54;
  result.x = v53;
  return result;
}

- (UITextSelectionDisplayInteraction)manager
{
  return (UITextSelectionDisplayInteraction *)objc_loadWeakRetained((id *)&self->_manager);
}

- (UIStandardTextCursorView)floatingCursorView
{
  return self->_floatingCursorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingCursorView, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_ghostCursorAssertion, 0);
}

@end
