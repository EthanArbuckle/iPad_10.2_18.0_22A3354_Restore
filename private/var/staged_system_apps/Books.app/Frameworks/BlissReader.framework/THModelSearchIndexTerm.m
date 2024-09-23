@implementation THModelSearchIndexTerm

- (THModelSearchIndexTerm)initWithStem:(id)a3
{
  THModelSearchIndexTerm *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THModelSearchIndexTerm;
  v4 = -[THModelSearchIndexTerm init](&v6, "init");
  if (v4)
  {
    v4->mInflections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mStem = (NSString *)objc_msgSend(a3, "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THModelSearchIndexTerm;
  -[THModelSearchIndexTerm dealloc](&v3, "dealloc");
}

- (id)addInflection:(id)a3
{
  THModelSearchIndexInflection *v4;
  THModelSearchIndexInflection *v5;

  v4 = -[THModelSearchIndexInflection initWithInflection:]([THModelSearchIndexInflection alloc], "initWithInflection:", a3);
  -[NSMutableArray addObject:](self->mInflections, "addObject:", v4);
  v5 = v4;
  return v4;
}

- (void)enumerateOccurrencesWithBlock:(id)a3
{
  NSMutableArray *mInflections;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mInflections = self->mInflections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(mInflections);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (char *)objc_msgSend(v9, "occurrenceCount");
        v11 = (char *)objc_msgSend(v9, "occurrences");
        if (v10)
        {
          v12 = v11;
          do
          {
            (*((void (**)(id, void *, char *))a3 + 2))(a3, v9, v12);
            v12 += 24;
            --v10;
          }
          while (v10);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
}

- (BOOL)p_inflection:(id)a3 matchesWord:(id)a4
{
  if ((objc_msgSend(a3, "isEqualToString:", a4) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "hasPrefix:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ "), a4));
}

- (void)enumerateOccurrencesOfWord:(id)a3 withBlock:(id)a4
{
  NSMutableArray *mInflections;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  mInflections = self->mInflections;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(mInflections);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (-[THModelSearchIndexTerm p_inflection:matchesWord:](self, "p_inflection:matchesWord:", objc_msgSend(v12, "inflection"), a3))
        {
          v13 = (char *)objc_msgSend(v12, "occurrenceCount");
          v14 = (char *)objc_msgSend(v12, "occurrences");
          if (v13)
          {
            v15 = v14;
            do
            {
              (*((void (**)(id, char *))a4 + 2))(a4, v15);
              v15 += 24;
              --v13;
            }
            while (v13);
          }
          return;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
}

- (BOOL)containsOccurrenceOfWord:(id)a3
{
  NSMutableArray *mInflections;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mInflections = self->mInflections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mInflections);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        if (-[THModelSearchIndexTerm p_inflection:matchesWord:](self, "p_inflection:matchesWord:", objc_msgSend(v10, "inflection"), a3)&& objc_msgSend(v10, "occurrenceCount"))
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInflections, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (NSString)stem
{
  return self->mStem;
}

- (NSArray)inflections
{
  return &self->mInflections->super;
}

@end
