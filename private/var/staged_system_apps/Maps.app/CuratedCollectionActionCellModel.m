@implementation CuratedCollectionActionCellModel

- (CuratedCollectionActionCellModel)initWithCollection:(id)a3
{
  id v5;
  CuratedCollectionActionCellModel *v6;
  CuratedCollectionActionCellModel *v7;
  CuratedCollectionActionManager *v8;
  CuratedCollectionActionManager *actionManager;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionActionCellModel;
  v6 = -[CuratedCollectionActionCellModel init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = objc_alloc_init(CuratedCollectionActionManager);
    actionManager = v7->_actionManager;
    v7->_actionManager = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v10, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionActionCellModel;
  -[CuratedCollectionActionCellModel dealloc](&v4, "dealloc");
}

- (CuratedCollectionActionManager)actionManager
{
  -[CuratedCollectionActionCellModel _updateActionManagerState](self, "_updateActionManagerState");
  return self->_actionManager;
}

- (void)setActionDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_actionDelegate, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionCellModel actionManager](self, "actionManager"));
    objc_msgSend(v6, "setDelegate:", obj);

  }
}

- (void)_updateActionManagerState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionCellModel collection](self, "collection"));
  -[CuratedCollectionActionManager setCollectionIsSaved:](self->_actionManager, "setCollectionIsSaved:", objc_msgSend(v3, "collectionIsSaved:", v4));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionCellModel collection](self, "collection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisherCollectionURL"));
  -[CuratedCollectionActionManager setHasHomePage:](self->_actionManager, "setHasHomePage:", v5 != 0);

}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (CuratedCollectionActionDelegate)actionDelegate
{
  return (CuratedCollectionActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end
