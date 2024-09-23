@implementation RAPCuratedCollectionCategoriesViewController

- (RAPCuratedCollectionCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPCuratedCollectionCategoriesViewController *v12;
  RAPCuratedCollectionCategoriesViewController *v13;
  id v14;
  id completion;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RAPCuratedCollectionCategoriesViewController;
  v12 = -[RAPCuratedCollectionCategoriesViewController initWithStyle:](&v23, "initWithStyle:", 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_question, a4);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController tableView](v13, "tableView"));
    v17 = objc_opt_class(RAPSingleLineTableViewCell);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
    objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController tableView](v13, "tableView"));
    objc_msgSend(v19, "_maps_initializeRAPAppearance");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion localizedTitle](v13->_question, "localizedTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController navigationItem](v13, "navigationItem"));
    objc_msgSend(v21, "setTitle:", v20);

  }
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (a4)
  {
    v6 = &stru_1011EB268;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Feedback [Report a Problem]"), CFSTR("localized string not found"), 0));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_groupedHeaderViewWithTitle:", v6));

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (a4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "categoryItems"));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "categoryItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));

    objc_msgSend(v8, "setAccessoryType:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  RAPCuratedCollectionPOISelectionViewController *v12;
  void *v13;
  void *v14;
  RAPCuratedCollectionPOISelectionViewController *v15;
  RAPReportComposerCommentViewController *v16;
  RAPCuratedCollectionPOISelectionViewController *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categoryItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row")));

    v10 = objc_msgSend(v9, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question"));
    objc_msgSend(v11, "setSelectedQuestionType:", v10);

    if (objc_msgSend(v9, "type") == (id)3)
    {
      v12 = [RAPCuratedCollectionPOISelectionViewController alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController report](self, "report"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question"));
      v15 = -[RAPCuratedCollectionPOISelectionViewController initWithReport:parentQuestion:completion:](v12, "initWithReport:parentQuestion:completion:", v13, v14, self->_completion);
    }
    else
    {
      v16 = [RAPReportComposerCommentViewController alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController report](self, "report"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController question](self, "question"));
      v15 = -[RAPReportComposerCommentViewController initWithReport:question:completion:](v16, "initWithReport:question:completion:", v13, v14, self->_completion);
    }
    v17 = v15;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoriesViewController navigationController](self, "navigationController"));
    objc_msgSend(v18, "pushViewController:animated:", v17, 1);

  }
}

- (RAPReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_storeStrong((id *)&self->_report, a3);
}

- (RAPCuratedCollectionQuestion)question
{
  return self->_question;
}

- (void)setQuestion:(id)a3
{
  objc_storeStrong((id *)&self->_question, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
