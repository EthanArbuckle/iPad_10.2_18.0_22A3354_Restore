@implementation SBAnimationStepper

- (SBAnimationStepper)init
{
  return -[SBAnimationStepper initWithAnimationSettings:](self, "initWithAnimationSettings:", 0);
}

- (SBAnimationStepper)initWithAnimationSettings:(id)a3
{
  id v4;
  SBAnimationStepper *v5;
  uint64_t v6;
  BSAnimationSettings *animationSettings;
  void *v8;
  void *v9;
  double v10;
  NSMutableSet *v11;
  NSMutableSet *views;
  NSMutableSet *v13;
  NSMutableSet *finishedAnimatingViews;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAnimationStepper;
  v5 = -[SBAnimationStepper init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    animationSettings = v5->_animationSettings;
    v5->_animationSettings = (BSAnimationSettings *)v6;

    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v5->_duration = v10;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    views = v5->_views;
    v5->_views = v11;

    v5->_adjustsDurationForLongestAnimation = 1;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    finishedAnimatingViews = v5->_finishedAnimatingViews;
    v5->_finishedAnimatingViews = v13;

  }
  return v5;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[NSMutableSet count](self->_views, "count") && !self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 74, CFSTR("stepper wasn't invalidated"));

  }
  if (self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 75, CFSTR("Trying to dealloc a SBAnimationStepper but the displayLink is still running"));

  }
  -[SBAnimationStepper invalidate](self, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBAnimationStepper;
  -[SBAnimationStepper dealloc](&v6, sel_dealloc);
}

- (NSArray)views
{
  return (NSArray *)-[NSMutableSet allObjects](self->_views, "allObjects");
}

- (void)startSteppingAnimationsInView:(id)a3
{
  id v5;
  char v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id value;

  v5 = a3;
  if (v5)
  {
    value = v5;
    v6 = -[NSMutableSet containsObject:](self->_views, "containsObject:", v5);
    v5 = value;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(value, "layoutIfNeeded");
      -[NSMutableSet addObject:](self->_views, "addObject:", value);
      objc_msgSend(value, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAnimationStepper _nextCommitTime](self, "_nextCommitTime");
      objc_msgSend(v7, "setBeginTime:");
      LODWORD(v8) = 0;
      objc_msgSend(v7, "setSpeed:", v8);
      objc_msgSend(v7, "beginTime");
      objc_msgSend(v7, "setTimeOffset:");
      if (-[SBAnimationStepper adjustsDurationForLongestAnimation](self, "adjustsDurationForLongestAnimation"))
        -[SBAnimationStepper _adjustDurationForLongestAnimation](self, "_adjustDurationForLongestAnimation");
      objc_msgSend(MEMORY[0x1E0CD26F8], "animation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDuration:", self->_duration);
      objc_msgSend(v9, "setRemovedOnCompletion:", 1);
      objc_msgSend(v9, "setDelegate:", self);
      objc_msgSend(v7, "animationForKey:", CFSTR("SBAnimationStepper"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 117, CFSTR("multiple steppers shouldn't be operating on the same view"));

      }
      objc_msgSend(v7, "addAnimation:forKey:", v9, CFSTR("SBAnimationStepper"));
      objc_msgSend(v7, "animationForKey:", CFSTR("SBAnimationStepper"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(v11, &SBAnimationStepperViewForAnimationKey, value, 0);
      v5 = value;
    }
  }

}

- (void)_adjustDurationForLongestAnimation
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  double v21;
  double duration;
  SBAnimationStepper *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = self->_views;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        -[SBAnimationStepper _makeSubviewTree:fromView:](self, "_makeSubviewTree:fromView:", v3, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }
  v24 = self;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    v12 = 0.0;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "layer", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v14, "animationKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v14, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "duration");
              if (fabs(v21) != INFINITY && v21 > v12)
                v12 = v21;

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v17);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  duration = v24->_duration;
  if (v12 >= duration)
    duration = v12;
  v24->_duration = duration;

}

- (void)_makeSubviewTree:(id)a3 fromView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a4, "subviews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "addObject:", v12);
        -[SBAnimationStepper _makeSubviewTree:fromView:](self, "_makeSubviewTree:fromView:", v6, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)invalidate
{
  NSMutableSet *views;
  CADisplayLink *displayLink;
  id completion;
  _QWORD v6[6];

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    views = self->_views;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__SBAnimationStepper_invalidate__block_invoke;
    v6[3] = &unk_1E8EAEC40;
    v6[4] = self;
    v6[5] = a2;
    -[NSMutableSet enumerateObjectsUsingBlock:](views, "enumerateObjectsUsingBlock:", v6);
    -[NSMutableSet removeAllObjects](self->_views, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_finishedAnimatingViews, "removeAllObjects");
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    completion = self->_completion;
    self->_completion = 0;

  }
}

void __32__SBAnimationStepper_invalidate__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v9, "setSpeed:", v3);
  objc_msgSend(v9, "setBeginTime:", 0.0);
  objc_msgSend(v9, "setTimeOffset:", 0.0);
  objc_msgSend(v9, "animationForKey:", CFSTR("SBAnimationStepper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);

    if (v6 != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBAnimationStepper.m"), 171, CFSTR("this animation better be our own"));

    }
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("SBAnimationStepper"));
  }

}

- (void)finishSteppingForwardToEndWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id completion;
  CADisplayLink *displayLink;
  NSMutableSet *views;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v5 = a3;
  v13 = v5;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 185, CFSTR("object already invalidated"));

    v5 = v13;
  }
  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 186, CFSTR("can't complete multiple times"));

    v5 = v13;
  }
  self->_finishingForward = 1;
  v6 = (void *)objc_msgSend(v5, "copy", v13);
  completion = self->_completion;
  self->_completion = v6;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[SBAnimationStepper _nextCommitTime](self, "_nextCommitTime");
  views = self->_views;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__SBAnimationStepper_finishSteppingForwardToEndWithCompletion___block_invoke;
  v15[3] = &__block_descriptor_40_e20_v24__0__UIView_8_B16l;
  v15[4] = v10;
  -[NSMutableSet enumerateObjectsUsingBlock:](views, "enumerateObjectsUsingBlock:", v15);
  -[SBAnimationStepper _checkForCompletion](self, "_checkForCompletion");

}

void __63__SBAnimationStepper_finishSteppingForwardToEndWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBeginTime:", *(double *)(a1 + 32));
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setSpeed:", v3);

}

- (void)finishSteppingBackwardToStartWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id completion;
  double v9;
  double percentage;
  double v11;
  CADisplayLink *v12;
  CADisplayLink *displayLink;
  CADisplayLink *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 205, CFSTR("object already invalidated"));

  }
  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 206, CFSTR("can't complete multiple times"));

  }
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAnimationStepper.m"), 207, CFSTR("Trying to call this but the mainRunLoop != currentRunLoop: %@"), v19);

  }
  self->_finishingBackward = 1;
  v7 = (void *)objc_msgSend(v20, "copy");
  completion = self->_completion;
  self->_completion = v7;

  v9 = CACurrentMediaTime();
  percentage = self->_percentage;
  v11 = self->_duration * percentage;
  self->_finishBackwardTimestamp = v9;
  self->_finishBackwardDuration = v11;
  self->_finishBackwardPercentage = percentage;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFiredForBackwardToStart_);
  v12 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v12;

  v14 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

  -[SBAnimationStepper _displayLinkFiredForBackwardToStart:](self, "_displayLinkFiredForBackwardToStart:", 0);
}

- (void)_checkForCompletion
{
  uint64_t v3;
  CADisplayLink *displayLink;
  void (**completion)(id, uint64_t);
  id v6;

  v3 = -[NSMutableSet count](self->_finishedAnimatingViews, "count");
  if (v3 == -[NSMutableSet count](self->_views, "count"))
  {
    self->_completed = 1;
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    completion = (void (**)(id, uint64_t))self->_completion;
    if (completion)
    {
      completion[2](completion, 1);
      v6 = self->_completion;
      self->_completion = 0;

    }
  }
}

- (void)_updateAnimationSteppingTarget:(double)a3
{
  self->_animatedSteppingTargetPercent = fmin(fmax(a3, 0.0), 1.0);
}

- (void)_setStepPercentage:(double)a3
{
  NSMutableSet *views;
  _QWORD v4[5];

  self->_percentage = fmin(fmax(a3, 0.0), 1.0);
  views = self->_views;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SBAnimationStepper__setStepPercentage___block_invoke;
  v4[3] = &unk_1E8EAEC88;
  v4[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](views, "enumerateObjectsUsingBlock:", v4);
}

void __41__SBAnimationStepper__setStepPercentage___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  objc_msgSend(a2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v5, "setSpeed:", v3);
  objc_msgSend(v5, "beginTime");
  objc_msgSend(v5, "setTimeOffset:", v4 + *(double *)(*(_QWORD *)(a1 + 32) + 120) * *(double *)(*(_QWORD *)(a1 + 32) + 48));

}

- (void)_displayLinkFired:(id)a3
{
  id v4;
  CFTimeInterval v5;
  double animatedSteppingTargetPercent;
  double percentage;
  double duration;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  CADisplayLink *displayLink;
  id v15;

  v4 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    v15 = v4;
    v5 = CACurrentMediaTime();
    animatedSteppingTargetPercent = self->_animatedSteppingTargetPercent;
    percentage = self->_percentage;
    duration = self->_duration;
    v9 = duration * vabdd_f64(animatedSteppingTargetPercent, percentage);
    v10 = percentage
        + (animatedSteppingTargetPercent - percentage)
        * fmin(fmax((v5 - self->_animatedSteppingTimestamp)/ (duration* vabdd_f64(animatedSteppingTargetPercent, self->_animatedSteppingStartPercent)), 0.0), 1.0);
    if (v15)
    {
      objc_msgSend(v15, "duration");
      v12 = v11;
    }
    else
    {
      v12 = 0.017;
    }
    v13 = BSFloatEqualToFloat();
    if (v9 <= v12 || v13)
    {
      self->_animatingToStepPercent = 0;
      -[CADisplayLink invalidate](self->_displayLink, "invalidate");
      displayLink = self->_displayLink;
      self->_displayLink = 0;

      v10 = self->_animatedSteppingTargetPercent;
    }
    -[SBAnimationStepper _setStepPercentage:](self, "_setStepPercentage:", v10);
    v4 = v15;
  }

}

- (void)_displayLinkFiredForBackwardToStart:(id)a3
{
  id v4;
  NSMutableSet *views;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    v6 = v4;
    -[SBAnimationStepper _setStepPercentage:](self, "_setStepPercentage:", self->_finishBackwardPercentage* (1.0 - (CACurrentMediaTime() - self->_finishBackwardTimestamp) / self->_finishBackwardDuration));
    views = self->_views;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke;
    v7[3] = &unk_1E8EAEC88;
    v7[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](views, "enumerateObjectsUsingBlock:", v7);
    -[SBAnimationStepper _checkForCompletion](self, "_checkForCompletion");
    v4 = v6;
  }

}

void __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeOffset");
  v5 = v4;
  objc_msgSend(v3, "beginTime");
  if (v5 <= v6 + 0.00000011920929)
  {
    objc_msgSend(v3, "beginTime");
    objc_msgSend(v3, "setTimeOffset:");
    objc_msgSend(v7, "sb_removeAnimationsIncludingSubviews:predicate:", 1, &__block_literal_global_162);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v7);
  }

}

uint64_t __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRemovedOnCompletion");
}

- (double)_nextCommitTime
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "valueForKey:", *MEMORY[0x1E0CD3158]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  if ((BSFloatIsZero() & 1) != 0)
    v3 = CACurrentMediaTime();
  else
    objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    v7 = v5;
    objc_getAssociatedObject(v5, &SBAnimationStepperViewForAnimationKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableSet addObject:](self->_finishedAnimatingViews, "addObject:", v6);
      -[SBAnimationStepper _checkForCompletion](self, "_checkForCompletion");
    }

    v5 = v7;
  }

}

- (BOOL)isStepped
{
  return 1;
}

- (void)setStepPercentage:(double)a3
{
  if (!self->_invalidated && !self->_completed)
  {
    if (self->_animatingToStepPercent)
      -[SBAnimationStepper _updateAnimationSteppingTarget:](self, "_updateAnimationSteppingTarget:", a3);
    else
      -[SBAnimationStepper _setStepPercentage:](self, "_setStepPercentage:", a3);
  }
}

- (double)stepPercentage
{
  return self->_percentage;
}

- (void)finishSteppingForwardToEnd
{
  -[SBAnimationStepper finishSteppingForwardToEndWithCompletion:](self, "finishSteppingForwardToEndWithCompletion:", 0);
}

- (void)finishSteppingBackwardToStart
{
  -[SBAnimationStepper finishSteppingBackwardToStartWithCompletion:](self, "finishSteppingBackwardToStartWithCompletion:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAnimationStepper succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAnimationStepper descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBAnimationStepper *v11;

  v4 = a3;
  -[SBAnimationStepper succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("settings"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "views");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v4, CFSTR("views"), 1, &__block_literal_global_38_0);

}

uint64_t __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", a2);
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)adjustsDurationForLongestAnimation
{
  return self->_adjustsDurationForLongestAnimation;
}

- (void)setAdjustsDurationForLongestAnimation:(BOOL)a3
{
  self->_adjustsDurationForLongestAnimation = a3;
}

- (double)finishSpeed
{
  return self->_finishSpeed;
}

- (void)setFinishSpeed:(double)a3
{
  self->_finishSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_finishedAnimatingViews, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
