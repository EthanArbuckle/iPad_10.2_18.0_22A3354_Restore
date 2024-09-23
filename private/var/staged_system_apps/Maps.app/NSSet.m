@implementation NSSet

- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6;
  NSSet *v7;
  id v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  NSSet *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = self;
  v8 = v6;
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = objc_opt_class(SearchResult);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
            && (objc_msgSend(v8, "isEqualToSearchResult:forPurpose:", v14, a4, (_QWORD)v18) & 1) != 0)
          {
            v16 = v14;

            v9 = v16;
            goto LABEL_14;
          }
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_14:

  }
  else
  {
    v16 = 0;
  }

  return v16 != 0;
}

- (id)_maps_searchResultMemberEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6;
  NSSet *v7;
  id v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = self;
  v8 = v6;
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = objc_opt_class(SearchResult);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
            && (objc_msgSend(v8, "isEqualToSearchResult:forPurpose:", v14, a4, (_QWORD)v18) & 1) != 0)
          {
            v16 = v14;
            goto LABEL_14;
          }
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_14:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
