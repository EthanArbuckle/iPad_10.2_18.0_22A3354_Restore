@implementation CarActionButtonsCardViewController

- (CarActionButtonsCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarActionButtonsCardViewController *v5;
  CarActionButtonsCardViewController *v6;
  void *v7;
  unsigned int v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *offlinePlaceholderQueue;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CarActionButtonsCardViewController;
  v5 = -[CarActionButtonsCardViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v8 = objc_msgSend(v7, "isUsingOfflineMaps");

    if (v8)
    {
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v10);
      offlinePlaceholderQueue = v6->_offlinePlaceholderQueue;
      v6->_offlinePlaceholderQueue = (OS_dispatch_queue *)v11;

      -[CarActionButtonsCardViewController checkFullTextSearchSupport](v6, "checkFullTextSearchSupport");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, "checkFullTextSearchSupport", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[4];
  _QWORD v51[2];

  v49.receiver = self;
  v49.super_class = (Class)CarActionButtonsCardViewController;
  -[CarActionButtonsCardViewController viewDidLoad](&v49, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController _getSearchButtonTitle](self, "_getSearchButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("magnifyingglass"), UIFontTextStyleTitle3, 4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarActionButton actionButtonWithTitle:image:](CarActionButton, "actionButtonWithTitle:image:", v3, v4));
  -[CarActionButtonsCardViewController setSearchButton:](self, "setSearchButton:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("SearchButton"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CarPlay_DestinationsButton"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("mappin"), UIFontTextStyleTitle3, 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarActionButton actionButtonWithTitle:image:](CarActionButton, "actionButtonWithTitle:image:", v10, v11));
  -[CarActionButtonsCardViewController setDestinationsButton:](self, "setDestinationsButton:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("DestinationsButton"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);

  v16 = objc_alloc((Class)UIStackView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  v51[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));
  v51[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
  v20 = objc_msgSend(v16, "initWithArrangedSubviews:", v19);
  -[CarActionButtonsCardViewController setButtonStack:](self, "setButtonStack:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v22, "setAxis:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v23, "setDistribution:", 2);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v24, "setSpacing:", 2.0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("CarActionsCard"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v26, "addSubview:", v27);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v50[0] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leftAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leftAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v50[1] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "rightAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v50[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController buttonStack](self, "buttonStack"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  v50[3] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

}

- (void)_buttonTapped:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CarActionButtonsCardViewController *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));

  if (v4 == v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController delegate](self, "delegate"));
    v8 = v7;
    v9 = self;
    v10 = 0;
    goto LABEL_5;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));

  v6 = v11;
  if (v5 == v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController delegate](self, "delegate"));
    v8 = v7;
    v9 = self;
    v10 = 1;
LABEL_5:
    objc_msgSend(v7, "actionButtonsCard:didSelectAction:", v9, v10);

    v6 = v11;
  }

}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{

  return 0;
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController destinationsButton](self, "destinationsButton"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return (NSArray *)v5;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarActionButtonsCardViewController searchButton](self, "searchButton"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (id)_getSearchButtonTitle
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 supportsFullTextSearch;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CarPlay_SearchButton"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (!objc_msgSend(v5, "isUsingOfflineMaps"))
    goto LABEL_4;
  supportsFullTextSearch = self->_supportsFullTextSearch;

  if (!supportsFullTextSearch)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_SearchButton_Offline"), CFSTR("localized string not found"), 0));

    v4 = (void *)v7;
LABEL_4:

  }
  return v4;
}

- (void)checkFullTextSearchSupport
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *offlinePlaceholderQueue;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_offlinePlaceholderQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v4);
    offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
    self->_offlinePlaceholderQueue = v5;

  }
  objc_initWeak(&location, self);
  v7 = self->_offlinePlaceholderQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F61DC;
  v8[3] = &unk_1011AD260;
  objc_copyWeak(&v9, &location);
  dispatch_async(v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (CarActionButtonsCardViewControllerDelegate)delegate
{
  return (CarActionButtonsCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CarActionButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchButton, a3);
}

- (CarActionButton)destinationsButton
{
  return self->_destinationsButton;
}

- (void)setDestinationsButton:(id)a3
{
  objc_storeStrong((id *)&self->_destinationsButton, a3);
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_destinationsButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
}

@end
