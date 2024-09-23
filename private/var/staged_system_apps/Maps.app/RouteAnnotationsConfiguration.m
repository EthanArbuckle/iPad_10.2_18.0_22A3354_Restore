@implementation RouteAnnotationsConfiguration

- (RouteAnnotationsConfiguration)init
{
  return -[RouteAnnotationsConfiguration initWithRoute:](self, "initWithRoute:", 0);
}

- (RouteAnnotationsConfiguration)initWithRoute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RouteAnnotationsConfiguration *v7;
  id v9;

  if (a3)
  {
    v9 = a3;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = -[RouteAnnotationsConfiguration initWithRoutes:selectedRouteIndex:](self, "initWithRoutes:selectedRouteIndex:", v5, v6, v9);

  return v7;
}

- (RouteAnnotationsConfiguration)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  id v7;
  RouteAnnotationsConfiguration *v8;
  NSArray *v9;
  NSArray *routes;
  objc_super v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v12.receiver = self;
  v12.super_class = (Class)RouteAnnotationsConfiguration;
  v8 = -[RouteAnnotationsConfiguration init](&v12, "init");
  if (v8)
  {
    if ((unint64_t)v7 <= a4)
      a4 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    routes = v8->_routes;
    v8->_routes = v9;

    v8->_selectedRouteIndex = a4;
    v8->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8->_routeMarkerOptions = 3;
    *(_WORD *)&v8->_selectPolyline = 257;
  }

  return v8;
}

- (void)setRoutes:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  -[RouteAnnotationsConfiguration _setRoutes:selectedRouteIndex:](self, "_setRoutes:selectedRouteIndex:", v5, v4);

}

- (void)_setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  NSArray *v6;
  NSArray *v7;
  unsigned int v8;
  unint64_t *p_selectedRouteIndex;
  unint64_t selectedRouteIndex;
  BOOL v11;
  NSArray *v12;
  NSArray *routes;
  NSArray *v14;

  v6 = (NSArray *)a3;
  v7 = v6;
  if (self->_routes == v6)
  {
    p_selectedRouteIndex = &self->_selectedRouteIndex;
    if (self->_selectedRouteIndex != a4)
    {
LABEL_11:
      *p_selectedRouteIndex = a4;
LABEL_12:
      self->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v14 = v6;
    v8 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
    v7 = v14;
    p_selectedRouteIndex = &self->_selectedRouteIndex;
    selectedRouteIndex = self->_selectedRouteIndex;
    if (v8)
      v11 = selectedRouteIndex == a4;
    else
      v11 = 0;
    if (!v11)
    {
      if ((v8 & 1) == 0)
      {
        v12 = (NSArray *)-[NSArray copy](v14, "copy");
        routes = self->_routes;
        self->_routes = v12;

        v7 = v14;
      }
      if (selectedRouteIndex == a4)
        goto LABEL_12;
      goto LABEL_11;
    }
  }

}

- (GEOComposedRoute)selectedRoute
{
  unint64_t selectedRouteIndex;
  void *v4;

  selectedRouteIndex = self->_selectedRouteIndex;
  if (selectedRouteIndex >= -[NSArray count](self->_routes, "count"))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_routes, "objectAtIndexedSubscript:", self->_selectedRouteIndex));
  return (GEOComposedRoute *)v4;
}

- (GEOComposedRoute)focusedRoute
{
  unint64_t focusedRouteIndex;
  void *v4;

  focusedRouteIndex = self->_focusedRouteIndex;
  if (focusedRouteIndex >= -[NSArray count](self->_routes, "count"))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_routes, "objectAtIndexedSubscript:", self->_focusedRouteIndex));
  return (GEOComposedRoute *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  RouteAnnotationsMutableConfiguration *v4;

  v4 = -[RouteAnnotationsConfiguration initWithRoute:](+[RouteAnnotationsMutableConfiguration allocWithZone:](RouteAnnotationsMutableConfiguration, "allocWithZone:", a3), "initWithRoute:", 0);
  -[RouteAnnotationsConfiguration _copyPropertiesTo:](self, "_copyPropertiesTo:", v4);
  return v4;
}

- (void)_copyPropertiesTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](self, "routes"));
  objc_msgSend(v11, "setRoutes:", v4);

  objc_msgSend(v11, "setSelectedRouteIndex:", -[RouteAnnotationsConfiguration selectedRouteIndex](self, "selectedRouteIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration originalRouteID](self, "originalRouteID"));
  objc_msgSend(v11, "setOriginalRouteID:", v5);

  objc_msgSend(v11, "setOriginalRouteDivergenceCoordinate:", -[RouteAnnotationsConfiguration originalRouteDivergenceCoordinate](self, "originalRouteDivergenceCoordinate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration transitVehiclePositions](self, "transitVehiclePositions"));
  objc_msgSend(v11, "setTransitVehiclePositions:", v6);

  objc_msgSend(v11, "setStyle:", -[RouteAnnotationsConfiguration style](self, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration selectedRouteCustomText](self, "selectedRouteCustomText"));
  objc_msgSend(v11, "setSelectedRouteCustomText:", v7);

  objc_msgSend(v11, "setRouteMarkerOptions:", -[RouteAnnotationsConfiguration routeMarkerOptions](self, "routeMarkerOptions"));
  objc_msgSend(v11, "setAlternateRoutesEnabled:", -[RouteAnnotationsConfiguration alternateRoutesEnabled](self, "alternateRoutesEnabled"));
  objc_msgSend(v11, "setSelectPolyline:", -[RouteAnnotationsConfiguration selectsPolyline](self, "selectsPolyline"));
  objc_msgSend(v11, "setFocusedRouteIndex:", -[RouteAnnotationsConfiguration focusedRouteIndex](self, "focusedRouteIndex"));
  objc_msgSend(v11, "setRouteTrafficFeaturesActive:", -[RouteAnnotationsConfiguration routeTrafficFeaturesActive](self, "routeTrafficFeaturesActive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](self, "anchorPoints"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v11, "setAnchorPoints:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration currentNavigationWaypoint](self, "currentNavigationWaypoint"));
  objc_msgSend(v11, "setCurrentNavigationWaypoint:", v10);

  objc_msgSend(v11, "setProximityToCurrentNavigationWaypoint:", -[RouteAnnotationsConfiguration proximityToCurrentNavigationWaypoint](self, "proximityToCurrentNavigationWaypoint"));
}

- (NSString)description
{
  RouteAnnotationsConfiguration *v2;
  id v3;
  void ***v4;
  RouteAnnotationsConfiguration *v5;
  RouteAnnotationsConfiguration *v6;
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
  v18 = sub_100688A2C;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[RouteAnnotationsConfiguration _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  RouteAnnotationsConfiguration *v2;
  id v3;
  void ***v4;
  RouteAnnotationsConfiguration *v5;
  RouteAnnotationsConfiguration *v6;
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
  v18 = sub_100688BAC;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[RouteAnnotationsConfiguration _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  NSArray *routes;
  void (**v5)(id, const __CFString *, __CFString *);
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  __CFString *v19;

  routes = self->_routes;
  v5 = (void (**)(id, const __CFString *, __CFString *))a3;
  v6 = sub_10039DCD4(routes, &stru_1011BFB48);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

    }
    else
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
    }
  }
  else
  {
    v10 = CFSTR("<nil>");
  }

  v5[2](v5, CFSTR("routes"), v10);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_selectedRouteIndex));
  v5[2](v5, CFSTR("selectedRouteIndex"), v11);

  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_focusedRouteIndex));
  v5[2](v5, CFSTR("focusedRouteIndex"), v12);

  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_style));
  v5[2](v5, CFSTR("style"), v13);

  v5[2](v5, CFSTR("selectedRouteCustomText"), (__CFString *)self->_selectedRouteCustomText);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_routeMarkerOptions));
  v5[2](v5, CFSTR("routeMarkerOptions"), v14);

  if (self->_selectPolyline)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v5[2](v5, CFSTR("selectPolyline"), (__CFString *)v15);
  if (self->_alternateRoutesEnabled)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v5[2](v5, CFSTR("alternateRoutesEnabled"), (__CFString *)v16);
  if (self->_routeTrafficFeaturesActive)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v5[2](v5, CFSTR("routeTrafficFeaturesActive"), (__CFString *)v17);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[GEOComposedRouteAnchorPointList count](self->_anchorPoints, "count")));
  v5[2](v5, CFSTR("anchorPoints"), v18);

  v5[2](v5, CFSTR("currentNavigationWaypoint"), (__CFString *)self->_currentNavigationWaypoint);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_proximityToCurrentNavigationWaypoint));
  v5[2](v5, CFSTR("proximityToCurrentNavigationWaypoint"), v19);

}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (unint64_t)focusedRouteIndex
{
  return self->_focusedRouteIndex;
}

- (void)setFocusedRouteIndex:(unint64_t)a3
{
  self->_focusedRouteIndex = a3;
}

- (NSUUID)originalRouteID
{
  return self->_originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_originalRouteDivergenceCoordinate;
}

- (void)setOriginalRouteDivergenceCoordinate:(id)a3
{
  self->_originalRouteDivergenceCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (NSArray)transitVehiclePositions
{
  return self->_transitVehiclePositions;
}

- (void)setTransitVehiclePositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (void)setSelectedRouteCustomText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)routeMarkerOptions
{
  return self->_routeMarkerOptions;
}

- (void)setRouteMarkerOptions:(unint64_t)a3
{
  self->_routeMarkerOptions = a3;
}

- (BOOL)selectsPolyline
{
  return self->_selectPolyline;
}

- (void)setSelectPolyline:(BOOL)a3
{
  self->_selectPolyline = a3;
}

- (BOOL)alternateRoutesEnabled
{
  return self->_alternateRoutesEnabled;
}

- (void)setAlternateRoutesEnabled:(BOOL)a3
{
  self->_alternateRoutesEnabled = a3;
}

- (BOOL)routeTrafficFeaturesActive
{
  return self->_routeTrafficFeaturesActive;
}

- (void)setRouteTrafficFeaturesActive:(BOOL)a3
{
  self->_routeTrafficFeaturesActive = a3;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (GEOComposedWaypoint)currentNavigationWaypoint
{
  return self->_currentNavigationWaypoint;
}

- (void)setCurrentNavigationWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_currentNavigationWaypoint, a3);
}

- (unsigned)proximityToCurrentNavigationWaypoint
{
  return self->_proximityToCurrentNavigationWaypoint;
}

- (void)setProximityToCurrentNavigationWaypoint:(unsigned __int8)a3
{
  self->_proximityToCurrentNavigationWaypoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNavigationWaypoint, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);
  objc_storeStrong((id *)&self->_transitVehiclePositions, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_routes, 0);
}

@end
