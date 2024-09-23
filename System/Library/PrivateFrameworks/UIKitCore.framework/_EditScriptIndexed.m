@implementation _EditScriptIndexed

- (_EditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  _EditScriptIndexed *v14;
  uint64_t v15;
  _EditScriptData *itemAData;
  uint64_t v17;
  _EditScriptData *itemBData;
  objc_super v20;

  v7 = a7;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_EditScriptIndexed;
  v14 = -[_EditScript initWithOperationPrecedence:orderAtomsAscending:](&v20, sel_initWithOperationPrecedence_orderAtomsAscending_, a3, v7);
  if (v14)
  {
    -[objc_class EditScriptDataWithArray:](a4, "EditScriptDataWithArray:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    itemAData = v14->super._itemAData;
    v14->super._itemAData = (_EditScriptData *)v15;

    -[objc_class EditScriptDataWithArray:](a4, "EditScriptDataWithArray:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
    itemBData = v14->super._itemBData;
    v14->super._itemBData = (_EditScriptData *)v17;

  }
  return v14;
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4
{
  return (id)objc_msgSend(a1, "editScriptFromArray:toArray:orderAtomsAscending:operationPrecedence:", a3, a4, 0, -1);
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4 orderAtomsAscending:(BOOL)a5 operationPrecedence:(int64_t)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  _EditScriptIndexed *v11;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_EditScriptIndexed initWithOperationPrecedence:dataClass:fromArray:toArray:orderAtomsAscending:]([_EditScriptIndexed alloc], "initWithOperationPrecedence:dataClass:fromArray:toArray:orderAtomsAscending:", a6, objc_opt_class(), v10, v9, v7);

  -[_EditScript computeDistanceMatrix](v11, "computeDistanceMatrix");
  -[_EditScript computeEditsFromMatrix](v11, "computeEditsFromMatrix");
  return v11;
}

- (id)applyToArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    v5 = (id)MEMORY[0x1E0C9AA60];
  v17 = v5;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_EditScript script](self, "script");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "editOperation");
        switch(v13)
        {
          case 1:
            objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v12, "indexToEdit"));
            break;
          case 2:
            objc_msgSend(v12, "replacementText");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v12, "indexToEdit"));
            goto LABEL_13;
          case 3:
            objc_msgSend(v12, "replacementText");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:atIndexedSubscript:", v14, objc_msgSend(v12, "indexToEdit"));
LABEL_13:

            continue;
          default:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_EditScriptIndexed.m"), 57, CFSTR("Invalid operation used in _EditScriptIndexed"));

            break;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)initializeCurrentScriptAtom
{
  _EditScriptIndexedAtom *currentScriptAtom;

  currentScriptAtom = self->_currentScriptAtom;
  self->_currentScriptAtom = 0;

}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v11;
  void *v12;
  _EditScriptIndexedAtom *v13;
  _EditScriptIndexedAtom *currentScriptAtom;
  void *v15;
  id v16;

  v11 = a5;
  v12 = v11;
  if (a3)
  {
    v16 = v11;
    if (a3 != 2)
    {
      if (!a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_EditScriptIndexed.m"), 78, CFSTR("Deletions and Substitutions should never start with an index of 0"));

      }
      --a4;
    }
    +[_EditScriptIndexedAtom atomWithEditOperation:indexToEdit:newText:indexInArrayB:](_EditScriptIndexedAtom, "atomWithEditOperation:indexToEdit:newText:indexInArrayB:", a3, a4, v16, a6);
    v13 = (_EditScriptIndexedAtom *)objc_claimAutoreleasedReturnValue();
    currentScriptAtom = self->_currentScriptAtom;
    self->_currentScriptAtom = v13;

    -[_EditScriptIndexed finalizeCurrentScriptAtom](self, "finalizeCurrentScriptAtom");
    v12 = v16;
  }

}

- (void)finalizeCurrentScriptAtom
{
  _EditScriptIndexedAtom *currentScriptAtom;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _EditScriptIndexedAtom *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  currentScriptAtom = self->_currentScriptAtom;
  if (currentScriptAtom)
  {
    if (self->super._orderAtomsAscending)
    {
      if (-[_EditScriptIndexedAtom editOperation](currentScriptAtom, "editOperation") == 2)
      {
        v4 = 1;
      }
      else if (-[_EditScriptIndexedAtom editOperation](self->_currentScriptAtom, "editOperation") == 1)
      {
        v4 = -1;
      }
      else
      {
        v4 = 0;
      }
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[_EditScript script](self, "script", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setIndexToEdit:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "indexToEdit") + v4);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

      -[_EditScript script](self, "script");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertObject:atIndex:", self->_currentScriptAtom, 0);
    }
    else
    {
      -[_EditScript script](self, "script");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", self->_currentScriptAtom);
    }

    v11 = self->_currentScriptAtom;
    self->_currentScriptAtom = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentScriptAtom, 0);
}

@end
