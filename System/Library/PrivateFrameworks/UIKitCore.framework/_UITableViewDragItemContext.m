@implementation _UITableViewDragItemContext

- (_UITableViewDragItemContext)initWithIndexPath:(id)a3 forTableView:(id)a4
{
  id v7;
  id v8;
  _UITableViewDragItemContext *v9;
  _UITableViewDragItemContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITableViewDragItemContext;
  v9 = -[_UITableViewDragItemContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_tableView, v8);
    objc_storeStrong((id *)&v10->_indexPath, a3);
  }

  return v10;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
