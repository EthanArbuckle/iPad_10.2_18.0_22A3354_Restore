@implementation _SUICEditScript

- (id)operationPrecedenceArrayFromOperationPrecedence:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return &unk_1E4A631E8;
  else
    return (id)qword_1E4A54CB0[a3 - 1];
}

- (_SUICEditScript)initWithOperationPrecedence:(int64_t)a3 orderAtomsAscending:(BOOL)a4
{
  _SUICEditScript *v6;
  _SUICEditScript *v7;
  _SUICIntArray2D *distanceMatrix;
  uint64_t v9;
  NSArray *operationPrecedenceArray;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SUICEditScript;
  v6 = -[_SUICEditScript init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    distanceMatrix = v6->_distanceMatrix;
    v6->_distanceMatrix = 0;

    v7->_orderAtomsAscending = a4;
    -[_SUICEditScript operationPrecedenceArrayFromOperationPrecedence:](v7, "operationPrecedenceArrayFromOperationPrecedence:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    operationPrecedenceArray = v7->_operationPrecedenceArray;
    v7->_operationPrecedenceArray = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUICEditScript setScript:](v7, "setScript:", v11);

  }
  return v7;
}

- (id)description
{
  void *v3;
  _SUICIntArray2D *distanceMatrix;
  void *v5;
  NSArray *operationPrecedenceArray;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  distanceMatrix = self->_distanceMatrix;
  if (distanceMatrix)
  {
    -[_SUICIntArray2D description](distanceMatrix, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Distance Matrix:\n%@\n"), v5);

  }
  operationPrecedenceArray = self->_operationPrecedenceArray;
  if (operationPrecedenceArray)
  {
    -[NSArray description](operationPrecedenceArray, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Order of Precedence:%@\n"), v7);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_script;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

- (void)computeDistanceMatrix
{
  unint64_t v3;
  unint64_t v4;
  _SUICIntArray2D *v5;
  unint64_t i;
  unint64_t j;
  unint64_t v8;
  unint64_t k;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _SUICIntArray2D *distanceMatrix;
  unint64_t v18;

  v3 = -[_SUICEditScriptData length](self->_itemAData, "length");
  v4 = -[_SUICEditScriptData length](self->_itemBData, "length");
  +[_SUICIntArray2D arrayWithISize:jSize:](_SUICIntArray2D, "arrayWithISize:jSize:", v3 + 1, v4 + 1);
  v5 = (_SUICIntArray2D *)objc_claimAutoreleasedReturnValue();
  -[_SUICIntArray2D setShouldBoundsCheck:](v5, "setShouldBoundsCheck:", 1);
  if (v3)
  {
    for (i = 1; i <= v3; ++i)
      -[_SUICIntArray2D ::newValue:](v5, "::newValue:", i, 0, i);
  }
  if (v4)
  {
    for (j = 1; j <= v4; ++j)
      -[_SUICIntArray2D ::newValue:](v5, "::newValue:", 0, j, j);
    v8 = 1;
    v18 = v4;
    do
    {
      if (v3)
      {
        for (k = 1; k <= v3; ++k)
        {
          -[_SUICEditScriptData stringAtIndex:](self->_itemAData, "stringAtIndex:", k - 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_SUICEditScriptData stringAtIndex:](self->_itemBData, "stringAtIndex:", v8 - 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v12)
          {
            v13 = -[_SUICIntArray2D ::](v5, "::", k - 1, v8 - 1);
          }
          else
          {
            v14 = -[_SUICIntArray2D ::](v5, "::", k - 1, v8) + 1;
            v15 = -[_SUICIntArray2D ::](v5, "::", k, v8 - 1);
            if (v14 >= v15 + 1)
              v14 = v15 + 1;
            v16 = -[_SUICIntArray2D ::](v5, "::", k - 1, v8 - 1);
            if (v14 >= v16 + 1)
              v13 = v16 + 1;
            else
              v13 = v14;
          }
          -[_SUICIntArray2D ::newValue:](v5, "::newValue:", k, v8, v13);
        }
      }
      ++v8;
    }
    while (v8 <= v18);
  }
  distanceMatrix = self->_distanceMatrix;
  self->_distanceMatrix = v5;

}

- (void)computeEditsFromMatrix
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  int v17;
  BOOL v19;
  void *v20;
  uint64_t v21;
  unint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _SUICIntArray2D *v29;

  -[_SUICEditScript initializeCurrentScriptAtom](self, "initializeCurrentScriptAtom");
  self->_currentOperation = 0;
  v29 = self->_distanceMatrix;
  v3 = -[_SUICIntArray2D iSize](v29, "iSize") - 1;
  v4 = -[_SUICIntArray2D jSize](v29, "jSize") - 1;
  if (v3 <= 0 && v4 < 1)
    goto LABEL_57;
  v6 = 0;
  do
  {
    v27 = v6;
    v7 = v3--;
    v8 = -[_SUICIntArray2D ::outOfBoundsReturnValue:](v29, "::outOfBoundsReturnValue:", v3, v4, 0x7FFFFFFFFFFFFFFFLL);
    v28 = v4;
    v9 = v4 - 1;
    v10 = -[_SUICIntArray2D ::outOfBoundsReturnValue:](v29, "::outOfBoundsReturnValue:", v7, v4 - 1, 0x7FFFFFFFFFFFFFFFLL);
    v11 = -[_SUICIntArray2D ::outOfBoundsReturnValue:](v29, "::outOfBoundsReturnValue:", v3, v4 - 1, 0x7FFFFFFFFFFFFFFFLL);
    v12 = -[NSArray count](self->_operationPrecedenceArray, "count");
    v13 = v12 - 1;
    if (v12 < 1)
    {
LABEL_37:
      v3 = v7;
      v6 = v27;
      if (v27 == 1)
      {
LABEL_38:
        v9 = 0x7FFFFFFFFFFFFFFFLL;
        v6 = 1;
        v24 = &stru_1E4A55AD0;
        v4 = v28;
      }
      else
      {
        v3 = v7;
        v24 = &stru_1E4A55AD0;
        v4 = v28;
        v9 = v28;
      }
      goto LABEL_55;
    }
    v15 = v11 < v8 && v11 < v10;
    v17 = v10 < v8 && v10 < v11;
    v19 = v8 < v10 && v8 < v11;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_operationPrecedenceArray, "objectAtIndex:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 == 3)
        break;
      if (v21 == 2)
      {
        if (((v13 != 0) & ~v17) == 0)
        {
          if (v28 < 1)
          {
            v24 = 0;
          }
          else
          {
            -[_SUICEditScriptData stringAtIndex:](self->_itemBData, "stringAtIndex:", v9);
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v6 = 2;
          v3 = v7;
          goto LABEL_54;
        }
      }
      else if (v21 == 1 && (!v13 || v19))
      {
        goto LABEL_38;
      }
LABEL_36:
      v23 = v13-- + 1;
      if (v23 <= 1)
        goto LABEL_37;
    }
    if (((v13 != 0) & ~v15) != 0)
      goto LABEL_36;
    if (v7 < 1)
    {
      v25 = 0;
    }
    else
    {
      -[_SUICEditScriptData stringAtIndex:](self->_itemAData, "stringAtIndex:", v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v28 < 1)
    {
      v26 = 0;
    }
    else
    {
      -[_SUICEditScriptData stringAtIndex:](self->_itemBData, "stringAtIndex:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v25, "isEqualToString:", v26) & 1) != 0)
    {
      v6 = 0;
      v24 = &stru_1E4A55AD0;
    }
    else
    {
      v24 = v26;
      v6 = 3;
    }

LABEL_54:
    v4 = v9;
LABEL_55:
    -[_SUICEditScript addToCurrentScriptAtomEditOperation:editIndex:newText:indexInArrayB:](self, "addToCurrentScriptAtomEditOperation:editIndex:newText:indexInArrayB:", v6, v7, v24, v9);

  }
  while (v3 > 0 || v4 > 0);
LABEL_57:
  -[_SUICEditScript finalizeCurrentScriptAtom](self, "finalizeCurrentScriptAtom");

}

- (NSArray)operationPrecedenceArray
{
  return self->_operationPrecedenceArray;
}

- (void)setOperationPrecedenceArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
  objc_storeStrong((id *)&self->_script, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_operationPrecedenceArray, 0);
  objc_storeStrong((id *)&self->_itemBData, 0);
  objc_storeStrong((id *)&self->_itemAData, 0);
  objc_storeStrong((id *)&self->_distanceMatrix, 0);
}

@end
