@implementation SUReportConcernViewController

- (SUReportConcernViewController)initWithItemIdentifier:(unint64_t)a3
{
  SUReportConcernViewController *v4;
  SUReportConcernViewController *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  SUConcernListDataSource *v10;

  v4 = -[SUTableViewController init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_itemIdentifier = a3;
    -[SUTableViewController setTableViewStyle:](v4, "setTableViewStyle:", 1);
    -[SUViewController setTitle:](v5, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REPORT_A_PROBLEM_PAGE_TITLE"), &stru_24DE83F60, 0));
    v6 = objc_alloc(MEMORY[0x24BDF6860]);
    v7 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0), 0, v5, sel__cancel_);
    -[SUNavigationItem setLeftBarButtonItem:](-[SUViewController navigationItem](v5, "navigationItem"), "setLeftBarButtonItem:", v7);

    v8 = objc_alloc(MEMORY[0x24BDF6860]);
    v9 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REPORT"), &stru_24DE83F60, 0), 2, v5, sel__submit_);
    objc_msgSend(v9, "setEnabled:", 0);
    -[SUNavigationItem setRightBarButtonItem:](-[SUViewController navigationItem](v5, "navigationItem"), "setRightBarButtonItem:", v9);

    v10 = objc_alloc_init(SUConcernListDataSource);
    -[SUTableViewController setDataSource:](v5, "setDataSource:", v10);

  }
  return v5;
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  UITableView *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = -[SUTableViewController tableView](self, "tableView", a3, a4);
  v7 = -[SUTableDataSource selectedConcernIndex](self->super._dataSource, "selectedConcernIndex");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || (v8 = v7, v7 == objc_msgSend(a3, "row")))
    v9 = 0;
  else
    v9 = objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, 0);
  -[SUTableDataSource setSelectedConcernIndex:](self->super._dataSource, "setSelectedConcernIndex:", objc_msgSend(a3, "row"));
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v6, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, v9, 0), 5);
  -[UITableView deselectRowAtIndexPath:animated:](v6, "deselectRowAtIndexPath:animated:", a3, 1);
  objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "resignFirstResponder");
  return 1;
}

- (void)keyboardWillHideWithInfo:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  if (!self->_animatingKeyboard)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79C0]);
    v6 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79B8]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
    -[SUTableView setScrollEnabled:](self->super._tableView, "setScrollEnabled:", 0);
    self->_animatingKeyboard = 1;
    -[SUTableView contentOffset](self->super._tableView, "contentOffset");
    v8 = v7;
    -[SUTableView setContentInset:](self->super._tableView, "setContentInset:", self->_originalTableInsets.top, self->_originalTableInsets.left, self->_originalTableInsets.bottom, self->_originalTableInsets.right);
    objc_msgSend((id)-[SUReportConcernViewController view](self, "view"), "bounds");
    v10 = v9;
    -[SUTableView frame](self->super._tableView, "frame");
    v14 = v11;
    v15 = v12;
    v17 = v16 - v8;
    if (v10 >= v8 + v13 - self->_originalTableInsets.bottom + 12.0)
      v18 = v10;
    else
      v18 = v8 + v13 - self->_originalTableInsets.bottom + 12.0;
    -[SUTableView setFrame:](self->super._tableView, "setFrame:", v11, v17, v12, v18);
    -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    if (v5 && (objc_msgSend(v5, "doubleValue"), v20 = v19, v19 > 2.22044605e-16))
    {
      objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationCurve:", objc_msgSend(v6, "integerValue"));
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__hideKeyboardDidStop_finished_context_);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", v20);
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v14, 0.0, v15, v10);
      objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
    }
    else
    {
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v14, 0.0, v15, v10);
      -[SUReportConcernViewController _hideKeyboardDidStop:finished:context:](self, "_hideKeyboardDidStop:finished:context:", 0, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), 0);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SUReportConcernViewController;
  -[UIViewController keyboardWillHideWithInfo:](&v21, sel_keyboardWillHideWithInfo_, a3);
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  uint64_t v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v5 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF7A20]);
  if (!self->_animatingKeyboard && v5 != 0)
  {
    v7 = (void *)v5;
    -[SUTableView contentOffset](self->super._tableView, "contentOffset");
    v33 = v8;
    v10 = v9;
    -[SUTableView frame](self->super._tableView, "frame");
    v34 = v11;
    v35 = v12;
    v14 = v13;
    objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21 - v10;
    objc_msgSend(v7, "CGRectValue");
    objc_msgSend(MEMORY[0x24BDF6D38], "convertRect:toView:", self->super._tableView);
    v24 = v23;
    v26 = v25;
    v37.origin.x = v16;
    v37.origin.y = v22;
    v37.size.width = v18;
    v37.size.height = v20;
    if (v24 < CGRectGetMaxY(v37))
    {
      v27 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79C0]);
      v28 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79B8]);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
      -[SUTableView setScrollEnabled:](self->super._tableView, "setScrollEnabled:", 0);
      self->_animatingKeyboard = 1;
      v29 = v14 - v26 - (v20 + 12.0);
      v38.origin.x = v16;
      v38.origin.y = v22;
      v38.size.width = v18;
      v38.size.height = v20;
      v30 = v29 + CGRectGetMaxY(v38);
      if (v14 < v30)
        v14 = v30;
      -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, 0.0, v35, v14);
      -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", v33, v10);
      if (v27 && (objc_msgSend(v27, "doubleValue"), v32 = v31, v31 > 2.22044605e-16))
      {
        objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
        objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationCurve:", objc_msgSend(v28, "integerValue"));
        objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
        objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__showKeyboardDidStop_finished_context_);
        objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", v32);
        v39.origin.x = v16;
        v39.origin.y = v22;
        v39.size.width = v18;
        v39.size.height = v20;
        -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, v29 - CGRectGetMinY(v39) + 0.0, v35, v14);
        objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
      }
      else
      {
        v40.origin.x = v16;
        v40.origin.y = v22;
        v40.size.width = v18;
        v40.size.height = v20;
        -[SUTableView setFrame:](self->super._tableView, "setFrame:", v34, v29 - CGRectGetMinY(v40) + 0.0, v35, v14);
        -[SUReportConcernViewController _showKeyboardDidStop:finished:context:](self, "_showKeyboardDidStop:finished:context:", 0, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), 0);
      }
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)SUReportConcernViewController;
  -[UIViewController keyboardWillShowWithInfo:](&v36, sel_keyboardWillShowWithInfo_, a3);
}

- (void)loadView
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUReportConcernViewController;
  -[SUTableViewController loadView](&v7, sel_loadView);
  -[SUTableView contentInset](self->super._tableView, "contentInset");
  self->_originalTableInsets.top = v3;
  self->_originalTableInsets.left = v4;
  self->_originalTableInsets.bottom = v5;
  self->_originalTableInsets.right = v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUReportConcernViewController _fetchConcerns](self, "_fetchConcerns");
  v5.receiver = self;
  v5.super_class = (Class)SUReportConcernViewController;
  -[SUTableViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v7;
  objc_super v8;

  v7 = +[SUDialogManager newDialogWithError:](SUDialogManager, "newDialogWithError:", a4);
  -[SUClientInterface _presentDialog:](-[SUViewController clientInterface](self, "clientInterface"), "_presentDialog:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SUReportConcernViewController;
  -[SUViewController operation:failedWithError:](&v8, sel_operation_failedWithError_, a3, a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;

  objc_msgSend((id)-[SUNavigationItem rightBarButtonItem](-[SUViewController navigationItem](self, "navigationItem", a3), "rightBarButtonItem"), "setEnabled:", 1);
  v6 = objc_msgSend(a4, "count");
  v7 = v6 - 1;
  if (v6 < 1)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = v6;
    for (i = 0; i != v8; ++i)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", i), "isDefaultConcern"))
        v7 = i;
    }
  }
  -[SUTableDataSource setConcerns:](self->super._dataSource, "setConcerns:", a4);
  -[SUTableDataSource setSelectedConcernIndex:](self->super._dataSource, "setSelectedConcernIndex:", v7);
  -[SUTableViewController reloadData](self, "reloadData");
}

- (void)_hideKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  self->_animatingKeyboard = 0;
  -[SUTableView setScrollEnabled:](self->super._tableView, "setScrollEnabled:", 1, a4, a5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (void)_showKeyboardDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;

  -[SUTableView contentOffset](self->super._tableView, "contentOffset", a3, a4, a5);
  v26 = v7;
  v27 = v6;
  -[SUTableView frame](self->super._tableView, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SUTableView contentInset](self->super._tableView, "contentInset");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend((id)-[SUReportConcernViewController view](self, "view"), "bounds");
  v23 = v22;
  v24 = (void *)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  if (v24)
  {
    objc_msgSend(v24, "frame");
    v19 = v25 + 12.0;
  }
  -[SUTableView setFrame:](self->super._tableView, "setFrame:", v9, 0.0, v13, v23);
  -[SUTableView setContentInset:](self->super._tableView, "setContentInset:", v15, v17, v19, v21);
  -[SUTableView setContentOffset:](self->super._tableView, "setContentOffset:", v27, v26 + fabs(v11));
  self->_animatingKeyboard = 0;
  -[SUTableView setScrollEnabled:](self->super._tableView, "setScrollEnabled:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (void)_cancel:(id)a3
{
  -[SUReportConcernViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_submit:(id)a3
{
  uint64_t v4;
  SUPostConcernOperation *v5;

  v4 = -[SUTableDataSource selectedConcernIndex](self->super._dataSource, "selectedConcernIndex", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[SUPostConcernOperation initWithConcern:]([SUPostConcernOperation alloc], "initWithConcern:", objc_msgSend((id)-[SUTableDataSource concerns](self->super._dataSource, "concerns"), "objectAtIndex:", v4));
    -[SUPostConcernOperation setCommentText:](v5, "setCommentText:", objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource textViewCell](self->super._dataSource, "textViewCell"), "textContentView"), "text"));
    -[SUPostConcernOperation setItemIdentifier:](v5, "setItemIdentifier:", self->_itemIdentifier);
    -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", SUMakeBackgroundTask((uint64_t)v5, (uint64_t)CFSTR("com.apple.iTunesStoreUI.report-concern")), 0);
    -[SUReportConcernViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_fetchConcerns
{
  id v3;
  id v4;

  if (!-[SUViewController isSkLoading](self, "isSkLoading"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    objc_msgSend(v4, "setDataProvider:", +[ISDataProvider provider](SUConcernListDataProvider, "provider"));
    v3 = objc_alloc_init(MEMORY[0x24BEB1F30]);
    objc_msgSend(v3, "setURLBagKey:", CFSTR("p2-concern-list"));
    objc_msgSend(v4, "setRequestProperties:", v3);

    -[SUViewController setSkLoading:](self, "setSkLoading:", 1);
    -[SUViewController enqueueOperation:cancelOnDealloc:](self, "enqueueOperation:cancelOnDealloc:", v4, 1);

  }
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

@end
