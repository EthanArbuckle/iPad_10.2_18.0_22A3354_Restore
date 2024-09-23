@implementation HistoryEntryRecentRouteInfoSource

- (HistoryEntryRecentRouteInfoSource)initWithItem:(id)a3
{
  id v5;
  HistoryEntryRecentRouteInfoSource *v6;
  HistoryEntryRecentRouteInfoSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HistoryEntryRecentRouteInfoSource;
  v6 = -[HistoryEntryRecentRouteInfoSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (id)ifGEOStorageRouteRequestStorage
{
  return -[MSHistoryDirectionsItem routeRequestStorage](self->_item, "routeRequestStorage");
}

- (id)ifRidesharingInformationSource
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
