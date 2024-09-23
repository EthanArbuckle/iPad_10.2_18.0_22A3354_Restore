@implementation MacBaseActionCoordinator

- (id)macChromeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));

  return v3;
}

- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MacBaseActionCoordinator *v18;
  unint64_t v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C5087C;
  v15[3] = &unk_1011C0260;
  v16 = v10;
  v17 = v11;
  v20 = a6;
  v18 = self;
  v19 = a5;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "deferPresentingMapPopoversInsideBlock:", v15);

}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  MacBaseActionCoordinator *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C509A0;
  v15[3] = &unk_1011AF1B0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "deferPresentingMapPopoversInsideBlock:", v15);

}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  MacBaseActionCoordinator *v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;

  v14 = a3;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100C50AC4;
  v19[3] = &unk_1011EA0F0;
  v20 = v15;
  v21 = v14;
  v24 = a5;
  v25 = a7;
  v26 = a8;
  v22 = self;
  v23 = a6;
  v17 = v14;
  v18 = v15;
  objc_msgSend(v16, "deferPresentingMapPopoversInsideBlock:", v19);

}

- (BOOL)shouldReusePlaceCardViewController:(id)a3
{
  return 0;
}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  HomeDeselectionReason *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  -[ActionCoordinator viewControllerGoPreviousState:withSender:](&v7, "viewControllerGoPreviousState:withSender:", a3, a4);
  v5 = -[HomeDeselectionReason initWithAction:]([HomeDeselectionReason alloc], "initWithAction:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
  objc_msgSend(v6, "clearSelectionWithReason:", v5);

}

- (void)toggleRoutePlanning
{
  unsigned int v3;
  unsigned __int8 v4;
  HomeDeselectionReason *v5;
  void *v6;
  objc_super v7;

  v3 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");
  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  -[ActionCoordinator toggleRoutePlanning](&v7, "toggleRoutePlanning");
  v4 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      v5 = -[HomeDeselectionReason initWithAction:]([HomeDeselectionReason alloc], "initWithAction:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
      objc_msgSend(v6, "clearSelectionWithReason:", v5);

    }
  }
}

- (void)handleMapViewTapToDeselect
{
  void *v3;
  HomeDeselectionReason *v4;

  v4 = -[HomeDeselectionReason initWithAction:]([HomeDeselectionReason alloc], "initWithAction:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
  objc_msgSend(v3, "clearSelectionWithReason:", v4);

}

- (BOOL)shouldClearMapSelectionOnDismissOfViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___MapItemProviding))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

    v8 = objc_msgSend(v6, "isMapItemSelected:", v7);
  }
  else
  {
    v9 = objc_opt_class(TransitLineDisambiguationViewController);
    v8 = objc_opt_isKindOfClass(v4, v9) ^ 1;
  }

  return v8 & 1;
}

- (void)makeMapViewFirstResponder
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macChromeViewController](self, "macChromeViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)viewController:(id)a3 removeDroppedPin:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MacBaseActionCoordinator;
  -[ActionCoordinator viewController:removeDroppedPin:](&v8, "viewController:removeDroppedPin:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macChromeViewController](self, "macChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
  objc_msgSend(v7, "clearPreviouslySelectedLabelMarker");

}

- (BOOL)chromeDidClearMapSelection
{
  BOOL v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  v3 = -[ActionCoordinator chromeDidClearMapSelection](&v7, "chromeDidClearMapSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewControllerIfLoaded](self, "placeCardViewControllerIfLoaded"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewControllerIfLoaded](self, "placeCardViewControllerIfLoaded"));
    -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", v5);

  }
  return v3;
}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  objc_msgSend(v5, "deferPresentingMapPopoversInsideBlock:", v4);

}

- (ContaineeContentInjection)sidebarContentInjector
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sidebarContentInjector"));

  return (ContaineeContentInjection *)v3;
}

- (void)setSidebarContentInjector:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator macContainerViewController](self, "macContainerViewController"));
  objc_msgSend(v5, "setSidebarContentInjector:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v6, "setNeedsRebuild");

}

- (CollectionHandler)injectedCollection
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacBaseActionCoordinator sidebarContentInjector](self, "sidebarContentInjector"));
  v3 = objc_opt_class(HomeCollectionContentInjector);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collection"));
  else
    v4 = 0;

  return (CollectionHandler *)v4;
}

@end
