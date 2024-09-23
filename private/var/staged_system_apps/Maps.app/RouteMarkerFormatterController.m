@implementation RouteMarkerFormatterController

- (RouteMarkerFormatterController)init
{
  return -[RouteMarkerFormatterController initWithDelegate:](self, "initWithDelegate:", 0);
}

- (RouteMarkerFormatterController)initWithDelegate:(id)a3
{
  id v4;
  RouteMarkerFormatterController *v5;
  RouteMarkerFormatterController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RouteMarkerFormatterController;
  v5 = -[RouteMarkerFormatterController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController _formatterForStyle:](self, "_formatterForStyle:", -[RouteMarkerFormatterController formattingStyle](self, "formattingStyle")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "markerInfoForRoute:", v4));

  return v6;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController _formatterForStyle:](self, "_formatterForStyle:", -[RouteMarkerFormatterController formattingStyle](self, "formattingStyle")));
  if ((objc_opt_respondsToSelector(v6, a2) & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "markerInfosForLegsInRoute:", v5));
  else
    v7 = 0;

  return v7;
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
  -[RouteMarkerFormatterController setRoutes:selectedRouteIndex:](self, "setRoutes:selectedRouteIndex:", v5, v4);

}

- (void)setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  NSArray *v6;
  NSArray *routes;
  unsigned int v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  v6 = (NSArray *)a3;
  routes = self->_routes;
  v11 = v6;
  if (routes != v6 && (v8 = -[NSArray isEqualToArray:](routes, "isEqualToArray:", v6), v6 = v11, !v8)
    || self->_selectedRouteIndex != a4)
  {
    v9 = (NSArray *)-[NSArray copy](v6, "copy");
    v10 = self->_routes;
    self->_routes = v9;

    self->_selectedRouteIndex = a4;
    -[RouteMarkerFormatterController _clearFormatters](self, "_clearFormatters");
    v6 = v11;
  }

}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  id v4;

  if (self->_selectedRouteIndex != a3)
  {
    self->_selectedRouteIndex = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController totalTimeFormatter](self, "totalTimeFormatter"));
    objc_msgSend(v4, "setSelectedRouteIndex:", a3);

  }
}

- (void)setSelectedRouteCustomText:(id)a3
{
  NSString *v4;
  NSString *selectedRouteCustomText;
  RouteMarkerFormatterCustomText *customTextFormatter;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  selectedRouteCustomText = self->_selectedRouteCustomText;
  self->_selectedRouteCustomText = v4;

  customTextFormatter = self->_customTextFormatter;
  self->_customTextFormatter = 0;

}

- (void)_clearFormatters
{
  RouteMarkerFormatterTotal *totalTimeFormatter;
  RouteMarkerFormatterETA *etaFormatter;
  RouteMarkerFormatterCustomText *customTextFormatter;

  totalTimeFormatter = self->_totalTimeFormatter;
  self->_totalTimeFormatter = 0;

  etaFormatter = self->_etaFormatter;
  self->_etaFormatter = 0;

  customTextFormatter = self->_customTextFormatter;
  self->_customTextFormatter = 0;

}

- (id)_formatterForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController totalTimeFormatter](self, "totalTimeFormatter", v3, v4));
      break;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController etaFormatter](self, "etaFormatter", v3, v4));
      break;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController nameFormatter](self, "nameFormatter", v3, v4));
      break;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController customTextFormatter](self, "customTextFormatter", v3, v4));
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (RouteMarkerFormatterTotal)totalTimeFormatter
{
  RouteMarkerFormatterTotal *totalTimeFormatter;
  RouteMarkerFormatterTotal *v4;
  RouteMarkerFormatterTotal *v5;

  totalTimeFormatter = self->_totalTimeFormatter;
  if (!totalTimeFormatter)
  {
    v4 = -[RouteMarkerFormatterTotal initWithRoutes:selectedRouteIndex:]([RouteMarkerFormatterTotal alloc], "initWithRoutes:selectedRouteIndex:", self->_routes, -[RouteMarkerFormatterController selectedRouteIndex](self, "selectedRouteIndex"));
    v5 = self->_totalTimeFormatter;
    self->_totalTimeFormatter = v4;

    totalTimeFormatter = self->_totalTimeFormatter;
  }
  return totalTimeFormatter;
}

- (RouteMarkerFormatterETA)etaFormatter
{
  RouteMarkerFormatterETA *etaFormatter;
  RouteMarkerFormatterETA *v4;
  void *v5;
  RouteMarkerFormatterETA *v6;
  RouteMarkerFormatterETA *v7;

  etaFormatter = self->_etaFormatter;
  if (!etaFormatter)
  {
    v4 = [RouteMarkerFormatterETA alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = -[RouteMarkerFormatterETA initWithNavigationService:](v4, "initWithNavigationService:", v5);
    v7 = self->_etaFormatter;
    self->_etaFormatter = v6;

    -[RouteMarkerFormatterETA setDelegate:](self->_etaFormatter, "setDelegate:", self);
    etaFormatter = self->_etaFormatter;
  }
  return etaFormatter;
}

- (RouteMarkerFormatterRouteName)nameFormatter
{
  RouteMarkerFormatterRouteName *nameFormatter;
  RouteMarkerFormatterRouteName *v4;
  RouteMarkerFormatterRouteName *v5;

  nameFormatter = self->_nameFormatter;
  if (!nameFormatter)
  {
    v4 = -[RouteMarkerFormatterRouteName initWithRoutes:selectedRouteIndex:]([RouteMarkerFormatterRouteName alloc], "initWithRoutes:selectedRouteIndex:", self->_routes, -[RouteMarkerFormatterController selectedRouteIndex](self, "selectedRouteIndex"));
    v5 = self->_nameFormatter;
    self->_nameFormatter = v4;

    nameFormatter = self->_nameFormatter;
  }
  return nameFormatter;
}

- (RouteMarkerFormatterCustomText)customTextFormatter
{
  RouteMarkerFormatterCustomText *customTextFormatter;
  RouteMarkerFormatterCustomText *v4;
  NSArray *routes;
  unint64_t v6;
  void *v7;
  RouteMarkerFormatterCustomText *v8;
  RouteMarkerFormatterCustomText *v9;

  customTextFormatter = self->_customTextFormatter;
  if (!customTextFormatter)
  {
    v4 = [RouteMarkerFormatterCustomText alloc];
    routes = self->_routes;
    v6 = -[RouteMarkerFormatterController selectedRouteIndex](self, "selectedRouteIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController selectedRouteCustomText](self, "selectedRouteCustomText"));
    v8 = -[RouteMarkerFormatterCustomText initWithRoutes:selectedRouteIndex:customSelectedRouteText:](v4, "initWithRoutes:selectedRouteIndex:customSelectedRouteText:", routes, v6, v7);
    v9 = self->_customTextFormatter;
    self->_customTextFormatter = v8;

    customTextFormatter = self->_customTextFormatter;
  }
  return customTextFormatter;
}

- (void)routeMarkerFormatterETA:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((id)-[RouteMarkerFormatterController formattingStyle](self, "formattingStyle") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterController delegate](self, "delegate"));
    objc_msgSend(v5, "routeMarkerFormatterController:didUpdateMarkerInfoForRoutes:", self, v6);

  }
}

- (unint64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(unint64_t)a3
{
  self->_formattingStyle = a3;
}

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (RouteMarkerFormatterControllerDelegate)delegate
{
  return (RouteMarkerFormatterControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setTotalTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_totalTimeFormatter, a3);
}

- (void)setEtaFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_etaFormatter, a3);
}

- (void)setNameFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_nameFormatter, a3);
}

- (void)setCustomTextFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_customTextFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTextFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_etaFormatter, 0);
  objc_storeStrong((id *)&self->_totalTimeFormatter, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);
}

@end
