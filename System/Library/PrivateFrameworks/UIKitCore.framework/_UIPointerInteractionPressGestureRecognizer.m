@implementation _UIPointerInteractionPressGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && -[UIGestureRecognizer state](self, "state") < UIGestureRecognizerStateEnded;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_affectedByGesture:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPointerInteractionPressGestureRecognizer;
  if (-[UIGestureRecognizer _affectedByGesture:](&v7, sel__affectedByGesture_, v4))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  return objc_msgSend(a3, "_isPointerTouch");
}

@end
