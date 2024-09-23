@implementation ICHandwritingFeedbackNoteActivity

- (ICHandwritingFeedbackNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICHandwritingFeedbackNoteActivity *v9;
  ICHandwritingFeedbackNoteActivity *v10;
  PKHandwritingFeedbackActivity *v11;
  PKHandwritingFeedbackActivity *pencilKitActivity;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICHandwritingFeedbackNoteActivity;
  v9 = -[ICHandwritingFeedbackNoteActivity init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    v11 = (PKHandwritingFeedbackActivity *)objc_msgSend(objc_alloc((Class)PKHandwritingFeedbackActivity), "initWithBlock:", 0);
    pencilKitActivity = v10->_pencilKitActivity;
    v10->_pencilKitActivity = v11;

    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity pencilKitActivity](self, "pencilKitActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activityTitle"));

  return v3;
}

- (id)activityType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity pencilKitActivity](self, "pencilKitActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activityType"));

  return v3;
}

- (id)activityImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity pencilKitActivity](self, "pencilKitActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activityImage"));

  return v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity presentingViewController](self, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));
    v9 = objc_msgSend(v8, "ic_objectsOfClass:", objc_opt_class(UITextView));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_pkTiledView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity presentingViewController](self, "presentingViewController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10009E578;
    v16[3] = &unk_10054FEA8;
    v16[4] = self;
    v17 = v12;
    v18 = v4;
    v14 = v12;
    objc_msgSend(v13, "ic_dismissPresentedViewControllerAnimated:completion:", 1, v16);

  }
  else
  {
    -[ICHandwritingFeedbackNoteActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICHandwritingFeedbackNoteActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v15);

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

- (PKHandwritingFeedbackActivity)pencilKitActivity
{
  return self->_pencilKitActivity;
}

- (void)setPencilKitActivity:(id)a3
{
  objc_storeStrong((id *)&self->_pencilKitActivity, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_pencilKitActivity, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
