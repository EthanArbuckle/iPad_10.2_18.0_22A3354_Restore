@implementation UITextIndirectEditableInteraction

- (UITextIndirectEditableInteraction)initWithView:(id)a3
{
  UITextIndirectEditableInteraction *v4;
  UITextIndirectEditableInteraction *v5;
  uint64_t v6;
  _UIKeyboardTextSelectionGestureController *textSelectionGestureController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextIndirectEditableInteraction;
  v4 = -[UITextInteraction init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    +[_UIKeyboardBasedTextSelectionGestureController sharedInstance](_UIKeyboardBasedTextSelectionGestureController, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    textSelectionGestureController = v5->_textSelectionGestureController;
    v5->_textSelectionGestureController = (_UIKeyboardTextSelectionGestureController *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionGestureController, 0);
}

@end
