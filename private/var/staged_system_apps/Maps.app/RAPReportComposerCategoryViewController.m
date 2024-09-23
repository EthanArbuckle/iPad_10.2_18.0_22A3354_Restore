@implementation RAPReportComposerCategoryViewController

- (RAPReportComposerCategoryViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerCategoryViewController *v10;
  RAPReportComposerCategoryViewController *v11;
  id v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerCategoryViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v15, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryQuestion, a4);
    v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v11, "_cancel");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCategoryViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCategoryViewController;
  -[RAPReportComposerCategoryViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  RAPMenu *v4;
  RAPReportComposerSnippetSection *v5;
  RAPTablePart *v6;
  void *v7;
  RAPTablePart *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  RAPWorkflowLayoutManager *v16;
  RAPWorkflowLayoutManager *layoutManager;
  RAPLayoutDownloader *v18;
  RAPLayoutDownloader *layoutDownloader;
  UIActivityIndicatorView *v20;
  UIActivityIndicatorView *activityIndicator;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  RAPLayoutOptions *v38;
  id v39;
  unsigned int v40;
  _QWORD *v41;
  _QWORD block[4];
  _QWORD *v43;
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  id location;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _QWORD v59[2];
  _BYTE v60[128];
  RAPReportComposerSnippetSection *v61;

  v58.receiver = self;
  v58.super_class = (Class)RAPReportComposerCategoryViewController;
  -[RAPReportTableViewController viewDidLoad](&v58, "viewDidLoad");
  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[RAPMenu conformsToProtocol:](self->_categoryQuestion, "conformsToProtocol:", &OBJC_PROTOCOL___RAPSnippetProtocol))
  {
    v4 = self->_categoryQuestion;
    v5 = -[RAPReportComposerSnippetSection initWithQuestion:]([RAPReportComposerSnippetSection alloc], "initWithQuestion:", v4);
    v6 = [RAPTablePart alloc];
    v61 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
    v8 = -[RAPTablePart initWithSections:](v6, "initWithSections:", v7);

    objc_msgSend(v3, "addObject:", v8);
  }
  v9 = objc_alloc_init((Class)NSMutableArray);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu allMenuItems](self->_categoryQuestion, "allMenuItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i), "questionCategory")));
        objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v11);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1009F78E4;
  v52[3] = &unk_1011AC8B0;
  v52[4] = self;
  v39 = v3;
  v53 = v39;
  v41 = objc_retainBlock(v52);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v40 = objc_msgSend(v15, "isIncidentReportingEnabled");

  if ((-[RAPReportComposerCategoryViewController _shouldUseServerControlledUI](self, "_shouldUseServerControlledUI") | v40) == 1)
  {
    v16 = -[RAPWorkflowLayoutManager initWithSupportedCategories:]([RAPWorkflowLayoutManager alloc], "initWithSupportedCategories:", v9);
    layoutManager = self->_layoutManager;
    self->_layoutManager = v16;

    v38 = objc_alloc_init(RAPLayoutOptions);
    -[RAPLayoutOptions setLayoutType:](v38, "setLayoutType:", 4);
    v18 = -[RAPLayoutDownloader initWithLayoutOptions:]([RAPLayoutDownloader alloc], "initWithLayoutOptions:", v38);
    layoutDownloader = self->_layoutDownloader;
    self->_layoutDownloader = v18;

    v20 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v20;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCategoryViewController tableView](self, "tableView"));
    objc_msgSend(v22, "addSubview:", self->_activityIndicator);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCategoryViewController tableView](self, "tableView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v24));
    v59[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCategoryViewController tableView](self, "tableView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    v59[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    objc_initWeak(&location, self);
    v31 = dispatch_group_create();
    if (sub_1002A8AA0(self) == 5)
      v32 = 0;
    else
      v32 = v40;
    if (v32 == 1)
    {
      dispatch_group_enter(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1009F79A8;
      v48[3] = &unk_1011DF518;
      objc_copyWeak(&v50, &location);
      v49 = v31;
      objc_msgSend(v33, "fetchTrafficIncidentsLayout:", v48);

      objc_destroyWeak(&v50);
    }
    if (-[RAPReportComposerCategoryViewController _shouldUseServerControlledUI](self, "_shouldUseServerControlledUI", 48))
    {
      dispatch_group_enter(v31);
      v34 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v36);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1009F7A08;
      v45[3] = &unk_1011DF540;
      objc_copyWeak(&v47, &location);
      v46 = v31;
      objc_msgSend(v34, "fetchLayoutConfig:", v45);

      objc_destroyWeak(&v47);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009F7A78;
    block[3] = &unk_1011B0520;
    objc_copyWeak(&v44, &location);
    v43 = v41;
    dispatch_group_notify(v31, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

  }
  else
  {
    ((void (*)(void))v41[2])();
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  objc_msgSend(v35, "addObserver:", self);
  self->_isIncidentReportingEnabled = objc_msgSend(v35, "isIncidentReportingEnabled");

}

- (BOOL)_shouldUseServerControlledUI
{
  int BOOL;
  RAPMenu *categoryQuestion;
  uint64_t v5;

  BOOL = GEOConfigGetBOOL(MapsConfig_RAPEnableServerControlledUI, off_1014B40F8);
  if (BOOL)
  {
    categoryQuestion = self->_categoryQuestion;
    v5 = objc_opt_class(RAPMainQuestion);
    LOBYTE(BOOL) = objc_opt_isKindOfClass(categoryQuestion, v5);
  }
  return BOOL & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCategoryViewController;
  -[RAPReportComposerCategoryViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("RAPReportComposerCategoryViewControllerDidAppearNotification"), self);

}

- (void)_cancel
{
  -[RAPReportTableViewController invokeCompletionWithOutcome:](self, "invokeCompletionWithOutcome:", 0);
}

- (int)analyticTarget
{
  return -[RAPMenu analyticTarget](self->_categoryQuestion, "analyticTarget");
}

- (void)proceedToNextQuestion:(id)a3
{
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[RAPReportComposerCategoryViewController analyticTarget](self, "analyticTarget");
  v5 = v15;
  if (v4)
  {
    v6 = objc_msgSend(v15, "userAction");
    v5 = v15;
    if (v6)
    {
      v7 = v15;
      if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      v10 = objc_opt_respondsToSelector(v9, "eventValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v12 = objc_msgSend(v7, "userAction");
      v13 = -[RAPReportComposerCategoryViewController analyticTarget](self, "analyticTarget");
      if ((v10 & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventValue"));
        objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", v12, v13, v14);

      }
      else
      {
        objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", v12, v13, 0);
      }

      v5 = v15;
    }
  }
  switch((unint64_t)objc_msgSend(v5, "questionCategory"))
  {
    case 1uLL:
      -[RAPReportComposerCategoryViewController proceedToProblemNotListedQuestion:](self, "proceedToProblemNotListedQuestion:", v15);
      break;
    case 7uLL:
      -[RAPReportComposerCategoryViewController proceedToProblemWithDirectionsQuestion:](self, "proceedToProblemWithDirectionsQuestion:", v15);
      break;
    case 8uLL:
      -[RAPReportComposerCategoryViewController proceedToLabelCorrectionsQuestion:](self, "proceedToLabelCorrectionsQuestion:", v15);
      break;
    case 9uLL:
      -[RAPReportComposerCategoryViewController proceedToPlaceClosureQuestion:](self, "proceedToPlaceClosureQuestion:", v15);
      break;
    case 0xCuLL:
      -[RAPReportComposerCategoryViewController proceedToIncorrectSearchResultsQuestion:](self, "proceedToIncorrectSearchResultsQuestion:", v15);
      break;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      -[RAPReportComposerCategoryViewController proceedToRAPPersonalPlaceCorrectionsQuestion:](self, "proceedToRAPPersonalPlaceCorrectionsQuestion:", v15);
      break;
    case 0x13uLL:
      -[RAPReportComposerCategoryViewController _proceedToIncidentsQuestion:](self, "_proceedToIncidentsQuestion:", v15);
      break;
    default:
      break;
  }

}

- (void)proceedToProblemNotListedQuestion:(id)a3
{
  id v4;
  RAPReportComposerCommentViewController *v5;
  void *v6;
  RAPReportComposerCommentViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerCommentViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerCommentViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToArrivalTimeIncorrectQuestion:(id)a3
{
  id v4;
  RAPReportComposerCommentViewController *v5;
  void *v6;
  RAPReportComposerCommentViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerCommentViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerCommentViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToIncorrectSearchResultsQuestion:(id)a3
{
  id v4;
  RAPReportComposerIncorrectSearchViewController *v5;
  void *v6;
  RAPReportComposerIncorrectSearchViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerIncorrectSearchViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerIncorrectSearchViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToProblemWithDirectionsQuestion:(id)a3
{
  id v4;
  RAPReportComposerDirectionsViewController *v5;
  void *v6;
  RAPReportComposerDirectionsViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerDirectionsViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerDirectionsViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToPlaceClosureQuestion:(id)a3
{
  id v4;
  RAPReportComposerPlaceClosureViewController *v5;
  void *v6;
  RAPReportComposerPlaceClosureViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerPlaceClosureViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerPlaceClosureViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToLabelCorrectionsQuestion:(id)a3
{
  id v4;
  RAPReportComposerLabelNameEditorViewController *v5;
  void *v6;
  RAPReportComposerLabelNameEditorViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerLabelNameEditorViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerLabelNameEditorViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)_proceedToIncidentsQuestion:(id)a3
{
  id v4;
  RAPReportComposerIncidentsEditorViewController *v5;
  void *v6;
  RAPReportComposerIncidentsEditorViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerIncidentsEditorViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerIncidentsEditorViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToBadRouteSuggestionsQuestion:(id)a3
{
  id v4;
  RAPReportComposerBadRouteSuggestionsViewController *v5;
  void *v6;
  RAPReportComposerBadRouteSuggestionsViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerBadRouteSuggestionsViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerBadRouteSuggestionsViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToRAPPersonalPlaceCorrectionsQuestion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  RAPPersonalPlaceSelectionViewController *v8;
  RAPPersonalPlaceCorrectionsQuestion *v9;
  void *v10;
  void *v11;
  RAPPersonalPlaceCorrectionsQuestion *v12;
  RAPPersonalPlaceRefinementCoordinator *v13;
  void *v14;
  RAPPersonalPlaceRefinementCoordinator *v15;
  RAPPersonalPlaceRefinementCoordinator *homeWorkCoordinator;
  id v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainMenuItems"));
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainMenuItems"));
  v7 = v6;
  if (v5 == (id)1)
  {
    v8 = (RAPPersonalPlaceSelectionViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v9 = [RAPPersonalPlaceCorrectionsQuestion alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "report"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceSelectionViewController shortcut](v8, "shortcut"));
    v12 = -[RAPPersonalPlaceCorrectionsQuestion initWithReport:parentQuestion:shortcut:](v9, "initWithReport:parentQuestion:shortcut:", v10, v18, v11);

    objc_msgSend(v18, "setSelectedMenuItem:", v12);
    v13 = [RAPPersonalPlaceRefinementCoordinator alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "report"));
    v15 = -[RAPPersonalPlaceRefinementCoordinator initWithPresentingViewController:delegate:report:question:](v13, "initWithPresentingViewController:delegate:report:question:", self, self, v14, v12);
    homeWorkCoordinator = self->_homeWorkCoordinator;
    self->_homeWorkCoordinator = v15;

    -[RAPPersonalPlaceRefinementCoordinator beginShortcutRefinement](self->_homeWorkCoordinator, "beginShortcutRefinement");
LABEL_5:

    goto LABEL_6;
  }
  v17 = objc_msgSend(v6, "count");

  if (v17)
  {
    v8 = -[RAPPersonalPlaceSelectionViewController initWithQuestion:]([RAPPersonalPlaceSelectionViewController alloc], "initWithQuestion:", v18);
    -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  objc_msgSend(v6, "resetForEditingShortcut:", v4);

}

- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5
{
  double longitude;
  double latitude;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v9));
  objc_msgSend(v10, "setAdjustedCoordinate:", latitude, longitude);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009F8518;
  v13[3] = &unk_1011ACCB8;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "saveWithCompletion:", v13);

}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  if ((objc_msgSend(v3, "isIncidentReportingEnabled") & 1) == 0 && self->_isIncidentReportingEnabled)
    -[RAPReportTableViewController invokeCompletionWithOutcome:](self, "invokeCompletionWithOutcome:", 0);
  self->_isIncidentReportingEnabled = objc_msgSend(v3, "isIncidentReportingEnabled");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_categoryQuestion, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_layoutDownloader, 0);
}

@end
