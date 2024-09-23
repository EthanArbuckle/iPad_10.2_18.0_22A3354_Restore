@implementation PRRenderingBackdropView

- (PRRenderingBackdropView)initWithOwner:(id)a3 scene:(id)a4
{
  PRRenderingBackdropView *v4;
  void *v5;
  uint64_t v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;
  void *v10;
  CASpringAnimation *v11;
  CASpringAnimation *backlightProgressSpringAnimation;
  CASpringAnimation *v13;
  CASpringAnimation *v14;
  CASpringAnimation *v15;
  CASpringAnimation *v16;

  v4 = -[PRRenderingView initWithOwner:scene:level:extensionUserInteractionEnabled:](self, "initWithOwner:scene:level:extensionUserInteractionEnabled:", a3, a4, -3000, 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRenderingBackdropView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v4, sel__displayLinkFired_);
    v6 = objc_claimAutoreleasedReturnValue();
    displayLink = v4->_displayLink;
    v4->_displayLink = (CADisplayLink *)v6;

    v8 = v4->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    +[PRPosterDomain rootSettings](PRPosterDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (CASpringAnimation *)objc_alloc_init(MEMORY[0x1E0CD2848]);
    backlightProgressSpringAnimation = v4->_backlightProgressSpringAnimation;
    v4->_backlightProgressSpringAnimation = v11;

    v13 = v4->_backlightProgressSpringAnimation;
    objc_msgSend(v10, "wakeMass");
    -[CASpringAnimation setMass:](v13, "setMass:");
    v14 = v4->_backlightProgressSpringAnimation;
    objc_msgSend(v10, "wakeDuration");
    -[CASpringAnimation setDuration:](v14, "setDuration:");
    v15 = v4->_backlightProgressSpringAnimation;
    objc_msgSend(v10, "wakeStiffness");
    -[CASpringAnimation setStiffness:](v15, "setStiffness:");
    v16 = v4->_backlightProgressSpringAnimation;
    objc_msgSend(v10, "wakeDamping");
    -[CASpringAnimation setDamping:](v16, "setDamping:");

  }
  return v4;
}

- (void)_displayLinkFired:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  id WeakRetained;

  +[PRPosterDomain rootSettings](PRPosterDomain, "rootSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeDuration");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8 - self->_backlightProgressAnimationStartTimestamp;

  if (v9 / v6 <= 1.0)
    v10 = v9 / v6;
  else
    v10 = 1.0;
  self->_linearBacklightProgress = v10 * self->_targetBacklightProgress
                                 + (1.0 - v10) * self->_backlightProgressFromValue;
  if (BSFloatEqualToFloat())
  {
    self->_backlightProgress = self->_linearBacklightProgress;
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  }
  else
  {
    *(float *)&v11 = v10;
    -[CASpringAnimation _solveForInput:](self->_backlightProgressSpringAnimation, "_solveForInput:", v11);
    self->_backlightProgress = self->_targetBacklightProgress * v12 + (1.0 - v12) * self->_backlightProgressFromValue;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  objc_msgSend(WeakRetained, "updatedValuesForView:", self);

}

- (void)setTargetBacklightProgress:(double)a3 animated:(BOOL)a4
{
  void *v5;
  double v6;
  id WeakRetained;

  if (self->_targetBacklightProgress != a3)
  {
    self->_targetBacklightProgress = a3;
    if (a4)
    {
      self->_backlightProgressFromValue = self->_backlightProgress;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSince1970");
      self->_backlightProgressAnimationStartTimestamp = v6;

      -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
    }
    else
    {
      self->_backlightProgress = a3;
      self->_linearBacklightProgress = a3;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
      objc_msgSend(WeakRetained, "updatedValuesForView:", self);

    }
  }
}

- (void)setTargetBacklightProgress:(double)a3
{
  -[PRRenderingBackdropView setTargetBacklightProgress:animated:](self, "setTargetBacklightProgress:animated:", 0, a3);
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRRenderingBackdropView;
  -[PRRenderingView invalidate](&v4, sel_invalidate);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (double)targetBacklightProgress
{
  return self->_targetBacklightProgress;
}

- (double)backlightProgress
{
  return self->_backlightProgress;
}

- (double)linearBacklightProgress
{
  return self->_linearBacklightProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightProgressSpringAnimation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
