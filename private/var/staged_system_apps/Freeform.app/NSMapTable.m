@implementation NSMapTable

- (id)crl_allKeys
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self, "keyEnumerator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v3;
}

- (id)crl_allObjects
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self, "objectEnumerator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v3;
}

- (void)crl_enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
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
  char v16;
  _BYTE v17[128];

  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  if (v4)
  {
    v16 = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allKeys](self, "crl_allKeys", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self, "objectForKey:", v10));
        v4[2](v4, v10, v11, &v16);

        if (v16)
          break;
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
