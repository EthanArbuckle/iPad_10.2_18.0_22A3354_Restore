@implementation APAppLaunchDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.applaunch");
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)APAppLaunchDataAdaptor;
  if (!-[APBiomeDataAdaptor _validateParameters:](&v16, "_validateParameters:"))
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
  v7 = -[APDataAdaptor _requireClassType:name:expectedClass:error:](self, "_requireClassType:name:expectedClass:error:", v6, CFSTR("bundleIDs"), objc_opt_class(NSArray), a3);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minCount")));
    v10 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v9, CFSTR("minCount"), objc_opt_class(NSNumber), a3);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
      -[APAppLaunchDataAdaptor setBundleIDs:](self, "setBundleIDs:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[APAppLaunchDataAdaptor setFoundBundleIDs:](self, "setFoundBundleIDs:", v14);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minCount")));
      -[APAppLaunchDataAdaptor setMinCount:](self, "setMinCount:", v6);
      goto LABEL_5;
    }
LABEL_6:
    LOBYTE(v7) = 0;
    return v7;
  }
LABEL_5:

  return v7;
}

- (id)_biomeStream
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = BiomeLibrary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "App"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "InFocus"));

  return v5;
}

- (id)calculateResultFromEvents
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  int v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor foundBundleIDs](self, "foundBundleIDs", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "intValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor minCount](self, "minCount"));
        v7 |= v10 > (int)objc_msgSend(v11, "intValue");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 & 1));
}

- (void)eventReceived:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;

  v17 = a3;
  v4 = objc_opt_class(BMStoreEvent);
  if ((objc_opt_isKindOfClass(v17, v4) & 1) != 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventBody")),
        v6 = objc_opt_class(BMAppInFocus),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = v17;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor bundleIDs](self, "bundleIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventBody"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
    v12 = objc_msgSend(v9, "containsObject:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventBody"));
      v14 = objc_msgSend(v13, "starting");

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventBody"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleID"));
        -[APAppLaunchDataAdaptor _incrementBundleIDCount:](self, "_incrementBundleIDCount:", v16);

      }
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008808C;
    block[3] = &unk_100212FE0;
    v19 = v17;
    if (qword_100268750 != -1)
      dispatch_once(&qword_100268750, block);
    v8 = v19;
  }

}

- (void)_incrementBundleIDCount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor foundBundleIDs](self, "foundBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));

  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor foundBundleIDs](self, "foundBundleIDs"));
    objc_msgSend(v6, "setObject:forKey:", v5, v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APAppLaunchDataAdaptor foundBundleIDs](self, "foundBundleIDs"));
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSNumber)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(id)a3
{
  objc_storeStrong((id *)&self->_minCount, a3);
}

- (NSMutableDictionary)foundBundleIDs
{
  return self->_foundBundleIDs;
}

- (void)setFoundBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_foundBundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundBundleIDs, 0);
  objc_storeStrong((id *)&self->_minCount, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
