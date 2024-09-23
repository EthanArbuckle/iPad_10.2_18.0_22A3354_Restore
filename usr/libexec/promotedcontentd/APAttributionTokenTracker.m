@implementation APAttributionTokenTracker

- (APAttributionTokenTracker)init
{
  APAttributionTokenTracker *v2;
  APUnfairLock *v3;
  APUnfairLock *tokensLock;
  uint64_t v5;
  NSMutableDictionary *bundles;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APAttributionTokenTracker;
  v2 = -[APAttributionTokenTracker init](&v8, "init");
  if (v2)
  {
    v3 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    tokensLock = v2->_tokensLock;
    v2->_tokensLock = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 10));
    bundles = v2->_bundles;
    v2->_bundles = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)defaultTracker
{
  if (qword_100268860 != -1)
    dispatch_once(&qword_100268860, &stru_100213468);
  return (id)qword_100268858;
}

- (void)addToken:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v8, "lock");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker bundles](self, "bundles"));
  objc_msgSend(v9, "setObject:forKey:", v7, v6);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v10, "unlock");

}

- (BOOL)isTokenUsedByOtherBundle:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v8, "lock");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker bundles](self, "bundles", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker bundles](self, "bundles"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));
        if (objc_msgSend(v6, "isEqualToString:", v15))
        {
          v16 = objc_msgSend(v7, "isEqualToString:", v13);

          if ((v16 & 1) == 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
LABEL_12:

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v17, "unlock");

  return (char)v10;
}

- (BOOL)isTokenUsed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v5, "lock");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker bundles](self, "bundles", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker bundles](self, "bundles"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
        v13 = objc_msgSend(v4, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenTracker tokensLock](self, "tokensLock"));
  objc_msgSend(v14, "unlock");

  return (char)v7;
}

- (APUnfairLock)tokensLock
{
  return self->_tokensLock;
}

- (void)setTokensLock:(id)a3
{
  objc_storeStrong((id *)&self->_tokensLock, a3);
}

- (NSMutableDictionary)bundles
{
  return self->_bundles;
}

- (void)setBundles:(id)a3
{
  objc_storeStrong((id *)&self->_bundles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundles, 0);
  objc_storeStrong((id *)&self->_tokensLock, 0);
}

@end
