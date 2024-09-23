@implementation _UIGestureStudyClickInteraction

- (_UIGestureStudyClickInteraction)initWithTarget:(id)a3 action:(SEL)a4 useForce:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _UIGestureStudyClickInteraction *v9;
  _UIGestureStudyClickInteraction *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIGestureStudyClickInteraction;
  v9 = -[_UIGestureStudyClickInteraction init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    -[_UIGestureStudyClickInteraction setTarget:](v9, "setTarget:", v8);
    -[_UIGestureStudyClickInteraction setAction:](v10, "setAction:", a4);
    -[_UIGestureStudyClickInteraction setUsesForce:](v10, "setUsesForce:", v5);
    objc_opt_class();
    v11 = (void *)objc_opt_new();
    -[_UIGestureStudyClickInteraction setDriver:](v10, "setDriver:", v11);

    -[_UIGestureStudyClickInteraction driver](v10, "driver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v10);

    -[_UIGestureStudyClickInteraction driver](v10, "driver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _UIClickPresentationAllowableMovementForDriver(v13, 0);
    -[_UIGestureStudyClickInteraction driver](v10, "driver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowableMovement:", v14);

    -[_UIGestureStudyClickInteraction setStartTimestamp:](v10, "setStartTimestamp:", 978307200.0);
    -[_UIGestureStudyClickInteraction setOriginalCentroid:](v10, "setOriginalCentroid:", 1.79769313e308, 1.79769313e308);
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UIGestureStudyClickInteraction usesForce](self, "usesForce");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; usesForce = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)willMoveToView:(id)a3
{
  id v3;

  -[_UIGestureStudyClickInteraction driver](self, "driver", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setView:", 0);

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  void *v7;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[_UIGestureStudyClickInteraction driver](self, "driver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setView:", WeakRetained);

  }
}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  const char *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[_UIGestureStudyClickInteraction setStartTimestamp:](self, "setStartTimestamp:");
      -[_UIGestureStudyClickInteraction view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIGestureStudyClickInteraction locationInCoordinateSpace:](self, "locationInCoordinateSpace:", v7);
      -[_UIGestureStudyClickInteraction setOriginalCentroid:](self, "setOriginalCentroid:");
      goto LABEL_9;
    case 1uLL:
      v8 = 1;
      goto LABEL_7;
    case 2uLL:
      -[_UIGestureStudyClickInteraction target](self, "target");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UIGestureStudyClickInteraction action](self, "action");
      if (dyld_program_sdk_at_least())
        objc_msgSend(v7, v9, self);
      else
        objc_msgSend(v7, sel_performSelector_withObject_, v9, self);
LABEL_9:

      goto LABEL_10;
    case 3uLL:
      -[_UIGestureStudyClickInteraction setStartTimestamp:](self, "setStartTimestamp:", 978307200.0);
      -[_UIGestureStudyClickInteraction setOriginalCentroid:](self, "setOriginalCentroid:", 1.79769313e308, 1.79769313e308);
      v6 = v10;
      v8 = 0;
LABEL_7:
      objc_msgSend(v10, "setAllowableMovement:", _UIClickPresentationAllowableMovementForDriver(v6, v8));
LABEL_10:
      v6 = v10;
      break;
    default:
      break;
  }

}

- (NSString)eventName
{
  if (-[_UIGestureStudyClickInteraction usesForce](self, "usesForce"))
    return (NSString *)CFSTR("EventTypeForcePress");
  else
    return (NSString *)CFSTR("EventTypeLongPress");
}

- (CGPoint)locationInCoordinateSpace:(id)a3
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
  -[_UIGestureStudyClickInteraction driver](self, "driver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInCoordinateSpace:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
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

  -[_UIGestureStudyClickInteraction startTimestamp](self, "startTimestamp");
  v4 = v3;
  result = 0.0;
  if (v4 < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
    v7 = v6;
    -[_UIGestureStudyClickInteraction startTimestamp](self, "startTimestamp");
    return v7 - v8;
  }
  return result;
}

- (double)movement
{
  double v3;
  double v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[_UIGestureStudyClickInteraction originalCentroid](self, "originalCentroid");
  if (v4 == 1.79769313e308 && v3 == 1.79769313e308)
    return 0.0;
  -[_UIGestureStudyClickInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyClickInteraction locationInCoordinateSpace:](self, "locationInCoordinateSpace:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIGestureStudyClickInteraction originalCentroid](self, "originalCentroid");
  return sqrt((v11 - v8) * (v11 - v8) + (v12 - v10) * (v12 - v10));
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIClickInteractionDriving)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
  objc_storeStrong((id *)&self->_driver, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (BOOL)usesForce
{
  return self->_usesForce;
}

- (void)setUsesForce:(BOOL)a3
{
  self->_usesForce = a3;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (CGPoint)originalCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCentroid.x;
  y = self->_originalCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalCentroid:(CGPoint)a3
{
  self->_originalCentroid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
