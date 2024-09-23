@implementation SFFloatSpringProperty

- (SFFloatSpringProperty)init
{
  SFFloatSpringProperty *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFFloatSpringProperty;
  result = -[UIViewFloatAnimatableProperty init](&v3, sel_init);
  if (result)
  {
    result->_dampingRatio = 0.86;
    result->_response = 0.55;
    result->_trackingDampingRatio = 0.86;
    result->_trackingResponse = 0.15;
  }
  return result;
}

- (void)setInput:(double)a3
{
  void *v5;
  _BOOL8 tracking;
  _QWORD v7[4];
  id v8[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BEBDB00];
  tracking = self->_tracking;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SFFloatSpringProperty_setInput___block_invoke;
  v7[3] = &unk_24CE0F458;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  objc_msgSend(v5, "_animateUsingSpringBehavior:tracking:animations:completion:", self, tracking, v7, 0);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __34__SFFloatSpringProperty_setInput___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "primed") & 1) != 0)
    goto LABEL_7;
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "presentationValue");
  v6 = v5;
  v7 = *(double *)(a1 + 40);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "presentationValue");
  if (v6 >= v7)
    v10 = v9 - *(double *)(a1 + 40);
  else
    v10 = v7 - v9;

  if (v10 < 1.0)
  {
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "setPrimed:", 1);
LABEL_7:

  }
  v11 = *(double *)(a1 + 40);
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "setValue:", v11);

}

- (void)setOutput:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__SFFloatSpringProperty_setOutput___block_invoke;
  v3[3] = &unk_24CE0ED10;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  +[SFFloatSpringProperty _withoutAnimation:](SFFloatSpringProperty, "_withoutAnimation:", v3);
}

uint64_t __35__SFFloatSpringProperty_setOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", *(double *)(a1 + 40));
}

- (void)setDampingRatio:(double)a3 response:(double)a4
{
  self->_dampingRatio = a3;
  self->_response = a4;
}

- (void)setTrackingDampingRatio:(double)a3 response:(double)a4
{
  self->_trackingDampingRatio = a3;
  self->_trackingResponse = a4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  double v5;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 <= 2)
  {
    v5 = *(double *)((char *)&self->var0 + *off_24CE0F490[a5]);
    retstr->var0 = *(double *)((char *)&self->var0 + *off_24CE0F478[a5]);
    retstr->var1 = v5;
  }
  return self;
}

- (double)projectForDeceleration:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SFFloatSpringProperty output](self, "output");
  v6 = v5;
  -[UIViewFloatAnimatableProperty velocity](self, "velocity");
  return v6 + v7 / 1000.0 * a3 / (1.0 - a3);
}

- (double)projectForTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SFFloatSpringProperty output](self, "output");
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
  v4 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SFFloatSpringProperty__withoutAnimation___block_invoke;
  v6[3] = &unk_24CE0F3C0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

uint64_t __43__SFFloatSpringProperty__withoutAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_performWithoutRetargetingAnimations:", *(_QWORD *)(a1 + 32));
}

- (BOOL)primed
{
  return self->_primed;
}

- (void)setPrimed:(BOOL)a3
{
  self->_primed = a3;
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
