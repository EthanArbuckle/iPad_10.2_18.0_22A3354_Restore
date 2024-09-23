@implementation PKApplyActionContent

- (PKApplyActionContent)initWithDictionary:(id)a3
{
  id v4;
  PKApplyActionContent *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKApplyActionContentActionItem *v14;
  PKApplyActionContentActionItem *v15;
  uint64_t v16;
  NSArray *actionItems;
  void *v18;
  PKApplyFooterContent *v19;
  PKApplyFooterContent *footerContent;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKApplyActionContent;
  v5 = -[PKApplyActionContent init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actionItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = [PKApplyActionContentActionItem alloc];
          v15 = -[PKApplyActionContentActionItem initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v22);
          objc_msgSend(v7, "safelyAddObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "copy");
    actionItems = v5->_actionItems;
    v5->_actionItems = (NSArray *)v16;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footerContent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v18);
      footerContent = v5->_footerContent;
      v5->_footerContent = v19;

    }
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
  v4 = self->_actionItems;
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

- (id)analyticsDictionary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_actionItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v8, "items");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "analyticsIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "safelySetObject:forKey:", CFSTR("true"), v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyActionContent *v5;
  uint64_t v6;
  NSArray *actionItems;
  PKApplyFooterContent *v8;
  PKApplyFooterContent *footerContent;

  v5 = -[PKApplyActionContent init](+[PKApplyActionContent allocWithZone:](PKApplyActionContent, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_actionItems, "copyWithZone:", a3);
  actionItems = v5->_actionItems;
  v5->_actionItems = (NSArray *)v6;

  v8 = -[PKApplyFooterContent copyWithZone:](self->_footerContent, "copyWithZone:", a3);
  footerContent = v5->_footerContent;
  v5->_footerContent = v8;

  return v5;
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
}

@end
