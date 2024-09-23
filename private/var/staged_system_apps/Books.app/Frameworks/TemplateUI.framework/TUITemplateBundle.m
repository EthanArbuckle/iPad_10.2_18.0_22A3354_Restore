@implementation TUITemplateBundle

+ (id)bundleWithURL:(id)a3
{
  return objc_msgSend(a1, "bundleWithURL:requireInfoPlist:", a3, 1);
}

+ (id)bundleWithURL:(id)a3 requireInfoPlist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Info.plist")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v7));
  v9 = objc_opt_class(NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version")));
  v11 = TUIDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v4 || v12)
    v13 = objc_msgSend(objc_alloc((Class)a1), "_initWithURL:info:", v6, v8);
  else
    v13 = 0;

  return v13;
}

- (id)_initWithURL:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  TUITemplateBundle *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  NSURL *v11;
  NSURL *url;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSString *version;
  NSMutableSet *v18;
  NSMutableSet *registeredFonts;
  uint64_t v20;
  NSHashTable *factories;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TUITemplateBundle;
  v8 = -[TUITemplateBundle init](&v23, "init");
  if (v8)
  {
    v9 = dispatch_queue_create("TUITemplateBundle.access", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSURL *)objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = v11;

    v13 = objc_opt_class(NSString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version")));
    v15 = TUIDynamicCast(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    version = v8->_version;
    v8->_version = (NSString *)v16;

    v18 = objc_opt_new(NSMutableSet);
    registeredFonts = v8->_registeredFonts;
    v8->_registeredFonts = v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    factories = v8->_factories;
    v8->_factories = (NSHashTable *)v20;

  }
  return v8;
}

- (void)registerFonts
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E849C;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)unregisterFonts
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E8798;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)registerPackagesWithFactory:(id)a3
{
  id v4;
  NSHashTable *packages;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NSHashTable *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  id *location;
  TUITemplateBundle *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB6E0);
    packages = self->_packages;
    if (!packages)
    {
      location = (id *)&self->_packages;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB6E0);
      obj = (id)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v23 = self;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_url, 0, 0, 0));

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathExtension"));
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("tpkg"));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByStandardizingPath"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBinaryPackage packageWithURL:](TUIBinaryPackage, "packageWithURL:", v15));

              if (v16)
                objc_msgSend(obj, "addObject:", v16);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB6E0);
      if (!*location)
        objc_storeStrong(location, obj);

      packages = (NSHashTable *)*location;
      self = v23;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = packages;
    v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v4, "registerPackage:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j));
        }
        v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    -[NSHashTable addObject:](self->_factories, "addObject:", v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB6E0);
  }

}

- (void)unregisterPackages
{
  NSHashTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSHashTable *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSHashTable *packages;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB6E0);
  if (-[NSHashTable count](self->_packages, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = self->_factories;
    v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v7);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v9 = self->_packages;
          v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v16;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(v8, "unregisterPackage:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13));
                v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v11);
          }

          v7 = (char *)v7 + 1;
        }
        while (v7 != v5);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }

  }
  -[NSHashTable removeAllObjects](self->_factories, "removeAllObjects");
  packages = self->_packages;
  self->_packages = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB6E0);
}

- (NSString)version
{
  return self->_version;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_registeredFonts, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
