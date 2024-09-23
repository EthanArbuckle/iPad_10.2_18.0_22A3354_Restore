@implementation RAPLookAroundPrivacyCategoryViewController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RAPLookAroundPrivacyCategoryViewController;
  -[RAPLookAroundPrivacyCategoryViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundPrivacyCategoryViewController tableView](self, "tableView"));
  v4 = objc_opt_class(RAPSingleLineTableViewCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundPrivacyCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v6, "_maps_initializeRAPAppearance");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion localizedPrivacyNavigationTitle](self->_question, "localizedPrivacyNavigationTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundPrivacyCategoryViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setTitle:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundPrivacyCategoryViewController view](self, "view"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("LookAroundRAPPrivacyConcernsView"));

}

- (RAPLookAroundPrivacyCategoryViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPLookAroundPrivacyCategoryViewController *v12;
  RAPLookAroundPrivacyCategoryViewController *v13;
  id v14;
  id completion;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPLookAroundPrivacyCategoryViewController;
  v12 = -[RAPLookAroundPrivacyCategoryViewController initWithStyle:](&v17, "initWithStyle:", 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_question, a4);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

  }
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Feedback [Report a Problem]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_groupedHeaderViewWithTitle:", v6));

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  RAPLookAroundDetailsEditorViewController *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems"));
  v8 = objc_msgSend(v6, "row");

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8));
  -[RAPLookAroundQuestion setSelectedQuestionType:](self->_question, "setSelectedQuestionType:", objc_msgSend(v11, "type"));
  -[RAPLookAroundPrivacyCategoryViewController _captureUserAction:](self, "_captureUserAction:", objc_msgSend(v11, "analyticAction"));
  v9 = -[RAPLookAroundDetailsEditorViewController initWithReport:question:completion:]([RAPLookAroundDetailsEditorViewController alloc], "initWithReport:question:completion:", self->_report, self->_question, self->_completion);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundPrivacyCategoryViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v9, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems"));
  v11 = objc_msgSend(v6, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v11));
  objc_msgSend(v9, "setAccessoryType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
  objc_msgSend(v14, "setText:", v13);

  return v9;
}

- (int)analyticTarget
{
  return 1153;
}

- (void)_captureUserAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, -[RAPLookAroundPrivacyCategoryViewController analyticTarget](self, "analyticTarget"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
