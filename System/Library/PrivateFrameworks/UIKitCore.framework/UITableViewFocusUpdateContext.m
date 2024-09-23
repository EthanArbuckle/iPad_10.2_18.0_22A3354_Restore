@implementation UITableViewFocusUpdateContext

+ (id)_contextWithContext:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContext:tableView:", v7, v6);

  return v8;
}

- (id)_initWithContext:(id)a3 tableView:(id)a4
{
  id v6;
  id *v7;
  id *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewFocusUpdateContext;
  v7 = -[UIFocusUpdateContext _initWithContext:](&v10, sel__initWithContext_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak(v7 + 23, v6);

  return v8;
}

- (NSIndexPath)previouslyFocusedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  int v11;

  if (!self->_didSetPreviouslyFocusedIndexPath)
  {
    -[UIFocusUpdateContext previouslyFocusedView](self, "previouslyFocusedView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v11 = 0;
      -[UITableViewFocusUpdateContext tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusUpdateContext previouslyFocusedView](self, "previouslyFocusedView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v4, "_managedSubviewForView:viewType:indexPath:", v5, &v11, &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v8 = v10;

      if (v6 && v11 == 1)
        objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, v7);

    }
    self->_didSetPreviouslyFocusedIndexPath = 1;
  }
  return self->_previouslyFocusedIndexPath;
}

- (NSIndexPath)nextFocusedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  int v11;

  if (!self->_didSetNextFocusedIndexPath)
  {
    -[UIFocusUpdateContext nextFocusedView](self, "nextFocusedView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v11 = 0;
      -[UITableViewFocusUpdateContext tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusUpdateContext nextFocusedView](self, "nextFocusedView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v4, "_managedSubviewForView:viewType:indexPath:", v5, &v11, &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v8 = v10;

      if (v6 && v11 == 1)
        objc_storeStrong((id *)&self->_nextFocusedIndexPath, v7);

    }
    self->_didSetNextFocusedIndexPath = 1;
  }
  return self->_nextFocusedIndexPath;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_nextFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, 0);
}

@end
