@implementation NSMutableArray

+ (NSMutableArray)arrayWithCountedSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addRepeatingObject:count:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), objc_msgSend(v3, "countForObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9)));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return (NSMutableArray *)v4;
}

- (void)addRepeatingObject:(id)a3 count:(unint64_t)a4
{
  unint64_t v4;
  id v7;

  if (a4)
  {
    v4 = a4;
    do
    {
      v7 = objc_msgSend(a3, "copy");
      -[NSMutableArray addObject:](self, "addObject:", v7);

      --v4;
    }
    while (v4);
  }
}

@end
