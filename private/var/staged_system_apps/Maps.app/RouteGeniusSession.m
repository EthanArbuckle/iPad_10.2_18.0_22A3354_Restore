@implementation RouteGeniusSession

- (RouteGeniusSession)init
{
  RouteGeniusSession *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteGeniusSession;
  v2 = -[RouteGeniusSession init](&v6, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsSessionObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)setSessionState:(unint64_t)a3
{
  id v4;

  if (self->_sessionState != a3)
  {
    self->_sessionState = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
    objc_msgSend(v4, "mapsSession:didChangeState:", self, -[RouteGeniusSession sessionState](self, "sessionState"));

  }
}

- (unint64_t)sessionInitiator
{
  return 2;
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestion"));

  return (MapsSuggestionsRouteGeniusEntry *)v3;
}

- (void)resume
{
  if ((id)-[RouteGeniusSession sessionState](self, "sessionState") != (id)1)
    -[RouteGeniusSession setSessionState:](self, "setSessionState:", 1);
}

- (void)suspend
{
  if ((id)-[RouteGeniusSession sessionState](self, "sessionState") == (id)1)
    -[RouteGeniusSession setSessionState:](self, "setSessionState:", 2);
}

- (void)prepareToReplayCurrentState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v2, "snapshotCurrentObservers");

}

- (void)replayCurrentState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v3, "removeSnapshottedObservers");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v4, "mapsSession:didChangeState:", self, -[RouteGeniusSession sessionState](self, "sessionState"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v5, "restoreOriginalObservers");

}

- (void)cleanupStateReplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v2, "clearSnapshottedObservers");

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteGeniusSession observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
