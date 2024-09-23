@implementation RAPReportComposerDirectionsViewController

- (RAPReportComposerDirectionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerDirectionsViewController *v10;
  RAPReportComposerDirectionsViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RAPReportComposerDirectionsViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v20, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectableDirectionsRequests"));
    v13 = objc_msgSend(v12, "count");

    if (v13 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectableDirectionsRequests"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      objc_msgSend(v9, "setSelectedValue:", v15);

    }
    -[RAPQuestion addObserver:changeHandler:](v11->_question, "addObserver:changeHandler:", v11, &stru_1011DCBE8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentQuestion"));

    if (!v16)
    {
      v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v11, "_didTapOnCancel");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionsViewController navigationItem](v11, "navigationItem"));
      objc_msgSend(v18, "setLeftBarButtonItem:", v17);

    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[RAPQuestion removeObserver:](self->_question, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerDirectionsViewController;
  -[RAPReportComposerDirectionsViewController dealloc](&v3, "dealloc");
}

- (RAPDirectionsWhichOneQuestion)rapDirectionsWhichOneQuestion
{
  return self->_question;
}

- (int)analyticTarget
{
  return 1100;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerDirectionsViewController;
  -[RAPReportComposerDirectionsViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("RAPReportComposerDirectionsViewControllerDidAppearNotification"), self);

}

- (id)tableParts
{
  id v3;
  RAPDirectionsRequestsCheckmarkSection *v4;
  RAPDirectionsWhichOneQuestion *question;
  void *v6;
  void *v7;
  RAPDirectionsRequestsCheckmarkSection *v8;
  RAPDirectionsRequestsCheckmarkSection *directionsRequestsSection;
  void *v10;
  RAPTablePart *directionsRequestsPart;
  RAPTablePart *v12;
  void *v13;
  RAPTablePart *v14;
  RAPTablePart *v15;
  void *v16;
  RAPReportComposerDirectionsSubcategorySection *v17;
  void *v18;
  RAPReportComposerDirectionsSubcategorySection *v19;
  RAPReportComposerDirectionsSubcategorySection *subcategorySection;
  void *v21;
  RAPTablePart *v22;
  void *v23;
  RAPTablePart *v24;
  RAPTablePart *subcategoryPart;
  void *v26;
  RAPReportComposerBadRouteSuggestionSection *v27;
  void *v28;
  RAPReportComposerBadRouteSuggestionSection *v29;
  RAPReportComposerBadRouteSuggestionSection *betterRouteSection;
  RAPTablePart *v31;
  void *v32;
  RAPTablePart *v33;
  RAPTablePart **p_betterRoutePart;
  RAPTablePart *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  RAPReportComposerBadRouteSuggestionSection *v44;
  RAPReportComposerDirectionsSubcategorySection *v45;
  RAPDirectionsRequestsCheckmarkSection *v46;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  if (!self->_directionsRequestsSection)
  {
    v4 = [RAPDirectionsRequestsCheckmarkSection alloc];
    question = self->_question;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectableDirectionsRequests](question, "selectableDirectionsRequests"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self->_question, "selectedValue"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10095AA90;
    v41[3] = &unk_1011DCC10;
    objc_copyWeak(&v42, &location);
    v8 = -[RAPTableCollapsableCheckmarkSection initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:](v4, "initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:", question, v6, v7, 0, v41);
    directionsRequestsSection = self->_directionsRequestsSection;
    self->_directionsRequestsSection = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion localizedSelectDirectionsRequestPrompt](self->_question, "localizedSelectDirectionsRequestPrompt"));
    -[RAPTableCollapsableCheckmarkSection setHeaderTitle:](self->_directionsRequestsSection, "setHeaderTitle:", v10);

    objc_destroyWeak(&v42);
  }
  directionsRequestsPart = self->_directionsRequestsPart;
  if (!directionsRequestsPart)
  {
    v12 = [RAPTablePart alloc];
    v46 = self->_directionsRequestsSection;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v14 = -[RAPTablePart initWithSections:](v12, "initWithSections:", v13);
    v15 = self->_directionsRequestsPart;
    self->_directionsRequestsPart = v14;

    directionsRequestsPart = self->_directionsRequestsPart;
  }
  objc_msgSend(v3, "addObject:", directionsRequestsPart);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self->_question, "selectedValue"));

  if (v16)
  {
    v17 = [RAPReportComposerDirectionsSubcategorySection alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion followUpQuestion](self->_question, "followUpQuestion"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10095AB00;
    v39[3] = &unk_1011DCC38;
    objc_copyWeak(&v40, &location);
    v19 = -[RAPReportComposerDirectionsSubcategorySection initWithQuestion:selection:](v17, "initWithQuestion:selection:", v18, v39);
    subcategorySection = self->_subcategorySection;
    self->_subcategorySection = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RAPDirectionsCategoryQuestion localizedHeaderText](RAPDirectionsCategoryQuestion, "localizedHeaderText"));
    -[RAPTablePartSection setHeaderTitle:](self->_subcategorySection, "setHeaderTitle:", v21);

    v22 = [RAPTablePart alloc];
    v45 = self->_subcategorySection;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    v24 = -[RAPTablePart initWithSections:](v22, "initWithSections:", v23);
    subcategoryPart = self->_subcategoryPart;
    self->_subcategoryPart = v24;

    objc_msgSend(v3, "addObject:", self->_subcategoryPart);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion followUpQuestion](self->_question, "followUpQuestion"));
    LODWORD(v22) = objc_msgSend(v26, "shouldShowBetterRouteAvailable");

    if ((_DWORD)v22)
    {
      v27 = [RAPReportComposerBadRouteSuggestionSection alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion followUpQuestion](self->_question, "followUpQuestion"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10095AB48;
      v37[3] = &unk_1011DCC38;
      objc_copyWeak(&v38, &location);
      v29 = -[RAPReportComposerBadRouteSuggestionSection initWithQuestion:selection:](v27, "initWithQuestion:selection:", v28, v37);
      betterRouteSection = self->_betterRouteSection;
      self->_betterRouteSection = v29;

      v31 = [RAPTablePart alloc];
      v44 = self->_betterRouteSection;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
      v33 = -[RAPTablePart initWithSections:](v31, "initWithSections:", v32);
      p_betterRoutePart = &self->_betterRoutePart;
      v35 = *p_betterRoutePart;
      *p_betterRoutePart = v33;

      objc_msgSend(v3, "addObject:", *p_betterRoutePart);
      objc_destroyWeak(&v38);
    }
    objc_destroyWeak(&v40);
  }
  objc_destroyWeak(&location);
  return v3;
}

- (void)proceedToNextQuestion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "userAction"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", objc_msgSend(v5, "userAction"), -[RAPReportComposerDirectionsViewController analyticTarget](self, "analyticTarget"), 0);

  }
  switch((unint64_t)objc_msgSend(v5, "questionCategory"))
  {
    case 1uLL:
      -[RAPReportComposerDirectionsViewController proceedToProblemNotListedQuestion:](self, "proceedToProblemNotListedQuestion:", v5);
      break;
    case 2uLL:
      -[RAPReportComposerDirectionsViewController proceedToBadRouteSuggestionsQuestion:](self, "proceedToBadRouteSuggestionsQuestion:", v5);
      break;
    case 3uLL:
      -[RAPReportComposerDirectionsViewController proceedToArrivalTimeIncorrectQuestion:](self, "proceedToArrivalTimeIncorrectQuestion:", v5);
      break;
    case 4uLL:
      -[RAPReportComposerDirectionsViewController proceedToArrivalEntryPointIncorrectQuestion:](self, "proceedToArrivalEntryPointIncorrectQuestion:", v5);
      break;
    case 6uLL:
      -[RAPReportComposerDirectionsViewController proceedToDirectionInstructionsIncorrectQuestion:](self, "proceedToDirectionInstructionsIncorrectQuestion:", v5);
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

- (void)proceedToArrivalEntryPointIncorrectQuestion:(id)a3
{
  id v4;
  RAPReportComposerAccessPointViewController *v5;
  void *v6;
  RAPReportComposerAccessPointViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerAccessPointViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerAccessPointViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)proceedToDirectionInstructionsIncorrectQuestion:(id)a3
{
  id v4;
  RAPReportComposerDirectionInstructionsIncorrectViewController *v5;
  void *v6;
  RAPReportComposerDirectionInstructionsIncorrectViewController *v7;
  id v8;

  v4 = a3;
  v5 = [RAPReportComposerDirectionInstructionsIncorrectViewController alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
  v7 = -[RAPReportComposerDirectionInstructionsIncorrectViewController initWithReport:question:completion:](v5, "initWithReport:question:completion:", v8, v4, v6);

  -[RAPTableViewController segueToViewController:](self, "segueToViewController:", v7);
}

- (void)_didTapOnCancel
{
  void *v3;
  void (**v4)(id, RAPReportComposerDirectionsViewController *, _QWORD);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));

  if (v3)
  {
    v4 = (void (**)(id, RAPReportComposerDirectionsViewController *, _QWORD))objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController completion](self, "completion"));
    v4[2](v4, self, 0);

  }
}

- (void)_instrumentSelectingRoute
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10154, -[RAPReportComposerDirectionsViewController analyticTarget](self, "analyticTarget"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betterRouteSection, 0);
  objc_storeStrong((id *)&self->_betterRoutePart, 0);
  objc_storeStrong((id *)&self->_subcategorySection, 0);
  objc_storeStrong((id *)&self->_subcategoryPart, 0);
  objc_storeStrong((id *)&self->_directionsRequestsSection, 0);
  objc_storeStrong((id *)&self->_directionsRequestsPart, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
