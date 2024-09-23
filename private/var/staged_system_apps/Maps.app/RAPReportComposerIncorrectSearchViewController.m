@implementation RAPReportComposerIncorrectSearchViewController

- (RAPReportComposerIncorrectSearchViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerIncorrectSearchViewController *v10;
  RAPReportComposerIncorrectSearchViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RAPReportComposerIncorrectSearchViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v17, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectableSearches"));
    v13 = objc_msgSend(v12, "count");

    if (v13 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectableSearches"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      objc_msgSend(v9, "setSelectedValue:", v15);

    }
    -[RAPQuestion addObserver:changeHandler:](v11->_question, "addObserver:changeHandler:", v11, &stru_1011E72E8);
  }

  return v11;
}

- (int)analyticTarget
{
  return -[RAPSearchWhichOneQuestion analyticTarget](self->_question, "analyticTarget");
}

- (id)tableParts
{
  id v3;
  RAPReportComposerWhichSearchSection *v4;
  RAPSearchWhichOneQuestion *question;
  void *v6;
  void *v7;
  RAPReportComposerWhichSearchSection *v8;
  RAPReportComposerWhichSearchSection *searchSection;
  void *v10;
  void *v11;
  RAPTablePart *searchRequestPart;
  RAPTablePart *v13;
  void *v14;
  RAPTablePart *v15;
  RAPTablePart *v16;
  void *v17;
  RAPReportComposerSearchSubcategorySection *v18;
  void *v19;
  RAPReportComposerSearchSubcategorySection *v20;
  RAPReportComposerSearchSubcategorySection *subcategorySection;
  RAPTablePart *subcategoryPart;
  RAPTablePart *v23;
  void *v24;
  RAPTablePart *v25;
  RAPTablePart **p_subcategoryPart;
  RAPTablePart *v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  RAPReportComposerSearchSubcategorySection *v37;
  RAPReportComposerWhichSearchSection *v38;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  if (!self->_searchSection)
  {
    v4 = [RAPReportComposerWhichSearchSection alloc];
    question = self->_question;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectableSearches](question, "selectableSearches"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectedValue](self->_question, "selectedValue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100B7C184;
    v34[3] = &unk_1011E7350;
    objc_copyWeak(&v35, &location);
    v8 = -[RAPTableCollapsableCheckmarkSection initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:](v4, "initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:", question, v6, v7, &stru_1011E7328, v34);
    searchSection = self->_searchSection;
    self->_searchSection = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Result [Report an Issue header]"), CFSTR("localized string not found"), 0));
    -[RAPTableCollapsableCheckmarkSection setHeaderTitle:](self->_searchSection, "setHeaderTitle:", v11);

    objc_destroyWeak(&v35);
  }
  searchRequestPart = self->_searchRequestPart;
  if (!searchRequestPart)
  {
    v13 = [RAPTablePart alloc];
    v38 = self->_searchSection;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
    v15 = -[RAPTablePart initWithSections:](v13, "initWithSections:", v14);
    v16 = self->_searchRequestPart;
    self->_searchRequestPart = v15;

    searchRequestPart = self->_searchRequestPart;
  }
  objc_msgSend(v3, "addObject:", searchRequestPart);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectedValue](self->_question, "selectedValue"));

  if (v17)
  {
    if (!self->_subcategorySection)
    {
      v18 = [RAPReportComposerSearchSubcategorySection alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion followUpQuestion](self->_question, "followUpQuestion"));
      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_100B7C1F4;
      v32 = &unk_1011DCC38;
      objc_copyWeak(&v33, &location);
      v20 = -[RAPReportComposerSearchSubcategorySection initWithQuestion:selection:](v18, "initWithQuestion:selection:", v19, &v29);
      subcategorySection = self->_subcategorySection;
      self->_subcategorySection = v20;

      objc_destroyWeak(&v33);
    }
    subcategoryPart = self->_subcategoryPart;
    if (!subcategoryPart)
    {
      v23 = [RAPTablePart alloc];
      v37 = self->_subcategorySection;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
      v25 = -[RAPTablePart initWithSections:](v23, "initWithSections:", v24);
      p_subcategoryPart = &self->_subcategoryPart;
      v27 = *p_subcategoryPart;
      *p_subcategoryPart = v25;

      subcategoryPart = *p_subcategoryPart;
    }
    objc_msgSend(v3, "addObject:", subcategoryPart, v29, v30, v31, v32);
  }
  objc_destroyWeak(&location);
  return v3;
}

- (void)_instrumentSelectedSearch
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectedValue](self->_question, "selectedValue"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10140, -[RAPReportComposerIncorrectSearchViewController analyticTarget](self, "analyticTarget"), 0);

  }
}

- (void)proceedToNextQuestion:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "userAction")
    && -[RAPReportComposerIncorrectSearchViewController analyticTarget](self, "analyticTarget"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", objc_msgSend(v8, "userAction"), -[RAPReportComposerIncorrectSearchViewController analyticTarget](self, "analyticTarget"), 0);

  }
  v5 = objc_msgSend(v8, "questionCategory");
  if (v5 == (id)1)
  {
    -[RAPReportComposerIncorrectSearchViewController proceedToProblemNotListedQuestion:](self, "proceedToProblemNotListedQuestion:", v8);
  }
  else if (v5 == (id)9)
  {
    -[RAPReportComposerIncorrectSearchViewController proceedToPlaceClosureQuestion:](self, "proceedToPlaceClosureQuestion:", v8);
  }
  else
  {
    v6 = v5 == (id)10;
    v7 = v8;
    if (!v6)
      goto LABEL_12;
    -[RAPReportComposerIncorrectSearchViewController proceedToSearchResultIncorrectQuestion:](self, "proceedToSearchResultIncorrectQuestion:", v8);
  }
  v7 = v8;
LABEL_12:

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

- (void)proceedToSearchResultIncorrectQuestion:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentSection, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_subcategorySection, 0);
  objc_storeStrong((id *)&self->_subcategoryPart, 0);
  objc_storeStrong((id *)&self->_searchSection, 0);
  objc_storeStrong((id *)&self->_searchRequestPart, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
