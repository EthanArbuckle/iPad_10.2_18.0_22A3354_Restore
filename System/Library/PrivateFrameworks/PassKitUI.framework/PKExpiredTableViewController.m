@implementation PKExpiredTableViewController

- (PKExpiredTableViewController)initWithStyle:(int64_t)a3
{
  PKExpiredTableViewController *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKExpiredTableViewController;
  v3 = -[PKExpiredTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory)
      v3->_isAccessibilityCategory = 1;
    objc_storeWeak((id *)&v3->_cachingDelegate, 0);
  }
  return v3;
}

- (void)viewDidLoad
{
  UITableView *v3;
  UITableView *tableView;
  UITableView *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKExpiredTableViewController;
  -[PKExpiredTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExpiredTableViewController tableView](self, "tableView");
  v3 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v3;

  -[UITableView setPrefetchDataSource:](self->_tableView, "setPrefetchDataSource:", self);
  v5 = self->_tableView;
  +[PKExpiredPassesTableViewCell height](PKExpiredPassesTableViewCell, "height");
  -[UITableView setEstimatedRowHeight:](v5, "setEstimatedRowHeight:");
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 1);
  -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_tableView, "setAllowsMultipleSelectionDuringEditing:", 1);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
  -[PKExpiredTableViewController setEditing:](self, "setEditing:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellWithReuseIdentifier:(id)a4
{
  id v5;
  PKExpiredPassesTableViewCell *v6;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", v5);
  v6 = (PKExpiredPassesTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[PKExpiredPassesTableViewCell initWithReuseIdentifier:]([PKExpiredPassesTableViewCell alloc], "initWithReuseIdentifier:", v5);
    -[PKExpiredPassesTableViewCell setShowsReorderControl:](v6, "setShowsReorderControl:", 0);
    -[PKExpiredPassesTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
    -[PKExpiredPassesTableViewCell setEditingAccessoryType:](v6, "setEditingAccessoryType:", 1);
  }

  return v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return a4;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  return a4;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "prefetchItemsAtIndexPaths:", v7);

}

- (PKExpiredTableViewControllerCachingDelegate)cachingDelegate
{
  return (PKExpiredTableViewControllerCachingDelegate *)objc_loadWeakRetained((id *)&self->_cachingDelegate);
}

- (void)setCachingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cachingDelegate, a3);
}

- (PKGroupsController)existingGroupsController
{
  return self->_existingGroupsController;
}

- (void)setExistingGroupsController:(id)a3
{
  objc_storeStrong((id *)&self->_existingGroupsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingGroupsController, 0);
  objc_destroyWeak((id *)&self->_cachingDelegate);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
