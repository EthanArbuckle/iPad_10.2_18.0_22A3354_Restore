@implementation STUDisplayLayoutReader

+ (id)bundleIdentifiersInLayouts:(id)a3
{
  id v3;
  STUDisplayLayoutReader *v4;
  void *v5;

  v3 = a3;
  v4 = -[STUDisplayLayoutReader initWithLayouts:]([STUDisplayLayoutReader alloc], "initWithLayouts:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader bundleIdentifiers](v4, "bundleIdentifiers"));
  return v5;
}

- (STUDisplayLayoutReader)initWithLayouts:(id)a3
{
  id v4;
  STUDisplayLayoutReader *v5;
  NSSet *v6;
  NSSet *layouts;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUDisplayLayoutReader;
  v5 = -[STUDisplayLayoutReader init](&v9, "init");
  if (v5)
  {
    v6 = (NSSet *)objc_msgSend(v4, "copy");
    layouts = v5->_layouts;
    v5->_layouts = v6;

  }
  return v5;
}

- (id)bundleIdentifiers
{
  void *v3;
  NSMutableOrderedSet *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader allLayoutElements](self, "allLayoutElements"));
  v4 = objc_opt_new(NSMutableOrderedSet);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader bundleIdentifierFromLayoutElement:](self, "bundleIdentifierFromLayoutElement:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
        if (v10)
          -[NSMutableOrderedSet addObject:](v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v4, "array"));
  return v11;
}

- (id)allLayoutElements
{
  return -[STUDisplayLayoutReader layoutElementsForRoles:](self, "layoutElementsForRoles:", &off_1000D4278);
}

- (id)layoutElementsForRoles:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader layoutElementsForRole:](self, "layoutElementsForRole:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "integerValue", (_QWORD)v14)));
        -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[NSMutableArray copy](v5, "copy");
  return v12;
}

- (id)layoutElementsForRole:(int64_t)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = objc_opt_new(NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader layouts](self, "layouts"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "elements"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v16, "layoutRole") == (id)a3)
                -[NSMutableArray addObject:](v5, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1));
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  -[NSMutableArray sortUsingDescriptors:](v5, "sortUsingDescriptors:", v18);

  v19 = -[NSMutableArray copy](v5, "copy");
  return v19;
}

- (id)bundleIdentifierFromLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayLayoutReader webClipBundleIdentifierFromIdentifier:](self, "webClipBundleIdentifierFromIdentifier:", v5));

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v9 = (void *)CRKSpringBoardBundleIdentifier;
    v10 = objc_msgSend(v8, "hasPrefix:", CRKSpringBoardBundleIdentifier);

    if (v10)
      v7 = v9;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  }
  v11 = v7;

  return v11;
}

- (id)webClipBundleIdentifierFromIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKWebClipBundleIdentifier bundleIdentifierByLocatingWebClipBundleIdentifierInString:](CRKWebClipBundleIdentifier, "bundleIdentifierByLocatingWebClipBundleIdentifierInString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  return v4;
}

- (NSSet)layouts
{
  return self->_layouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);
}

@end
