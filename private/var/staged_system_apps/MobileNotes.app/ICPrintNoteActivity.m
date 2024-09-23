@implementation ICPrintNoteActivity

- (ICPrintNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICPrintNoteActivity *v9;
  ICPrintNoteActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPrintNoteActivity;
  v9 = -[ICPrintNoteActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Print"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("printer"));
}

- (id)activityType
{
  return UIActivityTypePrint;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v27;
  ICPrintNoteActivity *v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintNoteActivity presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintNoteActivity presentingViewController](self, "presentingViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitCollectionByModifyingTraits:", &stru_100551168));

  v14 = objc_alloc_init((Class)ICTextController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintNoteActivity note](self, "note"));
  v16 = +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:](ICTextViewController, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:", v14, 0, v15, 0, 0, v13, v8);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintNoteActivity note](self, "note"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v17, v13, v8, v10));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICPrintNoteActivity note](self, "note"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
  objc_msgSend(v19, "setJobName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v22, "setPrintFormatter:", v18);
  objc_msgSend(v22, "setPrintInfo:", v19);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000579B0;
  v27 = &unk_100551190;
  v28 = self;
  v29 = v4;
  v23 = v4;
  objc_msgSend(v22, "presentAnimated:completionHandler:", 1, &v24);
  -[ICPrintNoteActivity activityDidFinish:](self, "activityDidFinish:", 1, v24, v25, v26, v27, v28);

}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
