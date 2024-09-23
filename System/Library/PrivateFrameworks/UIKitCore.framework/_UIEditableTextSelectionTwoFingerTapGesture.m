@implementation _UIEditableTextSelectionTwoFingerTapGesture

- (_UIEditableTextSelectionTwoFingerTapGesture)init
{
  _UIEditableTextSelectionTwoFingerTapGesture *v2;
  _UIEditableTextSelectionTwoFingerTapGesture *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIEditableTextSelectionTwoFingerTapGesture;
  v2 = -[UIGestureRecognizer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UITapGestureRecognizer setMaximumIntervalBetweenSuccessiveTaps:](v2, "setMaximumIntervalBetweenSuccessiveTaps:", 0.35);
    -[UITapGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 1.79769313e308);
    +[_UIKeyboardBasedTextSelectionGestureController sharedInstance](_UIKeyboardBasedTextSelectionGestureController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureTwoFingerTapGestureRecognizer:", v3);

  }
  return v3;
}

@end
