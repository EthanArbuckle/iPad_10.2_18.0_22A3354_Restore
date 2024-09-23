@implementation MSHistoryTransitItem

- (GEOTransitLineItem)lineItem
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)MSPTransitStorageLineItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryTransitItem transitLineStorage](self, "transitLineStorage"));
  v5 = objc_msgSend(v3, "initWithData:", v4);

  return (GEOTransitLineItem *)v5;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a6)
    (*((void (**)(id, MSHistoryTransitItem *))a6 + 2))(a6, self);
}

@end
