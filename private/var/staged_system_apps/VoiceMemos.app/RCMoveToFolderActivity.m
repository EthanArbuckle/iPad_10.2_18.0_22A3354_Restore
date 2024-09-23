@implementation RCMoveToFolderActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return CFSTR("RCActivityTypeMoveToFolder");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_FOLDER"), &stru_1001B2BC0, 0));

  return v3;
}

- (id)_systemImageName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "moveToFolderActivitySystemImageName"));

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return objc_msgSend(a3, "count") != 0;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RCMoveToFolderActivity;
  -[RCUIActivity prepareWithActivityItems:](&v11, "prepareWithActivityItems:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSceneDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainViewController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCUIActivity recordingUUIDs](self, "recordingUUIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "moveToFolderContainerViewControllerWithUUIDs:", v8));

  -[RCMoveToFolderActivity setFolderSelectionContainerViewController:](self, "setFolderSelectionContainerViewController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewController"));
  objc_msgSend(v10, "setPresentingDelegate:", self);

}

- (id)activityViewController
{
  return -[RCMoveToFolderActivity folderSelectionContainerViewController](self, "folderSelectionContainerViewController");
}

- (void)didCancelFolderSelection
{
  -[RCMoveToFolderActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void)didCompleteFolderSelection
{
  -[RCMoveToFolderActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (RCFolderSelectionContainerViewController)folderSelectionContainerViewController
{
  return (RCFolderSelectionContainerViewController *)objc_loadWeakRetained((id *)&self->_folderSelectionContainerViewController);
}

- (void)setFolderSelectionContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_folderSelectionContainerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderSelectionContainerViewController);
}

@end
