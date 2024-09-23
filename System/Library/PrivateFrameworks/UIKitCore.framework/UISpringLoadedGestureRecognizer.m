@implementation UISpringLoadedGestureRecognizer

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
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
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
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
    v5 = -[UIDragGestureRecognizer canBePreventedByGestureRecognizer:](&v7, sel_canBePreventedByGestureRecognizer_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  -[UIDragGestureRecognizer _dragEvent](self, "_dragEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "locationInView:", v4);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UIGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v11);
    v8 = v12;
    v10 = v13;

  }
  v14 = v8;
  v15 = v10;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 9 && (objc_msgSend(v4, "isFromAccessibilitySession") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
    v5 = -[UIDragGestureRecognizer shouldReceiveEvent:](&v7, sel_shouldReceiveEvent_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

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
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)_draggingEndedWithEvent:(id)a3
{
  if (-[UIGestureRecognizer state](self, "state", a3) <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)spring
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state") < UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") >= UIGestureRecognizerStateEnded)
  {
    v3 = 5;
  }
  else
  {
    v3 = 3;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v3);
}

@end
