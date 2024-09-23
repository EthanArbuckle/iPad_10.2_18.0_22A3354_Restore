@implementation UIDropInteractionGestureRecognizer

- (void)_draggingEnteredWithEvent:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)_draggingUpdatedWithEvent:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 2);
}

- (void)_draggingExitedWithEvent:(id)a3
{
  if (-[UIGestureRecognizer state](self, "state", a3) <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (void)_draggingEndedWithEvent:(id)a3
{
  if (-[UIGestureRecognizer state](self, "state", a3) <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDropInteractionGestureRecognizer;
    v5 = -[UIDragGestureRecognizer canPreventGestureRecognizer:](&v7, sel_canPreventGestureRecognizer_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDropInteractionGestureRecognizer;
    v5 = -[UIDragGestureRecognizer canBePreventedByGestureRecognizer:](&v7, sel_canBePreventedByGestureRecognizer_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
