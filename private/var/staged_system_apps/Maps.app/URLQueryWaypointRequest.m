@implementation URLQueryWaypointRequest

- (URLQueryWaypointRequest)initWithURLQuery:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  URLQueryWaypointRequest *v11;
  URLQueryWaypointRequest *v12;
  NSString *v13;
  NSString *title;
  URLQueryWaypointRequest *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "muid")
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query")),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v10))
  {
    v17.receiver = self;
    v17.super_class = (Class)URLQueryWaypointRequest;
    v11 = -[URLQueryWaypointRequest init](&v17, "init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_query, a3);
      v13 = (NSString *)objc_msgSend(v8, "copy");
      title = v12->_title;
      v12->_title = v13;

    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithURLQuery:title:", self->_query, self->_title);
}

- (CLLocationCoordinate2D)coordinate
{
  ExternalURLQuery *query;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  query = self->_query;
  if (query)
  {
    -[ExternalURLQuery coordinate](query, "coordinate");
  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return 0;
}

- (id)waypointIconWithScale:(double)a3
{
  return +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", 0, 2, 1, a3);
}

- (NSString)waypointName
{
  NSString *title;
  uint64_t v4;

  title = self->_title;
  if (title)
    return title;
  v4 = MKLocalizedStringForUnknownLocation();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[ExternalURLQuery isEqual:](self->_query, "isEqual:", v4[1]);
  else
    v6 = 0;

  return v6;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  ExternalURLQuery *query;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  ExternalURLQuery *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;

  query = self->_query;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[ExternalURLQuery muid](query, "muid");
  v14 = self->_query;
  if (v13)
  {
    v15 = -[ExternalURLQuery muid](v14, "muid");
    v16 = -[ExternalURLQuery resultProviderId](self->_query, "resultProviderId");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery contentProvider](self->_query, "contentProvider"));
    v18 = sub_10089D054(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForID:resultsProviderID:contentProvider:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForID:resultsProviderID:contentProvider:traits:clientAttributes:completionHandler:networkActivityHandler:", v15, v16, v17, v12, 0, v19, v10));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](v14, "query"));
    v21 = sub_10089D054(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v21);

    v20 = objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForSearchString:completionItem:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForSearchString:completionItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v17, 0, v12, 0, v19, v10));
  }
  v22 = (void *)v20;

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
