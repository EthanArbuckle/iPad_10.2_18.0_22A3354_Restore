@implementation TextResults

- (TextResults)init
{
  TextResults *v2;
  uint64_t v3;
  NSMutableArray *mutableCols;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TextResults;
  v2 = -[TextResults init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableCols = v2->_mutableCols;
    v2->_mutableCols = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addColumn:(id)a3
{
  NSMutableArray *mutableCols;

  mutableCols = self->_mutableCols;
  if (mutableCols)
    -[NSMutableArray addObject:](mutableCols, "addObject:", a3);
}

- (NSArray)cols
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_mutableCols);
}

- (unint64_t)colCount
{
  return -[NSMutableArray count](self->_mutableCols, "count");
}

- (void)sortCols
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = self->_mutableCols;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "sortRowsInAscendingOrder", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)transcriptionOfPath:(id)a3 tokenProcessingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, uint64_t, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, uint64_t, uint64_t))a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v8 = 0;
    v9 = 0;
    v24 = v5;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_mutableCols, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v9;
      v11 = objc_msgSend(v5, "indexAtPosition:", v9);
      v28 = v10;
      objc_msgSend(v10, "rows");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v12;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
      {
        v14 = v13;
        v32 = *(_QWORD *)v34;
        do
        {
          v15 = 0;
          v30 = v8;
          v16 = -v8;
          do
          {
            if (*(_QWORD *)v34 != v32)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
            if (v16 == v15)
              v18 = &stru_1E98DC948;
            else
              v18 = CFSTR(" ");
            v19 = objc_msgSend(v7, "length");
            v20 = -[__CFString length](v18, "length");
            objc_msgSend(v17, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v18, v21);

            v22 = objc_msgSend(v7, "length");
            if (v6)
              v6[2](v6, v17, v20 + v19, v22 - (v20 + v19));
            ++v15;
          }
          while (v14 != v15);
          v8 = v14 + v30;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v14);
      }

      v9 = v29 + 1;
      v5 = v24;
    }
    while (v29 + 1 < (unint64_t)objc_msgSend(v24, "length"));
  }

  return v7;
}

- (void)setCols:(id)a3
{
  objc_storeStrong((id *)&self->_cols, a3);
}

- (NSMutableArray)mutableCols
{
  return self->_mutableCols;
}

- (void)setMutableCols:(id)a3
{
  objc_storeStrong((id *)&self->_mutableCols, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCols, 0);
  objc_storeStrong((id *)&self->_cols, 0);
}

@end
