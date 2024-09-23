@implementation _UIDiffableDataSourceSnapshot

- (id)dsImpl
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDiffableDataSourceSnapshot;
  -[_UIDiffableDataSource _impl](&v3, sel__impl);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
