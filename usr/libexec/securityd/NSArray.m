@implementation NSArray

- (id)concatenateWithSeparator:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = &stru_1002EE888;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        objc_msgSend(v5, "appendString:", v12, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
        objc_msgSend(v5, "appendString:", v14);

        v10 = (__CFString *)v4;
        v11 = (char *)v11 + 1;
        v12 = v10;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = &stru_1002EE888;
  }

  return v5;
}

@end
