@implementation WebThreadSafeUndoManager

- (void)undo
{
  objc_super v3;

  if (WebThreadIsEnabled() && WebThreadNotCurrent())
    WebThreadLock();
  v3.receiver = self;
  v3.super_class = (Class)WebThreadSafeUndoManager;
  -[WebThreadSafeUndoManager undo](&v3, sel_undo);
  -[UIKeyboardImpl textChanged:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "textChanged:", self);
}

- (void)redo
{
  objc_super v3;

  if (WebThreadIsEnabled() && WebThreadNotCurrent())
    WebThreadLock();
  v3.receiver = self;
  v3.super_class = (Class)WebThreadSafeUndoManager;
  -[WebThreadSafeUndoManager redo](&v3, sel_redo);
  -[UIKeyboardImpl textChanged:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "textChanged:", self);
}

- (BOOL)_alwaysShowEditAlertView
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"), "_firstResponder"), "_keyboardResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "hasEditableSelection");
  else
    return 0;
}

@end
