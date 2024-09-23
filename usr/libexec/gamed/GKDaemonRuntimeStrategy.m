@implementation GKDaemonRuntimeStrategy

+ (void)setup
{
  GKDaemonRuntimeStrategy *v2;

  v2 = objc_alloc_init(GKDaemonRuntimeStrategy);
  GKSetRuntimeStrategy();

}

- (GKDaemonRuntimeStrategy)init
{
  GKDaemonRuntimeStrategy *v2;
  void *v3;
  _TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *v4;
  uint64_t v5;
  NSURLSession *instrumentedURLSession;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDaemonRuntimeStrategy;
  v2 = -[GKDaemonRuntimeStrategy init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    v4 = objc_alloc_init(_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    v5 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, v4, 0));
    instrumentedURLSession = v2->_instrumentedURLSession;
    v2->_instrumentedURLSession = (NSURLSession *)v5;

  }
  return v2;
}

- (GKGameSessionService)gameSessionService
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameSessionService, "serviceWithTransport:forClient:localPlayer:", 0, v2, 0));

  return (GKGameSessionService *)v3;
}

- (GKUtilityService)utilityService
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKUtilityService, "serviceWithTransport:forClient:localPlayer:", 0, v2, 0));

  return (GKUtilityService *)v3;
}

- (GKUtilityServicePrivate)utilityServicePrivate
{
  return 0;
}

- (BOOL)shouldRefreshPreferencesAfterBackgrounding
{
  return 0;
}

- (id)localPlayer
{
  return +[GKLocalPlayerInternal archivedProfile](GKLocalPlayerInternal, "archivedProfile");
}

- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5
{
  +[NSData _gkRequestClientsRemoteImageDataForURL:queue:reply:](NSData, "_gkRequestClientsRemoteImageDataForURL:queue:reply:", a3, a4, a5);
}

- (NSURLSession)instrumentedURLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentedURLSession, 0);
}

@end
