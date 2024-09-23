@implementation NSArray

- (id)filterObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke;
  v8[3] = &unk_10013CF10;
  v9 = a3;
  v4 = v9;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", v5));

  return v6;
}

- (id)describeQHashes
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (-[NSArray count](self, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("%x"), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "unsignedIntValue"));
          if ((char *)v9 + v7 + 1 < (char *)-[NSArray count](v4, "count"))
            objc_msgSend(v3, "appendString:", CFSTR(", "));
          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        v7 += (uint64_t)v6;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = v3;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
