@implementation ICDeleteTagActivity

- (ICDeleteTagActivity)initWithPresentingViewController:(id)a3 tagSelection:(id)a4 eventReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICDeleteTagActivity *v11;
  ICDeleteTagActivity *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICDeleteTagActivity;
  v11 = -[ICDeleteTagActivity init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_presentingViewController, v8);
    objc_storeStrong((id *)&v12->_tagSelection, a4);
    objc_storeStrong((id *)&v12->_eventReporter, a5);
  }

  return v12;
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity tagSelection](self, "tagSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectIDs"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4 == (id)1)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete Tag"), &stru_1005704B8, 0));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_%lu_TAGS"), &stru_1005704B8, 0));
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4));

    }
  }
  return v4;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.deleteTag");
}

- (id)actionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDeleteTagActivity;
  v3 = -[ICDeleteTagActivity actionWithCompletion:](&v6, "actionWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setIc_destructive:", 1);
  return v4;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC11MobileNotes26TagDeletionAlertController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC11MobileNotes26TagDeletionAlertController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity tagSelection](self, "tagSelection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

    v23 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_compactMap:", &stru_100551958));
    v9 = [_TtC11MobileNotes26TagDeletionAlertController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity activityViewController](self, "activityViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_viewControllerManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity presentingViewController](self, "presentingViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity eventReporter](self, "eventReporter"));
    v17 = -[TagDeletionAlertController initWithViewControllerManager:window:eventReporter:deletionMethod:](v9, "initWithViewControllerManager:window:eventReporter:deletionMethod:", v12, v15, v16, 2);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TagDeletionAlertController makeDeleteTagAlertControllerWithTags:sendNotification:](v17, "makeDeleteTagAlertControllerWithTags:sendNotification:", v24, 1));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity presentingViewController](self, "presentingViewController"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10006741C;
      v25[3] = &unk_100550160;
      v25[4] = self;
      v26 = v4;
      objc_msgSend(v19, "presentViewController:animated:completion:", v18, 1, v25);

      v20 = v23;
    }
    else
    {
      -[ICDeleteTagActivity activityDidFinish:](self, "activityDidFinish:", 0);
      v20 = v23;
      if (v4)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity activityType](self, "activityType"));
        (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v22);

      }
    }

  }
  else
  {
    -[ICDeleteTagActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteTagActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v21);

    }
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)setTagSelection:(id)a3
{
  objc_storeStrong((id *)&self->_tagSelection, a3);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
