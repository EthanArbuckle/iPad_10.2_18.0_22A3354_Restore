@implementation OSIDNDMonitor

- (OSIDNDMonitor)init
{
  OSIDNDMonitor *v2;
  uint64_t v3;
  DNDStateService *service;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSIDNDMonitor;
  v2 = -[OSIDNDMonitor init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DNDStateService serviceForClientIdentifier:](DNDStateService, "serviceForClientIdentifier:", CFSTR("ospredictiond")));
    service = v2->_service;
    v2->_service = (DNDStateService *)v3;

  }
  return v2;
}

- (BOOL)isDNDModeConsidered:(id)a3
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "activeModeConfiguration"));
  if (objc_msgSend(v3, "dimsLockScreen") == (id)2)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mode"));
    if (objc_msgSend(v5, "semanticType") == (id)1)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mode"));
      v4 = objc_msgSend(v6, "semanticType") == 0;

    }
  }

  return v4;
}

- (id)scheduledDNDEndDate
{
  DNDStateService *service;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v10;

  service = self->_service;
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DNDStateService queryCurrentStateWithError:](service, "queryCurrentStateWithError:", &v10));
  v5 = v4;
  v6 = 0;
  if (!v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userVisibleTransitionDate"));
    if (objc_msgSend(v5, "isActive")
      && -[OSIDNDMonitor isDNDModeConsidered:](self, "isDNDModeConsidered:", v5)
      && (objc_msgSend(v5, "userVisibleTransitionLifetimeType") == (id)4
       || objc_msgSend(v5, "userVisibleTransitionLifetimeType") == (id)2
       || !objc_msgSend(v5, "userVisibleTransitionLifetimeType"))
      && (objc_msgSend(v7, "timeIntervalSinceNow"), v8 < 36000.0))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userVisibleTransitionDate"));
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (DNDStateService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
