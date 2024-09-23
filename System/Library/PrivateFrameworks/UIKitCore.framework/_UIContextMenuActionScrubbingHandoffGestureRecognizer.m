@implementation _UIContextMenuActionScrubbingHandoffGestureRecognizer

- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIContextMenuActionScrubbingHandoffGestureRecognizer *v4;
  _UIContextMenuActionScrubbingHandoffGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuActionScrubbingHandoffGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setName:](v4, "setName:", CFSTR("com.apple.UIKit.ContextMenuActionPanHandoff"));
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v5, "_setAcceptsFailureRequiments:", 0);
    -[_UIContextMenuActionScrubbingHandoffGestureRecognizer setHysteresis:](v5, "setHysteresis:", 10.0);
  }
  return v5;
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_initialLocation;
  CGFloat v6;
  CGFloat v7;

  p_initialLocation = &self->_initialLocation;
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0, a4);
  p_initialLocation->x = v6;
  p_initialLocation->y = v7;
  -[_UIContextMenuActionScrubbingHandoffGestureRecognizer _beginGestureIfPossible](self, "_beginGestureIfPossible");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  UIGestureRecognizerState v5;
  _UIContextMenuActionScrubbingHandoffGestureRecognizer *v6;
  uint64_t v7;

  v5 = -[UIGestureRecognizer state](self, "state", a3, a4);
  if (v5)
  {
    if (v5 <= UIGestureRecognizerStateChanged)
    {
      if (-[_UIContextMenuActionScrubbingHandoffGestureRecognizer _gestureIsStillValid](self, "_gestureIsStillValid"))
      {
        v6 = self;
        v7 = 2;
      }
      else
      {
        v6 = self;
        v7 = 4;
      }
      -[UIGestureRecognizer setState:](v6, "setState:", v7);
    }
  }
  else
  {
    -[_UIContextMenuActionScrubbingHandoffGestureRecognizer _beginGestureIfPossible](self, "_beginGestureIfPossible");
  }
}

- (void)_beginGestureIfPossible
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    if (-[_UIContextMenuActionScrubbingHandoffGestureRecognizer _gestureIsStillValid](self, "_gestureIsStillValid"))
    {
      if (!-[_UIContextMenuActionScrubbingHandoffGestureRecognizer _satisfiedHysteresis](self, "_satisfiedHysteresis"))
        return;
      v3 = 1;
    }
    else
    {
      v3 = 5;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v3);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (BOOL)_gestureIsStillValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") < 2;

  return v4;
}

- (BOOL)_satisfiedHysteresis
{
  CGPoint *p_initialLocation;
  double v4;
  double v5;
  double v6;
  double v7;

  p_initialLocation = &self->_initialLocation;
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0);
  v6 = fabs(sqrt((v4 - p_initialLocation->x) * (v4 - p_initialLocation->x)+ (v5 - p_initialLocation->y) * (v5 - p_initialLocation->y)));
  -[_UIContextMenuActionScrubbingHandoffGestureRecognizer hysteresis](self, "hysteresis");
  return v6 >= v7;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

@end
