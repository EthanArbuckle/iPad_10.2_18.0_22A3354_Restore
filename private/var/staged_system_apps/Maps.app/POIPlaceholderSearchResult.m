@implementation POIPlaceholderSearchResult

- (POIPlaceholderSearchResult)initWithLabelMarker:(id)a3
{
  id v4;
  id v5;
  POIPlaceholderSearchResult *v6;
  POIPlaceholderSearchResult *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v4);

  v9.receiver = self;
  v9.super_class = (Class)POIPlaceholderSearchResult;
  v6 = -[SearchResult initWithMapItem:](&v9, "initWithMapItem:", v5);

  if (v6)
  {
    -[SearchResult setType:](v6, "setType:", 9);
    -[SearchResultRepr setHasIncompleteMetadata:](v6, "setHasIncompleteMetadata:", 1);
    -[SearchResultRepr setHasIncompleteNavData:](v6, "setHasIncompleteNavData:", 1);
    v7 = v6;
  }

  return v6;
}

@end
