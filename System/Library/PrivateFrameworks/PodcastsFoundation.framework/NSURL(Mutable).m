@implementation NSURL(Mutable)

- (uint64_t)pf_components
{
  return objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
}

- (id)pf_queryAsDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "query");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSURLUtil queryStringToQueryDictionary:](NSURLUtil, "queryStringToQueryDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pf_URLByAppendingQueryParameters:()Mutable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "pf_components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSURLUtil queryStringToQueryDictionary:](NSURLUtil, "queryStringToQueryDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addEntriesFromDictionary:", v4);
  +[NSURLUtil dictionaryToQueryString:](NSURLUtil, "dictionaryToQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuery:", v8);

  objc_msgSend(v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pf_URLByRemovingQueryParameters:()Mutable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "pf_components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSURLUtil queryStringToQueryDictionary:](NSURLUtil, "queryStringToQueryDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectsForKeys:", v4);
  +[NSURLUtil dictionaryToQueryString:](NSURLUtil, "dictionaryToQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuery:", v8);

  objc_msgSend(v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pf_URLByAppendingQueryParameterKey:()Mutable value:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pf_URLByAppendingQueryParameters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
