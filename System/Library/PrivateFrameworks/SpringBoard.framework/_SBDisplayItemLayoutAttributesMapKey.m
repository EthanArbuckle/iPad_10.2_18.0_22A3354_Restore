@implementation _SBDisplayItemLayoutAttributesMapKey

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
}

- (_SBDisplayItemLayoutAttributesMapKey)initWithAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  id v7;
  _SBDisplayItemLayoutAttributesMapKey *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *displayItems;
  id v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SBDisplayItemLayoutAttributesMapKey;
  v8 = -[_SBDisplayItemLayoutAttributesMapKey init](&v27, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBRecentAppLayouts.m"), 1080, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    displayItems = v8->_displayItems;
    v8->_displayItems = (NSSet *)v11;

    v8->_displayOrdinal = a4;
    v13 = objc_alloc_init(MEMORY[0x1E0D01788]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v8->_displayItems;
    v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = (id)objc_msgSend(v13, "appendObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v16);
    }

    v20 = (id)objc_msgSend(v13, "appendInteger:", v8->_displayOrdinal);
    v8->_hash = objc_msgSend(v13, "hash");

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _SBDisplayItemLayoutAttributesMapKey *v4;
  uint64_t v5;
  _SBDisplayItemLayoutAttributesMapKey *v6;
  _SBDisplayItemLayoutAttributesMapKey *v7;
  char v8;
  _SBDisplayItemLayoutAttributesMapKey *v9;

  v4 = (_SBDisplayItemLayoutAttributesMapKey *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && self->_displayOrdinal == v9->_displayOrdinal)
      v8 = BSEqualSets();
    else
      v8 = 0;

  }
  return v8;
}

@end
