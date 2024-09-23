@implementation ICQueryDateHeadersActivity

- (ICQueryDateHeadersActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5
{
  id v8;
  id v9;
  ICQueryDateHeadersActivity *v10;
  ICQueryDateHeadersActivity *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICQueryDateHeadersActivity;
  v10 = -[ICQueryDateHeadersActivity init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
    v11->_noteContainerViewMode = a4;
    objc_storeStrong((id *)&v11->_eventReporter, a5);
  }

  return v11;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("calendar"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Group By Date"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.dateheaders");
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009FCBC;
    v10[3] = &unk_100550160;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    -[ICQueryDateHeadersActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity activityType](self, "activityType"));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }

}

- (void)activityDidFinish:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQueryDateHeadersActivity;
  -[ICQueryDateHeadersActivity activityDidFinish:](&v7, "activityDidFinish:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity eventReporter](self, "eventReporter"));
  v5 = sub_100070810(-[ICQueryDateHeadersActivity noteContainerViewMode](self, "noteContainerViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity activityType](self, "activityType"));
  objc_msgSend(v4, "submitNoteActionMenuEventForNoteBrowserWithUsageType:layout:activityType:isTimelineView:", 3, v5, v6, +[ICDateHeadersUtilities showsQueryDateHeaders](ICDateHeadersUtilities, "showsQueryDateHeaders"));

}

- (id)menu
{
  return -[ICQueryDateHeadersActivity menuWithCompletion:](self, "menuWithCompletion:", 0);
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
  _QWORD v14[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity activityTitle](self, "activityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity activityImage](self, "activityImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 0, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 2, v4, v7));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICQueryDateHeadersActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 1, v4));

  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v5, v6, 0, 0, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:](ICDateHeadersUtilities, "actionItemTitleWithDateHeadersType:", +[ICDateHeadersUtilities queryDateHeadersType](ICDateHeadersUtilities, "queryDateHeadersType")));
  objc_msgSend(v11, "setSubtitle:", v12);

  return v11;
}

- (id)actionForDateHeadersType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  int v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:](ICDateHeadersUtilities, "actionItemTitleWithDateHeadersType:", v4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A0038;
  v11[3] = &unk_100553330;
  v13 = v4;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:handler:](UIAction, "ic_actionWithTitle:handler:", v7, v11));
  objc_msgSend(v9, "setState:", +[ICDateHeadersUtilities queryDateHeadersType](ICDateHeadersUtilities, "queryDateHeadersType") == (_DWORD)v4);

  return v9;
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
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
