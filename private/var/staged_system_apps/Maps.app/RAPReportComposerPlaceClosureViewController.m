@implementation RAPReportComposerPlaceClosureViewController

- (RAPReportComposerPlaceClosureViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerPlaceClosureViewController *v10;
  RAPReportComposerPlaceClosureViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReportComposerPlaceClosureViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v16, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerPlaceClosureViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion localizedTitle](v11->_question, "localizedTitle"));
    -[RAPReportComposerPlaceClosureViewController setTitle:](v11, "setTitle:", v14);

  }
  return v11;
}

- (int)analyticTarget
{
  return -[RAPPlaceClosureQuestion analyticTarget](self->_question, "analyticTarget");
}

- (id)tableParts
{
  RAPReportComposerPlaceClosureIssueSection *v3;
  RAPPlaceClosureQuestion *question;
  RAPReportComposerPlaceClosureIssueSection *v5;
  RAPReportComposerPlaceClosureIssueSection *issue;
  RAPTablePart *v7;
  void *v8;
  RAPTablePart *v9;
  RAPTablePart *issuePart;
  RAPReportComposerCommentPart *v11;
  void *v12;
  RAPReportComposerCommentPart *v13;
  RAPReportComposerCommentPart *commentPart;
  void *v15;
  RAPTablePart *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[3];
  RAPReportComposerPlaceClosureIssueSection *v23;

  if (!self->_issuePart)
  {
    if (!self->_issue)
    {
      objc_initWeak(&location, self);
      v3 = [RAPReportComposerPlaceClosureIssueSection alloc];
      question = self->_question;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100262670;
      v19[3] = &unk_1011AD260;
      objc_copyWeak(&v20, &location);
      v5 = -[RAPReportComposerPlaceClosureIssueSection initWithQuestion:selection:](v3, "initWithQuestion:selection:", question, v19);
      issue = self->_issue;
      self->_issue = v5;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v7 = [RAPTablePart alloc];
    v23 = self->_issue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v9 = -[RAPTablePart initWithSections:](v7, "initWithSections:", v8);
    issuePart = self->_issuePart;
    self->_issuePart = v9;

  }
  if (!self->_commentPart)
  {
    v11 = [RAPReportComposerCommentPart alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion commentQuestion](self->_question, "commentQuestion"));
    v13 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v11, "initWithCommentQuestion:", v12);
    commentPart = self->_commentPart;
    self->_commentPart = v13;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
  v16 = self->_issuePart;
  v22[0] = v15;
  v22[1] = v16;
  v22[2] = self->_commentPart;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_issuePart, 0);
  objc_storeStrong((id *)&self->_issue, 0);
}

@end
