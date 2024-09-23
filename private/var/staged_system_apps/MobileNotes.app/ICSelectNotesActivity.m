@implementation ICSelectNotesActivity

- (ICSelectNotesActivity)initWithPresentingViewController:(id)a3
{
  id v4;
  ICSelectNotesActivity *v5;
  ICSelectNotesActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSelectNotesActivity;
  v5 = -[ICSelectNotesActivity init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Select Notes"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.selectNotesFolder");
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectNotesActivity presentingViewController](self, "presentingViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectNotesActivity presentingViewController](self, "presentingViewController"));
    objc_msgSend(v5, "setEditing:animated:", 1, 1);

    -[ICSelectNotesActivity activityDidFinish:](self, "activityDidFinish:", 1);
    v6 = v8;
    if (v8)
      goto LABEL_5;
  }
  else
  {
    -[ICSelectNotesActivity activityDidFinish:](self, "activityDidFinish:", 0);
    v6 = v8;
    if (v8)
    {
LABEL_5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectNotesActivity activityType](self, "activityType"));
      (*((void (**)(void))v8 + 2))();

      v6 = v8;
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
