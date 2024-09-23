@implementation _UIDragLiftPointerWithEarlyStartGestureRecognizer

- (void)setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIDragLiftPointerWithEarlyStartGestureRecognizer;
  -[_UIDragLiftGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, a3, a4);
  -[_UIDragLiftPointerWithEarlyStartGestureRecognizer liftMoveHysteresis](self, "liftMoveHysteresis");
  if (v5 > 0.0)
  {
    -[UILongPressGestureRecognizer startPoint](self, "startPoint");
    v7 = v6;
    v9 = v8;
    -[UILongPressGestureRecognizer centroid](self, "centroid");
    v12 = sqrt((v10 - v7) * (v10 - v7) + (v11 - v9) * (v11 - v9));
    -[_UIDragLiftPointerWithEarlyStartGestureRecognizer liftMoveHysteresis](self, "liftMoveHysteresis");
    if (v12 >= v13)
    {
      -[UILongPressGestureRecognizer enoughTimeElapsed:](self, "enoughTimeElapsed:", 0);
      if (-[UIGestureRecognizer state](self, "state") >= UIGestureRecognizerStateBegan)
        -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
    }
  }
}

- (double)liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

@end
