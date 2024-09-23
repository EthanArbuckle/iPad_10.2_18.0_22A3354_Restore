@implementation ICImportArchiveActivity

- (ICImportArchiveActivity)initWithNoteContainer:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICImportArchiveActivity *v9;
  ICImportArchiveActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICImportArchiveActivity;
  v9 = -[ICImportArchiveActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_noteContainer, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Import Archive…"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.down.on.square"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.importArchive");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICImportArchiveController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = [ICImportArchiveController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveActivity presentingViewController](self, "presentingViewController"));
    v8 = -[ICImportArchiveController initForPresentingInViewController:](v6, "initForPresentingInViewController:", v7);
    -[ICImportArchiveActivity setImportArchiveController:](self, "setImportArchiveController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveActivity importArchiveController](self, "importArchiveController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveActivity noteContainer](self, "noteContainer"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100024678;
    v12[3] = &unk_10054F8B8;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v9, "importIntoNoteContainer:completion:", v10, v12);

  }
  else
  {
    -[ICImportArchiveActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

    }
  }

}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (ICImportArchiveController)importArchiveController
{
  return self->_importArchiveController;
}

- (void)setImportArchiveController:(id)a3
{
  objc_storeStrong((id *)&self->_importArchiveController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importArchiveController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end
