@implementation NavIdleTimeoutGestureRecognizer

- (NavIdleTimeoutGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  NavIdleTimeoutGestureRecognizer *v4;
  NavIdleTimeoutGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavIdleTimeoutGestureRecognizer;
  v4 = -[NavIdleTimeoutGestureRecognizer initWithTarget:action:](&v7, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NavIdleTimeoutGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[NavIdleTimeoutGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 0);
    -[NavIdleTimeoutGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
  }
  return v5;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);
  -[NavIdleTimeoutGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);
  -[NavIdleTimeoutGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_storeStrong((id *)&self->_event, a4);
  -[NavIdleTimeoutGestureRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  UIEvent *event;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavIdleTimeoutGestureRecognizer;
  -[NavIdleTimeoutGestureRecognizer reset](&v4, "reset");
  event = self->_event;
  self->_event = 0;

}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (UIEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
