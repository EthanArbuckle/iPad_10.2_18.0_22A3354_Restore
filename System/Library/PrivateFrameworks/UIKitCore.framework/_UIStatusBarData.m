@implementation _UIStatusBarData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_UIStatusBarData)staticDisplayData
{
  if (qword_1ECD79EF0 != -1)
    dispatch_once(&qword_1ECD79EF0, &__block_literal_global_493);
  return (_UIStatusBarData *)(id)_MergedGlobals_1_20;
}

+ (NSSet)entryKeys
{
  if (qword_1ECD79F00 != -1)
    dispatch_once(&qword_1ECD79F00, &__block_literal_global_427_0);
  return (NSSet *)(id)qword_1ECD79EF8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          v3 ^= objc_msgSend(v9, "hash");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setValue:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (_UIStatusBarData)initWithCoder:(id)a3
{
  id v4;
  _UIStatusBarData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarData;
  v5 = -[_UIStatusBarData init](&v18, sel_init);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[_UIStatusBarData setValue:forKey:](v5, "setValue:forKey:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  int v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend((id)objc_opt_class(), "entryKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v21 = v4;
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[_UIStatusBarData valueForKey:](self, "valueForKey:", v12, v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "valueForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEnabled") & 1) != 0 || objc_msgSend(v14, "isEnabled"))
          {
            v15 = v13;
            v16 = v14;
            if (v15 == v16)
            {

            }
            else
            {
              v17 = v16;
              if (v15)
                v18 = v16 == 0;
              else
                v18 = 1;
              if (v18)
              {

LABEL_23:
                v6 = 0;
                goto LABEL_24;
              }
              v19 = objc_msgSend(v15, "isEqual:", v16);

              if (!v19)
                goto LABEL_23;
            }
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          continue;
        break;
      }
      v6 = 1;
LABEL_24:
      v4 = v21;
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEmpty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (NSSet)existingEntryKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[_UIStatusBarData valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_applyUpdate:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[_UIStatusBarData setValue:forKey:](self, "setValue:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)applyUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[_UIStatusBarData entryKeys](_UIStatusBarData, "entryKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarData _applyUpdate:keys:](self, "_applyUpdate:keys:", v4, v5);

}

- (id)dataByApplyingOverlay:(id)a3
{
  _UIStatusBarData *v4;
  _UIStatusBarData *v5;
  _UIStatusBarData *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UIStatusBarData *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (_UIStatusBarData *)a3;
  v5 = self;
  v6 = v5;
  if (v4 && v4 != v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[_UIStatusBarData existingEntryKeys](v4, "existingEntryKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = v6;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[_UIStatusBarData valueForKey:](v6, "valueForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if (v11 == v6)
            {
              v11 = (_UIStatusBarData *)-[_UIStatusBarData copy](v6, "copy");

            }
            -[_UIStatusBarData valueForKey:](v4, "valueForKey:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIStatusBarData setValue:forKey:](v11, "setValue:forKey:", v15, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v11 = v6;
    }

    v6 = v11;
  }

  return v6;
}

- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)objc_opt_class());
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "valueForKey:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          -[_UIStatusBarData valueForKey:](self, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            continue;
        }
        objc_msgSend(v8, "setValue:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)updateFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[_UIStatusBarData copy](self, "copy");
  objc_msgSend(v5, "makeUpdateFromData:", v4);

  return v5;
}

- (void)makeUpdateFromData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[_UIStatusBarData entryKeys](_UIStatusBarData, "entryKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarData valueForKey:](self, "valueForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14 && objc_msgSend(v12, "isEqual:", v11))
            -[_UIStatusBarData setValue:forKey:](self, "setValue:forKey:", 0, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

- (_UIStatusBarDataStringEntry)timeEntry
{
  return self->_timeEntry;
}

- (void)setTimeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_UIStatusBarDataStringEntry)shortTimeEntry
{
  return self->_shortTimeEntry;
}

- (void)setShortTimeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_UIStatusBarDataStringEntry)dateEntry
{
  return self->_dateEntry;
}

- (void)setDateEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_UIStatusBarDataStringEntry)personNameEntry
{
  return self->_personNameEntry;
}

- (void)setPersonNameEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_UIStatusBarDataStringEntry)deviceNameEntry
{
  return self->_deviceNameEntry;
}

- (void)setDeviceNameEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_UIStatusBarDataCellularEntry)cellularEntry
{
  return self->_cellularEntry;
}

- (void)setCellularEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_UIStatusBarDataCellularEntry)secondaryCellularEntry
{
  return self->_secondaryCellularEntry;
}

- (void)setSecondaryCellularEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_UIStatusBarDataWifiEntry)wifiEntry
{
  return self->_wifiEntry;
}

- (void)setWifiEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_UIStatusBarDataBatteryEntry)mainBatteryEntry
{
  return self->_mainBatteryEntry;
}

- (void)setMainBatteryEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_UIStatusBarDataBluetoothEntry)bluetoothEntry
{
  return self->_bluetoothEntry;
}

- (void)setBluetoothEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_UIStatusBarDataThermalEntry)thermalEntry
{
  return self->_thermalEntry;
}

- (void)setThermalEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_UIStatusBarDataActivityEntry)activityEntry
{
  return self->_activityEntry;
}

- (void)setActivityEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (_UIStatusBarDataTetheringEntry)tetheringEntry
{
  return self->_tetheringEntry;
}

- (void)setTetheringEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (_UIStatusBarDataLocationEntry)locationEntry
{
  return self->_locationEntry;
}

- (void)setLocationEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (_UIStatusBarDataLockEntry)lockEntry
{
  return self->_lockEntry;
}

- (void)setLockEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (_UIStatusBarDataQuietModeEntry)quietModeEntry
{
  return self->_quietModeEntry;
}

- (void)setQuietModeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (_UIStatusBarDataBoolEntry)electronicTollCollectionEntry
{
  return self->_electronicTollCollectionEntry;
}

- (void)setElectronicTollCollectionEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (_UIStatusBarDataBoolEntry)radarEntry
{
  return self->_radarEntry;
}

- (void)setRadarEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (_UIStatusBarDataEntry)rotationLockEntry
{
  return self->_rotationLockEntry;
}

- (void)setRotationLockEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (_UIStatusBarDataEntry)airplaneModeEntry
{
  return self->_airplaneModeEntry;
}

- (void)setAirplaneModeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (_UIStatusBarDataEntry)ttyEntry
{
  return self->_ttyEntry;
}

- (void)setTtyEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (_UIStatusBarDataEntry)nikeEntry
{
  return self->_nikeEntry;
}

- (void)setNikeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (_UIStatusBarDataEntry)assistantEntry
{
  return self->_assistantEntry;
}

- (void)setAssistantEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (_UIStatusBarDataEntry)studentEntry
{
  return self->_studentEntry;
}

- (void)setStudentEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (_UIStatusBarDataEntry)vpnEntry
{
  return self->_vpnEntry;
}

- (void)setVpnEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (_UIStatusBarDataEntry)liquidDetectionEntry
{
  return self->_liquidDetectionEntry;
}

- (void)setLiquidDetectionEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (_UIStatusBarDataEntry)displayWarningEntry
{
  return self->_displayWarningEntry;
}

- (void)setDisplayWarningEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (_UIStatusBarDataVoiceControlEntry)voiceControlEntry
{
  return self->_voiceControlEntry;
}

- (void)setVoiceControlEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (_UIStatusBarDataEntry)airPlayEntry
{
  return self->_airPlayEntry;
}

- (void)setAirPlayEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (_UIStatusBarDataEntry)carPlayEntry
{
  return self->_carPlayEntry;
}

- (void)setCarPlayEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (_UIStatusBarDataEntry)alarmEntry
{
  return self->_alarmEntry;
}

- (void)setAlarmEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (_UIStatusBarDataEntry)satelliteEntry
{
  return self->_satelliteEntry;
}

- (void)setSatelliteEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (_UIStatusBarDataEntry)sensorActivityEntry
{
  return self->_sensorActivityEntry;
}

- (void)setSensorActivityEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (_UIStatusBarDataBoolEntry)announceNotificationsEntry
{
  return self->_announceNotificationsEntry;
}

- (void)setAnnounceNotificationsEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (_UIStatusBarDataIntegerEntry)volumeEntry
{
  return self->_volumeEntry;
}

- (void)setVolumeEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (_UIStatusBarDataBackgroundActivityEntry)backgroundActivityEntry
{
  return self->_backgroundActivityEntry;
}

- (void)setBackgroundActivityEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (_UIStatusBarDataStringEntry)backNavigationEntry
{
  return self->_backNavigationEntry;
}

- (void)setBackNavigationEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (_UIStatusBarDataStringEntry)forwardNavigationEntry
{
  return self->_forwardNavigationEntry;
}

- (void)setForwardNavigationEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backgroundActivityEntry, 0);
  objc_storeStrong((id *)&self->_volumeEntry, 0);
  objc_storeStrong((id *)&self->_announceNotificationsEntry, 0);
  objc_storeStrong((id *)&self->_sensorActivityEntry, 0);
  objc_storeStrong((id *)&self->_satelliteEntry, 0);
  objc_storeStrong((id *)&self->_alarmEntry, 0);
  objc_storeStrong((id *)&self->_carPlayEntry, 0);
  objc_storeStrong((id *)&self->_airPlayEntry, 0);
  objc_storeStrong((id *)&self->_voiceControlEntry, 0);
  objc_storeStrong((id *)&self->_displayWarningEntry, 0);
  objc_storeStrong((id *)&self->_liquidDetectionEntry, 0);
  objc_storeStrong((id *)&self->_vpnEntry, 0);
  objc_storeStrong((id *)&self->_studentEntry, 0);
  objc_storeStrong((id *)&self->_assistantEntry, 0);
  objc_storeStrong((id *)&self->_nikeEntry, 0);
  objc_storeStrong((id *)&self->_ttyEntry, 0);
  objc_storeStrong((id *)&self->_airplaneModeEntry, 0);
  objc_storeStrong((id *)&self->_rotationLockEntry, 0);
  objc_storeStrong((id *)&self->_radarEntry, 0);
  objc_storeStrong((id *)&self->_electronicTollCollectionEntry, 0);
  objc_storeStrong((id *)&self->_quietModeEntry, 0);
  objc_storeStrong((id *)&self->_lockEntry, 0);
  objc_storeStrong((id *)&self->_locationEntry, 0);
  objc_storeStrong((id *)&self->_tetheringEntry, 0);
  objc_storeStrong((id *)&self->_activityEntry, 0);
  objc_storeStrong((id *)&self->_thermalEntry, 0);
  objc_storeStrong((id *)&self->_bluetoothEntry, 0);
  objc_storeStrong((id *)&self->_mainBatteryEntry, 0);
  objc_storeStrong((id *)&self->_wifiEntry, 0);
  objc_storeStrong((id *)&self->_secondaryCellularEntry, 0);
  objc_storeStrong((id *)&self->_cellularEntry, 0);
  objc_storeStrong((id *)&self->_deviceNameEntry, 0);
  objc_storeStrong((id *)&self->_personNameEntry, 0);
  objc_storeStrong((id *)&self->_dateEntry, 0);
  objc_storeStrong((id *)&self->_shortTimeEntry, 0);
  objc_storeStrong((id *)&self->_timeEntry, 0);
}

@end
