@implementation StockNewsItemCollection

- (StockNewsItemCollection)initWithArchiveArray:(id)a3
{
  id v4;
  StockNewsItemCollection *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  StockNewsItem *v10;
  uint64_t v11;
  uint64_t v12;
  StockNewsItem *v13;
  uint64_t v14;
  StockNewsItem *v15;
  NSArray *newsItems;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)StockNewsItemCollection;
  v5 = -[StockNewsItemCollection init](&v22, sel_init);
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v15 = [StockNewsItem alloc];
          v10 = -[StockNewsItem initWithArchiveDictionary:](v15, "initWithArchiveDictionary:", v14, (_QWORD)v18);

          if (v10)
            -[NSArray addObject:](v6, "addObject:", v10);
          ++v12;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);

    }
    newsItems = v5->_newsItems;
    v5->_newsItems = v6;

  }
  return v5;
}

- (id)archiveArray
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_newsItems, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_newsItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "archiveDictionary", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)newsItems
{
  return self->_newsItems;
}

- (void)setNewsItems:(id)a3
{
  objc_storeStrong((id *)&self->_newsItems, a3);
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsItems, 0);
}

@end
