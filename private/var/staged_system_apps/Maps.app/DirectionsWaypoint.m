@implementation DirectionsWaypoint

+ (DirectionsWaypoint)directionsWaypointWithNanoDirectionWaypoint:(id)a3
{
  id v3;
  DirectionsWaypoint *v4;
  void *v5;
  void *v6;
  void *v7;
  SearchResult *v8;
  SearchResult *v9;
  void *v10;
  void *v11;
  ExternalURLQuery *v13;

  v3 = a3;
  v4 = objc_alloc_init(DirectionsWaypoint);
  if (objc_msgSend(v3, "isCurrentLocation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[DirectionsWaypoint setRequestSearch:](v4, "setRequestSearch:", v5);
LABEL_8:

    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchString"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchString"));
    -[DirectionsWaypoint setRequestSearchString:](v4, "setRequestSearchString:", v5);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));

  if (v7)
  {
    v8 = [SearchResult alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
    v9 = -[SearchResult initWithGEOMapItem:](v8, "initWithGEOMapItem:", v5);
    -[DirectionsWaypoint setRequestSearch:](v4, "setRequestSearch:", v9);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "muid") && (int)objc_msgSend(v3, "providerID") >= 1)
  {
    v13 = [ExternalURLQuery alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchString"));
    v9 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:](v13, "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v5, objc_msgSend(v3, "muid"), objc_msgSend(v3, "providerID"), 0, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
    -[DirectionsWaypoint setExternalURLQuery:](v4, "setExternalURLQuery:", v9);
    goto LABEL_7;
  }
LABEL_9:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composedWaypoint"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composedWaypoint"));
    -[DirectionsWaypoint updateFromGEOComposedWaypoint:](v4, "updateFromGEOComposedWaypoint:", v11);

  }
  return v4;
}

- (id)nanoDirectionWaypoint
{
  NanoDirectionWaypoint *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NanoDirectionWaypoint *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(NanoDirectionWaypoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));
    v6 = objc_msgSend(v5, "isDynamicCurrentLocation");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));
      objc_msgSend(v7, "coordinate");
      v9 = v8;
      v11 = v10;

      v12 = 0;
      if (v11 >= -180.0 && v11 <= 180.0 && v9 >= -90.0 && v9 <= 90.0)
        v12 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:isUserLocation:", 1, v9, v11);
      v13 = objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointForCurrentLocation:](NanoDirectionWaypoint, "directionWaypointForCurrentLocation:", v12));
      goto LABEL_11;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));
    v16 = (NanoDirectionWaypoint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NanoDirectionWaypoint _geoMapItem](v16, "_geoMapItem"));
    v15 = objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointWithGEOMapItem:](NanoDirectionWaypoint, "directionWaypointWithGEOMapItem:", v17));

LABEL_15:
    v3 = v16;
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));

  if (!v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));

    if (!v18)
      goto LABEL_17;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));
    v16 = (NanoDirectionWaypoint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "query"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));
    v19 = objc_msgSend(v17, "muid");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));
    v15 = objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointWithLabel:muid:providerID:](NanoDirectionWaypoint, "directionWaypointWithLabel:muid:providerID:", v16, v19, objc_msgSend(v20, "resultProviderId")));

    goto LABEL_15;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));
  v13 = objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointWithSearchString:](NanoDirectionWaypoint, "directionWaypointWithSearchString:", v12));
LABEL_11:
  v15 = v13;
LABEL_16:

  v3 = (NanoDirectionWaypoint *)v15;
LABEL_17:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "composedWaypoint"));
    -[NanoDirectionWaypoint setComposedWaypoint:](v3, "setComposedWaypoint:", v23);

  }
  return v3;
}

- (void)updateFromGEOComposedWaypoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  SearchResult *v10;
  SearchResult *v11;
  unsigned int v12;
  SearchResult *v13;
  SearchResult *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));

  v5 = v15;
  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geoMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));
      v9 = objc_msgSend(v8, "copy");
      -[DirectionsWaypoint setResponseSearch:](self, "setResponseSearch:", v9);

      v10 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));
      -[SearchResult updateWithGEOMapItem:](v10, "updateWithGEOMapItem:", v6);
    }
    else
    {
      if (objc_msgSend(v15, "hasFindMyHandleID"))
      {
        v11 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v15);
      }
      else
      {
        v12 = objc_msgSend(v15, "isCurrentLocation");
        if (v6)
        {
          if ((v12 & 1) == 0 && !objc_msgSend(v15, "isLocationWaypointType"))
          {
            v13 = [SearchResult alloc];
            v10 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v6));
            v14 = -[SearchResult initWithMapItem:](v13, "initWithMapItem:", v10);
            -[DirectionsWaypoint setResponseSearch:](self, "setResponseSearch:", v14);

            goto LABEL_13;
          }
          v11 = -[SearchResult initWithComposedWaypoint:preserveLocationInfo:]([SearchResult alloc], "initWithComposedWaypoint:preserveLocationInfo:", v15, 1);
        }
        else
        {
          if (!v12)
          {
LABEL_14:

            v5 = v15;
            goto LABEL_15;
          }
          v11 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
        }
      }
      v10 = v11;
      -[DirectionsWaypoint setResponseSearch:](self, "setResponseSearch:", v11);
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

}

- (void)setResponseSearch:(id)a3
{
  SearchResult *v5;
  SearchResult **p_responseSearch;
  SearchResult **p_requestSearch;
  SearchResult *requestSearch;
  SearchResult *v9;

  v5 = (SearchResult *)a3;
  p_responseSearch = &self->_responseSearch;
  if (self->_responseSearch != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_responseSearch, a3);
    v5 = v9;
    requestSearch = self->_requestSearch;
    p_requestSearch = &self->_requestSearch;
    if (!requestSearch)
    {
      objc_storeStrong((id *)p_requestSearch, *p_responseSearch);
      v5 = v9;
    }
  }

}

- (BOOL)isValid
{
  MKLocalSearchCompletion *completion;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  completion = self->_completion;
  if (completion)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion category](completion, "category"));
    if (v4)
    {

      return 1;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion queryLine](self->_completion, "queryLine"));
    if (objc_msgSend(v5, "length"))
    {

      return 1;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion title](self->_completion, "title"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
      return 1;
  }
  if (self->_responseSearch || self->_externalURLQuery || self->_requestSearch || self->_requestAddress)
    return 1;
  return -[NSString length](self->_requestSearchString, "length") != 0;
}

- (NSString)location
{
  SearchResult *requestSearch;
  NSString *v4;
  void *v6;
  MKLocalSearchCompletion *completion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ExternalURLQuery *externalURLQuery;
  double v13;
  double v14;

  if (-[DirectionsWaypoint isValid](self, "isValid"))
  {
    requestSearch = self->_requestSearch;
    if (requestSearch)
    {
      v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[SearchResult routableAddress](requestSearch, "routableAddress"));
      return v4;
    }
    completion = self->_completion;
    if (!completion)
    {
      externalURLQuery = self->_externalURLQuery;
      if (externalURLQuery)
      {
        v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](externalURLQuery, "query"));
      }
      else if (-[AddressBookAddress isValid](self->_requestAddress, "isValid"))
      {
        v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress singleLineAddress](self->_requestAddress, "singleLineAddress"));
      }
      else
      {
        v4 = self->_requestSearchString;
      }
      return v4;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion displayLines](completion, "displayLines"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));

    if (!objc_msgSend(v6, "length"))
    {
      v13 = 0.0;
      v14 = 0.0;
      if (-[MKLocalSearchCompletion getCoordinate:](self->_completion, "getCoordinate:", &v13))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v9, v10));

        return (NSString *)v11;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)hawkQueryRepresentation
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  double v7;
  void *v8;

  if (-[DirectionsWaypoint isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint mapItemIfLoaded](self, "mapItemIfLoaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_identifier"));

    if (v4)
    {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](self, "location"));
    }
    else
    {
      -[DirectionsWaypoint coordinate](self, "coordinate");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[DirectionsWaypoint coordinate](self, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v6, v8));

    }
  }
  else
  {
    v5 = CFSTR("<invalid>");
  }
  return (NSString *)v5;
}

- (BOOL)containsSearchResult:(id)a3
{
  return self->_requestSearch == a3 || self->_responseSearch == a3;
}

- (NSString)singleLineAddress
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self->_requestSearch, "singleLineAddress"));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self->_responseSearch, "singleLineAddress"));
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)isDynamicCurrentLocation
{
  return -[SearchResult isDynamicCurrentLocation](self->_requestSearch, "isDynamicCurrentLocation");
}

- (SearchResult)pin
{
  SearchResult *requestSearch;

  requestSearch = self->_requestSearch;
  if (!requestSearch)
    requestSearch = self->_responseSearch;
  return requestSearch;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees latitude;
  double v7;
  CLLocationDegrees longitude;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint pin](self, "pin"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint pin](self, "pin"));
    objc_msgSend(v4, "coordinate");
    latitude = v5;
    longitude = v7;

  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  v9 = latitude;
  v10 = longitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)bounds
{
  void *v2;
  double v3;
  double v4;
  MKMapPoint v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint pin](self, "pin"));
  objc_msgSend(v2, "coordinate");
  if (v2 && v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0 && v3 <= 90.0)
  {
    v5 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)&v3);
    x = v5.x;
    y = v5.y;
    width = 0.0;
    height = 0.0;
  }
  else
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (MKMapItem)mapItemIfLoaded
{
  return -[SearchResult mapItem](self->_responseSearch, "mapItem");
}

- (BOOL)isEqual:(id)a3
{
  DirectionsWaypoint *v4;
  uint64_t v5;
  DirectionsWaypoint *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;

  v4 = (DirectionsWaypoint *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint pin](v6, "pin"));
      v8 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint pin](self, "pin"));
      v9 = (void *)v8;
      if (v7 && v8)
      {
        v10 = objc_msgSend(v7, "isEqualToSearchResult:forPurpose:", v8, 1);
LABEL_19:

        goto LABEL_20;
      }
      v11 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](v6, "location"));
      if (v11
        && (v12 = (void *)v11,
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](self, "location")),
            v13,
            v12,
            v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](v6, "location"));
        v15 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](self, "location"));
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](v6, "requestSearchString"));
        if (v18)
        {
          v19 = (void *)v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));

          if (v20)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](v6, "requestSearchString"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));
            v17 = objc_msgSend(v14, "isEqualToString:", v16);
            goto LABEL_18;
          }
        }
        v21 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](v6, "externalURLQuery"));
        if (v21)
        {
          v22 = (void *)v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));

          if (v23)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](v6, "externalURLQuery"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint externalURLQuery](self, "externalURLQuery"));
            v17 = objc_msgSend(v14, "isEqualToExternalURLQuery:", v16);
            goto LABEL_18;
          }
        }
        v25 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](v6, "requestAddress"));
        if (!v25
          || (v26 = (void *)v25,
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](self, "requestAddress")),
              v27,
              v26,
              !v27))
        {
          v10 = 0;
          goto LABEL_19;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](v6, "requestAddress"));
        v15 = objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](self, "requestAddress"));
      }
      v16 = (void *)v15;
      v17 = objc_msgSend(v14, "isEqual:", v15);
LABEL_18:
      v10 = v17;

      goto LABEL_19;
    }
    v10 = 0;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = (unint64_t)objc_msgSend((id)objc_opt_class(self), "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](self, "location"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_opt_class(self);
  v4 = CFSTR("YES");
  if (-[DirectionsWaypoint isValid](self, "isValid"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!-[DirectionsWaypoint isDynamicCurrentLocation](self, "isDynamicCurrentLocation"))
    v4 = CFSTR("NO");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint location](self, "location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p isValid=%@ isDynamicCurrentLocation=%@ location=%@"), v3, self, v5, v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearchString](self, "requestSearchString"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" requestSearchString=%@"), v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestSearch](self, "requestSearch"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" requestSearch=%@"), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](self, "requestAddress"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint requestAddress](self, "requestAddress"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" requestAddress=%@"), v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint suggestionsPrefix](self, "suggestionsPrefix"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint suggestionsPrefix](self, "suggestionsPrefix"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" suggestionsPrefix=%@"), v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint responseSearch](self, "responseSearch"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" responseSearch=%@"), v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint completion](self, "completion"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint completion](self, "completion"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" completion=%@"), v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint mapItemIfLoaded](self, "mapItemIfLoaded"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsWaypoint mapItemIfLoaded](self, "mapItemIfLoaded"));
    objc_msgSend(v7, "appendFormat:", CFSTR(" mapItemIfLoaded=%@"), v21);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (NSString)requestSearchString
{
  return self->_requestSearchString;
}

- (void)setRequestSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_requestSearchString, a3);
}

- (SearchResult)requestSearch
{
  return self->_requestSearch;
}

- (void)setRequestSearch:(id)a3
{
  objc_storeStrong((id *)&self->_requestSearch, a3);
}

- (AddressBookAddress)requestAddress
{
  return self->_requestAddress;
}

- (void)setRequestAddress:(id)a3
{
  objc_storeStrong((id *)&self->_requestAddress, a3);
}

- (NSString)suggestionsPrefix
{
  return self->_suggestionsPrefix;
}

- (void)setSuggestionsPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsPrefix, a3);
}

- (SearchResult)responseSearch
{
  return self->_responseSearch;
}

- (MKLocalSearchCompletion)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_completion, a3);
}

- (ExternalURLQuery)externalURLQuery
{
  return self->_externalURLQuery;
}

- (void)setExternalURLQuery:(id)a3
{
  objc_storeStrong((id *)&self->_externalURLQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalURLQuery, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_responseSearch, 0);
  objc_storeStrong((id *)&self->_suggestionsPrefix, 0);
  objc_storeStrong((id *)&self->_requestAddress, 0);
  objc_storeStrong((id *)&self->_requestSearch, 0);
  objc_storeStrong((id *)&self->_requestSearchString, 0);
}

@end
