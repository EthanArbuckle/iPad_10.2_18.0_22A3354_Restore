@implementation ICExportArchiveActivity

- (ICExportArchiveActivity)initWithObjects:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICExportArchiveActivity *v15;
  ICExportArchiveActivity *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICExportArchiveActivity;
  v15 = -[ICExportArchiveActivity init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objects, a3);
    objc_storeWeak((id *)&v16->_presentingViewController, v12);
    objc_storeStrong((id *)&v16->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v16->_presentingSourceView, a6);
  }

  return v16;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Export Archive"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up.on.square"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.exportArchive");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICExportArchiveController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICExportArchiveController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentingViewController](self, "presentingViewController"));
    v8 = -[ICExportArchiveController initForPresentingInViewController:](v6, "initForPresentingInViewController:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentingBarButtonItem](self, "presentingBarButtonItem"));
    if (v9)
    {
      objc_msgSend(v8, "setBarButtonItem:", v9);
    }
    else
    {
      v11 = objc_opt_class(UIBarButtonItem);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentationSourceItem](self, "presentationSourceItem"));
      v13 = ICDynamicCast(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v8, "setBarButtonItem:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentingSourceView](self, "presentingSourceView"));
    objc_msgSend(v8, "setSourceView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity presentingSourceView](self, "presentingSourceView"));
    objc_msgSend(v16, "bounds");
    objc_msgSend(v8, "setSourceRect:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity objects](self, "objects"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000884DC;
    v18[3] = &unk_100552578;
    v18[4] = self;
    v19 = v4;
    objc_msgSend(v8, "exportObjects:completion:", v17, v18);

  }
  else
  {
    -[ICExportArchiveActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);

    }
  }

}

- (NSArray)objects
{
  return self->_objects;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
