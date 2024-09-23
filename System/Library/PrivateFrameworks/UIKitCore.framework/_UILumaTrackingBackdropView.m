@implementation _UILumaTrackingBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  unint64_t backgroundLuminanceLevel;
  unint64_t v7;
  id WeakRetained;
  id v9;
  id v10;

  if (!self)
    return;
  backgroundLuminanceLevel = self->_backgroundLuminanceLevel;
  if (BSFloatGreaterThanOrEqualToFloat())
    goto LABEL_3;
  if (BSFloatLessThanOrEqualToFloat())
    goto LABEL_5;
  if (self->_backgroundLuminanceLevel)
    goto LABEL_7;
  if (BSFloatGreaterThanOrEqualToFloat())
LABEL_3:
    v7 = 1;
  else
LABEL_5:
    v7 = 2;
  self->_backgroundLuminanceLevel = v7;
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)&self->_groupDelegate);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_groupDelegate);
    objc_msgSend(v10, "backgroundLumaView:didChangeLuma:", self, a4);
LABEL_9:

    return;
  }
  if (self->_backgroundLuminanceLevel != backgroundLuminanceLevel)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "backgroundLumaView:didTransitionToLevel:", self, self->_backgroundLuminanceLevel);
      goto LABEL_9;
    }
  }
}

- (void)setTransitionBoundaries:(id)a3
{
  self->_transitionBoundaries = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    -[_UILumaTrackingBackdropView _backdropLayer](self, "_backdropLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTracksLuma:", !v3);

  }
}

- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3
{
  id WeakRetained;

  if (self->_paused)
  {
    if (a3)
    {
      if (self->_backgroundLuminanceLevel != a3)
      {
        self->_backgroundLuminanceLevel = a3;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "backgroundLumaView:didTransitionToLevel:", self, self->_backgroundLuminanceLevel);

      }
    }
    -[_UILumaTrackingBackdropView setPaused:](self, "setPaused:", 0);
  }
}

- (_UILumaTrackingBackdropView)initWithTransitionBoundaries:(id)a3 delegate:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double var1;
  double var0;
  id v12;
  _UILumaTrackingBackdropView *v13;
  _UILumaTrackingBackdropView *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  var1 = a3.var1;
  var0 = a3.var0;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_UILumaTrackingBackdropView;
  v13 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    v14->_backgroundLuminanceLevel = 0;
    v14->_transitionBoundaries.minimum = var0;
    v14->_transitionBoundaries.maximum = var1;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_paused = 1;
    -[_UILumaTrackingBackdropView _backdropLayer](v14, "_backdropLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCaptureOnly:", 1);

    -[_UILumaTrackingBackdropView _backdropLayer](v14, "_backdropLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScale:", 0.5);

  }
  return v14;
}

- (unint64_t)backgroundLuminanceLevel
{
  return self->_backgroundLuminanceLevel;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_transitionBoundaries.minimum;
  maximum = self->_transitionBoundaries.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (_UILumaTrackingBackdropViewDelegate)delegate
{
  return (_UILumaTrackingBackdropViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPaused
{
  return self->_paused;
}

@end
