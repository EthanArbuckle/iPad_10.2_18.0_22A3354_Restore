@implementation NSArray

- (id)arrayPiecewiseTransformedBy:(id)a3
{
  id v5;
  _QWORD v7[6];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6369C;
  v7[3] = &unk_428008;
  v7[4] = v5;
  v7[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  return v5;
}

- (id)tsaxExtractElementsOfType:(Class)a3
{
  void *v5;
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

  v5 = (void *)objc_opt_new(NSMutableArray, a2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)tsaxObjectsPassingTest:(id)a3
{
  return -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", a3));
}

@end
