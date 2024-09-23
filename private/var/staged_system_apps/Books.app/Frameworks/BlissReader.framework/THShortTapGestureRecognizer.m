@implementation THShortTapGestureRecognizer

- (void)p_scheduleTimer
{
  -[THShortTapGestureRecognizer p_clearTimer](self, "p_clearTimer");
  self->_timer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_timeout", 0, 0, 0.3);
}

- (void)p_clearTimer
{
  -[NSTimer invalidate](self->_timer, "invalidate");

  self->_timer = 0;
}

- (void)p_timeout
{
  if (!-[THShortTapGestureRecognizer state](self, "state"))
    -[THShortTapGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THShortTapGestureRecognizer;
  -[THShortTapGestureRecognizer touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  if (!-[THShortTapGestureRecognizer state](self, "state"))
    -[THShortTapGestureRecognizer p_scheduleTimer](self, "p_scheduleTimer");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THShortTapGestureRecognizer p_clearTimer](self, "p_clearTimer");
  v7.receiver = self;
  v7.super_class = (Class)THShortTapGestureRecognizer;
  -[THShortTapGestureRecognizer touchesEnded:withEvent:](&v7, "touchesEnded:withEvent:", a3, a4);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THShortTapGestureRecognizer;
  -[THShortTapGestureRecognizer reset](&v3, "reset");
  objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSDGestureDelegate, -[THShortTapGestureRecognizer delegate](self, "delegate")), "didReset:", self);
}

@end
