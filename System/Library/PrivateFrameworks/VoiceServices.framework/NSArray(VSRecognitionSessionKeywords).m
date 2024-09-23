@implementation NSArray(VSRecognitionSessionKeywords)

- (id)_scrambledKeywordsAndAddToSet:()VSRecognitionSessionKeywords
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(a1, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a1);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v11, "_scrambledKeywordsAndAddToSet:", a3);
          v13 = v5;
        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
          v13 = a3;
          v12 = (uint64_t)v11;
        }
        objc_msgSend(v13, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  if (v6)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", v14, random() % v6 + v14);
      ++v14;
      --v6;
    }
    while (v6);
  }
  return v5;
}

- (void)_nextKeywordUsingCursors:()VSRecognitionSessionKeywords
{
  char *Value;
  unint64_t v6;
  void *v7;

  Value = (char *)CFDictionaryGetValue(theDict, key);
  v6 = objc_msgSend(key, "count");
  v7 = 0;
  if (v6 <= (unint64_t)Value)
    Value = 0;
  if ((unint64_t)Value < v6)
  {
    v7 = (void *)objc_msgSend(key, "objectAtIndex:", Value);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (void *)objc_msgSend(v7, "_nextKeywordUsingCursors:", theDict);
    CFDictionarySetValue(theDict, key, Value + 1);
  }
  return v7;
}

@end
