@implementation ICNoteContainerViewModeActivity

- (ICNoteContainerViewModeActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4
{
  id v6;
  id v7;
  ICNoteContainerViewModeActivity *v8;
  ICNoteContainerViewModeActivity *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteContainerViewModeActivity;
  v8 = -[ICNoteContainerViewModeActivity init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeStrong((id *)&v9->_viewControllerManager, a4);
    v9->_targetNoteViewMode = objc_msgSend(v7, "noteContainerViewMode") != (id)1;
  }

  return v9;
}

- (id)activityImage
{
  int64_t v2;
  const __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = -[ICNoteContainerViewModeActivity targetNoteViewMode](self, "targetNoteViewMode");
  if (v2 == -1)
  {
    v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_100404CB4(v4, v5, v6, v7, v8, v9, v10, v11);

    goto LABEL_8;
  }
  if (!v2)
  {
LABEL_8:
    v3 = CFSTR("list.bullet");
    goto LABEL_9;
  }
  if (v2 != 1)
  {
    v12 = 0;
    return v12;
  }
  v3 = CFSTR("square.grid.2x2");
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
  return v12;
}

- (id)activityTitle
{
  int64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v2 = -[ICNoteContainerViewModeActivity targetNoteViewMode](self, "targetNoteViewMode");
  switch(v2)
  {
    case -1:
      v4 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        sub_100404CB4(v4, v5, v6, v7, v8, v9, v10, v11);

      goto LABEL_8;
    case 1:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("View as Gallery");
      goto LABEL_10;
    case 0:
LABEL_8:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("View as List");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1005704B8, 0));

      return v3;
  }
  v3 = 0;
  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.noteContainerViewMode");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainerViewModeActivity presentingViewController](self, "presentingViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100055380;
  v7[3] = &unk_100550160;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (int64_t)targetNoteViewMode
{
  return self->_targetNoteViewMode;
}

- (void)setTargetNoteViewMode:(int64_t)a3
{
  self->_targetNoteViewMode = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
