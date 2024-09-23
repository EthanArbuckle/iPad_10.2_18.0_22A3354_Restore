@implementation SBNumberPadWithDelegate

- (void)buttonUp:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[SBNumberPadWithDelegate delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "buttonUp:", v6);

  }
}

- (void)buttonDown:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[SBNumberPadWithDelegate delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "buttonDown:", v6);

  }
}

- (void)buttonCancelled:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBNumberPadWithDelegate delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "buttonCancelled:", v5);

}

- (id)buttonForPoint:(CGPoint)a3 forEvent:(id)a4
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBNumberPadWithDelegate;
  -[SBNumberPadWithDelegate hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  SBNumberPadWithDelegate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBNumberPadWithDelegate;
  -[SBNumberPadWithDelegate hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = self;

    v5 = v6;
  }
  return v5;
}

- (BOOL)touchAtPoint:(CGPoint)a3 isCloseToButton:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "frame");
  v9 = CGRectInset(v8, -20.0, -20.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (SBNumberPadDelegate)delegate
{
  return (SBNumberPadDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
