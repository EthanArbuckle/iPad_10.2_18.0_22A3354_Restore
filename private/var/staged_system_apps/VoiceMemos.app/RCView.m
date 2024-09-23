@implementation RCView

- (RCView)init
{
  RCView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCView;
  v2 = -[RCView init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCNoAnimateLayerHelper sharedNoAnimationHelper](RCNoAnimateLayerHelper, "sharedNoAnimationHelper"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCView layer](v2, "layer"));
    objc_msgSend(v4, "setDelegate:", v3);

  }
  return v2;
}

- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCView renderer](self, "renderer"));
  objc_msgSend(v2, "setCalcBlockShouldRefreshAllSlices:", 1);
  objc_msgSend(v2, "_setNeedsVisibleTimeRangeRenderingFromFrameChange");

}

- (id)snapshot
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  CGSize v13;

  self->_isCreatingSnapshot = 1;
  -[RCView _setNeedsVisibleTimeRangeRenderingFromFrameChange](self, "_setNeedsVisibleTimeRangeRenderingFromFrameChange");
  -[RCView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  -[RCView bounds](self, "bounds");
  -[RCView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  self->_isCreatingSnapshot = 0;
  return v11;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *v8;
  CALayer *waveformLayer;
  void *v10;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCView frame](self, "frame");
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)RCView;
    -[RCView setFrame:](&v12, "setFrame:", x, y, width, height);
    if (!self->_waveformLayer)
    {
      v8 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      waveformLayer = self->_waveformLayer;
      self->_waveformLayer = v8;

      -[CALayer setOpaque:](self->_waveformLayer, "setOpaque:", 1);
      -[CALayer setAllowsGroupOpacity:](self->_waveformLayer, "setAllowsGroupOpacity:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCNoAnimateLayerHelper sharedNoAnimationHelper](RCNoAnimateLayerHelper, "sharedNoAnimationHelper"));
      -[CALayer setDelegate:](self->_waveformLayer, "setDelegate:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCView layer](self, "layer"));
      objc_msgSend(v11, "addSublayer:", self->_waveformLayer);

    }
    -[RCView bounds](self, "bounds");
    -[CALayer setFrame:](self->_waveformLayer, "setFrame:");
    -[RCView _setNeedsVisibleTimeRangeRenderingFromFrameChange](self, "_setNeedsVisibleTimeRangeRenderingFromFrameChange");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCView bounds](self, "bounds");
  if (v9 != *(uint64_t *)&width || v8 != *(uint64_t *)&height)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCView renderer](self, "renderer"));
    v12 = objc_msgSend(v11, "displayMode");

    if (!v12)
    {
      -[CALayer bounds](self->_waveformLayer, "bounds");
      v14 = fmax(v13, 0.01);
      memset(&v29, 0, sizeof(v29));
      CATransform3DMakeScale(&v29, width / v14, 1.0, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCView superview](self, "superview"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "animationForKey:", CFSTR("bounds.origin")));

      if (objc_msgSend(v17, "isMemberOfClass:", objc_opt_class(CASpringAnimation, v18)))
        v19 = v17;
      else
        v19 = 0;
      v20 = -[RCView _isSplitViewControllerTransitioningBetweenStates](self, "_isSplitViewControllerTransitioningBetweenStates");
      if (v19)
        v21 = v20;
      else
        v21 = 0;
      if (v21 == 1)
      {
        +[CATransaction begin](CATransaction, "begin");
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCView _createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:](self, "_createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:", CFSTR("position"), v19));
        -[CALayer setFrame:](self->_waveformLayer, "setFrame:", x, y, width, height);
        -[CALayer addAnimation:forKey:](self->_waveformLayer, "addAnimation:forKey:", v22, CFSTR("position"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCView _createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:](self, "_createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:", CFSTR("bounds"), v19));
        -[CALayer setBounds:](self->_waveformLayer, "setBounds:", 0.0, 0.0, v14, height);
        -[CALayer addAnimation:forKey:](self->_waveformLayer, "addAnimation:forKey:", v23, CFSTR("bounds"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCView _createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:](self, "_createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:", CFSTR("transform"), v19));
        v28 = v29;
        -[CALayer setTransform:](self->_waveformLayer, "setTransform:", &v28);
        -[CALayer addAnimation:forKey:](self->_waveformLayer, "addAnimation:forKey:", v24, CFSTR("transform"));
        +[CATransaction commit](CATransaction, "commit");

        goto LABEL_16;
      }
      -[CALayer setFrame:](self->_waveformLayer, "setFrame:", x, y, width, height);
      -[CALayer setBounds:](self->_waveformLayer, "setBounds:", 0.0, 0.0, v14, height);
      v27 = v29;
      -[CALayer setTransform:](self->_waveformLayer, "setTransform:", &v27);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCView renderer](self, "renderer"));
    objc_msgSend(v25, "setWaitForFinalCalc:", 1);

    -[RCView _setNeedsVisibleTimeRangeRenderingFromFrameChange](self, "_setNeedsVisibleTimeRangeRenderingFromFrameChange");
  }
LABEL_16:
  v26.receiver = self;
  v26.super_class = (Class)RCView;
  -[RCView setBounds:](&v26, "setBounds:", x, y, width, height);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RCView;
  -[RCView layoutSublayersOfLayer:](&v16, "layoutSublayersOfLayer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCView layer](self, "layer"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCView layer](self, "layer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animationForKey:", CFSTR("bounds.origin")));

    if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class(CASpringAnimation, v9)))
      v10 = v8;
    else
      v10 = 0;
    v11 = -[RCView _isSplitViewControllerTransitioningBetweenStates](self, "_isSplitViewControllerTransitioningBetweenStates");
    if (v10)
      v12 = v11;
    else
      v12 = 0;
    if (v12 != 1)
      goto LABEL_13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCView renderer](self, "renderer"));
    if (objc_msgSend(v13, "displayMode") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer animationKeys](self->_waveformLayer, "animationKeys"));
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      +[CATransaction begin](CATransaction, "begin");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCView _createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:](self, "_createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:", CFSTR("bounds"), v10));
      -[CALayer addAnimation:forKey:](self->_waveformLayer, "addAnimation:forKey:", v13, CFSTR("bounds"));
      +[CATransaction commit](CATransaction, "commit");
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)_isSplitViewControllerTransitioningBetweenStates
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCView renderer](self, "renderer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "splitViewController"));

  LOBYTE(v2) = objc_msgSend(v3, "isTransitioningBetweenVisibleColumnStates");
  return (char)v2;
}

- (id)_createSpringAnimationWithKeyPath:(id)a3 basedOnPropertiesFromSpringAnimation:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", a3));
  objc_msgSend(v5, "duration");
  objc_msgSend(v6, "setDuration:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timingFunction"));
  objc_msgSend(v6, "setTimingFunction:", v7);

  objc_msgSend(v5, "damping");
  objc_msgSend(v6, "setDamping:");
  objc_msgSend(v5, "stiffness");
  objc_msgSend(v6, "setStiffness:");
  objc_msgSend(v5, "mass");
  objc_msgSend(v6, "setMass:");

  return v6;
}

- (BOOL)isCreatingSnapshot
{
  return self->_isCreatingSnapshot;
}

- (CALayer)waveformLayer
{
  return self->_waveformLayer;
}

- (RCWaveformRenderer)renderer
{
  return (RCWaveformRenderer *)objc_loadWeakRetained((id *)&self->_renderer);
}

- (void)setRenderer:(id)a3
{
  objc_storeWeak((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_waveformLayer, 0);
}

@end
