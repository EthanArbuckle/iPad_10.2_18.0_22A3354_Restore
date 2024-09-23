@implementation ICRenameFolderActivity

- (ICRenameFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICRenameFolderActivity *v9;
  ICRenameFolderActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRenameFolderActivity;
  v9 = -[ICRenameFolderActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Rename"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.renameFolder");
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Rename Folder"), &stru_1005704B8, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B2148;
    v24[3] = &unk_100550AE8;
    v24[4] = self;
    objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000B2298;
    v22[3] = &unk_100550B38;
    v22[4] = self;
    v11 = v4;
    v23 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, v22));

    objc_msgSend(v8, "addAction:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Save"), &stru_1005704B8, 0));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B2308;
    v20[3] = &unk_100550B38;
    v20[4] = self;
    v21 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v20));
    -[ICRenameFolderActivity setSaveAction:](self, "setSaveAction:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity saveAction](self, "saveAction"));
    objc_msgSend(v8, "addAction:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity presentingViewController](self, "presentingViewController"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B25D8;
    v19[3] = &unk_100550110;
    v19[4] = self;
    objc_msgSend(v17, "presentViewController:animated:completion:", v8, 1, v19);

  }
  else
  {
    -[ICRenameFolderActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v18);

    }
  }

}

- (void)textChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity textField](self, "textField", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_trimmedString"));
  v7 = objc_msgSend(v6, "length") != 0;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICRenameFolderActivity saveAction](self, "saveAction"));
  objc_msgSend(v8, "setEnabled:", v7);

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
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIAlertAction)saveAction
{
  return self->_saveAction;
}

- (void)setSaveAction:(id)a3
{
  objc_storeStrong((id *)&self->_saveAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
