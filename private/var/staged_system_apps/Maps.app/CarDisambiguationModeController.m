@implementation CarDisambiguationModeController

- (CarDisambiguationModeController)initWithSearchInfo:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  CarDisambiguationModeController *v9;
  CarDisambiguationModeController *v10;
  id v11;
  id resultCompletionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarDisambiguationModeController;
  v9 = -[CarBaseSearchViewController initWithDisabledETAUpdates:](&v14, "initWithDisabledETAUpdates:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchInfo, a3);
    v11 = objc_msgSend(v8, "copy");
    resultCompletionBlock = v10->_resultCompletionBlock;
    v10->_resultCompletionBlock = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  void *v5;
  CarTableView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CarDisambiguationModeController;
  -[CarDisambiguationModeController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisambiguationModeController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarDisambiguationView"));

  v4 = [CarTableView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisambiguationModeController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  -[CarBaseSearchViewController setTableView:](self, "setTableView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CarDisambiguationTableView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setRowHeight:", UITableViewAutomaticDimension);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v15 = objc_opt_class(CarSearchItemCell);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", v15, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisambiguationModeController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v17, "addSubview:", v18);

}

- (BOOL)showsMapView
{
  return 0;
}

- (id)desiredCards
{
  const __CFString *v3;

  v3 = CFSTR("primary");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("primary")))
  {
    objc_msgSend(v6, "setContent:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Did you mean... [CarPlay disambiguation title]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v8);

    HIDWORD(v24) = 0;
    *(_DWORD *)((char *)&v24 + 1) = 0;
    v14 = xmmword_100E34B90;
    v15 = xmmword_100E2D550;
    v16 = 3;
    v17 = 1148846080;
    v18 = 2;
    LODWORD(v19) = 1148846080;
    v20 = 0;
    v21 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v22 = _Q0;
    v23 = _Q0;
    LOBYTE(v24) = 1;
    v25 = 8;
    LOBYTE(v26) = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v14);
    objc_msgSend(v6, "setAccessory:", 1, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  void (**resultCompletionBlock)(id, uint64_t, id);
  id v5;

  resultCompletionBlock = (void (**)(id, uint64_t, id))self->_resultCompletionBlock;
  if (resultCompletionBlock)
    resultCompletionBlock[2](resultCompletionBlock, -1, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance", a3));
  objc_msgSend(v5, "popFromContext:", self);

}

- (id)itemAtIndexPath:(id)a3
{
  SearchInfo *searchInfo;
  id v4;
  void *v5;
  id v6;
  void *v7;

  searchInfo = self->_searchInfo;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](searchInfo, "results"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self->_searchInfo, "results", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void (**resultCompletionBlock)(id, id);
  objc_super v8;

  v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CarDisambiguationModeController;
  -[CarBaseSearchViewController tableView:didSelectRowAtIndexPath:](&v8, "tableView:didSelectRowAtIndexPath:", a3, v6);
  resultCompletionBlock = (void (**)(id, id))self->_resultCompletionBlock;
  if (resultCompletionBlock)
    resultCompletionBlock[2](resultCompletionBlock, objc_msgSend(v6, "row"));

}

- (NSArray)carFocusOrderSequences
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisambiguationModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemRepresentingOverlays"));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v4, 5));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v6;
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarDisambiguationModeController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_car_visibleCells"));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (int)currentUsageTarget
{
  return 503;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_resultCompletionBlock, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
}

@end
