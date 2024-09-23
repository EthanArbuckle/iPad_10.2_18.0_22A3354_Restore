@implementation PUTouchingGestureRecognizer

- (void)_incrementTouchesBy:(unint64_t)a3
{
  -[PUTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", -[PUTouchingGestureRecognizer _touchCount](self, "_touchCount") + a3);
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  unint64_t v5;

  if (-[PUTouchingGestureRecognizer _touchCount](self, "_touchCount") >= a3)
    v5 = -[PUTouchingGestureRecognizer _touchCount](self, "_touchCount") - a3;
  else
    v5 = 0;
  -[PUTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", v5);
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount;
  uint64_t v4;

  touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__touchCount = a3;
    if (a3)
    {
      if (touchCount)
        return;
      v4 = 1;
    }
    else
    {
      v4 = 3;
    }
    -[PUTouchingGestureRecognizer setState:](self, "setState:", v4);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[PUTouchingGestureRecognizer _incrementTouchesBy:](self, "_incrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PUTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  -[PUTouchingGestureRecognizer setState:](self, "setState:", 4);
  v6 = objc_msgSend(v5, "count");

  -[PUTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", v6);
}

- (void)reset
{
  -[PUTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

@end
