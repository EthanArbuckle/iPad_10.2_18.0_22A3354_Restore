@implementation _SBProximityTouchHandlingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  double statusBarHeight;
  _SBProximityTouchHandlingView *v14;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x1E0C80C00];
  BSFloatLessThanOrEqualToFloat();
  if (!BSFloatGreaterThanOrEqualToFloat())
    goto LABEL_5;
  if (!BSFloatLessThanFloat())
    goto LABEL_5;
  -[_SBProximityTouchHandlingView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = BSFloatLessThanFloat();

  if (v9)
  {
    -[_SBProximityTouchHandlingView delegate]((id *)&self->super.super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didHitAllowedRegion:", x, y);

    v11 = 1;
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  SBLogProximitySensor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    statusBarHeight = self->_statusBarHeight;
    v16 = 134218752;
    v17 = x;
    v18 = 2048;
    v19 = y;
    v20 = 1024;
    v21 = v11;
    v22 = 2048;
    v23 = statusBarHeight;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Prox hit test (%g,%g) - hitStatusBar:%{BOOL}u (statusBarHeight:%g)", (uint8_t *)&v16, 0x26u);
  }

  if (v11)
    v14 = 0;
  else
    v14 = self;
  return v14;
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
  return WeakRetained;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 52, a2);
  return result;
}

- (double)statusBarHeight
{
  if (a1)
    return *(double *)(a1 + 424);
  else
    return 0.0;
}

- (uint64_t)setStatusBarHeight:(uint64_t)result
{
  if (result)
    *(double *)(result + 424) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
