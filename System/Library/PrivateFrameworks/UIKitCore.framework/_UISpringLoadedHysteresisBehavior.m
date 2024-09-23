@implementation _UISpringLoadedHysteresisBehavior

- (void)setCancelingVelocityThreshold:(double)a3
{
  self->_cancelingVelocityThreshold = a3;
}

- (void)setBeginningVelocityThreshold:(double)a3
{
  self->_beginningVelocityThreshold = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  _UIVelocityIntegrator *velocityIntegrator;
  long double v6;
  long double v7;

  objc_storeWeak((id *)&self->_context, a4);
  if (!self->_displayLink)
    -[_UISpringLoadedHysteresisBehavior setupDisplayLink](self, "setupDisplayLink");
  velocityIntegrator = self->_velocityIntegrator;
  if (velocityIntegrator)
  {
    if ((uint64_t)velocityIntegrator->_samples.__size_.__value_ >= 4)
    {
      -[_UIVelocityIntegrator velocity](velocityIntegrator, "velocity");
      LOBYTE(velocityIntegrator) = hypot(v6, v7) < self->_beginningVelocityThreshold;
    }
    else
    {
      LOBYTE(velocityIntegrator) = 0;
    }
  }
  return (char)velocityIntegrator;
}

- (void)interactionDidFinish:(id)a3
{
  CADisplayLink *displayLink;

  objc_storeWeak((id *)&self->_context, 0);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)setupDisplayLink
{
  _UIVelocityIntegrator *v3;
  _UIVelocityIntegrator *velocityIntegrator;
  _UIVelocityIntegrator *v5;
  id WeakRetained;
  void *v7;
  CADisplayLink *v8;
  CADisplayLink *displayLink;
  CADisplayLink *v10;
  void *v11;
  CADisplayLink *v12;
  id v13;

  v3 = (_UIVelocityIntegrator *)objc_opt_new();
  velocityIntegrator = self->_velocityIntegrator;
  self->_velocityIntegrator = v3;

  -[_UIVelocityIntegrator setMinimumRequiredMovement:](self->_velocityIntegrator, "setMinimumRequiredMovement:", 0.0);
  v5 = self->_velocityIntegrator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "locationInView:", 0);
  -[_UIVelocityIntegrator addSample:](v5, "addSample:");

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayLinkWithTarget:selector:", self, sel__tick_);
  v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v8;

  v10 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

  v12 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, CFSTR("UITrackingRunLoopMode"));

}

- (void)_tick:(id)a3
{
  _UIVelocityIntegrator *velocityIntegrator;
  id WeakRetained;
  _UIVelocityIntegrator *v6;
  id v7;

  velocityIntegrator = self->_velocityIntegrator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "locationInView:", 0);
  -[_UIVelocityIntegrator addSample:](velocityIntegrator, "addSample:");

  v6 = self->_velocityIntegrator;
  if (v6)
  {
    if ((uint64_t)v6->_samples.__size_.__value_ >= 4)
    {
      -[_UISpringLoadedHysteresisBehavior delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_reloadSpringLoadedInteractionBehavior");

    }
  }
}

- (UISpringLoadedInteractionBehaviorDelegate)delegate
{
  return (UISpringLoadedInteractionBehaviorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (double)beginningVelocityThreshold
{
  return self->_beginningVelocityThreshold;
}

- (double)cancelingVelocityThreshold
{
  return self->_cancelingVelocityThreshold;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_velocityIntegrator, a3);
}

- (UISpringLoadedInteractionContext)context
{
  return (UISpringLoadedInteractionContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

@end
