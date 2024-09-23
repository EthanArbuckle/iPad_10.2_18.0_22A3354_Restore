@implementation VUIRouterDataSource

- (VUIRouterDataSource)initWithRouterData:(id)a3 appContext:(id)a4
{
  id v6;
  id v7;
  VUIRouterDataSource *v8;
  void *v9;
  uint64_t v10;
  VUIEventDataSource *selectEventDataSource;
  void *v12;
  uint64_t v13;
  VUIEventDataSource *playEventDataSource;
  void *v15;
  uint64_t v16;
  VUIEventDataSource *contextMenuEventDataSource;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VUIRouterDataSource;
  v8 = -[VUIRouterDataSource init](&v19, sel_init);
  if (v8 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("selectEventDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIEventDataSource eventDataSourceWithEventDict:appContext:](VUIEventDataSource, "eventDataSourceWithEventDict:appContext:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    selectEventDataSource = v8->_selectEventDataSource;
    v8->_selectEventDataSource = (VUIEventDataSource *)v10;

    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("playEventDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIEventDataSource eventDataSourceWithEventDict:appContext:](VUIEventDataSource, "eventDataSourceWithEventDict:appContext:", v12, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    playEventDataSource = v8->_playEventDataSource;
    v8->_playEventDataSource = (VUIEventDataSource *)v13;

    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("contextMenuEventDataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIEventDataSource eventDataSourceWithEventDict:appContext:](VUIEventDataSource, "eventDataSourceWithEventDict:appContext:", v15, v7);
    v16 = objc_claimAutoreleasedReturnValue();
    contextMenuEventDataSource = v8->_contextMenuEventDataSource;
    v8->_contextMenuEventDataSource = (VUIEventDataSource *)v16;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuEventDataSource, 0);
  objc_storeStrong((id *)&self->_playEventDataSource, 0);
  objc_storeStrong((id *)&self->_selectEventDataSource, 0);
}

- (VUIRouterDataSource)initWithRouterData:(id)a3 prefetchedData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VUIRouterDataSource *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("selectEventDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIEventDataSource attachPrefetchedDict:eventDict:](VUIEventDataSource, "attachPrefetchedDict:eventDict:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("selectEventDataSource"));
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = -[VUIRouterDataSource initWithRouterData:appContext:]([VUIRouterDataSource alloc], "initWithRouterData:appContext:", v11, 0);

  return v12;
}

- (VUIEventDataSource)selectEventDataSource
{
  return self->_selectEventDataSource;
}

- (void)setSelectEventDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_selectEventDataSource, a3);
}

- (VUIEventDataSource)playEventDataSource
{
  return self->_playEventDataSource;
}

- (void)setPlayEventDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_playEventDataSource, a3);
}

- (VUIEventDataSource)contextMenuEventDataSource
{
  return self->_contextMenuEventDataSource;
}

- (void)setContextMenuEventDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuEventDataSource, a3);
}

- (VUIRouterDataSource)initWithLibraryMediaEntity:(id)a3
{
  id v4;
  VUIRouterDataSource *v5;
  uint64_t v6;
  VUIEventDataSource *selectEventDataSource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIRouterDataSource;
  v5 = -[VUIRouterDataSource init](&v9, sel_init);
  if (v5)
  {
    +[VUIEventDataSource selectEventDataSourceWithLibraryMediaEntity:](VUIEventDataSource, "selectEventDataSourceWithLibraryMediaEntity:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    selectEventDataSource = v5->_selectEventDataSource;
    v5->_selectEventDataSource = (VUIEventDataSource *)v6;

  }
  return v5;
}

@end
