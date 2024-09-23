@implementation PSIObject

- (id)_initForCopy:(BOOL)a3
{
  PSIObject *v4;
  NSArray *v5;
  NSArray *tokens;
  NSMutableDictionary *v7;
  NSMutableDictionary *synonymsByOriginalWord;
  NSMutableDictionary *v9;
  NSMutableDictionary *synonymsByOriginalLookupIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSIObject;
  v4 = -[PSIObject init](&v12, sel_init);
  if (v4 && !a3)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tokens = v4->_tokens;
    v4->_tokens = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    synonymsByOriginalWord = v4->_synonymsByOriginalWord;
    v4->_synonymsByOriginalWord = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    synonymsByOriginalLookupIdentifier = v4->_synonymsByOriginalLookupIdentifier;
    v4->_synonymsByOriginalLookupIdentifier = v9;

  }
  return v4;
}

- (PSIObject)initWithUUID:(id)a3
{
  id v4;
  PSIObject *v5;
  uint64_t v6;
  NSString *uuid;

  v4 = a3;
  v5 = -[PSIObject _initForCopy:](self, "_initForCopy:", 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

  }
  return v5;
}

- (id)initForReverse
{
  return -[PSIObject _initForCopy:](self, "_initForCopy:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initForCopy:", 1);
  v5 = -[NSString copy](self->_uuid, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSArray mutableCopy](self->_tokens, "mutableCopy");
  v8 = (void *)v4[4];
  v4[4] = v7;

  v9 = -[NSMutableDictionary mutableCopy](self->_synonymsByOriginalWord, "mutableCopy");
  v10 = (void *)v4[1];
  v4[1] = v9;

  v11 = -[NSMutableDictionary mutableCopy](self->_synonymsByOriginalLookupIdentifier, "mutableCopy");
  v12 = (void *)v4[2];
  v4[2] = v11;

  return v4;
}

- (NSString)description
{
  PSIGroupResult *v3;
  id v4;
  unint64_t v5;
  void *v6;
  PSIGroupResultGroupSnapshot *v7;
  void *v8;
  void *v9;
  PSIGroupResultGroupSnapshot *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = -[PSIGroupResult initWithQueue:]([PSIGroupResult alloc], "initWithQueue:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_tokens, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [PSIGroupResultGroupSnapshot alloc];
      objc_msgSend(v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PSIGroupResultGroupSnapshot initWithContentString:lookupIdentifier:category:](v7, "initWithContentString:lookupIdentifier:category:", v8, v9, objc_msgSend(v6, "category"));

      objc_msgSend(v4, "addObject:", v10);
      ++v5;
    }
    while (v5 < -[NSArray count](self->_tokens, "count"));
  }
  -[PSIGroupResult setGroups:](v3, "setGroups:", v4);
  v15.receiver = self;
  v15.super_class = (Class)PSIObject;
  -[PSIObject description](&v15, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIGroupResult unitTestDescription](v3, "unitTestDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)addContentString:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5
{
  -[PSIObject addContentString:identifier:category:owningCategory:](self, "addContentString:identifier:category:owningCategory:", a3, 0, a4, a5);
}

- (void)addIdentifier:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5
{
  -[PSIObject addContentString:identifier:category:owningCategory:](self, "addContentString:identifier:category:owningCategory:", 0, a3, a4, a5);
}

- (void)addContentString:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  PSIIndexToken *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a3;
  v10 = a4;
  if (objc_msgSend(v12, "length") || objc_msgSend(v10, "length"))
  {
    v11 = -[PSIIndexToken initWithText:identifier:category:owningCategory:]([PSIIndexToken alloc], "initWithText:identifier:category:owningCategory:", v12, v10, v7, v6);
    -[NSArray addObject:](self->_tokens, "addObject:", v11);

  }
}

- (void)addSynonym:(id)a3 category:(signed __int16)a4 originalContentString:(id)a5
{
  -[PSIObject addSynonym:lookupIdentifier:category:originalContentString:](self, "addSynonym:lookupIdentifier:category:originalContentString:", a3, 0, a4, a5);
}

- (void)addSynonym:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 originalContentString:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *synonymsByOriginalWord;
  id v14;
  id v15;
  PSISynonymRecord *v16;
  id v17;

  v7 = a5;
  v17 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v17, "length") && objc_msgSend(v11, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_synonymsByOriginalWord, "objectForKey:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      synonymsByOriginalWord = self->_synonymsByOriginalWord;
      v14 = v12;
      v15 = v11;
LABEL_9:
      -[NSMutableDictionary setObject:forKey:](synonymsByOriginalWord, "setObject:forKey:", v14, v15);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v17, "length") && objc_msgSend(v10, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_synonymsByOriginalLookupIdentifier, "objectForKey:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      synonymsByOriginalWord = self->_synonymsByOriginalLookupIdentifier;
      v14 = v12;
      v15 = v10;
      goto LABEL_9;
    }
LABEL_10:
    v16 = -[PSISynonymRecord initWithSynonym:category:identifier:]([PSISynonymRecord alloc], "initWithSynonym:category:identifier:", v17, v7, v10);
    objc_msgSend(v12, "addObject:", v16);

  }
}

- (void)enumerateSynonymsForOriginalContentString:(id)a3 orOriginalLookupIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, void *, uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *, uint64_t, void *))a5;
  -[NSMutableDictionary objectForKey:](self->_synonymsByOriginalWord, "objectForKey:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v15, "synonym");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "category");
        objc_msgSend(v15, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v16, v17, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }
  if (objc_msgSend(v8, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_synonymsByOriginalLookupIdentifier, "objectForKey:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v24, "synonym");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "category");
          objc_msgSend(v24, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v25, v26, v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);
    }

  }
}

- (void)reverse
{
  uint64_t v3;
  CFIndex v4;
  uint64_t v5;

  v3 = -[NSArray count](self->_tokens, "count");
  if (v3 >= 2)
  {
    v4 = v3 - 1;
    v5 = 1;
    do
      CFArrayExchangeValuesAtIndices((CFMutableArrayRef)self->_tokens, v5 - 1, v4--);
    while (v5++ < v4);
  }
}

- (void)clear
{
  -[PSIObject setUUID:](self, "setUUID:", 0);
  -[NSArray removeAllObjects](self->_tokens, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_synonymsByOriginalWord, "removeAllObjects");
}

- (BOOL)isUpdate
{
  return 0;
}

- (unint64_t)objectType
{
  PSIObject *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_synonymsByOriginalLookupIdentifier, 0);
  objc_storeStrong((id *)&self->_synonymsByOriginalWord, 0);
}

@end
