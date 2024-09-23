@implementation SBIdleTimerProxy

- (void)setSourceTimer:(id)a3
{
  SBIdleTimer *v4;
  SBIdleTimer *sourceTimer;
  SBIdleTimer *v6;
  SBIdleTimer *v7;

  v4 = (SBIdleTimer *)a3;
  sourceTimer = self->_sourceTimer;
  if (sourceTimer)
    -[SBIdleTimer removeIdleTimerObserver:](sourceTimer, "removeIdleTimerObserver:", self);
  v6 = self->_sourceTimer;
  self->_sourceTimer = v4;
  v7 = v4;

  -[SBIdleTimer addIdleTimerObserver:](v7, "addIdleTimerObserver:", self);
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIdleTimerProxy;
  -[SBIdleTimerBase reset](&v4, sel_reset);
  -[SBIdleTimerProxy sourceTimer](self, "sourceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

}

- (SBIdleTimer)sourceTimer
{
  return self->_sourceTimer;
}

+ (id)disabledIdleTimerProxy
{
  id v2;
  SBDisabledIdleTimer *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(SBDisabledIdleTimer);
  v4 = (void *)objc_msgSend(v2, "initWithIdleTimerSource:", v3);

  return v4;
}

- (SBIdleTimerProxy)initWithIdleTimerSource:(id)a3
{
  id v5;
  SBIdleTimerProxy *v6;
  SBIdleTimerProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerProxy;
  v6 = -[SBIdleTimerProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceTimer, a3);
    objc_msgSend(v5, "addIdleTimerObserver:", v7);
  }

  return v7;
}

- (BOOL)isDisabled
{
  return -[SBIdleTimer isDisabled](self->_sourceTimer, "isDisabled");
}

- (void)idleTimerDidRefresh:(id)a3
{
  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", a2);
}

- (void)idleTimerDidExpire:(id)a3
{
  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", a2);
}

- (void)idleTimerDidWarn:(id)a3
{
  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", a2);
}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
  -[SBIdleTimerBase _makeObserversPerformSelector:](self, "_makeObserversPerformSelector:", a2);
}

- (BOOL)isActivated
{
  return 0;
}

- (void)setActivated:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerProxy.m"), 85, CFSTR("SBIdleTimerProxy should never be activated."));

}

- (void)_logExpirationTimeout:(double)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerProxy.m"), 91, CFSTR("SBIdleTimerProxy should never log expiration timeout"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTimer, 0);
}

@end
