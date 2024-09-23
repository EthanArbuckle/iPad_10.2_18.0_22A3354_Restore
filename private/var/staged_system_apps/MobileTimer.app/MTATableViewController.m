@implementation MTATableViewController

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000068B8;
  v3[3] = &unk_100099320;
  v3[4] = self;
  -[MTATableViewController _reloadData:](self, "_reloadData:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTATableViewController;
  -[MTATableViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  -[MTATableViewController itemsTableRowHeight](self, "itemsTableRowHeight");
  objc_msgSend(v3, "setRowHeight:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setSeparatorStyle:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "_setTopPadding:", 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "_setBottomPadding:", 0.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "reloadState", UIApplicationWillEnterForegroundNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setEditing:animated:", 0, 0);

  v6.receiver = self;
  v6.super_class = (Class)MTATableViewController;
  -[MTATableViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "flashScrollIndicators");

}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)reloadState
{
  -[MTATableViewController reloadState:](self, "reloadState:", 0);
}

- (void)reloadState:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading table view state", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000068C4;
  v9[3] = &unk_100099A90;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[MTATableViewController _reloadData:](self, "_reloadData:", v9);

}

- (float)itemsTableRowHeight
{
  return 0.0;
}

- (MTATableViewController)initWithTableViewStyle:(int64_t)a3
{
  MTATableViewController *v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *addButton;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UIBarButtonItem *v10;
  void *v11;
  MTATableViewController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTATableViewController;
  v3 = -[MTATableViewController initWithStyle:](&v14, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, v3, "showAddView");
    addButton = v3->_addButton;
    v3->_addButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](v3, "tableView"));
    objc_msgSend(v6, "_marginWidth");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](v3, "tableView"));
    objc_msgSend(v9, "setSeparatorInset:", 0.0, v8, 0.0, 0.0);

    v10 = v3->_addButton;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController navigationItem](v3, "navigationItem"));
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

    v12 = v3;
  }

  return v3;
}

- (void)_reloadUI:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MTATableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)_reloadData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  _UIContentUnavailableView *v9;
  _UIContentUnavailableView *noItemsView;
  _UIContentUnavailableView *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a3;
  v5 = -[MTATableViewController numberOfItemsIncludingSleep](self, "numberOfItemsIncludingSleep");
  v6 = v5 < 1 && v3;
  v7 = 0.0;
  if (v5 > 0)
    goto LABEL_11;
  if (!self->_noItemsView
    && -[MTATableViewController isViewLoaded](self, "isViewLoaded", 0.0)
    && (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController noItemsText](self, "noItemsText"));
    v9 = (_UIContentUnavailableView *)objc_msgSend(objc_alloc((Class)_UIContentUnavailableView), "initWithFrame:title:style:includeBackdrop:", v8, 1, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    noItemsView = self->_noItemsView;
    self->_noItemsView = v9;

    -[_UIContentUnavailableView setVibrantOptions:](self->_noItemsView, "setVibrantOptions:", 0);
    v11 = self->_noItemsView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
    objc_msgSend(v12, "setBackgroundView:", v11);

  }
  v7 = 1.0;
  if (v6)
  {
    +[UIView beginAnimations:](UIView, "beginAnimations:", CFSTR("ShowHideNoItemsLabel"), 1.0);
    -[_UIContentUnavailableView setAlpha:](self->_noItemsView, "setAlpha:", 1.0);
    +[UIView endAnimations](UIView, "endAnimations");
  }
  else
  {
LABEL_11:
    -[_UIContentUnavailableView setAlpha:](self->_noItemsView, "setAlpha:", v7);
  }
  v13 = -[MTATableViewController numberOfItemsIncludingSleep](self, "numberOfItemsIncludingSleep");
  if (v13 < 1)
    v15 = 0;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MTATableViewController editButtonItem](self, "editButtonItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setLeftBarButtonItem:", v15);

  if (v13 >= 1)
}

- (void)showAddView
{
  -[MTATableViewController showAddViewWithCompletion:](self, "showAddViewWithCompletion:", 0);
}

- (void)showAddViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController addViewController](self, "addViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentationController"));
  v7 = objc_msgSend(v6, "setDelegate:", self);
  if (MTUIIsVeryWidePhoneSize(v7, v8) && MTUIIsPhoneIdiom())
    objc_msgSend(v5, "setModalPresentationStyle:", 2);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C614;
  v10[3] = &unk_100099A90;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[MTATableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, v10);

}

- (void)dismissAddViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "isSuspended") ^ 1;

  -[MTATableViewController finishAddViewControllerDismissal:](self, "finishAddViewControllerDismissal:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATableViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v5, 0);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "isSuspended") ^ 1;

  -[MTATableViewController finishAddViewControllerDismissal:](self, "finishAddViewControllerDismissal:", v5);
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedRow"));
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 0);

  -[MTATableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)MTATableViewController;
  -[MTATableViewController dealloc](&v4, "dealloc");
}

- (void)viewDidUnload
{
  _UIContentUnavailableView *noItemsView;
  objc_super v4;

  noItemsView = self->_noItemsView;
  self->_noItemsView = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTATableViewController;
  -[MTATableViewController viewDidUnload](&v4, "viewDidUnload");
}

- (void)scrollToTop
{
  double y;
  void *v4;
  double v5;
  double v6;
  id v7;

  y = CGPointZero.y;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "adjustedContentInset");
  v6 = y - v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTATableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setContentOffset:animated:", 1, CGPointZero.x, v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    if (a5)
      -[MTATableViewController _numberOfItemsDidChangeAnimated:](self, "_numberOfItemsDidChangeAnimated:", 1);
  }
}

- (id)noItemsText
{
  return &stru_10009A4D0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (id)addViewController
{
  return 0;
}

- (UIBarButtonItem)addButton
{
  return self->_addButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
}

@end
