@implementation _UISelectionInteraction

- (void)setDelegate:(id)a3
{
  _UISelectionInteractionDelegate **p_delegate;
  id v5;
  char v6;
  char v7;
  char v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v8;
}

- (_UISelectionInteraction)init
{
  _UISelectionInteraction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISelectionInteraction;
  result = -[_UISelectionInteraction init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)willMoveToView:(id)a3
{
  id v4;

  -[_UISelectionInteraction view](self, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (self->_selectHighlightRecognizer)
      objc_msgSend(v4, "removeGestureRecognizer:");
    if (self->_selectGestureRecognizer)
      objc_msgSend(v4, "removeGestureRecognizer:");
  }
  -[_UISelectionInteraction setView:](self, "setView:", 0);

}

- (void)didMoveToView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[_UISelectionInteraction selectGestureRecognizer](self, "selectGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v4);

    -[_UISelectionInteraction selectHighlightRecognizer](self, "selectHighlightRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

  }
  -[_UISelectionInteraction setView:](self, "setView:", v6);

}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (_UIFocusSelectObserverGestureRecognizer)selectHighlightRecognizer
{
  _UIFocusSelectObserverGestureRecognizer *selectHighlightRecognizer;
  _UIFocusSelectObserverGestureRecognizer *v4;
  _UIFocusSelectObserverGestureRecognizer *v5;

  selectHighlightRecognizer = self->_selectHighlightRecognizer;
  if (!selectHighlightRecognizer)
  {
    v4 = -[_UIFocusSelectObserverGestureRecognizer initWithTarget:action:]([_UIFocusSelectObserverGestureRecognizer alloc], "initWithTarget:action:", self, sel_highlightGestureHandler_);
    -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", self);
    v5 = self->_selectHighlightRecognizer;
    self->_selectHighlightRecognizer = v4;

    selectHighlightRecognizer = self->_selectHighlightRecognizer;
  }
  return selectHighlightRecognizer;
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  UITapGestureRecognizer *selectGestureRecognizer;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;

  selectGestureRecognizer = self->_selectGestureRecognizer;
  if (!selectGestureRecognizer)
  {
    v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_selectGestureHandler_);
    -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &unk_1E1A93578);
    -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setEnabled:](v4, "setEnabled:", -[_UISelectionInteraction isEnabled](self, "isEnabled"));
    -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", self);
    v5 = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v4;

    selectGestureRecognizer = self->_selectGestureRecognizer;
  }
  return selectGestureRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[UIGestureRecognizer setEnabled:](self->_selectGestureRecognizer, "setEnabled:");
    -[UIGestureRecognizer setEnabled:](self->_selectHighlightRecognizer, "setEnabled:", v3);
  }
}

- (void)setSimulatePressesCallbacksForLegacyBehavior:(BOOL)a3
{
  self->_simulatePressesCallbacksForLegacyBehavior = a3;
}

- (BOOL)isHinting
{
  UIGestureRecognizerState v3;

  v3 = -[UIGestureRecognizer state](self->_selectHighlightRecognizer, "state");
  if (v3 != UIGestureRecognizerStateBegan)
    LOBYTE(v3) = -[UIGestureRecognizer state](self->_selectHighlightRecognizer, "state") == UIGestureRecognizerStateChanged;
  return v3;
}

- (void)selectGestureHandler:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UISelectionInteraction selectGestureRecognizer](self, "selectGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 == v8)
  {
    v6 = objc_msgSend(v8, "state") == 3;
    v5 = v8;
    if (v6)
    {
      -[_UISelectionInteraction delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_selectionInteractionDidSelect:", self);

      v5 = v8;
    }
  }

}

- (void)highlightGestureHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;

  v11 = a3;
  -[_UISelectionInteraction selectHighlightRecognizer](self, "selectHighlightRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 == v11)
  {
    v6 = objc_msgSend(v11, "state");
    if ((unint64_t)(v6 - 3) >= 2)
    {
      v10 = v6 == 1;
      v5 = v11;
      if (!v10 || (*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_2;
      -[_UISelectionInteraction delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_selectionInteractionDidBeginHinting:", self);
    }
    else
    {
      v5 = v11;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_2;
      -[_UISelectionInteraction selectGestureRecognizer](self, "selectGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "state");

      v5 = v11;
      if (v8 == 3)
        goto LABEL_2;
      -[_UISelectionInteraction delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_selectionInteractionDidCancelHinting:", self);
    }

    v5 = v11;
  }
LABEL_2:

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *selectGestureRecognizer;
  BOOL v5;
  _UIFocusSelectObserverGestureRecognizer *selectHighlightRecognizer;
  _UIFocusSelectObserverGestureRecognizer *v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  BOOL v12;
  char v13;

  selectGestureRecognizer = self->_selectGestureRecognizer;
  if (selectGestureRecognizer && (unint64_t)(selectGestureRecognizer->super._state - 1) < 3)
  {
    v5 = 1;
  }
  else
  {
    selectHighlightRecognizer = self->_selectHighlightRecognizer;
    if (selectHighlightRecognizer)
      v5 = (unint64_t)(selectHighlightRecognizer->super._state - 1) < 3;
    else
      v5 = 0;
  }
  v7 = selectGestureRecognizer;
  if (-[UIGestureRecognizer state](v7, "state") == UIGestureRecognizerStateCancelled)
    goto LABEL_7;
  v9 = -[UIGestureRecognizer state](v7, "state");

  if (v9 == 5)
    return 0;
  v7 = self->_selectHighlightRecognizer;
  if (-[UIGestureRecognizer state](v7, "state") == UIGestureRecognizerStateCancelled)
  {
LABEL_7:
    v8 = 0;
LABEL_8:

    return v8;
  }
  v11 = -[UIGestureRecognizer state](v7, "state");

  v12 = v11 == 5;
  v8 = v11 != 5;
  v13 = v12 || v5;
  if ((v13 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      return 1;
    -[_UISelectionInteraction delegate](self, "delegate");
    v7 = (_UIFocusSelectObserverGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIFocusSelectObserverGestureRecognizer _selectionInteractionShouldBegin:](v7, "_selectionInteractionShouldBegin:", self);
    goto LABEL_8;
  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  char v7;
  _UISelectionInteraction *v8;
  id v9;
  int v10;

  v6 = a4;
  if (self->_selectGestureRecognizer != a3)
    goto LABEL_2;
  v8 = self;
  v9 = v6;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || !-[_UISelectionInteraction simulatePressesCallbacksForLegacyBehavior](v8, "simulatePressesCallbacksForLegacyBehavior"))
  {

    v7 = 0;
    goto LABEL_8;
  }
  v10 = objc_msgSend(v9, "cancelsTouchesInView");

  if (v10)
  {
    objc_msgSend(v9, "allowedPressTypes");
    v8 = (_UISelectionInteraction *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UISelectionInteraction containsObject:](v8, "containsObject:", &unk_1E1A97CF8);
LABEL_8:

    goto LABEL_9;
  }
LABEL_2:
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  char v7;
  void *v9;

  v6 = a4;
  if (self->_selectGestureRecognizer == a3
    && ((dyld_program_sdk_at_least() & 1) != 0
     || -[_UISelectionInteraction simulatePressesCallbacksForLegacyBehavior](self, "simulatePressesCallbacksForLegacyBehavior"))&& objc_msgSend(v6, "_isGestureType:", 0))
  {
    objc_msgSend(v6, "allowedPressTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", &unk_1E1A97CF8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UISelectionInteractionDelegate)delegate
{
  return (_UISelectionInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)simulatePressesCallbacksForLegacyBehavior
{
  return self->_simulatePressesCallbacksForLegacyBehavior;
}

@end
