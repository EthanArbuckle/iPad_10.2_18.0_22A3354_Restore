@implementation ICMoveFolderActivity

- (ICMoveFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICMoveFolderActivity *v9;
  ICMoveFolderActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMoveFolderActivity;
  v9 = -[ICMoveFolderActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

+ (BOOL)canShowMoveActionForFolder:(id)a3 viewControllerManager:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMovable"))
  {
    v7 = objc_msgSend(v6, "hasMultipleModernAccounts");
    v8 = objc_msgSend(v5, "isSmartFolder") ^ 1 | v7;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move This Folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.moveFolder");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICMoveDecisionController *v6;
  void *v7;
  void *v8;
  void *v9;
  ICMoveDecisionController *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICMoveDecisionController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveFolderActivity folder](self, "folder"));
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveFolderActivity presentingViewController](self, "presentingViewController"));
    v10 = -[ICMoveDecisionController initWithSourceObjects:presentingViewController:](v6, "initWithSourceObjects:presentingViewController:", v8, v9);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007BD74;
    v12[3] = &unk_100552078;
    v12[4] = self;
    v13 = v4;
    -[ICMoveDecisionController performDecisionWithCompletion:](v10, "performDecisionWithCompletion:", v12);

  }
  else
  {
    -[ICMoveFolderActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMoveFolderActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

    }
  }

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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
