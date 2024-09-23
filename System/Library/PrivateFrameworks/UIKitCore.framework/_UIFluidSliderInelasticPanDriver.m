@implementation _UIFluidSliderInelasticPanDriver

- (_UIFluidSliderInelasticPanDriver)init
{
  _UIFluidSliderInelasticPanDriver *v2;
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFluidSliderInelasticPanDriver;
  v2 = -[_UIFluidSliderInelasticPanDriver init](&v6, sel_init);
  if (v2)
  {
    v3 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleGesture_);
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = v3;

    -[UIGestureRecognizer setName:](v2->_panGestureRecognizer, "setName:", CFSTR("com.apple.UIKit.FluidSliderInelasticPan"));
    -[UIGestureRecognizer _setKeepTouchesOnContinuation:](v2->_panGestureRecognizer, "_setKeepTouchesOnContinuation:", 1);
    -[UIGestureRecognizer setCancelsTouchesInView:](v2->_panGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIPanGestureRecognizer setDelegate:](v2->_panGestureRecognizer, "setDelegate:", v2);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v2->_panGestureRecognizer, "setAllowedScrollTypesMask:", 3);
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)CFSTR("Inelastic Pan");
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_view);
    -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

    v8 = objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    if (obj)
    {
      v9 = objc_loadWeakRetained((id *)&self->_view);
      -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addGestureRecognizer:", v10);

      v5 = obj;
    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)cancel
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if (v4)
  {
    -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

    -[_UIFluidSliderInelasticPanDriver panGestureRecognizer](self, "panGestureRecognizer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v4, "locationInView:", v6);
    v7 = objc_msgSend(WeakRetained, "driver:shouldBeginAtPoint:", self);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_handleGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  if (objc_msgSend(v19, "state") < 1 || objc_msgSend(v19, "state") > 2)
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(v19, "state") == 1)
    {
      -[_UIFluidSliderInelasticPanDriver drivable](self, "drivable");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentationValue");
      -[_UIFluidSliderInelasticPanDriver set_previousValue:](self, "set_previousValue:");

    }
    v5 = 1;
  }
  objc_msgSend(v19, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "translationInView:", v6);
  v8 = v7;
  v10 = v9;

  if (-[_UIFluidSliderInelasticPanDriver trackAxis](self, "trackAxis") == 2)
    v8 = -v10;
  -[_UIFluidSliderInelasticPanDriver _previousTranslation](self, "_previousTranslation");
  v12 = v8 - v11;
  -[_UIFluidSliderInelasticPanDriver set_previousTranslation:](self, "set_previousTranslation:", v8);
  -[_UIFluidSliderInelasticPanDriver _previousValue](self, "_previousValue");
  v14 = v13;
  -[_UIFluidSliderInelasticPanDriver _trackLength](self, "_trackLength");
  v16 = v12 / v15;
  -[_UIFluidSliderInelasticPanDriver velocityMultiplier](self, "velocityMultiplier");
  v18 = v14 + v16 * v17;
  -[_UIFluidSliderInelasticPanDriver set_previousValue:](self, "set_previousValue:", v18);
  -[_UIFluidSliderInelasticPanDriver _issueUpdateWithValue:isActive:](self, "_issueUpdateWithValue:isActive:", v5, fmax(fmin(v18, 1.0), 0.0));

}

- (void)_issueUpdateWithValue:(double)a3 isActive:(BOOL)a4
{
  _BOOL8 v6;
  void *v7;
  _QWORD v8[5];

  v6 = a4;
  -[_UIFluidSliderInelasticPanDriver drivable](self, "drivable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v8 = a3;
  v8[1] = 0x3FF0000000000000;
  v8[2] = v6;
  v8[3] = 1;
  v8[4] = 0xBFF0000000000000;
  objc_msgSend(v7, "fluidSliderDriver:didGenerateUpdate:", self, v8);

}

- (double)_trackLength
{
  void *v2;
  double v3;
  double v4;

  -[_UIFluidSliderInelasticPanDriver drivable](self, "drivable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTrackLength");
  v4 = v3;

  return v4;
}

- (_UIFluidSliderDrivable)drivable
{
  return (_UIFluidSliderDrivable *)objc_loadWeakRetained((id *)&self->_drivable);
}

- (void)setDrivable:(id)a3
{
  objc_storeWeak((id *)&self->_drivable, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)trackAxis
{
  return self->_trackAxis;
}

- (void)setTrackAxis:(unint64_t)a3
{
  self->_trackAxis = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)delegate
{
  return (_UIFluidSliderDirectDrivingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (double)_previousTranslation
{
  return self->__previousTranslation;
}

- (void)set_previousTranslation:(double)a3
{
  self->__previousTranslation = a3;
}

- (double)_previousValue
{
  return self->__previousValue;
}

- (void)set_previousValue:(double)a3
{
  self->__previousValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_drivable);
}

@end
