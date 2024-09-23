@implementation MapsUIDiffableDataSourceSnapshotDifference

- (MapsUIDiffableDataSourceSnapshotDifference)initWithReloadedItems:(id)a3 insertedItems:(id)a4 deletedItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsUIDiffableDataSourceSnapshotDifference *v11;
  NSArray *v12;
  NSArray *reloadedItems;
  NSArray *v14;
  NSArray *insertedItems;
  NSArray *v16;
  NSArray *deletedItems;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MapsUIDiffableDataSourceSnapshotDifference;
  v11 = -[MapsUIDiffableDataSourceSnapshotDifference init](&v19, "init");
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    reloadedItems = v11->_reloadedItems;
    v11->_reloadedItems = v12;

    v14 = (NSArray *)objc_msgSend(v9, "copy");
    insertedItems = v11->_insertedItems;
    v11->_insertedItems = v14;

    v16 = (NSArray *)objc_msgSend(v10, "copy");
    deletedItems = v11->_deletedItems;
    v11->_deletedItems = v16;

  }
  return v11;
}

- (id)differenceUnionWithDifference:(id)a3
{
  NSArray *reloadedItems;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  reloadedItems = self->_reloadedItems;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", reloadedItems));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reloadedItems"));
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_insertedItems));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "insertedItems"));
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_deletedItems));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deletedItems"));

  objc_msgSend(v10, "addObjectsFromArray:", v11);
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReloadedItems:insertedItems:deletedItems:", v6, v8, v10);

  return v12;
}

- (BOOL)hasChanges
{
  return -[NSArray count](self->_reloadedItems, "count")
      || -[NSArray count](self->_insertedItems, "count")
      || -[NSArray count](self->_deletedItems, "count") != 0;
}

- (NSArray)reloadedItems
{
  return self->_reloadedItems;
}

- (NSArray)insertedItems
{
  return self->_insertedItems;
}

- (NSArray)deletedItems
{
  return self->_deletedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_insertedItems, 0);
  objc_storeStrong((id *)&self->_reloadedItems, 0);
}

@end
