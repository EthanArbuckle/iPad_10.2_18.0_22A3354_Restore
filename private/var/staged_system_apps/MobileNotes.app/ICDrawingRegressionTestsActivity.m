@implementation ICDrawingRegressionTestsActivity

- (ICDrawingRegressionTestsActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICDrawingRegressionTestsActivity *v12;
  ICDrawingRegressionTestsActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICDrawingRegressionTestsActivity;
  v12 = -[ICDrawingRegressionTestsActivity init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_presentingBarButtonItem, a5);
  }

  return v13;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("scribble"));
}

- (id)activityTitle
{
  return CFSTR("Drawing Regression Tests");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.drawingRegressionTests");
}

- (id)activityViewController
{
  void *v2;
  void *v3;
  ICDrawingRegressionTestDataCollectionViewController *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity note](self, "note"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attachmentsWithUTType:", ICAttachmentUTTypeDrawing));

  if (objc_msgSend(v3, "count"))
  {
    v4 = -[ICDrawingRegressionTestDataCollectionViewController initWithDrawingAttachments:description:]([ICDrawingRegressionTestDataCollectionViewController alloc], "initWithDrawingAttachments:description:", v3, CFSTR("Help us improve our regression tests by submitting these sketches to Apple. Your submission may contain erased strokes which are no longer visible."));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController ic_embedInNavigationControllerForModalPresentation](v4, "ic_embedInNavigationControllerForModalPresentation"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("No Sketches"), CFSTR("This is for submitting regression test data for fullscreen Sketches."), 1));
    v4 = (ICDrawingRegressionTestDataCollectionViewController *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
    objc_msgSend(v5, "addAction:", v4);
  }

  return v5;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity activityViewController](self, "activityViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity presentationSourceItem](self, "presentationSourceItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
    objc_msgSend(v11, "setSourceItem:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity presentingViewController](self, "presentingViewController"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100057150;
    v14[3] = &unk_100550160;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v12, "ic_replacePresentedViewControllerWithViewController:animated:completion:", v6, 1, v14);

  }
  else
  {
    -[ICDrawingRegressionTestsActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestsActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

    }
  }

}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
