@implementation RAPLookAroundInitialCategoriesViewController

- (RAPLookAroundInitialCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPLookAroundInitialCategoriesViewController *v12;
  RAPLookAroundInitialCategoriesViewController *v13;
  id v14;
  id completion;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPLookAroundInitialCategoriesViewController;
  v12 = -[RAPLookAroundInitialCategoriesViewController initWithStyle:](&v17, "initWithStyle:", 1);
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

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundInitialCategoriesViewController;
  -[RAPLookAroundInitialCategoriesViewController viewDidLoad](&v5, "viewDidLoad");
  -[RAPLookAroundInitialCategoriesViewController _setupTableView](self, "_setupTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion localizedTitle](self->_question, "localizedTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", v3);

  -[RAPLookAroundInitialCategoriesViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("LookAroundRAPView"));
}

- (void)_setupTableView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setDataSource:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  v5 = objc_opt_class(RAPLookAroundThumbnailTableViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPLookAroundThumbnailTableViewCell reuseIdentifier](RAPLookAroundThumbnailTableViewCell, "reuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  v8 = objc_opt_class(MacRAPLookAroundImageCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MacRAPLookAroundImageCell reuseIdentifier](MacRAPLookAroundImageCell, "reuseIdentifier"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  v11 = objc_opt_class(RAPSingleLineTableViewCell);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  v14 = objc_opt_class(MacRapImageSingleLineCell);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MacRapImageSingleLineCell reuseIdentifier](MacRapImageSingleLineCell, "reuseIdentifier"));
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", v14, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  objc_msgSend(v16, "_maps_initializeRAPAppearance");

  v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  objc_msgSend(v17, "setBackgroundColor:", v18);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection", a3));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5)
    v4 = 3;
  else
    v4 = 2;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  RAPLookAroundQuestion *question;
  void *v10;
  int64_t v11;
  void *v12;

  v6 = a3;
  if (a4 == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems"));
LABEL_8:
    v12 = v10;
    v11 = (int64_t)objc_msgSend(v10, "count");

    goto LABEL_9;
  }
  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    question = self->_question;
    if (v8 == (id)5)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItemsMinusPrivacy](question, "initialItemsMinusPrivacy"));
    else
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItems](question, "initialItems"));
    goto LABEL_8;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  RAPLookAroundQuestion *question;
  uint64_t v23;
  void *v24;
  id v25;
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
  id v36;
  void *v37;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v5, "row")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MacRapImageSingleLineCell reuseIdentifier](MacRapImageSingleLineCell, "reuseIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dequeueReusableCellWithIdentifier:", v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v18, "setText:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.forward")));
    objc_msgSend(v11, "setImage:", v19);
LABEL_16:

    goto LABEL_17;
  }
  if (v6 == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
    v21 = objc_msgSend(v20, "userInterfaceIdiom");
    question = self->_question;
    if (v21 == (id)5)
      v23 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItemsMinusPrivacy](question, "initialItemsMinusPrivacy"));
    else
      v23 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItems](question, "initialItems"));
    v13 = (void *)v23;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v5, "row")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
    if (v25 == (id)5)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MacRapImageSingleLineCell reuseIdentifier](MacRapImageSingleLineCell, "reuseIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dequeueReusableCellWithIdentifier:", v27));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v29, "setText:", v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.forward")));
      objc_msgSend(v11, "setImage:", v30);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dequeueReusableCellWithIdentifier:", v31));

      objc_msgSend(v11, "setAccessoryType:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v32, "setText:", v30);

    }
    goto LABEL_15;
  }
  if (v6)
  {
    v11 = 0;
    goto LABEL_18;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController tableView](self, "tableView"));
  if (v8 != (id)5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[RAPLookAroundThumbnailTableViewCell reuseIdentifier](RAPLookAroundThumbnailTableViewCell, "reuseIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", v33));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion thumbnailImage](self->_question, "thumbnailImage"));
    objc_msgSend(v11, "setThumbnailImage:", v34);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reportedLookAroundContext"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reportedMuninViewState"));
    objc_msgSend(v11, "setViewState:", v30);
LABEL_15:

    goto LABEL_16;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MacRAPLookAroundImageCell reuseIdentifier](MacRAPLookAroundImageCell, "reuseIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion thumbnailImage](self->_question, "thumbnailImage"));
  objc_msgSend(v11, "setLookAroundImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v11, "setBackgroundColor:", v13);
LABEL_17:

LABEL_18:
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
  v36 = objc_msgSend(v35, "userInterfaceIdiom");

  if (v36 == (id)5)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v11, "setBackgroundColor:", v37);

  }
  return v11;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return (char *)objc_msgSend(a4, "section", a3) - 1 < (char *)2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  RAPLookAroundQuestion *question;
  uint64_t v10;
  void *v11;
  void *v12;
  RAPLookAroundDetailsEditorViewController *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v15, 1);
  v6 = objc_msgSend(v15, "section");
  if (v6 == (id)2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion privacyItems](self->_question, "privacyItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v15, "row")));

    -[RAPLookAroundQuestion setSelectedQuestionType:](self->_question, "setSelectedQuestionType:", objc_msgSend(v12, "type"));
    -[RAPLookAroundInitialCategoriesViewController _captureUserAction:](self, "_captureUserAction:", objc_msgSend(v12, "analyticAction"));
    v13 = -[RAPLookAroundDetailsEditorViewController initWithReport:question:completion:]([RAPLookAroundDetailsEditorViewController alloc], "initWithReport:question:completion:", self->_report, self->_question, self->_completion);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController navigationController](self, "navigationController"));
    objc_msgSend(v14, "pushViewController:animated:", v13, 1);

LABEL_8:
    goto LABEL_9;
  }
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    question = self->_question;
    if (v8 == (id)5)
      v10 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItemsMinusPrivacy](question, "initialItemsMinusPrivacy"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion initialItems](question, "initialItems"));
    v12 = (void *)v10;

    v13 = (RAPLookAroundDetailsEditorViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v15, "row")));
    -[RAPLookAroundInitialCategoriesViewController _captureUserAction:](self, "_captureUserAction:", -[RAPLookAroundDetailsEditorViewController analyticAction](v13, "analyticAction"));
    -[RAPLookAroundInitialCategoriesViewController didSelectCategoryOfType:](self, "didSelectCategoryOfType:", -[RAPLookAroundDetailsEditorViewController type](v13, "type"));
    goto LABEL_8;
  }
LABEL_9:

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Privacy Concerns [LookAround RAP]");
  }
  else if (a4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Feedback [Report a Problem]");
  }
  else
  {
    if (a4)
    {
      v9 = &stru_1011EB268;
      goto LABEL_9;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Location [Report a Problem]");
  }
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

LABEL_9:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_groupedHeaderViewWithTitle:", v9));

  return v10;
}

- (void)didSelectCategoryOfType:(unint64_t)a3
{
  __objc2_class *v4;
  void *v5;
  id v6;

  -[RAPLookAroundQuestion setSelectedQuestionType:](self->_question, "setSelectedQuestionType:", a3);
  if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") == (id)3)
    v4 = RAPLookAroundPrivacyCategoryViewController;
  else
    v4 = RAPLookAroundDetailsEditorViewController;
  v6 = objc_msgSend([v4 alloc], "initWithReport:question:completion:", self->_report, self->_question, self->_completion);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundInitialCategoriesViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (int)analyticTarget
{
  return 1151;
}

- (void)_captureUserAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, -[RAPLookAroundInitialCategoriesViewController analyticTarget](self, "analyticTarget"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
