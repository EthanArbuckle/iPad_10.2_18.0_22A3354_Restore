@implementation _UISupplementalLexicon

- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4 andTISupplementalLexicon:(id)a5
{
  id v9;
  id v10;
  _UISupplementalLexicon *v11;
  _UISupplementalLexicon *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[4];
  id v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UISupplementalLexicon;
  v11 = -[_UISupplementalLexicon init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    v12->_searchPrefixes = a4;
    objc_storeStrong(&v12->_internal, a5);
    supplementalItemQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80___UISupplementalLexicon_initWithItems_searchPrefixes_andTISupplementalLexicon___block_invoke;
    block[3] = &unk_1E16B1B28;
    v17 = v9;
    dispatch_sync(v13, block);

    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSupplementalLexicon:", v12);

  }
  return v12;
}

- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4
{
  id v6;
  _UISupplementalLexicon *v7;
  _UISupplementalLexicon *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;
  _UISupplementalLexicon *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UISupplementalLexicon;
  v7 = -[_UISupplementalLexicon init](&v25, sel_init);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v7->_items, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14++) + 8), (_QWORD)v21);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v15 = objc_msgSend(MEMORY[0x1E0DBDD00], "instancesRespondToSelector:", sel_initWithItems_searchPrefixes_);
    v16 = objc_alloc(MEMORY[0x1E0DBDD00]);
    if (v15)
      v17 = objc_msgSend(v16, "initWithItems:searchPrefixes:", v9, a4 & 3);
    else
      v17 = objc_msgSend(v16, "initWithItems:", v9);
    v19 = (void *)v17;
    v18 = -[_UISupplementalLexicon initWithItems:searchPrefixes:andTISupplementalLexicon:](v8, "initWithItems:searchPrefixes:andTISupplementalLexicon:", v10, a4, v17, (_QWORD)v21);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (_UISupplementalLexicon)initWithItems:(id)a3
{
  return -[_UISupplementalLexicon initWithItems:searchPrefixes:](self, "initWithItems:searchPrefixes:", a3, 0);
}

- (_UISupplementalLexicon)initWithRTISupplementalLexicon:(id)a3
{
  id v4;
  _UISupplementalLexicon *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalLexicon;
  v5 = -[_UISupplementalLexicon init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "lexicon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57___UISupplementalLexicon_initWithRTISupplementalLexicon___block_invoke;
    v12[3] = &unk_1E16E8DB0;
    v13 = v9;
    v10 = v9;
    objc_msgSend(v4, "enumerateSupplementalItems:", v12);
    v5 = -[_UISupplementalLexicon initWithItems:searchPrefixes:andTISupplementalLexicon:](v5, "initWithItems:searchPrefixes:andTISupplementalLexicon:", v10, objc_msgSend(v6, "searchPrefixes") & 3, v6);

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  _QWORD block[5];

  supplementalItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___UISupplementalLexicon_dealloc__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(v3, block);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeSupplementalLexicon:", self);

  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalLexicon;
  -[_UISupplementalLexicon dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t searchPrefixes;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier=%llu"),
    objc_opt_class(),
    self,
    objc_msgSend(self->_internal, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_searchPrefixes)
  {
    objc_msgSend(v3, "appendString:", CFSTR(", searchPrefixesScanSet="));
    searchPrefixes = self->_searchPrefixes;
    if ((searchPrefixes & 1) != 0)
    {
      objc_msgSend(v4, "appendString:", CFSTR("@"));
      searchPrefixes = self->_searchPrefixes;
    }
    if ((searchPrefixes & 2) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("#"));
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_items, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_items;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", items={ %@ }>"), v13);

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)searchPrefixes
{
  return self->_searchPrefixes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_internal, 0);
}

@end
