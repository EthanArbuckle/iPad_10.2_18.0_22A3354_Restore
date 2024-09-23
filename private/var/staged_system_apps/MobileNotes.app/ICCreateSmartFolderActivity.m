@implementation ICCreateSmartFolderActivity

- (ICCreateSmartFolderActivity)initWithTagSelection:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICCreateSmartFolderActivity *v12;
  ICCreateSmartFolderActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICCreateSmartFolderActivity;
  v12 = -[ICCreateSmartFolderActivity init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tagSelection, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_eventReporter, a5);
  }

  return v13;
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

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gearshape"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Create Smart Folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.createsmartfolder");
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
  ICFolderCreationController *v14;
  void *v15;
  ICFolderCreationController *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity tagSelection](self, "tagSelection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuery queryForNotesMatchingTagSelection:](ICQuery, "queryForNotesMatchingTagSelection:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity tagSelection](self, "tagSelection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartFolderTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder deduplicatingTitle:account:](ICFolder, "deduplicatingTitle:account:", v9, v12));

    v14 = [ICFolderCreationController alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity presentingViewController](self, "presentingViewController"));
    v16 = -[ICFolderCreationController initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:](v14, "initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:", v15, 0, v7, v13, 2);
    -[ICCreateSmartFolderActivity setFolderCreationController:](self, "setFolderCreationController:", v16);

    v17 = objc_alloc((Class)ICFilterSelection);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity tagSelection](self, "tagSelection"));
    v19 = objc_msgSend(v17, "initWithFilterTypeSelection:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity folderCreationController](self, "folderCreationController"));
    objc_msgSend(v20, "setFilterSelection:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity folderCreationController](self, "folderCreationController"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000C0318;
    v23[3] = &unk_100553DC8;
    v23[4] = self;
    v24 = v4;
    objc_msgSend(v21, "promptToAddFolderAllowingSmartFolder:withCompletionHandler:", 1, v23);

  }
  else
  {
    -[ICCreateSmartFolderActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCreateSmartFolderActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v22);

    }
  }

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

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
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
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end
