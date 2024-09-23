@implementation ICChangeNoteDatesActivity

- (ICChangeNoteDatesActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICChangeNoteDatesActivity *v12;
  ICChangeNoteDatesActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICChangeNoteDatesActivity;
  v12 = -[ICChangeNoteDatesActivity init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_presentingBarButtonItem, a5);
  }

  return v13;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("calendar.badge.clock"));
}

- (id)activityTitle
{
  return CFSTR("Change Dates");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.changeDates");
}

- (id)activityViewController
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Change Dates"), CFSTR("Change Modification Date or Creation Date"), 0));
  v12 = objc_alloc_init((Class)UIView);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init((Class)UIDatePicker);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDatePickerMode:", 2);
  objc_msgSend(v4, "setPreferredDatePickerStyle:", 3);
  objc_msgSend(v12, "addSubview:", v4);
  objc_msgSend(v4, "ic_addAnchorsToFillSuperview");
  v5 = objc_alloc_init((Class)UIViewController);
  objc_msgSend(v5, "setView:", v12);
  objc_msgSend(v3, "setContentViewController:", v5);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100054220;
  v16[3] = &unk_100551100;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Set Modification Date"), 0, v16));
  objc_msgSend(v3, "addAction:", v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000542C8;
  v14[3] = &unk_100551100;
  v14[4] = self;
  v15 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Set Creation Date"), 0, v14));
  objc_msgSend(v3, "addAction:", v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054370;
  v13[3] = &unk_100551128;
  v13[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Set Both Distant Past"), 2, v13));
  objc_msgSend(v3, "addAction:", v10);

  return v3;
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
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity presentingViewController](self, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity activityViewController](self, "activityViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity presentationSourceItem](self, "presentationSourceItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
    objc_msgSend(v11, "setSourceItem:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity presentingViewController](self, "presentingViewController"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005457C;
    v14[3] = &unk_100550160;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v12, "ic_replacePresentedViewControllerWithViewController:animated:completion:", v6, 1, v14);

  }
  else
  {
    -[ICChangeNoteDatesActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICChangeNoteDatesActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

    }
  }

}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
