@implementation _NSDiffableDataSourceSectionSnapshotInternal

- (void)appendItems:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot appendItems:](&v3, sel_appendItems_, a3);
}

- (void)appendItems:(id)a3 intoParent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot appendItems:intoParent:](&v4, sel_appendItems_intoParent_, a3, a4);
}

- (void)insertItems:(id)a3 beforeItem:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot insertItems:beforeItem:](&v4, sel_insertItems_beforeItem_, a3, a4);
}

- (void)insertItems:(id)a3 afterItem:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot insertItems:afterItem:](&v4, sel_insertItems_afterItem_, a3, a4);
}

- (void)deleteItems:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot deleteItems:](&v3, sel_deleteItems_, a3);
}

- (void)expandItems:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot expandItems:](&v3, sel_expandItems_, a3);
}

- (void)collapseItems:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot collapseItems:](&v3, sel_collapseItems_, a3);
}

- (BOOL)containsItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  return -[NSDiffableDataSourceSectionSnapshot containsItem:](&v4, sel_containsItem_, a3);
}

- (BOOL)isExpanded:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  return -[NSDiffableDataSourceSectionSnapshot isExpanded:](&v4, sel_isExpanded_, a3);
}

- (id)items
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot items](&v3, sel_items);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)visibleItems
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot visibleItems](&v3, sel_visibleItems);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)childrenOfParent:(id)a3 recursive:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot childrenOfParent:recursive:](&v5, sel_childrenOfParent_recursive_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)childrenOfParent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot childrenOfParent:](&v4, sel_childrenOfParent_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parentOfChild:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSDiffableDataSourceSectionSnapshotInternal;
  -[NSDiffableDataSourceSectionSnapshot parentOfChild:](&v4, sel_parentOfChild_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
