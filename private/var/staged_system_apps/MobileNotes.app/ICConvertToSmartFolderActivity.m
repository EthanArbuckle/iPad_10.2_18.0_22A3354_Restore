@implementation ICConvertToSmartFolderActivity

- (ICConvertToSmartFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 sender:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICConvertToSmartFolderActivity *v15;
  ICConvertToSmartFolderActivity *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICConvertToSmartFolderActivity;
  v15 = -[ICConvertToSmartFolderActivity init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_folder, a3);
    objc_storeStrong((id *)&v16->_presentingViewController, a4);
    objc_storeStrong((id *)&v16->_presentingBarButtonItem, a5);
    objc_storeStrong(&v16->_sender, a6);
  }

  return v16;
}

- (NSAttributedString)footerAttributedString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSAttributedStringKey v16;
  void *v17;
  NSAttributedStringKey v18;
  void *v19;

  v2 = objc_alloc((Class)NSMutableAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Use Smart Folders to automatically organize notes by tags. "), &stru_1005704B8, 0));
  v18 = NSForegroundColorAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v19 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v7 = objc_msgSend(v2, "initWithString:attributes:", v4, v6);

  v8 = objc_alloc((Class)NSAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Learn More…"), &stru_1005704B8, 0));
  v16 = NSLinkAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForShowSmartFoldersHelp](ICAppURLUtilities, "appURLForShowSmartFoldersHelp"));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v13 = objc_msgSend(v8, "initWithString:attributes:", v10, v12);

  objc_msgSend(v7, "appendAttributedString:", v13);
  v14 = objc_msgSend(v7, "copy");

  return (NSAttributedString *)v14;
}

- (id)activityTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONVERT_TO_SMART_FOLDER_ACTIVITY"), CFSTR("Convert to Smart Folder"), CFSTR("Localizable")));

  return v4;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gearshape"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.convertToSmartFolder");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICConvertToSmartFolderDecisionController *v6;
  void *v7;
  void *v8;
  ICConvertToSmartFolderDecisionController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  ICConvertToSmartFolderActivity *v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICConvertToSmartFolderDecisionController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity folder](self, "folder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity presentingViewController](self, "presentingViewController"));
    v9 = -[ICConvertToSmartFolderDecisionController initWithSourceFolder:presentingViewController:](v6, "initWithSourceFolder:presentingViewController:", v7, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity presentingViewController](self, "presentingViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_viewControllerManager"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "folderListViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity folderCell](self, "folderCell"));
    -[ICConvertToSmartFolderDecisionController setFolderSourceView:](v9, "setFolderSourceView:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity presentingBarButtonItem](self, "presentingBarButtonItem"));
    -[ICConvertToSmartFolderDecisionController setPresentingBarButtonItem:](v9, "setPresentingBarButtonItem:", v14);

    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1000B9DA8;
    v20 = &unk_100553DA0;
    v21 = v12;
    v22 = v11;
    v23 = self;
    v24 = v4;
    v15 = v11;
    v16 = v12;
    -[ICConvertToSmartFolderDecisionController performDecisionWithCompletion:](v9, "performDecisionWithCompletion:", &v17);

  }
  -[ICConvertToSmartFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v17, v18, v19, v20);

}

- (UICollectionViewCell)folderCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity presentingViewController](self, "presentingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_viewControllerManager"));

  if (objc_msgSend(v4, "isPrimaryContentVisible"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folderListViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewDiffableDataSource"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICConvertToSmartFolderActivity folder](self, "folder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForItemIdentifier:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v10));

  }
  else
  {
    v12 = 0;
  }

  return (UICollectionViewCell *)v12;
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
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
