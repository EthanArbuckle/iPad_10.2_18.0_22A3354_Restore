@implementation PKApplyActionContentActionItem

- (PKApplyActionContentActionItem)initWithDictionary:(id)a3
{
  id v4;
  PKApplyActionContentActionItem *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKApplyActionContentTextItem *v14;
  PKApplyActionContentTextItem *v15;
  uint64_t v16;
  NSArray *items;
  uint64_t v18;
  NSString *contextPrimaryActionIdentifier;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKApplyActionContentActionItem;
  v5 = -[PKApplyActionContentActionItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("items"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          v14 = [PKApplyActionContentTextItem alloc];
          v15 = -[PKApplyActionContentTextItem initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v21);
          objc_msgSend(v7, "safelyAddObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("contextPrimaryActionIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    contextPrimaryActionIdentifier = v5->_contextPrimaryActionIdentifier;
    v5->_contextPrimaryActionIdentifier = (NSString *)v18;

  }
  return v5;
}

- (id)odiAttributesDictionary
{
  id v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_items;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "odiAttributesDictionary", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (self->_contextPrimaryActionIdentifier)
    objc_msgSend(v3, "appendString:");
  v12 = (void *)objc_msgSend(v3, "copy", (_QWORD)v14);

  return (NSCopying *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyActionContentActionItem *v5;
  uint64_t v6;
  NSArray *items;
  uint64_t v8;
  NSString *contextPrimaryActionIdentifier;

  v5 = -[PKApplyActionContentActionItem init](+[PKApplyActionContentActionItem allocWithZone:](PKApplyActionContentActionItem, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  v8 = -[NSString copyWithZone:](self->_contextPrimaryActionIdentifier, "copyWithZone:", a3);
  contextPrimaryActionIdentifier = v5->_contextPrimaryActionIdentifier;
  v5->_contextPrimaryActionIdentifier = (NSString *)v8;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)contextPrimaryActionIdentifier
{
  return self->_contextPrimaryActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPrimaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
