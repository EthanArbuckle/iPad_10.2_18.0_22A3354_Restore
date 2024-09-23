@implementation WLKUpNextDelta

- (WLKUpNextDelta)initWithDictionary:(id)a3
{
  id v4;
  WLKUpNextDelta *v5;
  uint64_t v6;
  NSDictionary *backingDictionary;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  WLKDeltaContinuationMetadata *v16;
  uint64_t v17;
  NSArray *items;
  uint64_t v19;
  NSDate *timestamp;
  uint64_t v21;
  NSDate *expirationDate;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WLKUpNextDelta;
  v5 = -[WLKUpNextDelta init](&v29, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    backingDictionary = v5->_backingDictionary;
    v5->_backingDictionary = (NSDictionary *)v6;

    v24 = v4;
    objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("upNextChanges"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          +[WLKUpNextDelta useWidgetImagesIfAvailable:](WLKUpNextDelta, "useWidgetImagesIfAvailable:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[WLKDeltaContinuationMetadata initWithDictionary:context:]([WLKDeltaContinuationMetadata alloc], "initWithDictionary:context:", v15, 0);
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    v17 = objc_msgSend(v9, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v17;

    v4 = v24;
    objc_msgSend(v24, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("timestamp"));
    v19 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v19;

    objc_msgSend(v24, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("expiresAt"));
    v21 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v21;

  }
  return v5;
}

- (NSArray)removals
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deltaType = %d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](self->_items, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)additions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deltaType = %d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](self->_items, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)isExpired
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_expirationDate) == 1;

  return (char)self;
}

- (id)dataByMergingWith:(id)a3
{
  id v4;
  WLKUpNextDelta *v5;
  WLKUpNextDelta *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WLKUpNextDelta _deltaByMergingItemsFromDelta:](self, "_deltaByMergingItemsFromDelta:", v4);
    v5 = (WLKUpNextDelta *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("class must conform to <WLKMergingCoding>"));
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (id)_deltaByMergingItemsFromDelta:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  WLKUpNextDelta *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)-[NSArray mutableCopy](self->_items, "mutableCopy");
  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "additions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        +[WLKContinuationMetadataBase add:toCollection:](WLKContinuationMetadataBase, "add:toCollection:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "removals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        +[WLKContinuationMetadataBase remove:fromCollection:](WLKContinuationMetadataBase, "remove:fromCollection:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15++), v5);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v13);
  }

  v16 = (void *)-[NSDictionary mutableCopy](self->_backingDictionary, "mutableCopy");
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "dictionary", (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("upNextChanges"));

  v25 = -[WLKUpNextDelta initWithDictionary:]([WLKUpNextDelta alloc], "initWithDictionary:", v16);
  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)WLKUpNextDelta;
  -[WLKUpNextDelta description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray count](self->_items, "count");
  -[WLKUpNextDelta expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ items:%lu expires:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKUpNextDelta)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WLKUpNextDelta *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    WLKPlistClasses();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("upNextDelta"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[WLKUpNextDelta initWithDictionary:](self, "initWithDictionary:", v6);
    v7 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backingDictionary, CFSTR("upNextDelta"));

}

+ (id)useWidgetImagesIfAvailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "wlk_dictionaryForKey:", CFSTR("widgetImages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
    objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("images"));
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("widgetImages"));
    v6 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
