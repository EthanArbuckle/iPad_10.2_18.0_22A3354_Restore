@implementation THFlickGestureRecognizer

- (THFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THFlickGestureRecognizer;
  return -[THFlickGestureRecognizer initWithTarget:action:](&v5, "initWithTarget:action:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[THFlickGestureRecognizer p_invalidateTimer](self, "p_invalidateTimer");
  v3.receiver = self;
  v3.super_class = (Class)THFlickGestureRecognizer;
  -[THFlickGestureRecognizer dealloc](&v3, "dealloc");
}

- (CGPoint)initialLocationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "convertPoint:fromView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"), self->_startLocation.x, self->_startLocation.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  __n128 v10;
  double v11;
  double v12;
  CGPoint result;

  objc_msgSend(a3, "convertPoint:fromView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"), self->_startLocation.x, self->_startLocation.y);
  v6 = v5;
  v8 = v7;
  objc_msgSend(a3, "convertPoint:fromView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"), self->_endLocation.x, self->_endLocation.y);
  v11 = TSDSubtractPoints(v9, v10, v6, v8);
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGFloat v6;
  CGFloat v7;
  double v8;

  if ((unint64_t)objc_msgSend(a3, "count") < 2 || -[THFlickGestureRecognizer state](self, "state"))
  {
    objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"));
    self->_startLocation.x = v6;
    self->_startLocation.y = v7;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_startInterval = v8;
    self->_endLocation = self->_startLocation;
    self->_endInterval = self->_startInterval;
    self->_killTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_killTimerFired:", 0, 0, 0.15);
  }
  else
  {
    -[THFlickGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  CGFloat v5;
  CGFloat v6;
  double v7;

  objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"));
  self->_endLocation.x = v5;
  self->_endLocation.y = v6;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_endInterval = v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;

  -[THFlickGestureRecognizer p_invalidateTimer](self, "p_invalidateTimer", a3, a4);
  if (!-[THFlickGestureRecognizer state](self, "state"))
  {
    v5 = -[THFlickGestureRecognizer translationInView:](self, "translationInView:", -[THFlickGestureRecognizer view](self, "view"));
    if (TSDPointLength(v5, v6, v7) <= 25.0)
      v8 = 5;
    else
      v8 = 3;
    -[THFlickGestureRecognizer setState:](self, "setState:", v8);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (!-[THFlickGestureRecognizer state](self, "state", a3, a4))
    -[THFlickGestureRecognizer setState:](self, "setState:", 4);
}

- (void)p_invalidateTimer
{
  -[NSTimer invalidate](self->_killTimer, "invalidate");

  self->_killTimer = 0;
}

- (void)p_killTimerFired:(id)a3
{
  if (!-[THFlickGestureRecognizer state](self, "state", a3))
  {
    -[THFlickGestureRecognizer setState:](self, "setState:", 5);
    -[THFlickGestureRecognizer p_invalidateTimer](self, "p_invalidateTimer");
  }
}

@end
