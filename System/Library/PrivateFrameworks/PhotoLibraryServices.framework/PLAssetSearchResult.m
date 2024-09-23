@implementation PLAssetSearchResult

- (unint64_t)type
{
  return 1;
}

- (id)keyAssetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLSearchResult groupResult](self, "groupResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)assetCount
{
  void *v2;
  unint64_t v3;

  -[PLSearchResult groupResult](self, "groupResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetMatchCount");

  return v3;
}

- (NSArray)assetUUIDs
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t Count;
  dispatch_block_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[PLSearchResult groupResult](self, "groupResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[PLSearchResult groupResult](self, "groupResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v6, "assetIds"));

  if (v5 < Count)
  {
    v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_65052);
    -[PLSearchResult groupResult](self, "groupResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchNextAssetUUIDs:completionHandler:", 0, v8);

    dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  -[PLSearchResult groupResult](self, "groupResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (NSString)identifier
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PLSearchResult groupResult](self, "groupResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendFormat:", CFSTR("%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "groupId"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregationSearchResult://%lu"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p, "), v5, self);

  -[PLSearchResult contentStrings](self, "contentStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("contentStrings: %@, "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("type: %ld, "), -[PLAssetSearchResult type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR("assetCount: %ld"), -[PLAssetSearchResult assetCount](self, "assetCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDate, 0);
}

@end
