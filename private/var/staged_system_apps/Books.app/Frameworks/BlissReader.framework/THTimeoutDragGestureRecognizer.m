@implementation THTimeoutDragGestureRecognizer

- (void)dealloc
{
  objc_super v3;

  if (self->_cancelTimer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutDragGestureRecognizer dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutDragGestureRecognizer.m"), 51, CFSTR("expected nil value for '%s'"), "_cancelTimer");
  if (self->_recognizeTimer)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTimeoutDragGestureRecognizer dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTimeoutDragGestureRecognizer.m"), 52, CFSTR("expected nil value for '%s'"), "_recognizeTimer");

  v3.receiver = self;
  v3.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer dealloc](&v3, "dealloc");
}

- (BOOL)hasMovedDistance:(CGPoint)a3
{
  return fabs(self->_touchMovement.x) >= a3.x || fabs(self->_touchMovement.y) >= a3.y;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer touchesBegan:withEvent:](&v14, "touchesBegan:withEvent:");
  if (objc_msgSend(objc_msgSend(a4, "allTouches"), "count") == (char *)&dword_0 + 1)
  {
    v7 = objc_msgSend(a3, "anyObject");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_touchStartTime = v8;
    objc_msgSend(v7, "locationInView:", -[THTimeoutDragGestureRecognizer view](self, "view"));
    self->_touchStartPoint.x = v9;
    self->_touchStartPoint.y = v10;
    self->_touchMovement = CGPointZero;
    v11 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THTimeoutDragGestureRecognizerDelegate, -[THTimeoutDragGestureRecognizer delegate](self, "delegate"));
    if (v11)
    {
      objc_msgSend(v11, "dragGestureRecognizer:requiredMovementForTouch:", self, v7);
      self->_requiredMovement.x = v12;
      self->_requiredMovement.y = v13;
    }
    -[THTimeoutDragGestureRecognizer p_startRecognizeTimer](self, "p_startRecognizeTimer");
    -[THTimeoutDragGestureRecognizer maximumPressDuration](self, "maximumPressDuration");
    -[THTimeoutDragGestureRecognizer p_startCancelTimerWithTimeout:](self, "p_startCancelTimerWithTimeout:");
  }
  else
  {
    -[THTimeoutDragGestureRecognizer setState:](self, "setState:", 4);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  __n128 v5;
  __n128 v6;
  CGFloat v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", -[THTimeoutDragGestureRecognizer view](self, "view"));
  self->_touchMovement.x = TSDSubtractPoints(v5, v6, self->_touchStartPoint.x, self->_touchStartPoint.y);
  self->_touchMovement.y = v7;
  if (-[THTimeoutDragGestureRecognizer state](self, "state"))
  {
    if (-[THTimeoutDragGestureRecognizer state](self, "state") != (char *)&dword_0 + 1)
      return;
    v8 = 2;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v10 = v9 - self->_touchStartTime;
    v11 = -[THTimeoutDragGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
    if (v10 <= v12)
    {
      v13 = TSDPointLength(v11, self->_touchMovement.x, self->_touchMovement.y);
      -[THTimeoutDragGestureRecognizer allowableMovement](self, "allowableMovement");
      if (v13 <= v14)
        return;
      v8 = 4;
    }
    else
    {
      if (!-[THTimeoutDragGestureRecognizer hasMovedDistance:](self, "hasMovedDistance:", self->_requiredMovement.x, self->_requiredMovement.y))return;
      v8 = 1;
    }
  }
  -[THTimeoutDragGestureRecognizer setState:](self, "setState:", v8);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THTimeoutDragGestureRecognizer setState:](self, "setState:", 4);
  v7.receiver = self;
  v7.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer touchesCancelled:withEvent:](&v7, "touchesCancelled:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  objc_super v8;

  if (-[THTimeoutDragGestureRecognizer state](self, "state") == (char *)&dword_0 + 1)
  {
    v7 = 3;
  }
  else if (-[THTimeoutDragGestureRecognizer state](self, "state") == (char *)&dword_0 + 2)
  {
    v7 = 3;
  }
  else
  {
    v7 = 5;
  }
  -[THTimeoutDragGestureRecognizer setState:](self, "setState:", v7);
  v8.receiver = self;
  v8.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer touchesEnded:withEvent:](&v8, "touchesEnded:withEvent:", a3, a4);
}

- (CGPoint)locationInView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  v13.receiver = self;
  v13.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer locationInView:](&v13, "locationInView:");
  v6 = v5;
  v8 = v7;
  if (-[THTimeoutDragGestureRecognizer state](self, "state") == (char *)&dword_0 + 1)
  {
    objc_msgSend(-[THTimeoutDragGestureRecognizer view](self, "view"), "convertPoint:toView:", a3, self->_touchStartPoint.x, self->_touchStartPoint.y);
    v6 = v9;
    v8 = v10;
  }
  v11 = v6;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer setState:](&v5, "setState:");
  if ((unint64_t)(a3 - 3) <= 2)
  {
    -[THTimeoutDragGestureRecognizer p_teardownTimers](self, "p_teardownTimers");
    -[UIGestureRecognizer cancel](self->_dependentGestureRecognizer, "cancel");
  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTimeoutDragGestureRecognizer;
  -[THTimeoutDragGestureRecognizer reset](&v3, "reset");
  -[THTimeoutDragGestureRecognizer p_teardownTimers](self, "p_teardownTimers");
  -[UIGestureRecognizer cancel](self->_dependentGestureRecognizer, "cancel");
}

- (void)p_startRecognizeTimer
{
  -[NSTimer invalidate](-[THTimeoutDragGestureRecognizer recognizeTimer](self, "recognizeTimer"), "invalidate");
  -[THTimeoutDragGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  -[THTimeoutDragGestureRecognizer setRecognizeTimer:](self, "setRecognizeTimer:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_recognizeTimerFired", 0, 0));
}

- (void)p_startCancelTimerWithTimeout:(double)a3
{
  -[NSTimer invalidate](-[THTimeoutDragGestureRecognizer cancelTimer](self, "cancelTimer"), "invalidate");
  -[THTimeoutDragGestureRecognizer setCancelTimer:](self, "setCancelTimer:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_cancelTimerFired", 0, 0, a3));
}

- (void)p_teardownTimers
{
  -[NSTimer invalidate](-[THTimeoutDragGestureRecognizer recognizeTimer](self, "recognizeTimer"), "invalidate");
  -[THTimeoutDragGestureRecognizer setRecognizeTimer:](self, "setRecognizeTimer:", 0);
  -[NSTimer invalidate](-[THTimeoutDragGestureRecognizer cancelTimer](self, "cancelTimer"), "invalidate");
  -[THTimeoutDragGestureRecognizer setCancelTimer:](self, "setCancelTimer:", 0);
}

- (void)p_recognizeTimerFired
{
  BOOL v3;

  if (!-[THTimeoutDragGestureRecognizer state](self, "state"))
  {
    if (-[THTimeoutDragGestureRecognizer hasMovedDistance:](self, "hasMovedDistance:", self->_requiredMovement.x, self->_requiredMovement.y)|| (CGPointZero.x == self->_requiredMovement.x ? (v3 = CGPointZero.y == self->_requiredMovement.y) : (v3 = 0), v3))
    {
      -[THTimeoutDragGestureRecognizer setState:](self, "setState:", 1);
    }
  }
}

- (void)p_cancelTimerFired
{
  if (!-[THTimeoutDragGestureRecognizer state](self, "state"))
    -[THTimeoutDragGestureRecognizer setState:](self, "setState:", 5);
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (UIGestureRecognizer)dependentGestureRecognizer
{
  return self->_dependentGestureRecognizer;
}

- (void)setDependentGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGPoint)requiredMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_requiredMovement.x;
  y = self->_requiredMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRequiredMovement:(CGPoint)a3
{
  self->_requiredMovement = a3;
}

- (double)touchStartTime
{
  return self->_touchStartTime;
}

- (void)setTouchStartTime:(double)a3
{
  self->_touchStartTime = a3;
}

- (CGPoint)touchStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchStartPoint.x;
  y = self->_touchStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchStartPoint:(CGPoint)a3
{
  self->_touchStartPoint = a3;
}

- (CGPoint)touchMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchMovement.x;
  y = self->_touchMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchMovement:(CGPoint)a3
{
  self->_touchMovement = a3;
}

- (NSTimer)recognizeTimer
{
  return self->_recognizeTimer;
}

- (void)setRecognizeTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSTimer)cancelTimer
{
  return self->_cancelTimer;
}

- (void)setCancelTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isStylus
{
  return self->_stylus;
}

- (void)setStylus:(BOOL)a3
{
  self->_stylus = a3;
}

@end
