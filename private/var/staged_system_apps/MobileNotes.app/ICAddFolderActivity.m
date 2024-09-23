@implementation ICAddFolderActivity

- (ICAddFolderActivity)initWithPresentingViewController:(id)a3 presentingBarButtonItem:(id)a4 parentFolder:(id)a5 eventReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICAddFolderActivity *v14;
  ICAddFolderActivity *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICAddFolderActivity;
  v14 = -[ICAddFolderActivity init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_presentingBarButtonItem, a4);
    objc_storeStrong((id *)&v15->_eventReporter, a6);
    objc_storeStrong((id *)&v15->_parentFolder, a5);
  }

  return v15;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add Folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder.badge.plus"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.addFolder");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICFolderCreationController *v6;
  void *v7;
  void *v8;
  ICFolderCreationController *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICFolderCreationController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddFolderActivity presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddFolderActivity parentFolder](self, "parentFolder"));
    v9 = -[ICFolderCreationController initWithViewController:noteContainer:creationApproach:](v6, "initWithViewController:noteContainer:creationApproach:", v7, v8, 1);
    -[ICAddFolderActivity setFolderCreationController:](self, "setFolderCreationController:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddFolderActivity folderCreationController](self, "folderCreationController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BA334;
    v12[3] = &unk_100553DC8;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v10, "promptToAddFolderAllowingSmartFolder:withCompletionHandler:", 1, v12);

  }
  else
  {
    -[ICAddFolderActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddFolderActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

    }
  }

}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICFolder)parentFolder
{
  return self->_parentFolder;
}

- (void)setParentFolder:(id)a3
{
  objc_storeStrong((id *)&self->_parentFolder, a3);
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
  objc_storeStrong((id *)&self->_folderCreationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_parentFolder, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
