@implementation WGWidgetDataSource

- (WGWidgetDataSource)initWithIdentifier:(id)a3
{
  id v4;
  WGWidgetDataSource *v5;
  uint64_t v6;
  NSString *dataSourceIdentifier;
  _WGConcreteDataSource *v8;
  _WGConcreteDataSource *concreteDataSource;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetDataSource;
  v5 = -[WGWidgetDataSource init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = (NSString *)v6;

    v8 = objc_alloc_init(_WGConcreteDataSource);
    concreteDataSource = v5->_concreteDataSource;
    v5->_concreteDataSource = v8;

  }
  return v5;
}

- (NSString)parentDataSourceIdentifier
{
  return 0;
}

- (NSArray)widgetIdentifiers
{
  return -[_WGConcreteDataSource dataIdentifiers](self->_concreteDataSource, "dataIdentifiers");
}

- (id)widgetDatumWithIdentifier:(id)a3
{
  return -[_WGConcreteDataSource datumWithIdentifier:](self->_concreteDataSource, "datumWithIdentifier:", a3);
}

- (BOOL)isEqual:(id)a3
{
  return _WGDataSourceIsEqualToDataSource(self, a3);
}

- (void)addWidgetObserver:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _WGConcreteDataSource *concreteDataSource;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  concreteDataSource = self->_concreteDataSource;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__WGWidgetDataSource_addWidgetObserver_completion___block_invoke;
  v11[3] = &unk_24D732568;
  v9 = v7;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v6;
  v12 = v10;
  -[_WGConcreteDataSource addObserver:completion:](concreteDataSource, "addObserver:completion:", v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __51__WGWidgetDataSource_addWidgetObserver_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(WeakRetained, "_concreteDataSource", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(a1 + 32), "widgetDataSource:replaceWithDatum:", WeakRetained, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeWidgetObserver:(id)a3 completion:(id)a4
{
  -[_WGConcreteDataSource removeObserver:completion:](self->_concreteDataSource, "removeObserver:completion:", a3, a4);
}

- (void)replaceWithDatum:(id)a3
{
  -[_WGConcreteDataSource dataSource:replaceWithDatum:observerUpdateBlock:](self->_concreteDataSource, "dataSource:replaceWithDatum:observerUpdateBlock:");
}

void __39__WGWidgetDataSource_replaceWithDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254F02690) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "widgetDataSource:replaceWithDatum:", *(_QWORD *)(a1 + 32), v5);

}

- (void)removeDatumWithIdentifier:(id)a3
{
  -[_WGConcreteDataSource dataSource:removeDatumWithIdentifier:observerUpdateBlock:](self->_concreteDataSource, "dataSource:removeDatumWithIdentifier:observerUpdateBlock:");
}

void __48__WGWidgetDataSource_removeDatumWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254F02690) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "widgetDataSource:removeDatum:", *(_QWORD *)(a1 + 32), v5);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[WGWidgetDataSource dataSourceIdentifier](self, "dataSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; dataSourceIdentifier: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (_WGConcreteDataSource)_concreteDataSource
{
  return self->_concreteDataSource;
}

- (void)_setConcreteDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_concreteDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
}

@end
