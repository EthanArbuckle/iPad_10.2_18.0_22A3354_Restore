@implementation _UIEditableTextSelectionForceGesture

- (_UIEditableTextSelectionForceGesture)init
{
  _UIEditableTextSelectionForceGesture *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditableTextSelectionForceGesture;
  v2 = -[UIGestureRecognizer init](&v5, sel_init);
  if (v2)
  {
    +[_UIKeyboardBasedTextSelectionGestureController sharedInstance](_UIKeyboardBasedTextSelectionGestureController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configureOneFingerForcePressRecognizer:", v2);

  }
  return v2;
}

@end
