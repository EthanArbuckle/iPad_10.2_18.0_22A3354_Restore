@implementation MTLibraryChanges

- (void)addChangeWith:(id)a3 entityName:(id)a4 changeType:(int)a5
{
  uint64_t v5;
  id v8;
  MTLibraryEntityChanges *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v11 = a3;
  v8 = a4;
  -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", v8);
  v9 = (MTLibraryEntityChanges *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[MTLibraryEntityChanges initWithEntityName:]([MTLibraryEntityChanges alloc], "initWithEntityName:", v8);
    -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

  }
  -[MTLibraryEntityChanges add:changeType:](v9, "add:changeType:", v11, v5);

}

- (MTLibraryChanges)initWithContextName:(id)a3
{
  id v4;
  MTLibraryChanges *v5;
  uint64_t v6;
  NSString *contextName;
  uint64_t v8;
  NSMutableDictionary *changesByEntityName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTLibraryChanges;
  v5 = -[MTLibraryChanges init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contextName = v5->_contextName;
    v5->_contextName = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    changesByEntityName = v5->_changesByEntityName;
    v5->_changesByEntityName = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (BOOL)hasChanges
{
  MTLibraryChanges *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = -[MTLibraryChanges hasChangesForEntityNames:](v2, "hasChangesForEntityNames:", v4);
  return (char)v2;
}

- (BOOL)hasChangesForEntityNames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasChanges");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)hasInsertsForEntityNames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasInserts");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)changesForEntityName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)changesByEntityName
{
  return self->_changesByEntityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesByEntityName, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

- (MTLibraryChanges)init
{
  return -[MTLibraryChanges initWithContextName:](self, "initWithContextName:", &stru_1E5500770);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:copyItems:", v6, 1);
  objc_msgSend(v4, "setChangesByEntityName:", v7);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("library changes: {\n\t%@\n}"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)entityNames
{
  void *v2;
  void *v3;

  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeAllChanges
{
  id v2;

  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)combineChanges:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  MTLibraryEntityChanges *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "entityNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "changesForEntityName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", v10);
        v12 = (MTLibraryEntityChanges *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = -[MTLibraryEntityChanges initWithEntityName:]([MTLibraryEntityChanges alloc], "initWithEntityName:", v10);
          -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v10);

        }
        -[MTLibraryEntityChanges combineChanges:](v12, "combineChanges:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (BOOL)hasInserts
{
  MTLibraryChanges *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = -[MTLibraryChanges hasInsertsForEntityNames:](v2, "hasInsertsForEntityNames:", v4);
  return (char)v2;
}

- (BOOL)hasDeletes
{
  MTLibraryChanges *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = -[MTLibraryChanges hasDeletesForEntityNames:](v2, "hasDeletesForEntityNames:", v4);
  return (char)v2;
}

- (BOOL)hasUpdates
{
  MTLibraryChanges *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MTLibraryChanges changesByEntityName](self, "changesByEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = -[MTLibraryChanges hasUpdatesForEntityNames:](v2, "hasUpdatesForEntityNames:", v4);
  return (char)v2;
}

- (BOOL)hasDeletesForEntityNames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasDeletes");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)hasUpdatesForEntityNames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[MTLibraryChanges changesForEntityName:](self, "changesForEntityName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasUpdates");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setChangesByEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_changesByEntityName, a3);
}

@end
