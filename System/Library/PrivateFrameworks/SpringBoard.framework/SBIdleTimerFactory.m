@implementation SBIdleTimerFactory

+ (id)idleTimerForDescriptor:(id)a3 didLogDescriptor:(BOOL *)a4
{
  id v6;
  unint64_t v7;
  SBDisabledIdleTimer *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  *a4 = 0;
  v7 = objc_msgSend(v6, "timerMode");
  if (v7 >= 3)
  {
    if (v7 == 3)
      v8 = objc_alloc_init(SBDisabledIdleTimer);
    else
      v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "_attentionAwareTimer");
    v8 = (SBDisabledIdleTimer *)objc_claimAutoreleasedReturnValue();
    -[SBDisabledIdleTimer descriptor](v8, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v6);

    if ((v10 & 1) == 0)
    {
      -[SBDisabledIdleTimer setDescriptor:](v8, "setDescriptor:", v6);
      SBLogIdleTimer();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logAuditReasons:", v11);

      *a4 = 1;
    }
  }

  return v8;
}

+ (id)_attentionAwareTimer
{
  if (_attentionAwareTimer_onceToken != -1)
    dispatch_once(&_attentionAwareTimer_onceToken, &__block_literal_global_121);
  return (id)_attentionAwareTimer_idleTimer;
}

void __42__SBIdleTimerFactory__attentionAwareTimer__block_invoke()
{
  SBBacklightIdleTimer *v0;
  void *v1;

  v0 = -[SBBacklightIdleTimer initWithConfigurationIdentifier:]([SBBacklightIdleTimer alloc], "initWithConfigurationIdentifier:", CFSTR("com.apple.springboard.GlobalBacklightIdleTimer"));
  v1 = (void *)_attentionAwareTimer_idleTimer;
  _attentionAwareTimer_idleTimer = (uint64_t)v0;

}

@end
