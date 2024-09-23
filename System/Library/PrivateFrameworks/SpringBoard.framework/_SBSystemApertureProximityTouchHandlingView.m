@implementation _SBSystemApertureProximityTouchHandlingView

- (_SBSystemApertureProximityTouchHandlingView)initWithDelegate:(id)a3 hitTestsAsOpaque:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _SBSystemApertureProximityTouchHandlingView *v7;
  _SBSystemApertureProximityTouchHandlingView *v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBSystemApertureProximityTouchHandlingView;
  v7 = -[_SBSystemApertureProximityTouchHandlingView init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    -[_SBSystemApertureProximityTouchHandlingView layer](v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHitTestsAsOpaque:", v4);

  }
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  _SBSystemApertureProximityTouchHandlingView *v10;
  _SBSystemApertureProximityTouchHandlingView *v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_SBSystemApertureProximityTouchHandlingView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "proximityBacklightPolicyTouchHandlingView:shouldConsumeTouchForHitTest:withEvent:", self, v7, x, y);

  if (v9)
    v10 = self;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (_SBSystemApertureProximityTouchHandlingViewDelegate)delegate
{
  return (_SBSystemApertureProximityTouchHandlingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
