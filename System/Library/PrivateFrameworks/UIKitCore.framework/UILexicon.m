@implementation UILexicon

- (id)copyWithZone:(_NSZone *)a3
{
  UILexicon *v4;
  uint64_t v5;
  NSArray *entries;

  v4 = objc_alloc_init(UILexicon);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_entries, 1);
  entries = v4->_entries;
  v4->_entries = (NSArray *)v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[UILexicon entries](self, "entries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[UILexicon entries](self, "entries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_lexiconWithTILexicon:(id)a3
{
  id v3;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UILexicon *v11;
  NSArray *entries;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "entries", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        +[UILexiconEntry _entryWithTILexiconEntry:](UILexiconEntry, "_entryWithTILexiconEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = objc_alloc_init(UILexicon);
  entries = v11->_entries;
  v11->_entries = v4;

  return v11;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
