@implementation _UIKBProductivitySingleTapGesture

+ (id)productivitySingleTapGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7;
  id v8;
  _UIKBProductivitySingleTapGesture *v9;
  void *v10;
  double v11;
  _UIKBProductivitySingleTapGesture *v12;

  v7 = a5;
  v8 = a3;
  v9 = -[UITapGestureRecognizer initWithTarget:action:]([_UIKBProductivitySingleTapGesture alloc], "initWithTarget:action:", v8, a4);

  if (v9)
  {
    -[UIGestureRecognizer setAllowedTouchTypes:](v9, "setAllowedTouchTypes:", &unk_1E1A93650);
    -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.kbProductivity.threeFingerSingleTap"));
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v7);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v9, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v9, "setNumberOfTouchesRequired:", 3);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v9, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v9, "setDelaysTouchesEnded:", 0);
    if (_isSystemGestureForDelegate(v7))
      -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setAllowableMovement:](v9, "setAllowableMovement:", 60.0);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allowableSeparation");
    -[UITapGestureRecognizer _setAllowableSeparation:](v9, "_setAllowableSeparation:", v11 + v11);

    -[UITapGestureRecognizer _setAllowableTouchTimeSeparation:](v9, "_setAllowableTouchTimeSeparation:", 0.06);
    v12 = v9;
  }

  return v9;
}

@end
