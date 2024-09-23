@implementation ICSortFolderActivity

- (ICSortFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICSortFolderActivity *v17;
  ICSortFolderActivity *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICSortFolderActivity;
  v17 = -[ICSortFolderActivity init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_folder, a3);
    objc_storeWeak((id *)&v18->_presentingViewController, v14);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_eventReporter, a6);
    v18->_noteContainerViewMode = a7;
  }

  return v18;
}

- (ICSortFolderActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICSortFolderActivity *v17;
  ICSortFolderActivity *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICSortFolderActivity;
  v17 = -[ICSortFolderActivity init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_virtualSmartFolder, a3);
    objc_storeWeak((id *)&v18->_presentingViewController, v14);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_eventReporter, a6);
    v18->_noteContainerViewMode = a7;
  }

  return v18;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Sort By"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.sortFolder");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ICSortFolderActivity *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity presentingViewController](self, "presentingViewController"));
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100078094;
    v12 = &unk_1005517E0;
    v13 = self;
    v14 = v4;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, &v9);

  }
  else if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity activityType](self, "activityType"));
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v8);

  }
  -[ICSortFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v9, v10, v11, v12);

}

- (void)activityDidFinish:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSortFolderActivity;
  -[ICSortFolderActivity activityDidFinish:](&v8, "activityDidFinish:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity eventReporter](self, "eventReporter"));
  v5 = sub_100070810(-[ICSortFolderActivity noteContainerViewMode](self, "noteContainerViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity activityType](self, "activityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity folder](self, "folder"));
  objc_msgSend(v4, "submitNoteActionMenuEventForNoteBrowserWithUsageType:layout:activityType:isTimelineView:", 3, v5, v6, objc_msgSend(v7, "isShowingDateHeaders"));

}

- (id)menuWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ICSortMenu *v9;
  void *v10;
  id v11;
  id v12;
  ICSortMenu *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  ICSortFolderActivity *v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity folder](self, "folder"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity folder](self, "folder"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customNoteSortType"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity virtualSmartFolder](self, "virtualSmartFolder"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteSortType"));
  }
  v8 = (void *)v7;

  v9 = [ICSortMenu alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortFolderActivity activityTitle](self, "activityTitle"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000782E4;
  v16[3] = &unk_100551398;
  v17 = v8;
  v18 = self;
  v19 = v4;
  v11 = v4;
  v12 = v8;
  v13 = -[ICSortMenu initWithTitle:sortType:selectedSortTypeHandler:](v9, "initWithTitle:sortType:selectedSortTypeHandler:", v10, v12, v16);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu createMenu](v13, "createMenu"));
  return v14;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
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

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void)setPresentingSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSourceView, a3);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
