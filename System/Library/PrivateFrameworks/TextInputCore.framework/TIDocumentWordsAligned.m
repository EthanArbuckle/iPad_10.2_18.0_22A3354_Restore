@implementation TIDocumentWordsAligned

- (unint64_t)wordsCount
{
  void *v2;
  unint64_t v3;

  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (TIDocumentWordsAligned)init
{
  TIDocumentWordsAligned *v2;
  uint64_t v3;
  NSMutableArray *inDocumentWordsStack;
  uint64_t v5;
  NSMutableDictionary *leftContextToWordMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIDocumentWordsAligned;
  v2 = -[TIDocumentWordsAligned init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    inDocumentWordsStack = v2->_inDocumentWordsStack;
    v2->_inDocumentWordsStack = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    leftContextToWordMap = v2->_leftContextToWordMap;
    v2->_leftContextToWordMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (NSMutableArray)inDocumentWordsStack
{
  return self->_inDocumentWordsStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftContextToWordMap, 0);
  objc_storeStrong((id *)&self->_inDocumentWordsStack, 0);
}

- (void)pushWordToDocument:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionIndex:", objc_msgSend(v4, "count"));

  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[TIDocumentWordsAligned addToContextMap:](self, "addToContextMap:", v6);
}

- (void)addToContextMap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "trimmedDocumentContextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDocumentWordsAligned matchingLeftContextToWordMapKey:](self, "matchingLeftContextToWordMapKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TIDocumentWordsAligned preferredLeftContextToWordMapKeyForLeftContext:andMatchingLeftContext:](self, "preferredLeftContextToWordMapKeyForLeftContext:andMatchingLeftContext:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentWordsAligned replaceLeftContextToWordMapKey:withNewKey:](self, "replaceLeftContextToWordMapKey:withNewKey:", v5, v6);
    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);
  }

}

- (void)removeFromContextMap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "trimmedDocumentContextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDocumentWordsAligned matchingLeftContextToWordMapKey:](self, "matchingLeftContextToWordMapKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

  }
}

- (id)wordsForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIDocumentWordsAligned matchingLeftContextToWordMapKey:](self, "matchingLeftContextToWordMapKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[TIDocumentWordsAligned preferredLeftContextToWordMapKeyForLeftContext:andMatchingLeftContext:](self, "preferredLeftContextToWordMapKeyForLeftContext:andMatchingLeftContext:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDocumentWordsAligned replaceLeftContextToWordMapKey:withNewKey:](self, "replaceLeftContextToWordMapKey:withNewKey:", v8, v9);
      -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)matchingLeftContextToWordMapKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", v4) & 1) != 0)
        {
          v15 = v12;

          goto LABEL_21;
        }
        v13 = objc_msgSend(v12, "length");
        if (v13 > objc_msgSend(v9, "length")
          && ((objc_msgSend(v12, "hasPrefix:", v4) & 1) == 0
           && objc_msgSend(v12, "hasSuffix:", v4)
           && (unint64_t)objc_msgSend(v4, "length") > 0xF
           || (objc_msgSend(v4, "hasPrefix:", v12) & 1) == 0
           && objc_msgSend(v4, "hasSuffix:", v12)
           && (unint64_t)objc_msgSend(v12, "length") >= 0x10))
        {
          v14 = v12;

          v9 = v14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v9 = v9;
  v15 = v9;
LABEL_21:

  return v15;
}

- (id)preferredLeftContextToWordMapKeyForLeftContext:(id)a3 andMatchingLeftContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = a4;
    v8 = objc_msgSend(v7, "length");
    if (v8 <= objc_msgSend(v6, "length"))
      v9 = v6;
    else
      v9 = v7;
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)replaceLeftContextToWordMapKey:(id)a3 withNewKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_msgSend(v11, "isEqualToString:", v6) & 1) == 0)
  {
    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

    -[TIDocumentWordsAligned leftContextToWordMap](self, "leftContextToWordMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
}

- (void)insertWord:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= a4)
  {
    objc_msgSend(v8, "addObject:", v11);

    -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSessionIndex:", objc_msgSend(v10, "count"));

  }
  else
  {
    objc_msgSend(v8, "insertObject:atIndex:", v11, a4);

    objc_msgSend(v11, "setSessionIndex:", a4);
  }
  -[TIDocumentWordsAligned addToContextMap:](self, "addToContextMap:", v11);

}

- (id)_wordsFromContext:(id)a3 shouldDelete:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v34;
  _BOOL4 v35;
  id v36;
  __CFString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v10);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v37 = &stru_1EA1081D0;
    }
    if (v8 < 1)
    {
      v11 = -1;
      if (!v4)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v35 = v4;
      v11 = 0;
      while (1)
      {
        -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "documentState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contextBeforeInput");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v17, "isEqualToString:", v6) & 1) != 0
          || objc_msgSend(v17, "isEqualToString:", v37))
        {
          break;
        }

        if (v8 == ++v11)
        {
          v11 = -1;
          goto LABEL_16;
        }
      }
      if (v8 > (int)v11)
      {
        v18 = (int)v11;
        do
        {
          -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v20);

          ++v18;
        }
        while (v8 != v18);
      }

LABEL_16:
      if (!v35)
        goto LABEL_36;
    }
    v36 = v6;
    if (v11 != -1)
    {
      -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectsInRange:", v11, v8 - v11);

    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v9;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v27, "setDeleted:", 1);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v27, "allEdits");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v39 != v31)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "setDeleted:", 1);
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v30);
          }

          -[TIDocumentWordsAligned removeFromContextMap:](self, "removeFromContextMap:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v24);
    }

    v9 = v34;
    v6 = v36;
    goto LABEL_36;
  }
  v9 = 0;
LABEL_37:

  return v9;
}

- (id)deleteWordsUpToContext:(id)a3
{
  return -[TIDocumentWordsAligned _wordsFromContext:shouldDelete:](self, "_wordsFromContext:shouldDelete:", a3, 1);
}

- (id)wordsFromContext:(id)a3
{
  return -[TIDocumentWordsAligned _wordsFromContext:shouldDelete:](self, "_wordsFromContext:shouldDelete:", a3, 0);
}

- (id)description
{
  void *v2;
  void *v3;

  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastWord
{
  void *v2;
  void *v3;
  void *v4;

  -[TIDocumentWordsAligned inDocumentWordsStack](self, "inDocumentWordsStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setInDocumentWordsStack:(id)a3
{
  objc_storeStrong((id *)&self->_inDocumentWordsStack, a3);
}

- (NSMutableDictionary)leftContextToWordMap
{
  return self->_leftContextToWordMap;
}

- (void)setLeftContextToWordMap:(id)a3
{
  objc_storeStrong((id *)&self->_leftContextToWordMap, a3);
}

@end
