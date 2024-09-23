@implementation CarSiriContextProvider

- (id)_visuallySelectedResult
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visuallySelectedItem"));

  v5 = v4;
  v6 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return (MKMapView *)v4;
}

- (SiriMapItemConvertible)selectedPOI
{
  return 0;
}

- (NSArray)searchResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentResults"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSiriContextProvider _visuallySelectedResult](self, "_visuallySelectedResult"));
  if (v5 && !objc_msgSend(v4, "containsObject:", v5))
    v6 = 0;
  else
    v6 = v4;

  return (NSArray *)v6;
}

- (SiriMapItemConvertible)selectedResult
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSiriContextProvider _visuallySelectedResult](self, "_visuallySelectedResult"));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentResultsSearchInfo"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedResult"));

  }
  return (SiriMapItemConvertible *)v4;
}

@end
