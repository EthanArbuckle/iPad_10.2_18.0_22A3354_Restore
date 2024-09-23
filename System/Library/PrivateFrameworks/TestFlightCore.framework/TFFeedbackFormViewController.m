@implementation TFFeedbackFormViewController

- (TFFeedbackFormViewController)initWithPresenter:(id)a3
{
  id v5;
  TFFeedbackFormViewController *v6;
  TFFeedbackFormViewController *v7;
  TFFeedbackFormViewDataSource *v8;
  TFFeedbackFormViewDataSource *viewDataSource;
  id v10;
  void *v11;
  uint64_t v12;
  UIBarButtonItem *submitButtonItem;
  uint64_t v14;
  UIActivityIndicatorView *activityIndicatorView;
  uint64_t v16;
  UIBarButtonItem *activityItem;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TFFeedbackFormViewController;
  v6 = -[TFFeedbackFormViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = -[TFFeedbackFormViewDataSource initWithPresenter:]([TFFeedbackFormViewDataSource alloc], "initWithPresenter:", v7->_presenter);
    viewDataSource = v7->_viewDataSource;
    v7->_viewDataSource = v8;

    v10 = objc_alloc(MEMORY[0x24BDF6860]);
    TFLocalizedString(CFSTR("FEEDBACK_NAVIGATION_SUBMIT_BUTTON_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 2, v7, sel_submitButtonPressed_);
    submitButtonItem = v7->_submitButtonItem;
    v7->_submitButtonItem = (UIBarButtonItem *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v7->_activityIndicatorView;
    v7->_activityIndicatorView = (UIActivityIndicatorView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v7->_activityIndicatorView);
    activityItem = v7->_activityItem;
    v7->_activityItem = (UIBarButtonItem *)v16;

  }
  return v7;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  -[TFFeedbackFormViewController setView:](self, "setView:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 1, v4, v5, v6, v7);
  -[TFFeedbackFormViewController setTableView:](self, "setTableView:", v9);

  -[TFFeedbackFormViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 18);

  -[TFFeedbackFormViewController viewDataSource](self, "viewDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDataSource:", v11);

  -[TFFeedbackFormViewController viewDataSource](self, "viewDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v13);

  -[TFFeedbackFormViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyboardDismissMode:", 2);

  -[TFFeedbackFormViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSeparatorStyle:", 0);

  -[TFFeedbackFormViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInset:", 0.0, 0.0, 50.0, 0.0);

  -[TFFeedbackFormViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[TFFeedbackFormViewController viewDataSource](self, "viewDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "prepareTableViewForDataSource:", v21);

  -[TFFeedbackFormViewController showSubmitButtonForSubmissionPendingState:](self, "showSubmitButtonForSubmissionPendingState:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  -[TFFeedbackFormViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[TFFeedbackFormViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareViewForForm");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  -[TFFeedbackFormViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TFFeedbackFormViewController registerNotifications](self, "registerNotifications");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormViewController;
  -[TFFeedbackFormViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TFFeedbackFormViewController;
  -[TFFeedbackFormViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[TFFeedbackFormViewController unregisterNotifications](self, "unregisterNotifications");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormViewController;
  -[TFFeedbackFormViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)registerNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_adjustContentOffsetForKeyboardNotification_, *MEMORY[0x24BDF7A00], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_adjustContentOffsetForKeyboardNotification_, *MEMORY[0x24BDF7B78], 0);

}

- (void)unregisterNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7A00], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF79F8], 0);

}

- (void)setNavigationItemTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TFFeedbackFormViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)prepareForEntryType:(unint64_t)a3
{
  objc_class *v4;
  void *v5;
  id v6;

  -[TFFeedbackFormViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[TFFeedbackEntryTypeCellProvider cellClassForEntryType:](TFFeedbackEntryTypeCellProvider, "cellClassForEntryType:", a3);
  +[TFFeedbackEntryTypeCellProvider reuseIdentifierForEntryType:](TFFeedbackEntryTypeCellProvider, "reuseIdentifierForEntryType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v4, v5);

}

- (void)reloadEntryGroupsAtIndices:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[TFFeedbackFormViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:withRowAnimation:", v5, 100);

  }
}

- (void)reloadEntriesAtIndexPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[TFFeedbackFormViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 100);

  }
}

- (void)showSubmitButtonForSubmissionPendingState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[TFFeedbackFormViewController activityIndicatorView](self, "activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "startAnimating");

    -[TFFeedbackFormViewController activityItem](self, "activityItem");
  }
  else
  {
    objc_msgSend(v5, "stopAnimating");

    -[TFFeedbackFormViewController submitButtonItem](self, "submitButtonItem");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF67E8];
  TFLocalizedString(CFSTR("ALERT_DISMISS_ACTION_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, &__block_literal_global_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v7);
  -[TFFeedbackFormViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)adjustContentOffsetForKeyboardNotification:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7A00]);

  if (v5)
  {
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF7A20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;

    v10 = v9 + 50.0;
  }
  else
  {
    v10 = 50.0;
  }
  -[TFFeedbackFormViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInset:", 0.0, 0.0, v10, 0.0);

}

- (void)submitButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[TFFeedbackFormViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  -[TFFeedbackFormViewController presenter](self, "presenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterViewDidInitiateFeedbackSubmission:", self);

}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (TFFeedbackFormViewDataSource)viewDataSource
{
  return self->_viewDataSource;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIBarButtonItem)submitButtonItem
{
  return self->_submitButtonItem;
}

- (UIBarButtonItem)activityItem
{
  return self->_activityItem;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_submitButtonItem, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_viewDataSource, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
