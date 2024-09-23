@implementation SBFluidSwitcherPanGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  SBTouchHistory *touchHistory;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  objc_super v13;

  touchHistory = self->_touchHistory;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  objc_msgSend(WeakRetained, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v10, self, v12, self->_installedAsSystemGesture);

  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  -[SBFluidSwitcherPanGestureRecognizer touchesEnded:withEvent:](&v13, sel_touchesEnded_withEvent_, v8, v7);

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  -[SBPanSystemGestureRecognizer reset](&v3, sel_reset);
  -[SBTouchHistory reset](self->_touchHistory, "reset");
  -[SBFluidSwitcherPanGestureRecognizer setInitialTouchLeafAppLayout:](self, "setInitialTouchLeafAppLayout:", 0);
}

- (void)setInitialTouchLeafAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_initialTouchLeafAppLayout, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  SBFluidSwitcherViewController **p_switcherViewController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  SBTouchHistory *touchHistory;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v16;

  p_switcherViewController = &self->_switcherViewController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherViewController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  touchHistory = self->_touchHistory;
  objc_msgSend(v8, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v13, self, v10, self->_installedAsSystemGesture);

  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  -[SBPanSystemGestureRecognizer touchesBegan:withEvent:](&v16, sel_touchesBegan_withEvent_, v8, v7);

  -[SBFluidSwitcherPanGestureRecognizer locationInView:](self, "locationInView:", v10);
  self->_initialTouchLocation.x = v14;
  self->_initialTouchLocation.y = v15;

}

- (SBFluidSwitcherPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBFluidSwitcherPanGestureRecognizer *v4;
  SBTouchHistory *v5;
  SBTouchHistory *touchHistory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  v4 = -[SBPanSystemGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SBTouchHistory);
    touchHistory = v4->_touchHistory;
    v4->_touchHistory = v5;

    -[SBFluidSwitcherPanGestureRecognizer setMaximumNumberOfTouches:](v4, "setMaximumNumberOfTouches:", 1);
  }
  return v4;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  SBTouchHistory *touchHistory;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  objc_super v13;

  touchHistory = self->_touchHistory;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  objc_msgSend(WeakRetained, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(touchHistory, v10, self, v12, self->_installedAsSystemGesture);

  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherPanGestureRecognizer;
  -[SBFluidSwitcherPanGestureRecognizer touchesMoved:withEvent:](&v13, sel_touchesMoved_withEvent_, v8, v7);

}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  double result;

  -[SBTouchHistory averageTouchPathAngleOverTimeDuration:](self->_touchHistory, "averageTouchPathAngleOverTimeDuration:", a3);
  return result;
}

- (double)peakSpeed
{
  double result;

  -[SBTouchHistory peakSpeed](self->_touchHistory, "peakSpeed");
  return result;
}

- (SBFluidSwitcherViewController)switcherViewController
{
  return (SBFluidSwitcherViewController *)objc_loadWeakRetained((id *)&self->_switcherViewController);
}

- (void)setSwitcherViewController:(id)a3
{
  objc_storeWeak((id *)&self->_switcherViewController, a3);
}

- (BOOL)installedAsSystemGesture
{
  return self->_installedAsSystemGesture;
}

- (void)setInstalledAsSystemGesture:(BOOL)a3
{
  self->_installedAsSystemGesture = a3;
}

- (CGPoint)initialTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchLocation.x;
  y = self->_initialTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (SBAppLayout)initialTouchLeafAppLayout
{
  return self->_initialTouchLeafAppLayout;
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_initialTouchLeafAppLayout, 0);
  objc_destroyWeak((id *)&self->_switcherViewController);
}

@end
