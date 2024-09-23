@implementation WLKUpNextItemCollection

- (WLKUpNextItemCollection)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKUpNextItemCollection *v8;
  uint64_t v9;
  NSDate *timestamp;
  void *v11;
  uint64_t v12;
  NSString *title;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  WLKContinuationMetadata *v22;
  uint64_t v23;
  NSArray *items;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WLKUpNextItemCollection;
  v8 = -[WLKUpNextItemCollection init](&v31, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("timestamp"));
    v9 = objc_claimAutoreleasedReturnValue();
    timestamp = v8->_timestamp;
    v8->_timestamp = (NSDate *)v9;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v12;

    v26 = v6;
    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("items"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = -[WLKContinuationMetadata initWithDictionary:context:]([WLKContinuationMetadata alloc], "initWithDictionary:context:", v21, v7);
            if (v22)
              objc_msgSend(v15, "addObject:", v22);

          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v15, "count"))
    {
      v23 = objc_msgSend(v15, "copy");
      items = v8->_items;
      v8->_items = (NSArray *)v23;

    }
    v6 = v26;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WLKUpNextItemCollection;
  -[WLKUpNextItemCollection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ items:%@"), v4, self->_items);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
