@implementation _SUICEditScriptIndexed

- (_SUICEditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  _SUICEditScriptIndexed *v14;
  uint64_t v15;
  _SUICEditScriptData *itemAData;
  uint64_t v17;
  _SUICEditScriptData *itemBData;
  objc_super v20;

  v7 = a7;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SUICEditScriptIndexed;
  v14 = -[_SUICEditScript initWithOperationPrecedence:orderAtomsAscending:](&v20, sel_initWithOperationPrecedence_orderAtomsAscending_, a3, v7);
  if (v14)
  {
    -[objc_class EditScriptDataWithArray:](a4, "EditScriptDataWithArray:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    itemAData = v14->super._itemAData;
    v14->super._itemAData = (_SUICEditScriptData *)v15;

    -[objc_class EditScriptDataWithArray:](a4, "EditScriptDataWithArray:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
    itemBData = v14->super._itemBData;
    v14->super._itemBData = (_SUICEditScriptData *)v17;

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
  _SUICEditScriptIndexed *v11;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_SUICEditScriptIndexed initWithOperationPrecedence:dataClass:fromArray:toArray:orderAtomsAscending:]([_SUICEditScriptIndexed alloc], "initWithOperationPrecedence:dataClass:fromArray:toArray:orderAtomsAscending:", a6, objc_opt_class(), v10, v9, v7);

  -[_SUICEditScript computeDistanceMatrix](v11, "computeDistanceMatrix");
  -[_SUICEditScript computeEditsFromMatrix](v11, "computeEditsFromMatrix");
  return v11;
}

- (id)applyToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_SUICEditScript script](self, "script", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "editOperation");
        if (v13 == 1)
        {
          objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v12, "indexToEdit"));
        }
        else
        {
          if (v13 == 2)
          {
            objc_msgSend(v12, "replacementText");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v12, "indexToEdit"));
          }
          else
          {
            if (v13 != 3)
              continue;
            objc_msgSend(v12, "replacementText");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:atIndexedSubscript:", v14, objc_msgSend(v12, "indexToEdit"));
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)initializeCurrentScriptAtom
{
  _SUICAtomIndexed *currentScriptAtom;

  currentScriptAtom = self->_currentScriptAtom;
  self->_currentScriptAtom = 0;

}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v10;
  unint64_t v11;
  _SUICAtomIndexed *v12;
  _SUICAtomIndexed *currentScriptAtom;
  id v14;

  v10 = a5;
  if (a3)
  {
    if (a3 == 2)
      v11 = a4;
    else
      v11 = a4 - 1;
    v14 = v10;
    +[_SUICAtomIndexed atomWithEditOperation:indexToEdit:newText:indexInArrayB:](_SUICAtomIndexed, "atomWithEditOperation:indexToEdit:newText:indexInArrayB:", a3, v11, v10, a6);
    v12 = (_SUICAtomIndexed *)objc_claimAutoreleasedReturnValue();
    currentScriptAtom = self->_currentScriptAtom;
    self->_currentScriptAtom = v12;

    -[_SUICEditScriptIndexed finalizeCurrentScriptAtom](self, "finalizeCurrentScriptAtom");
    v10 = v14;
  }

}

- (void)finalizeCurrentScriptAtom
{
  _SUICAtomIndexed *currentScriptAtom;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _SUICAtomIndexed *v11;
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
      if (-[_SUICAtomIndexed editOperation](currentScriptAtom, "editOperation") == 2)
      {
        v4 = 1;
      }
      else if (-[_SUICAtomIndexed editOperation](self->_currentScriptAtom, "editOperation") == 1)
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
      -[_SUICEditScript script](self, "script", 0);
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

      -[_SUICEditScript script](self, "script");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertObject:atIndex:", self->_currentScriptAtom, 0);
    }
    else
    {
      -[_SUICEditScript script](self, "script");
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
