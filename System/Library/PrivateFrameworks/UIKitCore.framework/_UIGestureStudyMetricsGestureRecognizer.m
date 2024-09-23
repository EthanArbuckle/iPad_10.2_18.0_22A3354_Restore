@implementation _UIGestureStudyMetricsGestureRecognizer

- (_UIGestureStudyMetricsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIGestureStudyMetricsGestureRecognizer *v4;
  _UIGestureStudyMetricsGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIGestureStudyMetricsGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setName:](v4, "setName:", CFSTR("gesture-study-press-duration"));
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v5, "_setAcceptsFailureRequiments:", 0);
    -[_UIGestureStudyMetricsGestureRecognizer setAllowableMovement:](v5, "setAllowableMovement:", 0.0);
  }
  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[_UIGestureStudyMetricsGestureRecognizer primaryTouch](self, "primaryTouch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_observedTouchCount += objc_msgSend(v7, "count");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    objc_msgSend(v7, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIGestureStudyMetricsGestureRecognizer setPrimaryTouch:](self, "setPrimaryTouch:", v5);

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[_UIGestureStudyMetricsGestureRecognizer setStartTimestamp:](self, "setStartTimestamp:");
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIGestureStudyMetricsGestureRecognizer locationInView:](self, "locationInView:", v6);
    -[_UIGestureStudyMetricsGestureRecognizer setOriginalPosition:](self, "setOriginalPosition:");

    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  -[_UIGestureStudyMetricsGestureRecognizer primaryTouch](self, "primaryTouch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  -[_UIGestureStudyMetricsGestureRecognizer primaryTouch](self, "primaryTouch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  -[_UIGestureStudyMetricsGestureRecognizer setStartTimestamp:](self, "setStartTimestamp:", 978307200.0);
  -[_UIGestureStudyMetricsGestureRecognizer setOriginalPosition:](self, "setOriginalPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[_UIGestureStudyMetricsGestureRecognizer setPrimaryTouch:](self, "setPrimaryTouch:", 0);
  self->_observedTouchCount = 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("none");
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v4 = a3;
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyMetricsGestureRecognizer locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIGestureRecognizer view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v4, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)duration
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[_UIGestureStudyMetricsGestureRecognizer startTimestamp](self, "startTimestamp");
  v4 = v3;
  result = 978307200.0;
  if (v4 < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    -[_UIGestureStudyMetricsGestureRecognizer startTimestamp](self, "startTimestamp");
    return v7 - v8;
  }
  return result;
}

- (double)movement
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyMetricsGestureRecognizer locationInView:](self, "locationInView:", v3);
  v5 = v4;
  v7 = v6;

  -[_UIGestureStudyMetricsGestureRecognizer originalPosition](self, "originalPosition");
  return sqrt((v8 - v5) * (v8 - v5) + (v9 - v7) * (v9 - v7));
}

- (int64_t)observedTouchCount
{
  return self->_observedTouchCount;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (CGPoint)originalPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalPosition.x;
  y = self->_originalPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->_originalPosition = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (UITouch)primaryTouch
{
  return self->_primaryTouch;
}

- (void)setPrimaryTouch:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTouch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryTouch, 0);
}

@end
