@implementation IOSSiriContextProvider

- (MKMapView)mapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return (MKMapView *)v4;
}

- (SiriMapItemConvertible)selectedPOI
{
  void *v2;
  void *v3;
  POIPlaceholderSearchResult *v4;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSiriContextProvider mapView](self, "mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_selectedLabelMarker"));

  if (!v3
    || (objc_msgSend(v3, "isTrafficIncident") & 1) != 0
    || (objc_msgSend(v3, "isTransitLine") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "poiSearchManager"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v4 = (POIPlaceholderSearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResultForIdentifier:", v8));

    if (!v4)
      v4 = -[POIPlaceholderSearchResult initWithLabelMarker:]([POIPlaceholderSearchResult alloc], "initWithLabelMarker:", v3);

  }
  return (SiriMapItemConvertible *)v4;
}

- (NSArray)searchResults
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentResults"));

  return (NSArray *)v3;
}

- (SiriMapItemConvertible)selectedResult
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentResultsSearchInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedResult"));

  return (SiriMapItemConvertible *)v4;
}

@end
