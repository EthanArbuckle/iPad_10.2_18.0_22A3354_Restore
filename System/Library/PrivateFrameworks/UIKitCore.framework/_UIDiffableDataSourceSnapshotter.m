@implementation _UIDiffableDataSourceSnapshotter

- (id)snapshot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource snapshot](&v3, sel_snapshot);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)emptySnapshot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource emptySnapshot](&v3, sel_emptySnapshot);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyDifferencesFromSnapshot:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource applyDifferencesFromSnapshot:](&v3, sel_applyDifferencesFromSnapshot_, a3);
}

- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource applyDifferencesFromSnapshot:completion:](&v4, sel_applyDifferencesFromSnapshot_completion_, a3, a4);
}

- (void)reloadFromSnapshot:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource reloadFromSnapshot:](&v3, sel_reloadFromSnapshot_, a3);
}

- (void)reloadFromSnapshot:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource reloadFromSnapshot:completion:](&v4, sel_reloadFromSnapshot_completion_, a3, a4);
}

- (void)applySnapshot:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshotter;
  -[_UIDiffableDataSource applySnapshot:](&v3, sel_applySnapshot_, a3);
}

@end
