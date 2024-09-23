@implementation CarRouteGeniusSuggestionsCardViewController

- (CarRouteGeniusSuggestionsCardViewController)init
{
  CarRouteGeniusSuggestionsCardViewController *v2;
  CarMapsSuggestionsView *v3;
  CarMapsSuggestionsView *suggestionsView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarRouteGeniusSuggestionsCardViewController;
  v2 = -[CarRouteGeniusSuggestionsCardViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CarMapsSuggestionsView);
    suggestionsView = v2->_suggestionsView;
    v2->_suggestionsView = v3;

  }
  return v2;
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
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
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
  objc_super v31;
  _QWORD v32[4];

  v31.receiver = self;
  v31.super_class = (Class)CarRouteGeniusSuggestionsCardViewController;
  -[CarRouteGeniusSuggestionsCardViewController viewDidLoad](&v31, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v4, "addSubview:", v5);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v32[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v32[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v32[3] = v14;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 1, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController view](self, "view"));
  LODWORD(v18) = 1148846080;
  objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 1, v18);

}

- (void)setRouteIsNavigable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v4, "setRouteIsNavigable:", v3);

}

- (void)setCurrentSuggestion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v5, "setCurrentSuggestion:", v6);

  objc_sync_exit(v4);
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSuggestion"));

  objc_sync_exit(v3);
  return (MapsSuggestionsRouteGeniusEntry *)v5;
}

- (void)setCurrentETA:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v5, "setCurrentETA:", v4);

}

- (GuidanceETA)currentETA
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentETA"));

  return (GuidanceETA *)v3;
}

- (CarChromeViewController)chromeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));

  return (CarChromeViewController *)v3;
}

- (void)becomeCurrent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v2, "startHideSelectLabelTimer");

}

- (void)resignCurrent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusSuggestionsCardViewController suggestionsView](self, "suggestionsView"));
  objc_msgSend(v2, "stopHideSelectLabelTimer");

}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (CarMapsSuggestionsView)suggestionsView
{
  return self->_suggestionsView;
}

- (void)setSuggestionsView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsView, 0);
}

@end
