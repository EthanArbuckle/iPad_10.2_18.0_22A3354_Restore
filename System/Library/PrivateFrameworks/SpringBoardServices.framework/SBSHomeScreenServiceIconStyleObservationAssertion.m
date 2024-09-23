@implementation SBSHomeScreenServiceIconStyleObservationAssertion

- (SBSHomeScreenServiceIconStyleObservationAssertion)initWithObserver:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  SBSHomeScreenServiceIconStyleObservationAssertion *v8;
  SBSHomeScreenServiceIconStyleObservationAssertion *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenServiceIconStyleObservationAssertion;
  v8 = -[SBSHomeScreenServiceIconStyleObservationAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeWeak((id *)&v9->_service, v7);
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  objc_super v5;

  if (!-[SBSHomeScreenServiceIconStyleObservationAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      NSLog(CFSTR("Should be invalidated in dealloc"));
  }
  -[SBSHomeScreenServiceIconStyleObservationAssertion invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenServiceIconStyleObservationAssertion;
  -[SBSHomeScreenServiceIconStyleObservationAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (!-[SBSHomeScreenServiceIconStyleObservationAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBSHomeScreenServiceIconStyleObservationAssertion service](self, "service");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIconStyleObservationAssertion:", self);
    -[SBSHomeScreenServiceIconStyleObservationAssertion setService:](self, "setService:", 0);
    -[SBSHomeScreenServiceIconStyleObservationAssertion setInvalidated:](self, "setInvalidated:", 1);

  }
}

- (SBSHomeScreenServiceIconStyleObserver)observer
{
  return (SBSHomeScreenServiceIconStyleObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBSHomeScreenService)service
{
  return (SBSHomeScreenService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_observer);
}

@end
