@implementation MacContainerViewController

+ (Class)actionCoordinatorClass
{
  return (Class)objc_opt_class(MacBaseActionCoordinator, a2);
}

- (MacContainerViewController)initWithPlatformController:(id)a3
{
  id v4;
  MacContainerViewController *v5;
  MacContainerViewController *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacContainerViewController;
  v5 = -[ControlContainerViewController initWithPlatformController:](&v11, "initWithPlatformController:", v4);
  v6 = v5;
  if (v5)
  {
    -[ContainerViewController setStackOnOppositeSide:](v5, "setStackOnOppositeSide:", 1);
    -[ContainerViewController macSetEnableExtendedPresentationStyles:](v6, "macSetEnableExtendedPresentationStyles:", 1);
    objc_initWeak(&location, v6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1006F5170;
    v8[3] = &unk_1011C0CE0;
    objc_copyWeak(&v9, &location);
    -[ContainerViewController macSetPopoverDismissHandler:](v6, "macSetPopoverDismissHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v9 = v4;
    v5 = &v9;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacContainerViewController view](self, "view"));
    v8 = v4;
    v5 = &v8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 1));

  return v6;
}

- (void)setChromeViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacContainerViewController;
  v4 = a3;
  -[ControlContainerViewController setChromeViewController:](&v6, "setChromeViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacContainerViewController _mapViewIfCurrent](self, "_mapViewIfCurrent", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setCompassEnabled:", 1);

  objc_msgSend(v4, "registerAdditionalMapViewDelegate:", self);
}

- (id)_mapViewIfCurrent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController chromeContext](self, "chromeContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));

  if (v3 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)topSidebarController_forTests
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = objc_opt_respondsToSelector(v3, "topSidebarController_forTests");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topSidebarController_forTests"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)macWillDismissPopoverContaineeController:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacContainerViewController macBaseActionCoordinator](self, "macBaseActionCoordinator"));
  v6 = objc_msgSend(v5, "shouldClearMapSelectionOnDismissOfViewController:", v4);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController actionCoordinator](self, "actionCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapSelectionManager"));
    objc_msgSend(v8, "clearSelectionAnimated:", 1);

  }
  v9.receiver = self;
  v9.super_class = (Class)MacContainerViewController;
  -[ContainerViewController macWillDismissPopoverContaineeController:](&v9, "macWillDismissPopoverContaineeController:", v4);

}

- (void)setSidebarContentInjector:(id)a3
{
  ContaineeContentInjection *v5;
  ContaineeContentInjection **p_sidebarContentInjector;
  ContaineeContentInjection *sidebarContentInjector;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v5 = (ContaineeContentInjection *)a3;
  p_sidebarContentInjector = &self->_sidebarContentInjector;
  sidebarContentInjector = self->_sidebarContentInjector;
  if (sidebarContentInjector != v5)
  {
    -[ContaineeContentInjection removeContentFromMapView](sidebarContentInjector, "removeContentFromMapView");
    -[ContaineeContentInjection setUpdateContentInjection:](*p_sidebarContentInjector, "setUpdateContentInjection:", 0);
    objc_storeStrong((id *)&self->_sidebarContentInjector, a3);
    objc_initWeak(&location, self);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1006F55AC;
    v11 = &unk_1011BBD18;
    objc_copyWeak(&v12, &location);
    -[ContaineeContentInjection setUpdateContentInjection:](*p_sidebarContentInjector, "setUpdateContentInjection:", &v8);
    -[ContaineeContentInjection addContentToMapView](*p_sidebarContentInjector, "addContentToMapView", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (ContaineeContentInjection)sidebarContentInjector
{
  return self->_sidebarContentInjector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarContentInjector, 0);
}

@end
