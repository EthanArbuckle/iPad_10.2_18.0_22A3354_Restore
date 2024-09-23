@implementation SearchStringWaypointRequest

- (SearchStringWaypointRequest)initWithSearchString:(id)a3 completionItem:(id)a4
{
  id v6;
  id v7;
  SearchStringWaypointRequest *v8;
  NSString *v9;
  NSString *searchString;
  id v11;
  void *v12;
  MKMapItem *v13;
  MKMapItem *mapItem;
  SearchStringWaypointRequest *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v17.receiver = self;
    v17.super_class = (Class)SearchStringWaypointRequest;
    v8 = -[SearchStringWaypointRequest init](&v17, "init");
    if (v8)
    {
      v9 = (NSString *)objc_msgSend(v6, "copy");
      searchString = v8->_searchString;
      v8->_searchString = v9;

      objc_storeStrong((id *)&v8->_completionItem, a4);
      if (v8->_completionItem)
      {
        v11 = objc_alloc((Class)MKMapItem);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCompletionItem geoMapItem](v8->_completionItem, "geoMapItem"));
        v13 = (MKMapItem *)objc_msgSend(v11, "initWithGeoMapItem:isPlaceHolderPlace:", v12, 0);
        mapItem = v8->_mapItem;
        v8->_mapItem = v13;

      }
    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (SearchStringWaypointRequest)initWithSearchString:(id)a3
{
  return -[SearchStringWaypointRequest initWithSearchString:completionItem:](self, "initWithSearchString:completionItem:", a3, 0);
}

- (SearchStringWaypointRequest)init
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("-[%@ %@] not implemented"), v6, v8);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithSearchString:completionItem:", self->_searchString, self->_completionItem);
}

- (NSString)description
{
  SearchStringWaypointRequest *v2;
  id v3;
  void ***v4;
  SearchStringWaypointRequest *v5;
  SearchStringWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10041CD54;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[SearchStringWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchStringWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  SearchStringWaypointRequest *v2;
  id v3;
  void ***v4;
  SearchStringWaypointRequest *v5;
  SearchStringWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10041CED4;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[SearchStringWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchStringWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, GEOCompletionItem *))a3 + 2))(v6, CFSTR("completionItem"), self->_completionItem);
  (*((void (**)(id, const __CFString *, MKMapItem *))a3 + 2))(v6, CFSTR("mapItem"), self->_mapItem);

}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  double v5;
  double v6;
  CLLocationCoordinate2D result;

  v5 = 0.0;
  v6 = 0.0;
  if (-[GEOCompletionItem getCoordinate:](self->_completionItem, "getCoordinate:", &v5)
    && (fabs(v6 + 180.0) >= 0.00000001 || fabs(v5 + 180.0) >= 0.00000001))
  {
    v4 = CLLocationCoordinate2DMake(v5, v6);
    longitude = v4.longitude;
    latitude = v4.latitude;
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
  return -[MKMapItem isCurrentLocation](self->_mapItem, "isCurrentLocation");
}

- (BOOL)hasCachedResult
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  return +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", self->_mapItem, 2, 0, a3);
}

- (NSString)waypointName
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *searchString;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCompletionItem displayLines](self->_completionItem, "displayLines"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
    searchString = v6;
    if (!v6)
      searchString = self->_searchString;
    v5 = searchString;

  }
  return v5;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned __int8 IsEqualToMapItemForPurpose;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  GEOCompletionItem *completionItem;
  unint64_t v18;
  id v19;
  void *v20;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (id *)v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "_geoMapItem"));
    v9 = (void *)v8;
    if (v7 && v8)
    {
      if (!objc_msgSend(v7, "_hasMUID")
        || !objc_msgSend(v9, "_hasMUID")
        || (v10 = objc_msgSend(v7, "_muid"), v10 == objc_msgSend(v9, "_muid")))
      {
        IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v7, v9, 1);
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v12 = v6[1];
      v13 = self->_searchString;
      v14 = (unint64_t)v12;
      if (!(v13 | v14)
        || (v15 = (void *)v14,
            v16 = objc_msgSend((id)v13, "isEqual:", v14),
            v15,
            (id)v13,
            v16))
      {
        completionItem = self->_completionItem;
        v18 = (unint64_t)v6[2];
        v19 = completionItem;
        v20 = v19;
        if ((unint64_t)v19 | v18)
          IsEqualToMapItemForPurpose = objc_msgSend(v19, "isEqual:", v18);
        else
          IsEqualToMapItemForPurpose = 1;

        goto LABEL_16;
      }
    }
    IsEqualToMapItemForPurpose = 0;
    goto LABEL_16;
  }
  IsEqualToMapItemForPurpose = 0;
LABEL_17:

  return IsEqualToMapItemForPurpose;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  NSString *searchString;
  GEOCompletionItem *completionItem;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;

  searchString = self->_searchString;
  completionItem = self->_completionItem;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = sub_10089D054(a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForSearchString:completionItem:traits:clientAttributes:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForSearchString:completionItem:traits:clientAttributes:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", searchString, completionItem, v13, 0, v12, v15, v11));

  return v16;
}

- (void)recordRAPInformation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[NSString copy](self->_searchString, "copy");
  objc_msgSend(v6, "setSearchString:", v4);

  if (self->_completionItem)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOStorageCompletion storageForCompletionItem:](GEOStorageCompletion, "storageForCompletionItem:"));
    objc_msgSend(v6, "setCompletionStorage:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_completionItem, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
