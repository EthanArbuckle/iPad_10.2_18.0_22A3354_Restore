@implementation ICRenameTagActivity

- (ICRenameTagActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4 tagObjectID:(id)a5 eventReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICRenameTagActivity *v14;
  ICRenameTagActivity *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICRenameTagActivity;
  v14 = -[ICRenameTagActivity init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_viewControllerManager, a4);
    objc_storeStrong((id *)&v15->_tagObjectID, a5);
    objc_storeStrong((id *)&v15->_eventReporter, a6);
  }

  return v15;
}

- (id)activityTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RENAME_TAG_MENU"), CFSTR("Rename Tag"), CFSTR("Localizable")));

  return v4;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.renameTag");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v16;
  ICRenameTagActivity *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [_TtC11MobileNotes32TagCreateOrRenameAlertController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity tagObjectID](self, "tagObjectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity presentingViewController](self, "presentingViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity eventReporter](self, "eventReporter"));
    v10 = -[TagCreateOrRenameAlertController initWithTagObjectID:presentingViewController:eventReporter:renameMethod:](v6, "initWithTagObjectID:presentingViewController:eventReporter:renameMethod:", v7, v8, v9, 2);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TagCreateOrRenameAlertController makeAlertController](v10, "makeAlertController"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity presentingViewController](self, "presentingViewController"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000E7CCC;
      v15[3] = &unk_10054FEA8;
      v16 = v10;
      v17 = self;
      v18 = v4;
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, v15);

    }
    else
    {
      -[ICRenameTagActivity activityDidFinish:](self, "activityDidFinish:", 0);
      if (v4)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity activityType](self, "activityType"));
        (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

      }
    }

  }
  else
  {
    -[ICRenameTagActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameTagActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

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

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerManager, a3);
}

- (NSManagedObjectID)tagObjectID
{
  return self->_tagObjectID;
}

- (void)setTagObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_tagObjectID, a3);
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
  objc_storeStrong((id *)&self->_tagObjectID, 0);
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
