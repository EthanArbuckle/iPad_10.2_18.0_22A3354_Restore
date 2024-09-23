@implementation _UITextCursorDragAnimator

- (id)_initWithTextCursorView:(id)a3 textInput:(id)a4
{
  id v6;
  id v7;
  _UITextCursorDragAnimator *v8;
  UITextCursorDropPositionAnimator *v9;
  UITextCursorDropPositionAnimator *impl;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITextCursorDragAnimator;
  v8 = -[_UITextCursorDragAnimator init](&v12, sel_init);
  if (v8)
  {
    v9 = -[UITextCursorDropPositionAnimator initWithTextCursorView:textInput:]([UITextCursorDropPositionAnimator alloc], "initWithTextCursorView:textInput:", v6, v7);
    impl = v8->_impl;
    v8->_impl = v9;

  }
  return v8;
}

- (UITextCursorView)_cursorView
{
  return -[UITextCursorDropPositionAnimator cursorView](self->_impl, "cursorView");
}

- (UITextInput)_textInput
{
  return -[UITextCursorDropPositionAnimator textInput](self->_impl, "textInput");
}

- (void)_setCursorVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[UITextCursorDropPositionAnimator setCursorVisible:animated:](self->_impl, "setCursorVisible:animated:", a3, a4);
}

- (void)_updateCursorForPosition:(id)a3 animated:(BOOL)a4
{
  -[UITextCursorDropPositionAnimator placeCursorAtPosition:animated:](self->_impl, "placeCursorAtPosition:animated:", a3, a4);
}

- (void)_animateAlongsideChanges:(id)a3 completion:(id)a4
{
  -[UITextCursorDropPositionAnimator animateAlongsideChanges:completion:](self->_impl, "animateAlongsideChanges:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
