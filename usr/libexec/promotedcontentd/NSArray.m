@implementation NSArray

- (id)allIdentifiers
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", (_QWORD)v14));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  return v12;
}

- (id)arrayByAddingObject:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    v9 = self;
LABEL_7:
    v8 = v9;
    goto LABEL_10;
  }
  if (!v6)
  {
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByRemovingObjectForIdentifier:](self, "arrayByRemovingObjectForIdentifier:", v7));
    goto LABEL_7;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10016E208;
  v15 = &unk_1002189D0;
  v16 = v7;
  v17 = &v18;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v12);
  if (v19[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self, "arrayByAddingObject:", v6, v12, v13, v14, v15));
  }
  else
  {
    v10 = -[NSArray mutableCopy](self, "mutableCopy", v12, v13, v14, v15);
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v19[3], v6);
    v8 = (NSArray *)objc_msgSend(v10, "copy");

  }
  _Block_object_dispose(&v18, 8);
LABEL_10:

  return v8;
}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", (_QWORD)v13));
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)arrayByRemovingObjectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10016E334;
    v8[3] = &unk_1002189F8;
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v8));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](self, "filteredArrayUsingPredicate:", v5));

  }
  else
  {
    v6 = self;
  }

  return v6;
}

@end
