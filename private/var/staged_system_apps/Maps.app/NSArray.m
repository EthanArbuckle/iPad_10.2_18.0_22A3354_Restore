@implementation NSArray

- (BOOL)_maps_containsContextOfClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10027943C;
  v4[3] = &unk_1011AE7A0;
  v4[4] = a3;
  return -[NSArray indexOfObjectPassingTest:](self, "indexOfObjectPassingTest:", v4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_maps_firstContextOfClass:(Class)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10027953C;
  v10 = sub_10027954C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100279554;
  v5[3] = &unk_1011AE7C8;
  v5[4] = &v6;
  v5[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_maps_lastContextOfClass:(Class)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10027953C;
  v10 = sub_10027954C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100279684;
  v5[3] = &unk_1011AE7C8;
  v5[4] = &v6;
  v5[5] = a3;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 2, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_maps_subarrayFromIndex:(unint64_t)a3
{
  id v5;

  if (a3)
  {
    if (-[NSArray count](self, "count") <= a3)
      v5 = &__NSArray0__struct;
    else
      v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:", a3, (char *)-[NSArray count](self, "count") - a3));
  }
  else
  {
    v5 = -[NSArray copy](self, "copy");
  }
  return v5;
}

- (id)_maps_subarrayToIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;

  if (-[NSArray count](self, "count"))
  {
    v5 = a3 + 1;
    if (v5 >= -[NSArray count](self, "count"))
      v6 = -[NSArray copy](self, "copy");
    else
      v6 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:", 0, v5));
  }
  else
  {
    v6 = &__NSArray0__struct;
  }
  return v6;
}

+ (id)_navigation_newArrayWithDefaultValue:(id)a3 withCapacity:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a4));
  if (a4)
  {
    v7 = 0;
    do
    {
      if (v5)
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, v7);
      ++v7;
    }
    while (a4 != v7);
  }
  v8 = objc_msgSend(v6, "copy");

  return v8;
}

- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6;
  NSArray *v7;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  NSArray *v16;
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
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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

+ (BOOL)array:(id)a3 isEqualToArray:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToArray:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_maps_map:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (uint64_t (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v5, "addObject:", v12, (_QWORD)v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_maps_compactMap:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (uint64_t (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12)
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_maps_isPrefixOfArray:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= (id)-[NSArray count](self, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", (char *)i + v10, (_QWORD)v16));
          LODWORD(v13) = objc_msgSend(v14, "isEqual:", v13);

          if (!(_DWORD)v13)
          {
            v6 = 0;
            goto LABEL_13;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v10 += (uint64_t)i;
        if (v9)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_maps_commonPrefixSharedBetweenArray:(id)a3 suffix:(id *)a4 andArray:(id)a5 suffix:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a5;
  if (v9)
    v11 = v9;
  else
    v11 = &__NSArray0__struct;
  if (v10)
    v12 = v10;
  else
    v12 = &__NSArray0__struct;
  v13 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0;
  if (objc_msgSend(v11, "count"))
  {
    while (v14 < (unint64_t)objc_msgSend(v12, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v14));
      v17 = objc_msgSend(v16, "isEqual:", v15);

      if ((v17 & 1) == 0)
      {

        if (a4)
          goto LABEL_12;
        goto LABEL_13;
      }
      objc_msgSend(v13, "addObject:", v15);
      ++v14;

      if (v14 >= (unint64_t)objc_msgSend(v11, "count"))
        break;
    }
  }
  if (a4)
  {
LABEL_12:
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", v14, (char *)objc_msgSend(v11, "count") - v14)));
    *a4 = v18;

  }
LABEL_13:
  if (a6)
  {
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", v14, (char *)objc_msgSend(v12, "count") - v14)));
    *a6 = v19;

  }
  return v13;
}

- (NSArray)carShortenedArray
{
  unint64_t v3;
  NSUInteger v4;
  NSArray *v5;

  if (!-[NSArray count](self, "count")
    || (v3 = +[CarDisplayController maximumListLength](CarDisplayController, "maximumListLength"),
        v3 == -1))
  {
    v5 = self;
  }
  else
  {
    v4 = v3;
    if (-[NSArray count](self, "count") < v3)
      v4 = -[NSArray count](self, "count");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:", 0, v4));
  }
  return v5;
}

@end
