@implementation UITextTouchObservingInteraction

- (void)willMoveToView:(id)a3
{
  if (!a3)
    -[UITextTouchObservingInteraction _removeGestureRecognizers](self, "_removeGestureRecognizers");
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  if (a3)
    -[UITextTouchObservingInteraction _addGestureRecognizers](self, "_addGestureRecognizers");
}

- (void)_addGestureRecognizers
{
  void *v3;
  id v4;

  -[UITextTouchObservingInteraction _createGestureRecognizersIfNecessary](self, "_createGestureRecognizersIfNecessary");
  -[UITextTouchObservingInteraction view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextTouchObservingInteraction longPressGesture](self, "longPressGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)_removeGestureRecognizers
{
  void *v3;
  id v4;

  -[UITextTouchObservingInteraction view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextTouchObservingInteraction longPressGesture](self, "longPressGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v3);

}

- (void)_createGestureRecognizersIfNecessary
{
  void *v3;
  void *v4;
  _UITouchObservingLongPress *v5;

  -[UITextTouchObservingInteraction longPressGesture](self, "longPressGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = -[UILongPressGestureRecognizer initWithTarget:action:]([_UITouchObservingLongPress alloc], "initWithTarget:action:", self, sel_longPressObserved_);
    -[UIGestureRecognizer setEnabled:](v5, "setEnabled:", 1);
    -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v5, "setNumberOfTouchesRequired:", 3);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allowableSeparation");
    -[UILongPressGestureRecognizer _setAllowableSeparation:](v5, "_setAllowableSeparation:");

    -[UILongPressGestureRecognizer _setAllowableTouchTimeSeparation:](v5, "_setAllowableTouchTimeSeparation:", 0.06);
    -[UITextTouchObservingInteraction setLongPressGesture:](self, "setLongPressGesture:", v5);

  }
}

- (void)longPressObserved:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = objc_msgSend(a3, "state");
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 != 1)
      return;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 1;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "set_mimicShiftBeingHeld:", v5);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
