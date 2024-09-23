@implementation STUConcreteLSPrimitives

- (STUConcreteLSPrimitives)init
{
  STUConcreteLSPrimitives *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUConcreteLSPrimitives;
  v2 = -[STUConcreteLSPrimitives init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v5, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STUConcreteLSPrimitives;
  -[STUConcreteLSPrimitives dealloc](&v4, "dealloc");
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  LOBYTE(a5) = objc_msgSend(v9, "openURL:withOptions:error:", v8, v7, a5);

  return (char)a5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUConcreteLSPrimitives observers](self, "observers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUConcreteLSPrimitives observers](self, "observers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)applicationsAvailableForOpeningURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationsAvailableForOpeningURL:", v3));

  return v5;
}

- (id)URLOverrideForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLOverrideForURL:", v3));

  return v5;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "applicationsDidInstall:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "applicationsDidUninstall:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)getAppLinkWithURL:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000365C0;
  v6[3] = &unk_1000CA8F8;
  v7 = a4;
  v5 = v7;
  +[LSAppLink getAppLinkWithURL:completionHandler:](LSAppLink, "getAppLinkWithURL:completionHandler:", a3, v6);

}

- (id)applicationRecordWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  STUConcreteLSApplicationRecord *v7;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, a4);

  if (v6)
    v7 = -[STUConcreteLSApplicationRecord initWithLSApplicationRecord:]([STUConcreteLSApplicationRecord alloc], "initWithLSApplicationRecord:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v4, "noteRestrictionsUpdateForOpensWithCompletion:", v3);

}

- (NSString)defaultWebBrowserBundleIdentifier
{
  id v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  id v11;

  v2 = objc_alloc((Class)LSClaimBinding);
  v3 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://"));
  v11 = 0;
  v4 = objc_msgSend(v2, "initWithURL:error:", v3, &v11);
  v5 = v11;

  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleRecord"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleIdentifier](v6, "bundleIdentifier"));
  }
  else
  {
    v8 = sub_100036804();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    v9 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9)
        sub_10007BEA8(v5, v6);
    }
    else if (v9)
    {
      sub_10007BE68(v6);
    }
    v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isWebBrowser:(id)a3
{
  id v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  id v12;

  v3 = a3;
  v12 = 0;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v12);
  v5 = v12;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isWebBrowser");
  }
  else
  {
    v7 = sub_100036804();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9)
        sub_10007BFA0((uint64_t)v3, (uint64_t)v5, v8);
    }
    else if (v9)
    {
      sub_10007BF34((uint64_t)v3, v8, v10);
    }

    v6 = 0;
  }

  return v6;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
