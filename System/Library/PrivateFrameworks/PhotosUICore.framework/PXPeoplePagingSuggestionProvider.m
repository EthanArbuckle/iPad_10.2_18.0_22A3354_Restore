@implementation PXPeoplePagingSuggestionProvider

- (PXPeoplePagingSuggestionProvider)init
{
  PXPeoplePagingSuggestionProvider *v2;
  NSMutableArray *v3;
  NSMutableArray *unvisitedSuggestions;
  NSMutableArray *v5;
  NSMutableArray *visitedSuggestions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPeoplePagingSuggestionProvider;
  v2 = -[PXPeoplePagingSuggestionProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unvisitedSuggestions = v2->_unvisitedSuggestions;
    v2->_unvisitedSuggestions = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visitedSuggestions = v2->_visitedSuggestions;
    v2->_visitedSuggestions = v5;

  }
  return v2;
}

- (BOOL)hasNextSuggestions
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  -[PXPeoplePagingSuggestionProvider unvisitedSuggestions](self, "unvisitedSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v5, "count") != 0;
    v3 = v5;
  }

  return v4;
}

- (BOOL)hasPreviousSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  unint64_t v6;
  void *v7;

  -[PXPeoplePagingSuggestionProvider visitedSuggestions](self, "visitedSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v2, "count");
    if (v6 < 2)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v6 - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v7, "count") != 0;
      v4 = v7;
    }
  }

  return v5;
}

- (id)previousSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  if (-[PXPeoplePagingSuggestionProvider hasPreviousSuggestions](self, "hasPreviousSuggestions"))
  {
    -[PXPeoplePagingSuggestionProvider visitedSuggestions](self, "visitedSuggestions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePagingSuggestionProvider unvisitedSuggestions](self, "unvisitedSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePagingSuggestionProvider currentSuggestions](self, "currentSuggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (!v7)
    {
      objc_msgSend(v3, "removeLastObject");
      objc_msgSend(v4, "removeAllObjects");
      objc_msgSend(v3, "lastObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = 0;
      v6 = (void *)v8;
    }
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v9);
    v10 = objc_msgSend(v5, "count");
    if (v7)
    {
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v4, "firstObject");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "insertObject:atIndex:", v12, 0);
        }
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "insertObjects:atIndexes:", v5, v13);

      }
    }
    v14 = (void *)objc_msgSend(v9, "copy");

    -[PXPeoplePagingSuggestionProvider setCurrentSuggestions:](self, "setCurrentSuggestions:", v14);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v14;
}

- (id)nextSuggestionsWithPageLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  -[PXPeoplePagingSuggestionProvider currentSuggestions](self, "currentSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePagingSuggestionProvider visitedSuggestions](self, "visitedSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePagingSuggestionProvider unvisitedSuggestions](self, "unvisitedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "mutableCopy");
    if (v10)
    {
      objc_msgSend(v10, "addObject:", v11);
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v12, "addObject:", v11);
      objc_msgSend(v6, "addObject:", v12);

    }
    -[PXPeoplePagingSuggestionProvider setCurrentSuggestions:](self, "setCurrentSuggestions:", MEMORY[0x1E0C9AA60]);

  }
  if (!v8 || v9)
  {
    if (v9)
      goto LABEL_11;
    v13 = 0;
LABEL_15:
    v15 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_16;
  }
  objc_msgSend(v7, "removeObjectAtIndex:", 0);
  objc_msgSend(v7, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v13, "count");
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObject:", v14);

  if (!v9)
    goto LABEL_15;
  v8 = v13;
LABEL_11:
  if (v9 >= a3)
    v9 = a3;
  objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsInRange:", 0, v9);
  -[PXPeoplePagingSuggestionProvider setCurrentSuggestions:](self, "setCurrentSuggestions:", v15);
  v13 = v8;
LABEL_16:

  return v15;
}

- (void)appendSuggestionArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_msgSend(v6, "mutableCopy");
    -[PXPeoplePagingSuggestionProvider unvisitedSuggestions](self, "unvisitedSuggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PXPeoplePagingSuggestionProvider *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeoplePagingSuggestionProvider currentSuggestions](self, "currentSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "removeObjectsInArray:", v4);
  v7 = objc_msgSend(v6, "count");
  v25 = v5;
  if (v7 != objc_msgSend(v5, "count"))
  {
    if (v7)
      v8 = v6;
    else
      v8 = 0;
    -[PXPeoplePagingSuggestionProvider setCurrentSuggestions:](self, "setCurrentSuggestions:", v8);
  }
  v24 = v6;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = self;
  -[PXPeoplePagingSuggestionProvider visitedSuggestions](self, "visitedSuggestions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v30 = objc_msgSend(v10, "count");
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              v18 = objc_msgSend(v17, "count");
              if (v18)
              {
                v19 = v18;
                v20 = (void *)objc_msgSend(v17, "mutableCopy");
                objc_msgSend(v20, "removeObjectsInArray:", v4);
                v21 = objc_msgSend(v20, "count");
                if (v21)
                {
                  if (v19 != v21)
                    objc_msgSend(v17, "removeObjectsInArray:", v4);
                }
                else
                {
                  objc_msgSend(v11, "addObject:", v17);
                }

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v14);
        }

        if (objc_msgSend(v11, "count"))
          objc_msgSend(v12, "removeObjectsInArray:", v11);
        if (v30 && !objc_msgSend(v12, "count"))
          objc_msgSend(v26, "addObject:", v12);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }

  if (objc_msgSend(v26, "count"))
  {
    -[PXPeoplePagingSuggestionProvider visitedSuggestions](v23, "visitedSuggestions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectsInArray:", v26);

  }
}

- (void)removeAllSuggestions
{
  void *v3;
  id v4;

  -[PXPeoplePagingSuggestionProvider setCurrentSuggestions:](self, "setCurrentSuggestions:", 0);
  -[PXPeoplePagingSuggestionProvider visitedSuggestions](self, "visitedSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXPeoplePagingSuggestionProvider unvisitedSuggestions](self, "unvisitedSuggestions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSArray)currentSuggestions
{
  return self->_currentSuggestions;
}

- (void)setCurrentSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)unvisitedSuggestions
{
  return self->_unvisitedSuggestions;
}

- (void)setUnvisitedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_unvisitedSuggestions, a3);
}

- (NSMutableArray)visitedSuggestions
{
  return self->_visitedSuggestions;
}

- (void)setVisitedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_visitedSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedSuggestions, 0);
  objc_storeStrong((id *)&self->_unvisitedSuggestions, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
}

@end
