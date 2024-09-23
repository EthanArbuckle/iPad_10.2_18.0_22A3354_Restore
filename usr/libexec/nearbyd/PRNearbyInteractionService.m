@implementation PRNearbyInteractionService

- (PRNearbyInteractionService)initWithQueue:(id)a3
{
  id v5;
  PRNearbyInteractionService *v6;
  NIServerSessionManager *v7;
  NIServerSessionManager *sessionManager;
  void *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRNearbyInteractionService.mm"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PRNearbyInteractionService;
  v6 = -[PRNearbyInteractionService init](&v12, "init");
  if (v6)
  {
    v7 = -[NIServerSessionManager initWithQueue:]([NIServerSessionManager alloc], "initWithQueue:", v5);
    sessionManager = v6->_sessionManager;
    v6->_sessionManager = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v9, "BOOLForKey:", CFSTR("NISessionEnableInternalObserver")))
      -[NIServerSessionManager enableInternalObserverSession](v6->_sessionManager, "enableInternalObserverSession");

  }
  return v6;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3;
  PRNearbyInteractionService *v4;

  v3 = a3;
  v4 = -[PRNearbyInteractionService initWithQueue:]([PRNearbyInteractionService alloc], "initWithQueue:", v3);

  return v4;
}

- (NSArray)machServicesNames
{
  _QWORD v3[2];

  v3[0] = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction");
  v3[1] = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction.observer");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nearbyd.xpc.nearbyinteraction.observer"));

  LOBYTE(self) = -[NIServerSessionManager registerSessionWithConnection:observerSession:](self->_sessionManager, "registerSessionWithConnection:observerSession:", v4, v6);
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->machServicesNames, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

@end
