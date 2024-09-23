@implementation RAPReportComposerBadRouteSuggestionsViewController

- (RAPReportComposerBadRouteSuggestionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerBadRouteSuggestionsViewController *v10;
  RAPReportComposerBadRouteSuggestionsViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerBadRouteSuggestionsViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v15, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    -[RAPQuestion addObserver:changeHandler:](v11->_question, "addObserver:changeHandler:", v11, &stru_1011C0108);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerBadRouteSuggestionsViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  return v11;
}

- (int)analyticTarget
{
  return 1103;
}

- (id)tableParts
{
  id v3;
  void *v4;
  RAPTablePart *whichRoutePart;
  RAPReportComposerBadRouteSelectionSection *v6;
  RAPBadRouteSuggestionsQuestion *question;
  RAPReportComposerBadRouteSelectionSection *v8;
  RAPReportComposerBadRouteSelectionSection *whichRouteSection;
  RAPTablePart *v10;
  void *v11;
  RAPTablePart *v12;
  RAPTablePart *v13;
  RAPReportComposerCommentPart *commentPart;
  RAPReportComposerCommentPart *v15;
  void *v16;
  RAPReportComposerCommentPart *v17;
  RAPReportComposerCommentPart **p_commentPart;
  RAPReportComposerCommentPart *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  RAPReportComposerBadRouteSelectionSection *v27;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
  objc_msgSend(v3, "addObject:", v4);

  whichRoutePart = self->_whichRoutePart;
  if (!whichRoutePart)
  {
    if (!self->_whichRouteSection)
    {
      objc_initWeak(&location, self);
      v6 = [RAPReportComposerBadRouteSelectionSection alloc];
      question = self->_question;
      v21 = _NSConcreteStackBlock;
      v22 = 3221225472;
      v23 = sub_1006B1CD0;
      v24 = &unk_1011AD260;
      objc_copyWeak(&v25, &location);
      v8 = -[RAPReportComposerBadRouteSelectionSection initWithQuestion:willChangeQuestionRequiringNoScroll:](v6, "initWithQuestion:willChangeQuestionRequiringNoScroll:", question, &v21);
      whichRouteSection = self->_whichRouteSection;
      self->_whichRouteSection = v8;

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    v10 = [RAPTablePart alloc];
    v27 = self->_whichRouteSection;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v12 = -[RAPTablePart initWithSections:](v10, "initWithSections:", v11);
    v13 = self->_whichRoutePart;
    self->_whichRoutePart = v12;

    whichRoutePart = self->_whichRoutePart;
  }
  objc_msgSend(v3, "addObject:", whichRoutePart, v21, v22, v23, v24);
  if (-[RAPBadRouteSuggestionsQuestion shouldShowCommentQuestion](self->_question, "shouldShowCommentQuestion"))
  {
    commentPart = self->_commentPart;
    if (!commentPart)
    {
      v15 = [RAPReportComposerCommentPart alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion commentQuestion](self->_question, "commentQuestion"));
      v17 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v15, "initWithCommentQuestion:", v16);
      p_commentPart = &self->_commentPart;
      v19 = *p_commentPart;
      *p_commentPart = v17;

      commentPart = *p_commentPart;
    }
    objc_msgSend(v3, "addObject:", commentPart);
  }
  return v3;
}

- (void)_instrumentSelectingRoute
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10154, -[RAPReportComposerBadRouteSuggestionsViewController analyticTarget](self, "analyticTarget"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_whichRoutePart, 0);
  objc_storeStrong((id *)&self->_whichRouteSection, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
