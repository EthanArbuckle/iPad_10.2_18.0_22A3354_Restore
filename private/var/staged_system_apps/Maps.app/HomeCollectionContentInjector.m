@implementation HomeCollectionContentInjector

- (HomeCollectionContentInjector)initWithCollection:(id)a3
{
  return -[HomeCollectionContentInjector initWithCollection:selectedMapItem:](self, "initWithCollection:selectedMapItem:", a3, 0);
}

- (HomeCollectionContentInjector)initWithCollection:(id)a3 selectedMapItem:(id)a4
{
  id v7;
  id v8;
  HomeCollectionContentInjector *v9;
  HomeCollectionContentInjector *v10;
  SearchResult *v11;
  SearchResult *selectedSearchResult;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HomeCollectionContentInjector;
  v9 = -[HomeCollectionContentInjector init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    -[CollectionHandler addObserver:](v10->_collection, "addObserver:", v10);
    objc_storeStrong((id *)&v10->_selectedMapItem, a4);
    if (v8)
    {
      v11 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);
      selectedSearchResult = v10->_selectedSearchResult;
      v10->_selectedSearchResult = v11;

    }
  }

  return v10;
}

- (id)_searchResults
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  SearchResult *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((id)-[CollectionHandler contentType](self->_collection, "contentType") == (id)1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collection, "content", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8));
          objc_msgSend(v3, "addObject:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  v10 = objc_msgSend(v3, "copy");

  return v10;
}

- (void)addContentToMapView
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[HomeCollectionContentInjector _searchResults](self, "_searchResults"));
  if (objc_msgSend(v7, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v7));
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "searchPinsManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionContentInjector selectedSearchResult](self, "selectedSearchResult"));
    objc_msgSend(v5, "setCollectionsPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:", v3, 1, v6, 1);

  }
}

- (void)removeContentFromMapView
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "searchPinsManager"));
  objc_msgSend(v2, "clearCollectionPins");

}

- (void)collectionHandlerContentUpdated:(id)a3
{
  void (**updateContentInjection)(id, HomeCollectionContentInjector *);

  updateContentInjection = (void (**)(id, HomeCollectionContentInjector *))self->_updateContentInjection;
  if (updateContentInjection)
    updateContentInjection[2](updateContentInjection, self);
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (MKMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_actionCoordinator, a3);
}

- (SearchResult)selectedSearchResult
{
  return self->_selectedSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSearchResult, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_selectedMapItem, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong(&self->_updateContentInjection, 0);
}

@end
