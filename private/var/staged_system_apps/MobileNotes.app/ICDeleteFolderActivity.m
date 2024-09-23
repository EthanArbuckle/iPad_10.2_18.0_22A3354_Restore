@implementation ICDeleteFolderActivity

- (ICDeleteFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 sender:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICDeleteFolderActivity *v12;
  ICDeleteFolderActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICDeleteFolderActivity;
  v12 = -[ICDeleteFolderActivity init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_folder, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong(&v13->_sender, a5);
  }

  return v13;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.deleteFolder");
}

- (id)actionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDeleteFolderActivity;
  v3 = -[ICDeleteFolderActivity actionWithCompletion:](&v6, "actionWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setIc_destructive:", 1);
  return v4;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICDeleteDecisionController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICDeleteDecisionController *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  ICDeleteFolderActivity *v18;
  id v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICDeleteDecisionController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteFolderActivity folder](self, "folder"));
    v20 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteFolderActivity presentingViewController](self, "presentingViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteFolderActivity sender](self, "sender"));
    v13 = -[ICDeleteDecisionController initWithSourceObjects:window:sender:eventReporter:](v6, "initWithSourceObjects:window:sender:eventReporter:", v8, v11, v12, 0);

    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1000B1C2C;
    v17 = &unk_1005539A0;
    v18 = self;
    v19 = v4;
    -[ICDeleteDecisionController performDecisionWithCompletion:](v13, "performDecisionWithCompletion:", &v14);

  }
  -[ICDeleteFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v14, v15, v16, v17);

}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
