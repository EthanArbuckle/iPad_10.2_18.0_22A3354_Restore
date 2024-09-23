@implementation _UIPressGestureRecognizer

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPressGestureRecognizer;
  v4 = a3;
  -[UIGestureRecognizer setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | v5 & 1;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == 3 || objc_msgSend(v3, "type") == 4;

  return v4;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v8, sel__shouldReceivePress_, v4))
  {
    v5 = 1;
  }
  else if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "pressGestureRecognizer:shouldAllowPress:", self, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  -[UIGestureRecognizer pressesBegan:withEvent:](&v5, sel_pressesBegan_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  -[UIGestureRecognizer pressesEnded:withEvent:](&v5, sel_pressesEnded_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  -[UIGestureRecognizer pressesCancelled:withEvent:](&v5, sel_pressesCancelled_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

@end
