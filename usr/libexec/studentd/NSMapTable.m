@implementation NSMapTable

- (void)stu_enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, unsigned __int8 *);
  NSMapTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];

  v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  if (v4)
  {
    v16 = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v5, "objectForKey:", v10, (_QWORD)v12));
        v4[2](v4, v10, v11, &v16);
        LODWORD(v10) = v16;

        if ((_DWORD)v10)
          break;
        if (v7 == (id)++v9)
        {
          v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
