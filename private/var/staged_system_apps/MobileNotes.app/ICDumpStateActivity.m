@implementation ICDumpStateActivity

- (ICDumpStateActivity)initWithPresentingViewController:(id)a3
{
  id v4;
  ICDumpStateActivity *v5;
  ICDumpStateActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDumpStateActivity;
  v5 = -[ICDumpStateActivity init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.doc"));
}

- (id)activityTitle
{
  return CFSTR("Send State Dump (Internal)");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.dumpState");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDumpStateActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("About State Dumps"), CFSTR("State dumps contain only metadata useful for debugging issues in Notes. No note content or attachments are included."), 1));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100071EC8;
    v12[3] = &unk_100551128;
    v12[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v12));
    objc_msgSend(v6, "addAction:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDumpStateActivity presentingViewController](self, "presentingViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007232C;
    v10[3] = &unk_100550160;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, v10);

  }
  else
  {
    -[ICDumpStateActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDumpStateActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
