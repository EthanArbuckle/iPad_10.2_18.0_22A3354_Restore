@implementation DMFBook

- (id)initWithBook:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DMFBook *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kind"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ibooks")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pdf")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("epub")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "state"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Queued")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PromptingForLogin")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Updating")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Installing")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Managed")) & 1) != 0)
  {
    v7 = 7;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ManagedButUninstalled")) & 1) != 0)
  {
    v7 = 8;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Installed")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Uninstalled")) & 1) != 0)
  {
    v7 = 6;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Failed")))
  {
    v7 = 9;
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iTunesStoreID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "version"));
  v13 = -[DMFBook initWithPersistentID:iTunesStoreID:author:title:version:type:state:](self, "initWithPersistentID:iTunesStoreID:author:title:version:type:state:", v8, v9, v10, v11, v12, v5, v7);

  return v13;
}

@end
