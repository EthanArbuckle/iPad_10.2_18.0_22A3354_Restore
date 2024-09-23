@implementation SBScreenEdgePanGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
}

- (void)sb_commonInitScreenEdgePanGestureRecognizer
{
  -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:", 10.0);
  -[SBScreenEdgePanGestureRecognizer setMaximumNumberOfTouches:](self, "setMaximumNumberOfTouches:", 1);
  -[SBScreenEdgePanGestureRecognizer setAllowedTouchTypes:](self, "setAllowedTouchTypes:", &unk_1E91CF0B8);
}

- (SBScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBScreenEdgePanGestureRecognizer *v4;
  SBScreenEdgePanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBScreenEdgePanGestureRecognizer;
  v4 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[SBScreenEdgePanGestureRecognizer sb_commonInitScreenEdgePanGestureRecognizer](v4, "sb_commonInitScreenEdgePanGestureRecognizer");
  return v5;
}

- (SBScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6
{
  SBScreenEdgePanGestureRecognizer *v6;
  SBScreenEdgePanGestureRecognizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBScreenEdgePanGestureRecognizer;
  v6 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:type:options:](&v9, sel_initWithTarget_action_type_options_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[SBScreenEdgePanGestureRecognizer sb_commonInitScreenEdgePanGestureRecognizer](v6, "sb_commonInitScreenEdgePanGestureRecognizer");
  return v7;
}

- (double)grabberActiveZoneWidth
{
  double result;

  result = self->_grabberActiveZoneWidth;
  if (result == 0.0)
    return 100.0;
  return result;
}

- (BOOL)isLocationWithinGrabberActiveZone
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MidX;
  double v10;
  double v11;
  char v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  CGRect v17;

  -[SBScreenEdgePanGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForSystemGestureRecognizer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _UISystemGestureLocationInView();
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v17);
  -[SBScreenEdgePanGestureRecognizer grabberActiveZoneWidth](self, "grabberActiveZoneWidth");
  v11 = v10;
  v12 = -[UIScreenEdgePanGestureRecognizer edges](self, "edges");
  v13 = (v12 & 0xA) == 0;
  if (vabdd_f64(v8, MidX) <= v11)
    v13 = 1;
  v14 = vabdd_f64(v6, MidX) <= v11 && v13;
  if ((v12 & 5) != 0)
    v15 = v14;
  else
    v15 = v13;

  return v15;
}

- (void)setGrabberActiveZoneWidth:(double)a3
{
  self->_grabberActiveZoneWidth = a3;
}

@end
