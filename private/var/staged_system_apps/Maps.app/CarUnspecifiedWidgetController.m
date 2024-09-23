@implementation CarUnspecifiedWidgetController

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  CarUnspecifiedViewController *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)CRSUIDashboardWidgetWindow), "initWithWindowScene:", v6);

  -[CarUnspecifiedWidgetController setWindow:](self, "setWindow:", v7);
  v8 = objc_alloc_init(CarUnspecifiedViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedWidgetController window](self, "window"));
  objc_msgSend(v9, "setRootViewController:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedWidgetController window](self, "window"));
  objc_msgSend(v10, "setHidden:", 0);

}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedWidgetController window](self, "window", a3));
  objc_msgSend(v4, "setHidden:", 1);

  -[CarUnspecifiedWidgetController setWindow:](self, "setWindow:", 0);
}

- (id)contextsForCurrentAppState
{
  return &__NSArray0__struct;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (CRSUIDashboardWidgetWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
}

@end
