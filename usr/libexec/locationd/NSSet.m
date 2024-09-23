@implementation NSSet

- (id)cl_deepCopy
{
  id v2;
  id v3;

  v2 = -[NSSet cl_deepMutableCopy](self, "cl_deepMutableCopy");
  v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithSet:", v2);

  return v3;
}

- (id)cl_deepMutableCopy
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSSet count](self, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(self);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "cl_deepCopy");
        objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)cl_setByRemovingObjectsFromSet:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = +[NSMutableSet set](NSMutableSet, "set");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(self);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(a3, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return objc_msgSend(v5, "copy");
}

@end
