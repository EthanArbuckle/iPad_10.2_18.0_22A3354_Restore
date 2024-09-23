@implementation SBHomeScreenBackdropViewBase

- (id)backdropBlurSettings
{
  return -[SBFluidSwitcherAnimationSettings backdropBlurSettings](self->_animationSettings, "backdropBlurSettings");
}

- (BOOL)requiresLiveBackdropView
{
  return -[NSMutableSet count](self->_liveBackdropViewRequiringReasons, "count") != 0;
}

- (BOOL)requiresBackdropView
{
  return -[NSMutableSet count](self->_backdropViewRequiringReasons, "count") != 0;
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  id v5;
  NSMutableSet *backdropViewRequiringReasons;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenBackdropViewBase.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  backdropViewRequiringReasons = self->_backdropViewRequiringReasons;
  if (!backdropViewRequiringReasons)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_backdropViewRequiringReasons;
    self->_backdropViewRequiringReasons = v7;

    v5 = v10;
    backdropViewRequiringReasons = self->_backdropViewRequiringReasons;
  }
  -[NSMutableSet addObject:](backdropViewRequiringReasons, "addObject:", v5);

}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  id v5;
  NSMutableSet *liveBackdropViewRequiringReasons;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenBackdropViewBase.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  liveBackdropViewRequiringReasons = self->_liveBackdropViewRequiringReasons;
  if (!liveBackdropViewRequiringReasons)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_liveBackdropViewRequiringReasons;
    self->_liveBackdropViewRequiringReasons = v7;

    v5 = v10;
    liveBackdropViewRequiringReasons = self->_liveBackdropViewRequiringReasons;
  }
  -[NSMutableSet addObject:](liveBackdropViewRequiringReasons, "addObject:", v5);

}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenBackdropViewBase.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->_liveBackdropViewRequiringReasons, "removeObject:", v5);

}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenBackdropViewBase.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->_backdropViewRequiringReasons, "removeObject:", v5);

}

- (SBHomeScreenBackdropViewBase)initWithFrame:(CGRect)a3
{
  SBHomeScreenBackdropViewBase *v3;
  void *v4;
  uint64_t v5;
  SBFluidSwitcherAnimationSettings *animationSettings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenBackdropViewBase;
  v3 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    animationSettings = v3->_animationSettings;
    v3->_animationSettings = (SBFluidSwitcherAnimationSettings *)v5;

  }
  return v3;
}

- (SBHomeScreenBackdropViewBaseDelegate)delegate
{
  return (SBHomeScreenBackdropViewBaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_liveBackdropViewRequiringReasons, 0);
  objc_storeStrong((id *)&self->_backdropViewRequiringReasons, 0);
}

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)isOpaque
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
