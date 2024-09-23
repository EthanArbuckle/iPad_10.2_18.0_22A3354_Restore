@implementation THTimeoutLongPressGestureRecognizer

- (void)dealloc
{
  objc_super v3;

  if (self->_cancelTimer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutLongPressGestureRecognizer dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutLongPressGestureRecognizer.m"), 32, CFSTR("expected nil value for '%s'"), "_cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  -[THTimeoutLongPressGestureRecognizer dealloc](&v3, "dealloc");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  -[THTimeoutLongPressGestureRecognizer touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  if (!-[THTimeoutLongPressGestureRecognizer state](self, "state"))
    -[THTimeoutLongPressGestureRecognizer p_startCancelTimer](self, "p_startCancelTimer");
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  -[THTimeoutLongPressGestureRecognizer setState:](&v5, "setState:");
  if ((unint64_t)(a3 - 3) <= 2)
    -[THTimeoutLongPressGestureRecognizer p_teardownTimer](self, "p_teardownTimer");
}

- (void)cancel
{
  objc_super v3;

  if (-[THTimeoutLongPressGestureRecognizer cancelTimer](self, "cancelTimer"))
  {
    v3.receiver = self;
    v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
    -[THTimeoutLongPressGestureRecognizer cancel](&v3, "cancel");
    -[THTimeoutLongPressGestureRecognizer p_teardownTimer](self, "p_teardownTimer");
  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTimeoutLongPressGestureRecognizer;
  -[THTimeoutLongPressGestureRecognizer reset](&v3, "reset");
  -[THTimeoutLongPressGestureRecognizer p_teardownTimer](self, "p_teardownTimer");
}

- (void)p_startCancelTimer
{
  -[NSTimer invalidate](-[THTimeoutLongPressGestureRecognizer cancelTimer](self, "cancelTimer"), "invalidate");
  -[THTimeoutLongPressGestureRecognizer maximumPressDuration](self, "maximumPressDuration");
  -[THTimeoutLongPressGestureRecognizer setCancelTimer:](self, "setCancelTimer:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_cancelTimerFired", 0, 0));
}

- (void)p_teardownTimer
{
  -[NSTimer invalidate](-[THTimeoutLongPressGestureRecognizer cancelTimer](self, "cancelTimer"), "invalidate");
  -[THTimeoutLongPressGestureRecognizer setCancelTimer:](self, "setCancelTimer:", 0);
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (NSTimer)cancelTimer
{
  return self->_cancelTimer;
}

- (void)setCancelTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
