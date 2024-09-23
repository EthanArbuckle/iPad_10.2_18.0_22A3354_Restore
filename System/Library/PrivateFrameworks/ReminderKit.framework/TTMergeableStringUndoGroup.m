@implementation TTMergeableStringUndoGroup

- (TTMergeableStringUndoGroup)init
{
  TTMergeableStringUndoGroup *v2;
  uint64_t v3;
  NSMutableDictionary *seen;
  uint64_t v5;
  NSMutableArray *commands;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TTMergeableStringUndoGroup;
  v2 = -[TTMergeableStringUndoGroup init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    seen = v2->_seen;
    v2->_seen = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    commands = v2->_commands;
    v2->_commands = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)closeGroup
{
  -[TTMergeableStringUndoGroup setSeen:](self, "setSeen:", 0);
}

- (void)addCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "addToGroup:", self))
  {
    -[TTMergeableStringUndoGroup commands](self, "commands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (BOOL)addSeenRange:(TopoIDRange *)a3
{
  id v5;
  uint64_t var1;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v5 = a3->var0.var0;
  var1 = a3->var0.var1;
  v7 = a3->var1;
  -[TTMergeableStringUndoGroup seen](self, "seen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((objc_msgSend(v9, "containsIndexesInRange:", var1, v7) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "addIndexesInRange:", var1, v7);
      v10 = 1;
    }
    v11 = v9;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", var1, v7);
    -[TTMergeableStringUndoGroup seen](self, "seen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v5);

    v10 = 1;
  }

  return v10;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int var1;
  unsigned int v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TTMergeableStringUndoGroup commands](self, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v16 = a3->var0.var0;
        var1 = a3->var1;
        v17 = a3->var0.var1;
        v18 = var1;
        v13 = a4->var0.var0;
        v12 = a4->var1;
        v14 = a4->var0.var1;
        v15 = v12;
        if (v10)
        {
          objc_msgSend(v10, "updateTopoIDRange:toNewRangeID:", &v16, &v13);
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (BOOL)hasTopoIDsThatCanChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TTMergeableStringUndoGroup commands](self, "commands", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasTopoIDsThatCanChange") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)applyToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TTMergeableStringUndoGroup commands](self, "commands", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "applyToString:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)addToGroup:(id)a3
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TTMergeableStringUndoGroup commands](self, "commands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TTMergeableStringUndoGroup %p %@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSMutableDictionary)seen
{
  return self->_seen;
}

- (void)setSeen:(id)a3
{
  objc_storeStrong((id *)&self->_seen, a3);
}

- (NSMutableArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_seen, 0);
}

@end
