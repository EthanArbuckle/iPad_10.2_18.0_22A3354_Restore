@implementation PXGAnimation

- (CASpringAnimation)springAnimation
{
  return self->_springAnimation;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (double)effectiveDuration
{
  double v3;
  double v4;
  float v5;
  float v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  -[PXGAnimation duration](self, "duration");
  v4 = v3;
  if (-[PXGAnimation curve](self, "curve") == 2)
  {
    -[PXGAnimation dampingRatio](self, "dampingRatio");
    v6 = v5;
    -[PXGAnimation duration](self, "duration");
    v8 = v7;
    v9 = -[PXGAnimation numberOfOscillations](self, "numberOfOscillations");
    -[PXGAnimation maximumDistance](self, "maximumDistance");
    PXGDampedSpringMinimumDuration(v9, v6, v8, v10);
    if (v4 < v11)
      return v11;
  }
  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)numberOfOscillations
{
  return self->_numberOfOscillations;
}

- (float)dampingRatio
{
  return self->_dampingRatio;
}

- (int64_t)curve
{
  return self->_curve;
}

- (PXGAnimationDelegate)delegate
{
  PXGAnimationDelegate *delegate;
  PXGAnimationDelegate *v4;
  PXGAnimationDelegate *v5;

  delegate = self->_delegate;
  if (!delegate)
  {
    +[PXGDefaultAnimationDelegate sharedInstance](PXGDefaultAnimationDelegate, "sharedInstance");
    v4 = (PXGAnimationDelegate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_delegate;
    self->_delegate = v4;

    delegate = self->_delegate;
  }
  return delegate;
}

- (PXGTransition)transition
{
  return (PXGTransition *)objc_loadWeakRetained((id *)&self->_transition);
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setToSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_toSnapshot, a3);
}

- (void)setFromSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_fromSnapshot, a3);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (void)setSupportsSpriteTransfer:(BOOL)a3
{
  self->_supportsSpriteTransfer = a3;
}

- (void)setSupportsPresentationAdjustment:(BOOL)a3
{
  self->_supportsPresentationAdjustment = a3;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setDoubleSided:(BOOL)a3
{
  self->_isDoubleSided = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (PXGAnimation)initWithLayout:(id)a3
{
  id v4;
  PXGAnimation *v5;
  PXGAnimation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnimation;
  v5 = -[PXGAnimation init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    v6->_duration = 2.0;
    v6->_dampingRatio = 1.0;
    *(_OWORD *)&v6->_curve = xmmword_1A7BBC430;
    v6->_maximumDistance = 1000.0;
    v6->_springAnimationProgressMultiplier = 1.0;
  }

  return v6;
}

- (BOOL)supportsPresentationAdjustment
{
  return self->_supportsPresentationAdjustment;
}

- (BOOL)isDoubleSided
{
  return self->_isDoubleSided;
}

- (void)noteDidComplete
{
  id v3;

  -[PXGAnimation layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationDidComplete:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
  objc_storeStrong((id *)&self->_springAnimation, 0);
  objc_destroyWeak((id *)&self->_transition);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (PXGAnimation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnimation.m"), 19, CFSTR("%s is not available as initializer"), "-[PXGAnimation init]");

  abort();
}

- (id)description
{
  objc_class *v3;
  double duration;
  __CFString *v5;
  __CFString *v6;
  int64_t scope;
  id WeakRetained;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  duration = self->_duration;
  if (self->_isDoubleSided)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  scope = self->_scope;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transition);
  v9 = objc_loadWeakRetained((id *)&self->_layout);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)&self->_layout);
  -[PXGAnimation delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnimation delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p; duration = %.2f; doubleSided = %@; scope = %ld; transition = %@; layout = <%@: %p>; delegate = <%@: %p>>"),
    v19,
    self,
    *(_QWORD *)&duration,
    v6,
    scope,
    WeakRetained,
    v11,
    v12,
    v15,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setDampingRatio:(float)a3
{
  self->_dampingRatio = a3;
}

- (void)setNumberOfOscillations:(int64_t)a3
{
  self->_numberOfOscillations = a3;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (BOOL)supportsSpriteTransfer
{
  return self->_supportsSpriteTransfer;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setTransition:(id)a3
{
  objc_storeWeak((id *)&self->_transition, a3);
}

- (void)setSpringAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_springAnimation, a3);
}

- (float)springAnimationInitialProgress
{
  return self->_springAnimationInitialProgress;
}

- (void)setSpringAnimationInitialProgress:(float)a3
{
  self->_springAnimationInitialProgress = a3;
}

- (float)springAnimationProgressMultiplier
{
  return self->_springAnimationProgressMultiplier;
}

- (void)setSpringAnimationProgressMultiplier:(float)a3
{
  self->_springAnimationProgressMultiplier = a3;
}

- (PXGLayoutSnapshot)fromSnapshot
{
  return self->_fromSnapshot;
}

- (PXGLayoutSnapshot)toSnapshot
{
  return self->_toSnapshot;
}

@end
