@implementation _UIKBProductivityLongPressGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

+ (id)productivityLongPressGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7;
  id v8;
  _UIKBProductivityLongPressGestureRecognizer *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[UILongPressGestureRecognizer initWithTarget:action:]([_UIKBProductivityLongPressGestureRecognizer alloc], "initWithTarget:action:", v8, a4);

  -[UIGestureRecognizer setAllowedTouchTypes:](v9, "setAllowedTouchTypes:", &unk_1E1A93638);
  -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.kbProductivity.threeFingerLongPress"));
  -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v7);
  -[UILongPressGestureRecognizer setNumberOfTapsRequired:](v9, "setNumberOfTapsRequired:", 0);
  -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v9, "setNumberOfTouchesRequired:", 3);
  -[UIGestureRecognizer setDelaysTouchesBegan:](v9, "setDelaysTouchesBegan:", 0);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v9, "setDelaysTouchesEnded:", 0);
  LODWORD(v8) = _isSystemGestureForDelegate(v7);

  if ((_DWORD)v8)
    -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
  -[UILongPressGestureRecognizer setAllowableMovement:](v9, "setAllowableMovement:", 60.0);
  -[UILongPressGestureRecognizer _setAllowableElapsedTimeForAllRequiredTouches:](v9, "_setAllowableElapsedTimeForAllRequiredTouches:", 0.06);
  -[UILongPressGestureRecognizer set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:](v9, "set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:", 1);
  return v9;
}

@end
