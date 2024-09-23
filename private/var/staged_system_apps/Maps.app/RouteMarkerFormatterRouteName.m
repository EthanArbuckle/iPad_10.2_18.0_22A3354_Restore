@implementation RouteMarkerFormatterRouteName

- (RouteMarkerFormatterRouteName)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  RouteMarkerFormatterRouteName *v7;
  NSArray *v8;
  NSArray *routes;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteMarkerFormatterRouteName;
  v7 = -[RouteMarkerFormatterRouteName init](&v11, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    routes = v7->_routes;
    v7->_routes = v8;

    v7->_selectedRouteIndex = a4;
  }

  return v7;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  RouteMarkerFormatterInfo *v8;
  RouteMarkerFormatterInfo *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterRouteName routes](self, "routes"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  v8 = 0;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 == (id)self->_selectedRouteIndex)
  {
    if (objc_msgSend(v5, "length"))
    {
      v9 = [RouteMarkerFormatterInfo alloc];
      v10 = objc_msgSend(v4, "tollCurrencyType");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisoriesStyleAttributes"));
      v8 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaType:etaComparison:tollCurrency:styleAttributes:](v9, "initWithRouteDescription:etaType:etaComparison:tollCurrency:styleAttributes:", v5, 4, 0, v10, v11);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
}

@end
