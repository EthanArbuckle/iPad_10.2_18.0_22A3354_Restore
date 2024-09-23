@implementation ParkedCarInfoCardViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  -[InfoCardViewController viewDidLoad](&v3, "viewDidLoad");
  -[ParkedCarInfoCardViewController _loadParkedCarViewControllerIfNeeded](self, "_loadParkedCarViewControllerIfNeeded");
}

- (void)didBecomeCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  -[ContaineeViewController didBecomeCurrent](&v3, "didBecomeCurrent");
  -[ParkedCarViewController setActive:](self->_parkedCarViewController, "setActive:", 1);
}

- (void)didResignCurrent
{
  objc_super v3;

  -[ParkedCarViewController setActive:](self->_parkedCarViewController, "setActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ParkedCarInfoCardViewController;
  -[ContaineeViewController didResignCurrent](&v3, "didResignCurrent");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarInfoCardViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ParkedCarViewController setActive:](self->_parkedCarViewController, "setActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarInfoCardViewController;
  -[InfoCardViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[ParkedCarViewController setActive:](self->_parkedCarViewController, "setActive:", 0);
}

- (void)_loadParkedCarViewControllerIfNeeded
{
  ParkedCarViewController *v3;
  ParkedCarViewController *parkedCarViewController;

  if (!self->_parkedCarViewController)
  {
    v3 = objc_alloc_init(ParkedCarViewController);
    parkedCarViewController = self->_parkedCarViewController;
    self->_parkedCarViewController = v3;

    -[ParkedCarViewController setParkedCarDelegate:](self->_parkedCarViewController, "setParkedCarDelegate:", self);
    -[InfoCardViewController setContentViewController:](self, "setContentViewController:", self->_parkedCarViewController);
  }
}

- (void)performAction:(int64_t)a3
{
  -[ParkedCarViewController performAction:](self->_parkedCarViewController, "performAction:", a3);
}

- (void)handleDismissAction:(id)a3
{
  id v4;

  -[ParkedCarViewController instrumentDismissAction](self->_parkedCarViewController, "instrumentDismissAction", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController delegate](self, "delegate"));
  objc_msgSend(v4, "viewControllerClosed:animated:", self, 1);

}

- (void)setParkedCar:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ParkedCarInfoCardViewController _loadParkedCarViewControllerIfNeeded](self, "_loadParkedCarViewControllerIfNeeded");
  -[ParkedCarViewController setParkedCar:](self->_parkedCarViewController, "setParkedCar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v6, "setTitle:", v5);

  -[ParkedCarInfoCardViewController hideHeader](self, "hideHeader");
}

- (void)hideHeader
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v3, "setHideTitleLabel:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v6, "setHairLineAlpha:", 0.0);

}

- (ParkedCar)parkedCar
{
  return -[ParkedCarViewController parkedCar](self->_parkedCarViewController, "parkedCar");
}

- (void)willChangeLayout:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ParkedCarInfoCardViewController;
  -[InfoCardViewController willChangeLayout:](&v5, "willChangeLayout:");
  if (a3 - 1 <= 1)
    -[ParkedCarViewController dismissTextField](self->_parkedCarViewController, "dismissTextField");
}

- (void)handleShareWithPresentationOptions:(id)a3
{
  -[ParkedCarInfoCardViewController parkedCarViewControllerDidSelectShare:](self, "parkedCarViewControllerDidSelectShare:", self->_parkedCarViewController);
}

- (void)parkedCarViewControllerDidSelectShare:(id)a3
{
  SearchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchResult *v10;

  v4 = [SearchResult alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController parkedCar](self, "parkedCar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v10 = -[SearchResult initWithMapItem:](v4, "initWithMapItem:", v6);

  -[SearchResult setReverseGeocoded:](v10, "setReverseGeocoded:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult contactForSharingToMessages](v10, "contactForSharingToMessages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v10, v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController delegate](self, "delegate"));
  objc_msgSend(v9, "viewController:doShareSheetForShareItem:completion:", 0, v8, 0);

}

- (void)parkerCarViewControllerDidSelectDoDirections:(id)a3 transportType:(int64_t)a4
{
  SearchFieldItem *v6;
  void *v7;
  SearchFieldItem *v8;
  SearchResult *v9;
  void *v10;
  SearchResult *v11;
  DirectionItem *v12;
  void *v13;
  DirectionItem *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _UNKNOWN **v18;
  _QWORD v19[2];

  v6 = objc_alloc_init(SearchFieldItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  -[SearchFieldItem setSearchResult:](v6, "setSearchResult:", v7);

  v8 = objc_alloc_init(SearchFieldItem);
  v9 = [SearchResult alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController parkedCar](self, "parkedCar"));
  v11 = -[SearchResult initWithParkedCar:](v9, "initWithParkedCar:", v10);
  -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v11);

  v12 = [DirectionItem alloc];
  v19[0] = v6;
  v19[1] = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v14 = -[DirectionItem initWithItems:transportType:](v12, "initWithItems:transportType:", v13, a4);

  v17 = CFSTR("DirectionsSessionInitiatorKey");
  v18 = &off_10126CEC8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController delegate](self, "delegate"));
  objc_msgSend(v16, "viewController:doDirectionItem:withUserInfo:", self, v14, v15);

}

- (void)parkedCarViewControllerDidRequestDismissal:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarInfoCardViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "viewControllerClosed:animated:", self, 1);

}

- (void)parkedCarViewControllerDidBeginEditing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsLayout:", 3);

}

- (ActionCoordination)delegate
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parkedCarViewController, 0);
}

@end
