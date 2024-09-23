@implementation ICDateHeadersNoteContainerActivity

- (ICDateHeadersNoteContainerActivity)initWithContainer:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  ICDateHeadersNoteContainerActivity *v14;
  ICDateHeadersNoteContainerActivity *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDateHeadersNoteContainerActivity;
  v14 = -[ICDateHeadersNoteContainerActivity init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_noteContainer, a3);
    objc_storeWeak((id *)&v15->_presentingViewController, v12);
    objc_storeStrong((id *)&v15->_eventReporter, a5);
    v15->_noteContainerViewMode = a6;
  }

  return v15;
}

- (ICDateHeadersNoteContainerActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  ICDateHeadersNoteContainerActivity *v14;
  ICDateHeadersNoteContainerActivity *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDateHeadersNoteContainerActivity;
  v14 = -[ICDateHeadersNoteContainerActivity init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_virtualSmartFolder, a3);
    objc_storeWeak((id *)&v15->_presentingViewController, v12);
    objc_storeStrong((id *)&v15->_eventReporter, a5);
    v15->_noteContainerViewMode = a6;
  }

  return v15;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Group By Date"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("calendar"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.dateHeaderNoteContainer");
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
  ICDateHeadersNoteContainerActivity *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity presentingViewController](self, "presentingViewController"));
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000E70F8;
    v12 = &unk_1005517E0;
    v13 = self;
    v14 = v4;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, &v9);

  }
  else if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity activityType](self, "activityType"));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
  -[ICDateHeadersNoteContainerActivity activityDidFinish:](self, "activityDidFinish:", 1, v9, v10, v11, v12);

}

- (void)activityDidFinish:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDateHeadersNoteContainerActivity;
  -[ICDateHeadersNoteContainerActivity activityDidFinish:](&v8, "activityDidFinish:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity eventReporter](self, "eventReporter"));
  v5 = sub_100070810(-[ICDateHeadersNoteContainerActivity noteContainerViewMode](self, "noteContainerViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity activityType](self, "activityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity noteContainer](self, "noteContainer"));
  objc_msgSend(v4, "submitNoteActionMenuEventForNoteBrowserWithUsageType:layout:activityType:isTimelineView:", 3, v5, v6, objc_msgSend(v7, "isShowingDateHeaders"));

}

- (id)menu
{
  return -[ICDateHeadersNoteContainerActivity menuWithCompletion:](self, "menuWithCompletion:", 0);
}

- (id)menuWithCompletion:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity activityTitle](self, "activityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity activityImage](self, "activityImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 0, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 2, v4, v7));
  v18[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 1, v4));

  v18[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v5, v6, 0, 0, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity noteContainer](self, "noteContainer"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity noteContainer](self, "noteContainer"));
LABEL_5:
    v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:](ICDateHeadersUtilities, "actionItemTitleWithDateHeadersType:", objc_msgSend(v13, "dateHeadersType")));
    objc_msgSend(v11, "setSubtitle:", v16);

    return v11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity virtualSmartFolder](self, "virtualSmartFolder"));

  if (v14)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity virtualSmartFolder](self, "virtualSmartFolder"));
    goto LABEL_5;
  }
  return v11;
}

- (id)actionForDateHeadersType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  int v17;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDateHeadersUtilities stringForDateHeadersType:](ICDateHeadersUtilities, "stringForDateHeadersType:", v4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E7518;
  v15[3] = &unk_100553330;
  v17 = v4;
  v15[4] = self;
  v16 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:handler:](UIAction, "ic_actionWithTitle:handler:", v7, v15));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity noteContainer](self, "noteContainer"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity noteContainer](self, "noteContainer"));
LABEL_5:
    v13 = v11;
    objc_msgSend(v9, "setState:", objc_msgSend(v11, "dateHeadersType") == (_DWORD)v4);

    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity virtualSmartFolder](self, "virtualSmartFolder"));

  if (v12)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDateHeadersNoteContainerActivity virtualSmartFolder](self, "virtualSmartFolder"));
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_noteContainer, a3);
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (void)setVirtualSmartFolder:(id)a3
{
  objc_storeStrong((id *)&self->_virtualSmartFolder, a3);
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

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
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
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end
