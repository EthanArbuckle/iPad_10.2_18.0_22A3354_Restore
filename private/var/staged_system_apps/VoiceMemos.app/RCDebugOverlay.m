@implementation RCDebugOverlay

- (RCDebugOverlay)initWithParentView:(id)a3 shouldObserveChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  RCDebugOverlay *v7;
  RCDebugOverlay *v8;
  int v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RCDebugOverlay;
  v7 = -[RCDebugOverlay init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentView, v6);
    v9 = RCIsInternalInstall(-[RCDebugOverlay _createOverlayLayerIfNeeded](v8, "_createOverlayLayerIfNeeded"));
    v8->_observingUserDefaults = v9 & v4;
    if ((v9 & v4) == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v8, RCDebugAODOverlay, 1, RCDebugAODOverlay);

    }
  }

  return v8;
}

- (void)_createOverlayLayerIfNeeded
{
  CATextLayer *v3;
  CATextLayer *overlayLayer;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  CATextLayer *v11;

  if (!self->_overlayLayer)
  {
    v3 = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
    overlayLayer = self->_overlayLayer;
    self->_overlayLayer = v3;
    v11 = v3;

    WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(WeakRetained, "bounds");
    -[CATextLayer setBounds:](v11, "setBounds:");

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0)));
    -[CATextLayer setForegroundColor:](v11, "setForegroundColor:", objc_msgSend(v6, "CGColor"));

    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9, 0.0, 0.9, 0.7)));
    -[CATextLayer setBackgroundColor:](v11, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    -[CATextLayer setFontSize:](v11, "setFontSize:", 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = v9;

    -[CATextLayer setRasterizationScale:](v11, "setRasterizationScale:", v10);
    -[CATextLayer setContentsScale:](v11, "setContentsScale:", v10);
    -[CATextLayer setAlignmentMode:](v11, "setAlignmentMode:", kCAAlignmentCenter);
    -[CATextLayer setWrapped:](v11, "setWrapped:", 1);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_observingUserDefaults)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, RCDebugAODOverlay);

  }
  v4.receiver = self;
  v4.super_class = (Class)RCDebugOverlay;
  -[RCDebugOverlay dealloc](&v4, "dealloc");
}

- (void)addToParentView
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layer"));
  objc_msgSend(v3, "addSublayer:", self->_overlayLayer);

}

- (void)removeFromParentView
{
  CATextLayer *overlayLayer;

  overlayLayer = self->_overlayLayer;
  if (overlayLayer)
  {
    -[CATextLayer removeFromSuperlayer](overlayLayer, "removeFromSuperlayer");
    -[CATextLayer setString:](self->_overlayLayer, "setString:", 0);
  }
}

- (void)_removeOverlayLayerIfNeeded
{
  CATextLayer *overlayLayer;
  CATextLayer *v4;

  overlayLayer = self->_overlayLayer;
  if (overlayLayer)
  {
    -[CATextLayer removeFromSuperlayer](overlayLayer, "removeFromSuperlayer");
    v4 = self->_overlayLayer;
    self->_overlayLayer = 0;

  }
}

- (void)updateOverlayLayerStringWithPresentationTime:(id)a3 presentationInterval:(id)a4 elapsedRecordingTime:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bls_shortLoggingString"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bls_shortLoggingString"));
  v12 = RCDebugStringForTimeInterval(a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Presentation time: %@\rPresentation interval: %@\rElapsed time: %@"), v10, v11, v13));
  -[CATextLayer setString:](self->_overlayLayer, "setString:", v14);

  -[CATextLayer displayIfNeeded](self->_overlayLayer, "displayIfNeeded");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)needsUpdateForBoundsChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCDebugOverlay parentView](self, "parentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCDebugOverlay parentView](self, "parentView"));
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v5 + v16;
  v22 = v7 + v14;
  v23 = v9 - (v16 + v20);
  v24 = v11 - v18;
  -[CATextLayer frame](self->_overlayLayer, "frame");
  v30.origin.x = v25;
  v30.origin.y = v26;
  v30.size.width = v27;
  v30.size.height = v28;
  v29.origin.x = v21;
  v29.origin.y = v22;
  v29.size.width = v23;
  v29.size.height = v24;
  if (!CGRectEqualToRect(v29, v30))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
    -[CATextLayer setFrame:](self->_overlayLayer, "setFrame:", v21, v22, v23, v24);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_super v19;

  v11 = a4;
  if ((void *)RCDebugAODOverlay == a6)
  {
    v12 = objc_opt_class(NSUserDefaults, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      if (objc_msgSend(v11, "BOOLForKey:", a6))
      {
        -[RCDebugOverlay _createOverlayLayerIfNeeded](self, "_createOverlayLayerIfNeeded");
        WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
        v15 = objc_msgSend(v14, "activeAppearance");

        if (!v15 && RCSupportsDebugAODOverlay(v16))
        {
          v17 = objc_loadWeakRetained((id *)&self->_parentView);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
          objc_msgSend(v18, "addSublayer:", self->_overlayLayer);

        }
      }
      else
      {
        -[RCDebugOverlay _removeOverlayLayerIfNeeded](self, "_removeOverlayLayerIfNeeded");
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RCDebugOverlay;
    -[RCDebugOverlay observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", a3, v11, a5, a6);
  }

}

- (CATextLayer)overlayLayer
{
  return self->_overlayLayer;
}

- (void)setOverlayLayer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLayer, a3);
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (BOOL)observingUserDefaults
{
  return self->_observingUserDefaults;
}

- (void)setObservingUserDefaults:(BOOL)a3
{
  self->_observingUserDefaults = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_overlayLayer, 0);
}

@end
