@implementation _UITextChoiceInteraction

- (_UITextChoiceInteraction)initWithDelegate:(id)a3
{
  id v4;
  _UITextChoiceInteraction *v5;
  _UITextChoiceInteraction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextChoiceInteraction;
  v5 = -[_UITextChoiceInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UITextChoiceInteraction textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UITextChoiceInteraction textView](self, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v5);

  }
}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UITextChoiceInteraction createGestureRecognizer](self, "createGestureRecognizer");
  -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v4);

  -[_UITextChoiceInteraction setTextView:](self, "setTextView:", v5);
}

- (void)createGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_tapInteraction_);
    -[_UITextChoiceInteraction setUnderlineTap:](self, "setUnderlineTap:", v4);

    -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfTapsRequired:", 1);

    -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfTouchesRequired:", 1);

    -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

  }
  -[_UITextChoiceInteraction underlineTap](self, "underlineTap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

}

- (void)tapInteraction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 3)
  {
    -[_UITextChoiceInteraction delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceInteraction textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v5);
    objc_msgSend(v4, "textChoiceInteraction:receivedTapAtLocation:", self);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[_UITextChoiceInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceInteraction textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  LOBYTE(self) = objc_msgSend(v5, "textChoiceInteraction:shouldRespondToTapAtPoint:", self, v8, v10);
  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (_UITextChoiceInteractionDelegate)delegate
{
  return (_UITextChoiceInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)textView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (UITapGestureRecognizer)underlineTap
{
  return self->_underlineTap;
}

- (void)setUnderlineTap:(id)a3
{
  objc_storeStrong((id *)&self->_underlineTap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineTap, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
