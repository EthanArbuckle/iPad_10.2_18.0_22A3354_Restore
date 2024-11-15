@implementation SBIdleTimerInfo

- (SBIdleTimerProxy)idleTimerProxy
{
  return self->_idleTimerProxy;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (SBIdleTimerInfo)initWithProvider:(id)a3 behavior:(id)a4 reason:(id)a5 idleTimerProxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBIdleTimerInfo *v14;
  SBIdleTimerInfo *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBIdleTimerInfo;
  v14 = -[SBIdleTimerInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_provider, v10);
    objc_storeStrong((id *)&v15->_behavior, a4);
    objc_storeStrong((id *)&v15->_reason, a5);
    objc_storeStrong((id *)&v15->_idleTimerProxy, a6);
  }

  return v15;
}

- (SBIdleTimerProviding)provider
{
  return (SBIdleTimerProviding *)objc_loadWeakRetained((id *)&self->_provider);
}

- (SBFIdleTimerBehaviorProviding)behavior
{
  return self->_behavior;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setIdleTimerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerProxy, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
