@implementation _UIPointerInteractionHoverGestureRecognizer

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

- (CGPoint)locationInView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v4 = a3;
  if (v4
    && (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan
     || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged))
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPointerInteractionHoverGestureRecognizer;
    -[UIHoverGestureRecognizer locationInView:](&v11, sel_locationInView_, v4);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v8 = 0x7FEFFFFFFFFFFFFFLL;
    v6 = 0x7FEFFFFFFFFFFFFFLL;
  }

  v9 = *(double *)&v6;
  v10 = *(double *)&v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end
