@implementation MSHistoryCuratedCollection

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return (GEOMapItemIdentifier *)objc_msgSend(objc_alloc((Class)GEOMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", -[MSHistoryCuratedCollection curatedCollectionIdentifier](self, "curatedCollectionIdentifier"), -[MSHistoryCuratedCollection resultProviderIdentifier](self, "resultProviderIdentifier"), -180.0, -180.0);
}

@end
