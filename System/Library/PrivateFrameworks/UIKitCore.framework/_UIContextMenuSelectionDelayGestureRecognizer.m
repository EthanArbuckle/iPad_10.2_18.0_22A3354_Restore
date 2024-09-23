@implementation _UIContextMenuSelectionDelayGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  UIDelayedAction *v5;
  UIDelayedAction *delayedAction;

  v5 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__timerSatisfied, 0, 0.15);
  delayedAction = self->_delayedAction;
  self->_delayedAction = v5;

}

- (void)reset
{
  UIDelayedAction *delayedAction;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuSelectionDelayGestureRecognizer;
  -[UIGestureRecognizer reset](&v4, sel_reset);
  -[UIDelayedAction cancel](self->_delayedAction, "cancel");
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

}

- (void)_timerSatisfied
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedAction, 0);
}

@end
