@implementation DBSDeviceDisplayZoomAnimationView

- (DBSDeviceDisplayZoomAnimationView)initWithDisplayZoomOption:(unint64_t)a3
{
  DBSDeviceDisplayZoomAnimationView *v4;
  DBSDeviceDisplayZoomAnimationView *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DBSDeviceDisplayZoomAnimationView;
  v4 = -[DBSDeviceDisplayZoomAnimationView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    -[DBSDeviceDisplayZoomAnimationView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDeviceDisplayZoomAnimationView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v5->_displayZoomOption = a3;
    v5->_duration = 3.0;
    if ((DBSReverseZoomEnabled() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "sf_isiPad");
      v9 = 1.0;
      if (v8)
        v9 = 0.5;
      v5->_scale = v9;

    }
    else
    {
      v5->_scale = 1.0;
    }
    -[DBSDeviceDisplayZoomAnimationView _configureView](v5, "_configureView");
  }
  return v5;
}

- (void)_configureView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDE5718];
  v4 = -[DBSDeviceDisplayZoomAnimationView displayZoomOption](self, "displayZoomOption");
  -[DBSDeviceDisplayZoomAnimationView traitCollection](self, "traitCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "userInterfaceStyle");
  -[DBSDeviceDisplayZoomAnimationView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(v4, v5, objc_msgSend(v6, "layoutDirection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "packageWithContentsOfURL:type:options:error:", v7, *MEMORY[0x24BDE5D50], 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceDisplayZoomAnimationView setPackage:](self, "setPackage:", v8);

}

- (void)setPackage:(id)a3
{
  CAPackage *v5;

  v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    -[DBSDeviceDisplayZoomAnimationView _setPackage:](self, "_setPackage:", v5);
  }

}

- (void)_setPackage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  objc_msgSend(v4, "rootLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isGeometryFlipped");

  objc_msgSend(v9, "setGeometryFlipped:", v6);
  objc_msgSend(v9, "setContentsGravity:", *MEMORY[0x24BDE5C90]);
  objc_msgSend(v9, "setMasksToBounds:", 1);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5968]);
  -[DBSDeviceDisplayZoomAnimationView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldRasterize:", 1);

  -[DBSDeviceDisplayZoomAnimationView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", v9);

  -[DBSDeviceDisplayZoomAnimationView setPackageLayer:](self, "setPackageLayer:", v9);
  -[DBSDeviceDisplayZoomAnimationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double scale;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectGetCenter();
  objc_msgSend(v4, "setPosition:");

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  scale = self->_scale;
  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "contentsTransform");
  else
    memset(&v13, 0, sizeof(v13));
  v12 = v7 * 1.5;
  if (v7 >= 3.0)
    v12 = v7;
  CGAffineTransformScale(&v14, &v13, 1.0 / v12 * scale, 1.0 / v12 * scale);
  objc_msgSend(v9, "setAffineTransform:", &v14);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  double v7;
  double v8;
  double scale;
  void *v10;
  void *v11;
  double v12;
  float64x2_t v18;
  double v19;
  __int128 v20;
  __int128 v21;
  float64x2_t v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGSize result;

  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v20 = v5;
  v21 = v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  scale = self->_scale;
  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "contentsTransform", v20, v21);
  else
    memset(&v23, 0, sizeof(v23));
  v12 = v8 * 1.5;
  if (v8 >= 3.0)
    v12 = v8;
  CGAffineTransformScale(&v24, &v23, 1.0 / v12 * scale, 1.0 / v12 * scale);
  v22 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, *(double *)&v20), *(float64x2_t *)&v24.a, *(double *)&v21);

  __asm { FMOV            V0.2D, #2.0 }
  v18 = vaddq_f64(v22, _Q0);
  v19 = v18.f64[1];
  result.width = v18.f64[0];
  result.height = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DBSDeviceDisplayZoomAnimationView;
  -[DBSDeviceDisplayZoomAnimationView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, a3);
  v4 = -[DBSDeviceDisplayZoomAnimationView isAnimating](self, "isAnimating");
  -[DBSDeviceDisplayZoomAnimationView stopAnimation](self, "stopAnimation");
  v5 = (void *)MEMORY[0x24BDE5718];
  v6 = -[DBSDeviceDisplayZoomAnimationView displayZoomOption](self, "displayZoomOption");
  -[DBSDeviceDisplayZoomAnimationView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");
  -[DBSDeviceDisplayZoomAnimationView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(v6, v8, objc_msgSend(v9, "layoutDirection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "packageWithContentsOfURL:type:options:error:", v10, *MEMORY[0x24BDE5D50], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceDisplayZoomAnimationView setPackage:](self, "setPackage:", v11);

  -[DBSDeviceDisplayZoomAnimationView setNeedsDisplay](self, "setNeedsDisplay");
  if (v4)
    -[DBSDeviceDisplayZoomAnimationView startAnimation](self, "startAnimation");
}

- (void)startAnimation
{
  void *v3;
  void *v4;

  -[DBSDeviceDisplayZoomAnimationView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRasterize:", 0);

  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceDisplayZoomAnimationView _startAnimationForLayer:](self, "_startAnimationForLayer:", v4);

  -[DBSDeviceDisplayZoomAnimationView setAnimating:](self, "setAnimating:", 1);
}

- (void)stopAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DBSDeviceDisplayZoomAnimationView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRasterize:", 1);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelTimers");

    -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "removeAllStateChanges");

    -[DBSDeviceDisplayZoomAnimationView setStateController:](self, "setStateController:", 0);
  }
  -[DBSDeviceDisplayZoomAnimationView setAnimating:](self, "setAnimating:", 0);
}

- (CGSize)preferredSize
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  float64x2_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  float64x2_t v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGSize result;

  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v19 = v5;
  v20 = v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  -[DBSDeviceDisplayZoomAnimationView packageLayer](self, "packageLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "contentsTransform", v19, v20);
  else
    memset(&v22, 0, sizeof(v22));
  v11 = v8 * 1.5;
  if (v8 >= 3.0)
    v11 = v8;
  CGAffineTransformScale(&v23, &v22, 1.0 / v11, 1.0 / v11);
  v21 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, *(double *)&v19), *(float64x2_t *)&v23.a, *(double *)&v20);

  __asm { FMOV            V0.2D, #2.0 }
  v17 = vaddq_f64(v21, _Q0);
  v18 = v17.f64[1];
  result.width = v17.f64[0];
  result.height = v18;
  return result;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[DBSDeviceDisplayZoomAnimationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_startAnimationForLayer:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BDE5788];
  v8 = a3;
  v5 = (void *)objc_msgSend([v4 alloc], "initWithLayer:", v8);
  -[DBSDeviceDisplayZoomAnimationView setStateController:](self, "setStateController:", v5);

  -[DBSDeviceDisplayZoomAnimationView setState:](self, "setState:", 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setInitialStatesOfLayer:transitionSpeed:", v8, v7);

  -[DBSDeviceDisplayZoomAnimationView _stepAnimamtionForLayer:](self, "_stepAnimamtionForLayer:", v8);
}

- (void)_stepAnimamtionForLayer:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[DBSDeviceDisplayZoomAnimationView state](self, "state");
  if (v4 <= 3
    && (v5 = off_24F0262C8[v4],
        -[DBSDeviceDisplayZoomAnimationView setState:](self, "setState:", qword_227A5ED60[v4]),
        objc_msgSend(v12, "stateWithName:", v5),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setState:ofLayer:transitionSpeed:", v7, v12, v9);

    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
    -[DBSDeviceDisplayZoomAnimationView duration](self, "duration");
    -[DBSDeviceDisplayZoomAnimationView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stepAnimamtionForLayer_, v12, v10);

  }
  else
  {
    -[DBSDeviceDisplayZoomAnimationView stateController](self, "stateController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInitialStatesOfLayer:", v12);

    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
    -[DBSDeviceDisplayZoomAnimationView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stepAnimamtionForLayer_, v12, 0.5);
  }

}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (void)setDisplayZoomOption:(unint64_t)a3
{
  self->_displayZoomOption = a3;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_packageLayer, a3);
}

- (CAPackage)package
{
  return self->_package;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
}

@end
