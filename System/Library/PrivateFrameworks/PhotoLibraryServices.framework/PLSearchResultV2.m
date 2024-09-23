@implementation PLSearchResultV2

- (PLSearchResultV2)initWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 suggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLSearchResultV2 *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PLSearchResultV2;
  v11 = -[PLSearchResultV2 init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v15 = (void *)v12;
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_assetUUIDs, v15);

    v16 = objc_msgSend(v9, "copy");
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v14;
    objc_storeStrong((id *)&v11->_collectionUUIDs, v18);

    v19 = objc_msgSend(v10, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v14;
    objc_storeStrong((id *)&v11->_suggestions, v21);

  }
  return v11;
}

- (PLSearchResultV2)init
{
  return -[PLSearchResultV2 initWithAssetUUIDs:collectionUUIDs:suggestions:](self, "initWithAssetUUIDs:collectionUUIDs:suggestions:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (void)mergeWithSearchResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *assetUUIDs;
  NSArray *v18;
  NSArray *collectionUUIDs;
  NSArray *v20;
  NSArray *suggestions;
  id v22;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    v5 = a3;
    -[PLSearchResultV2 assetUUIDs](self, "assetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E20];
    -[PLSearchResultV2 collectionUUIDs](self, "collectionUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99E20];
    -[PLSearchResultV2 suggestions](self, "suggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "assetUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v13);

    objc_msgSend(v5, "collectionUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v14);

    objc_msgSend(v5, "suggestions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObjectsFromArray:", v15);
    objc_msgSend(v22, "allObjects");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    assetUUIDs = self->_assetUUIDs;
    self->_assetUUIDs = v16;

    objc_msgSend(v9, "allObjects");
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    collectionUUIDs = self->_collectionUUIDs;
    self->_collectionUUIDs = v18;

    objc_msgSend(v12, "allObjects");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    suggestions = self->_suggestions;
    self->_suggestions = v20;

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PLSearchResultV2 assetUUIDs](self, "assetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToArray:", v7);

    -[PLSearchResultV2 collectionUUIDs](self, "collectionUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToArray:", v10);

    -[PLSearchResultV2 suggestions](self, "suggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v5) = objc_msgSend(v12, "isEqualToArray:", v13);
    v14 = v8 & v11 & v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PLSearchResultV2 assetUUIDs](self, "assetUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PLSearchResultV2 collectionUUIDs](self, "collectionUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PLSearchResultV2 suggestions](self, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchResultV2 assetUUIDs](self, "assetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[PLSearchResultV2 collectionUUIDs](self, "collectionUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PLSearchResultV2 suggestions](self, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("asset count: %lu\ncollection count: %lu\nsuggestions: %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (NSArray)collectionUUIDs
{
  return self->_collectionUUIDs;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)allFruitfulScopedQueryMatchedGroups
{
  return self->_allFruitfulScopedQueryMatchedGroups;
}

- (void)setAllFruitfulScopedQueryMatchedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_allFruitfulScopedQueryMatchedGroups, a3);
}

- (NSArray)allQueryMatchedGroups
{
  return self->_allQueryMatchedGroups;
}

- (void)setAllQueryMatchedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_allQueryMatchedGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQueryMatchedGroups, 0);
  objc_storeStrong((id *)&self->_allFruitfulScopedQueryMatchedGroups, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_collectionUUIDs, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end
