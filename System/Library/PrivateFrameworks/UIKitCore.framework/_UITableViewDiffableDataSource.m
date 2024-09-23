@implementation _UITableViewDiffableDataSource

- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITableViewDiffableDataSource;
  return -[_UIDiffableDataSource initWithTableView:cellProvider:](&v5, sel_initWithTableView_cellProvider_, a3, a4);
}

- (UITableView)tableView
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITableView *)v3;
}

- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITableViewDiffableDataSource;
  return -[_UIDiffableDataSource initWithTableView:reuseIdentifierProvider:cellConfigurationHandler:](&v6, sel_initWithTableView_reuseIdentifierProvider_cellConfigurationHandler_, a3, a4, a5);
}

- (int64_t)defaultRowAnimation
{
  return self->_defaultRowAnimation;
}

- (void)setDefaultRowAnimation:(int64_t)a3
{
  self->_defaultRowAnimation = a3;
}

@end
