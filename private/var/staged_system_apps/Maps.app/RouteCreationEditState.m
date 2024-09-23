@implementation RouteCreationEditState

- (RouteCreationEditState)initWithReason:(unint64_t)a3 anchorPoints:(id)a4
{
  id v6;
  RouteCreationEditState *v7;
  RouteCreationEditState *v8;
  GEOComposedRouteAnchorPointList *v9;
  GEOComposedRouteAnchorPointList *anchorPoints;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RouteCreationEditState;
  v7 = -[RouteCreationEditState init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_reason = a3;
    v9 = (GEOComposedRouteAnchorPointList *)objc_msgSend(v6, "copy");
    anchorPoints = v8->_anchorPoints;
    v8->_anchorPoints = v9;

  }
  return v8;
}

- (id)instanceByAddingAnchorPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v6 = objc_msgSend(v5, "copy");

  objc_msgSend(v6, "appendAnchorPoint:", v4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 1, v6);

  return v7;
}

- (id)instanceByRemovingFirstAnchorPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v6 = objc_msgSend(v5, "copy");

  objc_msgSend(v6, "removeFirstAnchorSharingPositionWith:", v4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 2, v6);

  return v7;
}

- (id)instanceByRemovingLastAnchorPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v6 = objc_msgSend(v5, "copy");

  objc_msgSend(v6, "removeLastAnchorSharingPositionWith:", v4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 2, v6);

  return v7;
}

- (id)instanceByReversingAnchorPoints
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v4 = objc_msgSend(v3, "copy");

  objc_msgSend(v4, "reverse");
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 3, v4);

  return v5;
}

- (id)instanceByFormingOutAndBackAnchors
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v4 = objc_msgSend(v3, "copy");

  objc_msgSend(v4, "createOutAndBack");
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 4, v4);

  return v5;
}

- (id)instanceByClosingTheLoop
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v4 = objc_msgSend(v3, "copy");

  objc_msgSend(v4, "closeLoop");
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReason:anchorPoints:", 5, v4);

  return v5;
}

+ (id)initialEditStateFromRoute:(id)a3
{
  void *v4;
  void *v5;
  GEOComposedRouteAnchorPointList *v6;
  GEOComposedRouteAnchorPointList *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anchorPoints"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_opt_new(GEOComposedRouteAnchorPointList);
  v7 = v6;

  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithReason:anchorPoints:", 0, v7);
  return v8;
}

+ (id)initialEditStateFromMapItems:(id)a3
{
  id v3;
  GEOComposedRouteAnchorPointList *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = objc_opt_new(GEOComposedRouteAnchorPointList);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isCurrentLocation"))
        {
          objc_msgSend(v10, "_coordinate");
          v12 = v11;
          objc_msgSend(v10, "_coordinate");
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          v17 = (id)objc_claimAutoreleasedReturnValue(+[GEOComposedRouteAnchorPoint anchorPointWithCoordinate:isCurrentLocation:name:](GEOComposedRouteAnchorPoint, "anchorPointWithCoordinate:isCurrentLocation:name:", 1, v16, v12, v14, 1.79769313e308));

        }
        else
        {
          v18 = objc_alloc((Class)GEOComposedRouteAnchorPoint);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
          v17 = objc_msgSend(v18, "initWithMapItem:", v15);
        }

        -[GEOComposedRouteAnchorPointList appendAnchorPoint:](v4, "appendAnchorPoint:", v17);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v19 = objc_msgSend(objc_alloc((Class)a1), "initWithReason:anchorPoints:", 0, v4);
  return v19;
}

- (void)updateWithSuccessfulRoute:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPointList *v5;
  GEOComposedRouteAnchorPointList *anchorPoints;
  GEOComposedGeometryRoutePersistentData *v7;
  GEOComposedGeometryRoutePersistentData *routePersistentData;

  v4 = a3;
  v5 = (GEOComposedRouteAnchorPointList *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorPoints"));
  anchorPoints = self->_anchorPoints;
  self->_anchorPoints = v5;

  v7 = (GEOComposedGeometryRoutePersistentData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentData"));
  routePersistentData = self->_routePersistentData;
  self->_routePersistentData = v7;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCreationEditState anchorPoints](self, "anchorPoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anchorPoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geo_map:", &stru_1011B36B0));

  v6 = objc_opt_class(self);
  v7 = -[RouteCreationEditState reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p reason: %lu, anchor points:\n\t%@\n>"), v6, self, v7, v8));

  return v9;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (GEOComposedGeometryRoutePersistentData)routePersistentData
{
  return self->_routePersistentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePersistentData, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
}

@end
