@implementation RAPPersonalPlaceSelectionViewController

- (RAPPersonalPlaceSelectionViewController)initWithQuestion:(id)a3
{
  id v5;
  RAPPersonalPlaceSelectionViewController *v6;
  RAPPersonalPlaceSelectionViewController *v7;
  uint64_t v8;
  RAPReport *rapReport;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RAPPersonalPlaceSelectionViewController;
  v6 = -[RAPPersonalPlaceSelectionViewController initWithStyle:](&v12, "initWithStyle:", 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_question, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "report"));
    rapReport = v7->_rapReport;
    v7->_rapReport = (RAPReport *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedTitle"));
    -[RAPPersonalPlaceSelectionViewController setTitle:](v7, "setTitle:", v10);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RAPPersonalPlaceSelectionViewController *v13;
  id v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RAPPersonalPlaceSelectionViewController;
  -[RAPPersonalPlaceSelectionViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedRowHeight:", 55.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView"));
  v6 = objc_opt_class(RAPTwoLinesMenuTableViewCell);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v8, "_maps_initializeRAPAppearance");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setBackButtonTitle:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController navigationController](self, "navigationController"));
  v13 = (RAPPersonalPlaceSelectionViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootViewController"));

  if (v13 == self)
  {
    v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancel:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setLeftBarButtonItem:", v14);

  }
  -[RAPPersonalPlaceSelectionViewController updateAddresses](self, "updateAddresses");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPPersonalPlaceSelectionViewController;
  -[RAPPersonalPlaceSelectionViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "updateAddresses", CFSTR("MapsLocationOfInterestDidChangeNotification"), 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPPersonalPlaceSelectionViewController;
  -[RAPPersonalPlaceSelectionViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  unsigned int v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView", a4, a3.width, a3.height));
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController tableView](self, "tableView"));
    objc_msgSend(v7, "reloadData");

  }
}

- (void)updateAddresses
{
  RAPPersonalPlaceCorrectionsWhichOneQuestion *question;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  question = self->_question;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100691CD8;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  -[RAPPersonalPlaceCorrectionsWhichOneQuestion refreshMainMenuItemsWithCallback:](question, "refreshMainMenuItemsWithCallback:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancel:(id)a3
{
  -[RAPPersonalPlaceSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)homeWorkCorrectionQuestionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController question](self, "question"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainMenuItems"));
  v7 = objc_msgSend(v4, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuItems](self->_question, "mainMenuItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Address [Home Work Editor]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_groupedHeaderViewWithTitle:", v6));

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RAPTwoLinesMenuTableViewCell *v9;
  RAPTwoLinesMenuTableViewCell *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
  v9 = (RAPTwoLinesMenuTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8));

  if (!v9)
  {
    v10 = [RAPTwoLinesMenuTableViewCell alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
    v9 = -[RAPTwoLinesMenuTableViewCell initWithStyle:reuseIdentifier:](v10, "initWithStyle:reuseIdentifier:", 0, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController homeWorkCorrectionQuestionForIndexPath:](self, "homeWorkCorrectionQuestionForIndexPath:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesViewModelImpl viewModelFromRAPMenuItem:](RAPTwoLinesViewModelImpl, "viewModelFromRAPMenuItem:", v12));
  -[RAPTwoLinesMenuTableViewCell setViewModel:](v9, "setViewModel:", v13);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  RAPPersonalPlaceCorrectionsQuestion *v8;
  void *v9;
  void *v10;
  RAPPersonalPlaceCorrectionsQuestion *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController homeWorkCorrectionQuestionForIndexPath:](self, "homeWorkCorrectionQuestionForIndexPath:", v6));
  v8 = [RAPPersonalPlaceCorrectionsQuestion alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "report"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortcut"));
  v11 = -[RAPPersonalPlaceCorrectionsQuestion initWithReport:parentQuestion:shortcut:](v8, "initWithReport:parentQuestion:shortcut:", v9, v12, v10);

  -[RAPMenuQuestion setSelectedMenuItem:](self->_question, "setSelectedMenuItem:", v11);
  -[RAPPersonalPlaceSelectionViewController _editCorrectionsQuestion:](self, "_editCorrectionsQuestion:", v11);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)_editCorrectionsQuestion:(id)a3
{
  RAPPersonalPlaceRefinementCoordinator *currentCorrectionsCoordinator;
  RAPPersonalPlaceRefinementCoordinator *v5;
  RAPPersonalPlaceRefinementCoordinator *v6;
  id v7;

  v7 = a3;
  currentCorrectionsCoordinator = self->_currentCorrectionsCoordinator;
  if (currentCorrectionsCoordinator)
  {
    self->_currentCorrectionsCoordinator = 0;

  }
  v5 = -[RAPPersonalPlaceRefinementCoordinator initWithPresentingViewController:delegate:report:question:]([RAPPersonalPlaceRefinementCoordinator alloc], "initWithPresentingViewController:delegate:report:question:", self, self, self->_rapReport, v7);
  v6 = self->_currentCorrectionsCoordinator;
  self->_currentCorrectionsCoordinator = v5;

  -[RAPPersonalPlaceRefinementCoordinator beginShortcutRefinement](self->_currentCorrectionsCoordinator, "beginShortcutRefinement");
}

- (int)backAction
{
  return 25;
}

- (int)analyticTarget
{
  return 1301;
}

- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "resetForEditingShortcut:", v5);

}

- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v10));
  objc_msgSend(v11, "setAdjustedCoordinate:", latitude, longitude);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100692254;
  v13[3] = &unk_1011AC888;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "saveWithCompletion:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (RAPPersonalPlaceCorrectionsWhichOneQuestion)question
{
  return self->_question;
}

- (void)setQuestion:(id)a3
{
  objc_storeStrong((id *)&self->_question, a3);
}

- (RAPReport)rapReport
{
  return self->_rapReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapReport, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_currentCorrectionsCoordinator, 0);
}

@end
