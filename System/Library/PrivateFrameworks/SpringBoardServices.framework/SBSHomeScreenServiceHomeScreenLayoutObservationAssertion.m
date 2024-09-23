@implementation SBSHomeScreenServiceHomeScreenLayoutObservationAssertion

- (SBSHomeScreenServiceHomeScreenLayoutObservationAssertion)initWithObserver:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  SBSHomeScreenServiceHomeScreenLayoutObservationAssertion *v8;
  SBSHomeScreenServiceHomeScreenLayoutObservationAssertion *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenServiceHomeScreenLayoutObservationAssertion;
  v8 = -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion init](&v11, sel_init);
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

  if (!-[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      NSLog(CFSTR("Should be invalidated in dealloc"));
  }
  -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenServiceHomeScreenLayoutObservationAssertion;
  -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (!-[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion service](self, "service");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeHomeScreenLayoutObservationAssertion:", self);
    -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion setService:](self, "setService:", 0);
    -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion setInvalidated:](self, "setInvalidated:", 1);

  }
}

- (SBSHomeScreenServiceLayoutObserver)observer
{
  return (SBSHomeScreenServiceLayoutObserver *)objc_loadWeakRetained((id *)&self->_observer);
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
