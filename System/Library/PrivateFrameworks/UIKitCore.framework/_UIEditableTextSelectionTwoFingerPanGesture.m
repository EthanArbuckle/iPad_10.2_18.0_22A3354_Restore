@implementation _UIEditableTextSelectionTwoFingerPanGesture

- (_UIEditableTextSelectionTwoFingerPanGesture)init
{
  _UIEditableTextSelectionTwoFingerPanGesture *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditableTextSelectionTwoFingerPanGesture;
  v2 = -[UIGestureRecognizer init](&v5, sel_init);
  if (v2)
  {
    +[_UIKeyboardBasedTextSelectionGestureController sharedInstance](_UIKeyboardBasedTextSelectionGestureController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configureTwoFingerPanGestureRecognizer:", v2);

  }
  return v2;
}

@end
