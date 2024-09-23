@implementation RouteMarkerFormatterCustomText

- (RouteMarkerFormatterCustomText)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4 customSelectedRouteText:(id)a5
{
  id v8;
  id v9;
  RouteMarkerFormatterCustomText *v10;
  NSArray *v11;
  NSArray *routes;
  NSString *v13;
  NSString *selectedRouteCustomText;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RouteMarkerFormatterCustomText;
  v10 = -[RouteMarkerFormatterCustomText init](&v16, "init");
  if (v10)
  {
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    routes = v10->_routes;
    v10->_routes = v11;

    v10->_selectedRouteIndex = a4;
    v13 = (NSString *)objc_msgSend(v9, "copy");
    selectedRouteCustomText = v10->_selectedRouteCustomText;
    v10->_selectedRouteCustomText = v13;

  }
  return v10;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  RouteMarkerFormatterInfo *v7;
  RouteMarkerFormatterInfo *v8;
  NSString *selectedRouteCustomText;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterCustomText routes](self, "routes"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = 0;
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL && v6 == (id)self->_selectedRouteIndex)
  {
    v8 = [RouteMarkerFormatterInfo alloc];
    selectedRouteCustomText = self->_selectedRouteCustomText;
    v10 = objc_msgSend(v4, "tollCurrencyType");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisoriesStyleAttributes"));
    v7 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:](v8, "initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:", selectedRouteCustomText, 0, v10, v11);

  }
  return v7;
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);
  objc_storeStrong((id *)&self->_routes, 0);
}

@end
