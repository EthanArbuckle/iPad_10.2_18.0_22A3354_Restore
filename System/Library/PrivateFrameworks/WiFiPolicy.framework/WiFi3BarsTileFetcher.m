@implementation WiFi3BarsTileFetcher

- (WiFi3BarsTileFetcher)initWithDataSourceMediator:(id)a3
{
  TBDataSourceMediator *v4;
  WiFi3BarsTileFetcher *v5;
  TBDataSourceMediator *dataSourceMediator;
  TBDataSourceMediator *v7;
  void *v8;
  void *v9;
  WiFi3BarsTileCacheObserver *v10;
  WiFi3BarsTileCacheObserver *tileCacheObserver;
  objc_super v13;

  v4 = (TBDataSourceMediator *)a3;
  v13.receiver = self;
  v13.super_class = (Class)WiFi3BarsTileFetcher;
  v5 = -[WiFi3BarsTileFetcher init](&v13, sel_init);
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;
  v7 = v4;

  +[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldMonitorVisits:", 1);

  +[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerVisitCallbackFunctionPtr:withContext:", __WiFiManagerLocationManagerVisitCallback, v5);

  v10 = -[WiFi3BarsTileCacheObserver initWithDataSourceMediator:]([WiFi3BarsTileCacheObserver alloc], "initWithDataSourceMediator:", v7);
  tileCacheObserver = v5->_tileCacheObserver;
  v5->_tileCacheObserver = v10;

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WiFi3BarsTileFetcher;
  -[WiFi3BarsTileFetcher dealloc](&v4, sel_dealloc);
}

- (void)_handleLocationManagerVisitCallbackWithVisit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  TBGloriaTile *v9;
  double v10;
  double v11;
  double v12;
  TBGloriaTile *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSXPCConnection *v17;
  NSXPCConnection *connectionToService;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = (void *)MEMORY[0x1D17AC818]();
  objc_msgSend(v21, "departureDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v21, "horizontalAccuracy");
    if (v7 <= 2000.0)
    {
      v9 = [TBGloriaTile alloc];
      objc_msgSend(v21, "coordinate");
      v11 = v10;
      objc_msgSend(v21, "coordinate");
      v13 = -[TBGloriaTile initWithLat:lng:zoom:](v9, "initWithLat:lng:zoom:", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"), v11, v12);
      if (-[TBGloriaTile key](v13, "key"))
      {
        v14 = -[TBGloriaTile key](v13, "key");
        NSLog(CFSTR("%s: Fetching networks, key: %llu zoom: %hhu"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", v14, +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"));
        NSLog(CFSTR("%s: last fetched tile %llu - current tile %llu - checking for cache"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", self->_lastFetchedKey, v14);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingDays:", -7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.wifi.ThreeBarsXPCService"));
        connectionToService = self->_connectionToService;
        self->_connectionToService = v17;

        if (self->_connectionToService)
        {
          objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFA03620);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v19);

          -[NSXPCConnection resume](self->_connectionToService, "resume");
          -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v20, "fetchTileFromVisitedCallback:cacheAge:", -[TBGloriaTile key](v13, "key"), v16);
          else
            NSLog(CFSTR("%s: proxy is null"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");

        }
        else
        {
          NSLog(CFSTR("%s: _connectionToService is null"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
        }

      }
      else
      {
        NSLog(CFSTR("%s: Invalid tileKey, zoom: %hhu"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"));
      }

    }
    else
    {
      objc_msgSend(v21, "horizontalAccuracy");
      NSLog(CFSTR("%s: visit accuracy is too low %f"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", v8);
    }
  }
  else
  {
    NSLog(CFSTR("%s: visit is a departure, not using for fetching"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
  }
  objc_autoreleasePoolPop(v4);

}

void __69__WiFi3BarsTileFetcher__handleLocationManagerVisitCallbackWithVisit___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error getting synchronous remote object: %@"), "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]_block_invoke", a2);
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceMediator, a3);
}

- (unint64_t)lastFetchedKey
{
  return self->_lastFetchedKey;
}

- (void)setLastFetchedKey:(unint64_t)a3
{
  self->_lastFetchedKey = a3;
}

- (WiFi3BarsTileCacheObserver)tileCacheObserver
{
  return self->_tileCacheObserver;
}

- (void)setTileCacheObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tileCacheObserver, a3);
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_tileCacheObserver, 0);
  objc_storeStrong((id *)&self->_dataSourceMediator, 0);
}

@end
