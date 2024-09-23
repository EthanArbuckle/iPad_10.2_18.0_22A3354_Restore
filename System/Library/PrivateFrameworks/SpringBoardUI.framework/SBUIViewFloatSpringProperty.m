@implementation SBUIViewFloatSpringProperty

- (SBUIViewFloatSpringProperty)init
{
  SBUIViewFloatSpringProperty *v2;
  SBUIViewFloatSpringProperty *v3;
  SBUIViewFloatSpringProperty *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIViewFloatSpringProperty;
  v2 = -[UIViewFloatAnimatableProperty init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dampingRatio = 0.86;
    v2->_response = 0.55;
    v2->_impulse = 0.0;
    v2->_trackingDampingRatio = 0.86;
    v2->_trackingResponse = 0.15;
    v2->_trackingImpulse = 0.0;
    v4 = v2;
  }

  return v3;
}

- (void)setInput:(double)a3
{
  void (**v5)(_QWORD);
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SBUIViewFloatSpringProperty_setInput___block_invoke;
  v6[3] = &unk_24D4D05C8;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  v5 = (void (**)(_QWORD))MEMORY[0x2199F42EC](v6);
  if (objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled"))
    objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingSpringBehavior:tracking:animations:completion:", self, self->_tracking, v5, 0);
  else
    v5[2](v5);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __40__SBUIViewFloatSpringProperty_setInput___block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setValue:", v1);

}

- (void)setOutput:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__SBUIViewFloatSpringProperty_setOutput___block_invoke;
  v3[3] = &unk_24D4CFFA8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  +[SBUIViewFloatSpringProperty _withoutAnimation:](SBUIViewFloatSpringProperty, "_withoutAnimation:", v3);
}

uint64_t __41__SBUIViewFloatSpringProperty_setOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInput:", *(double *)(a1 + 40));
}

- (void)setDampingRatio:(double)a3 response:(double)a4
{
  self->_dampingRatio = a3;
  self->_response = a4;
}

- (void)setDampingRatio:(double)a3 response:(double)a4 impulse:(double)a5
{
  self->_dampingRatio = a3;
  self->_impulse = a5;
  self->_response = a4;
}

- (void)setTrackingDampingRatio:(double)a3 response:(double)a4
{
  self->_trackingDampingRatio = a3;
  self->_trackingResponse = a4;
}

- (void)setTrackingDampingRatio:(double)a3 response:(double)a4 impulse:(double)a5
{
  self->_trackingDampingRatio = a3;
  self->_trackingImpulse = a5;
  self->_trackingResponse = a4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  int *v5;
  double v6;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 <= 2)
  {
    v5 = off_24D4D0640[a5];
    v6 = *(double *)((char *)&self->var0 + *off_24D4D0628[a5]);
    retstr->var0 = *(double *)((char *)&self->var0 + *off_24D4D0610[a5]);
    retstr->var1 = v6;
    retstr->var10 = *(double *)((char *)&self->var0 + *v5);
  }
  return self;
}

- (double)projectForDeceleration:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SBUIViewFloatSpringProperty output](self, "output");
  v6 = v5;
  -[UIViewFloatAnimatableProperty velocity](self, "velocity");
  return v6 + v7 / 1000.0 * a3 / (1.0 - a3);
}

- (double)projectForTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SBUIViewFloatSpringProperty output](self, "output");
  v6 = v5;
  -[UIViewFloatAnimatableProperty velocity](self, "velocity");
  return v6 + v7 * a3;
}

+ (void)_withoutAnimation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SBUIViewFloatSpringProperty__withoutAnimation___block_invoke;
  v6[3] = &unk_24D4D05F0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

uint64_t __49__SBUIViewFloatSpringProperty__withoutAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDF6F90], "_performWithoutRetargetingAnimations:", *(_QWORD *)(a1 + 32));
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

@end
