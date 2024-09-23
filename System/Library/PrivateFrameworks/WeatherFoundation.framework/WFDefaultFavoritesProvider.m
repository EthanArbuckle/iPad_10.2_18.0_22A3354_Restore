@implementation WFDefaultFavoritesProvider

- (WFDefaultFavoritesProvider)initWithDelegate:(id)a3 persistence:(id)a4
{
  id v5;
  WFDefaultFavoritesProvider *v6;
  WFDefaultFavoritesProvider *v7;
  WFDefaultFavoritesProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDefaultFavoritesProvider;
  v6 = -[WFDefaultFavoritesProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v8 = v7;
  }

  return v7;
}

- (WFDefaultFavoritesProvider)init
{
  return -[WFDefaultFavoritesProvider initWithDelegate:persistence:](self, "initWithDelegate:persistence:", 0, 0);
}

- (BOOL)canProvideDefaultFavorites
{
  return 1;
}

- (id)locations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04750], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultCitiesForLocaleCode:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x24BE04750], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultCitiesForLocaleCode:", v10);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_15:
    if (objc_msgSend(v7, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v7;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v7);
            -[WFDefaultFavoritesProvider locationFromCity:](self, "locationFromCity:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }

  return v3;
}

- (id)locationFromCity:(id)a3
{
  id v3;
  WFLocation *v4;
  void *v5;
  id v6;
  float v7;
  double v8;
  float v9;
  float v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(WFLocation);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocation setCity:](v4, "setCity:", v5);

  v6 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v3, "latitude");
  v8 = v7;
  objc_msgSend(v3, "longitude");
  v10 = v9;

  v11 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8, v10);
  -[WFLocation setGeoLocation:](v4, "setGeoLocation:", v11);

  return v4;
}

- (WFFavoriteLocationProviderDelegate)delegate
{
  return (WFFavoriteLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
