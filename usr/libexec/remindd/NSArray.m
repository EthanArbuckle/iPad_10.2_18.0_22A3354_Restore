@implementation NSArray

- (id)ic_randomObject
{
  void *v3;
  id v4;

  v3 = -[NSArray count](self, "count");
  if (v3)
  {
    v4 = -[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)-[NSArray count](self, "count")));
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (id)ic_objectPassingTest:(id)a3
{
  NSUInteger v4;
  void *v5;

  v4 = -[NSArray indexOfObjectPassingTest:](self, "indexOfObjectPassingTest:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self, "objectAtIndex:", v4));
  return v5;
}

- (BOOL)ic_containsObjectPassingTest:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray ic_objectPassingTest:](self, "ic_objectPassingTest:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)ic_objectsPassingTest:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", v4));

  return v5;
}

- (id)ic_objectsOfClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000717D0;
  v4[3] = &unk_1007DA080;
  v4[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue(-[NSArray ic_objectsPassingTest:](self, "ic_objectsPassingTest:", v4));
}

- (id)ic_arrayByGroupingIntoArraysWithMaxCount:(unint64_t)a3
{
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v9, "count", (_QWORD)v16);
        if (!v9 || (unint64_t)v13 >= a3)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3));

          objc_msgSend(v5, "addObject:", v14);
          v9 = (void *)v14;
        }
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)ic_indexOfSortedObject:(id)a3 insertionIndex:(unint64_t *)a4 usingComparator:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  unsigned __int8 v12;

  v8 = a3;
  v9 = a5;
  v10 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, -[NSArray count](self, "count"), 1280, v9);

  if (a4)
    *a4 = v10;
  if (v10 >= -[NSArray count](self, "count")
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v10)),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) == 0))
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)ic_indexIsValid:(int64_t)a3
{
  return a3 >= 1 && -[NSArray count](self, "count") > a3;
}

- (id)ic_objectBefore:(id)a3
{
  return -[NSArray ic_objectBefore:wrap:](self, "ic_objectBefore:wrap:", a3, 0);
}

- (id)ic_objectAfter:(id)a3
{
  return -[NSArray ic_objectAfter:wrap:](self, "ic_objectAfter:wrap:", a3, 0);
}

- (id)ic_objectBefore:(id)a3 wrap:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v6;
  void *v7;
  int v8;

  v4 = a4;
  v6 = -[NSArray indexOfObject:](self, "indexOfObject:", a3);
  v7 = 0;
  if (v6)
    v8 = 1;
  else
    v8 = v4;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", (-[NSArray count](self, "count") + v6 - 1) % -[NSArray count](self, "count")));
  return v7;
}

- (id)ic_objectAfter:(id)a3 wrap:(BOOL)a4
{
  _BYTE *v6;
  _BYTE *v7;
  void *v8;

  v6 = -[NSArray indexOfObject:](self, "indexOfObject:", a3);
  if (v6 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL || (v7 = v6, !a4) && v6 == (char *)-[NSArray count](self, "count") - 1)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", (unint64_t)(v7 + 1) % -[NSArray count](self, "count")));
  return v8;
}

- (id)ic_arrayByAddingNonNilObject:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;

  v4 = self;
  v5 = v4;
  if (a3)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v4, "arrayByAddingObject:", a3));

    v5 = (void *)v6;
  }
  return v5;
}

- (id)ic_arrayByAddingObjectsFromNonNilArray:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;

  v4 = self;
  v5 = v4;
  if (a3)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v4, "arrayByAddingObjectsFromArray:", a3));

    v5 = (void *)v6;
  }
  return v5;
}

- (id)ic_map:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100071CAC;
  v12 = &unk_1007DA0A8;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count")));
  v14 = v4;
  v5 = v13;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v9);
  v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (id)jsonify
{
  NSArray *v2;
  id v3;

  v2 = self;
  v3 = sub_1003A5340((Class *)NSMutableArray_ptr, (uint64_t (*)(void))&NSArray.makeIterator());

  return v3;
}

@end
