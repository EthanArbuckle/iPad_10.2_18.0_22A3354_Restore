@implementation ICSortQueryActivity

- (ICSortQueryActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5
{
  id v8;
  id v9;
  ICSortQueryActivity *v10;
  ICSortQueryActivity *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICSortQueryActivity;
  v10 = -[ICSortQueryActivity init](&v13, "init");
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
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Sort By"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.sortquery");
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005F91C;
    v10[3] = &unk_100550160;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    -[ICSortQueryActivity activityDidFinish:](self, "activityDidFinish:", 0);
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity activityType](self, "activityType"));
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
  v7.super_class = (Class)ICSortQueryActivity;
  -[ICSortQueryActivity activityDidFinish:](&v7, "activityDidFinish:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity eventReporter](self, "eventReporter"));
  v5 = sub_100070810(-[ICSortQueryActivity noteContainerViewMode](self, "noteContainerViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity activityType](self, "activityType"));
  objc_msgSend(v4, "submitNoteActionMenuEventForNoteBrowserWithUsageType:layout:activityType:isTimelineView:", 3, v5, v6, +[ICDateHeadersUtilities showsQueryDateHeaders](ICDateHeadersUtilities, "showsQueryDateHeaders"));

}

- (id)menuWithCompletion:(id)a3
{
  id v4;
  void *v5;
  ICSortMenu *v6;
  void *v7;
  id v8;
  id v9;
  ICSortMenu *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  ICSortQueryActivity *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType querySortType](ICFolderCustomNoteSortType, "querySortType"));
  v6 = [ICSortMenu alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortQueryActivity activityTitle](self, "activityTitle"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005FB30;
  v13[3] = &unk_100551398;
  v14 = v5;
  v15 = self;
  v16 = v4;
  v8 = v4;
  v9 = v5;
  v10 = -[ICSortMenu initWithTitle:sortType:selectedSortTypeHandler:](v6, "initWithTitle:sortType:selectedSortTypeHandler:", v7, v9, v13);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu createMenu](v10, "createMenu"));
  return v11;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
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
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
