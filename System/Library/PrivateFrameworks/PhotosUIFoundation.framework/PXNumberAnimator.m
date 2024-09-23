@implementation PXNumberAnimator

- (PXNumberAnimator)init
{
  return -[PXNumberAnimator initWithValue:](self, "initWithValue:", 0.0);
}

- (PXNumberAnimator)initWithValue:(double)a3
{
  return -[PXNumberAnimator initWithValue:epsilon:](self, "initWithValue:epsilon:", a3, 0.001);
}

- (PXNumberAnimator)initWithValue:(double)a3 epsilon:(double)a4
{
  PXNumberAnimator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXNumberAnimator;
  result = -[PXObservable init](&v7, sel_init);
  if (result)
  {
    result->_presentationValue = a3;
    result->_value = a3;
    result->_epsilon = a4;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNumberAnimator label](self, "label");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_2514D17B8;
  -[PXNumberAnimator value](self, "value");
  v10 = v9;
  -[PXNumberAnimator presentationValue](self, "presentationValue");
  v12 = v11;
  v13 = -[PXNumberAnimator isAnimating](self, "isAnimating");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  v15 = v14;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; %@ value:%.3f presentationValue:%.3f isAnimating:%@ animations:%lu>"),
    v5,
    self,
    v8,
    v10,
    v12,
    v15,
    -[NSMutableArray count](self->_animations, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (void)performChangesWithoutAnimation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__PXNumberAnimator_performChangesWithoutAnimation___block_invoke;
  v6[3] = &unk_2514D0B20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXNumberAnimator performChanges:](self, "performChanges:", v6);

}

- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  double v12;
  int64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__PXNumberAnimator_performChangesWithDuration_curve_changes___block_invoke;
  v10[3] = &unk_2514D0B70;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[PXNumberAnimator performChanges:](self, "performChanges:", v10);

}

- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(double)a3 changes:(id)a4
{
  -[PXNumberAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](self, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", a4, 300.0, 1.0, a3);
}

- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(double)a5 changes:(id)a6
{
  id v10;
  double v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  double v16;
  double v17;
  double v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = fabs(a5);
  if (v11 >= INFINITY && v11 <= INFINITY)
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a5;
      _os_log_error_impl(&dword_24430E000, v12, OS_LOG_TYPE_ERROR, "Invalid initial velocity:%.3f correcting...", buf, 0xCu);
    }

    a5 = 0.0;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__PXNumberAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke;
  v14[3] = &unk_2514D06C8;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[PXNumberAnimator performChanges:](self, "performChanges:", v14);

}

- (void)performChangesUsingDefaultOpacityAnimation:(id)a3
{
  -[PXNumberAnimator performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:](self, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", a3, 0.0);
}

- (BOOL)isAnimating
{
  return self->_displayLink != 0;
}

- (double)approximateVelocity
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_animations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "approximateVelocity", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)_setPresentationValue:(double)a3
{
  if (self->_presentationValue != a3)
  {
    self->_presentationValue = a3;
    -[PXObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setAnimating:(BOOL)a3
{
  -[PXNumberAnimator _setAnimating:deferredStart:](self, "_setAnimating:deferredStart:", a3, 1);
}

- (void)_setAnimating:(BOOL)a3 deferredStart:(BOOL)a4
{
  PXDisplayLink *displayLink;
  BOOL v6;
  _BOOL8 v7;
  PXDisplayLink *v8;
  PXDisplayLink *reusableDisplayLink;
  PXDisplayLink *v10;

  displayLink = self->_displayLink;
  if ((displayLink != 0) != a3)
  {
    if (displayLink)
      v6 = 1;
    else
      v6 = !a3;
    if (v6)
    {
      if (!displayLink || a3)
        goto LABEL_18;
      if (-[PXNumberAnimator prepareForAnimation](self, "prepareForAnimation"))
        objc_storeStrong((id *)&self->_reusableDisplayLink, self->_displayLink);
      else
        -[PXDisplayLink invalidate](self->_displayLink, "invalidate");
      v8 = 0;
    }
    else
    {
      v7 = a4;
      v8 = self->_reusableDisplayLink;
      reusableDisplayLink = self->_reusableDisplayLink;
      self->_reusableDisplayLink = 0;

      if (!v8)
      {
        -[PXNumberAnimator _createDisplayLinkDeferredStart:](self, "_createDisplayLinkDeferredStart:", v7);
        v8 = (PXDisplayLink *)objc_claimAutoreleasedReturnValue();
      }
      -[PXNumberAnimator _configureDisplayLink:](self, "_configureDisplayLink:", v8);
    }
    v10 = self->_displayLink;
    self->_displayLink = v8;

LABEL_18:
    -[PXObservable signalChange:](self, "signalChange:", 4, a4);
  }
}

- (id)_createDisplayLinkDeferredStart:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  PXNumberAnimator *v7;
  PXNumberAnimator *v8;
  PXDisplayLink *v9;

  v3 = a3;
  -[PXNumberAnimator displayLinkTarget](self, "displayLinkTarget");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (PXNumberAnimator *)v5;
  else
    v7 = self;
  v8 = v7;

  v9 = -[PXDisplayLink initWithWeakTarget:selector:deferredStart:]([PXDisplayLink alloc], "initWithWeakTarget:selector:deferredStart:", v8, sel_handleDisplayLink_, v3);
  return v9;
}

- (void)_configureDisplayLink:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[PXNumberAnimator highFrameRateReason](self, "highFrameRateReason");
  objc_msgSend(v6, "setHighFrameRateReason:", v4);
  if ((_DWORD)v4)
    v5 = 3;
  else
    v5 = 2;
  objc_msgSend(v6, "setFrameRateRangeType:", v5);

}

- (void)setPrepareForAnimation:(BOOL)a3
{
  PXDisplayLink *reusableDisplayLink;
  PXDisplayLink *v5;
  PXDisplayLink *v6;

  if (self->_prepareForAnimation != a3)
  {
    self->_prepareForAnimation = a3;
    reusableDisplayLink = self->_reusableDisplayLink;
    if (!a3)
    {
      if (!reusableDisplayLink)
        return;
      -[PXDisplayLink invalidate](reusableDisplayLink, "invalidate");
      v5 = 0;
      goto LABEL_8;
    }
    if (!reusableDisplayLink && !self->_displayLink)
    {
      -[PXNumberAnimator _createDisplayLinkDeferredStart:](self, "_createDisplayLinkDeferredStart:", 0);
      v5 = (PXDisplayLink *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = self->_reusableDisplayLink;
      self->_reusableDisplayLink = v5;

    }
  }
}

- (void)handleDisplayLink:(id)a3
{
  objc_super v3;
  _QWORD v4[5];

  if (self->_displayLink == a3)
  {
    v4[1] = 3221225472;
    v4[2] = __38__PXNumberAnimator_handleDisplayLink___block_invoke;
    v4[3] = &unk_2514D06F0;
    v4[4] = self;
    v3.receiver = self;
    v3.super_class = (Class)PXNumberAnimator;
    v4[0] = MEMORY[0x24BDAC760];
    -[PXObservable performChanges:](&v3, sel_performChanges_, v4);
  }
}

- (void)performChanges:(id)a3
{
  id v4;
  BOOL isBeingMutated;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  isBeingMutated = self->_isBeingMutated;
  self->_isBeingMutated = 1;
  v8[1] = 3221225472;
  v8[2] = __35__PXNumberAnimator_performChanges___block_invoke;
  v8[3] = &unk_2514D0718;
  v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)PXNumberAnimator;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v4;
  -[PXObservable performChanges:](&v7, sel_performChanges_, v8);
  self->_isBeingMutated = isBeingMutated;

}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXNumberAnimator;
  -[PXObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[PXNumberAnimator _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setValue:(double)a3 skipFirstNumberWhenAnimationStart:(BOOL)a4
{
  self->_skipFirstNumberWhenAnimationStart = a4;
  -[PXNumberAnimator setValue:](self, "setValue:", a3);
}

- (void)setValue:(double)a3
{
  -[PXNumberAnimator setValue:animateImmediately:](self, "setValue:animateImmediately:", 0, a3);
}

- (void)setValue:(double)a3 animateImmediately:(BOOL)a4
{
  _BOOL4 v4;
  double value;
  int64_t type;
  double v10;
  void *v11;
  __objc2_class *v12;
  id v13;
  __int128 v14;
  void *v15;
  NSMutableArray *animations;
  NSMutableArray *v17;
  NSMutableArray *v18;
  _OWORD v19[3];
  double initialVelocity;

  v4 = a4;
  value = self->_value;
  self->_value = a3;
  if (!-[PXNumberAnimator prepareForAnimation](self, "prepareForAnimation") || !v4)
    -[PXNumberAnimator _invalidatePresentationValue](self, "_invalidatePresentationValue");
  type = self->_currentAnimationSpec.type;
  if (type == 1)
  {
    -[NSMutableArray removeAllObjects](self->_animations, "removeAllObjects");
    goto LABEL_19;
  }
  v10 = value - a3;
  switch(type)
  {
    case 2:
      if (self->_currentAnimationSpec.duration <= 0.0)
        goto LABEL_19;
      v12 = PXValueDefaultAnimation;
      break;
    case 3:
      v12 = PXValueSpringAnimation;
      break;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNumberAnimator.m"), 265, CFSTR("unexpected animation type"));

      abort();
    default:
      goto LABEL_19;
  }
  v13 = [v12 alloc];
  v14 = *(_OWORD *)&self->_currentAnimationSpec.curve;
  v19[0] = *(_OWORD *)&self->_currentAnimationSpec.type;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&self->_currentAnimationSpec.stiffness;
  initialVelocity = self->_currentAnimationSpec.initialVelocity;
  v15 = (void *)objc_msgSend(v13, "initWithFromValue:currentMediaTime:spec:", v19, v10, 0.0);
  if (v15)
  {
    if (v4)
      -[PXNumberAnimator _setAnimating:deferredStart:](self, "_setAnimating:deferredStart:", 1, 0);
    animations = self->_animations;
    if (!animations)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v18 = self->_animations;
      self->_animations = v17;

      animations = self->_animations;
    }
    -[NSMutableArray addObject:](animations, "addObject:", v15);

  }
LABEL_19:
  -[PXObservable signalChange:](self, "signalChange:", 1);
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.presentationValue;
}

- (void)_setNeedsUpdate
{
  -[PXObservable signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXNumberAnimator _needsUpdate](self, "_needsUpdate"))
  {
    -[PXNumberAnimator _updatePresentationValueIfNeeded](self, "_updatePresentationValueIfNeeded");
    if (-[PXNumberAnimator _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNumberAnimator.m"), 316, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_invalidatePresentationValue
{
  self->_needsUpdateFlags.presentationValue = 1;
  -[PXNumberAnimator _needsUpdate](self, "_needsUpdate");
}

- (void)_updatePresentationValueIfNeeded
{
  _BOOL4 skipFirstNumberWhenAnimationStart;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  void *v21;
  PXNumberAnimator *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  PXNumberAnimator *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_needsUpdateFlags.presentationValue)
  {
    self->_needsUpdateFlags.presentationValue = 0;
    skipFirstNumberWhenAnimationStart = self->_skipFirstNumberWhenAnimationStart;
    v4 = 0.0;
    if (self->_skipFirstNumberWhenAnimationStart)
    {
      self->_skipFirstNumberWhenAnimationStart = 0;
      if (-[NSMutableArray count](self->_animations, "count"))
      {
        if (!-[PXNumberAnimator isAnimating](self, "isAnimating"))
        {
          -[PXNumberAnimator _setAnimating:deferredStart:](self, "_setAnimating:deferredStart:", 1, 0);
          v4 = (float)(1.0
                     / (float)-[PXDisplayLink preferredFramesPerSecond](self->_displayLink, "preferredFramesPerSecond"));
        }
      }
    }
    -[PXDisplayLink targetTimestamp](self->_displayLink, "targetTimestamp");
    v6 = v5;
    if (skipFirstNumberWhenAnimationStart || v5 != 0.0)
    {
      -[PXDisplayLink currentMediaTime](self->_displayLink, "currentMediaTime");
      if (v7 > v6)
        v6 = v7;
    }
    -[PXNumberAnimator value](self, "value");
    v9 = v8;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = (void *)-[NSMutableArray copy](self->_animations, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v14 = v6 - v4;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "startTime");
          if (v6 > 0.0 && v17 == 0.0)
          {
            v18 = -[PXNumberAnimator prepareForAnimation](self, "prepareForAnimation");
            v19 = v14;
            if (v18)
            {
              -[PXDisplayLink timestamp](self->_displayLink, "timestamp", v14);
              if (v19 == 0.0)
                v19 = v6;
            }
            objc_msgSend(v16, "setStartTime:", v19);
          }
          objc_msgSend(v16, "setCurrentMediaTime:", v6);
          if (objc_msgSend(v16, "completed"))
          {
            -[NSMutableArray removeObject:](self->_animations, "removeObject:", v16);
          }
          else
          {
            objc_msgSend(v16, "currentValue");
            v9 = v9 + v20;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    -[PXNumberAnimator _setPresentationValue:](self, "_setPresentationValue:", v9);
    self->_currentTime = v6;
    -[PXNumberAnimator _setAnimating:](self, "_setAnimating:", -[NSMutableArray count](self->_animations, "count") != 0);
    -[PXNumberAnimator label](self, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNumberAnimator value](self, "value");
    -[PXNumberAnimator presentationValue](self, "presentationValue");
    -[NSMutableArray count](self->_animations, "count");
    v22 = self;
    v23 = v21;
    if (kdebug_is_enabled())
    {
      v29 = v22;
      if (v23)
      {
        v24 = objc_retainAutorelease(v23);
        objc_msgSend(v24, "cStringUsingEncoding:", 4);
        objc_msgSend(v24, "length");
        __memcpy_chk();
      }
      kdebug_trace();
    }

  }
}

- (BOOL)prepareForAnimation
{
  return self->_prepareForAnimation;
}

- (double)value
{
  return self->_value;
}

- (double)presentationValue
{
  return self->_presentationValue;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (BOOL)isBeingMutated
{
  return self->_isBeingMutated;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (PXNumberAnimatorDisplayLinkTarget)displayLinkTarget
{
  return (PXNumberAnimatorDisplayLinkTarget *)objc_loadWeakRetained((id *)&self->_displayLinkTarget);
}

- (void)setDisplayLinkTarget:(id)a3
{
  objc_storeWeak((id *)&self->_displayLinkTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLinkTarget);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_reusableDisplayLink, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

uint64_t __35__PXNumberAnimator_performChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__PXNumberAnimator_handleDisplayLink___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePresentationValue");
}

__n128 __105__PXNumberAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke(_QWORD *a1, void *a2)
{
  __int128 *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __n128 v11;
  uint64_t v12;

  v3 = (__int128 *)(a1[4] + 104);
  v9 = *v3;
  v10 = *(_OWORD *)(a1[4] + 120);
  v11 = *(__n128 *)(a1[4] + 136);
  v12 = *(_QWORD *)(a1[4] + 152);
  *(_QWORD *)v3 = 3;
  *(_QWORD *)(a1[4] + 136) = a1[6];
  *(_QWORD *)(a1[4] + 144) = a1[7];
  *(_QWORD *)(a1[4] + 152) = a1[8];
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v4, "epsilon");
  *(_QWORD *)(a1[4] + 128) = v6;
  (*(void (**)(void))(a1[5] + 16))();

  v7 = a1[4] + 104;
  *(_OWORD *)v7 = v9;
  *(_OWORD *)(v7 + 16) = v10;
  result = v11;
  *(__n128 *)(v7 + 32) = v11;
  *(_QWORD *)(v7 + 48) = v12;
  return result;
}

__n128 __61__PXNumberAnimator_performChangesWithDuration_curve_changes___block_invoke(_QWORD *a1)
{
  __int128 *v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __n128 v7;
  uint64_t v8;

  v2 = (__int128 *)(a1[4] + 104);
  v5 = *v2;
  v6 = *(_OWORD *)(a1[4] + 120);
  v7 = *(__n128 *)(a1[4] + 136);
  v8 = *(_QWORD *)(a1[4] + 152);
  *(_QWORD *)v2 = 2;
  *(_QWORD *)(a1[4] + 112) = a1[6];
  *(_QWORD *)(a1[4] + 120) = a1[7];
  (*(void (**)(void))(a1[5] + 16))();
  v3 = a1[4] + 104;
  *(_OWORD *)v3 = v5;
  *(_OWORD *)(v3 + 16) = v6;
  result = v7;
  *(__n128 *)(v3 + 32) = v7;
  *(_QWORD *)(v3 + 48) = v8;
  return result;
}

__n128 __51__PXNumberAnimator_performChangesWithoutAnimation___block_invoke(uint64_t a1)
{
  __int128 *v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __n128 v7;
  uint64_t v8;

  v2 = (__int128 *)(*(_QWORD *)(a1 + 32) + 104);
  v5 = *v2;
  v6 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v7 = *(__n128 *)(*(_QWORD *)(a1 + 32) + 136);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  *(_QWORD *)v2 = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 32) + 104;
  *(_OWORD *)v3 = v5;
  *(_OWORD *)(v3 + 16) = v6;
  result = v7;
  *(__n128 *)(v3 + 32) = v7;
  *(_QWORD *)(v3 + 48) = v8;
  return result;
}

@end
