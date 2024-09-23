@implementation RouteMarkerFormatterTotal

- (RouteMarkerFormatterTotal)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  RouteMarkerFormatterTotal *v7;
  NSArray *v8;
  NSArray *routes;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteMarkerFormatterTotal;
  v7 = -[RouteMarkerFormatterTotal init](&v11, "init");
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
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t selectedRouteIndex;
  void *v11;
  unsigned int v12;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  RouteMarkerFormatterInfo *v19;
  id v20;
  void *v21;
  RouteMarkerFormatterInfo *v22;

  v4 = a3;
  objc_msgSend(v4, "travelAndChargingDuration");
  v6 = GEOStringForDuration(2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterTotal routes](self, "routes"));
  v9 = objc_msgSend(v8, "indexOfObject:", v4);

  selectedRouteIndex = self->_selectedRouteIndex;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeLabelAction"));
  v12 = objc_msgSend(v11, "detailTextAction");

  v14 = v9 != (id)selectedRouteIndex || v12 != 2;
  v15 = v12 != 1 && v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeLabelDescriptionString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringWithDefaultOptions"));

  if (objc_msgSend(v17, "length") && !v15)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n%@"), v17));

    v7 = (void *)v18;
  }
  v19 = [RouteMarkerFormatterInfo alloc];
  v20 = objc_msgSend(v4, "tollCurrencyType");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisoriesStyleAttributes"));
  v22 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:](v19, "initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:", v7, 0, v20, v21);

  return v22;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "legs"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "legs"));
    v7 = sub_10039DCD4(v6, &stru_1011C5160);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = 0;
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

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
}

@end
