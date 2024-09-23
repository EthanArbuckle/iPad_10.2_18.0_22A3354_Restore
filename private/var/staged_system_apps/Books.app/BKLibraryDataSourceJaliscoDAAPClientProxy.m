@implementation BKLibraryDataSourceJaliscoDAAPClientProxy

- (void)registerDataSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJaliscoDAAPClientProxy dataSources](self, "dataSources"));
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

+ (id)sharedproxy
{
  if (qword_1009F5258[0] != -1)
    dispatch_once(qword_1009F5258, &stru_1008EF4D8);
  return (id)qword_1009F5250;
}

- (BKLibraryDataSourceJaliscoDAAPClientProxy)init
{
  BKLibraryDataSourceJaliscoDAAPClientProxy *v2;
  NSMutableArray *v3;
  NSMutableArray *dataSources;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourceJaliscoDAAPClientProxy;
  v2 = -[BKLibraryDataSourceJaliscoDAAPClientProxy init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    dataSources = v2->_dataSources;
    v2->_dataSources = v3;

  }
  return v2;
}

- (void)unregisterDataSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJaliscoDAAPClientProxy dataSources](self, "dataSources"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)clientDetectedStoreChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJaliscoDAAPClientProxy dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "clientDetectedStoreChange:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)clientDetectedPredicateChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJaliscoDAAPClientProxy dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "clientDetectedPredicateChange:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end
