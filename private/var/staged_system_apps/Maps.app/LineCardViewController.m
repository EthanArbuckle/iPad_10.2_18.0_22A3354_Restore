@implementation LineCardViewController

- (LineCardViewController)init
{
  LineCardViewController *v2;
  LineCardViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LineCardViewController;
  v2 = -[LineCardViewController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v4, "setAlwaysUseDefaultContaineeLayout:", 1);

  }
  return v3;
}

- (void)viewDidLoad
{
  GEOTransitLineItem *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LineCardViewController;
  -[InfoCardViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = self->_lineItem;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem name](v3, "name"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem system](v3, "system"));

    v3 = (GEOTransitLineItem *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem name](v3, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v8, "setTitle:", v7);

}

- (BOOL)lineItemIsLoading
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItemViewController](self, "lineItemViewController"));
  v3 = objc_msgSend(v2, "isLoading");

  return v3;
}

- (void)setLineItem:(id)a3 loading:(BOOL)a4
{
  -[LineCardViewController setLineItem:labelMarker:loading:preferredLayout:](self, "setLineItem:labelMarker:loading:preferredLayout:", a3, 0, a4, 0);
}

- (void)setLineItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 preferredLayout:(unint64_t)a6
{
  _BOOL8 v7;
  id v11;
  void *v12;
  GEOTransitLineItem *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  GEOTransitLineItem *v20;

  v7 = a5;
  v20 = (GEOTransitLineItem *)a3;
  v11 = a4;
  if (self->_lineItem != v20 || -[LineCardViewController lineItemIsLoading](self, "lineItemIsLoading") != v7)
  {
    objc_storeStrong((id *)&self->_lineItem, a3);
    objc_storeStrong((id *)&self->_labelMarker, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItemViewController](self, "lineItemViewController"));
    objc_msgSend(v12, "setTransitLineItem:loading:", v20, v7);

    v13 = self->_lineItem;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem name](v13, "name"));
    v15 = objc_msgSend(v14, "length");

    if (!v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem system](v13, "system"));

      v13 = (GEOTransitLineItem *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitLineItem name](v13, "name"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v18, "setTitle:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v19, "setHairLineAlpha:", 0.0);

    -[InfoCardViewController rebuildHeaderMenu](self, "rebuildHeaderMenu");
    self->_didInsertInHistory = 0;
    self->_preferredLayout = a6;
    if ((sub_1002589D4(v20) & 1) == 0)
      -[LineCardViewController insertInHistory](self, "insertInHistory");
  }

}

- (void)resetNearestStation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItemViewController](self, "lineItemViewController"));
  objc_msgSend(v2, "resetNearestStation");

}

- (MUTransitLineItemViewController)lineItemViewController
{
  MUTransitLineItemViewController *lineItemViewController;
  id v4;
  void *v5;
  MUTransitLineItemViewController *v6;
  MUTransitLineItemViewController *v7;
  void *v8;
  void *v9;

  lineItemViewController = self->_lineItemViewController;
  if (!lineItemViewController)
  {
    v4 = objc_alloc((Class)MUTransitLineItemViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItem](self, "lineItem"));
    v6 = (MUTransitLineItemViewController *)objc_msgSend(v4, "initWithTransitLineItem:", v5);
    v7 = self->_lineItemViewController;
    self->_lineItemViewController = v6;

    -[MUTransitLineItemViewController setDelegate:](self->_lineItemViewController, "setDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MUTransitLineItemViewController view](self->_lineItemViewController, "view"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[InfoCardViewController setContentViewController:](self, "setContentViewController:", self->_lineItemViewController);
    lineItemViewController = self->_lineItemViewController;
  }
  return lineItemViewController;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  unint64_t preferredLayout;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LineCardViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v7, "willChangeContainerStyle:");
  if (a3 == 6)
  {
    preferredLayout = 4;
  }
  else if (self->_preferredLayout)
  {
    preferredLayout = self->_preferredLayout;
  }
  else
  {
    preferredLayout = 2;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setDefaultContaineeLayout:", preferredLayout);

}

- (void)insertInHistory
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (!self->_didInsertInHistory)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItem](self, "lineItem"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineItem](self, "lineItem"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100604738;
      v5[3] = &unk_1011B1BE0;
      v5[4] = self;
      +[HistoryEntryRecentsItem saveLineItem:completion:](HistoryEntryRecentsItem, "saveLineItem:completion:", v4, v5);

    }
  }
}

- (BOOL)supportsSharing
{
  return 0;
}

- (id)headerActionItems
{
  return -[MUTransitLineItemViewController createMenuActions](self->_lineItemViewController, "createMenuActions");
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  -[MUTransitLineItemViewController performAction:options:completion:](self->_lineItemViewController, "performAction:options:completion:", a3, a4, a5);
}

- (void)lineItemViewControllerDidSelectReportAProblem:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapPresenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100604800;
  v6[3] = &unk_1011B4160;
  v6[4] = self;
  objc_msgSend(v5, "presentReportAProblemFromTransitLineCardWithEditingContext:completion:", v6, 0);

}

- (void)lineItemViewController:(id)a3 didSelectDirectionsToNearestStation:(id)a4 withTransportTypePreference:(id)a5
{
  id v7;
  id v8;
  SearchFieldItem *v9;
  void *v10;
  SearchFieldItem *v11;
  SearchResult *v12;
  char *v13;
  uint64_t v14;
  DirectionItem *v15;
  void *v16;
  DirectionItem *v17;
  void *v18;
  _QWORD v19[2];

  v7 = a5;
  if (a4)
  {
    v8 = a4;
    v9 = objc_alloc_init(SearchFieldItem);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v9, "setSearchResult:", v10);

    v11 = objc_alloc_init(SearchFieldItem);
    v12 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);

    -[SearchFieldItem setSearchResult:](v11, "setSearchResult:", v12);
    if (v7)
    {
      v13 = (char *)objc_msgSend(v7, "integerValue");
      if ((unint64_t)(v13 - 1) < 4)
        v14 = (uint64_t)(v13 + 1);
      else
        v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    v15 = [DirectionItem alloc];
    v19[0] = v9;
    v19[1] = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v17 = -[DirectionItem initWithItems:transportType:](v15, "initWithItems:transportType:", v16, v14);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate"));
    objc_msgSend(v18, "lineCardViewController:doDirectionItem:", self, v17);

  }
}

- (void)lineItemViewController:(id)a3 didSelectNearestStation:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate"));
    objc_msgSend(v6, "lineCardViewController:selectMapItem:", self, v5);

  }
}

- (void)lineItemViewController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate"));
  objc_msgSend(v6, "lineCardViewController:showIncidents:", self, v5);

}

- (void)lineItemViewControllerDidSelectViewOnMap:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitLineItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));

  if (v5)
  {
    if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL____MKInfoCardAnalyticsDelegate))
    {
      v6 = v11;
      objc_msgSend(v6, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 7004, -[LineCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0, 0, 0);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "wantsLayout:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitLineItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapRegion"));
    objc_msgSend(v8, "lineCardViewController:displayMapRegion:", self, v10);

  }
}

- (double)lineItemViewControllerHeaderTitleTrailingConstant:(id)a3
{
  return 35.0;
}

- (void)lineItemViewControllerDidAppear:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate", a3));
  objc_msgSend(v4, "lineCardViewControllerDidAppear:", self);

}

- (void)lineItemViewController:(id)a3 openURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LineCardViewController lineCardDelegate](self, "lineCardDelegate"));
  objc_msgSend(v6, "lineCardViewController:openURL:", self, v5);

}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (LineCardViewControllerDelegate)lineCardDelegate
{
  return (LineCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_lineCardDelegate);
}

- (void)setLineCardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lineCardDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lineCardDelegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_storeStrong((id *)&self->_lineItemViewController, 0);
}

@end
