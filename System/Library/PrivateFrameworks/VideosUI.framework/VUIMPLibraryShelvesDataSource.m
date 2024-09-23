@implementation VUIMPLibraryShelvesDataSource

void __61__VUIMPLibraryShelvesDataSource_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shelvesDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "shelvesDidFinishWithDataSource:", WeakRetained);

}

- (void)startFetch
{
  NSMutableArray *v3;
  NSMutableArray *fetchedDataSources;
  id v5;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  fetchedDataSources = self->_fetchedDataSources;
  self->_fetchedDataSources = v3;

  -[VUIMPLibraryShelvesDataSource _dataSourceForShelves](self, "_dataSourceForShelves");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUILibraryShelvesDataSource setDataSourcesByShelfType:](self, "setDataSourcesByShelfType:", v5);

}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMPLibraryShelvesDataSource)initWithValidShelfTypes:(id)a3 forMediaLibrary:(id)a4
{
  id v7;
  VUIMPLibraryShelvesDataSource *v8;
  VUIMPLibraryShelvesDataSource *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMPLibraryShelvesDataSource;
  v8 = -[VUILibraryShelvesDataSource initWithValidShelfTypes:](&v11, sel_initWithValidShelfTypes_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a4);
    -[VUIMPLibraryShelvesDataSource _addRentalsUpdateNotificationObserver](v9, "_addRentalsUpdateNotificationObserver");
  }

  return v9;
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[NSMutableArray addObject:](self->_fetchedDataSources, "addObject:", v4);
  v5 = -[NSMutableArray count](self->_fetchedDataSources, "count");
  -[VUILibraryShelvesDataSource shelfTypes](self, "shelfTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __61__VUIMPLibraryShelvesDataSource_dataSourceDidFinishFetching___block_invoke;
    v12 = &unk_1E9F99C98;
    objc_copyWeak(&v13, &location);
    v8 = &v9;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v9, v10))
      v11((uint64_t)v8);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (id)_dataSourceForShelves
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VUILibraryShelvesDataSource shelfTypes](self, "shelfTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        -[VUIMPLibraryShelvesDataSource mediaLibrary](self, "mediaLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForShelf:withLibrary:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setDelegate:", self);
        objc_msgSend(v11, "startFetch");
        objc_msgSend(v3, "setObject:forKey:", v11, v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)_addRentalsUpdateNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateRentalShelf, CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), 0);

}

- (void)dealloc
{
  objc_super v3;

  -[VUIMPLibraryShelvesDataSource _removeRentalsUpdateNotificationObserver](self, "_removeRentalsUpdateNotificationObserver");
  -[NSMutableArray removeAllObjects](self->_fetchedDataSources, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)VUIMPLibraryShelvesDataSource;
  -[VUIMPLibraryShelvesDataSource dealloc](&v3, sel_dealloc);
}

- (void)_removeRentalsUpdateNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), 0);

}

- (void)_updateRentalShelf
{
  void *v3;
  id v4;

  -[VUILibraryShelvesDataSource dataSourcesByShelfType](self, "dataSourcesByShelfType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_1EA0BA9F0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeObject:](self->_fetchedDataSources, "removeObject:", v4);
  objc_msgSend(v4, "startFetch");

}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (NSMutableArray)fetchedDataSources
{
  return self->_fetchedDataSources;
}

- (void)setFetchedDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedDataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedDataSources, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
