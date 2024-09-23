@implementation ICCollaborationFolderActivity

- (ICCollaborationFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ICCollaborationFolderActivity *v23;
  ICCollaborationFolderActivity *v24;
  objc_super v26;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)ICCollaborationFolderActivity;
  v23 = -[ICCollaborationFolderActivity init](&v26, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_folder, a3);
    objc_storeWeak((id *)&v24->_presentingViewController, v19);
    objc_storeStrong((id *)&v24->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v24->_presentingSourceView, a6);
    v24->_presentingSourceRect.origin.x = x;
    v24->_presentingSourceRect.origin.y = y;
    v24->_presentingSourceRect.size.width = width;
    v24->_presentingSourceRect.size.height = height;
    objc_storeStrong((id *)&v24->_eventReporter, a8);
  }

  return v24;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity folder](self, "folder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareViaICloudManageActionTitle"));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.collaborationFolder");
}

- (id)activityImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity folder](self, "folder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareViaICloudSystemImageName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
  return v4;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;

  v4 = a3;
  if (-[ICCollaborationFolderActivity contextPathEnum](self, "contextPathEnum"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity eventReporter](self, "eventReporter"));
    objc_msgSend(v5, "pushContextPathDataWithContextPathEnum:", -[ICCollaborationFolderActivity contextPathEnum](self, "contextPathEnum"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentationSourceItem](self, "presentationSourceItem"));
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentingSourceView](self, "presentingSourceView"));
    v7 = v8 == 0;

  }
  if (-[ICCollaborationFolderActivity forceShareSheet](self, "forceShareSheet"))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity folder](self, "folder"));
    if (objc_msgSend(v10, "canBeSharedViaICloud"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity folder](self, "folder"));
      v9 = objc_msgSend(v11, "isPubliclySharedOrHasInvitees") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  v12 = v9 ^ 1 | v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity collaborationUIController](self, "collaborationUIController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity folder](self, "folder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentingViewController](self, "presentingViewController"));
  if ((v12 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentingBarButtonItem](self, "presentingBarButtonItem"));
    v31 = v4;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100045628;
    v32[3] = &unk_100550110;
    v32[4] = self;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100045680;
    v30[3] = &unk_100550160;
    v30[4] = self;
    v17 = v4;
    objc_msgSend(v13, "showCloudSharingControllerForFolder:presentingViewController:popoverBarButtonItem:presented:dismissed:", v14, v15, v16, v32, v30);

    v18 = v31;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentationSourceItem](self, "presentationSourceItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationFolderActivity presentingSourceView](self, "presentingSourceView"));
    -[ICCollaborationFolderActivity presentingSourceRect](self, "presentingSourceRect");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100045594;
    v33[3] = &unk_100550160;
    v33[4] = self;
    v34 = v4;
    v29 = v4;
    objc_msgSend(v13, "presentFolderActivityViewControllerWithFolder:presentingViewController:sourceItem:sourceView:sourceRect:completion:", v14, v15, v19, v20, v33, v22, v24, v26, v28);

    v18 = v34;
  }

}

- (ICCollaborationUIController)collaborationUIController
{
  return +[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance");
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

- (CGRect)presentingSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentingSourceRect.origin.x;
  y = self->_presentingSourceRect.origin.y;
  width = self->_presentingSourceRect.size.width;
  height = self->_presentingSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  self->_presentingSourceRect = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (BOOL)forceShareSheet
{
  return self->_forceShareSheet;
}

- (void)setForceShareSheet:(BOOL)a3
{
  self->_forceShareSheet = a3;
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
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
}

@end
