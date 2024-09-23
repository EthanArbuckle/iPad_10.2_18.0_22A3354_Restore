@implementation _UIPanelAnimationState

- (UISlidingBarStateRequest)stateRequest
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  UISlidingBarStateRequest *v8;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  char v25;
  double v26;
  double v27;
  char v28;
  double v29;
  void *v30;
  void *v32;
  double v33;
  double v34;

  -[_UIPanelAnimationState fromRequest](self, "fromRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPanelAnimationState toRequest](self, "toRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPanelAnimationState progress](self, "progress");
  v7 = v6;
  v8 = objc_alloc_init(UISlidingBarStateRequest);
  objc_msgSend(v5, "leadingWidth");
  v10 = v9;
  objc_msgSend(v4, "leadingWidth");
  v12 = v11;
  objc_msgSend(v5, "trailingWidth");
  v14 = v13;
  objc_msgSend(v4, "trailingWidth");
  v16 = v15;
  objc_msgSend(v5, "supplementaryWidth");
  v18 = v17;
  objc_msgSend(v4, "supplementaryWidth");
  v20 = v19;
  v33 = v10;
  v34 = v14;
  v21 = v10 - v12;
  v22 = v14 - v16;
  v23 = v18 - v19;
  -[UISlidingBarStateRequest setLeadingWidth:](v8, "setLeadingWidth:", v12 + v7 * v21);
  -[UISlidingBarStateRequest setTrailingWidth:](v8, "setTrailingWidth:", v16 + v7 * v22);
  -[UISlidingBarStateRequest setSupplementaryWidth:](v8, "setSupplementaryWidth:", v20 + v7 * v23);
  if (-[_UIPanelAnimationState shouldAssignOffscreenWidthsToStateRequest](self, "shouldAssignOffscreenWidthsToStateRequest"))
  {
    if (v7 != 0.0 && v7 != 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPanelController.m"), 285, CFSTR("Unsupported progress value for animated stateRequest"));

    }
    v24 = v23 != 0.0 && v18 > 0.0;
    v25 = v20 > 0.0 && v24;
    if (v21 != 0.0 && (v33 == 0.0 || v12 == 0.0))
    {
      v26 = v33;
      if (v7 > 0.0)
        v26 = v12;
      -[UISlidingBarStateRequest setLeadingOffscreenWidth:](v8, "setLeadingOffscreenWidth:", v26);
    }
    if (v22 != 0.0 && (v34 == 0.0 || v16 == 0.0))
    {
      v27 = v34;
      if (v7 > 0.0)
        v27 = v16;
      -[UISlidingBarStateRequest setTrailingOffscreenWidth:](v8, "setTrailingOffscreenWidth:", v27);
    }
    if (v23 == 0.0)
      v28 = 1;
    else
      v28 = v25;
    if ((v28 & 1) == 0)
    {
      if (v7 <= 0.0)
        v29 = v18;
      else
        v29 = v20;
      -[UISlidingBarStateRequest setSupplementaryOffscreenWidth:](v8, "setSupplementaryOffscreenWidth:", v29);
    }
    if (v7 <= 0.0)
      v30 = v4;
    else
      v30 = v5;
    objc_msgSend(v30, "rubberBandInset");
    -[UISlidingBarStateRequest setRubberBandInset:](v8, "setRubberBandInset:");
  }
  objc_msgSend(v5, "mainWidth");
  -[UISlidingBarStateRequest setMainWidth:](v8, "setMainWidth:");
  -[UISlidingBarStateRequest setUserInitiated:](v8, "setUserInitiated:", objc_msgSend(v5, "userInitiated"));

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPanelAnimationState;
  -[_UIPanelAnimationState description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
    objc_msgSend(v4, "appendFormat:", CFSTR(" from=%p to=%p"), self->_fromRequest, self->_toRequest);
  return v4;
}

+ (id)timingCurveProvider
{
  return objc_alloc_init(UISpringTimingParameters);
}

+ (id)timingCurveProviderWithVelocity:(double)a3
{
  return -[UISpringTimingParameters initWithVelocity:]([UISpringTimingParameters alloc], "initWithVelocity:", a3, a3);
}

+ (double)defaultDuration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "timingCurveProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settlingDuration");
  v4 = v3;

  return v4;
}

- (UISlidingBarStateRequest)fromRequest
{
  return self->_fromRequest;
}

- (void)setFromRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UISlidingBarStateRequest)toRequest
{
  return self->_toRequest;
}

- (void)setToRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)isFinishingAnimation
{
  return self->_isFinishingAnimation;
}

- (void)setFinishingAnimation:(BOOL)a3
{
  self->_isFinishingAnimation = a3;
}

- (int64_t)affectedSides
{
  return self->_affectedSides;
}

- (void)setAffectedSides:(int64_t)a3
{
  self->_affectedSides = a3;
}

- (BOOL)shouldAssignOffscreenWidthsToStateRequest
{
  return self->_shouldAssignOffscreenWidthsToStateRequest;
}

- (void)setShouldAssignOffscreenWidthsToStateRequest:(BOOL)a3
{
  self->_shouldAssignOffscreenWidthsToStateRequest = a3;
}

- (_UIPanelCoordinatingAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (BOOL)animatorShouldCoordinate
{
  return self->_animatorShouldCoordinate;
}

- (void)setAnimatorShouldCoordinate:(BOOL)a3
{
  self->_animatorShouldCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_toRequest, 0);
  objc_storeStrong((id *)&self->_fromRequest, 0);
}

@end
