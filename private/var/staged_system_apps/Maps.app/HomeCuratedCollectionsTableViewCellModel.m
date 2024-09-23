@implementation HomeCuratedCollectionsTableViewCellModel

- (HomeCuratedCollectionsTableViewCellModel)initWithResultDataProvider:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HomeCuratedCollectionsTableViewCellModel *v9;
  HomeCuratedCollectionsTableViewCellModel *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HomeCuratedCollectionsTableViewCellModel;
  v9 = -[HomeCuratedCollectionsTableViewCellModel init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultDataProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider observers](v10->_resultDataProvider, "observers"));
    objc_msgSend(v11, "registerObserver:", v10);

  }
  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[HomeResultDataProvider hash](self->_resultDataProvider, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HomeCuratedCollectionsTableViewCellModel *v4;
  HomeCuratedCollectionsTableViewCellModel *v5;
  uint64_t v6;
  HomeCuratedCollectionsTableViewCellModel *v7;
  HomeResultDataProvider *v8;
  HomeResultDataProvider *v9;
  id v10;
  id WeakRetained;
  unsigned __int8 v12;

  v4 = (HomeCuratedCollectionsTableViewCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (HomeResultDataProvider *)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel resultDataProvider](v7, "resultDataProvider"));
    v9 = v8;
    if (v8 == self->_resultDataProvider || -[HomeResultDataProvider isEqual:](v8, "isEqual:"))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[HomeCuratedCollectionsTableViewCellModel delegate](v7, "delegate"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v10 == WeakRetained)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", WeakRetained);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)curatedCollections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider homeResult](self->_resultDataProvider, "homeResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "curatedCollections"));

  return (NSArray *)v3;
}

- (GEOExploreGuides)exploreGuides
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider homeResult](self->_resultDataProvider, "homeResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "exploreGuides"));

  return (GEOExploreGuides *)v3;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeCuratedCollectionsTableViewCellModelObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return (MKCuratedCollectionsSyncCoordinator *)+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager");
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  -[GEOObserverHashTable cellModelDidUpdate:](self->_observers, "cellModelDidUpdate:", self);
}

- (HomeResultDataProvider)resultDataProvider
{
  return self->_resultDataProvider;
}

- (HomeCuratedCollectionsTableViewCellDelegate)delegate
{
  return (HomeCuratedCollectionsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultDataProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
